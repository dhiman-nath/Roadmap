import React, { useEffect, useState } from 'react';
import axios from 'axios';
import Swal from 'sweetalert2';

const Comment = ({ itemId, onCommentAction }) => {
  const [comments, setComments] = useState([]);
  const [newComment, setNewComment] = useState('');
  const [currentUserId, setCurrentUserId] = useState(null);
  const token = localStorage.getItem('token');


  useEffect(() => {
    const fetchUserId = async () => {
      try {
        const res = await axios.post('http://127.0.0.1:8000/api/user',
            {},
            { headers: { Authorization: `Bearer ${token}`, }, }
        );
       
        setCurrentUserId(res.data.data.id);
      } catch (error) {
        console.error('Failed to fetch user', error);
      }
    };

    if (token) fetchUserId();
  }, [token]);


  const fetchComments = async () => {
    try {
      const res = await axios.get(`http://localhost:8000/api/items/${itemId}/comments`, {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      });
      setComments(res.data);
    } catch (err) {
      console.error('Error fetching comments', err);
    }
  };

  useEffect(() => {
    fetchComments();
  }, [itemId]);


  const postComment = async (parentId = null, commentText) => {
    if (!commentText.trim()) return;
    try {
      await axios.post(
        `http://localhost:8000/api/items/${itemId}/comments`,
        {
          comment_text: commentText,
          parent_id: parentId,
        },
        {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        }
      );
      onCommentAction();
      fetchComments();
    } catch (err) {
      Swal.fire('Error', 'Failed to post comment', 'error');
    }
  };




  const deleteComment = async (id) => {
   
    try {
        
      await axios.delete(`http://localhost:8000/api/comments/${id}`, {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      });
      onCommentAction();
      fetchComments();
    } catch (err) {
      Swal.fire('Error', 'Failed to delete comment', 'error');
    }
  };

  
  const CommentBox = ({ comment, isReply = false, showReplyBox }) => {
  const [replyText, setReplyText] = useState('');
  const [showReply, setShowReply] = useState(false);

  return (
    <div className={`${isReply ? 'ml-6' : 'ml-0'} mb-4`}>
      <div className="text-sm font-semibold">{comment.user.name}</div>
      <div className="text-gray-800">{comment.comment_text}</div>

      

      {/* Replies */}
      {comment.replies?.length > 0 && (
        <div className="mt-2">
          {comment.replies.map((reply) => (
            <CommentBox key={reply.id} comment={reply} isReply={true} showReplyBox = {false} />
          ))}
        </div>
      )}

      {/* Reply input shown at the bottom */}
      {showReply && (
        <div className="mt-2">
          <textarea
            rows={2}
            className="w-full border rounded p-2 text-sm"
            placeholder="Write a reply..."
            value={replyText}
            onChange={(e) => setReplyText(e.target.value)}
          />
          <p
            className="text-blue-600 mt-1 cursor-pointer flex justify-end items-end"
            onClick={() => {
              postComment(comment.id, replyText);
              setReplyText('');
              setShowReply(false);
            }}
          >
            Send
          </p>
        </div>
      )}
        
      <div className="flex gap-4 text-sm text-blue-600 mt-1">
        {showReplyBox && (

            <p className="cursor-pointer" onClick={() => setShowReply(!showReply)}>Reply</p>
        )
        }
        {comment.user_id === currentUserId && (
        <a
  href="#"
  className="!text-red-600 underline hover:opacity-80"
  onClick={(e) => {
    e.preventDefault();
    Swal.fire({
      title: 'Are you sure?',
      text: 'You won’t be able to recover this comment!',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#d33',
      cancelButtonColor: '#3085d6',
      confirmButtonText: 'Yes, delete it!',
    }).then((result) => {
      if (result.isConfirmed) {
        deleteComment(comment.id);
        Swal.fire('Deleted!', 'Your comment has been deleted.', 'success');
      }
    });
  }}
>
  Delete
</a>

        )}
      </div>
    </div>
  );
};


  return (
    <div className="mt-8">
      <h3 className="text-lg font-semibold mb-3">Comments</h3>

      <textarea
        rows={3}
        className="w-full border rounded p-2 text-sm"
        placeholder="Write a comment..."
        value={newComment}
        onChange={(e) => setNewComment(e.target.value)}
      />
      <button
        className="bg-blue-600 text-white px-4 py-2 rounded mt-2"
        onClick={() => {
          postComment(null, newComment);
          setNewComment('');
        }}
      >
        Post Comment
      </button>

      
      <div className="mt-6">
        {comments.length > 0 ? (
          comments.map((comment) => (
            <>
            <CommentBox key={comment.id} comment={comment} showReplyBox = {true}/>
            
            </>

          ))
        ) : (
          <p className="text-gray-500 text-sm">No comments yet.</p>
        )}
      </div>
    </div>
  );
};

export default Comment;

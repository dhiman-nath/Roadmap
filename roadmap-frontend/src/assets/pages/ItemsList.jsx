import React, { useState, useEffect } from 'react';
import axios from 'axios';
import './itemsList.css';
import UpperArrow from "../icons/Arrow-up.png";
import CommentIcon from "../icons/Comments.png";
import Swal from 'sweetalert2';
import Comment from './Comment';

const ItemsList = () => {
  const [items, setItems] = useState([]);
  const [sortedItems, setSortedItems] = useState([]);
  const [categories, setCategories] = useState([]);
  const [activeTab, setActiveTab] = useState("All");
  const [sortByUpvotes, setSortByUpvotes] = useState(false);
  const [loading, setLoading] = useState(true);
  const [openCommentItemId, setOpenCommentItemId] = useState(null);
  const [currentPage, setCurrentPage] = useState(1);
  const [lastPage, setLastPage] = useState(1);

  const fetchData = async (page = 1) => {
    setLoading(true);
    try {
      const token = localStorage.getItem('token');
      const res = await axios.get(`http://127.0.0.1:8000/api/itemsList?page=${page}`, {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      });

      const responseData = res.data.data;
      setItems(responseData.data);
      setCurrentPage(responseData.current_page);
      setLastPage(responseData.last_page);

      // For sort option
      const sorted = [...responseData.data].sort((a, b) => (b.votes_count ?? 0) - (a.votes_count ?? 0));
      setSortedItems(sorted);

      const uniqueCategories = Array.from(
        new Map(
          responseData.data
            .filter(item => item.category)
            .map(item => [item.category.id, item.category])
        ).values()
      );
      setCategories(uniqueCategories);
    } catch (error) {
      console.error("Error fetching data:", error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchData(currentPage);
  }, [currentPage]);

  const handleUpvote = async (itemId) => {
    try {
      const token = localStorage.getItem('token');
      await axios.post(
        `http://127.0.0.1:8000/api/roadmap-items/${itemId}/upvote`,
        {},
        { headers: { Authorization: `Bearer ${token}` } }
      );

      // Update votes in both arrays
      const updateVotes = (list) =>
        list.map(item =>
          item.id === itemId
            ? { ...item, votes_count: (item.votes_count || 0) + 1 }
            : item
        );

      const updatedItems = updateVotes(items);
      const updatedSortedItems = [...updateVotes(items)].sort((a, b) => (b.votes_count ?? 0) - (a.votes_count ?? 0));

      setItems(updatedItems);
      setSortedItems(updatedSortedItems);

    } catch (error) {
      if (error.response?.status === 409) {
        Swal.fire({
          icon: 'info',
          title: 'Already Upvoted',
          text: 'You have already upvoted this item.',
          confirmButtonColor: '#3085d6'
        });
      } else {
        Swal.fire({
          icon: 'error',
          title: 'Upvote Failed',
          text: 'Something went wrong. Please try again.',
          confirmButtonColor: '#d33'
        });
      }
    }
  };

  const dataToUse = sortByUpvotes ? sortedItems : items;

  const filteredItems = dataToUse.filter(item =>
    activeTab === "All" || item?.category?.name === activeTab
  );

  return (
    <div className="p-4 md:p-6 container mx-auto">

      {/* Category + Sort Tabs */}
      <div className="flex flex-wrap gap-2 mb-6 overflow-x-auto">
        <button
          className={`px-4 py-2 rounded-lg border whitespace-nowrap ${
            !sortByUpvotes && activeTab === "All"
              ? "bg-blue-600 text-white"
              : "text-gray-700 border-gray-300"
          }`}
          onClick={() => {
            setSortByUpvotes(false);
            setActiveTab("All");
          }}
        >
          All
        </button>

        <button
          className={`px-4 py-2 rounded-lg border whitespace-nowrap ${
            sortByUpvotes
              ? "bg-blue-600 text-white"
              : "text-gray-700 border-gray-300"
          }`}
          onClick={() => {
            setSortByUpvotes(true);
            setActiveTab("All");
          }}
        >
          Sort By Most Upvotes
        </button>

        {categories.map((category) => (
          <button
            key={category.id}
            className={`px-4 py-2 rounded-lg border whitespace-nowrap ${
              activeTab === category.name
                ? "bg-blue-600 text-white"
                : "text-gray-700 border-gray-300"
            }`}
            onClick={() => setActiveTab(category.name)}
          >
            {category.name}
          </button>
        ))}
      </div>

      {/* Items List */}
      {loading ? (
        <div>Loading...</div>
      ) : (
        <div className="space-y-4">
          {filteredItems.map((item) => (
            <div key={item.id} className="border rounded-xl p-4">
              <div className="flex justify-between items-start">
                <div className="upvote-box text-center" onClick={() => handleUpvote(item.id)}>
                  <div className="cursor-pointer"><img src={UpperArrow} alt="up" /></div>
                  <div>{item.votes_count ?? 0}</div>
                </div>
                <div className="flex-1 ml-4">
                  <div className="text-lg font-semibold">{item.item_name}</div>
                  <div className="text-gray-600">{item.description}</div>
                  <div className="mt-2 inline-block bg-gray-100 text-gray-700 text-sm px-2 py-1 rounded">
                    {item?.category?.name}
                  </div>
                </div>
                <div
                  className="flex items-center text-gray-500 ml-4 cursor-pointer"
                  onClick={() => setOpenCommentItemId(openCommentItemId === item.id ? null : item.id)}
                >
                  <img src={CommentIcon} alt="comments" />
                  <span className="ml-1">{item.comments.length ?? 0}</span>
                </div>
              </div>

              {openCommentItemId === item.id && (
                <div className="mt-4 ml-4">
                  <Comment itemId={item.id} onCommentAction={() => fetchData(currentPage)} />
                </div>
              )}
            </div>
          ))}
        </div>
      )}

      {/* Pagination */}
      {!loading && lastPage > 1 && (
        <div className="flex justify-center mt-6 gap-2 flex-wrap">
          <button
            onClick={() => currentPage > 1 && setCurrentPage(currentPage - 1)}
            disabled={currentPage === 1}
            className="px-4 py-2 border rounded disabled:opacity-50"
          >
            Prev
          </button>

          {[...Array(lastPage)].map((_, index) => {
            const page = index + 1;
            return (
              <button
                key={page}
                onClick={() => setCurrentPage(page)}
                className={`px-3 py-1 rounded border ${
                  page === currentPage ? "bg-blue-600 text-white" : "bg-white text-gray-700"
                }`}
              >
                {page}
              </button>
            );
          })}

          <button
            onClick={() => currentPage < lastPage && setCurrentPage(currentPage + 1)}
            disabled={currentPage === lastPage}
            className="px-4 py-2 border rounded disabled:opacity-50"
          >
            Next
          </button>
        </div>
      )}
    </div>
  );
};

export default ItemsList;

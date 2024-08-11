import type { Post } from "~/types/posts";

export const getPosts = async (channel_slug: string) => {
  return useFetch<Post[]>(`/api/channels/${channel_slug}/posts`);
};

export const getPost = async (channel_slug: string, post_slug: string) => {
  return useFetch<Post>(`/api/channels/${channel_slug}/posts/${post_slug}`);
};
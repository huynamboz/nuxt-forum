import type { Channel } from "~/types/channels";

export const getChannel = async (slug: string) => {
  return useFetch<Channel>(`/api/channels/${slug}`);
};
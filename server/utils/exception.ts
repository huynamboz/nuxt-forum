export const throwError = (
  statusCode: string,
  statusText: string) => {
  return createError({
    statusCode: Number(statusCode) || 500,
    statusMessage: statusText,
  }
  );
};
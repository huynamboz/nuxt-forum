export default eventHandler(async (event) => {

  const slug = event.context.params?.slug

  if (!slug) {
    throw createError({
      statusCode: 400,
      statusMessage: 'Not Found',
    })
  }
})

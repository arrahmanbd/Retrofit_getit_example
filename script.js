const repoLink = "https://github.com/arrahmanbd/flutter_recipe_blog_ui";
const readmeURL = `${repoLink}/raw/main/README.md`;
const outputDiv = document.querySelector("#output-div");

fetch(readmeURL)
  .then((response) => response.text())
  .then((text) => {
    const converter = new showdown.Converter();
    const html = converter.makeHtml(text);
    outputDiv.innerHTML = html;
  })
  .catch((error) => console.error(error));

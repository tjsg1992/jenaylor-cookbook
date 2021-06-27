# Jenaylor Cookbook

## How do I add a new recipe?
1. Navigate to your local repository
	- Jenna: `C:\My Everything\Jenaylor Stuff\jenaylor-cookbook`
2. Run `pull`
3. Open Obsidian
4. Press `Ctrl+N` to make a new note
5. Name the note with the recipe title
6. Press `Ctrl+P` to open actions
7. Select 'Insert Template'
8. Edit the recipe
9. Run `push` when you are done

## How do I add a link?
Press `Ctrl+K`. This will insert text: `[]()`. Links are formatted as `[Text to Display](Link Address)`

## How do I customize this for my needs?

Things to modify to make it yours:

- Meta content in [\_layouts/post.html](_layouts/post.html):
    ```html
    <meta content="My linked notebook" property="og:site_name"/>
    ```
- The favicon and profile are here: [assets/img/](assets/img/)
- The main stuff is in [\_config.yml](_config.yml):
    ```yaml
    title: notenotelink.netlify.com
    name: notenote.link
    user_description: My linked notebook

    notes_url: "https://notenotelink.netlify.com/"
    profile_pic: /assets/img/profile.png
    favicon: /assets/img/favicon.png
    copyright_name: MIT

    baseurl: "/" # the subpath of your site, e.g. /blog
    url: "https://notenotelink.netlify.com/" # the base hostname & protocol for your site, e.g. http://example.com
    encoding: utf-8
    ```
- You may want to change the copyright in [\_includes/footer.html](_includes/footer.html):
   ```html
   <p id="copyright-notice">Licence MIT</p>
   ```

## How do I remove the "seasons" feature for the notes?

Delete what's inside [\_includes/feed.html](_includes/feed.html) and replace it with:

```liquid
{%- if page.permalink == "/" -%}
    {%- for item in site.notes -%}
        <div class="feed-title-excerpt-block disable-select" data-url="{{site.url}}{{item.url}}">
            <a href="{{ item.url }}" style="text-decoration: none; color: #555555;">
            {%- if item.status == "Ongoing" or item.status == "ongoing" -%}
                <ul style="padding-left: 20px; margin-top: 20px;" class="tags">
                    <li style="padding: 0 5px; border-radius: 10px;" class="tag"><b>Status: </b>{{item.status | capitalize }}</li>
                </ul>
                <p style="margin-top: 0px;" class="feed-title">{{ item.title }}</p>
            {%- else -%}
                <p class="feed-title">{{ item.title }}</p>
            {%- endif -%}
                <p class="feed-excerpt">{{ item.content | strip_html | strip | escape | truncate: 200}}</p>
            </a>
        </div>
    {%- endfor -%}
{%- endif -%}
````

On command-line, you can run `bundle exec jekyll serve` then go to `localhost:4000` to check the result.

## What's coming?

- [Open-transclude](https://subpixel.space/entries/open-transclude/) integration in the template, if possible.
- Different themes! - Please tell me which you'd like to have!

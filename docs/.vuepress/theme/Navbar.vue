<template>
  <div>
    <header class="navbar" id="navbar">
      <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
      <SidebarButton @toggle-sidebar="$emit('toggle-sidebar')"/>
      <a href="/" style="color:#2c3e50">
        <img src="./cloud-black.svg" height="60" />
        <span style="position:relative; bottom: 20px; left: 10px; font-size:30px; font-weight:bold;">
          Vapor Cloud
        </span>
        <!--<span class="logo-text" style="top:25px; left:173px; color:#fff; font-size:18px; position:fixed;"> | Documentation</span>-->
      </a>
      <router-link
        :to="$localePath"
        class="home-link"
      >
        <img
          class="logo"
          v-if="$site.themeConfig.logo"
          :src="$withBase($site.themeConfig.logo)"
          :alt="$siteTitle"
        >
        <span
          class="site-name"
          v-if="$siteTitle"
          :class="{ 'can-hide': $site.themeConfig.logo }"
        >{{ $siteTitle }}</span>
      </router-link>

      <div class="links">
        <AlgoliaSearchBox
          v-if="isAlgoliaSearch"
          :options="algolia"
        />

        <NavLinks class="can-hide"/>
      </div>
    </header>
    <div class="searchBox" id="searchBox" style="display:none;">
      <center>
        <h1>How can we help you?</h1>
        <SearchBox/>
        <!--<br /><br />
        <AlgoliaSearchBox
          v-if="isAlgoliaSearch"
          :options="algolia"
        />-->
      </center>
    </div>
  </div>
</template>

<script>
import SidebarButton from './SidebarButton.vue'
import AlgoliaSearchBox from '@AlgoliaSearchBox'
import SearchBox from './SearchBox.vue'
import NavLinks from './NavLinks.vue'
import jQuery from 'jquery'

let $ = jQuery

export default {
  components: { SidebarButton, NavLinks, SearchBox, AlgoliaSearchBox },

  computed: {
    algolia () {
      return this.$themeLocaleConfig.algolia || this.$site.themeConfig.algolia || {}
    },

    isAlgoliaSearch () {
      return this.algolia && this.algolia.apiKey && this.algolia.indexName
    }
  }
}
</script>

<style lang="stylus">
@import './styles/config.styl'

.navbar
  padding 0.7rem 1.5rem
  line-height $navbarHeight - 1.4rem
  position relative
  a, span, img
    display inline-block
  .logo
    height $navbarHeight - 1.4rem
    min-width $navbarHeight - 1.4rem
    margin-right 0.8rem
    vertical-align top
  .site-name
    font-size 1.3rem
    font-weight 600
    color $textColor
    position relative
  .links
    font-size 0.9rem
    position absolute
    right 1.5rem
    top 0.7rem

@media (max-width: $MQMobile)
  .navbar
    padding-left 4rem
    .can-hide
      display none
</style>

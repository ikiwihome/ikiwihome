<template>
  <div class="github-project">
    <div class="title">
      <github-one theme="two-tone" size="24" :fill="['#efefef', '#00000020']" />
      <span>Github</span>
    </div>
    <Swiper
      :modules="[Pagination, Mousewheel]"
      :slides-per-view="1"
      :space-between="40"
      :pagination="{
        el: '.swiper-pagination',
        clickable: true,
        bulletElement: 'div',
      }"
      :mousewheel="true"
    >
      <SwiperSlide v-for="list in projectList" :key="list">
        <el-row class="all-project" :gutter="20">
          <el-col v-for="(item, index) in list" :span="12" :key="index">
            <div class="project cards" @click="toGithub(item)">
              <div class="name">
                <bookmark theme="outline" size="22" fill="#efefef" />
                <div class="name-text">
                  <span class="author">{{ item.author }}</span>
                  <span>{{ item.name }}</span>
                </div>
              </div>
              <span class="desc">{{ item.desc }}</span>
            </div>
          </el-col>
        </el-row>
      </SwiperSlide>
      <div class="swiper-pagination" />
    </Swiper>
  </div>
</template>

<script setup>
import { GithubOne, Bookmark } from "@icon-park/vue-next";
import { Swiper, SwiperSlide } from "swiper/vue";
import { Pagination, Mousewheel } from "swiper";

// 仓库数据
const projectData = [
  {
    name: "ikiwihome",
    author: "ikiwihome",
    desc: "个人主页 | 我的个人主页 | 个人主页源码 | 主页模板 | homepage",
  },
  {
    name: "memos-CN",
    author: "ikiwihome",
    desc: "隐私至上的轻量级笔记服务 | 轻松捕捉并分享您的精彩想法。",
  },
  {
    name: "chatgpt-webui",
    author: "ikiwihome",
    desc: "可以直接Docker部署的ChatGPT",
  },
  {
    name: "3D-Cute-Girl",
    author: "ikiwihome",
    desc: "使用AI生成的3D可爱女孩形象 | 可以用作头像",
  },
  {
    name: "ai-code-convert",
    author: "ikiwihome",
    desc: "AI翻译并解释自然语言到一种编程语言",
  },
  {
    name: "sparkshop-docker",
    author: "ikiwihome",
    desc: "Sparkshop在线电商Docker文件",
  },
];

// 计算网站链接
const projectList = computed(() => {
  const result = [];
  for (let i = 0; i < projectData.length; i += 4) {
    const subArr = projectData.slice(i, i + 4);
    result.push(subArr);
  }
  return result;
});

// 跳转至 Github
const toGithub = (data) => {
  window.open(`https://github.com/${data.author}/${data.name}`);
};
</script>

<style lang="scss" scoped>
.github-project {
  width: 100%;
  margin-top: 20px;
  .title {
    display: flex;
    flex-direction: row;
    align-items: center;
    margin: 0.2rem 0 1.5rem;
    font-size: 1.1rem;
    .i-icon {
      display: flex;
      justify-content: center;
      align-items: center;
      margin-right: 6px;
    }
  }
  .swiper {
    left: -10px;
    width: calc(100% + 20px);
    padding: 5px 10px 0;
    z-index: 0;
    .swiper-slide {
      height: 100%;
    }
    .swiper-pagination {
      position: static;
      margin-top: -8px;
      :deep(.swiper-pagination-bullet) {
        background-color: #fff;
        width: 18px;
        height: 4px;
        border-radius: 4px;
        transition: opacity 0.3s;
        &:hover {
          opacity: 1;
        }
      }
    }
  }
  .all-project {
    width: calc(100% + 20px);
    .project {
      display: flex;
      flex-direction: column;
      justify-content: center;
      margin-bottom: 20px;
      padding: 12px;
      height: 100px;
      background-color: transparent;
      .name {
        display: flex;
        flex-direction: row;
        align-items: center;
        margin-bottom: 8px;
        .i-icon {
          display: flex;
          margin-right: 6px;
        }
        .author {
          opacity: 0.8;
          &::after {
            content: "/";
            margin: 0 4px;
          }
        }
      }
      .desc {
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 2;
        overflow: hidden;
        word-break: break-all;
        font-size: 13px;
        opacity: 0.8;
        line-height: 20px;
      }
    }
  }
}
</style>

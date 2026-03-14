---
title: 碎碎念
layout: page
---

<link rel="stylesheet" href="https://fastly.jsdelivr.net/npm/aplayer@1.10.1/dist/APlayer.min.css" media="all" onload="this.media=&quot;all&quot;">
<script src="https://fastly.jsdelivr.net/npm/aplayer@1.10.1/dist/APlayer.min.js"></script>
<script src="https://fastly.jsdelivr.net/npm/meting@2.0.1/dist/Meting.min.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fancyapps/ui@5.0/dist/fancybox/fancybox.css" />
<script src="https://cdn.jsdelivr.net/npm/@fancyapps/ui@5.0/dist/fancybox/fancybox.umd.js"></script>

<div id="talk">🌌 宇宙信号同步中🌀...</div>

<style>
/* --- 瀑布流容器适配 --- */
#talk {
    margin: 20px auto;
    width: 100%;
}

.talk_item {
    width: calc(57% - 120px); /* 瀑布-稳定的两列布局 */
    margin-left: 10px;  
    margin-right: 10px;
    background: var(--block);
    border: 1px solid var(--block-border);
    border-radius: 12px;
    padding: 16px;
    margin-bottom: 20px;
    box-sizing: border-box;
    transition: 0.3s;
    min-width: 300px; /* 添加最小宽度确保移动端体验 */
}

@media screen and (max-width: 1024px) {
    .talk_item {
        width: calc(50% - 120px); /* 在较小屏幕上仍保持两列 */
    }
}

@media screen and (max-width: 768px) {
    .talk_item { 
        width: calc(100% - 40px); /* 移动端单列，留出边距 */
        margin-left: 10px;
        margin-right: 10px;
    }
}

/* --- 用户信息区 --- */
.talk_meta {
    display: flex;
    align-items: center;
    margin-bottom: 12px;
}
.talk_meta .avatar {
    width: 40px !important;
    height: 40px !important;
    border-radius: 50% !important;
    margin-right: 12px !important;
}
.talk_meta .info { display: flex; flex-direction: column; }
.talk_nick { font-weight: bold; font-size: 14px; display: flex; align-items: center; }
.talk_date { font-size: 11px; color: var(--text-p3); margin-top: 2px; }

/* --- 内容解析区 --- */
.talk_content_text { 
    line-height: 1.6; 
    color: var(--text-p1); 
    font-size: 14px; 
    word-wrap: break-word; /* 确保长内容正确换行 */
}
.talk_content_text a { color: var(--theme-link); font-weight: 500; }

.zone_imgbox { 
    display: grid; 
    grid-template-columns: repeat(auto-fit, minmax(100px, 1fr)); /* 更灵活的网格 */
    gap: 4px; 
    margin-top: 10px; 
}
.zone_imgbox img { 
    width: 100%; 
    aspect-ratio: 1; 
    object-fit: cover; 
    border-radius: 6px; 
    cursor: pointer; /* 添加光标提示可点击 */
}

/* --- LiuShen 特色：外链卡片 --- */
.shuoshuo-external-link { 
    margin-top: 10px; 
    border-radius: 10px; 
    overflow: hidden; 
    background: var(--block-hover); 
    border: 1px solid var(--block-border); 
}
.external-link { 
    display: flex; 
    text-decoration: none !important; 
}
.external-link-left { 
    width: 60px; 
    height: 60px; 
    background-size: cover; 
    background-position: center; 
    flex-shrink: 0; 
}
.external-link-right { 
    padding: 8px 12px; 
    flex-grow: 1; 
    display: flex; 
    flex-direction: column; 
    justify-content: center; 
    overflow: hidden; 
}
.external-link-title { 
    font-size: 13px; 
    font-weight: bold; 
    color: var(--text-p1); 
    white-space: nowrap; 
    overflow: hidden; 
    text-overflow: ellipsis; 
}
.external-link-right div:last-child { 
    font-size: 11px; 
    color: var(--text-p3); 
    margin-top: 4px; 
}

/* --- 底部状态栏 --- */
.talk_bottom {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: 15px;
    padding-top: 10px;
    border-top: 1px dashed var(--block-border);
}
.talk_tag { 
    font-size: 11px; 
    color: var(--text-p3); 
    background: var(--block-hover); 
    padding: 2px 8px; 
    border-radius: 4px; 
}

.comment_btn { 
    color: var(--text-p3) !important; 
    padding: 4px 8px; 
    border-radius: 6px; 
    transition: 0.2s; 
    display: flex; 
    align-items: center; 
    font-size: 16px; 
}

.comment_btn:hover { 
    background: var(--block-hover); 
    color: var(--theme-link) !important; 
    transform: scale(1.1); 
}

/* 视频容器样式优化 */
.video-wrapper {
    position: relative;
    width: 100%;
    padding-bottom: 56.25%; /* 16:9 比例 */
    height: 0;
    margin: 15px 0;
    overflow: hidden;
    border-radius: 12px;
    background: #000;
}

.video-wrapper iframe {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    border: none;
}

/* 针对视频元素的特殊处理 - 防止破坏瀑布流 */
.talk_content iframe {
    max-width: 100% !important;
    height: auto !important;
}


</style>

<script src="https://api.xscnet.cn/shuoshuo.js"></script>
<footer class="talk-footer" style="text-align: center; margin: 30px auto; padding: 20px 0; color: var(--text-p3);">
    <p style="margin: 0 0 8px 0;">🌌 宇宙信号持续同步中🌀...</p>
    <p style="font-size: 12px; margin: 0;">-- 仅显示最近30条说说 --</p>
    <p style="font-size: 12px; margin: 0;"><a href="https://talk.xscnet.cn/" target="_blank">点我进入说说系统！</a></p>
</footer>

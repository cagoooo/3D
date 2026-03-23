# 🖼️ 專屬創意 3D 畫廊

> 一個純靜態、零依賴的互動式 **3D 旋轉木馬照片畫廊**，支援本機圖片上傳與完整觸控操作。

![效果預覽](https://images.unsplash.com/photo-1506744626753-edaeb5d4c829?auto=format&fit=crop&w=600&q=80)

---

## ✨ 核心功能

| 功能 | 說明 |
|---|---|
| 🎠 **3D 旋轉木馬** | 使用純 CSS `transform-style: preserve-3d` 實現真正的 3D 空間感 |
| 🖱️ **滑鼠拖曳旋轉** | 以左右拖曳手勢動態旋轉畫廊 |
| 📱 **觸控手勢支援** | 完整支援手機與平板的滑動操作 |
| ⚡ **慣性滑動效果** | 放開後畫廊持續以衰減速度旋轉，仿物理摩擦感 |
| 📁 **本機圖片上傳** | 直接從裝置選取任意數量圖片，即時更新畫廊 |
| 🌙 **倒影效果** | 使用 `-webkit-box-reflect` 生成美麗的地板倒影 |
| 📐 **RWD 響應式** | 自動適應手機、平板、桌機等不同螢幕尺寸 |

---

## 📁 專案結構

```
3D/
├── index.html      # 主程式（唯一檔案，純靜態，零依賴）
└── README.md       # 本說明文件
```

---

## 🚀 快速開始

### 方法一：直接開啟（最簡單）

1. **雙擊** `index.html` 用瀏覽器開啟。
2. 書面預設會顯示來自 Unsplash 的 8 張範例風景照。
3. 以滑鼠左鍵按住並左右拖曳，即可旋轉畫廊。

### 方法二：替換成自己的圖片（線上圖片）

開啟 `index.html`，找到第 **135～144 行**的圖片陣列，直接替換圖片網址：

```js
let imageSources = [
    'https://你的圖片網址1.jpg',
    'https://你的圖片網址2.jpg',
    // ... 可無限擴增
];
```

### 方法三：使用本地圖片

1. 開啟 `index.html` 後，點擊畫面下方的 **「選擇我的圖片」** 按鈕。
2. 於檔案選擇視窗中，選取一張或多張圖片（支援 JPG、PNG、WebP 等格式）。
3. 畫廊會**自動清空預設圖片**，並即時顯示你選取的照片。

> ⚠️ **注意**：本機上傳的圖片使用瀏覽器的 `FileReader API` 讀取，**不會上傳到任何伺服器**，資料完全在本機瀏覽器內。

---

## 🕹️ 操作說明

### 桌機版（滑鼠）

| 操作 | 動作 |
|---|---|
| **左鍵按住 + 向右拖曳** | 畫廊順時針旋轉 |
| **左鍵按住 + 向左拖曳** | 畫廊逆時針旋轉 |
| **放開滑鼠** | 啟動慣性，畫廊繼續緩緩旋轉後停止 |

### 手機版（觸控）

| 操作 | 動作 |
|---|---|
| **單指左右滑動** | 旋轉畫廊 |
| **放開手指** | 啟動慣性旋轉效果 |

---

## 🔧 客製化設定

### 調整旋轉靈敏度

在 `handleDragMove` 函式中，修改**乘數**（預設 `0.4`）：

```js
// 數字越大→旋轉越快；越小→越遲緩
currentRotation += diffX * 0.4;  // ← 修改這裡
velocity = diffX * 0.4;           // ← 這裡也要同步修改
```

### 調整開場自動旋轉速度

在腳本最末段，修改 `velocity` 初始值（預設 `0.5`）：

```js
velocity = 0.5;  // ← 設為 0 可關閉開場自動旋轉；數字越大越快
```

### 調整慣性摩擦力

在 `applyInertia` 函式中，修改**衰減係數**（預設 `0.95`）：

```js
velocity *= 0.95;  // ← 接近 1.0 = 幾乎不停；接近 0 = 立刻停止
```

### 調整卡片尺寸

修改 CSS 中 `.carousel` 的寬高，以及 `@media` 響應式斷點中的設定：

```css
.carousel {
    width: 260px;   /* 桌機卡寬 */
    height: 380px;  /* 桌機卡高 */
}

@media (max-width: 768px) {
    .carousel {
        width: 200px;   /* 手機卡寬 */
        height: 300px;  /* 手機卡高 */
    }
}
```

### 調整 3D 視角深度

修改 CSS `.scene` 中的 `perspective` 值，越小越有衝擊感：

```css
.scene {
    perspective: 1200px;  /* 值越小→透視感越強烈 */
}
```

---

## 🌐 技術架構

```
技術棧 (Tech Stack)
├── HTML5
│   └── 語意化標籤結構
├── CSS3
│   ├── transform-style: preserve-3d  (3D 空間)
│   ├── perspective                    (視角深度)
│   ├── rotateY() + translateZ()       (卡片定位)
│   ├── backdrop-filter: blur()        (毛玻璃效果)
│   └── -webkit-box-reflect            (倒影效果)
├── JavaScript (Vanilla ES6+)
│   ├── FileReader API                 (本地圖片讀取)
│   ├── MouseEvent / TouchEvent        (互動偵測)
│   └── requestAnimationFrame          (慣性動畫)
└── Tailwind CSS (CDN)
    └── 用於控制面板的通用樣式
```

---

## ☁️ GitHub Pages 部署指南

此專案為**純靜態網頁**，非常適合部署到 GitHub Pages，完全**免費**且**不需後端**。

### 部署步驟

#### 步驟 1：初始化本地 Git 儲存庫

```powershell
# 先確保在專案目錄內
cd H:\3D

# 建立 .gitignore（雖然本專案無機密資訊，仍是好習慣）
# 接著初始化
git init
git add .
git commit -m "✅ 初始上傳 3D 互動畫廊"
```

#### 步驟 2：於 GitHub 建立新 Repository

1. 前往 [github.com](https://github.com) → 右上角 `+` → **New repository**
2. Repository 名稱建議：`3d-gallery`（或你喜歡的名稱）
3. 選擇 **Public**（必須為 Public 才能使用免費 GitHub Pages）
4. **不要**勾選「Add a README file」（避免衝突）
5. 點擊 **Create repository**

#### 步驟 3：推送到 GitHub

```powershell
git remote add origin https://github.com/你的帳號/3d-gallery.git
git branch -M main
git push -u origin main
```

#### 步驟 4：啟用 GitHub Pages

1. 進入你的 Repository → **Settings**
2. 左側選單點擊 **Pages**
3. **Source** 選擇 `Deploy from a branch`
4. **Branch** 選擇 `main`，資料夾選 `/ (root)`
5. 點擊 **Save**

🎉 **約 1-2 分鐘後**，你的畫廊將上線於：
```
https://你的帳號.github.io/3d-gallery/
```

---

## ⚠️ 注意事項

### 本機圖片上傳限制

- 透過「選擇我的圖片」上傳的本地圖片，**只存在於當前瀏覽器分頁的記憶體中**，**重新整理後即消失**。
- 若要讓畫廊顯示**固定的自訂圖片**，建議：
  1. 將圖片放到 GitHub 的 `images/` 資料夾內
  2. 在 `imageSources` 陣列中改為填寫相對路徑，如 `'./images/photo1.jpg'`

### 倒影效果瀏覽器相容性

`-webkit-box-reflect` 目前僅 **Chromium 核心瀏覽器**（Chrome、Edge、Opera）完整支援，Firefox 不支援倒影效果，但不影響其他功能正常運作。

---

## 📝 授權

本專案為個人創意作品，歡迎自由修改與使用。

---


## ✅ 已完成進度總表（v9.6 截止）

> 最後更新：2026-03-23（v9.6 手機旋轉速度與可控性優化）

---

### 🟢 v1.0：核心基礎
- [x] 純 CSS3 3D 旋轉木馬（`preserve-3d` + `perspective`）
- [x] JavaScript 動態計算圓形半徑，自動均勻分配卡片角度
- [x] 滑鼠拖曳旋轉 / 觸控手勢 / 慣性衰減（`velocity × 0.95`）
- [x] `-webkit-box-reflect` 地板倒影、Firefox `::after` 降級方案
- [x] `FileReader API` 本機多圖上傳（不上傳伺服器）
- [x] RWD 響應式設計（桌機 260px / 手機 200px 卡寬）
- [x] `touch-action: none` 防手機捲動 / `pointer-events: none` 防圖片拖曳

### 🟡 v2.0：進階互動
- [x] 垂直雙軸旋轉（Y 水平 + X 傾斜）
- [x] 滾輪縮放（perspective 動態 400～3000px）
- [x] 鍵盤方向鍵控制（← → 切換 / ↑ ↓ 傾斜）
- [x] 圖片說明文字浮層（hover 顯示標題 + 日期）
- [x] 自動旋轉開關按鈕（⏸ / ▶ 切換 + 速度調整）
- [x] 上傳自動帶入檔名為標題、檔案日期為日期

### 🟠 v3.0：持久化與燈箱
- [x] localStorage 圖片持久化（重整後自動還原相簿）
- [x] QuotaExceededError 頂部橫幕警示與處理
- [x] 清除儲存按鈕（一鍵清除並恢復預設圖片）
- [x] 全螢幕 Lightbox 燈箱（點擊放大、鍵盤導覽、Esc 關閉、背景點擊關閉）
- [x] 圖片淡入切換動畫 / 展示計數器（`1 / 8`）

### 🔵 v4.0：雲端整合
- [x] 多主題背景切換（5 套 CSS 變數主題，平滑過渡動畫）
- [x] 圖片分類標籤篩選（上傳時 Modal 選標籤，頂部篩選橫幅）
- [x] Firebase 雲端相簿（Google 登入 / Storage 圖片上傳 / Firestore metadata 儲存）
- [x] Firestore 安全規則（僅限本人讀寫 `users/{uid}/images`）
- [x] Firebase Storage 安全規則（僅限本人讀寫 `users/{uid}/images/**`）
- [x] Lightbox 內顯示圖片標籤

### 🟣 v4.1：自動化部署
- [x] GitHub Actions CI/CD（Push → 自動部署 GitHub Pages）
- [x] Python 環境變數注入腳本（跨平台替換 Firebase 佔位符）
- [x] GitHub Repository Secrets（6 個 Firebase 環境變數安全注入）
- [x] `.gitignore` / `.env` 機密防護

### 🌈 v5.0：視覺體驗升級
- [x] **功能 A** 滑鼠跟隨視差（±6° 傾斜，mouseleave 平滑歸零）
- [x] **功能 B** Canvas 粒子背景特效（桌機 80 顆 / 手機 30 顆，依主題色切換，含閃爍呼吸）
- [x] **功能 C** 底部縮圖帶（開關 / 點擊旋轉 / active 高亮 / 編號）
- [x] **功能 D** 卡片翻轉雙面（`rotateY(180deg)`，背面顯示標籤 Emoji / 標題 / 日期）

### ⚡ v6.0：互動精修
- [x] **功能 E** 編輯模式 + HTML5 `draggable` 拖曳排序 / 紅色 × 刪除
- [x] **功能 F** Lightbox 標題雙擊行內編輯（`contenteditable`，失焦自動存）
- [x] **功能 G** 上傳 WebP 壓縮（最大 1200px，平均節省 80% 儲存空間）
- [x] **功能 H** 批次選取 / 刪除（長按 500ms 進入多選，頂部操作列）
- [x] **功能 I** 自訂標籤 CRUD（Modal 管理，新增/刪除，localStorage 持久化）

### 🎯 v7.0：體驗精修
- [x] **功能 W** 波浪入場動畫（`cardEnterW` + `animation-delay: i×0.05s`）
- [x] **功能 U** 版型設定抽屜（3 個 range 滑桿：卡寬 / 卡高 / 視角，localStorage 持久化）
- [x] **功能 Y** 公開分享連結 + 唯讀畫廊模式（`?view=UID` URL 解析，`body.readonly-mode`）
- [x] **功能 AA** Firestore 公開相簿規則 + 🌐 公開 / 非公開切換按鈕

### 🟤 v8.0：雲端管理完整化
- [x] **登入自動還原**：`onAuthStateChanged` 後自動呼叫 `loadFromCloud()`
- [x] **📲 手動從雲端還原按鈕**：右上角藍色按鈕，任意時刻觸
- [x] **🗑️ 一鍵刪除全部照片**：確認 Modal → 批次刪 Firestore + Storage
- [x] **進度 Overlay 整合**：雲端還原 / 同步 / 刪除共用同一套動態進度框
- [x] **同步鎖機制**：`isSyncing` 旗標防止同步中途登出導致 403 錯誤

### ✨ v8.1：3D 視覺全面升級
- [x] **多排圓圈排列**：80 張以上照片自動分成多排垂直排列
- [x] **深度暗化效果**：`applyTransform()` 每幀依各卡片面向角動態更新 `brightness()`，前排全亮（1.0）後排漸暗（0.3）
- [x] **🎥 沉浸模式切換**：紫色發光按鈕一鍵切換（420×600px + 透視 750px）

### 🚀 v9.0：UX 精修全系列
- [x] **手機版折疊面板**：控制面板改為 `position:fixed bottom:0` 可折疊底部抽屜，點擊把手展開/折疊，旋轉畫廊時自動折疊
- [x] **雙指 Pinch 縮放**：`touchstart/touchmove` 偵測兩指距離，映射至 `perspective` 400~3000px，與滾輪縮放同步
- [x] **AS 旋轉靈敏度細調**：版型抽屜新增拖曳靈敏（0.2x~2.5x）、觸控靈敏（獨立設定）、鍵盤步進（1~5排）三個滑桿
- [x] **AT 卡片陰影深度動畫**：`applyTransform()` 同步計算 `box-shadow`，前排深陰影、後排幾乎無陰影，搭配亮度暗化立體感更强
- [x] **AU 五情境預設**：版型抽屜頂部五顆按鈕（🎠標準 / 🎥沉浸 / 🗂精選 / 🖼藝廊 / 📸橫幅），選中金色高亮，同步更新三個滑桿
- [x] **批次上傳進度條**（AE）：頂部 4px 細條進度條，完成後自動消失

### ✨ v9.1：互動精調與穩定升級
- [x] **💡 分享連結自動旋轉修復**：修復 Firebase 分享連結於唯讀模式下載入後未能正確啟動自動旋轉的問題。
- [x] **📱 點擊衝突修復**：修復點擊切換「自動旋轉」按鈕時被底層背景攔截，導致 UI 無反應的問題。
- [x] **🖐️ 支援手勢恢復旋轉**：全螢幕下，手動滑動旋轉畫廊後，無須點擊會自動順著手勢方向繼續自轉。
- [x] **🖱️ 支援點擊暫停**：輕點背景空白處，即可隨時中斷自動旋轉。

### 🚀 v9.2：手機端效能全面優化（最新完成）
- [x] **粒子數量自適應**：手機自動降為 30 顆（桌機維持 80 顆），CPU 運算量降低 62%。
- [x] **粒子動畫限速 30fps**：手機版 RAF 觸發頻率從 60fps 降至 30fps，粒子動畫對 CPU 的占用減半。
- [x] **光照計算跳幀**：手機版 `applyTransform()` 光照/陰影 DOM 操作每 2 幀才執行一次，卡片 style 更新量減半。
- [x] **關閉手機倒影**：`@media (max-width:768px)` 停用 `-webkit-box-reflect`，移除每張卡片額外的 GPU 合成層。
- [x] **移除手機 backdrop-filter**：控制面板、燈箱、分享欄等全面去除 `backdrop-filter: blur()`，消除手機 GPU 最大耗電源。
- [x] **will-change 提示**：`.carousel` 與 `.carousel-item` 加入 `will-change: transform, filter`，瀏覽器提前分配 GPU 層減少重排。
- [x] **主題色快取**：粒子動畫不再每幀查詢 `data-theme` 屬性，改用快取變數，主題切換時才刷新。
- [x] **Page Visibility API**：鎖屏、切換分頁時自動暫停所有 RAF 動畫，頁面恢復後重啟，消除背景空轉耗電。

### 📱 v9.6：手機旋轉速度與可控性優化（最新完成）
- [x] **Readonly 靈敏度安全上限**：手機觀看分享相簿時，觸控靈敏度強制上限 0.8x、自動旋轉速度上限 0.4°/幀，防止分享者高靈敏設定讓觀看者無法控制旋轉。
- [x] **手機慣性衰減加快**：decay 係數 0.93→0.87，停止門檻 0.06→0.15；輕彈後約 0.4 秒停止（原本 ~1 秒），旋轉手感更可控。
- [x] **單幀速度上限**：手機觸控 velocityX 限制 ±5°/幀，防止快速輕彈後轉速失控飛天。

### 🖼️ v9.5：角度優先載入系統，解決旋轉空白黃框
- [x] **根治 IntersectionObserver 失效問題**：3D 旋轉木馬所有卡片 2D 位置重疊，Observer 一次觸發全部 40+ 張同時下載，改為完全移除 Observer。
- [x] **角度優先載入佇列**：`_loadByAngle()` 依各卡片當前面向角度距正面的距離排序，最靠近正面的圖片最先進入下載佇列，確保使用者看到的那張圖最快出現。
- [x] **並發下載上限**：手機 3 / 桌機 5 張同時下載，頻寬集中在可見卡片，不再因 40+ 張同搶頻寬而全部都慢。
- [x] **旋轉停止即重排**：`snapToNearest()` 吸附動畫結束後自動呼叫 `_loadByAngle()`，剛轉到正面的卡片立刻搶佔佇列首位。
- [x] **世代計數器防競態**：`_imgLoadGen` 在每次 `buildGallery()` 遞增，Phase 2 重建畫廊時舊的下載 callback 自動失效，不再污染新批次計數。

### 🚀 v9.4：分享連結載入速度優化
- [x] **並行 Firestore 請求**：`profile` 與「前 12 張圖片」改為 `Promise.all` 並行發出，省去一次循序 Round Trip Time（手機約節省 300–600ms）。
- [x] **漸進式載入**：前 12 張資料回來即立即建畫廊並啟動旋轉，讓使用者馬上看到內容；剩餘照片在背景靜默補入後重建（`startAfter` 分頁查詢）。
- [x] **初始等待縮短**：hardcoded 延遲 600ms → 50ms，Firebase 模組就緒後幾乎立即觸發請求。
- [x] **修復 Phase 2 殭屍 DOM**：`buildGallery` 重建時重置 `_prevFrontCardEl`，防止補圖後 card-focused 操作到已移除的元素。

### ⚡ v9.3：50+ 張卡片光照迴圈效能優化
- [x] **亮度差異閾值跳幀**：`applyTransform()` 光照迴圈新增 delta ≥ 0.025 才寫入 DOM。自動旋轉時每幀亮度變化僅 ~0.002，50 張 × 60fps 的 100 次 style 操作降至 ~5 次/幀（節省 95%）。
- [x] **背向卡片靜態暗色**：`bright ≤ 0.36` 的背面卡片固定 `brightness(0.3)`，以 `_isDark` 旗標防重複寫入，完全跳過動態陰影計算。
- [x] **`_baseAngle` 數字快取**：建卡時同步儲存角度數值到元素屬性，省去光照迴圈每幀 `parseFloat(dataset)` 的轉型開銷。
- [x] **`card-focused` 精準更新**：以 `_prevFrontCardEl` 快取最亮卡片，每幀只操作「換入/換出」2 次 classList，取代全卡 `forEach × 50` 次 toggle。
- [x] **分批建構加速**：`CHUNK_SIZE` 桌機 8→20、手機 8→12，50 張相簿的 idle callback 批次從 6 次縮減至 2~3 次。

---

## 🗺️ 未來開發路線圖

> 以「近期 → 中期 → 長期」分層排列，每項均附**實作難度**、**效益分析**與**程式碼示例**，可直接作為開發規格參考。

---

## 🔥 v9.0 近期優先（高效益 / 難度適中）

### AB. EXIF 自動填入拍攝日期 / 相機型號

> **難度**：⭐⭐⭐｜**效益**：徹底消滅假日期，攝影師質感大幅提升

使用 `exifr` 輕量庫（ESM CDN，壓縮後約 8KB），在 `processUpload` 的 `canvas.toBlob` 之後解析：

```js
import exifr from 'https://esm.sh/exifr';

const { DateTimeOriginal, Make, Model, GPSLatitude, GPSLongitude } = await exifr.parse(file);
// DateTimeOriginal → 自動填入日期欄位（可手動覆蓋）
// Make + Model     → 卡片背面 "📷 Canon EOS R5"
// GPS              → 為地圖模式（功能 AN）預做橋接
const autoDate = DateTimeOriginal
    ? DateTimeOriginal.toISOString().split('T')[0]
    : new Date().toISOString().split('T')[0];
```

**UI 改動：**
- 上傳 Modal 日期欄位自動帶入 EXIF 日期，仍可手動修改
- 卡片背面新增小型相機徽章 `📷 Canon EOS R5 · 2024-07-15`
- 若有 GPS → 卡片背面顯示 📍 小圖示

---

### AC. 即時關鍵字搜尋（複合過濾）

> **難度**：⭐⭐｜**效益**：圖片量大時找照片效率提升 10 倍

```js
const searchInput = document.getElementById('gallery-search');

searchInput.addEventListener('input', () => {
    const kw = searchInput.value.toLowerCase().trim();
    if (!kw) {
        filteredData = activeTag === '全部'
            ? [...allImageData]
            : allImageData.filter(d => d.tag === activeTag);
    } else {
        filteredData = allImageData.filter(d =>
            d.title?.toLowerCase().includes(kw) ||
            d.tag?.toLowerCase().includes(kw)   ||
            d.date?.includes(kw)                ||
            d.camera?.toLowerCase().includes(kw)
        );
    }
    buildGallery();
});
```

**UI 設計：**
- 頂部標籤篩選欄右側加入 🔍 放大鏡按鈕，點擊展開搜尋框（滑動動畫）
- 支援標題 / 日期 / 標籤 / 相機型號複合搜尋
- 右側 × 按鈕即時清除搜尋

---

### AD. 幻燈片播放模式（Slideshow）

> **難度**：⭐⭐｜**效益**：無需額外工具，畫廊化身家族相片播放機

```js
let slideshowTimer = null;
let slideshowIdx = 0;

function startSlideshow(intervalMs = 3500) {
    // 進入全螢幕 Lightbox，每隔 N 秒換下一張
    openLightbox(slideshowIdx);
    slideshowTimer = setInterval(() => {
        slideshowIdx = (slideshowIdx + 1) % filteredData.length;
        updateLightbox(slideshowIdx);
    }, intervalMs);
}

function stopSlideshow() {
    clearInterval(slideshowTimer);
    slideshowTimer = null;
}
```

**UI 設計：**
- 控制面板新增 `▶️ 放映` 按鈕，點擊後全螢幕 Lightbox 自動輪播
- 底部進度條顯示當前張數（類似 Instagram Stories）
- 鍵盤 `Space` 暫停 / 繼續，`Esc` 退出放映
- 可選：自動旋轉木馬模式（每 N 秒轉到下一張，不開 Lightbox）

---

### AE. 批次上傳進度條

> **難度**：⭐⭐｜**效益**：上傳大量圖片時消除「卡住感」，信任感倍增

```js
async function processUpload(files) {
    const total = files.length;
    const bar = document.getElementById('upload-progress-bar');
    const barFill = document.getElementById('upload-progress-fill');
    const barLabel = document.getElementById('upload-progress-label');
    bar.style.display = 'block';

    for (let i = 0; i < total; i++) {
        barLabel.textContent = `處理中：${files[i].name}（${i+1}/${total}）`;
        barFill.style.width = `${Math.round((i / total) * 100)}%`;
        const blob = await compressImage(files[i]);
        // ... 其餘上傳邏輯
    }

    barFill.style.width = '100%';
    barLabel.textContent = `✅ ${total} 張處理完成！`;
    setTimeout(() => { bar.style.display = 'none'; }, 1500);
    buildTagBar(); buildGallery(); saveToLocalStorage();
}
```

**UI 設計：**
- 頁面頂部 4px 高細條進度條（純 CSS gradient 流動動畫）
- 完成後 1.5 秒自動消失

---

### AF. 多維度排序選項

> **難度**：⭐⭐｜**效益**：有效整理龐大相簿，使用頻率極高

```js
const SORT_MODES = {
    '自訂順序': null,
    '日期新→舊': (a, b) => new Date(b.date) - new Date(a.date),
    '日期舊→新': (a, b) => new Date(a.date) - new Date(b.date),
    '名稱 A→Z':  (a, b) => (a.title || '').localeCompare(b.title || ''),
    '名稱 Z→A':  (a, b) => (b.title || '').localeCompare(a.title || ''),
    '標籤分類':  (a, b) => (a.tag  || '').localeCompare(b.tag  || ''),
};

function applySort(mode) {
    const fn = SORT_MODES[mode];
    if (fn) filteredData.sort(fn);
    buildGallery();
    localStorage.setItem('gallery_sort_mode', mode);
}
```

**UI 設計：**
- 控制面板加入 `🗂️ 排序` 下拉選單
- 排序後「自訂順序」由拖曳排序（功能 E）覆寫
- 排序偏好記憶至 localStorage

---

### AG. 雲端備份匯出 ZIP

> **難度**：⭐⭐⭐｜**效益**：防止雲端資料遺失、跨裝置整批轉移；使用者安心感極強

```js
// 使用 JSZip（ESM CDN，約 90KB gzip 後約 35KB）
import JSZip from 'https://esm.sh/jszip';

async function exportAllAsZip() {
    const zip = new JSZip();
    const folder = zip.folder('3DGallery_Backup');

    for (const [i, img] of allImageData.entries()) {
        const safeTitle = (img.title || `photo_${i+1}`).replace(/[\/\\:*?"<>|]/g, '_');
        const blob = await (await fetch(img.src)).blob();
        folder.file(`${String(i+1).padStart(3,'0')}_${safeTitle}.webp`, blob);
    }

    // 加入 metadata.json
    folder.file('metadata.json', JSON.stringify(allImageData.map(d => ({
        title: d.title, date: d.date, tag: d.tag, camera: d.camera
    })), null, 2));

    const content = await zip.generateAsync({ type: 'blob', compression: 'STORE' });
    const a = Object.assign(document.createElement('a'), {
        href: URL.createObjectURL(content),
        download: `3DGallery_${new Date().toISOString().split('T')[0]}.zip`
    });
    a.click();
}
```

**附加功能：** 匯出的 `metadata.json` 可作為「匯入還原」的來源，實現完整的備份/恢復工作流程

---

## 📅 v10.0 中期規劃（高品質 / 需 Firestore 整合）

---

### AH. 相簿封面 + 個人資料頁（Gallery Profile）

> **難度**：⭐⭐⭐｜**效益**：讓分享連結從「參數 URL」升級成「個人品牌頁面」

```
Firestore：users/{uid}/profile {
    displayName : '陽光的旅行相簿',
    coverUrl    : 'https://...',
    bio         : '熱愛旅行攝影 📷 | 台灣',
    isPublic    : true,
    totalPhotos : 128,
    updatedAt   : Timestamp
}
```

**頁面結構（唯讀分享頁）：**
- 頂部：全幅封面大圖（點擊可開 Lightbox）
- 中間：頭像 + 相簿名稱 + 個人簡介
- 下方：3D 木馬畫廊（唯讀模式）

---

### AI. 圖片按讚 / 收藏（Reactions System）

> **難度**：⭐⭐⭐｜**效益**：社群互動，使用者黏著度大幅提升

```js
// 使用 Firestore 原子操作防競爭條件
import { updateDoc, increment, arrayUnion, arrayRemove } from 'firebase/firestore';

async function toggleLike(ownerId, imgId) {
    const ref = doc(db, `users/${ownerId}/images/${imgId}`);
    const isLiked = likedSet.has(imgId);
    await updateDoc(ref, {
        likes   : increment(isLiked ? -1 : 1),
        likedBy : isLiked ? arrayRemove(currentUser.uid) : arrayUnion(currentUser.uid)
    });
    isLiked ? likedSet.delete(imgId) : likedSet.add(imgId);
}
```

**UI 設計：**
- 卡片右下角按讚數徽章（`❤️ 12`）
- Lightbox 正中大型愛心按鈕 + 數字動畫
- 未登入訪客點讚 → 彈出「請登入後按讚」提示

---

### AJ. 圖片評分系統（Star Rating）

> **難度**：⭐⭐｜**效益**：讓使用者快速標記精選，並據此篩選「最愛相簿」

```js
// allImageData 增加 rating 欄位（0-5）
function setRating(imgIndex, stars) {
    allImageData[imgIndex].rating = stars;
    saveToLocalStorage();
    // 若已登入，同步至 Firestore
    if (currentUser) {
        const { uid } = currentUser;
        fb.setDoc(fb.doc(fb.db, `users/${uid}/images`, imgIndex.toString()),
            { rating: stars }, { merge: true });
    }
}
```

**UI 設計：**
- 卡片背面底部 5 顆★（點擊即評分，即時更新）
- Lightbox 右上角評分區
- 標籤篩選列新增快速篩選：「⭐ 4 星以上」/ 「⭐⭐⭐⭐⭐ 精選」

---

### AK. 多人協作共享相簿

> **難度**：⭐⭐⭐⭐｜**效益**：家庭 / 旅行夥伴共管，是最強的差異化功能

```
Firestore：sharedAlbums/{albumId} {
    name    : '2025 歐洲旅行',
    ownerId : 'uid_A',
    members : {
        uid_B : 'editor',   // 可上傳 / 刪除自己的圖
        uid_C : 'viewer'    // 只能瀏覽
    },
    createdAt : Timestamp
}

Storage 路徑：sharedAlbums/{albumId}/images/{imgId}
```

**功能規格：**
| 角色 | 上傳 | 刪除自己 | 刪除他人 | 邀請成員 | 解散相簿 |
|---|---|---|---|---|---|
| owner | ✅ | ✅ | ✅ | ✅ | ✅ |
| editor | ✅ | ✅ | ❌ | ❌ | ❌ |
| viewer | ❌ | ❌ | ❌ | ❌ | ❌ |

---

### AL. 圖片基本濾鏡 / 色調調整（Canvas 即時預覽）

> **難度**：⭐⭐⭐｜**效益**：無需 Photoshop，輕鬆出創意效果

```js
const PRESET_FILTERS = {
    '原圖'  : 'none',
    '復古'  : 'sepia(60%) contrast(110%) brightness(95%)',
    '日系'  : 'brightness(115%) saturate(80%) contrast(95%)',
    '黑白'  : 'grayscale(100%) contrast(110%)',
    '電影感': 'contrast(120%) saturate(85%) brightness(90%) hue-rotate(5deg)',
    '夢幻'  : 'brightness(110%) saturate(130%) blur(0.3px)',
};

function applyFilterToCanvas(canvas, filterCSS) {
    const ctx = canvas.getContext('2d');
    ctx.filter = filterCSS;
    ctx.drawImage(sourceImg, 0, 0, canvas.width, canvas.height);
}
```

**UI 設計：**
- Lightbox 底部一排濾鏡縮圖（預覽圖 + 名稱）
- 手動調整模式：亮度 / 對比 / 飽和度 三個滑桿
- 「套用」後重壓 WebP 覆蓋原圖

---

### AM. 地圖模式（Photo Map with Leaflet.js）

> **難度**：⭐⭐⭐⭐｜**效益**：EXIF GPS 整合後，直覺展示旅行足跡，是最強差異化功能

```js
// 需先完成功能 AB（EXIF 解析）才有 GPS 資料
import L from 'https://esm.sh/leaflet';

const map = L.map('photo-map').setView([25.04, 121.51], 6);
L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '© OpenStreetMap'
}).addTo(map);

allImageData.filter(d => d.lat && d.lng).forEach((img, i) => {
    const icon = L.divIcon({
        className: 'photo-pin',
        html: `<img src="${img.src}" style="width:44px;height:44px;
               object-fit:cover;border-radius:50%;border:2px solid #fff;
               box-shadow:0 2px 8px rgba(0,0,0,.5)">`,
        iconSize: [44, 44]
    });
    L.marker([img.lat, img.lng], { icon })
        .addTo(map)
        .bindPopup(`<strong>${img.title}</strong><br>${img.date}`)
        .on('click', () => openLightbox(i));
});
```

**UI 切換：** 控制面板右側加入 `🗺️ 地圖` 按鈕，點擊後地圖面板從底部滑入（覆蓋木馬場景）

---

### AN. AI 自動命名 + 標籤建議（Gemini Vision API）

> **難度**：⭐⭐⭐⭐｜**效益**：零打字自動化整理相簿，大幅降低整理門檻

```js
// Firebase Functions 後端安全代理（避免前端洩露 API Key）
exports.describeImage = onCall(async ({ imageBase64 }) => {
    const model = genAI.getGenerativeModel({ model: 'gemini-2.5-flash-lite' });
    const result = await model.generateContent([
        `用10字以內的繁體中文描述這張照片，並建議最合適的一個分類標籤（風景/人物/美食/旅行/建築/動物/其他）。
         回傳格式：{"title":"...","tag":"..."}`,
        { inlineData: { data: imageBase64, mimeType: 'image/webp' } }
    ]);
    return JSON.parse(result.response.text());
});
```

**UX 設計：**
- 上傳後彈出 AI 建議確認框：
  `🤖 AI 建議命名：「雪山日出倒影」/ 🌄 風景` → [✏️ 修改] [✅ 確認]
- 批次上傳可選「全部 AI 命名」或「手動輸入」
- 批次 AI 建議：顯示進度框「AI 分析中 3 / 12...」

---

## 🚀 v11.0+ 長期架構升級

---

### AS. 旋轉速度鍵盤細調 + 手勢靈敏度分設（UX 細節優化）

> **難度**：⭐｜**效益**：老人 / 兒童等不同族群都能找到舒適的操作手感

在版型抽屜中新增兩個 range 滑桿：
- 🖱️ **拖曳靈敏度**（0.1 ～ 1.5 倍速，預設 0.4）
- 📱 **觸控靈敏度**（獨立設定，手機端更精準）
- ⌨️ **鍵盤步進角度**（預設跟著每排 theta，可獨立設為 5° / 10° / 15° / 30°）

所有設定存入 `layoutCfg`，隨版型一起雲端儲存。

---

### AT. 卡片陰影深度動畫（Depth Shadow）

> **難度**：⭐⭐｜**效益**：搭配深度暗化，圓圈 3D 感再升一級，視覺極具質感

在 `applyTransform()` 深度暗化迴圈中，同步調整卡片陰影：

```js
// bright 已算好 (0.3～1.0)
const shadowBlur = Math.round(bright * 32); // 前排陰影最強
const shadowAlpha = (bright * 0.6).toFixed(2);
card.style.boxShadow = `0 ${shadowBlur}px ${shadowBlur * 2}px rgba(0,0,0,${shadowAlpha})`;
```

**效果**：前排卡片投下深陰影，後排幾乎無陰影，深度層次感提升

---

### AU. 沉浸模式自訂預設（多組情境一鍵切換）

> **難度**：⭐⭐｜**效益**：一套程式適應展覽、課堂、日常等不同使用情境

```js
const SCENE_PRESETS = {
    '🎠 標準':   { w: 260,  h: 380,  persp: 1200, speed: 0.25 },
    '🎥 沉浸':   { w: 420,  h: 600,  persp: 750,  speed: 0.15 },
    '🗂️ 精選':   { w: 180,  h: 260,  persp: 1600, speed: 0.35 },  // 小卡、多張同時可見
    '🖼️ 藝廊':   { w: 320,  h: 480,  persp: 900,  speed: 0.20 },  // 垂直相片最佳
    '📸 橫幅':   { w: 560,  h: 315,  persp: 1400, speed: 0.12 },  // 寬屏橫幅照片
};
```

**UI 設計**：
- 版型抽屜頂部加入五顆情境按鈕，點擊後動態套用，0.6s 過渡動畫
- 使用者可在情境基礎上再微調三個滑桿
- 選取的情境名稱顯示於按鈕列（`🎥 沉浸模式中`）

---

### AV. 卡片自動對焦高亮（Active Center Card）

> **難度**：⭐⭐｜**效益**：旋轉停止後自動識別正前方的卡片，給予視覺焦點，提升瀏覽體驗

在 `applyInertia()` 停止後 + `applyTransform()` 每幀計算最靠近 0° 的卡片：

```js
// 停止慣性後，自動「對焦到最近卡片」的 snap
function snapToNearest() {
    const nearest = Math.round(currentRotationY / theta) * theta;
    // 加入平滑吸附動畫
    carousel.style.transition = 'transform 0.35s cubic-bezier(.2,.8,.2,1)';
    currentRotationY = nearest;
    applyTransform();
}

// 最前方卡片加入高亮亮邊
galleryCards.forEach(card => {
    const eff = (((+card.dataset.baseAngle + currentRotationY) % 360) + 360) % 360;
    const isFront = eff < theta / 2 || eff > 360 - theta / 2;
    card.classList.toggle('card-focused', isFront);
});
```

**CSS**：
```css
.card-focused {
    outline: 2px solid rgba(255,255,255,.6);
    outline-offset: 4px;
    filter: brightness(1.0) !important; /* 強制最亮 */
}
```

---

### AW. 語音控制（Web Speech API）

> **難度**：⭐⭐⭐｜**效益**：解放雙手，展覽 / 簡報情境下用語音操作畫廊極具創意

```js
const recognition = new (window.SpeechRecognition || window.webkitSpeechRecognition)();
recognition.lang = 'zh-TW';
recognition.continuous = true;

recognition.onresult = ({ results }) => {
    const cmd = results[results.length - 1][0].transcript.trim();
    if (cmd.includes('下一張') || cmd.includes('向右'))  velocityX -= theta;
    if (cmd.includes('上一張') || cmd.includes('向左'))  velocityX += theta;
    if (cmd.includes('放大') || cmd.includes('沉浸'))     enterImmersiveMode();
    if (cmd.includes('退出') || cmd.includes('縮小'))     exitImmersiveMode();
    if (cmd.includes('放映') || cmd.includes('幻燈片'))   startSlideshow();
    if (cmd.includes('停止'))                             stopSlideshow();
};
```

**UI 設計**：
- 新增 🎤 麥克風按鈕，點亮時顯示脈衝動畫表示聆聽中
- 識別到指令後在底部短暫顯示「✅ 已執行：下一張」Banner
- 右下角小型「語音指令說明」浮層（hover 展開）

---

### AX. 相片水印 / 版權標記（Canvas 合成）

> **難度**：⭐⭐⭐｜**效益**：攝影師保護版權，公開分享不怕被盜圖

```js
async function addWatermark(blob, text = '© 我的相簿') {
    const img  = await createImageBitmap(blob);
    const canvas = Object.assign(document.createElement('canvas'),
        { width: img.width, height: img.height });
    const ctx  = canvas.getContext('2d');
    ctx.drawImage(img, 0, 0);

    // 半透明文字水印
    ctx.font = `bold ${Math.round(img.width * 0.035)}px 'Noto Sans TC', sans-serif`;
    ctx.fillStyle = 'rgba(255,255,255,0.55)';
    ctx.textAlign = 'right';
    ctx.shadowColor = 'rgba(0,0,0,0.5)';
    ctx.shadowBlur  = 6;
    ctx.fillText(text, img.width - 20, img.height - 20);

    return new Promise(res => canvas.toBlob(res, 'image/webp', 0.9));
}
```

**UI 設計**：
- 版型抽屜下方新增「水印設定」區塊
- 可輸入水印文字、位置（右下 / 左下 / 居中）、透明度滑桿（10%～60%）
- 「僅在公開模式加水印」選項（登入後才顯示）

---

### AO. 旋轉動畫匯出（WebM / GIF）

> **難度**：⭐⭐⭐⭐｜**效益**：直接分享動態畫廊到社群媒體，視覺衝擊力極強

```js
async function exportGalleryVideo(durationMs = 6000) {
    const scene = document.getElementById('scene');
    const stream = scene.captureStream(30); // 30fps
    const recorder = new MediaRecorder(stream, {
        mimeType: 'video/webm;codecs=vp9',
        videoBitsPerSecond: 5_000_000 // 5Mbps
    });
    const chunks = [];
    recorder.ondataavailable = e => e.data.size && chunks.push(e.data);
    recorder.onstop = () => {
        const blob = new Blob(chunks, { type: 'video/webm' });
        const a = Object.assign(document.createElement('a'), {
            href: URL.createObjectURL(blob),
            download: 'gallery_360.webm'
        });
        a.click();
    };
    // 開始旋轉 + 錄影
    startAutoRotate();
    recorder.start();
    setTimeout(() => { recorder.stop(); stopAutoRotate(); }, durationMs);
}
```

---

### AP. 輕量版 PWA 支援（可安裝 + 離線瀏覽）

> **難度**：⭐⭐⭐｜**效益**：安裝到手機桌面，全螢幕啟動，App 級別體驗

```json
{
    "name": "3D 畫廊",
    "short_name": "畫廊",
    "start_url"  : "./index.html",
    "display"    : "standalone",
    "background_color": "#0a0a1a",
    "theme_color"     : "#6366f1",
    "icons": [
        { "src": "./icon-192.png", "sizes": "192x192", "type": "image/png" },
        { "src": "./icon-512.png", "sizes": "512x512", "type": "image/png" }
    ]
}
```

- 基本 Service Worker（僅快取 `index.html`，圖片靠 localStorage 離線）
- `<meta name="apple-mobile-web-app-capable">` iOS 全螢幕啟動
- 首次訪問 → 「加入主畫面」提示 Banner

---

### AQ. 相簿統計儀表板（Analytics）

> **難度**：⭐⭐⭐⭐｜**效益**：管理員視角，一眼掌握相簿健康狀態

```
儀表板卡片：
┌────────────────────────────────────────┐
│ 📊 相簿統計                             │
├──────────┬────────────┬────────────────┤
│ 總圖片   │ 雲端用量   │ 最後同步時間   │
│ 128 張   │ 45MB/1GB  │ 2 分鐘前       │
├──────────┴────────────┴────────────────┤
│ 🥧 各標籤分佈（Chart.js donut chart）  │
│ 風景 45% ▌旅行 30% ▌其他 25%          │
├────────────────────────────────────────┤
│ 📈 每週上傳趨勢（折線圖）               │
│ 最多讚 TOP 5 圖片（縮圖 + 讚數）       │
└────────────────────────────────────────┘
```

---

### AR. Vite + React + TypeScript 重構（長期維護）

> **難度**：⭐⭐⭐⭐⭐｜**效益**：大型功能更易維護，支援 TypeScript 強型別

```
src/
├── components/
│   ├── CarouselScene.tsx    ← 3D 場景 + 視差
│   ├── CarouselItem.tsx     ← 卡片（含翻轉）
│   ├── ControlPanel.tsx     ← 上傳 / 排序 / 搜尋
│   ├── ThumbStrip.tsx       ← 縮圖帶
│   ├── Lightbox.tsx         ← 全螢幕燈箱 + 濾鏡
│   ├── ParticleCanvas.tsx   ← 粒子背景
│   ├── SyncOverlay.tsx      ← 進度遮罩
│   └── MapView.tsx          ← Leaflet 地圖模式
├── hooks/
│   ├── useGallery.ts        ← allImageData CRUD
│   ├── useFirebase.ts       ← Auth / Firestore / Storage
│   └── useKeyboard.ts       ← 鍵盤事件
├── stores/
│   └── galleryStore.ts      ← Zustand 全域狀態
└── App.tsx
```

---

## 📊 完整開發優先建議矩陣（v8.0 版本）

| 版本 | ID | 功能名稱 | 難度 | 視覺衝擊 | 使用者價值 | 狀態 |
|---|---|---|---|---|---|---|
| v1.0～v4.1 | — | 核心 + 雲端 + CI/CD | ⭐～⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ✅ 已完成 |
| v5.0 | A B C D | 視差 / 粒子 / 縮圖 / 翻轉 | ⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ✅ 已完成 |
| v6.0 | E F G H I | 拖曳 / 行內編輯 / 壓縮 / 批次 / 標籤 | ⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐⭐⭐ | ✅ 已完成 |
| v7.0 | U W Y AA | 版型 / 波浪 / 公開連結 / 公開規則 | ⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ✅ 已完成 |
| v8.0 | — | 自動還原 + 手動還原 + 一鍵刪除 | ⭐⭐ | ⭐ | ⭐⭐⭐⭐⭐ | ✅ 已完成 |
| **v8.1** | **—** | **多排圓圈 + 深度暗化 + 沉浸模式** | **⭐⭐⭐** | **⭐⭐⭐⭐⭐** | **⭐⭐⭐⭐⭐** | **✅ 最新完成** |
| **v9.0** | **AB** | **EXIF 自動日期 / 相機** | **⭐⭐⭐** | **⭐⭐** | **⭐⭐⭐⭐⭐** | **🔥 最優先** |
| **v9.0** | **AC** | **即時關鍵字搜尋** | **⭐⭐** | **⭐** | **⭐⭐⭐⭐⭐** | **🔥 最優先** |
| **v9.0** | **AD** | **幻燈片播放模式** | **⭐⭐** | **⭐⭐⭐** | **⭐⭐⭐⭐** | **🔥 最優先** |
| **v9.0** | **AE** | **批次上傳進度條** | **⭐⭐** | **⭐⭐** | **⭐⭐⭐⭐** | **✅ 已完成** |
| v9.0 | AF | 多維度排序 | ⭐⭐ | ⭐ | ⭐⭐⭐⭐ | ✅ 推薦 |
| v9.0 | AG | 備份匯出 ZIP | ⭐⭐⭐ | ⭐ | ⭐⭐⭐⭐⭐ | ✅ 推薦 |
| v10.0 | AH | 相簿封面 / 個人資料頁 | ⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | 📅 中期 |
| v10.0 | AI | 圖片按讚 / 收藏 | ⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐⭐ | 📅 中期 |
| v10.0 | AJ | 評分系統（★） | ⭐⭐ | ⭐⭐ | ⭐⭐⭐ | 📅 中期 |
| v10.0 | AK | 多人協作共享相簿 | ⭐⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐⭐⭐ | 📅 中期 |
| v10.0 | AL | 圖片濾鏡 / 色調調整 | ⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | 📅 中期 |
| v10.0 | AM | 地圖模式（Leaflet.js） | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | 📅 中期 |
| v10.0 | AN | AI 自動命名（Gemini Vision） | ⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ | 📅 中期 |
| v11.0+ | AO | 旋轉動畫匯出 WebM | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | 🚀 長期 |
| v11.0+ | AP | PWA 完整離線支援 | ⭐⭐⭐ | ⭐ | ⭐⭐⭐⭐⭐ | 🚀 長期 |
| v11.0+ | AQ | 相簿統計儀表板 | ⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ | 🚀 長期 |
| v11.0+ | AR | Vite + React + TS 重構 | ⭐⭐⭐⭐⭐ | ⭐ | ⭐⭐⭐⭐⭐ | 🚀 長期 |
## 📊 完整開發優先建議矩陣（v9.0 更新）

| 版本 | ID | 功能名稱 | 難度 | 視覺 | 效益 | 狀態 |
|---|---|---|---|---|---|---|
| v1.0～v4.1 | — | 核心 + 雲端 + CI/CD | ⭐～⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ✅ 已完成 |
| v5.0 | A B C D | 視差 / 粒子 / 縮圖 / 翻轉 | ⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ✅ 已完成 |
| v6.0 | E F G H I | 拖曳 / 行內編輯 / 壓縮 / 批次 / 標籤 | ⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐⭐⭐ | ✅ 已完成 |
| v7.0 | U W Y AA | 版型 / 波浪 / 公開連結 / 公開規則 | ⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ✅ 已完成 |
| v8.0 | — | 自動還原 + 手動還原 + 一鍵刪除 | ⭐⭐ | ⭐ | ⭐⭐⭐⭐⭐ | ✅ 已完成 |
| v8.1 | — | 多排圓圈 + 深度暗化 + 沉浸模式 | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ✅ 已完成 |
| **v9.0** | **—** | **手機折疊面板 + Pinch 縮放** | **⭐⭐** | **⭐⭐⭐** | **⭐⭐⭐⭐⭐** | **✅ 最新完成** |
| **v9.0** | **AE** | **批次上傳進度條** | **⭐⭐** | **⭐⭐** | **⭐⭐⭐⭐** | **✅ 已完成** |
| **v9.0** | **AS** | **旋轉靈敏度細調（拖曳/觸控/鍵盤）** | **⭐** | **⭐** | **⭐⭐⭐** | **✅ 已完成** |
| **v9.0** | **AT** | **卡片陰影深度動畫** | **⭐⭐** | **⭐⭐⭐⭐⭐** | **⭐⭐⭐** | **✅ 已完成** |
| **v9.0** | **AU** | **沉浸模式五情境預設** | **⭐⭐** | **⭐⭐⭐⭐** | **⭐⭐⭐⭐** | **✅ 已完成** |
| v9.0 | AB | EXIF 自動日期 / 相機型號 | ⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐⭐⭐ | 🔥 最優先 |
| v9.0 | AC | 即時關鍵字搜尋 | ⭐⭐ | ⭐ | ⭐⭐⭐⭐⭐ | 🔥 最優先 |
| v9.0 | AD | 幻燈片播放模式 | ⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ | 🔥 最優先 |
| v9.0 | AF | 多維度排序選項 | ⭐⭐ | ⭐ | ⭐⭐⭐⭐ | 📝 推薦 |
| v9.0 | AG | 備份匯出 ZIP | ⭐⭐⭐ | ⭐ | ⭐⭐⭐⭐⭐ | 📝 推薦 |
| v9.0 | AV | 卡片自動對焦 Snap | ⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ | 📝 推薦 |
| v10.0 | AH | 相簿封面 / 個人資料頁 | ⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | 📅 中期 |
| v10.0 | AI | 圖片按讚 / 收藏 | ⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐⭐ | 📅 中期 |
| v10.0 | AJ | 評分系統（★） | ⭐⭐ | ⭐⭐ | ⭐⭐⭐ | 📅 中期 |
| v10.0 | AK | 多人協作共享相簿 | ⭐⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐⭐⭐ | 📅 中期 |
| v10.0 | AL | 圖片濾鏡 / 色調調整 | ⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | 📅 中期 |
| v10.0 | AM | 地圖模式（Leaflet.js） | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | 📅 中期 |
| v10.0 | AN | AI 自動命名（Gemini Vision） | ⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ | 📅 中期 |
| v10.0 | AW | 語音控制（Web Speech API） | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | 📅 中期 |
| v11.0+ | AO | 旋轉動畫匯出 WebM | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | 🚀 長期 |
| v11.0+ | AP | PWA 完整離線支援 | ⭐⭐⭐ | ⭐ | ⭐⭐⭐⭐⭐ | 🚀 長期 |
| v11.0+ | AQ | 相簿統計儀表板 | ⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ | 🚀 長期 |
| v11.0+ | AR | Vite + React + TS 重構 | ⭐⭐⭐⭐⭐ | ⭐ | ⭐⭐⭐⭐⭐ | 🚀 長期 |
| v11.0+ | AX | 相片水印 / 版權標記 | ⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐⭐⭐ | 🚀 長期 |

---

## 🆕 全新功能建議（v10.0 補充）

---

### AY. 卡片自動對焦 Snap（慣性停止後吸附最近卡）

> **難度**：⭐⭐｜**效益**：停止後不再卡在兩張之間，操控感和精準度大提升

```js
function snapToNearest() {
    const step = theta || 45;
    const nearest = Math.round(currentRotationY / step) * step;
    carousel.style.transition = 'transform 0.35s cubic-bezier(.2,.8,.2,1)';
    currentRotationY = nearest;
    applyTransform();
}
// 在 applyInertia 末段速度趨近 0 時呼叫
if (Math.abs(velocityX) < 0.06 && Math.abs(velocityY) < 0.06) {
    snapToNearest(); 
}
```

**同時加入「正面高亮」**：前方卡片 `outline: 2px solid rgba(255,255,255,.5)`，其餘不高亮，視覺焦點更清晰。

---

### AZ. 多主題光源方向控制

> **難度**：⭐⭐｜**效益**：版型抽屜加入光源角度滑桿，光影立體感再升級

在版型抽屜加入「💡 光源角度」滑桿（0°～360°）：

```js
// 光源方向影響 brightness 計算的 cos 參考點
const lightOffset = layoutCfg.lightAngle || 0; // 度數
const effAngle = (((base + currentRotationY + lightOffset) % 360) + 360) % 360;
const bright = 0.3 + 0.7 * ((Math.cos(effAngle * Math.PI / 180) + 1) / 2);
```

- 預設 0°（光從正前方照）→ 270° 可模擬「右側光源」，前右方卡片最亮

---

### BA. 快速跳至指定卡片（直接輸入編號）

> **難度**：⭐｜**效益**：100 張相簿的使用者超需要，立刻定位特定照片

```js
// Ctrl+G 或按鈕彈出
const jumpModal = document.getElementById('jump-modal');
const jumpInput = document.getElementById('jump-input');

function jumpToCard(idx) {
    if (idx < 0 || idx >= filteredData.length) return;
    const step = theta || 45;
    currentRotationY = -idx * step;
    carousel.style.transition = 'transform 0.5s cubic-bezier(.2,.8,.2,1)';
    applyTransform();
}
```

- 在控制面板加入小型「# 跳至」輸入框，輸入數字按 Enter 瞬間旋轉到目標卡
- 僅在圖片數 ≥ 10 張時顯示此入口

---

### BB. 縮圖帶橫向捲動改良（虛擬捲動 + 滑動吸附）

> **難度**：⭐⭐⭐｜**效益**：500 張相簿的縮圖帶不再卡頓，效能飛升

目前所有縮圖全部渲染，張數多時 DOM 壓力大。改用虛擬捲動（Intersection Observer）：

```js
// 只 render 可視視窗 ±5 張的縮圖
function updateVisibleThumbs() {
    const scrollLeft = thumbStrip.scrollLeft;
    const thumbW = 52; // 每個縮圖寬度含 gap
    const startIdx = Math.max(0, Math.floor(scrollLeft / thumbW) - 5);
    const endIdx   = Math.min(filteredData.length, startIdx + visibleCount + 10);
    // 只渲染 startIdx～endIdx 範圍的縮圖元素
}
```

---

### BC. 手機版左右輕掃切換到下一排（Y 軸翻頁）

> **難度**：⭐⭐｜**效益**：多排相簿時，手機用戶可用上下滑換排，配合折疊面板更自然

```js
// 雙指垂直滑動 → 切換顯示排次
document.addEventListener('touchmove', e => {
    if (e.touches.length === 2) return; // 避免與 Pinch 衝突
    const dy = e.touches[0].pageY - touchStartY;
    if (Math.abs(dy) > 60) { // 閾值 60px
        const dir = dy < 0 ? 1 : -1; // 向上滑 = 下一排
        currentRow = Math.max(0, Math.min(totalRows - 1, currentRow + dir));
        // 套用對應排的 Y 偏移
    }
});
```

---

### BD. 版型設定雲端跨裝置同步（含靈敏度）

> **難度**：⭐⭐｜**效益**：換手機開畫廊時，不必重新調整版型，體驗一致

目前 `saveLayoutToCloud()` 只儲存 `w / h / persp / speed`。補上新欄位：

```js
layout: {
    w: layoutCfg.w,
    h: layoutCfg.h,
    persp: layoutCfg.persp,
    speed: autoRotateSpeed,
    dragSens:  layoutCfg.dragSens  || 1.0,   // AS
    touchSens: layoutCfg.touchSens || 1.0,   // AS
    keySens:   layoutCfg.keySens   || 1,     // AS
    lightAngle: layoutCfg.lightAngle || 0,   // AZ
}
```

---

### BE. 主題色自訂（Hue 旋鈕）

> **難度**：⭐⭐｜**效益**：從 5 個固定主題升級到 360° 無限自訂色系，高質感個人化

在主題按鈕列加入一個色相旋鈕（`<input type="range" min="0" max="360">`）：

```js
function applyCustomHue(hue) {
    document.documentElement.style.setProperty('--accent', `hsl(${hue}, 70%, 60%)`);
    document.documentElement.style.setProperty('--accent2', `hsl(${(hue+30)%360}, 60%, 50%)`);
    // 粒子顏色同步更新
    particleColor = `hsl(${hue}, 70%, 60%)`;
}
```

---

### BF. 卡片懸停 3D 傾斜光澤（Tilt Effect）

> **難度**：⭐⭐⭐｜**效益**：游標在卡片上時產生細緻的動態光澤感，質感大幅提升

```js
card.addEventListener('mousemove', e => {
    if (editMode) return;
    const rect = card.getBoundingClientRect();
    const x = (e.clientX - rect.left) / rect.width - 0.5;   // -0.5 ～ 0.5
    const y = (e.clientY - rect.top)  / rect.height - 0.5;
    const rotX =  y * -12; // 最大 12°
    const rotY =  x *  12;
    card.style.transform = 
        `translateZ(${cardTranslateZ}px) rotateX(${rotX}deg) rotateY(${rotY}deg)`;
    // 光澤層跟著游標移動
    const gloss = card.querySelector('.card-gloss');
    if (gloss) gloss.style.background = 
        `radial-gradient(circle at ${(x+0.5)*100}% ${(y+0.5)*100}%, rgba(255,255,255,.18), transparent 65%)`;
});
card.addEventListener('mouseleave', () => {
    card.style.transform = `translateZ(${cardTranslateZ}px)`;
});
```

**CSS**：
```css
.card-gloss {
    position: absolute; inset: 0;
    border-radius: 12px;
    pointer-events: none;
    transition: background 0.1s ease;
}
```

---

## 📝 授權

本專案為個人創意作品，歡迎自由修改與使用。

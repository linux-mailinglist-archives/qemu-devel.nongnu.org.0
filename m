Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF13844D827
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 15:20:48 +0100 (CET)
Received: from localhost ([::1]:49436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlAwZ-0005aB-Ru
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 09:20:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamie@nuviainc.com>)
 id 1mlAoE-00053t-1l
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:12:10 -0500
Received: from [2a00:1450:4864:20::532] (port=46832
 helo=mail-ed1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jamie@nuviainc.com>)
 id 1mlAoC-00067U-6i
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:12:09 -0500
Received: by mail-ed1-x532.google.com with SMTP id c8so24364973ede.13
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 06:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=slgv2b5Jtj2Nb7T7MW1x3Gbgc4Xp7L48IKrc9fEpBY0=;
 b=zLmOdYR3DWgiye8lsb15ZLdzi9EOnDW8x37keKF+SicA8IPjxCO4fEtkY0knltghR0
 5cP9HgCsgCUslRWWsnONIxIo8R492V8KJ8FWHb3VLi7lLOcY0d7IQZc+IfgHa9+wKeo0
 rjAZDjPlK38ariIgY7Jd9DOrgWG9gDAOqDQlkv4Fjx+U6QnDOrohZwXg84HNOJN7Lg/m
 HVTEEpD5tH4JaH06uztZa0V0kmfNa/hoOQlMjrxWrNw/RC2HTTcvosup344ICI/Zcko0
 FCK6pHU9CYMxLcs1f34+k8D5F3mWKuw+cvqm4QrRl1ZR2BFhyhlxE8R01QsLE1e9/VUt
 gF7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=slgv2b5Jtj2Nb7T7MW1x3Gbgc4Xp7L48IKrc9fEpBY0=;
 b=k5TQPhOGhHvIYmSagD42CgMWcxYHPZZrTjdP2CyWxh0meQgvWC79FfMSYBZgn356AU
 d1a0lSyGpBkrmhAwkYutYlL69LoogCyyGMnbdqEfk0Ds8ST3hmdZJxfvs4gAX+eYJFxF
 IWpXdYSxcM0EP5md9w3uo2xwgVWPyuOUKpp8qLsnfNqrw7ZzhfLFNpkZruXOvYvlSf4T
 1QbbUMHIlqVSJjkg3e9e4f/0eGaAYVwYR/g6jiXzyt/DXC7Y4KPP5zDZ8yKY7Mu7eozj
 rM8LZLUKqXv3ETLMMekpv+WmHTNhpSpOg86lk3bHPZnr5QyhMxbMZ8cQsDbFZ4Chc+08
 5AwA==
X-Gm-Message-State: AOAM5302Mr5OhON/ZVAeMR7YimqGg/ckYnlubhpu9Xiez9Rf2UGLX/ER
 cV6kidkqukinZ37gAVtYx8kHMcfvteCZSfvYDTlnM9MnqSBbIAeFf0RZJSVnUksaNwf7zaUhIDO
 6/mJ+abWJLIBtOokB68Yy32SAYoB5buxQxewnrponVKtdXZ3hlIyO1Q51R/kxBxV3oA91
X-Google-Smtp-Source: ABdhPJz2gqtA22HIdR0ed79HUnj2DHulGa/h0CM9g3aoM8Pq+PhCaXRKJGU7GM9HZPOisG4m+Kk6Xw==
X-Received: by 2002:a05:6402:447:: with SMTP id
 p7mr10106096edw.261.1636639916510; 
 Thu, 11 Nov 2021 06:11:56 -0800 (PST)
Received: from localhost ([82.44.17.50])
 by smtp.gmail.com with ESMTPSA id ga1sm1424340ejc.40.2021.11.11.06.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 06:11:56 -0800 (PST)
From: Jamie Iles <jamie@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/core/loader: workaround read() size limit.
Date: Thu, 11 Nov 2021 14:11:41 +0000
Message-Id: <20211111141141.3295094-3-jamie@nuviainc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211111141141.3295094-1-jamie@nuviainc.com>
References: <20211111141141.3295094-1-jamie@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::532
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=jamie@nuviainc.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Jamie Iles <jamie@nuviainc.com>, lmichel@kalray.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Linux, read() will only ever read a maximum of 0x7ffff000 bytes
regardless of what is asked.  If the file is larger than 0x7ffff000
bytes the read will need to be broken up into multiple chunks.

Cc: Luc Michel <lmichel@kalray.eu>
Signed-off-by: Jamie Iles <jamie@nuviainc.com>
---
 hw/core/loader.c | 40 ++++++++++++++++++++++++++++++++++------
 1 file changed, 34 insertions(+), 6 deletions(-)

diff --git a/hw/core/loader.c b/hw/core/loader.c
index 348bbf535bd9..16ca9b99cf0f 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -80,6 +80,34 @@ int64_t get_image_size(const char *filename)
     return size;
 }
 
+static ssize_t read_large(int fd, void *dst, size_t len)
+{
+    /*
+     * man 2 read says:
+     *
+     * On Linux, read() (and similar system calls) will transfer at most
+     * 0x7ffff000 (2,147,479,552) bytes, returning the number of bytes
+     * actually transferred.  (This is true on both 32-bit and 64-bit
+     * systems.)
+     *
+     * So read in chunks no larger than 0x7ffff000 bytes.
+     */
+    size_t max_chunk_size = 0x7ffff000;
+    size_t offset = 0;
+
+    while (offset < len) {
+        size_t chunk_len = MIN(max_chunk_size, len - offset);
+        ssize_t br = read(fd, dst + offset, chunk_len);
+
+        if (br < 0) {
+            return br;
+        }
+        offset += br;
+    }
+
+    return (ssize_t)len;
+}
+
 /* return the size or -1 if error */
 ssize_t load_image_size(const char *filename, void *addr, size_t size)
 {
@@ -91,7 +119,7 @@ ssize_t load_image_size(const char *filename, void *addr, size_t size)
         return -1;
     }
 
-    while ((actsize = read(fd, addr + l, size - l)) > 0) {
+    while ((actsize = read_large(fd, addr + l, size - l)) > 0) {
         l += actsize;
     }
 
@@ -108,7 +136,7 @@ ssize_t read_targphys(const char *name,
     ssize_t did;
 
     buf = g_malloc(nbytes);
-    did = read(fd, buf, nbytes);
+    did = read_large(fd, buf, nbytes);
     if (did > 0)
         rom_add_blob_fixed("read", buf, did, dst_addr);
     g_free(buf);
@@ -235,7 +263,7 @@ ssize_t load_aout(const char *filename, hwaddr addr, int max_sz,
     if (fd < 0)
         return -1;
 
-    size = read(fd, &e, sizeof(e));
+    size = read_large(fd, &e, sizeof(e));
     if (size < 0)
         goto fail;
 
@@ -286,7 +314,7 @@ static void *load_at(int fd, off_t offset, size_t size)
     if (lseek(fd, offset, SEEK_SET) < 0)
         return NULL;
     ptr = g_malloc(size);
-    if (read(fd, ptr, size) != size) {
+    if (read_large(fd, ptr, size) != size) {
         g_free(ptr);
         return NULL;
     }
@@ -714,7 +742,7 @@ static ssize_t load_uboot_image(const char *filename, hwaddr *ep,
 
     data = g_malloc(hdr->ih_size);
 
-    if (read(fd, data, hdr->ih_size) != hdr->ih_size) {
+    if (read_large(fd, data, hdr->ih_size) != hdr->ih_size) {
         fprintf(stderr, "Error reading file\n");
         goto out;
     }
@@ -1005,7 +1033,7 @@ ssize_t rom_add_file(const char *file, const char *fw_dir,
     rom->datasize = rom->romsize;
     rom->data     = g_malloc0(rom->datasize);
     lseek(fd, 0, SEEK_SET);
-    rc = read(fd, rom->data, rom->datasize);
+    rc = read_large(fd, rom->data, rom->datasize);
     if (rc != rom->datasize) {
         fprintf(stderr, "rom: file %-20s: read error: rc=%zd (expected %zd)\n",
                 rom->name, rc, rom->datasize);
-- 
2.30.2



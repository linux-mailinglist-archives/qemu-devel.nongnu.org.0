Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D8B525890
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 01:43:19 +0200 (CEST)
Received: from localhost ([::1]:43264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npISk-0001n1-EX
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 19:43:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1npIPk-0007v3-Q3
 for qemu-devel@nongnu.org; Thu, 12 May 2022 19:40:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1npIPi-00046s-Ch
 for qemu-devel@nongnu.org; Thu, 12 May 2022 19:40:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652398809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2i3J4nsvNSczAXb0CsedMqrL/LqxMntP1NW/SiHLTLg=;
 b=E3ZaKkNKoEij3y0yqrLOpLEoZ7FEPIYMg3OD1oQiVxzuCCLfoQJnis+nYprW5wTAyx/EwG
 uDxtN1QPW8U0BrBdX6hBmEIR8BOYLnZA5Rl4iwy1+UH2WoNP6RTzimdIdepAnH8EXO2eVN
 2yLShyGebhvxyfvQr9aedyBsKlAtXK8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-cpSxagDCNCyczmiTx65-NQ-1; Thu, 12 May 2022 19:39:03 -0400
X-MC-Unique: cpSxagDCNCyczmiTx65-NQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 m124-20020a1c2682000000b00393fcd2722dso2243925wmm.4
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 16:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2i3J4nsvNSczAXb0CsedMqrL/LqxMntP1NW/SiHLTLg=;
 b=s5PCTKa43sCRsKAPB+PA1xUdryIuRrjiqd12sadpPS7x0AXBYNUu3j4i+CQQuSNrW+
 Ge2idTfYl6b3c8wUY6C2vbiWtOE+lTeX1lqh1KfIS8q85ntY39MzBD3zPEQI5pDhLTp2
 f1i6eYjc6t0qT0vfaf3I3ngwAgdQJrJJQw8orG5ANCWfo+PLYYvILvXu/Pgu2BV1Aoth
 EnVLsNEKx49+Jhpd5yDE7+EDgWaoqrKPc+rXwGze9/r9dIpSYPlJg7LL5UeHb6NAfx50
 A/oSkkTaBmNUM/Kf+c0a8j1eiUJfsCQxxFo1pTA9W4w9Rh3VR9cQx8oRro/o6+m8dsY4
 RObg==
X-Gm-Message-State: AOAM530AEhgX/P0y7ysF57DqItGq9I3E/OzhZsNIC6kQ5IsG1InezUo+
 sRAI+LD9WfXkWksPpTIkrdNC17l3v+CAm0uVcuBTqzE+y5Jr7y37XgrTKKTWJGvWSwRHdUv/5cH
 qZ+8BrGteDrkaeAhlAhvQ945BUMB9spnyKlz4UMDIohtpxPkFVdAnefvKz+xgfNl7
X-Received: by 2002:adf:f210:0:b0:20c:dd8b:7e8f with SMTP id
 p16-20020adff210000000b0020cdd8b7e8fmr1523580wro.411.1652398741451; 
 Thu, 12 May 2022 16:39:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkkTGwrsPSBCIVFuuQYgLl0I0bJtSXBCX740d7fvD1v8Wa0BNCxmzK9lwrtcXRQSfHRFRcAw==
X-Received: by 2002:adf:f210:0:b0:20c:dd8b:7e8f with SMTP id
 p16-20020adff210000000b0020cdd8b7e8fmr1523561wro.411.1652398741097; 
 Thu, 12 May 2022 16:39:01 -0700 (PDT)
Received: from DESKTOP-E7ACR7D.lan ([2001:8a0:f4d9:2101:a4fa:5f93:755f:6249])
 by smtp.gmail.com with ESMTPSA id
 r12-20020adfa14c000000b0020c5253d8c7sm749045wrr.19.2022.05.12.16.39.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 16:39:00 -0700 (PDT)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Alberto Faria <afaria@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Fam Zheng <fam@euphon.net>,
 Jeff Cody <codyprime@gmail.com>
Subject: [PATCH 3/7] block: Make bdrv_{pread,pwrite}() return 0 on success
Date: Fri, 13 May 2022 00:38:45 +0100
Message-Id: <20220512233849.2219275-4-afaria@redhat.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220512233849.2219275-1-afaria@redhat.com>
References: <20220512233849.2219275-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

They currently return the value of their 'bytes' parameter on success.

Make them return 0 instead, for consistency with other I/O functions and
in preparation to implement them using generated_co_wrapper. This also
makes it clear that short reads/writes are not possible.

The few callers that rely on the previous behavior are adjusted
accordingly by hand.

Signed-off-by: Alberto Faria <afaria@redhat.com>
---
 block/cloop.c                    |  2 +-
 block/crypto.c                   |  4 ++--
 block/dmg.c                      | 10 +++++-----
 block/io.c                       | 10 ++--------
 block/qcow.c                     |  2 +-
 block/qcow2.c                    |  4 ++--
 block/qed.c                      |  7 +------
 block/vhdx-log.c                 |  3 +++
 block/vmdk.c                     |  5 ++---
 tests/unit/test-block-iothread.c |  4 ++--
 10 files changed, 21 insertions(+), 30 deletions(-)

diff --git a/block/cloop.c b/block/cloop.c
index 9a2334495e..40b146e714 100644
--- a/block/cloop.c
+++ b/block/cloop.c
@@ -222,7 +222,7 @@ static inline int cloop_read_block(BlockDriverState *bs, int block_num)
 
         ret = bdrv_pread(bs->file, s->offsets[block_num], bytes,
                          s->compressed_block, 0);
-        if (ret != bytes) {
+        if (ret < 0) {
             return -1;
         }
 
diff --git a/block/crypto.c b/block/crypto.c
index deec7fae2f..e7f5c4e31a 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -70,7 +70,7 @@ static ssize_t block_crypto_read_func(QCryptoBlock *block,
         error_setg_errno(errp, -ret, "Could not read encryption header");
         return ret;
     }
-    return ret;
+    return buflen;
 }
 
 static ssize_t block_crypto_write_func(QCryptoBlock *block,
@@ -88,7 +88,7 @@ static ssize_t block_crypto_write_func(QCryptoBlock *block,
         error_setg_errno(errp, -ret, "Could not write encryption header");
         return ret;
     }
-    return ret;
+    return buflen;
 }
 
 
diff --git a/block/dmg.c b/block/dmg.c
index 5a460c3eb1..98db18d82a 100644
--- a/block/dmg.c
+++ b/block/dmg.c
@@ -390,7 +390,7 @@ static int dmg_read_plist_xml(BlockDriverState *bs, DmgHeaderState *ds,
     buffer = g_malloc(info_length + 1);
     buffer[info_length] = '\0';
     ret = bdrv_pread(bs->file, info_begin, info_length, buffer, 0);
-    if (ret != info_length) {
+    if (ret < 0) {
         ret = -EINVAL;
         goto fail;
     }
@@ -611,7 +611,7 @@ static inline int dmg_read_chunk(BlockDriverState *bs, uint64_t sector_num)
              * inflated. */
             ret = bdrv_pread(bs->file, s->offsets[chunk], s->lengths[chunk],
                              s->compressed_chunk, 0);
-            if (ret != s->lengths[chunk]) {
+            if (ret < 0) {
                 return -1;
             }
 
@@ -637,7 +637,7 @@ static inline int dmg_read_chunk(BlockDriverState *bs, uint64_t sector_num)
              * inflated. */
             ret = bdrv_pread(bs->file, s->offsets[chunk], s->lengths[chunk],
                              s->compressed_chunk, 0);
-            if (ret != s->lengths[chunk]) {
+            if (ret < 0) {
                 return -1;
             }
 
@@ -658,7 +658,7 @@ static inline int dmg_read_chunk(BlockDriverState *bs, uint64_t sector_num)
              * inflated. */
             ret = bdrv_pread(bs->file, s->offsets[chunk], s->lengths[chunk],
                              s->compressed_chunk, 0);
-            if (ret != s->lengths[chunk]) {
+            if (ret < 0) {
                 return -1;
             }
 
@@ -674,7 +674,7 @@ static inline int dmg_read_chunk(BlockDriverState *bs, uint64_t sector_num)
         case UDRW: /* copy */
             ret = bdrv_pread(bs->file, s->offsets[chunk], s->lengths[chunk],
                              s->uncompressed_chunk, 0);
-            if (ret != s->lengths[chunk]) {
+            if (ret < 0) {
                 return -1;
             }
             break;
diff --git a/block/io.c b/block/io.c
index 2ed963d9e0..78a289192e 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1115,7 +1115,6 @@ int bdrv_make_zero(BdrvChild *child, BdrvRequestFlags flags)
 int bdrv_pread(BdrvChild *child, int64_t offset, int64_t bytes, void *buf,
                BdrvRequestFlags flags)
 {
-    int ret;
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
     IO_CODE();
 
@@ -1123,9 +1122,7 @@ int bdrv_pread(BdrvChild *child, int64_t offset, int64_t bytes, void *buf,
         return -EINVAL;
     }
 
-    ret = bdrv_preadv(child, offset, bytes, &qiov, flags);
-
-    return ret < 0 ? ret : bytes;
+    return bdrv_preadv(child, offset, bytes, &qiov, flags);
 }
 
 /* Return no. of bytes on success or < 0 on error. Important errors are:
@@ -1137,7 +1134,6 @@ int bdrv_pread(BdrvChild *child, int64_t offset, int64_t bytes, void *buf,
 int bdrv_pwrite(BdrvChild *child, int64_t offset, int64_t bytes,
                 const void *buf, BdrvRequestFlags flags)
 {
-    int ret;
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
     IO_CODE();
 
@@ -1145,9 +1141,7 @@ int bdrv_pwrite(BdrvChild *child, int64_t offset, int64_t bytes,
         return -EINVAL;
     }
 
-    ret = bdrv_pwritev(child, offset, bytes, &qiov, flags);
-
-    return ret < 0 ? ret : bytes;
+    return bdrv_pwritev(child, offset, bytes, &qiov, flags);
 }
 
 /*
diff --git a/block/qcow.c b/block/qcow.c
index c94524b814..c646d6b16d 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -597,7 +597,7 @@ static int decompress_cluster(BlockDriverState *bs, uint64_t cluster_offset)
         csize &= (s->cluster_size - 1);
         BLKDBG_EVENT(bs->file, BLKDBG_READ_COMPRESSED);
         ret = bdrv_pread(bs->file, coffset, csize, s->cluster_data, 0);
-        if (ret != csize)
+        if (ret < 0)
             return -1;
         if (decompress_buffer(s->cluster_cache, s->cluster_size,
                               s->cluster_data, csize) < 0) {
diff --git a/block/qcow2.c b/block/qcow2.c
index 5493e6b847..d5a1e8bc43 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -113,7 +113,7 @@ static ssize_t qcow2_crypto_hdr_read_func(QCryptoBlock *block, size_t offset,
         error_setg_errno(errp, -ret, "Could not read encryption header");
         return -1;
     }
-    return ret;
+    return buflen;
 }
 
 
@@ -174,7 +174,7 @@ static ssize_t qcow2_crypto_hdr_write_func(QCryptoBlock *block, size_t offset,
         error_setg_errno(errp, -ret, "Could not read encryption header");
         return -1;
     }
-    return ret;
+    return buflen;
 }
 
 static QDict*
diff --git a/block/qed.c b/block/qed.c
index ba93e99570..55da91eb72 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -87,14 +87,9 @@ static void qed_header_cpu_to_le(const QEDHeader *cpu, QEDHeader *le)
 int qed_write_header_sync(BDRVQEDState *s)
 {
     QEDHeader le;
-    int ret;
 
     qed_header_cpu_to_le(&s->header, &le);
-    ret = bdrv_pwrite(s->bs->file, 0, sizeof(le), &le, 0);
-    if (ret != sizeof(le)) {
-        return ret;
-    }
-    return 0;
+    return bdrv_pwrite(s->bs->file, 0, sizeof(le), &le, 0);
 }
 
 /**
diff --git a/block/vhdx-log.c b/block/vhdx-log.c
index 572582b87b..33a7786631 100644
--- a/block/vhdx-log.c
+++ b/block/vhdx-log.c
@@ -88,6 +88,7 @@ static int vhdx_log_peek_hdr(BlockDriverState *bs, VHDXLogEntries *log,
     if (ret < 0) {
         goto exit;
     }
+    ret = sizeof(VHDXLogEntryHeader);
     vhdx_log_entry_hdr_le_import(hdr);
 
 exit:
@@ -148,6 +149,7 @@ static int vhdx_log_read_sectors(BlockDriverState *bs, VHDXLogEntries *log,
         if (ret < 0) {
             goto exit;
         }
+        ret = VHDX_LOG_SECTOR_SIZE;
         read = vhdx_log_inc_idx(read, log->length);
 
         *sectors_read = *sectors_read + 1;
@@ -199,6 +201,7 @@ static int vhdx_log_write_sectors(BlockDriverState *bs, VHDXLogEntries *log,
         if (ret < 0) {
             goto exit;
         }
+        ret = VHDX_LOG_SECTOR_SIZE;
         buffer_tmp += VHDX_LOG_SECTOR_SIZE;
 
         log->write = write;
diff --git a/block/vmdk.c b/block/vmdk.c
index aacea1095f..332565c80f 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -473,7 +473,6 @@ static int vmdk_parent_open(BlockDriverState *bs)
     if (ret < 0) {
         goto out;
     }
-    ret = 0;
 
     p_name = strstr(desc, "parentFileNameHint");
     if (p_name != NULL) {
@@ -905,7 +904,7 @@ static char *vmdk_read_desc(BdrvChild *file, uint64_t desc_offset, Error **errp)
         g_free(buf);
         return NULL;
     }
-    buf[ret] = 0;
+    buf[size] = 0;
 
     return buf;
 }
@@ -1630,7 +1629,7 @@ static int get_cluster_offset(BlockDriverState *bs,
                 l2_size_bytes,
                 l2_table,
                 0
-            ) != l2_size_bytes) {
+            ) < 0) {
         return VMDK_ERROR;
     }
 
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index 49fb1ef1ea..a5c163af7e 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -89,7 +89,7 @@ static void test_sync_op_pread(BdrvChild *c)
 
     /* Success */
     ret = bdrv_pread(c, 0, sizeof(buf), buf, 0);
-    g_assert_cmpint(ret, ==, 512);
+    g_assert_cmpint(ret, ==, 0);
 
     /* Early error: Negative offset */
     ret = bdrv_pread(c, -2, sizeof(buf), buf, 0);
@@ -103,7 +103,7 @@ static void test_sync_op_pwrite(BdrvChild *c)
 
     /* Success */
     ret = bdrv_pwrite(c, 0, sizeof(buf), buf, 0);
-    g_assert_cmpint(ret, ==, 512);
+    g_assert_cmpint(ret, ==, 0);
 
     /* Early error: Negative offset */
     ret = bdrv_pwrite(c, -2, sizeof(buf), buf, 0);
-- 
2.35.3



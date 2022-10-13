Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6375FDAE7
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 15:32:15 +0200 (CEST)
Received: from localhost ([::1]:53132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiyJq-0000rg-0M
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 09:32:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixUC-0001pz-Hz
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:38:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixU9-0004Hx-81
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:38:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665664703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NSp74aW0LPlHnI4gB6AAeUT1xbp0j2K7e5mEhLbWUrU=;
 b=iyJHKAcfK4c4nvkiuxJdrXpb74ktvO/ne8zoh3NBl9WBRjMpiTHVfD+AQvbZAsHwoQgMh6
 fECjFSBcbgdYI7sEB2DQ9Fzb3cjF3sYshXWL17sjNg6wbCvcPscso4sKsBe0Mx+hJRJDeJ
 tGpFgHSA10O+MNtUm9Wh+cYMgo9cuDE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-52-on9OfpdMNXaRmlQCc9kKDA-1; Thu, 13 Oct 2022 08:38:22 -0400
X-MC-Unique: on9OfpdMNXaRmlQCc9kKDA-1
Received: by mail-ej1-f70.google.com with SMTP id
 qa14-20020a170907868e00b0078db5ba61bdso829033ejc.12
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 05:38:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NSp74aW0LPlHnI4gB6AAeUT1xbp0j2K7e5mEhLbWUrU=;
 b=Qlruf6FqA5pfCmVdgCnfwW/iuInHpLmvxs3NiQc29jvfuQp/AY9wIcwgUPmBiVVC0c
 5hhWhYcJuQeCeEHknTLGP23LugbHOyuhq+slRh1sgtdPd1avfWD7RVdZzw//vzid4PKH
 LTOLQgFlCKuWMSqn3BoRsLFoOXeZGyxxzdPVeye40NIN+XFuCW4e1slWZsFZ4xLP4Yjz
 YsDkHUtNn89aYanw5jjDLQRFtaVhDm5Ol1jO1kcj4V18da5PdGveF2ByOIuLlPck7UMX
 VgtFT+URCn++ABox7FGrZHowlp/Chhj9Uv/U4pg0rTqpbFB4gip7aoiEHrZA0r8k53ZL
 qZiw==
X-Gm-Message-State: ACrzQf2xtJgYprYZoipuvD0uBXPZU4etabB4WCQHUJgHsYQjF8UtRgTt
 Yf5FI+MsDmnX0L17vUEjZktZeGPHZVBIQQrU0HBeJ69rHdaS7exbHjZWuLXh4UHbGeMxZudKMrF
 wTiWxfdtGhDkvX5TVmqj3DawhSQTZIIZMosjq09SEylm3BalxbopIOWWDbBC7yORqcuM=
X-Received: by 2002:a17:907:9627:b0:78d:a7d8:9407 with SMTP id
 gb39-20020a170907962700b0078da7d89407mr17573083ejc.675.1665664701160; 
 Thu, 13 Oct 2022 05:38:21 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5y+6HbEC3dGhYvJcLHOdncBP3iAY8djB86k3C1OETRi8BSrMVXBUSPOdjL3yINDgg7/DCSPg==
X-Received: by 2002:a17:907:9627:b0:78d:a7d8:9407 with SMTP id
 gb39-20020a170907962700b0078da7d89407mr17573064ejc.675.1665664700824; 
 Thu, 13 Oct 2022 05:38:20 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 y10-20020a170906558a00b0073d796a1043sm2933262ejp.123.2022.10.13.05.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 05:38:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	afaria@redhat.com
Subject: [PATCH 23/24] vmdk: switch to *_co_* functions
Date: Thu, 13 Oct 2022 14:37:10 +0200
Message-Id: <20221013123711.620631-24-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013123711.620631-1-pbonzini@redhat.com>
References: <20221013123711.620631-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Alberto Faria <afaria@redhat.com>

Signed-off-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/vmdk.c | 56 ++++++++++++++++++++++++++--------------------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/block/vmdk.c b/block/vmdk.c
index c720376aa5..2802501466 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -1441,16 +1441,16 @@ static int coroutine_fn get_whole_cluster(BlockDriverState *bs,
         if (copy_from_backing) {
             /* qcow2 emits this on bs->file instead of bs->backing */
             BLKDBG_EVENT(extent->file, BLKDBG_COW_READ);
-            ret = bdrv_pread(bs->backing, offset, skip_start_bytes,
-                             whole_grain, 0);
+            ret = bdrv_co_pread(bs->backing, offset, skip_start_bytes,
+                                whole_grain, 0);
             if (ret < 0) {
                 ret = VMDK_ERROR;
                 goto exit;
             }
         }
         BLKDBG_EVENT(extent->file, BLKDBG_COW_WRITE);
-        ret = bdrv_pwrite(extent->file, cluster_offset, skip_start_bytes,
-                          whole_grain, 0);
+        ret = bdrv_co_pwrite(extent->file, cluster_offset, skip_start_bytes,
+                             whole_grain, 0);
         if (ret < 0) {
             ret = VMDK_ERROR;
             goto exit;
@@ -1461,18 +1461,18 @@ static int coroutine_fn get_whole_cluster(BlockDriverState *bs,
         if (copy_from_backing) {
             /* qcow2 emits this on bs->file instead of bs->backing */
             BLKDBG_EVENT(extent->file, BLKDBG_COW_READ);
-            ret = bdrv_pread(bs->backing, offset + skip_end_bytes,
-                             cluster_bytes - skip_end_bytes,
-                             whole_grain + skip_end_bytes, 0);
+            ret = bdrv_co_pread(bs->backing, offset + skip_end_bytes,
+                                cluster_bytes - skip_end_bytes,
+                                whole_grain + skip_end_bytes, 0);
             if (ret < 0) {
                 ret = VMDK_ERROR;
                 goto exit;
             }
         }
         BLKDBG_EVENT(extent->file, BLKDBG_COW_WRITE);
-        ret = bdrv_pwrite(extent->file, cluster_offset + skip_end_bytes,
-                          cluster_bytes - skip_end_bytes,
-                          whole_grain + skip_end_bytes, 0);
+        ret = bdrv_co_pwrite(extent->file, cluster_offset + skip_end_bytes,
+                             cluster_bytes - skip_end_bytes,
+                             whole_grain + skip_end_bytes, 0);
         if (ret < 0) {
             ret = VMDK_ERROR;
             goto exit;
@@ -1491,23 +1491,23 @@ static int coroutine_fn vmdk_L2update(VmdkExtent *extent, VmdkMetaData *m_data,
     offset = cpu_to_le32(offset);
     /* update L2 table */
     BLKDBG_EVENT(extent->file, BLKDBG_L2_UPDATE);
-    if (bdrv_pwrite(extent->file,
-                ((int64_t)m_data->l2_offset * 512)
-                    + (m_data->l2_index * sizeof(offset)),
-                sizeof(offset), &offset, 0) < 0) {
+    if (bdrv_co_pwrite(extent->file,
+                       ((int64_t)m_data->l2_offset * 512)
+                           + (m_data->l2_index * sizeof(offset)),
+                       sizeof(offset), &offset, 0) < 0) {
         return VMDK_ERROR;
     }
     /* update backup L2 table */
     if (extent->l1_backup_table_offset != 0) {
         m_data->l2_offset = extent->l1_backup_table[m_data->l1_index];
-        if (bdrv_pwrite(extent->file,
-                    ((int64_t)m_data->l2_offset * 512)
-                        + (m_data->l2_index * sizeof(offset)),
-                    sizeof(offset), &offset, 0) < 0) {
+        if (bdrv_co_pwrite(extent->file,
+                           ((int64_t)m_data->l2_offset * 512)
+                               + (m_data->l2_index * sizeof(offset)),
+                           sizeof(offset), &offset, 0) < 0) {
             return VMDK_ERROR;
         }
     }
-    if (bdrv_flush(extent->file->bs) < 0) {
+    if (bdrv_co_flush(extent->file->bs) < 0) {
         return VMDK_ERROR;
     }
     if (m_data->l2_cache_entry) {
@@ -1624,12 +1624,11 @@ static int coroutine_fn get_cluster_offset(BlockDriverState *bs,
     }
     l2_table = (char *)extent->l2_cache + (min_index * l2_size_bytes);
     BLKDBG_EVENT(extent->file, BLKDBG_L2_LOAD);
-    if (bdrv_pread(extent->file,
+    if (bdrv_co_pread(extent->file,
                 (int64_t)l2_offset * 512,
                 l2_size_bytes,
-                l2_table,
-                0
-            ) < 0) {
+                l2_table, 0
+            ) != l2_size_bytes) {
         return VMDK_ERROR;
     }
 
@@ -1899,7 +1898,8 @@ vmdk_read_extent(VmdkExtent *extent, int64_t cluster_offset,
     cluster_buf = g_malloc(buf_bytes);
     uncomp_buf = g_malloc(cluster_bytes);
     BLKDBG_EVENT(extent->file, BLKDBG_READ_COMPRESSED);
-    ret = bdrv_pread(extent->file, cluster_offset, buf_bytes, cluster_buf, 0);
+    ret = bdrv_co_pread(extent->file, cluster_offset, buf_bytes, cluster_buf,
+                        0);
     if (ret < 0) {
         goto out;
     }
@@ -2144,8 +2144,8 @@ vmdk_co_pwritev_compressed(BlockDriverState *bs, int64_t offset, int64_t bytes,
                 return length;
             }
             length = QEMU_ALIGN_UP(length, BDRV_SECTOR_SIZE);
-            ret = bdrv_truncate(s->extents[i].file, length, false,
-                                PREALLOC_MODE_OFF, 0, NULL);
+            ret = bdrv_co_truncate(s->extents[i].file, length, false,
+                                   PREALLOC_MODE_OFF, 0, NULL);
             if (ret < 0) {
                 return ret;
             }
@@ -2586,7 +2586,7 @@ static int coroutine_fn vmdk_co_do_create(int64_t size,
         desc_offset = 0x200;
     }
 
-    ret = blk_pwrite(blk, desc_offset, desc_len, desc, 0);
+    ret = blk_co_pwrite(blk, desc_offset, desc_len, desc, 0);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "Could not write description");
         goto exit;
@@ -2594,7 +2594,7 @@ static int coroutine_fn vmdk_co_do_create(int64_t size,
     /* bdrv_pwrite write padding zeros to align to sector, we don't need that
      * for description file */
     if (desc_offset == 0) {
-        ret = blk_truncate(blk, desc_len, false, PREALLOC_MODE_OFF, 0, errp);
+        ret = blk_co_truncate(blk, desc_len, false, PREALLOC_MODE_OFF, 0, errp);
         if (ret < 0) {
             goto exit;
         }
-- 
2.37.3



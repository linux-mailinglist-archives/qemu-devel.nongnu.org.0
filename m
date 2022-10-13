Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F6A5FDB02
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 15:37:29 +0200 (CEST)
Received: from localhost ([::1]:38624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiyOu-0006Pl-M1
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 09:37:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixUD-0001rA-RV
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:38:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixUA-0004H0-6E
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:38:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665664689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MHo7TuLTz9SaSlDT6txPvAlHHfwUvgMcfup0alXXTqM=;
 b=BQTpXpiHbEaxXskaDiCxM0IiM0D+n1HZveYYQyMunKu9kUFGa6kLEZQA0zq0Q9hnGbfNLk
 qM8SzrFZAt2my6PxsajNhh44I2n0XTW7F+IUOX1PttjQlgVY1jYoVR6my1NWSlRXTDrfqR
 KFMWlaKvjohNE8oe1eaGw3XeyTohhu8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-206-K1p1y81CP72Q-5N1vLfOSA-1; Thu, 13 Oct 2022 08:38:08 -0400
X-MC-Unique: K1p1y81CP72Q-5N1vLfOSA-1
Received: by mail-ej1-f69.google.com with SMTP id
 hd11-20020a170907968b00b0078df60485fdso836340ejc.17
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 05:38:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MHo7TuLTz9SaSlDT6txPvAlHHfwUvgMcfup0alXXTqM=;
 b=lED5u/ecu6/PeqddWR5fJBjDt0zdZPelydfDwGGT6P94Dg43hKfKB+m59rjIbajgok
 QYPxqnV9BAKrH0ihg4XifmH8k7fl3ZSorGWuN4g0Nq+0Wn2VvvvKfo4sJCd7cT8vHCoR
 GI54Ze/kpoP3bUTdsFGutGbY/5diAhN2fvn+x35ItKS65ooU03PLPGA1sc9H7G9E2Alk
 qFztrtYynwM6SxwrflNZPMjMc3hm7NJGfw1s+iAMjj8x8wmV7VSyKDRN5OnK8TuuGPMd
 FwTyrwZFX4PFbbAz2CI9WQupopVtdpUV2283KkFdEAskpLiuJb+JxNyagsWSIie+ODVE
 050w==
X-Gm-Message-State: ACrzQf3EMd1Dmf1LWr/CQzUjHwafeX9ogXR4aGi+G0McjuMo/xiYpql+
 Q2mVB3tj/wQcYXoRLmxwzhZ2Ytp+C6eROuXVEdUci/C1VxxbQX/UV1M9PYQjc5r9wGd98Wg+lpX
 lEiEf3n70xQJI1/jZcJtIQ4bV0tsSh660vt7QMsfxe8RixITnvhyNTxr+a2wf0RZOswI=
X-Received: by 2002:aa7:cd4f:0:b0:458:6077:c3ac with SMTP id
 v15-20020aa7cd4f000000b004586077c3acmr31897849edw.32.1665664686304; 
 Thu, 13 Oct 2022 05:38:06 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7X29K2btmwPZhZVOy4dNrh/pvfTm+Bd9rf8UWtazNOTpvg+SXp74wEAYpJAZkH28q6hfdKtA==
X-Received: by 2002:aa7:cd4f:0:b0:458:6077:c3ac with SMTP id
 v15-20020aa7cd4f000000b004586077c3acmr31897819edw.32.1665664686025; 
 Thu, 13 Oct 2022 05:38:06 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a1709067d8100b0078d957e65b6sm2985794ejo.23.2022.10.13.05.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 05:38:05 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	afaria@redhat.com
Subject: [PATCH 18/24] qcow: switch to *_co_* functions
Date: Thu, 13 Oct 2022 14:37:05 +0200
Message-Id: <20221013123711.620631-19-pbonzini@redhat.com>
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
 block/qcow.c | 44 ++++++++++++++++++++++----------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/block/qcow.c b/block/qcow.c
index 7f07c00c0f..133705f4ff 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -381,9 +381,9 @@ static int coroutine_fn get_cluster_offset(BlockDriverState *bs,
         s->l1_table[l1_index] = l2_offset;
         tmp = cpu_to_be64(l2_offset);
         BLKDBG_EVENT(bs->file, BLKDBG_L1_UPDATE);
-        ret = bdrv_pwrite_sync(bs->file,
-                               s->l1_table_offset + l1_index * sizeof(tmp),
-                               sizeof(tmp), &tmp, 0);
+        ret = bdrv_co_pwrite_sync(bs->file,
+                                  s->l1_table_offset + l1_index * sizeof(tmp),
+                                  sizeof(tmp), &tmp, 0);
         if (ret < 0) {
             return ret;
         }
@@ -414,14 +414,14 @@ static int coroutine_fn get_cluster_offset(BlockDriverState *bs,
     BLKDBG_EVENT(bs->file, BLKDBG_L2_LOAD);
     if (new_l2_table) {
         memset(l2_table, 0, s->l2_size * sizeof(uint64_t));
-        ret = bdrv_pwrite_sync(bs->file, l2_offset,
-                               s->l2_size * sizeof(uint64_t), l2_table, 0);
+        ret = bdrv_co_pwrite_sync(bs->file, l2_offset,
+                                  s->l2_size * sizeof(uint64_t), l2_table, 0);
         if (ret < 0) {
             return ret;
         }
     } else {
-        ret = bdrv_pread(bs->file, l2_offset, s->l2_size * sizeof(uint64_t),
-                         l2_table, 0);
+        ret = bdrv_co_pread(bs->file, l2_offset,
+                            s->l2_size * sizeof(uint64_t), l2_table, 0);
         if (ret < 0) {
             return ret;
         }
@@ -453,8 +453,8 @@ static int coroutine_fn get_cluster_offset(BlockDriverState *bs,
             cluster_offset = QEMU_ALIGN_UP(cluster_offset, s->cluster_size);
             /* write the cluster content */
             BLKDBG_EVENT(bs->file, BLKDBG_WRITE_AIO);
-            ret = bdrv_pwrite(bs->file, cluster_offset, s->cluster_size,
-                              s->cluster_cache, 0);
+            ret = bdrv_co_pwrite(bs->file, cluster_offset, s->cluster_size,
+                                 s->cluster_cache, 0);
             if (ret < 0) {
                 return ret;
             }
@@ -469,8 +469,8 @@ static int coroutine_fn get_cluster_offset(BlockDriverState *bs,
                 if (cluster_offset + s->cluster_size > INT64_MAX) {
                     return -E2BIG;
                 }
-                ret = bdrv_truncate(bs->file, cluster_offset + s->cluster_size,
-                                    false, PREALLOC_MODE_OFF, 0, NULL);
+                ret = bdrv_co_truncate(bs->file, cluster_offset + s->cluster_size,
+                                       false, PREALLOC_MODE_OFF, 0, NULL);
                 if (ret < 0) {
                     return ret;
                 }
@@ -492,9 +492,9 @@ static int coroutine_fn get_cluster_offset(BlockDriverState *bs,
                                 return -EIO;
                             }
                             BLKDBG_EVENT(bs->file, BLKDBG_WRITE_AIO);
-                            ret = bdrv_pwrite(bs->file, cluster_offset + i,
-                                              BDRV_SECTOR_SIZE,
-                                              s->cluster_data, 0);
+                            ret = bdrv_co_pwrite(bs->file, cluster_offset + i,
+                                                 BDRV_SECTOR_SIZE,
+                                                 s->cluster_data, 0);
                             if (ret < 0) {
                                 return ret;
                             }
@@ -514,8 +514,8 @@ static int coroutine_fn get_cluster_offset(BlockDriverState *bs,
         } else {
             BLKDBG_EVENT(bs->file, BLKDBG_L2_UPDATE);
         }
-        ret = bdrv_pwrite_sync(bs->file, l2_offset + l2_index * sizeof(tmp),
-                               sizeof(tmp), &tmp, 0);
+        ret = bdrv_co_pwrite_sync(bs->file, l2_offset + l2_index * sizeof(tmp),
+                                  sizeof(tmp), &tmp, 0);
         if (ret < 0) {
             return ret;
         }
@@ -596,7 +596,7 @@ static int coroutine_fn decompress_cluster(BlockDriverState *bs, uint64_t cluste
         csize = cluster_offset >> (63 - s->cluster_bits);
         csize &= (s->cluster_size - 1);
         BLKDBG_EVENT(bs->file, BLKDBG_READ_COMPRESSED);
-        ret = bdrv_pread(bs->file, coffset, csize, s->cluster_data, 0);
+        ret = bdrv_co_pread(bs->file, coffset, csize, s->cluster_data, 0);
         if (ret < 0)
             return -1;
         if (decompress_buffer(s->cluster_cache, s->cluster_size,
@@ -890,14 +890,14 @@ static int coroutine_fn qcow_co_create(BlockdevCreateOptions *opts,
     }
 
     /* write all the data */
-    ret = blk_pwrite(qcow_blk, 0, sizeof(header), &header, 0);
+    ret = blk_co_pwrite(qcow_blk, 0, sizeof(header), &header, 0);
     if (ret < 0) {
         goto exit;
     }
 
     if (qcow_opts->has_backing_file) {
-        ret = blk_pwrite(qcow_blk, sizeof(header), backing_filename_len,
-                         qcow_opts->backing_file, 0);
+        ret = blk_co_pwrite(qcow_blk, sizeof(header), backing_filename_len,
+                            qcow_opts->backing_file, 0);
         if (ret < 0) {
             goto exit;
         }
@@ -906,8 +906,8 @@ static int coroutine_fn qcow_co_create(BlockdevCreateOptions *opts,
     tmp = g_malloc0(BDRV_SECTOR_SIZE);
     for (i = 0; i < DIV_ROUND_UP(sizeof(uint64_t) * l1_size, BDRV_SECTOR_SIZE);
          i++) {
-        ret = blk_pwrite(qcow_blk, header_size + BDRV_SECTOR_SIZE * i,
-                         BDRV_SECTOR_SIZE, tmp, 0);
+        ret = blk_co_pwrite(qcow_blk, header_size + BDRV_SECTOR_SIZE * i,
+                            BDRV_SECTOR_SIZE, tmp, 0);
         if (ret < 0) {
             g_free(tmp);
             goto exit;
-- 
2.37.3



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2C55FD9DD
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 15:06:08 +0200 (CEST)
Received: from localhost ([::1]:58282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oixuZ-0003pk-39
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 09:06:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixU0-0001ih-Vi
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:38:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixTi-0004HU-JS
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:38:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665664698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oNFx5/K1a3V3pRYlIt3h1gVdlhsBpwN6ccrfN2/Fbao=;
 b=X29Zzn3MBOzfmoqopalECKZIvbF7IT4xYQtUcj/RciIbtyNG0AUaUPRjBfnCC2IWAmTWFJ
 Z9DKO/a5RArBIIzaoVqK0VVshSoLAntS+nCZ6gLLL4BV47sZ2d4spBG7zUQlWNIakOnuZW
 hUqNMQm6V6WZYjP/zoiWilc8PlZ6R6o=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-594-DLprlRHCM9iLnKJeK7mbrg-1; Thu, 13 Oct 2022 08:38:17 -0400
X-MC-Unique: DLprlRHCM9iLnKJeK7mbrg-1
Received: by mail-ed1-f69.google.com with SMTP id
 y6-20020a056402358600b0045932521633so1418172edc.17
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 05:38:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oNFx5/K1a3V3pRYlIt3h1gVdlhsBpwN6ccrfN2/Fbao=;
 b=ViAqlOVQQAn5co9qVhx2/aRODTLW1y3VwheBTNDExXr1Z2uEDyIlgVy+iKKgPH+FOO
 QG40Ly339f/ORr3q7BDIz4xVmBLf9Vycjmo5IG9ls71f2Q6r6asqckKSb3WwwxqFFKqq
 gKjHD827jDOhJru6oAEt9gYO75XJ+529ILgmlw4uQ+pt1RJz78toW1UgJ4iB4JBIsUL0
 fwEZ0u7zBzzy6PRdx1McewiUEdnAher1bG0H9jgBYupDlAj8ifkfP5wvkH4adPUUf+K2
 3DyhOJn3ByzCZrWQ2ifzt7+HVz5/ac8pm5hc+9Ydy4RrU9HekBsoZiNvNqHnxi3l7FZP
 XPIA==
X-Gm-Message-State: ACrzQf1pSWb/3VpCKG3fYpqGy9fdZhqQhXksLthNJbGNLu7zT9Z2Iyw4
 Zefl3o0WpQrz/wfndgH+mMOnV8K39/8BZ89dS3LdJupoOQwXKssfyTKjDB+8ggHMPCMMGQBt8bc
 y/eIbwOFZ16PE29186V/l5Myg1hNsHp5jza/tNkM/RKnPWqayswBoOTkvmxe8/c11Ocs=
X-Received: by 2002:a17:907:3e96:b0:78d:f399:57e3 with SMTP id
 hs22-20020a1709073e9600b0078df39957e3mr6102725ejc.699.1665664695392; 
 Thu, 13 Oct 2022 05:38:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5zyqZAaOmlnScIFVLtMPH0qwwI/oiXdo0YCn1eMxyFzmZb3SiNPFx0MGgWxeImgFIfkeTs1g==
X-Received: by 2002:a17:907:3e96:b0:78d:f399:57e3 with SMTP id
 hs22-20020a1709073e9600b0078df39957e3mr6102704ejc.699.1665664695035; 
 Thu, 13 Oct 2022 05:38:15 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 gc22-20020a1709072b1600b0078cf8a743d6sm2918473ejc.100.2022.10.13.05.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 05:38:14 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	afaria@redhat.com
Subject: [PATCH 21/24] vdi: switch to *_co_* functions
Date: Thu, 13 Oct 2022 14:37:08 +0200
Message-Id: <20221013123711.620631-22-pbonzini@redhat.com>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 block/vdi.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/block/vdi.c b/block/vdi.c
index e942325455..2ecf47216a 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -664,7 +664,8 @@ vdi_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
              * so this full-cluster write does not overlap a partial write
              * of the same cluster, issued from the "else" branch.
              */
-            ret = bdrv_pwrite(bs->file, data_offset, s->block_size, block, 0);
+            ret = bdrv_co_pwrite(bs->file, data_offset, s->block_size, block,
+                                 0);
             qemu_co_rwlock_unlock(&s->bmap_lock);
         } else {
 nonallocating_write:
@@ -709,7 +710,7 @@ nonallocating_write:
         assert(VDI_IS_ALLOCATED(bmap_first));
         *header = s->header;
         vdi_header_to_le(header);
-        ret = bdrv_pwrite(bs->file, 0, sizeof(*header), header, 0);
+        ret = bdrv_co_pwrite(bs->file, 0, sizeof(*header), header, 0);
         g_free(header);
 
         if (ret < 0) {
@@ -726,8 +727,8 @@ nonallocating_write:
         base = ((uint8_t *)&s->bmap[0]) + bmap_first * SECTOR_SIZE;
         logout("will write %u block map sectors starting from entry %u\n",
                n_sectors, bmap_first);
-        ret = bdrv_pwrite(bs->file, offset * SECTOR_SIZE,
-                          n_sectors * SECTOR_SIZE, base, 0);
+        ret = bdrv_co_pwrite(bs->file, offset * SECTOR_SIZE,
+                             n_sectors * SECTOR_SIZE, base, 0);
     }
 
     return ret;
@@ -845,7 +846,7 @@ static int coroutine_fn vdi_co_do_create(BlockdevCreateOptions *create_options,
         vdi_header_print(&header);
     }
     vdi_header_to_le(&header);
-    ret = blk_pwrite(blk, offset, sizeof(header), &header, 0);
+    ret = blk_co_pwrite(blk, offset, sizeof(header), &header, 0);
     if (ret < 0) {
         error_setg(errp, "Error writing header");
         goto exit;
@@ -866,7 +867,7 @@ static int coroutine_fn vdi_co_do_create(BlockdevCreateOptions *create_options,
                 bmap[i] = VDI_UNALLOCATED;
             }
         }
-        ret = blk_pwrite(blk, offset, bmap_size, bmap, 0);
+        ret = blk_co_pwrite(blk, offset, bmap_size, bmap, 0);
         if (ret < 0) {
             error_setg(errp, "Error writing bmap");
             goto exit;
@@ -875,8 +876,8 @@ static int coroutine_fn vdi_co_do_create(BlockdevCreateOptions *create_options,
     }
 
     if (image_type == VDI_TYPE_STATIC) {
-        ret = blk_truncate(blk, offset + blocks * block_size, false,
-                           PREALLOC_MODE_OFF, 0, errp);
+        ret = blk_co_truncate(blk, offset + blocks * block_size, false,
+                              PREALLOC_MODE_OFF, 0, errp);
         if (ret < 0) {
             error_prepend(errp, "Failed to statically allocate file");
             goto exit;
-- 
2.37.3



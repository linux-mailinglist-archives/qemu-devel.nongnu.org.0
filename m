Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5DF5FDB1F
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 15:40:56 +0200 (CEST)
Received: from localhost ([::1]:53922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiySF-00038B-Bc
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 09:40:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixUM-0001v5-Rv
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:39:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixU8-0004HN-5P
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:39:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665664694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oMZDgsaYj80/GJ1HJPhUO0ubRRXW6pZjfvysmi70baU=;
 b=W51rzSiDD0PrHL/WiAumdePQrDCrJKmo81eM2jPky+1nVWueo1g2DqHTuGKmuJKZQ+J/SF
 JZVkZPMNMC46YRi5mg9I7jEQL/9AGJi4nA2vFhllJeZIWs0i6t7XJXJXGPVxin3CDZTpP+
 43+vdRKW01avDJ2aJ7BXWvc0+E/3H8E=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-633--XXxbNyqNwuf7MUMC_n50w-1; Thu, 13 Oct 2022 08:38:13 -0400
X-MC-Unique: -XXxbNyqNwuf7MUMC_n50w-1
Received: by mail-ed1-f69.google.com with SMTP id
 f16-20020a0564021e9000b0045beb029117so1408471edf.12
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 05:38:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oMZDgsaYj80/GJ1HJPhUO0ubRRXW6pZjfvysmi70baU=;
 b=R8/DI/crCnAIXJyX3cppd+zQoJ3Q2GcDNFMp07YZU1JZt5CZFelCdAcAP4qJDSLQBU
 vcE9e+nhONLrQJrG2TbY1BXwkQOfTfLS8fjCnYTQnMWXNCotRJ0d792d9t0purX/XwGP
 6t0ZD/h46f5UXm0gTDj/iywQJWBgevx5IZnt/7PfZsNWIWdT2Zhjs5uRS8JOEwPvE7i3
 AH01OIVtCpv5r35YpmqXn376vZ7yDAKj7wKlWG0dpGZeLAti57HJ1lRPMYUbZkstAFhB
 O/BfCKipNEcPikd+C+OvO1/nkHYzlzj9T5UQyx0L4cxqEJJuEPW/JofHLpnI47gCHysL
 VjwA==
X-Gm-Message-State: ACrzQf0mFuXl4A4LhhmuMV9jemKojhLPm4JkyO43/+r9/qxp2P+tCKaY
 Hl2Z0FrDppcmzdaDbxnu3OUR6ry3u45dMFqiAv6lM2ncU3WBBNkxlPAzS8+TCLWiSn4L7P7SuJT
 79Nuj/3a2DLrS/7kO2gzbvFAz3zIqx2p36M9cR5heOC1gSWUZLOevWd0CIhTlUU9zx5E=
X-Received: by 2002:a17:907:70a:b0:741:78ab:dce5 with SMTP id
 xb10-20020a170907070a00b0074178abdce5mr26660393ejb.527.1665664692187; 
 Thu, 13 Oct 2022 05:38:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4poz8zoqYdZt33SNWW2wX2J/cIxigh11g9bCg6I7EX/fJTLlIdM6aLCr4q4A+6gqFKLzC5vQ==
X-Received: by 2002:a17:907:70a:b0:741:78ab:dce5 with SMTP id
 xb10-20020a170907070a00b0074178abdce5mr26660373ejb.527.1665664691940; 
 Thu, 13 Oct 2022 05:38:11 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a170906314b00b0073ddb2eff27sm2928911eje.167.2022.10.13.05.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 05:38:11 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	afaria@redhat.com
Subject: [PATCH 20/24] qed: switch to *_co_* functions
Date: Thu, 13 Oct 2022 14:37:07 +0200
Message-Id: <20221013123711.620631-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013123711.620631-1-pbonzini@redhat.com>
References: <20221013123711.620631-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 block/qed-table.c |  2 +-
 block/qed.c       | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/block/qed-table.c b/block/qed-table.c
index 1cc844b1a5..aa203f2627 100644
--- a/block/qed-table.c
+++ b/block/qed-table.c
@@ -100,7 +100,7 @@ static int coroutine_fn qed_write_table(BDRVQEDState *s, uint64_t offset,
     }
 
     if (flush) {
-        ret = bdrv_flush(s->bs);
+        ret = bdrv_co_flush(s->bs);
         if (ret < 0) {
             goto out;
         }
diff --git a/block/qed.c b/block/qed.c
index bda00e6257..90682f7a15 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -387,7 +387,7 @@ static int coroutine_fn bdrv_qed_do_open(BlockDriverState *bs, QDict *options,
     int64_t file_size;
     int ret;
 
-    ret = bdrv_pread(bs->file, 0, sizeof(le_header), &le_header, 0);
+    ret = bdrv_co_pread(bs->file, 0, sizeof(le_header), &le_header, 0);
     if (ret < 0) {
         error_setg(errp, "Failed to read QED header");
         return ret;
@@ -492,7 +492,7 @@ static int coroutine_fn bdrv_qed_do_open(BlockDriverState *bs, QDict *options,
         }
 
         /* From here on only known autoclear feature bits are valid */
-        bdrv_flush(bs->file->bs);
+        bdrv_co_flush(bs->file->bs);
     }
 
     s->l1_table = qed_alloc_table(s);
@@ -693,7 +693,7 @@ static int coroutine_fn bdrv_qed_co_create(BlockdevCreateOptions *opts,
      * The QED format associates file length with allocation status,
      * so a new file (which is empty) must have a length of 0.
      */
-    ret = blk_truncate(blk, 0, true, PREALLOC_MODE_OFF, 0, errp);
+    ret = blk_co_truncate(blk, 0, true, PREALLOC_MODE_OFF, 0, errp);
     if (ret < 0) {
         goto out;
     }
@@ -712,18 +712,18 @@ static int coroutine_fn bdrv_qed_co_create(BlockdevCreateOptions *opts,
     }
 
     qed_header_cpu_to_le(&header, &le_header);
-    ret = blk_pwrite(blk, 0, sizeof(le_header), &le_header, 0);
+    ret = blk_co_pwrite(blk, 0, sizeof(le_header), &le_header, 0);
     if (ret < 0) {
         goto out;
     }
-    ret = blk_pwrite(blk, sizeof(le_header), header.backing_filename_size,
+    ret = blk_co_pwrite(blk, sizeof(le_header), header.backing_filename_size,
                      qed_opts->backing_file, 0);
     if (ret < 0) {
         goto out;
     }
 
     l1_table = g_malloc0(l1_size);
-    ret = blk_pwrite(blk, header.l1_table_offset, l1_size, l1_table, 0);
+    ret = blk_co_pwrite(blk, header.l1_table_offset, l1_size, l1_table, 0);
     if (ret < 0) {
         goto out;
     }
-- 
2.37.3



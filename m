Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4015BF27C
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 02:55:08 +0200 (CEST)
Received: from localhost ([::1]:36020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oao15-0003vf-A2
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 20:55:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oam5G-0003tf-Ln
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 18:51:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oam5F-0001RJ-20
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 18:51:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663714276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MpBYvfeGYvDWgqyMt+UF+aJyk6vZBNjle9m84bxLNX4=;
 b=DnLr3/nFOviYaXXUZcP+4xXIri8vKS9NMNpLsbZ2LTGFGNQb1f2yEG5bPtdLjdmVPqwKhD
 KZP5+6ls3KTlk73QFuUhfSi3wikSAGx7+p71KXPmyCVRd4PNPzebxdsOFDR2ibPTbA712z
 o3L0OzVgAq/+neebsP52gwc9D1cSFaw=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-646-FqbBpovCM2SK9_b_58lqWw-1; Tue, 20 Sep 2022 18:51:15 -0400
X-MC-Unique: FqbBpovCM2SK9_b_58lqWw-1
Received: by mail-qv1-f70.google.com with SMTP id
 m7-20020a0ce6e7000000b004ad69308f01so902540qvn.9
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 15:51:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=MpBYvfeGYvDWgqyMt+UF+aJyk6vZBNjle9m84bxLNX4=;
 b=hoybOAJ8JWXp736rTuOjK1I6q8G6U99ntiNPeGC2Q/rfwHRVNCgZOqSMHNGxNO4K9z
 gKeRKo9ev2e3+w0cZg8gGyXZfLphUN7A/9NglsYxlBB8b6bV31ryrz0uruLnRtaN+nEd
 E2NGHkHen7zpw1IXZ5RPVpUzLrOkJCRigwptXLeMEmH4NpH0vL6DxBX5uAKW8XIUNU/5
 Yy9Qv1i0VznbIb35+Fqpf3SwNZfIbhwRPHI8VSvSqJgOzG/iroKnNe7opzQyvM/ZCbgp
 1ldFDqBRZA5ISXxqnsD0HUTrl6xfnml+wYVE2rvZRtj0F0zM2ZQzpdH6DeZqD6z3ff7Q
 2IQw==
X-Gm-Message-State: ACrzQf0JzJcpACDhVL8VQmB2ZR0AtecrPDH88A3Pusgzn9j7HpYX4obx
 7YOV4Q2kaOlfx8AWj+b3KRgNnnvzDMpg3Dg7YUWg4r8hkmM6Z9LwsNgXilOy+lJClfTBNwOy4k1
 8hBkg6uS9xOLez6Eqo12eYrq9RyjnUqSgQKkIO/rWBclehtMGnaF1ZVjfOTx+TcmQ
X-Received: by 2002:a05:620a:7f2:b0:6ce:b70b:7d63 with SMTP id
 k18-20020a05620a07f200b006ceb70b7d63mr17700871qkk.770.1663714274097; 
 Tue, 20 Sep 2022 15:51:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4M2xUdjJeQK3N5flhmh8c8T3sswvNHuESWoByw2Y/CnkXt/nFq9WZ3AQcnWpdNgG5XBj5JKQ==
X-Received: by 2002:a05:620a:7f2:b0:6ce:b70b:7d63 with SMTP id
 k18-20020a05620a07f200b006ceb70b7d63mr17700856qkk.770.1663714273813; 
 Tue, 20 Sep 2022 15:51:13 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 j12-20020ac8440c000000b0035d0655b079sm275470qtn.30.2022.09.20.15.51.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Sep 2022 15:51:13 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, ani@anisinha.ca,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH 04/14] migration: Remove RAMState.f references in compression
 code
Date: Tue, 20 Sep 2022 18:50:56 -0400
Message-Id: <20220920225106.48451-5-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220920225106.48451-1-peterx@redhat.com>
References: <20220920225106.48451-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Removing referencing to RAMState.f in compress_page_with_multi_thread() and
flush_compressed_data().

Compression code by default isn't compatible with having >1 channels (or it
won't currently know which channel to flush the compressed data), so to
make it simple we always flush on the default to_dst_file port until
someone wants to add >1 ports support, as rs->f right now can really
change (after postcopy preempt is introduced).

There should be no functional change at all after patch applied, since as
long as rs->f referenced in compression code, it must be to_dst_file.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 62ff2c1469..8303252b6d 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1461,6 +1461,7 @@ static bool save_page_use_compression(RAMState *rs);
 
 static void flush_compressed_data(RAMState *rs)
 {
+    MigrationState *ms = migrate_get_current();
     int idx, len, thread_count;
 
     if (!save_page_use_compression(rs)) {
@@ -1479,7 +1480,7 @@ static void flush_compressed_data(RAMState *rs)
     for (idx = 0; idx < thread_count; idx++) {
         qemu_mutex_lock(&comp_param[idx].mutex);
         if (!comp_param[idx].quit) {
-            len = qemu_put_qemu_file(rs->f, comp_param[idx].file);
+            len = qemu_put_qemu_file(ms->to_dst_file, comp_param[idx].file);
             /*
              * it's safe to fetch zero_page without holding comp_done_lock
              * as there is no further request submitted to the thread,
@@ -1498,11 +1499,11 @@ static inline void set_compress_params(CompressParam *param, RAMBlock *block,
     param->offset = offset;
 }
 
-static int compress_page_with_multi_thread(RAMState *rs, RAMBlock *block,
-                                           ram_addr_t offset)
+static int compress_page_with_multi_thread(RAMBlock *block, ram_addr_t offset)
 {
     int idx, thread_count, bytes_xmit = -1, pages = -1;
     bool wait = migrate_compress_wait_thread();
+    MigrationState *ms = migrate_get_current();
 
     thread_count = migrate_compress_threads();
     qemu_mutex_lock(&comp_done_lock);
@@ -1510,7 +1511,8 @@ retry:
     for (idx = 0; idx < thread_count; idx++) {
         if (comp_param[idx].done) {
             comp_param[idx].done = false;
-            bytes_xmit = qemu_put_qemu_file(rs->f, comp_param[idx].file);
+            bytes_xmit = qemu_put_qemu_file(ms->to_dst_file,
+                                            comp_param[idx].file);
             qemu_mutex_lock(&comp_param[idx].mutex);
             set_compress_params(&comp_param[idx], block, offset);
             qemu_cond_signal(&comp_param[idx].cond);
@@ -2263,7 +2265,7 @@ static bool save_compress_page(RAMState *rs, RAMBlock *block, ram_addr_t offset)
         return false;
     }
 
-    if (compress_page_with_multi_thread(rs, block, offset) > 0) {
+    if (compress_page_with_multi_thread(block, offset) > 0) {
         return true;
     }
 
-- 
2.32.0



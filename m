Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF985A52E1
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 19:14:42 +0200 (CEST)
Received: from localhost ([::1]:39056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSiLR-0003dO-7x
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 13:14:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oSi4d-0002eh-9J
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 12:57:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oSi4a-0008Ge-Gq
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 12:57:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661792236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5MPDuDAfLazs+SShwtUZHPzu/djfRVD6rIJwUkAwzK0=;
 b=XbBvJowBs2hBN/nAjjQXmsz11yRc7f3jgtLf/qO+Ds4ePVGUqy4+0PRKGNkN6hpuOti0L9
 arLiYu1frjPE2aYRhGvRDfx2i8JR0UChmF9H8+3sc5PPFfnksX4/oHfGFs8vMI64M8ZyLO
 aEbYI/WkqrkoG1kts7BajSxG3OYklSU=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-593-10nPmsApNhm3h4PfYLuQZg-1; Mon, 29 Aug 2022 12:57:14 -0400
X-MC-Unique: 10nPmsApNhm3h4PfYLuQZg-1
Received: by mail-io1-f70.google.com with SMTP id
 z4-20020a6b0a04000000b006887f66dcf3so5038026ioi.18
 for <qemu-devel@nongnu.org>; Mon, 29 Aug 2022 09:57:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=5MPDuDAfLazs+SShwtUZHPzu/djfRVD6rIJwUkAwzK0=;
 b=J9SeqH0Rd7dDbSdTXrwysECAFsOqDP0nccUs9xE4vElqC8RX+eWgUhTnW8EtUO3EeC
 CloddIDfnY3z+5pAslQqN72mzibfSDyX0QfB5kcpVz/5Ekag+OWVCCZk01v6UWh0xtDj
 2JQ6Kzv8xe1116IewRagSd3Vwb5mo7PmEj7LFq8gVbhq2tHdNpiSjcoIv0JjVKn3Rv9X
 Unt1irMR5IdJ2O+nzJzrECqe3hzYIL79c0oDMLwLNMkQ4HTXV4ogD19AZpBlN8TCTbeX
 nv90ENVnbim73/tgkBunRLkwN39HVunGOXr8UgVtlfSD3xIG9DfPLcenn6EyOjWAcaFf
 gP7g==
X-Gm-Message-State: ACgBeo1qLjk6eJCfDTGvJ6EttBFCgCNWJ4x/zcM/l3kulkAWsUDRZIsZ
 KfKWAW/Z+eUnUbcZadPgwOaiPAQ2X5/jgTVOhyhdd1NdUAo9oiXlMrpvhFhx5VAPS7E6RholrdQ
 6DbtO1FG8Gq6UkJu2o6EU2jxUZ57fZ+VNxYciyN4DPQcvQLoQeEuYjZVZPrmXyWgF
X-Received: by 2002:a05:6e02:1b0e:b0:2df:67ee:beaf with SMTP id
 i14-20020a056e021b0e00b002df67eebeafmr10322925ilv.239.1661792233641; 
 Mon, 29 Aug 2022 09:57:13 -0700 (PDT)
X-Google-Smtp-Source: AA6agR77DiEzvs7+Op41R/uOxfDpXjipVh/6DiDFTk+c16TsZi4HAJzJjoMVG/qPhvClsr0QuWxTMQ==
X-Received: by 2002:a05:6e02:1b0e:b0:2df:67ee:beaf with SMTP id
 i14-20020a056e021b0e00b002df67eebeafmr10322910ilv.239.1661792233370; 
 Mon, 29 Aug 2022 09:57:13 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
 by smtp.gmail.com with ESMTPSA id
 y9-20020a056638228900b00344c3de5ec7sm4404709jas.150.2022.08.29.09.57.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 29 Aug 2022 09:57:12 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com
Subject: [PATCH RFC 07/13] migration: Remove RAMState.f references in
 compression code
Date: Mon, 29 Aug 2022 12:56:53 -0400
Message-Id: <20220829165659.96046-8-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220829165659.96046-1-peterx@redhat.com>
References: <20220829165659.96046-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
index 43893d0a40..2f37520be4 100644
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



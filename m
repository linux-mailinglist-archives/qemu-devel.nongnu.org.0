Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 653BA5FBDB7
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 00:14:40 +0200 (CEST)
Received: from localhost ([::1]:47432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiNWJ-00086P-GG
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 18:14:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oiNET-0001cZ-24
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 17:56:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oiNER-0003Va-Ew
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 17:56:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665525370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kn4M0YNPryH5ciDulBNpDt2G7aDC8JLQJ+Wg8SJYoGc=;
 b=XuBnFoMi7icTL4uNMP3TqY0R798If517J8P7gyb/ogG0tzYoPXLybAFdyNI1OGe3fRO4tV
 FFnpox5lzdn/z8x647N2GAVClK6ZvKLZLMjE+qq6r/ogSJwkqn8GCuSge9yhjeF2Kvec3v
 nX4Mg7PXGr+/PFwNOm44RfcFf0pNzQ8=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-533-x7vM62cqPI6pvtzaeuQ3KA-1; Tue, 11 Oct 2022 17:56:09 -0400
X-MC-Unique: x7vM62cqPI6pvtzaeuQ3KA-1
Received: by mail-qt1-f200.google.com with SMTP id
 n11-20020ac8674b000000b0039c9e248175so1705030qtp.14
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 14:56:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kn4M0YNPryH5ciDulBNpDt2G7aDC8JLQJ+Wg8SJYoGc=;
 b=omq2UYn3cWIwmZ9GkVhXjJLwgoIqsvcx5XMPjUUhtWa5ErAeIZEBKxaO+iQc+rq07z
 Ye97umWYxfGdi+ORTOJElN/mbBXJz8ziXsyUnkNLp8lx6y5AGij3Jv2kD4SknTHcXwre
 fB4F1eNPEQiG9TGCrNJoAiC1ZO5CA0Q9J/WPWFihmM3C6PDrSDu+35q8jCsfqjd0Oh5f
 uB7r/XI4nrjZ18NzhCf2T25KuMnQtNntYlVHFNK+9YBQIwVQrVPWihauLOZK+1nXFimr
 QIoH8gXX4yU72SL6D+veVbwHPmrmDHdyH2w5VthHq8iSgguZgCBveN/b+7X8Mgrn8Q6X
 q0IA==
X-Gm-Message-State: ACrzQf3tapZLV8FT6QJz37nEF/F2GlClrbFpgO3iiFZGKhg+TPudyb1m
 ZKgEb1xdPKTzbzMnxsfH4zQR9IKK5EGvQAEOONDnoA//Mz/uhl8RE2ATIGYHiX78zEwuTnsQKz1
 xD5JIuuI1550Fqwczqm8CdGndoJ2lSLO2H7JzE0RNIGlcTWEp6/UVY+k3AnlJldAz
X-Received: by 2002:a05:622a:83:b0:35d:44c1:e026 with SMTP id
 o3-20020a05622a008300b0035d44c1e026mr21234968qtw.298.1665525368386; 
 Tue, 11 Oct 2022 14:56:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Mn41/fpr8S/DoeL67MKZDPQyrKJ1Pfmja/ENViUp8J81Tc7FFZVPnugJ7zYI81O8nFCkJsA==
X-Received: by 2002:a05:622a:83:b0:35d:44c1:e026 with SMTP id
 o3-20020a05622a008300b0035d44c1e026mr21234946qtw.298.1665525368111; 
 Tue, 11 Oct 2022 14:56:08 -0700 (PDT)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a05620a430a00b006ce7cd81359sm13863230qko.110.2022.10.11.14.56.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 14:56:07 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, ani@anisinha.ca,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>
Subject: [PATCH v2 05/15] migration: Remove RAMState.f references in
 compression code
Date: Tue, 11 Oct 2022 17:55:49 -0400
Message-Id: <20221011215559.602584-6-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011215559.602584-1-peterx@redhat.com>
References: <20221011215559.602584-1-peterx@redhat.com>
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

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index c90feedb13..b9ac2d6921 100644
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
2.37.3



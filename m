Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E048145B7EC
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 11:00:41 +0100 (CET)
Received: from localhost ([::1]:58008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpp4y-000178-0p
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 05:00:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpozd-00023s-FT
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:55:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpoza-0004ND-Tr
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:55:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637747706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YoCZGdg8jPnZ4FJ9H5tQajzuxhFrzLy+nqeqCxQdqEQ=;
 b=SOOHmfspkf8NnTXLQMRXz6GRh0xymul3H7OqGWhO1ql8VFBzQRmZgPJ5vk94buOyhOl11m
 r6C0qIjqg6pLtDZEqN7Eeb27Ca7HzlqkSRKu+5sH9ccYxtjaolOlnflD/Rh21OCF8lU5nl
 D+x9OSwdYeijqGBlwSxxtsXdYVnXq1c=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-198-4vvFi_EPNpWfwj9VpF0a6g-1; Wed, 24 Nov 2021 04:55:05 -0500
X-MC-Unique: 4vvFi_EPNpWfwj9VpF0a6g-1
Received: by mail-wr1-f71.google.com with SMTP id
 q17-20020adfcd91000000b0017bcb12ad4fso356417wrj.12
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 01:55:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YoCZGdg8jPnZ4FJ9H5tQajzuxhFrzLy+nqeqCxQdqEQ=;
 b=u1ZT75CD+BkLHj7XZuZ9fueahadrriwf1hr1td0S9jKP6HnqKzwakSEzHkzVIxCDJV
 cu4tFVNilH64CCJtehNn+oGvc7TjAonbmd1ZenIcgwgXqGRWdt2uXSHf/arthlJCtxXx
 uK2SXRNpEgOjK4IS0JADGsifbVQegIWUhlZxdOWz+aHvPYO0B0Rb5s1Mpl+Wo3HgGCjQ
 mOiVhrNKwjHBh4PLm/8uClNrbCOzzgCNjWOstWL+Tc2ikr/Ghl7zRUOwsbHLVAqfodh4
 XVOiWkcQxgY3X2/Ko+egrjWzLBFeHpYGJD0uWKPK0Q+oCHIM/Ta4mgrCZ2PRbx5lzbKZ
 dfmg==
X-Gm-Message-State: AOAM530hl24Z5cOA+o6EUuwkOveEblyBYSLlEKLRTWzJsBMMvpWRp/Tn
 Pz+ZBayoOUhAtP+Y/1wn7PPyOCP6mlvjZNqgp+TfpjG5XPHnEZ7wHOjC2aH/GgVt7zuJwBEloWz
 1rxfCDnUfcANPJhMc264Q6ZCfJ5vVJ40wZvTJ8hJHN5WkUQkxj2HbzxTClNQZxTdfbyg=
X-Received: by 2002:a05:6000:1a8b:: with SMTP id
 f11mr16760091wry.409.1637747703366; 
 Wed, 24 Nov 2021 01:55:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwUP4JyXTugvQbAM9ogj/ClFjrrTtXRThk8x++ZRxD27vWQ4QJ6pcjeFOB4MmlaVzYAAE4uag==
X-Received: by 2002:a05:6000:1a8b:: with SMTP id
 f11mr16760026wry.409.1637747702976; 
 Wed, 24 Nov 2021 01:55:02 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id az4sm4113645wmb.20.2021.11.24.01.55.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 01:55:02 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/23] multifd: Delete useless operation
Date: Wed, 24 Nov 2021 10:54:38 +0100
Message-Id: <20211124095500.42078-2-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124095500.42078-1-quintela@redhat.com>
References: <20211124095500.42078-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Leonardo Bras <leobras@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are divining by page_size to multiply again in the only use.
Once there, impreve the comments.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd-zlib.c | 13 ++++---------
 migration/multifd-zstd.c | 13 ++++---------
 2 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
index ab4ba75d75..3fc7813b44 100644
--- a/migration/multifd-zlib.c
+++ b/migration/multifd-zlib.c
@@ -42,7 +42,6 @@ struct zlib_data {
  */
 static int zlib_send_setup(MultiFDSendParams *p, Error **errp)
 {
-    uint32_t page_count = MULTIFD_PACKET_SIZE / qemu_target_page_size();
     struct zlib_data *z = g_malloc0(sizeof(struct zlib_data));
     z_stream *zs = &z->zs;
 
@@ -54,9 +53,8 @@ static int zlib_send_setup(MultiFDSendParams *p, Error **errp)
         error_setg(errp, "multifd %d: deflate init failed", p->id);
         return -1;
     }
-    /* We will never have more than page_count pages */
-    z->zbuff_len = page_count * qemu_target_page_size();
-    z->zbuff_len *= 2;
+    /* To be safe, we reserve twice the size of the packet */
+    z->zbuff_len = MULTIFD_PACKET_SIZE * 2;
     z->zbuff = g_try_malloc(z->zbuff_len);
     if (!z->zbuff) {
         deflateEnd(&z->zs);
@@ -180,7 +178,6 @@ static int zlib_send_write(MultiFDSendParams *p, uint32_t used, Error **errp)
  */
 static int zlib_recv_setup(MultiFDRecvParams *p, Error **errp)
 {
-    uint32_t page_count = MULTIFD_PACKET_SIZE / qemu_target_page_size();
     struct zlib_data *z = g_malloc0(sizeof(struct zlib_data));
     z_stream *zs = &z->zs;
 
@@ -194,10 +191,8 @@ static int zlib_recv_setup(MultiFDRecvParams *p, Error **errp)
         error_setg(errp, "multifd %d: inflate init failed", p->id);
         return -1;
     }
-    /* We will never have more than page_count pages */
-    z->zbuff_len = page_count * qemu_target_page_size();
-    /* We know compression "could" use more space */
-    z->zbuff_len *= 2;
+    /* To be safe, we reserve twice the size of the packet */
+    z->zbuff_len = MULTIFD_PACKET_SIZE * 2;
     z->zbuff = g_try_malloc(z->zbuff_len);
     if (!z->zbuff) {
         inflateEnd(zs);
diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
index 693bddf8c9..cc3b8869c0 100644
--- a/migration/multifd-zstd.c
+++ b/migration/multifd-zstd.c
@@ -47,7 +47,6 @@ struct zstd_data {
  */
 static int zstd_send_setup(MultiFDSendParams *p, Error **errp)
 {
-    uint32_t page_count = MULTIFD_PACKET_SIZE / qemu_target_page_size();
     struct zstd_data *z = g_new0(struct zstd_data, 1);
     int res;
 
@@ -67,9 +66,8 @@ static int zstd_send_setup(MultiFDSendParams *p, Error **errp)
                    p->id, ZSTD_getErrorName(res));
         return -1;
     }
-    /* We will never have more than page_count pages */
-    z->zbuff_len = page_count * qemu_target_page_size();
-    z->zbuff_len *= 2;
+    /* To be safe, we reserve twice the size of the packet */
+    z->zbuff_len = MULTIFD_PACKET_SIZE * 2;
     z->zbuff = g_try_malloc(z->zbuff_len);
     if (!z->zbuff) {
         ZSTD_freeCStream(z->zcs);
@@ -191,7 +189,6 @@ static int zstd_send_write(MultiFDSendParams *p, uint32_t used, Error **errp)
  */
 static int zstd_recv_setup(MultiFDRecvParams *p, Error **errp)
 {
-    uint32_t page_count = MULTIFD_PACKET_SIZE / qemu_target_page_size();
     struct zstd_data *z = g_new0(struct zstd_data, 1);
     int ret;
 
@@ -212,10 +209,8 @@ static int zstd_recv_setup(MultiFDRecvParams *p, Error **errp)
         return -1;
     }
 
-    /* We will never have more than page_count pages */
-    z->zbuff_len = page_count * qemu_target_page_size();
-    /* We know compression "could" use more space */
-    z->zbuff_len *= 2;
+    /* To be safe, we reserve twice the size of the packet */
+    z->zbuff_len = MULTIFD_PACKET_SIZE * 2;
     z->zbuff = g_try_malloc(z->zbuff_len);
     if (!z->zbuff) {
         ZSTD_freeDStream(z->zds);
-- 
2.33.1



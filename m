Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FAA45B7FB
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 11:03:35 +0100 (CET)
Received: from localhost ([::1]:40764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpp7m-00005e-DN
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 05:03:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpp0F-0003Oy-Fd
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:55:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpp00-0004VE-Kg
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:55:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637747732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n7CRvfZiw1Vp4lgs31TMC0mD4+lnWYLJVkK/uekYKw0=;
 b=fpOiBcf0BDv269hlj3UwYtNr54K/PW5xGaNkgPE66S1K06vV2V4OE5tffwZHYuvEgVivJf
 E4jRtXrzaExebRBDM9MralslgqwCbcsXDktNTJWfVF8HK3OY33C+oyaGNHHkofa95+rjk7
 vzeo7LJ8bN+ktMBtL5UI0JIX3TuxFdY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-229-wRBCnvmnNg6Grb6LZcnOdg-1; Wed, 24 Nov 2021 04:55:31 -0500
X-MC-Unique: wRBCnvmnNg6Grb6LZcnOdg-1
Received: by mail-wm1-f72.google.com with SMTP id
 a85-20020a1c7f58000000b0033ddc0eacc8so833323wmd.9
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 01:55:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n7CRvfZiw1Vp4lgs31TMC0mD4+lnWYLJVkK/uekYKw0=;
 b=G5KmZdDvn4uKmLF4sM3ayQnH17DBJ/eLjebA47HACEwRDT8lZRfPP4Q4ilZbGeonba
 oVHDkikxCw48G7B64TwF8KXHrFUobqyfHGLDX/jxJL+i2ZLrSp+CNXusrMt6UYRob19k
 HnV3Gu3GFLjFgt8Tv9cY3h7VUE3VhVR3Jr16dEIAKwLuO6V4jkTrh/YCr8Dg51uQD+Ds
 ++7MkrHzqHBNkegzx54VvdZ1c4ae8Nw1wP1KdwZMNZtC1xgU2Z2qs6gXN7w7VJukxylD
 4kAUOfrbK7IQ9siXwRQDCNSeENYM6/qRUzjtK8Yi8KRLx7+YbSVU/0RpdwTBvrRW6GTl
 7xRw==
X-Gm-Message-State: AOAM531zQq8ztd6wuqjPynd/8r3qcc5BsN7BFgqDjfTAvhmqK+YOELUe
 gR/jVvJ1dBVnlbVZzppIBdvqvDVjThMi6zl6Of1GTIYfapi43YpMM4hGtrGi9FVoRjjFctiMTU8
 YhDXvysT15sOBEgspUqIzv32UWi+WLc5dcZOrNRKveF/emCOVqWR/NIl9RWwf7NsSwJ8=
X-Received: by 2002:a05:600c:17c3:: with SMTP id
 y3mr12648353wmo.136.1637747729510; 
 Wed, 24 Nov 2021 01:55:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwSu03iYQvmEyMReR/IsEc5sw9H4T7TqY5t7gDCiNg7r5fue0ITPAtAFO5jmOdg90pinUOmlA==
X-Received: by 2002:a05:600c:17c3:: with SMTP id
 y3mr12648317wmo.136.1637747729246; 
 Wed, 24 Nov 2021 01:55:29 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id b6sm4185454wmq.45.2021.11.24.01.55.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 01:55:28 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/23] multifd: remove used parameter from send_prepare()
 method
Date: Wed, 24 Nov 2021 10:54:43 +0100
Message-Id: <20211124095500.42078-7-quintela@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

It is already there as p->pages->num.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd.h      | 2 +-
 migration/multifd-zlib.c | 7 +++----
 migration/multifd-zstd.c | 7 +++----
 migration/multifd.c      | 9 +++------
 4 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/migration/multifd.h b/migration/multifd.h
index 86820dd028..7968cc5c20 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -159,7 +159,7 @@ typedef struct {
     /* Cleanup for sending side */
     void (*send_cleanup)(MultiFDSendParams *p, Error **errp);
     /* Prepare the send packet */
-    int (*send_prepare)(MultiFDSendParams *p, uint32_t used, Error **errp);
+    int (*send_prepare)(MultiFDSendParams *p, Error **errp);
     /* Write the send packet */
     int (*send_write)(MultiFDSendParams *p, uint32_t used, Error **errp);
     /* Setup for receiving side */
diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
index d0437cce2a..28f0ed933b 100644
--- a/migration/multifd-zlib.c
+++ b/migration/multifd-zlib.c
@@ -94,10 +94,9 @@ static void zlib_send_cleanup(MultiFDSendParams *p, Error **errp)
  * Returns 0 for success or -1 for error
  *
  * @p: Params for the channel that we are using
- * @used: number of pages used
  * @errp: pointer to an error
  */
-static int zlib_send_prepare(MultiFDSendParams *p, uint32_t used, Error **errp)
+static int zlib_send_prepare(MultiFDSendParams *p, Error **errp)
 {
     struct iovec *iov = p->pages->iov;
     struct zlib_data *z = p->data;
@@ -106,11 +105,11 @@ static int zlib_send_prepare(MultiFDSendParams *p, uint32_t used, Error **errp)
     int ret;
     uint32_t i;
 
-    for (i = 0; i < used; i++) {
+    for (i = 0; i < p->pages->num; i++) {
         uint32_t available = z->zbuff_len - out_size;
         int flush = Z_NO_FLUSH;
 
-        if (i == used - 1) {
+        if (i == p->pages->num - 1) {
             flush = Z_SYNC_FLUSH;
         }
 
diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
index 09ae1cf91a..4a71e96e06 100644
--- a/migration/multifd-zstd.c
+++ b/migration/multifd-zstd.c
@@ -107,10 +107,9 @@ static void zstd_send_cleanup(MultiFDSendParams *p, Error **errp)
  * Returns 0 for success or -1 for error
  *
  * @p: Params for the channel that we are using
- * @used: number of pages used
  * @errp: pointer to an error
  */
-static int zstd_send_prepare(MultiFDSendParams *p, uint32_t used, Error **errp)
+static int zstd_send_prepare(MultiFDSendParams *p, Error **errp)
 {
     struct iovec *iov = p->pages->iov;
     struct zstd_data *z = p->data;
@@ -121,10 +120,10 @@ static int zstd_send_prepare(MultiFDSendParams *p, uint32_t used, Error **errp)
     z->out.size = z->zbuff_len;
     z->out.pos = 0;
 
-    for (i = 0; i < used; i++) {
+    for (i = 0; i < p->pages->num; i++) {
         ZSTD_EndDirective flush = ZSTD_e_continue;
 
-        if (i == used - 1) {
+        if (i == p->pages->num - 1) {
             flush = ZSTD_e_flush;
         }
         z->in.src = iov[i].iov_base;
diff --git a/migration/multifd.c b/migration/multifd.c
index ce7101cf9d..098ef8842c 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -82,13 +82,11 @@ static void nocomp_send_cleanup(MultiFDSendParams *p, Error **errp)
  * Returns 0 for success or -1 for error
  *
  * @p: Params for the channel that we are using
- * @used: number of pages used
  * @errp: pointer to an error
  */
-static int nocomp_send_prepare(MultiFDSendParams *p, uint32_t used,
-                               Error **errp)
+static int nocomp_send_prepare(MultiFDSendParams *p, Error **errp)
 {
-    p->next_packet_size = used * qemu_target_page_size();
+    p->next_packet_size = p->pages->num * qemu_target_page_size();
     p->flags |= MULTIFD_FLAG_NOCOMP;
     return 0;
 }
@@ -654,8 +652,7 @@ static void *multifd_send_thread(void *opaque)
             uint32_t flags = p->flags;
 
             if (used) {
-                ret = multifd_send_state->ops->send_prepare(p, used,
-                                                            &local_err);
+                ret = multifd_send_state->ops->send_prepare(p, &local_err);
                 if (ret != 0) {
                     qemu_mutex_unlock(&p->mutex);
                     break;
-- 
2.33.1



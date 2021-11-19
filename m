Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D00E45751D
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 18:16:28 +0100 (CET)
Received: from localhost ([::1]:35672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo7Ux-000227-9w
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 12:16:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mo7EV-0005TU-3f
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:59:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mo7EO-00038E-1V
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:59:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637341159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vuMhtlBOUpnW7vrr3mqtU0Q/MSUM/C83+9vL+HWbmWU=;
 b=JxZWV3DGy3l3o0YI70oH7nLtGsBuZNU17r+83jr2JpK0JwNZBHlIYwldoqJXIBTd2wwMy9
 gcVaXqGJe2szhhJ/pVcs98x0ir5g7oVMeytOsme85xcmDnDYwHO5AnB9LnXJUcVQ3yOBGD
 zy8G8n9sQ/+GnmKtiNoTgswTMZjK/vg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-7ts9AYgQPRu_K-h98j9svw-1; Fri, 19 Nov 2021 11:59:18 -0500
X-MC-Unique: 7ts9AYgQPRu_K-h98j9svw-1
Received: by mail-wr1-f69.google.com with SMTP id
 f3-20020a5d50c3000000b00183ce1379feso1889285wrt.5
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:59:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vuMhtlBOUpnW7vrr3mqtU0Q/MSUM/C83+9vL+HWbmWU=;
 b=qzOcHTj3wsD7T4/rU8/UFZGITGeU/yPlSbJPWBvVV3SLqxGUV/LYPlAZw5AITl3XLV
 fRLcsJ2WyWqRTMOE5AYaXmX1nzLyqzmAX66HR/2XPEWKCdwa2ednJ7PASusFNHIb69qB
 O0VTCaw9IFn2zwu6cKZBthJwAK8I5Q3v3GIfCruA7Y+dAHQ1rxIYFFKvCpvUgkFV2y6C
 HeVdqidXcUpNygZehETA/TxU7moVk2Vn7NMMsDKgkNCucuwx0a51uwDAmH8OR2pa0jQ6
 Er2/nNfPZYCyyAwYCZaP55eIvHAG0QKxOKyyputwF11KwbPrTOuLZWrZJxAe2HZE6+P7
 Gi7A==
X-Gm-Message-State: AOAM533VCLz2B3ETMXWmsMp1jOA47qv+4Sfo4syBwvxhTabD85hDvu1p
 +r+wcSqovlYZD4sslnxXvVgW7bT+9dvp0kVjgv4lKkRFQKfAFcobPOeHjgXhe1KgIWkfRDjh+kv
 K6mN/LyOFjKkZ+FGKRuUdcp8/I0qs4Y/xPjQ3MXD4it65jMYo7achsdgbQ9N5zqdt5Fk=
X-Received: by 2002:adf:ded0:: with SMTP id i16mr9275454wrn.335.1637341156421; 
 Fri, 19 Nov 2021 08:59:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwyR0Kbhe8IXubs7xFnC9CYmiQ3S1F4CkKjNjlFJcbm68sIsi9t346cILtxQPeLrU0JjgM5qg==
X-Received: by 2002:adf:ded0:: with SMTP id i16mr9275417wrn.335.1637341156191; 
 Fri, 19 Nov 2021 08:59:16 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id s13sm13135534wmc.47.2021.11.19.08.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:59:15 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/11] multifd: Remove send_write() method
Date: Fri, 19 Nov 2021 17:59:01 +0100
Message-Id: <20211119165903.18813-10-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211119165903.18813-1-quintela@redhat.com>
References: <20211119165903.18813-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Everything use now iov's.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd.h      |  2 --
 migration/multifd-zlib.c | 17 -----------------
 migration/multifd-zstd.c | 17 -----------------
 migration/multifd.c      | 20 ++------------------
 4 files changed, 2 insertions(+), 54 deletions(-)

diff --git a/migration/multifd.h b/migration/multifd.h
index 67f9104051..f50c51f365 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -164,8 +164,6 @@ typedef struct {
     void (*send_cleanup)(MultiFDSendParams *p, Error **errp);
     /* Prepare the send packet */
     int (*send_prepare)(MultiFDSendParams *p, uint32_t used, Error **errp);
-    /* Write the send packet */
-    int (*send_write)(MultiFDSendParams *p, uint32_t used, Error **errp);
     /* Setup for receiving side */
     int (*recv_setup)(MultiFDRecvParams *p, Error **errp);
     /* Cleanup for receiving side */
diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
index 2c385e57bc..1201473fa4 100644
--- a/migration/multifd-zlib.c
+++ b/migration/multifd-zlib.c
@@ -153,22 +153,6 @@ static int zlib_send_prepare(MultiFDSendParams *p, uint32_t used, Error **errp)
     return 0;
 }
 
-/**
- * zlib_send_write: do the actual write of the data
- *
- * Do the actual write of the comprresed buffer.
- *
- * Returns 0 for success or -1 for error
- *
- * @p: Params for the channel that we are using
- * @used: number of pages used
- * @errp: pointer to an error
- */
-static int zlib_send_write(MultiFDSendParams *p, uint32_t used, Error **errp)
-{
-    return qio_channel_writev_all(p->c, p->iov, p->iovs_used, errp);
-}
-
 /**
  * zlib_recv_setup: setup receive side
  *
@@ -312,7 +296,6 @@ static MultiFDMethods multifd_zlib_ops = {
     .send_setup = zlib_send_setup,
     .send_cleanup = zlib_send_cleanup,
     .send_prepare = zlib_send_prepare,
-    .send_write = zlib_send_write,
     .recv_setup = zlib_recv_setup,
     .recv_cleanup = zlib_recv_cleanup,
     .recv_pages = zlib_recv_pages
diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
index 6183d0b26d..1532450204 100644
--- a/migration/multifd-zstd.c
+++ b/migration/multifd-zstd.c
@@ -164,22 +164,6 @@ static int zstd_send_prepare(MultiFDSendParams *p, uint32_t used, Error **errp)
     return 0;
 }
 
-/**
- * zstd_send_write: do the actual write of the data
- *
- * Do the actual write of the comprresed buffer.
- *
- * Returns 0 for success or -1 for error
- *
- * @p: Params for the channel that we are using
- * @used: number of pages used
- * @errp: pointer to an error
- */
-static int zstd_send_write(MultiFDSendParams *p, uint32_t used, Error **errp)
-{
-    return qio_channel_writev_all(p->c, p->iov, p->iovs_used, errp);
-}
-
 /**
  * zstd_recv_setup: setup receive side
  *
@@ -325,7 +309,6 @@ static MultiFDMethods multifd_zstd_ops = {
     .send_setup = zstd_send_setup,
     .send_cleanup = zstd_send_cleanup,
     .send_prepare = zstd_send_prepare,
-    .send_write = zstd_send_write,
     .recv_setup = zstd_recv_setup,
     .recv_cleanup = zstd_recv_cleanup,
     .recv_pages = zstd_recv_pages
diff --git a/migration/multifd.c b/migration/multifd.c
index 4368b7f855..f748250c0e 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -100,22 +100,6 @@ static int nocomp_send_prepare(MultiFDSendParams *p, uint32_t used,
     return 0;
 }
 
-/**
- * nocomp_send_write: do the actual write of the data
- *
- * For no compression we just have to write the data.
- *
- * Returns 0 for success or -1 for error
- *
- * @p: Params for the channel that we are using
- * @used: number of pages used
- * @errp: pointer to an error
- */
-static int nocomp_send_write(MultiFDSendParams *p, uint32_t used, Error **errp)
-{
-    return qio_channel_writev_all(p->c, p->iov, p->iovs_used, errp);
-}
-
 /**
  * nocomp_recv_setup: setup receive side
  *
@@ -173,7 +157,6 @@ static MultiFDMethods multifd_nocomp_ops = {
     .send_setup = nocomp_send_setup,
     .send_cleanup = nocomp_send_cleanup,
     .send_prepare = nocomp_send_prepare,
-    .send_write = nocomp_send_write,
     .recv_setup = nocomp_recv_setup,
     .recv_cleanup = nocomp_recv_cleanup,
     .recv_pages = nocomp_recv_pages
@@ -688,7 +671,8 @@ static void *multifd_send_thread(void *opaque)
             }
 
             if (used) {
-                ret = multifd_send_state->ops->send_write(p, used, &local_err);
+                ret = qio_channel_writev_all(p->c, p->iov, p->iovs_used,
+                                             &local_err);
                 if (ret != 0) {
                     break;
                 }
-- 
2.33.1



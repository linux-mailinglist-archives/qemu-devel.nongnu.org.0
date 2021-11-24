Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3010D45B808
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 11:07:26 +0100 (CET)
Received: from localhost ([::1]:50586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mppBV-0006qO-AF
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 05:07:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpp0r-0003xF-Mz
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:56:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpp0p-0004x6-9y
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:56:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637747782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ffZrQjVgGHNgunaflrengDVoG/ghaT4oQPjHYo/PfYo=;
 b=XFKPgqt2xvSej/jPaYxmlsVqvRH6ju9Q2dovVP/CbcpsMkAzVZRU5okNuAVgcwPoD8m0Ae
 nGMWuplkw9Vs/Gp9EJFYTPlOia7zjpZrAY3Ne5GVZvjmDflhpgeSafSFWlzGsAtXgc6e0i
 rWRbEnQu08EjmW0SvzN6WIlknNorRmM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-259-YjrM8EwLOtq2uKioI4RyUA-1; Wed, 24 Nov 2021 04:56:21 -0500
X-MC-Unique: YjrM8EwLOtq2uKioI4RyUA-1
Received: by mail-wm1-f72.google.com with SMTP id
 j25-20020a05600c1c1900b00332372c252dso1142777wms.1
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 01:56:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ffZrQjVgGHNgunaflrengDVoG/ghaT4oQPjHYo/PfYo=;
 b=bIK08+xaqGlyNfPZc1Ig+00UrDalmOHArN4FbFjMc78nc8NuLKkueY1qowvBVAwL4T
 x4Rex20hK0PX+gBj1fBMt73jqXDfxzhpzat8rsl+6XesFrNgzTKG1kM8uxO/llpf9kgN
 uGu260WY4kCyMBMuOGAF+Y34uZs0om3rlJ7ataCxYzvK+8V882oMdEoKxlA1rak+Onxn
 dAybi5vo8RZQOZc35D1Edl0KvJ5blEL2VcHN4VZ30MKUCuTvlubZ/66VIh+Jd9WDd3S9
 uS98S16vweqcjGsTiSPYe73XvHIcDqs2+iisSd1YTGXHnhxoJfDaNRp1nq3Wzmr0XQcL
 ynmw==
X-Gm-Message-State: AOAM531lUBCzOVMAj7MmwyvHTADNBVySPZaVFJeUeqfVb2XqbwxYnw4B
 TX2s/rbp5Kx/W/4qkqE/m5n2YwnGWeuDHsi8Mn8hzDXOvqOb2ekUSrtRq4Zm0ZFhU3rp+Qy+JnK
 N2QwHwKatfAizt/Fd3tNTSuC3RNrUmS9qT9OobduJo+ygeVUq+8kt7KCmfA5pa8slS8I=
X-Received: by 2002:a5d:550c:: with SMTP id b12mr17013810wrv.427.1637747779734; 
 Wed, 24 Nov 2021 01:56:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwIBbGNqiqAQxc8hhYG18iwhQsO9vPvEjsd86gCxBnxtM/lvnQT07ysSEl530zerqZJLep0Sg==
X-Received: by 2002:a5d:550c:: with SMTP id b12mr17013765wrv.427.1637747779450; 
 Wed, 24 Nov 2021 01:56:19 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id p62sm4010126wmp.10.2021.11.24.01.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 01:56:19 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/23] multifd: Remove send_write() method
Date: Wed, 24 Nov 2021 10:54:51 +0100
Message-Id: <20211124095500.42078-15-quintela@redhat.com>
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
Cc: Leonardo Bras <leobras@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>
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
index c3f18af364..7496f951a7 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -164,8 +164,6 @@ typedef struct {
     void (*send_cleanup)(MultiFDSendParams *p, Error **errp);
     /* Prepare the send packet */
     int (*send_prepare)(MultiFDSendParams *p, Error **errp);
-    /* Write the send packet */
-    int (*send_write)(MultiFDSendParams *p, uint32_t used, Error **errp);
     /* Setup for receiving side */
     int (*recv_setup)(MultiFDRecvParams *p, Error **errp);
     /* Cleanup for receiving side */
diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
index 478a4af115..f65159392a 100644
--- a/migration/multifd-zlib.c
+++ b/migration/multifd-zlib.c
@@ -152,22 +152,6 @@ static int zlib_send_prepare(MultiFDSendParams *p, Error **errp)
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
-    return qio_channel_writev_all(p->c, p->iov, p->iovs_num, errp);
-}
-
 /**
  * zlib_recv_setup: setup receive side
  *
@@ -307,7 +291,6 @@ static MultiFDMethods multifd_zlib_ops = {
     .send_setup = zlib_send_setup,
     .send_cleanup = zlib_send_cleanup,
     .send_prepare = zlib_send_prepare,
-    .send_write = zlib_send_write,
     .recv_setup = zlib_recv_setup,
     .recv_cleanup = zlib_recv_cleanup,
     .recv_pages = zlib_recv_pages
diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
index 259277dc42..6933ba622a 100644
--- a/migration/multifd-zstd.c
+++ b/migration/multifd-zstd.c
@@ -163,22 +163,6 @@ static int zstd_send_prepare(MultiFDSendParams *p, Error **errp)
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
-    return qio_channel_writev_all(p->c, p->iov, p->iovs_num, errp);
-}
-
 /**
  * zstd_recv_setup: setup receive side
  *
@@ -320,7 +304,6 @@ static MultiFDMethods multifd_zstd_ops = {
     .send_setup = zstd_send_setup,
     .send_cleanup = zstd_send_cleanup,
     .send_prepare = zstd_send_prepare,
-    .send_write = zstd_send_write,
     .recv_setup = zstd_recv_setup,
     .recv_cleanup = zstd_recv_cleanup,
     .recv_pages = zstd_recv_pages
diff --git a/migration/multifd.c b/migration/multifd.c
index 37487fd01c..71bdef068e 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -100,22 +100,6 @@ static int nocomp_send_prepare(MultiFDSendParams *p, Error **errp)
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
-    return qio_channel_writev_all(p->c, p->iov, p->iovs_num, errp);
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
@@ -687,7 +670,8 @@ static void *multifd_send_thread(void *opaque)
             }
 
             if (used) {
-                ret = multifd_send_state->ops->send_write(p, used, &local_err);
+                ret = qio_channel_writev_all(p->c, p->iov, p->iovs_num,
+                                             &local_err);
                 if (ret != 0) {
                     break;
                 }
-- 
2.33.1



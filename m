Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D104745B7FA
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 11:02:49 +0100 (CET)
Received: from localhost ([::1]:38986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpp72-0007LC-Vh
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 05:02:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpp0V-0003Yg-4P
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:56:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpp0Q-0004uC-0V
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:56:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637747757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OOPs/N6btQ9utuN8+Y/Y/kSvzMd2iTMlpcachHpy1kQ=;
 b=FqbFJ2hFS9QXFtW+AUHyVTEuxJDuQKoY39+pDzMF5JTkZi1qkaOX+5KL1THwhmSEPS5UKR
 pfycTgV047hX6HIpTMOsCm+efHbRCgSox1thUlxrZrZk1UoSRYydjVT99eOu8gY+gyXBFD
 OXjzWcigMcpBC0VJbwk7nJaq6ImdFhk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-141-Rce7wg4RNjGIxPuQY2mB0Q-1; Wed, 24 Nov 2021 04:55:56 -0500
X-MC-Unique: Rce7wg4RNjGIxPuQY2mB0Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 m14-20020a05600c3b0e00b0033308dcc933so1116843wms.7
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 01:55:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OOPs/N6btQ9utuN8+Y/Y/kSvzMd2iTMlpcachHpy1kQ=;
 b=BeB6PuEFQ7TLF8eZIimR3TbedN15cYe8HdDM+ojHsY+MtSR9OMnfg+OzeHQT1uhQaF
 RbJvmBJzY0q7VxWbCEvD/31/JJwZVshIr4FksyxQyhpWz9Dwo2P4zM47mAS157uH18lp
 JuM9c9o9xWNfL+d4YKISwbsZrPQdZQeiMHFElnvIZ9zBNuWgNDwNWWx7I2tyshWzYlh3
 6fj8h0e/6qcUz2mXD1nhhrYm9jo79sjRol/Uw481kykkBYZq1afjainqLzoUo0FMfVI1
 mLzzPl1z9FnSbgjchBvP5cXNy/AtH8ngkUOPCiOnZYZREFZR7Ps9A2D/A7GHr4sw4kXz
 jRmw==
X-Gm-Message-State: AOAM532yphYgtLrqavwyjS0+LRvdenCCJvFBRYYHX6DAET3x0z3ArGQI
 MAKZAr5DTIryOmnwkLQwU7sRBnRz4QvK9yKLRYC+cRlbvgFYYCrJrpcopT5buyga5s2mVLRQHN2
 Z+9va7MIrTTi60+1jq/R7qSdXipZH6Tce1MihvhL0IJXAz1GttTUsNk9osKDvOMy04HA=
X-Received: by 2002:a05:6000:1885:: with SMTP id
 a5mr16993266wri.258.1637747754980; 
 Wed, 24 Nov 2021 01:55:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxuzOX/Je2R2w/1eOzgEHIEJ+OO8PzK90NVqxm1HU+AkpDEa9GIQzWJbqbkSx6phhp17yEXQw==
X-Received: by 2002:a05:6000:1885:: with SMTP id
 a5mr16993237wri.258.1637747754802; 
 Wed, 24 Nov 2021 01:55:54 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id l15sm3943236wme.47.2021.11.24.01.55.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 01:55:54 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/23] multifd: Make zlib compression method not use iovs
Date: Wed, 24 Nov 2021 10:54:47 +0100
Message-Id: <20211124095500.42078-11-quintela@redhat.com>
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

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd-zlib.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
index e85ef8824d..da6201704c 100644
--- a/migration/multifd-zlib.c
+++ b/migration/multifd-zlib.c
@@ -13,6 +13,7 @@
 #include "qemu/osdep.h"
 #include <zlib.h>
 #include "qemu/rcu.h"
+#include "exec/ramblock.h"
 #include "exec/target_page.h"
 #include "qapi/error.h"
 #include "migration.h"
@@ -98,8 +99,8 @@ static void zlib_send_cleanup(MultiFDSendParams *p, Error **errp)
  */
 static int zlib_send_prepare(MultiFDSendParams *p, Error **errp)
 {
-    struct iovec *iov = p->pages->iov;
     struct zlib_data *z = p->data;
+    size_t page_size = qemu_target_page_size();
     z_stream *zs = &z->zs;
     uint32_t out_size = 0;
     int ret;
@@ -113,8 +114,8 @@ static int zlib_send_prepare(MultiFDSendParams *p, Error **errp)
             flush = Z_SYNC_FLUSH;
         }
 
-        zs->avail_in = iov[i].iov_len;
-        zs->next_in = iov[i].iov_base;
+        zs->avail_in = page_size;
+        zs->next_in = p->pages->block->host + p->pages->offset[i];
 
         zs->avail_out = available;
         zs->next_out = z->zbuff + out_size;
@@ -235,6 +236,7 @@ static void zlib_recv_cleanup(MultiFDRecvParams *p)
 static int zlib_recv_pages(MultiFDRecvParams *p, Error **errp)
 {
     struct zlib_data *z = p->data;
+    size_t page_size = qemu_target_page_size();
     z_stream *zs = &z->zs;
     uint32_t in_size = p->next_packet_size;
     /* we measure the change of total_out */
@@ -259,7 +261,6 @@ static int zlib_recv_pages(MultiFDRecvParams *p, Error **errp)
     zs->next_in = z->zbuff;
 
     for (i = 0; i < p->pages->num; i++) {
-        struct iovec *iov = &p->pages->iov[i];
         int flush = Z_NO_FLUSH;
         unsigned long start = zs->total_out;
 
@@ -267,8 +268,8 @@ static int zlib_recv_pages(MultiFDRecvParams *p, Error **errp)
             flush = Z_SYNC_FLUSH;
         }
 
-        zs->avail_out = iov->iov_len;
-        zs->next_out = iov->iov_base;
+        zs->avail_out = page_size;
+        zs->next_out = p->pages->block->host + p->pages->offset[i];
 
         /*
          * Welcome to inflate semantics
@@ -281,8 +282,8 @@ static int zlib_recv_pages(MultiFDRecvParams *p, Error **errp)
         do {
             ret = inflate(zs, flush);
         } while (ret == Z_OK && zs->avail_in
-                             && (zs->total_out - start) < iov->iov_len);
-        if (ret == Z_OK && (zs->total_out - start) < iov->iov_len) {
+                             && (zs->total_out - start) < page_size);
+        if (ret == Z_OK && (zs->total_out - start) < page_size) {
             error_setg(errp, "multifd %d: inflate generated too few output",
                        p->id);
             return -1;
-- 
2.33.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA5B45750E
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 18:10:55 +0100 (CET)
Received: from localhost ([::1]:52966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo7PW-0002q2-E6
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 12:10:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mo7EP-0005Mp-VB
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:59:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mo7EM-00037S-Rj
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:59:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637341154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x21JJpo3l6foj8NaP+rDiQL/I3NxYzqELlR8UI5gEko=;
 b=LKklua/w+3W5ztDo3Pca3aQK8KkV4YdnhFyzElgFI5RlQDShACBg4d3bV4fA+tM9Ipfxsi
 Se0jM59D1SQb8Ag8mDarb2CiZ6tJ601ktNHDLZRSRrqNn2V+gOxPSg0IE+I/RR8+r0sTKb
 Eorp7At+LjUWbluY/05SnvvvUPqyboA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-452-UVsshjNEMTC89GQk3-ZPNQ-1; Fri, 19 Nov 2021 11:59:13 -0500
X-MC-Unique: UVsshjNEMTC89GQk3-ZPNQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 o10-20020a05600c4fca00b0033312e1ed8bso5046596wmq.2
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:59:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x21JJpo3l6foj8NaP+rDiQL/I3NxYzqELlR8UI5gEko=;
 b=CPnGcq7FZKuo9RRidWTfr8x9ijjrXd6m7G4WVktDmO8b2ufKKuHECL682eIQpoNhpT
 clOGISvMgJm9MAmYspvBlUFS+7oEze9n59dbRlPhUff/S0U35UubOHRjjHBnSU3t/VSZ
 5b6n1EbX1zO6VknJe5nK4zqT0S+OPVomRz0p4xaaMpL6swZkGn+DJrNFI87LROtcqMAY
 Tvx6FfGEC+oF9taFYl4xXWcc2kggJPtM/ShLGPr8vTlJCuDFo4XJU+4wRf9L+wb+GLlu
 8/PjRU4OrEKfY5cF7Bnn+gesr5u+2Y+oApIBCyruQsCHrax0Pmb+l0sVDPqNaxFlI7r/
 6o+A==
X-Gm-Message-State: AOAM532VrfATk52vL1d0T3YZQtkXlOHL1r1gFMKdVlst9viW9hDONRdp
 fPhJRIgunB8v/SmiuzWr0Fn679rCk0PMueLup+4nyoR5SXMgcO/adlKWjPq5DrTR3en29AZUR2E
 pUTBqWvSvurMMZMAgP5Mr+IiHBGyWQefzg2rss0ROIRjWI7DiJX7yqzLUN6bk9xSXzFc=
X-Received: by 2002:a05:600c:1c87:: with SMTP id
 k7mr1364877wms.103.1637341151605; 
 Fri, 19 Nov 2021 08:59:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxyTctBnGPSKZ8duGzvf0uNNdqhxv+QnSFjj933dUnJZIaL3RngLiUJ0w5ddcT9gBW4wBrk2Q==
X-Received: by 2002:a05:600c:1c87:: with SMTP id
 k7mr1364824wms.103.1637341151229; 
 Fri, 19 Nov 2021 08:59:11 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id k187sm11986790wme.0.2021.11.19.08.59.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:59:10 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/11] multifd: Make zlib compression method not use iovs
Date: Fri, 19 Nov 2021 17:58:57 +0100
Message-Id: <20211119165903.18813-6-quintela@redhat.com>
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd-zlib.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
index ab4ba75d75..40d4cbd0b8 100644
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
@@ -99,8 +100,8 @@ static void zlib_send_cleanup(MultiFDSendParams *p, Error **errp)
  */
 static int zlib_send_prepare(MultiFDSendParams *p, uint32_t used, Error **errp)
 {
-    struct iovec *iov = p->pages->iov;
     struct zlib_data *z = p->data;
+    size_t page_size = qemu_target_page_size();
     z_stream *zs = &z->zs;
     uint32_t out_size = 0;
     int ret;
@@ -114,8 +115,8 @@ static int zlib_send_prepare(MultiFDSendParams *p, uint32_t used, Error **errp)
             flush = Z_SYNC_FLUSH;
         }
 
-        zs->avail_in = iov[i].iov_len;
-        zs->next_in = iov[i].iov_base;
+        zs->avail_in = page_size;
+        zs->next_in = p->pages->block->host + p->pages->offset[i];
 
         zs->avail_out = available;
         zs->next_out = z->zbuff + out_size;
@@ -240,6 +241,7 @@ static void zlib_recv_cleanup(MultiFDRecvParams *p)
 static int zlib_recv_pages(MultiFDRecvParams *p, uint32_t used, Error **errp)
 {
     struct zlib_data *z = p->data;
+    size_t page_size = qemu_target_page_size();
     z_stream *zs = &z->zs;
     uint32_t in_size = p->next_packet_size;
     /* we measure the change of total_out */
@@ -264,7 +266,6 @@ static int zlib_recv_pages(MultiFDRecvParams *p, uint32_t used, Error **errp)
     zs->next_in = z->zbuff;
 
     for (i = 0; i < used; i++) {
-        struct iovec *iov = &p->pages->iov[i];
         int flush = Z_NO_FLUSH;
         unsigned long start = zs->total_out;
 
@@ -272,8 +273,8 @@ static int zlib_recv_pages(MultiFDRecvParams *p, uint32_t used, Error **errp)
             flush = Z_SYNC_FLUSH;
         }
 
-        zs->avail_out = iov->iov_len;
-        zs->next_out = iov->iov_base;
+        zs->avail_out = page_size;
+        zs->next_out = p->pages->block->host + p->pages->offset[i];
 
         /*
          * Welcome to inflate semantics
@@ -286,8 +287,8 @@ static int zlib_recv_pages(MultiFDRecvParams *p, uint32_t used, Error **errp)
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



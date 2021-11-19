Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0451457507
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 18:07:28 +0100 (CET)
Received: from localhost ([::1]:46908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo7MF-0007Dr-MY
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 12:07:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mo7EP-0005Mm-Gm
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:59:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mo7EM-00037F-RV
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:59:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637341152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RkK2JzVJ2Qn+eeGdXNOGpANBJZPJidfQbM5myyH9RDg=;
 b=K8Wfefa62k+GT9SqzKDDlmq1ZhhocWMaRJza1NMJY6sw06B6RLXmGxgkwIwvHwxqdipgIV
 sb6EvtR4XRjK3cftG7sCUfcR7agSS8Z2zbyLe5cNH3Iuw4otYrH4SiTzP48ta2PKkt8Iuf
 waM2sRYuXChw1ETEKKtKSFxsgB/cE1I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-dr7oHfGpPkOl9ticekuoTA-1; Fri, 19 Nov 2021 11:59:11 -0500
X-MC-Unique: dr7oHfGpPkOl9ticekuoTA-1
Received: by mail-wm1-f69.google.com with SMTP id
 g80-20020a1c2053000000b003331a764709so6206752wmg.2
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:59:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RkK2JzVJ2Qn+eeGdXNOGpANBJZPJidfQbM5myyH9RDg=;
 b=OxMqqUpvH1SgIJGpNg+um7bHmF9GnSLWPSZcRGs9lLwqjkUo1gfcNfwoDlsWpo/RiT
 c1wlg5uJfeH/EgQtndiCoXqigitdNcQUvrsb3I27zlugtUPU0SXUFVZO7Kvn9wFQLyVH
 qeKIwRS4+YQLlufVkBmhQiC+ZpKbeQa9OmcnEutgXGsXspvGZbZPO4Wy1H5O9z/+f9fT
 Q3js2k26KEcNf9otcdM4eu+F//iDEzhb6iZSXnAfM68GuBayRQ6DC2qhsESHNJj5AthV
 Qcrw5gQWAOWGjQgZ8EBH980uQ2M9FVrTdOFhIp+RD9ttPksYt3v9WTTt/VHWXXswSql/
 7P9g==
X-Gm-Message-State: AOAM532kN9rjjSrNjhoAHAtB1fxwzp66G0WGMWXaXSBu+fPoh1tyawrp
 +9e59sab1fpaNZg8aKbfR54gfxndCTu1wu6NTAjF76OPlKyDAmOUys7eemURKNKHDIC029gL6z5
 VArvf2P5QxMSEHzqP21hfFVD1eJm7w9pcdw/EdaOX6zX+8UcoK2tUXf7UkZ2q8l8GOo0=
X-Received: by 2002:adf:ecce:: with SMTP id s14mr9071355wro.98.1637341150171; 
 Fri, 19 Nov 2021 08:59:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJze5CuiEqMEXPEaI8Y+mADq1XsQbN2gDFZPsgeiWFna9KbJuCnUJndYOl8eFo2Wa+G4ACH6dw==
X-Received: by 2002:adf:ecce:: with SMTP id s14mr9071318wro.98.1637341149926; 
 Fri, 19 Nov 2021 08:59:09 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id t189sm205469wma.8.2021.11.19.08.59.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:59:09 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/11] multifd: Make zstd compression method not use iovs
Date: Fri, 19 Nov 2021 17:58:56 +0100
Message-Id: <20211119165903.18813-5-quintela@redhat.com>
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
 migration/multifd-zstd.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
index 693bddf8c9..1dccdbd733 100644
--- a/migration/multifd-zstd.c
+++ b/migration/multifd-zstd.c
@@ -13,6 +13,7 @@
 #include "qemu/osdep.h"
 #include <zstd.h>
 #include "qemu/rcu.h"
+#include "exec/ramblock.h"
 #include "exec/target_page.h"
 #include "qapi/error.h"
 #include "migration.h"
@@ -112,8 +113,8 @@ static void zstd_send_cleanup(MultiFDSendParams *p, Error **errp)
  */
 static int zstd_send_prepare(MultiFDSendParams *p, uint32_t used, Error **errp)
 {
-    struct iovec *iov = p->pages->iov;
     struct zstd_data *z = p->data;
+    size_t page_size = qemu_target_page_size();
     int ret;
     uint32_t i;
 
@@ -127,8 +128,8 @@ static int zstd_send_prepare(MultiFDSendParams *p, uint32_t used, Error **errp)
         if (i == used - 1) {
             flush = ZSTD_e_flush;
         }
-        z->in.src = iov[i].iov_base;
-        z->in.size = iov[i].iov_len;
+        z->in.src = p->pages->block->host + p->pages->offset[i];
+        z->in.size = page_size;
         z->in.pos = 0;
 
         /*
@@ -264,6 +265,7 @@ static int zstd_recv_pages(MultiFDRecvParams *p, uint32_t used, Error **errp)
     uint32_t expected_size = used * qemu_target_page_size();
     uint32_t flags = p->flags & MULTIFD_FLAG_COMPRESSION_MASK;
     struct zstd_data *z = p->data;
+    size_t page_size = qemu_target_page_size();
     int ret;
     int i;
 
@@ -283,10 +285,8 @@ static int zstd_recv_pages(MultiFDRecvParams *p, uint32_t used, Error **errp)
     z->in.pos = 0;
 
     for (i = 0; i < used; i++) {
-        struct iovec *iov = &p->pages->iov[i];
-
-        z->out.dst = iov->iov_base;
-        z->out.size = iov->iov_len;
+        z->out.dst = p->pages->block->host + p->pages->offset[i];
+        z->out.size = page_size;
         z->out.pos = 0;
 
         /*
@@ -300,8 +300,8 @@ static int zstd_recv_pages(MultiFDRecvParams *p, uint32_t used, Error **errp)
         do {
             ret = ZSTD_decompressStream(z->zds, &z->out, &z->in);
         } while (ret > 0 && (z->in.size - z->in.pos > 0)
-                         && (z->out.pos < iov->iov_len));
-        if (ret > 0 && (z->out.pos < iov->iov_len)) {
+                         && (z->out.pos < page_size));
+        if (ret > 0 && (z->out.pos < page_size)) {
             error_setg(errp, "multifd %d: decompressStream buffer too small",
                        p->id);
             return -1;
-- 
2.33.1



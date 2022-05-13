Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDCB5266AF
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 17:59:49 +0200 (CEST)
Received: from localhost ([::1]:51638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npXhk-0004RK-Ux
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 11:59:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1npXg2-0001Ts-3M
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:58:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1npXfz-0002JG-O1
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:58:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652457479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FcGvu50RtmqWJCfgzl9A9RBDNayfR1zOdU9lDxkj9RI=;
 b=Iaef3fKIimUJ87QUGCfsVaid9o+y5AnRZVno/7xFu3zgkyLXcLxj8qrYPk1mWYt4QDJphi
 gQEIcncQ8lY2+PgO8ryoxt0OwveRbDPqboihdEPLGn5mjbybp6YYgLQbZNcnz6BCpZcI7+
 Ea41WnSxYO2IlDGjWpod0EnonwcUfvo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-124-y3bLlB0fN5SAeMcExbRLjQ-1; Fri, 13 May 2022 11:57:58 -0400
X-MC-Unique: y3bLlB0fN5SAeMcExbRLjQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 j27-20020adfb31b000000b0020c4ca11566so3053371wrd.14
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 08:57:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FcGvu50RtmqWJCfgzl9A9RBDNayfR1zOdU9lDxkj9RI=;
 b=hBJHxMgAUzCrYlW3zEdrDklvZz+n0t9rWBu7vHg1n5mmo9bU5NXzEqLTbUvW4HqGNs
 lBH0pJ3z4qs5xky+XKzHs+Qn3moiIf6CGhGQSnhEKaU3pJKSy2LsqmD3bmYSeHsiwEcj
 qnSVMSqL8JRJu3TBkItTuU578LgwTVRcBiBjk1/mi0xd+eQAUONgesjJ7a4pimXXbiV0
 5IW+WyZrCE8L+UZQsdeWIDZA4m0UAZKZx6jbwXZ+LMYfYk8cKtnoRQtFQ9CEwDnibUQl
 4Z1gPC0CTnjwMuLO7yw5D5XA1kZ4nTF1eYEhx66GkW0LB7GhYfonDeRevOsVQDKRioTd
 jzKg==
X-Gm-Message-State: AOAM532sIeMAnLqUqEOkvrd1jqP2RVwmaJ2swcJUm3QqYruAs6Mg90gR
 /nOfqwTdjWT/uj4HwYKLUOzoijMlU8NLMozi1LtDEDADY0RzP55Td2zco2P08Pq0IJGB2Cd8Qil
 BbybOMrKlkf/73/pjgUUZTu4TNctrQI3NS2FZ/uRkuvd4XEjiYkdB5VxWDsBTLUF2
X-Received: by 2002:a05:6000:1788:b0:20c:a43c:10fa with SMTP id
 e8-20020a056000178800b0020ca43c10famr4478259wrg.511.1652457476706; 
 Fri, 13 May 2022 08:57:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZ81a5mjtwbV1D/xZOYvYpqvDCVHWpHT9JurHo4h7g8JZOYKfeQYyhpdDTlmZWf1r3QM3t9w==
X-Received: by 2002:a05:6000:1788:b0:20c:a43c:10fa with SMTP id
 e8-20020a056000178800b0020ca43c10famr4478233wrg.511.1652457476392; 
 Fri, 13 May 2022 08:57:56 -0700 (PDT)
Received: from DESKTOP-E7ACR7D.lan ([2001:8a0:f4d9:2101:a4fa:5f93:755f:6249])
 by smtp.gmail.com with ESMTPSA id
 l5-20020adfc785000000b0020cdcb0efa2sm2558758wrg.34.2022.05.13.08.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 08:57:56 -0700 (PDT)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Alberto Faria <afaria@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH v2 07/10] block: Implement bdrv_{pread, pwrite,
 pwrite_zeroes}() using generated_co_wrapper
Date: Fri, 13 May 2022 16:57:46 +0100
Message-Id: <20220513155749.2488070-5-afaria@redhat.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220513155418.2486450-1-afaria@redhat.com>
References: <20220513155418.2486450-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

bdrv_pwrite_zeroes() now also calls trace_bdrv_co_pwrite_zeroes() and
clears the BDRV_REQ_MAY_UNMAP flag when appropriate, which it didn't
previously.

Signed-off-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/io.c               | 41 ----------------------------------------
 include/block/block-io.h | 15 +++++++++------
 2 files changed, 9 insertions(+), 47 deletions(-)

diff --git a/block/io.c b/block/io.c
index 78a289192e..ecd1c2a53c 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1061,14 +1061,6 @@ static int bdrv_check_request32(int64_t offset, int64_t bytes,
     return 0;
 }
 
-int bdrv_pwrite_zeroes(BdrvChild *child, int64_t offset,
-                       int64_t bytes, BdrvRequestFlags flags)
-{
-    IO_CODE();
-    return bdrv_pwritev(child, offset, bytes, NULL,
-                        BDRV_REQ_ZERO_WRITE | flags);
-}
-
 /*
  * Completely zero out a block device with the help of bdrv_pwrite_zeroes.
  * The operation is sped up by checking the block status and only writing
@@ -1111,39 +1103,6 @@ int bdrv_make_zero(BdrvChild *child, BdrvRequestFlags flags)
     }
 }
 
-/* See bdrv_pwrite() for the return codes */
-int bdrv_pread(BdrvChild *child, int64_t offset, int64_t bytes, void *buf,
-               BdrvRequestFlags flags)
-{
-    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
-    IO_CODE();
-
-    if (bytes < 0) {
-        return -EINVAL;
-    }
-
-    return bdrv_preadv(child, offset, bytes, &qiov, flags);
-}
-
-/* Return no. of bytes on success or < 0 on error. Important errors are:
-  -EIO         generic I/O error (may happen for all errors)
-  -ENOMEDIUM   No media inserted.
-  -EINVAL      Invalid offset or number of bytes
-  -EACCES      Trying to write a read-only device
-*/
-int bdrv_pwrite(BdrvChild *child, int64_t offset, int64_t bytes,
-                const void *buf, BdrvRequestFlags flags)
-{
-    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
-    IO_CODE();
-
-    if (bytes < 0) {
-        return -EINVAL;
-    }
-
-    return bdrv_pwritev(child, offset, bytes, &qiov, flags);
-}
-
 /*
  * Writes to the file and ensures that no writes are reordered across this
  * request (acts as a barrier)
diff --git a/include/block/block-io.h b/include/block/block-io.h
index 879221cebe..c81739ad16 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -39,13 +39,16 @@
  * to catch when they are accidentally called by the wrong API.
  */
 
-int bdrv_pwrite_zeroes(BdrvChild *child, int64_t offset,
-                       int64_t bytes, BdrvRequestFlags flags);
+int generated_co_wrapper bdrv_pwrite_zeroes(BdrvChild *child, int64_t offset,
+                                            int64_t bytes,
+                                            BdrvRequestFlags flags);
 int bdrv_make_zero(BdrvChild *child, BdrvRequestFlags flags);
-int bdrv_pread(BdrvChild *child, int64_t offset, int64_t bytes, void *buf,
-               BdrvRequestFlags flags);
-int bdrv_pwrite(BdrvChild *child, int64_t offset, int64_t bytes,
-                const void *buf, BdrvRequestFlags flags);
+int generated_co_wrapper bdrv_pread(BdrvChild *child, int64_t offset,
+                                    int64_t bytes, void *buf,
+                                    BdrvRequestFlags flags);
+int generated_co_wrapper bdrv_pwrite(BdrvChild *child, int64_t offset,
+                                     int64_t bytes, const void *buf,
+                                     BdrvRequestFlags flags);
 int bdrv_pwrite_sync(BdrvChild *child, int64_t offset, int64_t bytes,
                      const void *buf, BdrvRequestFlags flags);
 /*
-- 
2.35.3



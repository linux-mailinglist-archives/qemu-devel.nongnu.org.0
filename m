Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 270655258BE
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 01:53:11 +0200 (CEST)
Received: from localhost ([::1]:53930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npIcH-0000zO-VW
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 19:53:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1npIaR-0007DB-Bj
 for qemu-devel@nongnu.org; Thu, 12 May 2022 19:51:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1npIaN-0005gZ-Fe
 for qemu-devel@nongnu.org; Thu, 12 May 2022 19:51:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652399470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eFUmwFuRAQEB3IhuBD+mCfJNDp2124QaArTjCqmbDa0=;
 b=MpXSscV2kS6ndZrBYzy3J/HIn5cY5FB5St6pMLVP6nDZEqi9UjIMQ/Z0cwrfLXWrpDLJgU
 6/u20M9y48FgUGZ+/lKnjD5P5AcAr8c2JXPn5k68NFrc20yHrdQVoYftQig7GP1VcnqpZf
 DgdahN6LD+yrHaSMZrTlTo+7kPrhtfk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-115-atoQMOiPP5y6MyJyMSXwXg-1; Thu, 12 May 2022 19:51:09 -0400
X-MC-Unique: atoQMOiPP5y6MyJyMSXwXg-1
Received: by mail-wm1-f69.google.com with SMTP id
 bi5-20020a05600c3d8500b0039489e1d18dso5102733wmb.5
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 16:51:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eFUmwFuRAQEB3IhuBD+mCfJNDp2124QaArTjCqmbDa0=;
 b=Kv/13ALfMjfqyvLIbJdgBxfKMzS8oBhRl/sJ/MvqMoABBQ43ZtyJ4YSz8EA9n1kTnD
 i7BTg0GrxDqDJqfZBqryPI4EDcWw0KLEPisuA+8Lz5TmgXc55nmlijKax7FzyyvT+Kk1
 TXxwIhrBeVQjMrBfqERrYOSHEwpiQueNVgrwwL9q/a0Etjk7nnfzo2M43m3rJvSdVoUz
 0etWihg9uhQ5QhISieVotplZYjvVPf19LIe4uyJ0K9d1v3GkJcloak9vA3xp/Z9IflOE
 kbl4cowPoo6AqlbJbClTTJRLYbCr8qOcyB9YthRFC61JXWMBOyNWyaH8n626oof8ZEz4
 wa4w==
X-Gm-Message-State: AOAM531e9RCZ64jK1MkAVkJAPV/yb0gbP889/S2lD0Qx6zbJe/+s8m5Q
 3DTkeHQbBRduPo8jdZNwyiWL1oOWtRIQpP6/n6g5ry6h4/155ZKU45Urf5pPcndtWeftohXRt8z
 JKSKkNUHy3v9EKa3PTtHrScgb1mKQulSncji5rQokR3A0BjOfu13HGdbnppg08kR/
X-Received: by 2002:a05:600c:1e89:b0:394:9587:cbe0 with SMTP id
 be9-20020a05600c1e8900b003949587cbe0mr12368756wmb.89.1652399468013; 
 Thu, 12 May 2022 16:51:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxskdtdbx2qaYQ5TcREKuhzh3reYvEQKA/39U7MdO08OB4W2F53o1LqO41y8ky8j6Bi7rgsfQ==
X-Received: by 2002:a05:600c:1e89:b0:394:9587:cbe0 with SMTP id
 be9-20020a05600c1e8900b003949587cbe0mr12368744wmb.89.1652399467783; 
 Thu, 12 May 2022 16:51:07 -0700 (PDT)
Received: from DESKTOP-E7ACR7D.lan ([2001:8a0:f4d9:2101:a4fa:5f93:755f:6249])
 by smtp.gmail.com with ESMTPSA id
 a25-20020adfb519000000b0020c5253d90asm678577wrd.86.2022.05.12.16.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 16:51:07 -0700 (PDT)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Alberto Faria <afaria@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH 5/7] block: Make 'bytes' param of bdrv_co_{pread, pwrite,
 preadv, pwritev}() an int64_t
Date: Fri, 13 May 2022 00:51:01 +0100
Message-Id: <20220512235103.2224817-2-afaria@redhat.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220512233849.2219275-1-afaria@redhat.com>
References: <20220512233849.2219275-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
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

For consistency with other I/O functions, and in preparation to
implement bdrv_{pread,pwrite}() using generated_co_wrapper.

unsigned int fits in int64_t, so all callers remain correct.

Signed-off-by: Alberto Faria <afaria@redhat.com>
---
 block/coroutines.h           | 4 ++--
 include/block/block_int-io.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/block/coroutines.h b/block/coroutines.h
index 830ecaa733..3f41238b33 100644
--- a/block/coroutines.h
+++ b/block/coroutines.h
@@ -91,11 +91,11 @@ int coroutine_fn blk_co_do_flush(BlockBackend *blk);
  */
 
 int generated_co_wrapper
-bdrv_preadv(BdrvChild *child, int64_t offset, unsigned int bytes,
+bdrv_preadv(BdrvChild *child, int64_t offset, int64_t bytes,
             QEMUIOVector *qiov, BdrvRequestFlags flags);
 
 int generated_co_wrapper
-bdrv_pwritev(BdrvChild *child, int64_t offset, unsigned int bytes,
+bdrv_pwritev(BdrvChild *child, int64_t offset, int64_t bytes,
              QEMUIOVector *qiov, BdrvRequestFlags flags);
 
 int generated_co_wrapper
diff --git a/include/block/block_int-io.h b/include/block/block_int-io.h
index d4d3bed783..d1a6970dc6 100644
--- a/include/block/block_int-io.h
+++ b/include/block/block_int-io.h
@@ -56,7 +56,7 @@ int coroutine_fn bdrv_co_pwritev_part(BdrvChild *child,
     QEMUIOVector *qiov, size_t qiov_offset, BdrvRequestFlags flags);
 
 static inline int coroutine_fn bdrv_co_pread(BdrvChild *child,
-    int64_t offset, unsigned int bytes, void *buf, BdrvRequestFlags flags)
+    int64_t offset, int64_t bytes, void *buf, BdrvRequestFlags flags)
 {
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
     IO_CODE();
@@ -65,7 +65,7 @@ static inline int coroutine_fn bdrv_co_pread(BdrvChild *child,
 }
 
 static inline int coroutine_fn bdrv_co_pwrite(BdrvChild *child,
-    int64_t offset, unsigned int bytes, const void *buf, BdrvRequestFlags flags)
+    int64_t offset, int64_t bytes, const void *buf, BdrvRequestFlags flags)
 {
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
     IO_CODE();
-- 
2.35.3



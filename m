Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E6E5266DA
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 18:14:44 +0200 (CEST)
Received: from localhost ([::1]:48486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npXwB-0005Yv-RQ
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 12:14:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1npXg4-0001Uj-4j
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:58:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1npXg1-0002JZ-Oq
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:58:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652457480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UgbMHkWhsgJPf5WPgAeMbIGGOvJpYk05MGY0Cz6qJn0=;
 b=PDQQbfqAB1iYPgdo37ZLXtZLn/IQosjYRlkvQ17NP4xYj8VmpbR8Dj0qbBOQvxP9YbIMoe
 bG3aSFnEI5o7c8vgCIctyPiUd0C825wRa5CARx3kEBK09Y7hd3SaKkwjuiE4ch1+leFD77
 fY2V1hVD7q9K8a7kaQn7VEdjHEswkg8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510-l7VYWu8fNM-702U49bFYZw-1; Fri, 13 May 2022 11:57:59 -0400
X-MC-Unique: l7VYWu8fNM-702U49bFYZw-1
Received: by mail-wm1-f70.google.com with SMTP id
 n26-20020a1c721a000000b003941ea1ced7so3165511wmc.7
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 08:57:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UgbMHkWhsgJPf5WPgAeMbIGGOvJpYk05MGY0Cz6qJn0=;
 b=sPWniUKRKAXp0YC+cbz4LY2AYtAw1rv2hz9D87vgdo3SlZE+HVLI/Y8iupP13U5dH4
 2GuqiC2g+wnOMowEQTpP5C3ln/EkJwM4Q/GoHXQET758/lseVKdEgwc9+Li/O2F8gMQr
 nNMbBfAnsZpPKO9ZijkQyvyxDyOLntx79Vo3XEVPY48rp+mFYmDpfQGTeepWLd8Q+9AI
 fI99k0uCxnBpw61ar3UarI/UnbE/MQ6mbzXNYFDcZp5Bd1l3UkpFXM9yhVT8lYhu+hIk
 E64hgylIPYS+s8rp+NGU8ok0HWsTPI5yuyEom5Lv7OkH1gnRgbotYRiCqc1HOUfcb2jO
 VKmw==
X-Gm-Message-State: AOAM5328P5E6aBi59fPquhJPcCn3INa0FrlvYQjSU4PoUS3JiYEq8Kpn
 mdorHJ+7KBIZKiMK424HNVNYSaYJVcJnmaEHyn5GpdCAEuKkKg5IIYFuuxtpg4WbddF4tIu33ax
 sI3OLkDa4wt6zIkYf31Dz57+bU9OEu79sHvktYtlyEF7SwhP6CdkVDDtF0zPEET5f
X-Received: by 2002:a05:600c:a03:b0:395:bc75:61eb with SMTP id
 z3-20020a05600c0a0300b00395bc7561ebmr5225979wmp.46.1652457477986; 
 Fri, 13 May 2022 08:57:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhSjLiBeu8C9cbejCf0e2s04VteJm25k6E5s2VvfUx/QI66fbFTKirMdtJQKtd/dtYpunGng==
X-Received: by 2002:a05:600c:a03:b0:395:bc75:61eb with SMTP id
 z3-20020a05600c0a0300b00395bc7561ebmr5225951wmp.46.1652457477698; 
 Fri, 13 May 2022 08:57:57 -0700 (PDT)
Received: from DESKTOP-E7ACR7D.lan ([2001:8a0:f4d9:2101:a4fa:5f93:755f:6249])
 by smtp.gmail.com with ESMTPSA id
 l5-20020adfc785000000b0020cdcb0efa2sm2558758wrg.34.2022.05.13.08.57.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 08:57:57 -0700 (PDT)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Alberto Faria <afaria@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH v2 08/10] block: Add bdrv_co_pwrite_sync()
Date: Fri, 13 May 2022 16:57:47 +0100
Message-Id: <20220513155749.2488070-6-afaria@redhat.com>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Also convert bdrv_pwrite_sync() to being implemented using
generated_co_wrapper.

Signed-off-by: Alberto Faria <afaria@redhat.com>
---
 block/io.c               | 9 +++++----
 include/block/block-io.h | 8 ++++++--
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/block/io.c b/block/io.c
index ecd1c2a53c..b2e35dbe23 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1109,18 +1109,19 @@ int bdrv_make_zero(BdrvChild *child, BdrvRequestFlags flags)
  *
  * Returns 0 on success, -errno in error cases.
  */
-int bdrv_pwrite_sync(BdrvChild *child, int64_t offset, int64_t bytes,
-                     const void *buf, BdrvRequestFlags flags)
+int coroutine_fn bdrv_co_pwrite_sync(BdrvChild *child, int64_t offset,
+                                     int64_t bytes, const void *buf,
+                                     BdrvRequestFlags flags)
 {
     int ret;
     IO_CODE();
 
-    ret = bdrv_pwrite(child, offset, bytes, buf, flags);
+    ret = bdrv_co_pwrite(child, offset, bytes, buf, flags);
     if (ret < 0) {
         return ret;
     }
 
-    ret = bdrv_flush(child->bs);
+    ret = bdrv_co_flush(child->bs);
     if (ret < 0) {
         return ret;
     }
diff --git a/include/block/block-io.h b/include/block/block-io.h
index c81739ad16..ae90d1e588 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -49,8 +49,12 @@ int generated_co_wrapper bdrv_pread(BdrvChild *child, int64_t offset,
 int generated_co_wrapper bdrv_pwrite(BdrvChild *child, int64_t offset,
                                      int64_t bytes, const void *buf,
                                      BdrvRequestFlags flags);
-int bdrv_pwrite_sync(BdrvChild *child, int64_t offset, int64_t bytes,
-                     const void *buf, BdrvRequestFlags flags);
+int generated_co_wrapper bdrv_pwrite_sync(BdrvChild *child, int64_t offset,
+                                          int64_t bytes, const void *buf,
+                                          BdrvRequestFlags flags);
+int coroutine_fn bdrv_co_pwrite_sync(BdrvChild *child, int64_t offset,
+                                     int64_t bytes, const void *buf,
+                                     BdrvRequestFlags flags);
 /*
  * Efficiently zero a region of the disk image.  Note that this is a regular
  * I/O request like read or write and should have a reasonable size.  This
-- 
2.35.3



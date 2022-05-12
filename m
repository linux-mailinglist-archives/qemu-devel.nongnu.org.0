Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 445405258C1
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 01:53:19 +0200 (CEST)
Received: from localhost ([::1]:54536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npIcQ-0001OR-7d
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 19:53:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1npIaU-0007Fx-1O
 for qemu-devel@nongnu.org; Thu, 12 May 2022 19:51:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1npIaR-0005io-3R
 for qemu-devel@nongnu.org; Thu, 12 May 2022 19:51:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652399473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d4CdPiovWolhzsauxg3NFy4KndJJVIMVPi4RXbreQrI=;
 b=APE+O5XZETPPWyiF5AsWTrSZd3sNttNlVbLNJZhc3HEb1qDRYojvnveglrgJU9huq060l/
 AnQtrz1gg3HXY994QCIRoiuAoXo7KTxP9s+uOKNeuqPu9HGKNw2wS0QvPW2bD6kgmXNn13
 4rcZaJutsXteNlRl/HZSjZOiQa7zJ8U=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-132-DkxDJcmLNV6gMADwdvTgfA-1; Thu, 12 May 2022 19:51:12 -0400
X-MC-Unique: DkxDJcmLNV6gMADwdvTgfA-1
Received: by mail-wm1-f71.google.com with SMTP id
 c125-20020a1c3583000000b0038e3f6e871aso2169981wma.8
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 16:51:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d4CdPiovWolhzsauxg3NFy4KndJJVIMVPi4RXbreQrI=;
 b=C6DKRvzZX0e+qZQrp9mIw4e45hmdKVdJjthM85NcUG/wP/2LsBjBPS3Bp/27X1Eh9f
 R+9Itbt76HordmUowwphg2gfJFBH5TY9O7qKBfQQzp6xXTc2gTn71B0KwKUVCykZZR/3
 MZKAdMJBUOevdR8Qg3PQMjr0VEl43YmKClpJ6Fg2BNlcm6e/uJ1kJM8VTqzqg3jK1+mP
 W0Vx+UV0k4NWADu+luKXMTU+S3O/RkbpgI2G1BSfgwLIzqU6j5l+qk9FTvSvBiaug6CR
 RB7bDOBeoft9xyXZTxUIVQPbho4k5jfARpuXydGsCKESV/bEEa6Zs6AY0roTHFUb0Gpt
 8gEQ==
X-Gm-Message-State: AOAM530n85SXT92BrSwAxjZlBuA66IcERNzXfG4penzZQC7ZUWUHMmsU
 6H3u19aEHJFj1DVstTQ81zRsd7DJA2ojqV93DQ3fEmK9qJkdr0ulK6pBXF4p18CCRhUGE9V+OFM
 RLsSOssLW+YC4YB0KjBbibiMjTDwmU/ST2t2Cwm3Mq9LGwZ9g+b/4mm8KZeWLlTAH
X-Received: by 2002:a05:600c:4e8c:b0:394:8144:6836 with SMTP id
 f12-20020a05600c4e8c00b0039481446836mr12181153wmq.130.1652399470517; 
 Thu, 12 May 2022 16:51:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIIBukiG8IElwiW5uH+O9Xvi+swpyP6SIyEIGwXkiaenaktKWN3Da22ThfQksKXG+rnPHVyw==
X-Received: by 2002:a05:600c:4e8c:b0:394:8144:6836 with SMTP id
 f12-20020a05600c4e8c00b0039481446836mr12181136wmq.130.1652399470290; 
 Thu, 12 May 2022 16:51:10 -0700 (PDT)
Received: from DESKTOP-E7ACR7D.lan ([2001:8a0:f4d9:2101:a4fa:5f93:755f:6249])
 by smtp.gmail.com with ESMTPSA id
 a25-20020adfb519000000b0020c5253d90asm678577wrd.86.2022.05.12.16.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 16:51:09 -0700 (PDT)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Alberto Faria <afaria@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH 7/7] block: Add bdrv_co_pwrite_sync()
Date: Fri, 13 May 2022 00:51:03 +0100
Message-Id: <20220512235103.2224817-4-afaria@redhat.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220512233849.2219275-1-afaria@redhat.com>
References: <20220512233849.2219275-1-afaria@redhat.com>
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
 block/io.c               | 5 +++--
 include/block/block-io.h | 8 ++++++--
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/block/io.c b/block/io.c
index ecd1c2a53c..19f9251c11 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1109,8 +1109,9 @@ int bdrv_make_zero(BdrvChild *child, BdrvRequestFlags flags)
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



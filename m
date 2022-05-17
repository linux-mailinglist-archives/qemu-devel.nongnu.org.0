Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DD452A234
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 14:57:30 +0200 (CEST)
Received: from localhost ([::1]:38556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqwlV-0007AR-VN
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 08:57:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nqvXn-0001ZP-RE
 for qemu-devel@nongnu.org; Tue, 17 May 2022 07:39:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nqvXl-00037R-Hf
 for qemu-devel@nongnu.org; Tue, 17 May 2022 07:39:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652787552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yzjg25PH8o6SrBkZxOxzOWN4JOb5UzXrxYVAvPdLiSU=;
 b=aHi4GSlfLBIrzP33NRHXy8GKGKkImXNtus64rllicNwudeXvybua4XRsCpiAXp+pSDPy2j
 I2O05udC2XYijETgSYcMxVoOaznHGQMNw9+xQ/NwLzh+YYMm4qNCs+qm3GXWQlqX4musEk
 s9jaIR6NDL47C+M53XDfPFJ9H/8c3UU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-78eF0HazMfOhcT4dAAK23w-1; Tue, 17 May 2022 07:39:11 -0400
X-MC-Unique: 78eF0HazMfOhcT4dAAK23w-1
Received: by mail-wm1-f69.google.com with SMTP id
 v126-20020a1cac84000000b00396fe5959d2so3550840wme.8
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 04:39:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yzjg25PH8o6SrBkZxOxzOWN4JOb5UzXrxYVAvPdLiSU=;
 b=kAoPdTADTc4CpHuBAS1i+qrxp1X3jJ1InWyB1LpM1LNwR1qcAZfhz2sJAdcz1tJGJS
 +skFZzL924WFAgNlCQQCU7j1bqrmhwXrTwjhNFwQO93B5UmimHdUBuxF6O1OzMzIDUyD
 nkTXQAoXAUgOn3dL9qP/EzAq7S/HXihFZvLoTJDiobH9te+U0+dqlRxG50iMymvdlWmD
 e1KGU+QJ43sxZDIzqCtIGBWFKDHkAW5fnlJGrjEo2rDHPQ6UhBP9kInAjrqMgiNf6Ino
 sboJY58vfZKZeApTAPajgjukiqzo8UYYKlLONIdj9uue6Mzy66ha5WSLG9ApVygoZSAD
 Wmog==
X-Gm-Message-State: AOAM532cYvdiKinMMxYhLupLLqlH8xqweSxZ7OYmMaggF35FrTSCn1VP
 QBbWn6q0te7kxu3GCyht+Ll03Buc/VqqkziZbc+G/47iPlZrZE5eCvu4CHgB4K8fpnrJg3dV9GG
 VIs6tCdmKaruLoOU3BXlPDrngBbX8bt9gyFWwRHkAy8hyFdQk9A2JhaRHN8moRlgD
X-Received: by 2002:a05:600c:3512:b0:394:7c3b:53d1 with SMTP id
 h18-20020a05600c351200b003947c3b53d1mr31500037wmq.197.1652787550606; 
 Tue, 17 May 2022 04:39:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwutqUqsq9RgcHISSXeT2p1DuuElNtuSxW+Tn6ifjMX3heJaub8RCaS0zVHjL7Y99CX/fUK8g==
X-Received: by 2002:a05:600c:3512:b0:394:7c3b:53d1 with SMTP id
 h18-20020a05600c351200b003947c3b53d1mr31500013wmq.197.1652787550354; 
 Tue, 17 May 2022 04:39:10 -0700 (PDT)
Received: from fedora.redhat.com ([2001:8a0:f4d9:2101:a4fa:5f93:755f:6249])
 by smtp.gmail.com with ESMTPSA id
 x9-20020adfae09000000b0020c5253d8edsm12093321wrc.57.2022.05.17.04.39.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 04:39:10 -0700 (PDT)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Alberto Faria <afaria@redhat.com>
Subject: [PATCH 13/18] block: Implement blk_pdiscard() using
 generated_co_wrapper
Date: Tue, 17 May 2022 12:39:02 +0100
Message-Id: <20220517113907.200001-2-afaria@redhat.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220517113524.197910-1-afaria@redhat.com>
References: <20220517113524.197910-1-afaria@redhat.com>
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

Signed-off-by: Alberto Faria <afaria@redhat.com>
---
 block/block-backend.c             | 12 ------------
 block/coroutines.h                |  3 ---
 include/sysemu/block-backend-io.h |  3 ++-
 3 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 8129259e50..823c98a031 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1715,18 +1715,6 @@ int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset,
     return ret;
 }
 
-int blk_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes)
-{
-    int ret;
-    IO_OR_GS_CODE();
-
-    blk_inc_in_flight(blk);
-    ret = blk_do_pdiscard(blk, offset, bytes);
-    blk_dec_in_flight(blk);
-
-    return ret;
-}
-
 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
 int coroutine_fn blk_co_do_flush(BlockBackend *blk)
 {
diff --git a/block/coroutines.h b/block/coroutines.h
index 94fd283f62..2693ecabfb 100644
--- a/block/coroutines.h
+++ b/block/coroutines.h
@@ -110,9 +110,6 @@ nbd_do_establish_connection(BlockDriverState *bs, bool blocking, Error **errp);
 int generated_co_wrapper
 blk_do_ioctl(BlockBackend *blk, unsigned long int req, void *buf);
 
-int generated_co_wrapper
-blk_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
-
 int generated_co_wrapper blk_do_flush(BlockBackend *blk);
 
 #endif /* BLOCK_COROUTINES_H */
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 5ce9b80023..5c56737453 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -160,6 +160,8 @@ static inline int coroutine_fn blk_co_pwrite(BlockBackend *blk, int64_t offset,
     return blk_co_pwritev(blk, offset, bytes, &qiov, flags);
 }
 
+int generated_co_wrapper blk_pdiscard(BlockBackend *blk, int64_t offset,
+                                      int64_t bytes);
 int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset,
                                  int64_t bytes);
 
@@ -173,7 +175,6 @@ int generated_co_wrapper blk_pwrite_compressed(BlockBackend *blk,
                                                const void *buf);
 int coroutine_fn blk_co_pwrite_compressed(BlockBackend *blk, int64_t offset,
                                           int64_t bytes, const void *buf);
-int blk_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
 int generated_co_wrapper blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                                            int64_t bytes,
                                            BdrvRequestFlags flags);
-- 
2.35.3



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED1D369B87
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 22:49:16 +0200 (CEST)
Received: from localhost ([::1]:35400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la2jj-0007aV-1I
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 16:49:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1la2ae-0005CB-2T
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:39:52 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:41836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1la2ab-0007ww-OO
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:39:51 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 v19-20020a0568300913b029028423b78c2dso37767552ott.8
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 13:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xLVqyW6QocgCtWNC8ySv5WW9ttRqlB16OaGwZGT2xJY=;
 b=glTYekUbDEXWawF1rhYjs/Kz5OdYut5vlLd5Zi1wqn/fXw/QtxTSOmUPR1qVJ4Ezgb
 qEyT6Ws/Qzn3bCYPNP58SsCEZWVFbG5hsqPgZQ0FmW4AAGtSTfqoHA88pY1gisIRccKo
 cyVVvNxjno4gweAWThNBnpH3ZAghqzRAmOVD2Fk1IbHJ3PGcTl04hkv3b5X2LJ69mYEW
 JJ0r/CeNRbkSPfgFmh11CJ3FJtMQzkSFVsej8C9up2BDN6hk7myAicnFsvQ2VRwr1Hlk
 pSPndWJG8QPUWx2BlxSn84oX+l035POXXTgFMnfRmeYyQy5SA+rj94PXgfBeEJXDEOft
 LgfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xLVqyW6QocgCtWNC8ySv5WW9ttRqlB16OaGwZGT2xJY=;
 b=qfIKQcn9mLvDfbq+EIq73S+Dl23yKcdl4kQiXSNJZgbB9fSOPwCTIyazKua+LH4Z0C
 QawlFevnYHFywh24p9/g54/RTzxktsoK4TSg2c67ak1WtIOg8VtNKAJQPjKDS02RjCRy
 eHE6bGszjgOFcQ3KIfIewxymyYV2KwYSLPIlTVChw5UUufXqtv1VhActzmGLs1VSLfw5
 3BOyqa4HSWigYAWk1tDy5BVh49jb00cyNV5lLYpMuBhUPuKZYDJSapRfafBorLng6W6u
 mZA/STw5k/P9iz0sAQM9lpsOMUCMVEeexlWEyiLGl1rGZXE9IiLW1xyPTLU9DTAT6rwJ
 F+0Q==
X-Gm-Message-State: AOAM5323joQgeG28M8eaoMOVIzxIzHtbhYDD6YxHmERZc4Q+lSMQGxXS
 Vmkr3oK2HwEKSLXc8Im11GN1SS62PPobfIR1
X-Google-Smtp-Source: ABdhPJwYm/AvpGAW1koub4GpuW1+21ffFbQOKbFzSLbAK14EPFjQqM4SBL+/efBLhh7kpr0aXVJHgQ==
X-Received: by 2002:a05:6830:4110:: with SMTP id
 w16mr4968057ott.348.1619210388376; 
 Fri, 23 Apr 2021 13:39:48 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id m127sm1511911oib.32.2021.04.23.13.39.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Apr 2021 13:39:47 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 07/24] bsd-user: style tweak: keyword space (
Date: Fri, 23 Apr 2021 14:39:33 -0600
Message-Id: <20210423203935.78225-7-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210423203935.78225-1-imp@bsdimp.com>
References: <20210423203935.78225-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::331;
 envelope-from=imp@bsdimp.com; helo=mail-ot1-x331.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kevans@freebsd.org, arichardson@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/uaccess.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bsd-user/uaccess.c b/bsd-user/uaccess.c
index 91e2067933..89163257f4 100644
--- a/bsd-user/uaccess.c
+++ b/bsd-user/uaccess.c
@@ -46,7 +46,7 @@ abi_long target_strlen(abi_ulong guest_addr1)
     int max_len, len;
 
     guest_addr = guest_addr1;
-    for(;;) {
+    for (;;) {
         max_len = TARGET_PAGE_SIZE - (guest_addr & ~TARGET_PAGE_MASK);
         ptr = lock_user(VERIFY_READ, guest_addr, max_len, 1);
         if (!ptr)
-- 
2.22.1



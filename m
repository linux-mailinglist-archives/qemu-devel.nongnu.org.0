Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 665FD36FFEE
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 19:49:52 +0200 (CEST)
Received: from localhost ([::1]:43780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcXGx-0002S2-FU
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 13:49:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lcWvt-0001C9-E4
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 13:28:05 -0400
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36]:36477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lcWvq-0003mx-N3
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 13:28:05 -0400
Received: by mail-oo1-xc36.google.com with SMTP id
 c6-20020a4aacc60000b02901e6260b12e2so13179621oon.3
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 10:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OenvJJJ3X+Wq8Y9NxLH1nYHg0VleC8tnRAqVxJQdJCI=;
 b=WMvYncXQwvQjPfnyghBq97APifyAgGdgDIC29qFfn397zpsPIXd46yY7eYmDRs3w7E
 sRf2/Z7OoWO6Ej88eoDa71+ve0NqsYsYW+tVLGcAPPQ12nPBSX89eXG2HHkh8zccObjf
 J2ZYP/4D/EkxScaJCQWLsEM3lMMYSt2tq4k/Q1zXPx4FyuC5iIKboz7Sp6464pW8Kxh9
 XXdbdBU9WcRcen4+qVnsMWWahB/Ej6RQYCU6TrJTXvojsCszedoR4YHz/kUK3l57EOlU
 OCR1xPCCiqfeSn1SpR1rm2r4/h9x74NsoozZxNCuTGCskB7R5B82dkU62ACLc5B4a12H
 NV5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OenvJJJ3X+Wq8Y9NxLH1nYHg0VleC8tnRAqVxJQdJCI=;
 b=pT+Pdf8IN5IBqP+qVt7M+50FkSQbInz9WqhSox1y82yPEuAgfBG/7d9lXkNmypLKf0
 0o48hcW+O7x0ApLyw0JlXHzEwyEZFCvkPVXQNNNXkewyZFOQefWTGFwoAjAGlfah2VTs
 od3BkBdziGxT9/o442x4/ZXvOQz4UJ2HLiZQ7aPuC17bzya0Jb07LvHlKUQy9jgm/B4q
 VAGOQYblNltTMC+5Cd+uRPx2ua1NvOKca7wqsDfhH4jG04QhjqKPGhiACriS2pX53S9N
 tbiw6cDL28jm6jQwSSZdm7+p1AiFLNipy3JwdhbpKqw32AyG73tPsbZo69kEHfEhXqrI
 R37w==
X-Gm-Message-State: AOAM531A0tLt869v3hBnsXtVRy7QjG+ylA3RjyjyfRMwbAgm7JkbJxu+
 F2sBIVSPxZUkfn2Aib6WL1okixTu4iL0JQ==
X-Google-Smtp-Source: ABdhPJwqQpXYkPP/uBvXsrqKo50ArEqIrOEh1I+nPn6fCjbEvEsu0/2haOdNuD9yhFp3aRQeUA1LSg==
X-Received: by 2002:a4a:c689:: with SMTP id m9mr5389864ooq.70.1619803681301;
 Fri, 30 Apr 2021 10:28:01 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id d207sm297587oob.7.2021.04.30.10.28.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 30 Apr 2021 10:28:00 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/5] bsd-user: style tweak: keyword space (
Date: Fri, 30 Apr 2021 11:27:43 -0600
Message-Id: <20210430172746.99818-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210430172746.99818-1-imp@bsdimp.com>
References: <20210430172746.99818-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::c36;
 envelope-from=imp@bsdimp.com; helo=mail-oo1-xc36.google.com
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
Cc: kevans@freebsd.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/qemu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index d2bcaab741..b836b603af 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -233,7 +233,7 @@ static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
 #define __put_user(x, hptr)\
 ({\
     int size = sizeof(*hptr);\
-    switch(size) {\
+    switch (size) {\
     case 1:\
         *(uint8_t *)(hptr) = (uint8_t)(typeof(*hptr))(x);\
         break;\
@@ -255,7 +255,7 @@ static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
 #define __get_user(x, hptr) \
 ({\
     int size = sizeof(*hptr);\
-    switch(size) {\
+    switch (size) {\
     case 1:\
         x = (typeof(*hptr))*(uint8_t *)(hptr);\
         break;\
-- 
2.22.1



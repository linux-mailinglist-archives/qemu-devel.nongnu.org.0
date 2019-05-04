Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E659F137D3
	for <lists+qemu-devel@lfdr.de>; Sat,  4 May 2019 08:41:20 +0200 (CEST)
Received: from localhost ([127.0.0.1]:51918 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMnxZ-0001ys-T7
	for lists+qemu-devel@lfdr.de; Sat, 04 May 2019 02:15:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42135)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hMncC-0008AT-Tf
	for qemu-devel@nongnu.org; Sat, 04 May 2019 01:53:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hMncC-0004hR-0M
	for qemu-devel@nongnu.org; Sat, 04 May 2019 01:53:40 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:35130)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hMncB-0004gi-RN
	for qemu-devel@nongnu.org; Sat, 04 May 2019 01:53:39 -0400
Received: by mail-pg1-x544.google.com with SMTP id h1so3773942pgs.2
	for <qemu-devel@nongnu.org>; Fri, 03 May 2019 22:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=noj71OX2nBmtjQYQqqpKzc/I+BY/kKSngSA5N+1PwXo=;
	b=f10gAB5VruJnZW4D3xDGE4DyPtMaj1mtYWNggF1S3KEb1aq5nyVdBqBsGu8Un1P0XS
	7MzyGe7FkYoU69kLTfL/iP3fMsX0ReTrpKF5fFQtim63X8M4uKoFgT1F/0zJ6OB25iMb
	iN73RGMrMgDqD/gdHnjAtm6caZrnAbf18VdwqBRO9zMUowKbraaY019YLWITgsStBN1o
	SXpzSFhd+X2DKjv2vO/FFo5c1i3/6JLeI3F7+R2yntnvRZNY2r0JfyYEuAnGLYcJAKH4
	KQ34SmpNqrU3Zr6JA6vcdXNcDQ9AHomA1bk562G5jelWCRU9I6LWkdKh8POb17GNelU+
	OTTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=noj71OX2nBmtjQYQqqpKzc/I+BY/kKSngSA5N+1PwXo=;
	b=I/PxDaBWBQ++I1hl7AEjYWGAVuglo2D5hi9F+fvC/ZVfJenNwGLoeCC3Bj2BtlGlXL
	TwwKopVRSn0xep5eAx4LhQae6OCH+8zJZzNGRUB1j3zcnrkHC7npw1hkeNGJwSNBA2XX
	h+VsKk/CD2Sdzu51w+MUUbH2yR9Pyr3Aeu87pA8yYX8XdAhUQFHCek0/rJ4y85QOmS3s
	OzrjJChur7GN/Iw06YZrvbm8084RyINUV2nWovsrPt86tHDfALpaFOd3exrbu3hp++OG
	1aPHXpqLb3KXmXZKPlZtRaUA1Vj7GvkC3rWml4jDQFNuTNC9Y4Qzg/yJEKWPineGwQln
	j2iw==
X-Gm-Message-State: APjAAAWIJWG8/Xj8VLQC6adcc5nnyLheEode1mqpKvA4+cnNf7IRcoeh
	G+7HRzZ7ZMiuiNIrR4ZUEz1qzQHNXOc=
X-Google-Smtp-Source: APXvYqx6jhL7i1+WbDlLV+qfPO2XKKJ+qXpBCapixxI0xnp7D4kc2HVg9dPgo9HwKoIF1DsHlhGoaQ==
X-Received: by 2002:a65:584f:: with SMTP id s15mr12608825pgr.171.1556949218632;
	Fri, 03 May 2019 22:53:38 -0700 (PDT)
Received: from localhost.localdomain (97-113-189-189.tukw.qwest.net.
	[97.113.189.189]) by smtp.gmail.com with ESMTPSA id
	15sm6680423pfo.117.2019.05.03.22.53.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 May 2019 22:53:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri,  3 May 2019 22:52:59 -0700
Message-Id: <20190504055300.18426-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190504055300.18426-1-richard.henderson@linaro.org>
References: <20190504055300.18426-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: [Qemu-devel] [PATCH v3 30/31] target/xtensa: Use tcg_gen_abs_i32
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alex.bennee@linaro.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Acked-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/translate.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 301c8e3161..b063fa85f2 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -1709,14 +1709,7 @@ void restore_state_to_opc(CPUXtensaState *env, TranslationBlock *tb,
 static void translate_abs(DisasContext *dc, const OpcodeArg arg[],
                           const uint32_t par[])
 {
-    TCGv_i32 zero = tcg_const_i32(0);
-    TCGv_i32 neg = tcg_temp_new_i32();
-
-    tcg_gen_neg_i32(neg, arg[1].in);
-    tcg_gen_movcond_i32(TCG_COND_GE, arg[0].out,
-                        arg[1].in, zero, arg[1].in, neg);
-    tcg_temp_free(neg);
-    tcg_temp_free(zero);
+    tcg_gen_abs_i32(arg[0].out, arg[1].in);
 }
 
 static void translate_add(DisasContext *dc, const OpcodeArg arg[],
-- 
2.17.1



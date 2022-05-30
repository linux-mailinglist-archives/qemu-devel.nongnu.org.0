Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BAD5386C2
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:28:28 +0200 (CEST)
Received: from localhost ([::1]:55704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvjBr-0005Qh-Se
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:28:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvy-0003fe-Gh
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:58 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:38899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvv-0007Aw-NX
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:58 -0400
Received: by mail-wr1-x436.google.com with SMTP id q7so4314885wrg.5
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=F5sFyJYxSoybF4u7wHvAdhirQZdP27+3US2PhPTvM9Q=;
 b=GoXkbn864AEhS9ftSIL4STh+GfwhQATsYJStbHzVD77/K1GrJNmzz7TJAaHOIjQT9V
 tiuHDviUigbg1BxI63ep/5f6iSGjZoT3qR76Bjjwo9u+q5JqUdiwRmB3yHBqGfqSJSDo
 IBTeYH0xFhp5IH9vLZ37bBOjrz4iWuYcp2NKJVwznwl6DGHzYiLakxAVMBIEQg51OEZX
 4ZdOJWK3R2yC2OUoyaGA+ddvWgPmQmEJTkkgTe/iVB7T79546Qmc9mOX4yqeem/F2QwP
 9p/6OvzGAQr9YggRxi2beCVDcytvjsD4z3Fid1MQyPOMPUY2sO3EWSu2Hxp7qdu6xN0Q
 vMIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F5sFyJYxSoybF4u7wHvAdhirQZdP27+3US2PhPTvM9Q=;
 b=lMYlyOzveUzD/NQPDSiih6EaHsCwg9685qQhERudINE3EtVguzdTCrhbXvYT5UtWd0
 lehdbWNV4hId7AmNGBHOpq3/QnIrodEReco6VnCBhppXQuASGVd2Sutktt1TYkS41BOZ
 PJST40GeKatc4soSDN2xs/pTGpA6mb9QczWy+Y8PdysIDDkBhtJ/HiMC2HDyp8n1Nmx6
 K2jC9fLgCTTeYQCqkdbS+VL9pV0uFyvU45z3BbEEY2weiM42E5RZ+BEl7EVzbivERQEr
 U+tdZl35C5mfHdlvPqBB5zBTTdRY9WiVn5kthYvrKvh2syPXjhQU4nHiaXPtXUxalWfb
 /8xg==
X-Gm-Message-State: AOAM531Z3TsGZ+9gk0oC+szSLRRRPQSOHLQ4QsyMfcJyHYabCEE+6u5p
 RhtaQUzhY/h+lNxqdxgMTfT5j6ApqX2XqQ==
X-Google-Smtp-Source: ABdhPJzU7OG92FnSsbKSGmPkL4QFZruOw4PjHfFtgxw8MR4cOcNmKNRiHQxR0Wv7C6Cw7t5AZq2FCA==
X-Received: by 2002:a5d:6487:0:b0:210:11c5:b10e with SMTP id
 o7-20020a5d6487000000b0021011c5b10emr17232517wri.657.1653926873125; 
 Mon, 30 May 2022 09:07:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:52 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 054/117] target/arm: Use TRANS_FEAT for do_predset
Date: Mon, 30 May 2022 17:06:05 +0100
Message-Id: <20220530160708.726466-55-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-52-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index c8eb2c684bd..ce6e000f6ff 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1616,22 +1616,13 @@ static bool do_predset(DisasContext *s, int esz, int rd, int pat, bool setflag)
     return true;
 }
 
-static bool trans_PTRUE(DisasContext *s, arg_PTRUE *a)
-{
-    return do_predset(s, a->esz, a->rd, a->pat, a->s);
-}
+TRANS_FEAT(PTRUE, aa64_sve, do_predset, a->esz, a->rd, a->pat, a->s)
 
-static bool trans_SETFFR(DisasContext *s, arg_SETFFR *a)
-{
-    /* Note pat == 31 is #all, to set all elements.  */
-    return do_predset(s, 0, FFR_PRED_NUM, 31, false);
-}
+/* Note pat == 31 is #all, to set all elements.  */
+TRANS_FEAT(SETFFR, aa64_sve, do_predset, 0, FFR_PRED_NUM, 31, false)
 
-static bool trans_PFALSE(DisasContext *s, arg_PFALSE *a)
-{
-    /* Note pat == 32 is #unimp, to set no elements.  */
-    return do_predset(s, 0, a->rd, 32, false);
-}
+/* Note pat == 32 is #unimp, to set no elements.  */
+TRANS_FEAT(PFALSE, aa64_sve, do_predset, 0, a->rd, 32, false)
 
 static bool trans_RDFFR_p(DisasContext *s, arg_RDFFR_p *a)
 {
-- 
2.25.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA6B5386CE
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:33:48 +0200 (CEST)
Received: from localhost ([::1]:38478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvjH1-0004f6-Rv
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:33:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwa-00040U-B4
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:36 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:40691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwU-0007Rd-34
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:32 -0400
Received: by mail-wr1-x432.google.com with SMTP id k16so10945408wrg.7
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=j38rR0DmUpKr03zUziWy7jqA4Zq/6/O7kU6iERnZ0VY=;
 b=ONex172p7fAE9jfJ78t4A3M5zu6w14nYPJpaGBSowjoSjsweH3ctJhGHPVXipbwByb
 zPcOdk1aT4Kc6p3zfgf0dbhGx+S/uvb8LoGSnoGx9i4MsD+InvEL2dtPN5g2us/T7Hax
 MDiXAD9ztna+csu5gKqej7tiWkLA0R3RMTeOhnCBmJRwZnpgSrnsc3vu1kHr7Fvy3EEZ
 aDW/KVy+1To1queUzXk9Q9NVnDFRaZxGQwJX9iq9VkBDFwHU5TGC87nc339SyxmqyXGJ
 /mGkGDiX4jztjxJHB41V0FKDkMOv0U5hL4OXYuapftUDUw3KZij7DD0ZB5/25mEP0p1y
 vTXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j38rR0DmUpKr03zUziWy7jqA4Zq/6/O7kU6iERnZ0VY=;
 b=nH5Ck5Z6cLzwfNeJ4EMI6Chftn3vsuz1OeHGc7CVNFf28O6GfYv7OyhLQw19JGuUBB
 EyDeGriPSpd1j0qT+Ay4dQ/BnI6J3V+H2hHbMMALLLiUJXnmp7RGMrYy6xv9brHOhlAs
 JmrvCDTb86Jca8xgjIJBAjUy2hVy07lyhsV1BgprFIPIo7zOik9rItmfTAKcG4tPsiBP
 2XtbXWpV8VvSL/n7/iKwewC403pERB7PxlnxHkJwqcVE7bUQoIG6utucXttNZ7tZ0oV1
 pBJ9uudSpvzM4hnFeC8xV38b167ifcgjPAnFDzOzDXyA4DRCJInuZvH7Z1Tq90Ccv1h4
 b45A==
X-Gm-Message-State: AOAM53152Bo8VM5sm4fgagPF/NiDR2vKSTl/De5VY6snI+RJdLnJGkxi
 Ux3EIjWwdODCUmF+r9bmyWhSEo1SXbJDDA==
X-Google-Smtp-Source: ABdhPJx9aUbi7eq+bnc8F2IFxcW1bFqbDls44jJTJnus6qYO8CA1NFZ3xaRYfW9tlnzN3EzW6rb3lA==
X-Received: by 2002:adf:fbcb:0:b0:20e:674f:9364 with SMTP id
 d11-20020adffbcb000000b0020e674f9364mr48143144wrs.430.1653926908608; 
 Mon, 30 May 2022 09:08:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.08.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:08:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 086/117] target/arm: Use TRANS_FEAT for FMLA
Date: Mon, 30 May 2022 17:06:37 +0100
Message-Id: <20220530160708.726466-87-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
Message-id: 20220527181907.189259-84-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 6e8d8d54bfe..5aa3e477cfb 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3521,15 +3521,8 @@ static bool do_FMLA_zzxz(DisasContext *s, arg_rrxr_esz *a, bool sub)
                               a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
 }
 
-static bool trans_FMLA_zzxz(DisasContext *s, arg_FMLA_zzxz *a)
-{
-    return do_FMLA_zzxz(s, a, false);
-}
-
-static bool trans_FMLS_zzxz(DisasContext *s, arg_FMLA_zzxz *a)
-{
-    return do_FMLA_zzxz(s, a, true);
-}
+TRANS_FEAT(FMLA_zzxz, aa64_sve, do_FMLA_zzxz, a, false)
+TRANS_FEAT(FMLS_zzxz, aa64_sve, do_FMLA_zzxz, a, true)
 
 /*
  *** SVE Floating Point Multiply Indexed Group
-- 
2.25.1



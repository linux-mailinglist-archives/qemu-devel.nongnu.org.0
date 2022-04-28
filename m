Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B4C5137EA
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 17:14:59 +0200 (CEST)
Received: from localhost ([::1]:36148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk5r8-0003Hm-UA
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 11:14:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Jx-0005aj-Fp
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:44 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:33701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Ju-0006RO-Ez
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:41 -0400
Received: by mail-wr1-x429.google.com with SMTP id x18so7136437wrc.0
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=FeID3GZ6nfRSoKmaCQL2lyWw7PN3Sq4dYmWusn7u1yg=;
 b=vP4bKARAxJdwk7hiBbC7wgMcOBzarvEaLuWN+HvEBB0nwqAFAPw/5bKfYU3lP+Oog5
 YE+m8mokUjKsOa5cPchCzsI0fk+KRAwxqPORgAYBJ69GDoiaSvLa+WV0+miGuq95RLpX
 seSEkjOqAC3SGwgqMCPXqJ0pChrYUA+3Z8SjlYLJJ3DMbfO5CxjC+9DHqIfBU/k5QnqW
 oy+5ymSofD06tBFZx+OmuxvlHBgTka67fL7uHlyJRo84+J8CUIbmNgquHARuP+37g1x7
 yLxsy3IK35yxPSs1e68Kln2jz1rTi439loocyyRR01FlpeWLIMaJlVMnktiwcfZqnQqB
 aMUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FeID3GZ6nfRSoKmaCQL2lyWw7PN3Sq4dYmWusn7u1yg=;
 b=Jdy9KIHUV2ViC4OFaqDE9qCmFXDVMTK7Nn6sgUBS+cU3ZnJV/sz7gwTA1kLc8fAigK
 z9Yzsh+bGaDiJmqX6EDbtIlYK1NvIts7ENBoQh++bxCGIn5sk/14YtXLBEZvizi/E2DL
 2kla/0pp8LBdqX8o+fcG+RrTh36be3rRCLFtvhmnNBW5BH+MfJVubtvXmyd+qH0Eykkn
 juc5oBrwCKp2FASO6+GCzsNSRzTkPdA+T5tr+Q1s5KTD/FlaHJQp5/orILbwb9jtcjyz
 q6iNPRaRz7AKrkIw9gaFFw1kFhaTH2jNB47MStTULZTrp8STx0KtZQI1ZfvrK4DiUJLP
 5WtA==
X-Gm-Message-State: AOAM530g+w99V4fEs9c4fix79Z3J4Qv/TGpdrtTr23LYT0D+8rVUhLz+
 Cirq1q4nYOSS0/piGudR8vBCeHhZAa/UIw==
X-Google-Smtp-Source: ABdhPJw+hCMxBJTfbCDEldwLNSez+KAoIcnKZB608BnfnOjk0Ikvav8ci/cnQnmbVjKdqUBBRQSXmA==
X-Received: by 2002:a05:6000:1369:b0:20a:c68b:7275 with SMTP id
 q9-20020a056000136900b0020ac68b7275mr27592347wrz.158.1651156834792; 
 Thu, 28 Apr 2022 07:40:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 34/54] target/arm: Use tcg_constant in trans_CPS_v7m
Date: Thu, 28 Apr 2022 15:39:38 +0100
Message-Id: <20220428143958.2451229-35-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220426163043.100432-35-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 0e9fde25897..5ce23947a17 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8835,21 +8835,18 @@ static bool trans_CPS_v7m(DisasContext *s, arg_CPS_v7m *a)
         return true;
     }
 
-    tmp = tcg_const_i32(a->im);
+    tmp = tcg_constant_i32(a->im);
     /* FAULTMASK */
     if (a->F) {
-        addr = tcg_const_i32(19);
+        addr = tcg_constant_i32(19);
         gen_helper_v7m_msr(cpu_env, addr, tmp);
-        tcg_temp_free_i32(addr);
     }
     /* PRIMASK */
     if (a->I) {
-        addr = tcg_const_i32(16);
+        addr = tcg_constant_i32(16);
         gen_helper_v7m_msr(cpu_env, addr, tmp);
-        tcg_temp_free_i32(addr);
     }
     gen_rebuild_hflags(s, false);
-    tcg_temp_free_i32(tmp);
     gen_lookup_tb(s);
     return true;
 }
-- 
2.25.1



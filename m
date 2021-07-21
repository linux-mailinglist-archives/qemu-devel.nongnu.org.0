Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BE63D0934
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 08:51:09 +0200 (CEST)
Received: from localhost ([::1]:35834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m664S-0000qZ-37
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 02:51:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65vl-00057P-6k
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:42:10 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:42691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65vj-0005TQ-JB
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:42:08 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 i16-20020a17090acf90b02901736d9d2218so449744pju.1
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 23:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=KI7SkeMtjhEbYkH+2Re6f8L1tCElUFagFm8gC84/Czo=;
 b=IEo/eTu4COFvw36erdTRwzo3/rk8ON264O4Z6KRJp1uOR0k6YoHWZi4+LM+e/fMQNZ
 O/VYo6YkL/0v2Ldh1ysxas35rQeOobAc4P3O4nfXzahv6xG3RH8nph1Tb8yXzK+WZ546
 iiXuXzZwSkNAHvGCVfzyDZwzv2vuVyrTc63nlx5QR6hR4FClWEJGF+LPXQm8ySTQd2ET
 nxf2u5mPiw+t1Jt+nhgq6WEp/8Zv5tyD+6Y9ARiZq2luSyeqyMiMZh/Ubm+3Wtrh5HyP
 N/o4DTNJ7cfKrMsCd4jE24BW68cxdT7TGd7w7Urgm0JugFYNlh5uwhQk8qwnk3wSnkQ2
 Kp1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KI7SkeMtjhEbYkH+2Re6f8L1tCElUFagFm8gC84/Czo=;
 b=jBYGB5uJXbjrXFBRsjh/M7Mno0UEb9XQKjxctqy6Ku2GqROwTWKytJSiFoI/0spGOh
 UZ34tSFOEYdt49kddcXPVI+5SYRhio2kWhRl0AfCoolHppnEq/7PhfR16nFqXCRcKcUA
 LWn0gbHxjd3qt47h1b3qUxW1/hwPETZFXLrEI0wXH5I19dqoVfWXRsGFyRIIlGXWXBc+
 qm4SKpHO1TB8G+Jd5Tf4C/vQ5DDfPetZOTlqUGhj8BaTyN1XhtoP06frQe+qOANe7igX
 SROulm3zxIwNHpcJzhsVQeB0wVKbSRixx0fDP55Uh+Gn732EY+mmwTBjWoqY219C6TVV
 xG1A==
X-Gm-Message-State: AOAM5332F0y8x+bheUAPPmZur9pnAN1S4+hhh0PEz+lXgBIDJeCKs3V3
 lcnXpw2TpHQIsf4C3j1au/nzlf5xpMyaBQ==
X-Google-Smtp-Source: ABdhPJwZ/8WoI0UAbRXc8Z6H4DFfq3xIPKliFnw21Gp//KEm4QllmnlcPxXkG8mVDOoeAuWWvllZng==
X-Received: by 2002:a17:902:9a81:b029:12b:567:6eef with SMTP id
 w1-20020a1709029a81b029012b05676eefmr26170174plp.35.1626849726313; 
 Tue, 20 Jul 2021 23:42:06 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id q17sm21146132pjd.42.2021.07.20.23.42.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 23:42:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 08/23] target/i386: Check CF_NO_GOTO_TB for dc->jmp_opt
Date: Tue, 20 Jul 2021 20:41:40 -1000
Message-Id: <20210721064155.645508-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721064155.645508-1-richard.henderson@linaro.org>
References: <20210721064155.645508-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We were using singlestep_enabled as a proxy for whether
translator_use_goto_tb would always return false.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index aacb605eee..4bd947cf86 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -8556,6 +8556,7 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     DisasContext *dc = container_of(dcbase, DisasContext, base);
     CPUX86State *env = cpu->env_ptr;
     uint32_t flags = dc->base.tb->flags;
+    uint32_t cflags = tb_cflags(dc->base.tb);
     int cpl = (flags >> HF_CPL_SHIFT) & 3;
     int iopl = (flags >> IOPL_SHIFT) & 3;
 
@@ -8593,14 +8594,14 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     dc->cpuid_ext3_features = env->features[FEAT_8000_0001_ECX];
     dc->cpuid_7_0_ebx_features = env->features[FEAT_7_0_EBX];
     dc->cpuid_xsave_features = env->features[FEAT_XSAVE];
-    dc->jmp_opt = !(dc->base.singlestep_enabled ||
+    dc->jmp_opt = !((cflags & CF_NO_GOTO_TB) ||
                     (flags & (HF_TF_MASK | HF_INHIBIT_IRQ_MASK)));
     /*
      * If jmp_opt, we want to handle each string instruction individually.
      * For icount also disable repz optimization so that each iteration
      * is accounted separately.
      */
-    dc->repz_opt = !dc->jmp_opt && !(tb_cflags(dc->base.tb) & CF_USE_ICOUNT);
+    dc->repz_opt = !dc->jmp_opt && !(cflags & CF_USE_ICOUNT);
 
     dc->T0 = tcg_temp_new();
     dc->T1 = tcg_temp_new();
-- 
2.25.1



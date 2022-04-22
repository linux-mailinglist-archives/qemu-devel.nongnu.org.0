Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7839450B74E
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 14:29:27 +0200 (CEST)
Received: from localhost ([::1]:44796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhsPe-0000Wg-K1
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 08:29:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nhrhZ-0004fZ-8b
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:43:53 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:41496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nhrhX-0003dZ-OC
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:43:52 -0400
Received: by mail-pf1-x42b.google.com with SMTP id p8so7767180pfh.8
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 04:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QVwQva9Md6iPAMBhtpgX4lDVkVKMWkYjnvbA+TeW0JM=;
 b=d+vAEVF/65IXOzhsm3KCfOD01FZxPFutjCrCWtTHQzl4WV/YEoXpJ2zk6QfXdsAsXq
 9FXVt+3eNo2qewFhnj1HrQEqMCy/fnjjozwlbPldpIhluOTiyr0zTpSUH+r21yJBprzN
 kBjqgG3Mb0UQxxAvM5wjQMIXPnPtVF7ESkf8BZ52tjJm5Ih81Zewug0imMX3EPXR5yy9
 UpcXM3Twib9nb6zunXj37o6HygkfJ9KgGRibzvTXMrB90SaUfqvwk7KW1HNmRjS32bIH
 WP2KZlz5ZOl80Q9rXPictZCdRmUo8Qrsk/2miRD5igL40eg/78LLxWAQ1lSLdmVx20bF
 2Dxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QVwQva9Md6iPAMBhtpgX4lDVkVKMWkYjnvbA+TeW0JM=;
 b=BSlJeW6Co7o9sqW3Tl4WuFWjGsUaOWk+YdPyHD330OYBXJSw768Scu8+IyYIotHNG8
 /tgDmCft4NzyygT+9vMUrDqJkfaRKOHUd4wgWLn6jB57GMxwihOne7PMNrIv2MSdgNTO
 1P4k0uJrT1XUdrNQpQMJ5JuZehIh+j0pnXmAqNQ0bO4q2eHWyppVZUsOQUBak/PK8FOz
 gDX01nt3X7YaJOFVdKd2MrJXeR0oTuod7q57tJPTMT7IGSjmW3OBpqYAogI0IIRsREyr
 ktSCM/TFOSmnmuBdQHMF1pWl1pl7wNVeHKIYTodV65512t6auYwkoqTZYNuGueHc3eJj
 KItg==
X-Gm-Message-State: AOAM531ZTK36pnkigjifh/bWeUknOznUMnZt6DA/BhxyWlskFtCvGef6
 tQbYn2juH+w3RxGxdFl2DPSGGuwl/+Y=
X-Google-Smtp-Source: ABdhPJzNZo1v5ziU9rqozfPQcaWaCQnl/ztFn7A1gxV4HDm2u2Rh3A0my+rSZvPHrPcVK5QtIxeI1g==
X-Received: by 2002:a63:fe4d:0:b0:39d:20ac:d7f7 with SMTP id
 x13-20020a63fe4d000000b0039d20acd7f7mr3611933pgj.369.1650627830106; 
 Fri, 22 Apr 2022 04:43:50 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:401:1d20:4c40:4238:b597:4c1a])
 by smtp.gmail.com with ESMTPSA id
 d16-20020a056a00245000b004f7728a4346sm2706519pfj.79.2022.04.22.04.43.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 04:43:49 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/7] target/xtensa: use tcg_constant_* for TLB opcodes
Date: Fri, 22 Apr 2022 04:43:29 -0700
Message-Id: <20220422114332.374472-5-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220422114332.374472-1-jcmvbkbc@gmail.com>
References: <20220422114332.374472-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

dtlb is a boolean flag, use tcg_constant_* for it.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 target/xtensa/translate.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index e92cc6fbf8c6..245c5968bd5d 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -1707,10 +1707,9 @@ static void translate_itlb(DisasContext *dc, const OpcodeArg arg[],
                            const uint32_t par[])
 {
 #ifndef CONFIG_USER_ONLY
-    TCGv_i32 dtlb = tcg_const_i32(par[0]);
+    TCGv_i32 dtlb = tcg_constant_i32(par[0]);
 
     gen_helper_itlb(cpu_env, arg[0].in, dtlb);
-    tcg_temp_free(dtlb);
 #endif
 }
 
@@ -2047,11 +2046,10 @@ static void translate_ptlb(DisasContext *dc, const OpcodeArg arg[],
                            const uint32_t par[])
 {
 #ifndef CONFIG_USER_ONLY
-    TCGv_i32 dtlb = tcg_const_i32(par[0]);
+    TCGv_i32 dtlb = tcg_constant_i32(par[0]);
 
     tcg_gen_movi_i32(cpu_pc, dc->pc);
     gen_helper_ptlb(arg[0].out, cpu_env, arg[1].in, dtlb);
-    tcg_temp_free(dtlb);
 #endif
 }
 
@@ -2250,10 +2248,9 @@ static void translate_rtlb(DisasContext *dc, const OpcodeArg arg[],
         gen_helper_rtlb0,
         gen_helper_rtlb1,
     };
-    TCGv_i32 dtlb = tcg_const_i32(par[0]);
+    TCGv_i32 dtlb = tcg_constant_i32(par[0]);
 
     helper[par[1]](arg[0].out, cpu_env, arg[1].in, dtlb);
-    tcg_temp_free(dtlb);
 #endif
 }
 
@@ -2561,10 +2558,9 @@ static void translate_wtlb(DisasContext *dc, const OpcodeArg arg[],
                            const uint32_t par[])
 {
 #ifndef CONFIG_USER_ONLY
-    TCGv_i32 dtlb = tcg_const_i32(par[0]);
+    TCGv_i32 dtlb = tcg_constant_i32(par[0]);
 
     gen_helper_wtlb(cpu_env, arg[0].in, arg[1].in, dtlb);
-    tcg_temp_free(dtlb);
 #endif
 }
 
-- 
2.30.2



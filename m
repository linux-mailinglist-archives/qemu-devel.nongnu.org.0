Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB69451FC43
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 14:11:07 +0200 (CEST)
Received: from localhost ([::1]:39118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no2EE-0004om-TY
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 08:11:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22Y-0007H4-Jv
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:59:02 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:47027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22W-0001I7-TN
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:59:02 -0400
Received: by mail-wr1-x429.google.com with SMTP id i5so19083154wrc.13
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 04:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=SNNEXS1ZgRVkdqjO580Cr2E6Kdi1t7aqdV46MS2BNEw=;
 b=yqzZWaK3b3AL9Hh6QRmWSVZRLVT/aMXPv8KvS7PfUbtEzDhZJtWqizDOrFhO5o0GmR
 +UgCHdwTYnEUALB+6eJJtVYnFziM2LORdrGg6XXA198QpjIGjLjUKCdc3EA5t/KojgSD
 KycfwuLTJE/0kUAnCOESaCSBt4ICku85LPg3Kfcw8cu9Xi11r1GXc+YunKudR0cYPUwu
 2Ceof9XGMyFjVTQlHfqZ6QF+5vErB30yHYi51V8GOMIA4kj7D374tRKqYGG3VdBsf4sR
 4L6w+cdd1cmCgTrrzUFambGzJch2vPMpYIq8UOIfMjbDoWpwKdpfqh/r/LBqQ2xNpUnX
 Jwng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SNNEXS1ZgRVkdqjO580Cr2E6Kdi1t7aqdV46MS2BNEw=;
 b=I4kT6vd2WkjNoU0O6DUVmaZ3Vib4RjFVgSJCOj7AtilPhiQHVe6KDFBvduj2Xf0KvB
 yeeTrrcSmOweGB7y5nOL2CUCsB9N8LhE9557rbRaLG2XC6jkD3eXTRBg6216u0D+UdJV
 tB94NaBpfdj2pudhbL++HIhwfpDCvVK/Jds3mSoHdhScslWyVnEp6iDzz0uVEK2iq0fo
 wyx14W2vuE3KehyT9d2zOJygp9Rqr9jDnI/yYPs5+hFdZfPMu+5htGPsZOL5hxDJ23kn
 cz9Xinckt/uLHtB/7wFPUB+ZPZQUPQFp/rtVEt9d4F2wOM7lhjsZBOYCNp0R2/4xGSH+
 eH8w==
X-Gm-Message-State: AOAM533FLUDSuunSNRiHnBXYg8BJD7jz3/xrP9sd3wwX3vjoa2NVgu35
 fJBlE3GGk+oPsJxiClGEesc9PfkqT70J7g==
X-Google-Smtp-Source: ABdhPJx9mqlyODTbAJLRBhuRs5USzbrO1f5whAGa143sN6cu4xvUaPmagKJC71wbWGfkKCarhnqgYg==
X-Received: by 2002:adf:f748:0:b0:20c:86d5:c343 with SMTP id
 z8-20020adff748000000b0020c86d5c343mr13628538wrp.477.1652097539979; 
 Mon, 09 May 2022 04:58:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bs6-20020a056000070600b0020c5253d8bdsm12199928wrb.9.2022.05.09.04.58.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 04:58:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/32] target/arm: Enable FEAT_Debugv8p2 for -cpu max
Date: Mon,  9 May 2022 12:58:28 +0100
Message-Id: <20220509115848.3521805-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509115848.3521805-1-peter.maydell@linaro.org>
References: <20220509115848.3521805-1-peter.maydell@linaro.org>
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

The only portion of FEAT_Debugv8p2 that is relevant to QEMU
is CONTEXTIDR_EL2, which is also conditionally implemented
with FEAT_VHE.  The rest of the debug extension concerns the
External debug interface, which is outside the scope of QEMU.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220506180242.216785-12-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu.c              | 1 +
 target/arm/cpu64.c            | 1 +
 target/arm/cpu_tcg.c          | 2 ++
 4 files changed, 5 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index c3bd0676a87..965f35d8c9a 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -14,6 +14,7 @@ the following architecture extensions:
 - FEAT_BTI (Branch Target Identification)
 - FEAT_DIT (Data Independent Timing instructions)
 - FEAT_DPB (DC CVAP instruction)
+- FEAT_Debugv8p2 (Debug changes for v8.2)
 - FEAT_DotProd (Advanced SIMD dot product instructions)
 - FEAT_FCMA (Floating-point complex number instructions)
 - FEAT_FHM (Floating-point half-precision multiplication instructions)
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 7995ff27126..2667aaf28bf 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1806,6 +1806,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
          * feature registers as well.
          */
         cpu->isar.id_pfr1 = FIELD_DP32(cpu->isar.id_pfr1, ID_PFR1, SECURITY, 0);
+        cpu->isar.id_dfr0 = FIELD_DP32(cpu->isar.id_dfr0, ID_DFR0, COPSDBG, 0);
         cpu->isar.id_aa64pfr0 = FIELD_DP64(cpu->isar.id_aa64pfr0,
                                            ID_AA64PFR0, EL3, 0);
     }
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 5fce40a6bc0..202fd5c46e4 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -799,6 +799,7 @@ static void aarch64_max_initfn(Object *obj)
     cpu->isar.id_aa64zfr0 = t;
 
     t = cpu->isar.id_aa64dfr0;
+    t = FIELD_DP64(t, ID_AA64DFR0, DEBUGVER, 8);  /* FEAT_Debugv8p2 */
     t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 5);    /* FEAT_PMUv3p4 */
     cpu->isar.id_aa64dfr0 = t;
 
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index bc8f9d0edf5..b6fc3752f2c 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -76,6 +76,8 @@ void aa32_max_features(ARMCPU *cpu)
     cpu->isar.id_pfr2 = t;
 
     t = cpu->isar.id_dfr0;
+    t = FIELD_DP32(t, ID_DFR0, COPDBG, 8);        /* FEAT_Debugv8p2 */
+    t = FIELD_DP32(t, ID_DFR0, COPSDBG, 8);       /* FEAT_Debugv8p2 */
     t = FIELD_DP32(t, ID_DFR0, PERFMON, 5);       /* FEAT_PMUv3p4 */
     cpu->isar.id_dfr0 = t;
 }
-- 
2.25.1



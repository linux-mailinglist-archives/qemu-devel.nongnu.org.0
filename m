Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B2452DBD6
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 19:50:39 +0200 (CEST)
Received: from localhost ([::1]:58178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrkII-0005EH-Ix
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 13:50:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrk56-00062t-S0
 for qemu-devel@nongnu.org; Thu, 19 May 2022 13:37:01 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:45038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrk55-0000qE-6Y
 for qemu-devel@nongnu.org; Thu, 19 May 2022 13:37:00 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 k126-20020a1ca184000000b003943fd07180so3078067wme.3
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 10:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=BL/qXB6/zju0unYgvtD/Wyfgy5SQeOGuUnN/S+CQN+U=;
 b=G2yHKUZIPuOHRY4+AAsTXh9rVXfYdP4KAunqZVauxsI9VUyvQbljb7p8AppMQb70WR
 mJ7HhzHvqmy37YeVQlFdpqjFnjvoe+eXzmdEyki0C1HBubYUk1zqVX+EtW9IUo0DcIDH
 R2YH/SyvuHSogEkdkcl/Zvw7is65NuQpuNSAme+of4h6W+y5Yt+5VzbspQynPzD2zlIY
 SvUU+C/1EPVylrkzlbxZwtrQaE+reJQkM0qZLs36zttfq6IlhiHdjm4MYgcs1BbVG8Sb
 MtuH8uo+kGg4z8wFhSQXWDpBzP5BQdpLWC2XXY1egc9PD3UoUGgOUO3IVgcZEDXsbTMx
 KdzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BL/qXB6/zju0unYgvtD/Wyfgy5SQeOGuUnN/S+CQN+U=;
 b=gS8dZEqdJYMVfKuVJBdXk6BYRS1djD02POIsulM6mauqFoHOd1ccCsxN/u+NCjmHAC
 94/Y5ScIpr/jXQadYeLmlUS3rMf5SMDakV/1sB2d6x4K34k2paK7dPywWfGRaOIx+5Yh
 zUtuqN6tLaFUY6NfAUjb1zQc83GjV+QaWV25tyI3fJiVyQSPsW4q8Y4mDWiPVhJvXvie
 U2w5x8+hTHKfdeuZwUdLZ5oFkQSStgCTXumCQbtuJX20j35TIAsNu0/IJizmXDOqNlnR
 7D2+UoVMXjU1Nc19h29dRNHUem5aIsYFxcutpDTNOWo9430uYGYLXZiJ4vBDBdRMXRGn
 ScPQ==
X-Gm-Message-State: AOAM530TYF9iMVv1kKRpgdVJNx2+cQa+qwE41ukj4J0LpaWwVmtawJau
 /1OKKTW9ds/UQgjz4J98pH6VrMCuzTp3BQ==
X-Google-Smtp-Source: ABdhPJz8cAmG4aVolfkFw+m4+jUSgG/u9ukhAyEy/Eyf3bNeYpF9M4gfGiCqS5mVyNNqOVClPglrvQ==
X-Received: by 2002:a05:600c:1e23:b0:394:6133:a746 with SMTP id
 ay35-20020a05600c1e2300b003946133a746mr4712999wmb.17.1652981817036; 
 Thu, 19 May 2022 10:36:57 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e2-20020adfa742000000b0020c5253d8f2sm180183wrd.62.2022.05.19.10.36.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 10:36:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/22] target/arm: Enable FEAT_S2FWB for -cpu max
Date: Thu, 19 May 2022 18:36:33 +0100
Message-Id: <20220519173651.399295-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519173651.399295-1-peter.maydell@linaro.org>
References: <20220519173651.399295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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

Enable the FEAT_S2FWB for -cpu max. Since FEAT_S2FWB requires that
CLIDR_EL1.{LoUU,LoUIS} are zero, we explicitly squash these (the
inherited CLIDR_EL1 value from the Cortex-A57 has them as 1).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220505183950.2781801-5-peter.maydell@linaro.org
---
 docs/system/arm/emulation.rst |  1 +
 target/arm/cpu64.c            | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 8ed466bf68e..8f25502ced7 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -52,6 +52,7 @@ the following architecture extensions:
 - FEAT_RAS (Reliability, availability, and serviceability)
 - FEAT_RDM (Advanced SIMD rounding double multiply accumulate instructions)
 - FEAT_RNG (Random number generator)
+- FEAT_S2FWB (Stage 2 forced Write-Back)
 - FEAT_SB (Speculation Barrier)
 - FEAT_SEL2 (Secure EL2)
 - FEAT_SHA1 (SHA1 instructions)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 04427e073f1..e83c013e1fe 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -812,6 +812,7 @@ static void aarch64_max_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
     uint64_t t;
+    uint32_t u;
 
     if (kvm_enabled() || hvf_enabled()) {
         /* With KVM or HVF, '-cpu max' is identical to '-cpu host' */
@@ -842,6 +843,15 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, MIDR_EL1, REVISION, 0);
     cpu->midr = t;
 
+    /*
+     * We're going to set FEAT_S2FWB, which mandates that CLIDR_EL1.{LoUU,LoUIS}
+     * are zero.
+     */
+    u = cpu->clidr;
+    u = FIELD_DP32(u, CLIDR_EL1, LOUIS, 0);
+    u = FIELD_DP32(u, CLIDR_EL1, LOUU, 0);
+    cpu->clidr = u;
+
     t = cpu->isar.id_aa64isar0;
     t = FIELD_DP64(t, ID_AA64ISAR0, AES, 2);      /* FEAT_PMULL */
     t = FIELD_DP64(t, ID_AA64ISAR0, SHA1, 1);     /* FEAT_SHA1 */
@@ -918,6 +928,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64MMFR2, IESB, 1);     /* FEAT_IESB */
     t = FIELD_DP64(t, ID_AA64MMFR2, VARANGE, 1);  /* FEAT_LVA */
     t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1);       /* FEAT_TTST */
+    t = FIELD_DP64(t, ID_AA64MMFR2, FWB, 1);      /* FEAT_S2FWB */
     t = FIELD_DP64(t, ID_AA64MMFR2, TTL, 1);      /* FEAT_TTL */
     t = FIELD_DP64(t, ID_AA64MMFR2, BBM, 2);      /* FEAT_BBM at level 2 */
     cpu->isar.id_aa64mmfr2 = t;
-- 
2.25.1



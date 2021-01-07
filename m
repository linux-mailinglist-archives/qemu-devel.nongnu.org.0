Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 705F12EE905
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 23:46:22 +0100 (CET)
Received: from localhost ([::1]:35040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxe2v-0005P2-Dv
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 17:46:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdiO-0000cI-Vk
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:25:09 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:37588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdiN-0005NB-Cj
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:25:08 -0500
Received: by mail-wm1-x333.google.com with SMTP id q75so6840035wme.2
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZbrS3lwYRxTRTFDPc0/zNPF7RtQTn+hbYyf7KgsVbYc=;
 b=lIkcglkgVN21uCEiEunLDhrdJAPFUj+xEtRIzT62MEGmRZHsmaCrQxDp1vg7xM09wn
 CpTf3suuwqPqpdM6NboTUEgrH8e8+a6zikA+3Jl9tDWzHl2+qE5U63z8mEJYRHQA2YLt
 j2r0h8OZHsOnOMt5ZPyZ2fiW5d5aAE2KI1M1YMr70tv+pnh7OFTN162aCZbqnnICp2tU
 RuEL+3V4TfAPJKecrTS/fHFFbpMMcmk1ZwYiTK9kC+PVLq+wPmW/G6fXWDlS86IHAqGO
 Vzm1cPM0FZ3xWpNNKCka5C+6RYjjJne3GjyNffGdZNQEgBpLYbILz4buTquH47RQ3MTx
 hJIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZbrS3lwYRxTRTFDPc0/zNPF7RtQTn+hbYyf7KgsVbYc=;
 b=KanksCmvvZDTmHcP26a/csbvWWoipR57HTw64T1ZTvC3a2KNcH4jL3Dl6z4tO5bfU2
 beqiKs11UnlHzjQIW+UBRX6T37r7foyOXwb/oj59Yv87KI1RiBr+NMPDd1uX7XQJkFQ6
 W5Y8NZyk4c7g3N/sFrRWJCABzQ0CowbrB0IEElKSz3Q2yp2IHP7jriggaegUqOQzpYv4
 Ryv4n50PB9JLM9gCEFWRqGSQclnVy8exusyOSP8cufzM78/sY+coFPpDySXD8rHHVP8V
 5MMOU4o8+eKzrcMBsUQSqfrWlRA4KyRlowPgoIvh7BdAwVbX8Pi2F5Dwo5pvqBVkOkSi
 lGog==
X-Gm-Message-State: AOAM530mMWYJFBEPMF11Lz3GTBKpQD/jmVROVRbEhcbUglZWP6MqlwjB
 c4jT1XPqNKdqjaidRrdPsn/jGPS2EW4=
X-Google-Smtp-Source: ABdhPJzbX3i0+o+WsTnVEJ4EExrsavAWV4+8h19zG+o5Hahro23lxmuhWyBBgQorIBRxeCpsbjMgAQ==
X-Received: by 2002:a7b:c406:: with SMTP id k6mr520768wmi.90.1610058305846;
 Thu, 07 Jan 2021 14:25:05 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id m2sm9131291wml.34.2021.01.07.14.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:25:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/66] target/mips: Fix code style for checkpatch.pl
Date: Thu,  7 Jan 2021 23:22:12 +0100
Message-Id: <20210107222253.20382-26-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 libvir-list@redhat.com, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are going to move this code, fix its style first.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201206233949.3783184-14-f4bug@amsat.org>
---
 target/mips/translate_init.c.inc | 36 ++++++++++++++++----------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/target/mips/translate_init.c.inc b/target/mips/translate_init.c.inc
index 044052fb77c..21ee22c05dc 100644
--- a/target/mips/translate_init.c.inc
+++ b/target/mips/translate_init.c.inc
@@ -936,19 +936,19 @@ void mips_cpu_list(void)
 }
 
 #ifndef CONFIG_USER_ONLY
-static void no_mmu_init (CPUMIPSState *env, const mips_def_t *def)
+static void no_mmu_init(CPUMIPSState *env, const mips_def_t *def)
 {
     env->tlb->nb_tlb = 1;
     env->tlb->map_address = &no_mmu_map_address;
 }
 
-static void fixed_mmu_init (CPUMIPSState *env, const mips_def_t *def)
+static void fixed_mmu_init(CPUMIPSState *env, const mips_def_t *def)
 {
     env->tlb->nb_tlb = 1;
     env->tlb->map_address = &fixed_mmu_map_address;
 }
 
-static void r4k_mmu_init (CPUMIPSState *env, const mips_def_t *def)
+static void r4k_mmu_init(CPUMIPSState *env, const mips_def_t *def)
 {
     env->tlb->nb_tlb = 1 + ((def->CP0_Config1 >> CP0C1_MMU) & 63);
     env->tlb->map_address = &r4k_map_address;
@@ -960,25 +960,25 @@ static void r4k_mmu_init (CPUMIPSState *env, const mips_def_t *def)
     env->tlb->helper_tlbinvf = r4k_helper_tlbinvf;
 }
 
-static void mmu_init (CPUMIPSState *env, const mips_def_t *def)
+static void mmu_init(CPUMIPSState *env, const mips_def_t *def)
 {
     env->tlb = g_malloc0(sizeof(CPUMIPSTLBContext));
 
     switch (def->mmu_type) {
-        case MMU_TYPE_NONE:
-            no_mmu_init(env, def);
-            break;
-        case MMU_TYPE_R4000:
-            r4k_mmu_init(env, def);
-            break;
-        case MMU_TYPE_FMT:
-            fixed_mmu_init(env, def);
-            break;
-        case MMU_TYPE_R3000:
-        case MMU_TYPE_R6000:
-        case MMU_TYPE_R8000:
-        default:
-            cpu_abort(env_cpu(env), "MMU type not supported\n");
+    case MMU_TYPE_NONE:
+        no_mmu_init(env, def);
+        break;
+    case MMU_TYPE_R4000:
+        r4k_mmu_init(env, def);
+        break;
+    case MMU_TYPE_FMT:
+        fixed_mmu_init(env, def);
+        break;
+    case MMU_TYPE_R3000:
+    case MMU_TYPE_R6000:
+    case MMU_TYPE_R8000:
+    default:
+        cpu_abort(env_cpu(env), "MMU type not supported\n");
     }
 }
 #endif /* CONFIG_USER_ONLY */
-- 
2.26.2



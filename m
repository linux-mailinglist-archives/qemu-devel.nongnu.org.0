Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F4F2D0848
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 00:56:38 +0100 (CET)
Received: from localhost ([::1]:50316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1km3tN-0005C3-H5
	for lists+qemu-devel@lfdr.de; Sun, 06 Dec 2020 18:56:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1km3eI-0005xv-4E
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 18:41:02 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:46110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1km3eG-0007vZ-DW
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 18:41:01 -0500
Received: by mail-wr1-x441.google.com with SMTP id l9so1889443wrt.13
 for <qemu-devel@nongnu.org>; Sun, 06 Dec 2020 15:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T3FlFk78pLMkupK1YI/tjtH+Hq+IGEC+koiKdnLg6D4=;
 b=Nd40X/OAaFHU7qiOSgMuQvCbYgV4L46HRjBTenvdE6K7BjJktwpHXWNVaawkhTZbhQ
 f1XDpTbKYfXjgWpc7PVXdXJcmdYjn1hMiVuHUtsfsFC65VKnFs6+HEpRYrSn9o65epuS
 5lgBLiZgQz8UrVk5IAkyx1imzjlUXcmBxmReRL8UIury8SpVuEoBWJF+SZTJmZ9U7HVI
 AlZq61DO68FzIZgkldq06THajtSF5NmsGFoDIjYw/0xsm87uVB5OezgFTXZrItwUvXYZ
 2WshCAmKuvvR9dfxG092CZwgXaPEVskHC3S/ioc07+Hob0/TSzoAcpYt7ZLuiEX7P6F9
 vFVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=T3FlFk78pLMkupK1YI/tjtH+Hq+IGEC+koiKdnLg6D4=;
 b=N5rZTJH+JrwGitJDUyW0aq9u/Bu71r/TvbDmmGxewDNuvKT4CIswHZ5iRDoDW1ETHn
 vPShitdFSRD8SVC8RjwivBuWWwtqfECO7v0oCeSQ5B6bztJZ6F1GPu1mY9ptNMOq95u2
 fQPTk06LzIYiyt+p90BPU741aJBqEkr+ykni1kFQ8zSAsXnFvnyWT8GXQ4d12muaTxVE
 RGuAsZUv1aA0f1ROshcEgcQ8Ln5fTJmJXhi4vmDOPky5ZYQ/pMekRU9C4P62qubQHgSy
 29gKYy02uBbyJ+p0bBDNxgC1vYqib1Af+KFwHPJUbMhE9we+MUAo+YVnyS0XGKNvKi/s
 VUvA==
X-Gm-Message-State: AOAM530S9swJ2snUYsZXc/H7CV6tXMDd6VQvEVrIUROQXpbK3sGiqUMv
 1sgtsbl8BdcvN2ewc9WI56oDSaIeW24=
X-Google-Smtp-Source: ABdhPJw8IuYkegnv9iK+VaKUkUOm0Qb6xkjQ5rtQTFv+GuhbUTLtX2B/74LwkiAvEJAHYh99X9An8g==
X-Received: by 2002:a05:6000:187:: with SMTP id
 p7mr16728218wrx.240.1607298058923; 
 Sun, 06 Dec 2020 15:40:58 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id v64sm12121580wme.25.2020.12.06.15.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 15:40:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/19] target/mips: Fix code style for checkpatch.pl
Date: Mon,  7 Dec 2020 00:39:43 +0100
Message-Id: <20201206233949.3783184-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201206233949.3783184-1-f4bug@amsat.org>
References: <20201206233949.3783184-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are going to move this code, fix its style first.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate_init.c.inc | 36 ++++++++++++++++----------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/target/mips/translate_init.c.inc b/target/mips/translate_init.c.inc
index ea85d5c6a79..535b52b5444 100644
--- a/target/mips/translate_init.c.inc
+++ b/target/mips/translate_init.c.inc
@@ -932,19 +932,19 @@ void mips_cpu_list(void)
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
@@ -956,25 +956,25 @@ static void r4k_mmu_init (CPUMIPSState *env, const mips_def_t *def)
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



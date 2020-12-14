Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0842D9F9B
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 19:52:46 +0100 (CET)
Received: from localhost ([::1]:44664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kosxh-00035j-Hw
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 13:52:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kosjl-0008F7-2N
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 13:38:21 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:37648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kosjj-0007Ri-Gd
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 13:38:20 -0500
Received: by mail-wm1-x330.google.com with SMTP id q75so16195829wme.2
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 10:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1YHqfW9C9zJMYC4AZlw/rgEaF/1fbEs/5bZEvXJxOms=;
 b=NFZKb47HS15qKB3UYMr+dzqvtDKW4LVGYn53nUuezRuuuZx0/i+K9MpNxIaDZQkfD7
 o9XG0NfiKVZAZCviwFql8IBz5V4qlv3xKF/AnfImdPOU6cg0sw22R45IkKZIvOk9e2+x
 PsTMXsFYEasWyTX7FJOX2/8Ef0nf99oADa8+d9c8v4C+jhIYCVUIRnZLAlcCuFTrMpSr
 LKGQWD57apC7qhn+WBRbcQmORjXvXY24jm/Ism+alV6z5uRJ5mPICo+nle0BD2vlJy+c
 bW+0hx1pyfIY/rHS3Iib1Q4H47kvRSp5Pe+4fW/qHfF04v++9DU4Mw4eH64by8e+PUXF
 X1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1YHqfW9C9zJMYC4AZlw/rgEaF/1fbEs/5bZEvXJxOms=;
 b=rZ48ftwbPbW5AnyiZ/vuPbMS204xK/ds7UmtLQhyKEfZvlRdAK3dhAMQPVKX6lqydS
 MSUmCW0mbtqfWAm0jB6O22QXpBjKf/R8BKay1zfG8zLyBu99L5d8aXuK/8d9Uie6lKmU
 JlFX0MNx6ZQ1YgMYxdoxirJnS0weOolwCQ6iaYzRcr5RuG/haJyUamjB+17tiABCw8tX
 m1f6zrfhOFYCXFIr/q4ptOJk/bf+jw1N9MyQwJgrA+TKacRJfO2i+drRRdbuyYHngl+d
 +aXi3yz2N641qIqZ1b2ZPohl2MGAwSUxWYdfpuuQ8eXNYLXxskQblsoU+4mp1Dkf9LrS
 43lg==
X-Gm-Message-State: AOAM532NMYqjWR5EdezqHXwWJoPwx1RTdiBNDC8rFpnv2jkqhrtsAFgi
 h2ZtMuQye8u/f3vabv47lvtuiESVGu8=
X-Google-Smtp-Source: ABdhPJxwtUczlKopDRSmG1EyYSoU0DtPkmTvGdqnbZDV9LhACCcRBx2qy8ZipUeryy41Sg/B180lGQ==
X-Received: by 2002:a1c:790f:: with SMTP id l15mr29516909wme.188.1607971097824; 
 Mon, 14 Dec 2020 10:38:17 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id j10sm15660953wmj.7.2020.12.14.10.38.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 10:38:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/16] target/mips: Fix code style for checkpatch.pl
Date: Mon, 14 Dec 2020 19:37:30 +0100
Message-Id: <20201214183739.500368-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201214183739.500368-1-f4bug@amsat.org>
References: <20201214183739.500368-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
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
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
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
index 915277dd1f6..ff14502529b 100644
--- a/target/mips/translate_init.c.inc
+++ b/target/mips/translate_init.c.inc
@@ -934,19 +934,19 @@ void mips_cpu_list(void)
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
@@ -958,25 +958,25 @@ static void r4k_mmu_init (CPUMIPSState *env, const mips_def_t *def)
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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F8F2EE8D6
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 23:38:41 +0100 (CET)
Received: from localhost ([::1]:41008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxdvU-0004HJ-RN
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 17:38:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdi4-0008TD-FL
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:24:48 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:36550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdi2-0005D2-V0
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:24:48 -0500
Received: by mail-wr1-x42e.google.com with SMTP id t16so7143338wra.3
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r446af/BEgIH/8cqnACVmQPnVuqEMMgc7/K3JtKHKOk=;
 b=qpGFzj6m5FFszD8aYLBDnx6u1j4Fcq3cD4+18rtk/1dXSmrBZ7SxbOv+JTQbaOoamo
 VghsaUWLHh3z1PxUodplat8odiJmWx0t9EH3Q/5sbMdZ7yuAfERITlKxX45V4kIVnboF
 6+nZogq77Fzm63hXVLs2L9smY3wRGF1TnuDgwiY8F2/qfk4PtM8n9oWO27kWk6uAuJak
 t/xMkhi8cXqFgMrt7l4jsAkxM5Q1BjXqqKeCshZ9geLomJE24dPBOxRMz5FqGrGmwys1
 qRomXr8fWuRAPa1ec5UgGXS6gIxpF3CdnYl/+tUhko6aT43mCjZkXl4Gxk0HAkJf9tvl
 EcFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=r446af/BEgIH/8cqnACVmQPnVuqEMMgc7/K3JtKHKOk=;
 b=ob7j1pPOzYA3skeE/FrPXlpQEv9stB16pfx18wtupLjtB7WAgXt1GkoctC/PMBNozu
 JdmLHl5MI5y/YH5Js9AziXjBaN5F4HCpzWCL3jhnFM00YMiPvq8Yddjq+5U3JeYw0wwD
 RpFPFhJM4ENfY+F8BF2V+ElRAvwkcKKEW4aQL2gAZ8wvPUdZUgnD563eUUXdwaQPnCix
 lFd4/qBC8/f3J9djd994Ll9vXhD/IpLO2JyJFLci3AVtgJ72O9YHe8Z4nsapO0mrMedU
 Wfp4gSZggl16ZhACP06qK/ny0yQGQcKNypMC1FB9EnQPM1nU5Knnfa4rIxrDM5b5sVAi
 pg8g==
X-Gm-Message-State: AOAM532cz76+uxJrXaMeJ+/obAsR0CHPUaeEkmzw9OYaDFSGaftGv2nq
 p0zOCd8W+xnxl7yRtNMk8bOQHbPKCws=
X-Google-Smtp-Source: ABdhPJwCsmyU6k2gmlk9eYhvqhY92VyIIL3GWXGM3B7ZnDJ3ScTAoH3Xic2OzXnKHm6okNdHJVKirQ==
X-Received: by 2002:a5d:4ad0:: with SMTP id y16mr662380wrs.424.1610058285366; 
 Thu, 07 Jan 2021 14:24:45 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id n9sm10103105wrq.41.2021.01.07.14.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:24:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/66] target/mips: Add !CONFIG_USER_ONLY comment after #endif
Date: Thu,  7 Jan 2021 23:22:08 +0100
Message-Id: <20210107222253.20382-22-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
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

To help understand ifdef'ry, add comment after #endif.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201214183739.500368-4-f4bug@amsat.org>
---
 target/mips/helper.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/target/mips/helper.c b/target/mips/helper.c
index d1b6bb6fb23..92bd3fb8550 100644
--- a/target/mips/helper.c
+++ b/target/mips/helper.c
@@ -455,7 +455,8 @@ void cpu_mips_store_cause(CPUMIPSState *env, target_ulong val)
         }
     }
 }
-#endif
+
+#endif /* !CONFIG_USER_ONLY */
 
 static void raise_mmu_exception(CPUMIPSState *env, target_ulong address,
                                 int rw, int tlb_error)
@@ -537,6 +538,7 @@ static void raise_mmu_exception(CPUMIPSState *env, target_ulong address,
 }
 
 #if !defined(CONFIG_USER_ONLY)
+
 hwaddr mips_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
 {
     MIPSCPU *cpu = MIPS_CPU(cs);
@@ -550,7 +552,7 @@ hwaddr mips_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     }
     return phys_addr;
 }
-#endif
+#endif /* !CONFIG_USER_ONLY */
 
 #if !defined(CONFIG_USER_ONLY)
 #if !defined(TARGET_MIPS64)
@@ -886,7 +888,7 @@ refill:
     return true;
 }
 #endif
-#endif
+#endif /* !CONFIG_USER_ONLY */
 
 bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType access_type, int mmu_idx,
@@ -1088,7 +1090,8 @@ static inline void set_badinstr_registers(CPUMIPSState *env)
         env->CP0_BadInstrP = cpu_ldl_code(env, env->active_tc.PC - 4);
     }
 }
-#endif
+
+#endif /* !CONFIG_USER_ONLY */
 
 void mips_cpu_do_interrupt(CPUState *cs)
 {
@@ -1482,7 +1485,7 @@ void r4k_invalidate_tlb(CPUMIPSState *env, int idx, int use_extra)
         }
     }
 }
-#endif
+#endif /* !CONFIG_USER_ONLY */
 
 void QEMU_NORETURN do_raise_exception_err(CPUMIPSState *env,
                                           uint32_t exception,
-- 
2.26.2



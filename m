Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 009EE2D083B
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 00:52:44 +0100 (CET)
Received: from localhost ([::1]:40492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1km3pb-00011W-0q
	for lists+qemu-devel@lfdr.de; Sun, 06 Dec 2020 18:52:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1km3e3-0005j4-9Q
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 18:40:47 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:38924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1km3e1-0007qD-PM
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 18:40:46 -0500
Received: by mail-wr1-x434.google.com with SMTP id e7so11027866wrv.6
 for <qemu-devel@nongnu.org>; Sun, 06 Dec 2020 15:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B/NrR5V+/HZCdWuAnYAqhfTZDaNUhGvFBTcglSmrBsA=;
 b=m4z3WWoyk+Rg3BjX02RHRMctF6LXJkoNf3ztaE25+iOXC9vzlk5ns3EEXqsXAFIleR
 HcOahTgCJFR6V6F0LhW7mG9nwgsYYPBcwgHruLbE4h0Om005WfLjbM54R8ntvbLJfxep
 oJb2JFQMDn607DTV0uDAvPe7H8A74HIiBu7XZxsxYfTDQbB7DtY7I1hKezTnb7qnoFY5
 GyB36yDYuaP1V5BhCwU2rGqWKD10FlXUoyu54XfXWWeXiuYIjhWb7TrvK6VFWqz6DPih
 YiHl66Z2/hp9/Z8bM18m8sNGbJB377p6Ek3mwICiNHoarz/Pqa9UvHACAuTO2988L0uQ
 M/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=B/NrR5V+/HZCdWuAnYAqhfTZDaNUhGvFBTcglSmrBsA=;
 b=eEo4rY/csLxiuBP0TjF7PFKpn1IazyWgL+SCh8tVuQhssXEs1yv4+UtSbK7WYih79h
 3/AoS9ca4TQ6CfsKw7D98p9zMJt6u2je6FeqrzmTBiIn3fPvlHVCCwiATqdiEwjySoW2
 VV5rbuaN4PIORodpv7+vAvf6bxYk8FUxJfBF8+mZgMHQ4G24S28dXHlyjJsEdPTbc9Bz
 Ip5tysJVWrzroKt8kcp2kNa+PwIwJj8Z6oPdEdsgSSVIQMGanmpakGd+QFFEJiKFe+md
 OpsmHgFTZJ8LGj7m/D6b23a5l0VSXUlnq+5I0U7zuvoIxevlEcob9C7T7i45yZV7wdeu
 TQEw==
X-Gm-Message-State: AOAM533n/JWgqI5knhsWI4sBYvArrDlJn7NlZFbviIVctNI3Sh1SdAum
 6B6lLTkn77XR2L8uF/r7MEARCQQiD/s=
X-Google-Smtp-Source: ABdhPJwmEAy9N8jHYAPoMpDouYPkT9Pj6b8gyMnw9VTr/7xAEcomMuXXl66GctcoGDdBkCySGNDXGQ==
X-Received: by 2002:adf:b74d:: with SMTP id n13mr16913334wre.101.1607298043036; 
 Sun, 06 Dec 2020 15:40:43 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id n10sm12603481wrv.77.2020.12.06.15.40.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 15:40:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/19] target/mips: Add !CONFIG_USER_ONLY comment after #endif
Date: Mon,  7 Dec 2020 00:39:40 +0100
Message-Id: <20201206233949.3783184-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201206233949.3783184-1-f4bug@amsat.org>
References: <20201206233949.3783184-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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

To help understand ifdef'ry, add comment after #endif.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/helper.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/mips/helper.c b/target/mips/helper.c
index bb962a3e8cc..6d33809fb8b 100644
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
@@ -550,9 +552,7 @@ hwaddr mips_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     }
     return phys_addr;
 }
-#endif
 
-#if !defined(CONFIG_USER_ONLY)
 #if !defined(TARGET_MIPS64)
 
 /*
@@ -886,7 +886,7 @@ refill:
     return true;
 }
 #endif
-#endif
+#endif /* !CONFIG_USER_ONLY */
 
 bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType access_type, int mmu_idx,
@@ -1017,7 +1017,7 @@ static const char * const excp_names[EXCP_LAST + 1] = {
     [EXCP_MSADIS] = "MSA disabled",
     [EXCP_MSAFPE] = "MSA floating point",
 };
-#endif
+#endif /* !CONFIG_USER_ONLY */
 
 target_ulong exception_resume_pc(CPUMIPSState *env)
 {
@@ -1080,7 +1080,8 @@ static inline void set_badinstr_registers(CPUMIPSState *env)
         env->CP0_BadInstrP = cpu_ldl_code(env, env->active_tc.PC - 4);
     }
 }
-#endif
+
+#endif /* !CONFIG_USER_ONLY */
 
 void mips_cpu_do_interrupt(CPUState *cs)
 {
@@ -1480,7 +1481,7 @@ void r4k_invalidate_tlb(CPUMIPSState *env, int idx, int use_extra)
         }
     }
 }
-#endif
+#endif /* !CONFIG_USER_ONLY */
 
 void QEMU_NORETURN do_raise_exception_err(CPUMIPSState *env,
                                           uint32_t exception,
-- 
2.26.2



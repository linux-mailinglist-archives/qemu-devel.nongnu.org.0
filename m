Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDCF2D9F68
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 19:43:58 +0100 (CET)
Received: from localhost ([::1]:52654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kospB-0002Xb-Hy
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 13:43:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kosjT-00088P-1H
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 13:38:03 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:54590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kosjP-0007Ng-Ak
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 13:38:00 -0500
Received: by mail-wm1-x32a.google.com with SMTP id c133so2671153wme.4
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 10:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tkYIisFgK6Je25iDH+AcvdFQgbr8b03Vk9AV0zMlHWI=;
 b=hgL3Ac52u3mHBafiHWMQFZ22Iz9iA+Su5rN5IOY9SxxsUtNm3tSIXIZgoUPSbW35cm
 c2SVS3s/gtJEm0xzO+5g7DRoQmlZ4fwJEgCwd1trER19AAl5aD1P30esrymA8yESj3ND
 l8tbsA6hnXMPal+/PgwbdFUAVa6uUKbTCIxkzxYUzyNPD5jBKTOuCBvizf382DksF7JP
 YbNBCSN5D3xjr5rq8dIL/lR8YDyXg/iYvUYglHdyRPTNoQq9DjEU01Gqd8tIt2V91JKz
 STe93f1h68AdAskIYZb/HAua3Tc4iNJAxv8u2rKyNuJnQEq4VHADmGiJNBmBGVhNZcK1
 X6Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tkYIisFgK6Je25iDH+AcvdFQgbr8b03Vk9AV0zMlHWI=;
 b=ZphPsDr8hiLTDXruStMYTloOpx+XsBLf6gG1/ShaINr43fTgMjHB69txlC4uX+7XaC
 wtDkWVAIXrYEWkID2U6BwKZ2khKWd2BMGvRwBbT+NxgOdnTNBhoxBmOP5ptLrSFULt8P
 LE0UfOZQp3rpgH1vjcd/zAR7rw5wxOQHre8xnC/Zb21x94rlg2K59WdrMT6ZFq6AC6G+
 le5mbrNmQfJauMWXTebp8UdxrV7LGNMc4sZnaE4eh2r4CuOBOxSgAa3ItU3dTNDPlsih
 mNWuGcQGjIvjuu1AqtUIWnT5ONVkp1ULHYoPyjiWV8MaVDHDlM0KkkZgg4SC87LGT5sm
 1SiA==
X-Gm-Message-State: AOAM530vs+nM+A24K3vNtZ/mStZXn3LRpHgBJnYpJCIoPP6MBNxVzZ3c
 quRBILdJvTsDjDlGROln8ecdfkt/tes=
X-Google-Smtp-Source: ABdhPJwzkNHg3Tv/g0fScefe8FqRMtvselhx3j0oy/GqpnxEqHkfTN6UAORwsjlkl1T0lM6wjnSslA==
X-Received: by 2002:a1c:6a10:: with SMTP id f16mr29145023wmc.106.1607971077643; 
 Mon, 14 Dec 2020 10:37:57 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id p15sm24306743wrt.15.2020.12.14.10.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 10:37:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/16] target/mips: Add !CONFIG_USER_ONLY comment after
 #endif
Date: Mon, 14 Dec 2020 19:37:26 +0100
Message-Id: <20201214183739.500368-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201214183739.500368-1-f4bug@amsat.org>
References: <20201214183739.500368-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
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
 Huacai Chen <chenhuacai@kernel.org>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To help understand ifdef'ry, add comment after #endif.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/helper.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/target/mips/helper.c b/target/mips/helper.c
index 87296fbad69..cdd7704789d 100644
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



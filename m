Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB862EE8BF
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 23:32:31 +0100 (CET)
Received: from localhost ([::1]:45408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxdpW-00022G-Fp
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 17:32:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdgx-00079O-25
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:23:40 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:35155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdgu-0004ol-Kz
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:23:38 -0500
Received: by mail-wm1-x329.google.com with SMTP id e25so6852348wme.0
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3Ch2a+v0V9pkwP2v4j689PWjNoR3rWExCE6zEXoddgE=;
 b=F57d2OKfrrp3wKUvNPdjKLIL1JjNbvqvSnUIGGYAFlnUEwYJnSrIJsmBM3RopRak9i
 ls8Hc9/z/VQpZL94Dgnuyez4a+4GmKVJ62vwUqMEXw1LqLFfAnKx55tyLiO+x6i6DKlE
 I0v9utPtcgZ8vGF/WVznVUUdeCoFsO1n67keu/29bZzyZxHHiX4COkED1sqeGQ5J+Rue
 fnz389ZQnM28/Y/Kexe39hHI8ybzDH8A3IrPf4WghREr8/W7OGaCfc7hgc7dOzvInRDF
 UsU6w7c3BBPtLA+fqNYIJKRDRbKhtE8ErP0MIJocmoo9Meg5sLsXnXF1VF4Uqu2Kg36R
 zsnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3Ch2a+v0V9pkwP2v4j689PWjNoR3rWExCE6zEXoddgE=;
 b=mNVm7euW2rCzA2h7IpJUkF/SAD5t5gtI2VA9pOxqehBJkykBW/RQSoMIDLdKPi+YS7
 t3oIwnHKPe1VAWaFJi5OfWBtPr08kayn+BCQ/yPX/5D49MlbzslJZvl2mUqbdafS8D8Q
 Eloy4SpSjXBedkgGUqE1lKRYYAh4lBpDVrqyXtOPX1UIc7hv9Ps7V9WmwZEEP/JN5H9t
 qz6KtmMK4YwGZhPiLXY2jx0W6V3YIbmOYjgrcr3eo563mYsLDa8iN6rw+Z0eG03R2J9r
 EZ9eOAwT2IMKK25PzbDdf2o8w+Tplh0uGJRJKdN2zxJBo/mguqp9BD++VfDg0yCJ5z2x
 lBvA==
X-Gm-Message-State: AOAM531KPFTc6V+pXbGONrlIzTQYUYrFrYg6HJfokbxlorBAd9vLsFfv
 bEELyp46AOFHiYon+kCxOOUDC1sc7UQ=
X-Google-Smtp-Source: ABdhPJzdXdIKcSBucUT3pYndkmoS5x60aKLlSZfLFhp/WfE/w7yrlfWqPpWEEiHMXDU748QZYuCVww==
X-Received: by 2002:a1c:9692:: with SMTP id y140mr528197wmd.128.1610058212530; 
 Thu, 07 Jan 2021 14:23:32 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id h3sm9671549wmm.4.2021.01.07.14.23.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:23:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/66] target/mips/mips-defs: Introduce CPU_MIPS64 and
 cpu_type_is_64bit()
Date: Thu,  7 Jan 2021 23:21:54 +0100
Message-Id: <20210107222253.20382-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
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

MIPS 64-bit ISA is introduced with MIPS3.

Introduce the CPU_MIPS64 definition aliased to the MIPS3 ISA,
and the cpu_type_is_64bit() method to check if a CPU supports
this ISA (thus is 64-bit).

Suggested-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210104221154.3127610-5-f4bug@amsat.org>
---
 target/mips/cpu.h       | 5 +++++
 target/mips/mips-defs.h | 4 +++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 0c2d397e4a9..9c45744c5c1 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1305,6 +1305,11 @@ static inline bool ase_mt_available(CPUMIPSState *env)
     return env->CP0_Config3 & (1 << CP0C3_MT);
 }
 
+static inline bool cpu_type_is_64bit(const char *cpu_type)
+{
+    return cpu_type_supports_isa(cpu_type, CPU_MIPS64);
+}
+
 void cpu_set_exception_base(int vp_index, target_ulong address);
 
 /* addr.c */
diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
index 1630ae20d59..89a9a4dda31 100644
--- a/target/mips/mips-defs.h
+++ b/target/mips/mips-defs.h
@@ -13,7 +13,7 @@
  */
 #define ISA_MIPS1         0x0000000000000001ULL
 #define ISA_MIPS2         0x0000000000000002ULL
-#define ISA_MIPS3         0x0000000000000004ULL
+#define ISA_MIPS3         0x0000000000000004ULL /* 64-bit */
 #define ISA_MIPS4         0x0000000000000008ULL
 #define ISA_MIPS5         0x0000000000000010ULL
 #define ISA_MIPS32        0x0000000000000020ULL
@@ -71,6 +71,8 @@
 #define CPU_LOONGSON2E  (CPU_MIPS3 | INSN_LOONGSON2E)
 #define CPU_LOONGSON2F  (CPU_MIPS3 | INSN_LOONGSON2F | ASE_LMMI)
 
+#define CPU_MIPS64      (ISA_MIPS3)
+
 /* MIPS Technologies "Release 1" */
 #define CPU_MIPS32R1    (CPU_MIPS2 | ISA_MIPS32)
 #define CPU_MIPS64R1    (CPU_MIPS5 | CPU_MIPS32R1 | ISA_MIPS64)
-- 
2.26.2



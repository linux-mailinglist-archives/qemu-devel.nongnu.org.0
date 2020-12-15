Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 203A42DB6EA
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 00:09:16 +0100 (CET)
Received: from localhost ([::1]:35886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpJRS-0000F5-I9
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 18:09:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpJHN-0003fH-05
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 17:58:49 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:43735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpJHL-0003kk-8F
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 17:58:48 -0500
Received: by mail-ed1-x529.google.com with SMTP id q16so22794518edv.10
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 14:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8J3sFo3k2S1YmV6te7FAq6YGGAxZZACq8K+krD2ja+Y=;
 b=BmPmPgRoFcjepulKHlWeXFD97VHMYjpE19Xg5pW/CHYTCfOlgE+pSMvoT1OaoTVV//
 NQWJK4MoVz31Bj9vjGtYHyuB0MmvCjW29ft1wkKP3nrRpsc/9JVt1oAtG10pgePgMAub
 KVarmzNxbVMREmVttuG1Wn67oV/2TIJvQBdJ6bfS7goY+RO/PM4jkIvXGYEDd/zZSrjQ
 /U2Dv/9Z7GR1TxNVgqEzU1zFcpiWZ3PS1XtYbQ66/b9Xg8aOln1scJeVUTjTUEm65OIH
 rr2QXjRqedtRATJQKsGCFEenWCTs4LhUrXuFQZ9TsDVovRNbYEzGaWsme0LEvY9Dy2Xx
 dVvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8J3sFo3k2S1YmV6te7FAq6YGGAxZZACq8K+krD2ja+Y=;
 b=uBnCuwbyOG9RaVABB+Pc0VJKOEOjCZDErHgUA4JrBharngxfO+OhgzJyZr6Y0LcfF+
 +Jyn6oniLsS56Uqnwoqj+PiNqPl6dRY0PyOf+ORATWTJk/qx51w8uceSmAwoHFnrVlSp
 yFbdsCCQn0yYe/X+7lWHfBjMBlslIuHlX4gLwbQynWPQu8K5Gez+PrdwdoeDmQWIStTJ
 OWIq6DjFv1hPMOKDtEKNHoO+4yW+fejmBzyfpnBDiV6DSKEGpd4bxshG5R1z8g5y9UGz
 KbZg/VuNzGEjwMv2RDw35s0tflkaQsuhhaQtDsdl0slf9qCUb7Rdg/1GJcPMD25V+7lv
 BYZg==
X-Gm-Message-State: AOAM5300QMmnWQMWZL2a/9C/8iZF/7hx9YXIG5WEsxxp2rRdggq25LH6
 e+50ESx5cVNlwnFs2afR9FAEABvWp4NFrg==
X-Google-Smtp-Source: ABdhPJxs1anFL48anFvNij5UZqX93iuISG9w1P3EGLDcSda41Z4Do1u27B3fRtD06FML0cUwb7VYQQ==
X-Received: by 2002:a05:6402:c4:: with SMTP id
 i4mr16884467edu.152.1608073125852; 
 Tue, 15 Dec 2020 14:58:45 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id e11sm19258366edj.44.2020.12.15.14.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 14:58:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 08/24] target/mips: Remove now unused ASE_MSA definition
Date: Tue, 15 Dec 2020 23:57:41 +0100
Message-Id: <20201215225757.764263-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201215225757.764263-1-f4bug@amsat.org>
References: <20201215225757.764263-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We don't use ASE_MSA anymore (replaced by ase_msa_available()
checking MSAP bit from CP0_Config3). Remove it.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/mips-defs.h    | 1 -
 target/mips/cpu-defs.c.inc | 8 ++++----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
index ed6a7a9e545..805034b8956 100644
--- a/target/mips/mips-defs.h
+++ b/target/mips/mips-defs.h
@@ -45,7 +45,6 @@
 #define ASE_MT            0x0000000040000000ULL
 #define ASE_SMARTMIPS     0x0000000080000000ULL
 #define ASE_MICROMIPS     0x0000000100000000ULL
-#define ASE_MSA           0x0000000200000000ULL
 /*
  *   bits 40-51: vendor-specific base instruction sets
  */
diff --git a/target/mips/cpu-defs.c.inc b/target/mips/cpu-defs.c.inc
index bf12e91f715..325b24b8e2c 100644
--- a/target/mips/cpu-defs.c.inc
+++ b/target/mips/cpu-defs.c.inc
@@ -410,7 +410,7 @@ const mips_def_t mips_defs[] =
         .CP1_fcr31_rw_bitmask = 0xFF83FFFF,
         .SEGBITS = 32,
         .PABITS = 40,
-        .insn_flags = CPU_MIPS32R5 | ASE_MSA,
+        .insn_flags = CPU_MIPS32R5,
         .mmu_type = MMU_TYPE_R4000,
     },
     {
@@ -721,7 +721,7 @@ const mips_def_t mips_defs[] =
         .MSAIR = 0x03 << MSAIR_ProcID,
         .SEGBITS = 48,
         .PABITS = 48,
-        .insn_flags = CPU_MIPS64R6 | ASE_MSA,
+        .insn_flags = CPU_MIPS64R6,
         .mmu_type = MMU_TYPE_R4000,
     },
     {
@@ -761,7 +761,7 @@ const mips_def_t mips_defs[] =
         .MSAIR = 0x03 << MSAIR_ProcID,
         .SEGBITS = 48,
         .PABITS = 48,
-        .insn_flags = CPU_MIPS64R6 | ASE_MSA,
+        .insn_flags = CPU_MIPS64R6,
         .mmu_type = MMU_TYPE_R4000,
     },
     {
@@ -887,7 +887,7 @@ const mips_def_t mips_defs[] =
         .CP1_fcr31_rw_bitmask = 0xFF83FFFF,
         .SEGBITS = 48,
         .PABITS = 48,
-        .insn_flags = CPU_LOONGSON3A | ASE_MSA,
+        .insn_flags = CPU_LOONGSON3A,
         .mmu_type = MMU_TYPE_R4000,
     },
     {
-- 
2.26.2



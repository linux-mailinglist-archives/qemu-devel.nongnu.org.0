Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 130962F3BB0
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 22:03:45 +0100 (CET)
Received: from localhost ([::1]:58264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzQpM-0005Cu-3p
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 16:03:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzQno-0003t2-V4
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 16:02:09 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:39338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzQnn-0007qw-Ea
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 16:02:08 -0500
Received: by mail-wr1-x42d.google.com with SMTP id c5so3941381wrp.6
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 13:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PdHJTEEbbmsSqQjGmdaxW05TMT4n/VzB78ADEP9BxSI=;
 b=HHkrvNi37tRM+bDwN84SyUTmj58XMYavtBM6SV80uYRmCUR3TJJbXJ5huBJPcDJqr4
 fY2ATurrLhClEdgAF3UC15h5GGErU0zY9hcJdQM6pgEWALjdSahXd13HX4sETSjZAnZM
 7nVVBU48mV1bh9twi2GBmH2fqTvT6+jR8w4hLGKYcwjWa89Gvv14S+spKxiiSnrpGuKj
 vdB1iMSM6eFMjNRmP0Rg+qpfYXzvnblQpNEfRHcN6/CrCj0s1Tp+8fNd73suIyvEsfWi
 3b58f4X22bV723ABRji26WzVQv0iIvhW9tgkrCg+0//MJt08ZRgQINoU+i+ZNkoCqNp3
 zrYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=PdHJTEEbbmsSqQjGmdaxW05TMT4n/VzB78ADEP9BxSI=;
 b=OjiHl6/yfcu8zsvPmOrsDLAX62wYgGpcRKY7DaTEk2CWZu4wbVuBqOXTuInVbn/z9r
 XQLIALXWZ8plwyL0qnPzyf74McSIn2jZX4rh8Fw7DClwAE4grUMW7m9yp3yOsm9xGHbq
 ye+QpaLY0iS2+iYL6ME23gBWydIuhX0Hw9PX0G+1PFlsRBA9UHOLjlgyQuFYytOlQIIF
 jYYqvT/h3SI2pXQfeO2FwGUKdWDsQyJPRA3k89ge1DihGsbuvPeC/IQWXSBX+eopEqob
 3mmZFqgE8I7EzaQYPBX7wgdef1izzmeII6cCEbfGRrL5n2IpA6P/h/qYLu77iisS484d
 pTJQ==
X-Gm-Message-State: AOAM532rAwR8twZVu8OQz8JCJP68lQBUMAgzd7YZxqoyrnp6WvW7p633
 uRvkW4yj2KewCcb677iV3JCMIRsaTDg=
X-Google-Smtp-Source: ABdhPJzijBI7510FL4nmHUVRHbsdYZcsx+sfvCvc8w2+YTDVJAI+eqadetvLFjlx2UW0G5+VzSCZjw==
X-Received: by 2002:a5d:5704:: with SMTP id a4mr659267wrv.37.1610485325875;
 Tue, 12 Jan 2021 13:02:05 -0800 (PST)
Received: from x1w.redhat.com (190.red-83-57-173.dynamicip.rima-tde.net.
 [83.57.173.190])
 by smtp.gmail.com with ESMTPSA id k10sm6186264wrq.38.2021.01.12.13.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 13:02:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] target/mips: Remove CPU_NANOMIPS32 definition
Date: Tue, 12 Jan 2021 22:01:51 +0100
Message-Id: <20210112210152.2072996-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210112210152.2072996-1-f4bug@amsat.org>
References: <20210112210152.2072996-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

nanoMIPS not a CPU, but an ISA. The nanoMIPS ISA is already
defined as ISA_NANOMIPS32.
Remove this incorrect definition and update the single CPU
implementing it, the I7200.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/mips-defs.h    | 3 ---
 target/mips/cpu-defs.c.inc | 4 ++--
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
index b7879be9e90..3704db85532 100644
--- a/target/mips/mips-defs.h
+++ b/target/mips/mips-defs.h
@@ -86,9 +86,6 @@
 #define CPU_MIPS32R6    (CPU_MIPS32R5 | ISA_MIPS_R6)
 #define CPU_MIPS64R6    (CPU_MIPS64R5 | CPU_MIPS32R6)
 
-/* Wave Computing: "nanoMIPS" */
-#define CPU_NANOMIPS32  (CPU_MIPS32R6 | ISA_NANOMIPS32)
-
 #define CPU_LOONGSON3A  (CPU_MIPS64R2 | INSN_LOONGSON3A | ASE_LMMI | ASE_LEXT)
 
 /*
diff --git a/target/mips/cpu-defs.c.inc b/target/mips/cpu-defs.c.inc
index ba22ff4bcd1..9f7bac87932 100644
--- a/target/mips/cpu-defs.c.inc
+++ b/target/mips/cpu-defs.c.inc
@@ -486,8 +486,8 @@ const mips_def_t mips_defs[] =
         .CP1_fcr31 = (1 << FCR31_ABS2008) | (1 << FCR31_NAN2008),
         .SEGBITS = 32,
         .PABITS = 32,
-        .insn_flags = CPU_NANOMIPS32 | ASE_DSP | ASE_DSP_R2 | ASE_DSP_R3 |
-                      ASE_MT,
+        .insn_flags = CPU_MIPS32R6 | ISA_NANOMIPS32 |
+                      ASE_DSP | ASE_DSP_R2 | ASE_DSP_R3 | ASE_MT,
         .mmu_type = MMU_TYPE_R4000,
     },
 #if defined(TARGET_MIPS64)
-- 
2.26.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EEA2F661F
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 17:41:34 +0100 (CET)
Received: from localhost ([::1]:59738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l05gj-0005ed-OA
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 11:41:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l05Ng-00047n-GR
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:21:52 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:46596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l05Nb-0000gy-IZ
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:21:51 -0500
Received: by mail-wr1-x434.google.com with SMTP id d13so6362688wrc.13
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 08:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DK3ItDvJkViUm4mpWowhZDCjdMx6dYcz5wIZD6jC7gw=;
 b=u9PGT5C89WfiK5PRkgHz9hXQtSOen1sMHMV8IxFggtTIBLNaLYvlRs8f2CbzK7OpaM
 agtPXkzTJlonZGfRQx3gir5XoChzUMuyyXtWHfiDE7uhwEtSuu5tc0Bu45YbKRftwlUc
 lW4/IQMoxpm2miJfVf/YfcM97GCSytqUN5/acg/oaGsAJWflrzir3iLFvgJpAFTWFRm8
 8MWtw5Yqb9zEDf3HvgirpZlme/cS4yQOcFS+JMEnYQb9tOEro8tT7sS4hM1XRIS/Em7A
 uK+GUt+kc/X5h45zQQIJrySx5MVJyXksjJt1sxHu1OzYWtvEqRwfzwHSWfbs6BGw/I4Y
 DqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DK3ItDvJkViUm4mpWowhZDCjdMx6dYcz5wIZD6jC7gw=;
 b=fKCtMTEONlSyC/bdk82icuKddlXY0GUaM5y7geg7EhqwPh54yzzdOdtPrglzNt15S9
 fNe40hLpLnbyq5PjSIfRasSGov3qk8Ypyx5WbuKZMZQTUpodx6/aCodAdaX/7Pk/1L+c
 MelxIDktLyqdw0OPR/JhDKzeE4ikM6aRgIVwMxQzotMumj4fpWbHn5OY/fKPsfb4/98T
 Ziq8jtqXY3mbLfNjQNumyRGVsH1KJb7LOm8XvJcjoH5zZzai3CASRFkQwVe27Qg6/+kf
 yrSTw1VxIyJzN+9KBD9Eg1Vc8BnNQBR9eaPwNxNARXOyAYX/TLp+FjpebZOchVv/GaTL
 8pbg==
X-Gm-Message-State: AOAM531Yq4lyiGfX4f3kKAMmZo0Y/mCuZHWNLa0wl/9k/m5Se1wGi3aX
 Ve+bkJQwFLcyPUg6Yr872m/hKh9gosk=
X-Google-Smtp-Source: ABdhPJwhwAfTZ9paBDgBC1qnTX5NG+izHMtATnQCpZOLB9jmd1wZhGrt9hT2L046XZqqF8Uhx+Dx6w==
X-Received: by 2002:adf:dd10:: with SMTP id a16mr8856216wrm.149.1610641305130; 
 Thu, 14 Jan 2021 08:21:45 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id g192sm9345745wme.48.2021.01.14.08.21.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 08:21:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: 
Subject: [PULL v2 67/69] target/mips: Remove CPU_NANOMIPS32 definition
Date: Thu, 14 Jan 2021 17:20:15 +0100
Message-Id: <20210114162016.2901557-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210114162016.2901557-1-f4bug@amsat.org>
References: <20210114162016.2901557-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

nanoMIPS not a CPU, but an ISA. The nanoMIPS ISA is already
defined as ISA_NANOMIPS32.
Remove this incorrect definition and update the single CPU
implementing it, the I7200.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210112210152.2072996-3-f4bug@amsat.org>
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



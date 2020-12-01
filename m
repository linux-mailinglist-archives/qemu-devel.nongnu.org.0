Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D012CA3F8
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 14:38:15 +0100 (CET)
Received: from localhost ([::1]:41878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk5rC-0000Q5-MW
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 08:38:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kk5oy-0007AZ-Ga
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 08:35:58 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:50390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kk5ow-0000SV-1Q
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 08:35:55 -0500
Received: by mail-wm1-x342.google.com with SMTP id c198so2856397wmd.0
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 05:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dE3w7uwgiAoj2d0AYzaorYy1o861nTd+pJh4yEPs8Rk=;
 b=vgrZeY1oplN4OT5BgsQGvfoujg/CyNtZRFZ4QUMfg3tm0tDCyXYo5dNf6G684rvQ30
 qecLq5QMAYhdJvP1mfB8idlgREAQpqVK8T4Q7zKTzsVkAR3SpH3rwIhDiQMbRmME3vsm
 oBS/LMpK8ouuxt+z8lvTTrWaZEhFpSXhYKbBPahRuu1GP/TsQ6uuZ2cztOgYBcLkzhlF
 fgHb2SYWIvgZoRW3dkiGLA8nLvnm62LmSKEGs1BCKiW2zR6iR3Zj1Id8APs0h3J8k3+i
 4RcdNC0k1vdE9SGOMYc4sNzvVf4PwMAgM0z33BJO97XO2Yt4v7sudy24T+j0TWg9j4Gd
 VShw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dE3w7uwgiAoj2d0AYzaorYy1o861nTd+pJh4yEPs8Rk=;
 b=oKuGOpYY7eEwHjnoKjzHSZ2HvqqokHhgVEiUPmvLR9tDy94vFGQRnPMUqM0UzR+QKH
 CEUebdFcovd/28NB3A9L2kYQ2nKn7YHk0WXcFwqG2BxR443ldyXGXbIiTsiP9dpg0Ce/
 b2dQUVhhNmAwJqj5+pnSiNDbEALfOdRUxl5r4nPG1Jcb8fMQNyDx1V0BHKBvZGQcHuS8
 msqZVkCaX74yyzA6JAGKwHVMuhNQLA0GLHDBZpHUVxQOZ/eRH6MBviyBy0T55Aa01LHe
 jg4TbsqjovlueNePnLLVvBY0xMzSdLXa17PBcScQ1FtNenn3Eim319cDLzuITeReXqiC
 XjmA==
X-Gm-Message-State: AOAM5303KDCEY1+0/x7BeF8Zzk3lGHvAglyW5tZWz218GPUIorzZ8/E3
 E+MQS9XfDebibxPQvxdE2KE=
X-Google-Smtp-Source: ABdhPJyeh7ajwYpHtFp0vWKgfvlJxbqwUjSwXuzl+WjbcImz0BcVts+pFLsP73varq7w8UuHfXZYIg==
X-Received: by 2002:a1c:b684:: with SMTP id g126mr2704376wmf.135.1606829752835; 
 Tue, 01 Dec 2020 05:35:52 -0800 (PST)
Received: from localhost.localdomain (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id k11sm3156872wrv.88.2020.12.01.05.35.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 05:35:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Huacai Chen <chenhc@lemote.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v2 5/6] linux-user/elfload: Update HWCAP bits from linux 5.7
Date: Tue,  1 Dec 2020 14:35:24 +0100
Message-Id: <20201201133525.2866838-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201201133525.2866838-1-f4bug@amsat.org>
References: <20201201133525.2866838-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Meng Zhuo <mengzhuo1203@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/elfload.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 73c1972183b..167ffbfb06c 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -985,6 +985,19 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUMIPSState *e
 enum {
     HWCAP_MIPS_R6           = (1 << 0),
     HWCAP_MIPS_MSA          = (1 << 1),
+    HWCAP_MIPS_CRC32        = (1 << 2),
+    HWCAP_MIPS_MIPS16       = (1 << 3),
+    HWCAP_MIPS_MDMX         = (1 << 4),
+    HWCAP_MIPS_MIPS3D       = (1 << 5),
+    HWCAP_MIPS_SMARTMIPS    = (1 << 6),
+    HWCAP_MIPS_DSP          = (1 << 7),
+    HWCAP_MIPS_DSP2         = (1 << 8),
+    HWCAP_MIPS_DSP3         = (1 << 9),
+    HWCAP_MIPS_MIPS16E2     = (1 << 10),
+    HWCAP_LOONGSON_MMI      = (1 << 11),
+    HWCAP_LOONGSON_EXT      = (1 << 12),
+    HWCAP_LOONGSON_EXT2     = (1 << 13),
+    HWCAP_LOONGSON_CPUCFG   = (1 << 14),
 };
 
 #define ELF_HWCAP get_elf_hwcap()
-- 
2.26.2



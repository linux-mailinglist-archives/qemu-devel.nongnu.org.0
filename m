Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DA72CAC72
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 20:36:27 +0100 (CET)
Received: from localhost ([::1]:47868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkBRq-000581-LX
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 14:36:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kkBKI-0007JZ-DS
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 14:28:39 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:46242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kkBKH-0006J3-2d
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 14:28:38 -0500
Received: by mail-wr1-x443.google.com with SMTP id g14so4460820wrm.13
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 11:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Izk1vGbfRE6RT8ZFQKiGh5lsVf18aJv6g31mMjF0vjY=;
 b=MjuAMpd8xk1mP2eGftgcyOnd4xm2dwXzlfypw8Riz/FLpY3kxuOTDN+Cq8XabSd0uR
 vDKKc5yoaqoiP3ioA7XhYBuHEzTe4n1s8+C/7HC7ZUYaQRQCtsk+rj7M93ISbWlNHOBk
 wYMWZrPg25AE89JXMK0Qd0CinnqpgkPCHli1wopfzwO0+BA0aUaR/zrDLSVCNdRLpINS
 cZv99GFaenXH98IdFY2w1wI6CfyOgHe1hrxrhPSnapy8AKSc4j8U0aHWlWhTrRj7PNpY
 AlNfrXnv9+v4y8789guk2BW5ttuBpkTuyZCpqOirwTKT7pOJ3XgCUpg8qXUYndCy/Pl9
 /VPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Izk1vGbfRE6RT8ZFQKiGh5lsVf18aJv6g31mMjF0vjY=;
 b=G8ohke/pie3zUQ9+M1D3HrE+UcReWcGtdtSX9i6RyCbekJ1+fty4K0fOHM+nxr225b
 mb2mZeOdylW5QDSMenwepByKtp97Ark+mI45oTZSbXRfxSYSQhhfw6QkKgL/9AeRvHg6
 IA6/vCNn7z4R5cilzSbtMP+NoAMv5/aMXJRxPx37YubG+Xl9BE8bjSfvQvamg4kJ4gk0
 9INcs+1sfZWYr/Vf/lgBnb6JaplggqRyLATNTE4XUofRSqurDnf2qz4rWmeLRc+tV0qc
 N9aIHGX7myCneSCoDhr3Q/SZ+DoqmiYTWQHH3f9TgnTbSuQFRoyFfTyh6x2ZuOxEkVgp
 QSqQ==
X-Gm-Message-State: AOAM5332SXyzq5v0z+afQBEz2KZAsPjCZaVYxl8gGaPsLC9ZLNDJs2qp
 fEVIWhCORNqFXplUQhG4JMs=
X-Google-Smtp-Source: ABdhPJyn6HcygP9zh4bEJajzdfxjq07SZYwDOylQu0KhtaMGpK4lxw8WAyU6Pm91h1hk3Fl/Om4K1A==
X-Received: by 2002:adf:f1c2:: with SMTP id z2mr5718862wro.281.1606850915822; 
 Tue, 01 Dec 2020 11:28:35 -0800 (PST)
Received: from localhost.localdomain (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id d8sm903758wrp.44.2020.12.01.11.28.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 11:28:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org,
 Huacai Chen <chenhc@lemote.com>
Subject: [PATCH v3 5/6] linux-user/elfload: Update HWCAP bits from linux 5.7
Date: Tue,  1 Dec 2020 20:28:06 +0100
Message-Id: <20201201192807.1094919-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201201192807.1094919-1-f4bug@amsat.org>
References: <20201201192807.1094919-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
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
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Meng Zhuo <mengzhuo1203@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/elfload.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 9c475fa5f70..2ba42d8e4bd 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -986,6 +986,19 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUMIPSState *e
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



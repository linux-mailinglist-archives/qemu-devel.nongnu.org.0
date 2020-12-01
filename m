Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0418C2CA3F6
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 14:38:12 +0100 (CET)
Received: from localhost ([::1]:41572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk5r9-0000Hi-0O
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 08:38:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kk5od-000723-N8
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 08:35:35 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:46708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kk5oc-0000Hx-89
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 08:35:35 -0500
Received: by mail-wr1-x442.google.com with SMTP id g14so2622187wrm.13
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 05:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O97Z/Yo0SvFVoCvqw59FIX/GdPFIqw23as8busylVhw=;
 b=o1bdcqUElOeRTJ5Z7BiMuBmIfZaoT2YQqFC/H6bjH4d/cJFN1WR2P3x2tjHTdW5fGX
 6MlD9YwabH2sIKs8Fv6ipKSOVXC3JBMGkNo3C4xOztLzEHu1H0ca77EaLZi+HTC8HUtt
 GjdOxkqvQEfBgJCiJAMWECU9rLj6zzYlx8xjoA3zW+63IXgSRHVP7v/IwfUX0Q1rD2hp
 WY22RwX2MVHlJOslVFRrzbKVAtmup7qvClszGi5k2Ib1ZJh/7AV4GHbGsWFWgs1LThvJ
 90rk4fK+N5VCa99F6IGmgvWQNC/6TrsmvouMGzjmYFMLfOHKey+5BXq/qL1O7Is8rEUO
 650Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=O97Z/Yo0SvFVoCvqw59FIX/GdPFIqw23as8busylVhw=;
 b=Lu6dWhJaT5YiV9yYbgEhymOCs/b34+Sx3nqqFcFBOzNj1EN4pqiijAqXsawP5IxBCR
 e+jYnKhVRg5QH+ciLucn4YSyNkjYqVAsP7zCryF76hDb8fmHlV8Y4fjXMj3HjJJqzOQc
 41Kb0J4aTJ+k858551umL5NNC+FP9YBVpTWgvWe2irXU/1qcoPQPCDk4dI+vrY1CMdFw
 ihycMCyXmDisI7045wFTr+DV6cHZXFgtBn3Mcq14a2geAbW0vmzJqyXiLEh5sIlKsiZn
 PuUd6AFrQjDGpACyrEky4G7+PjNbX/AH/psrOQpI62ePiKTn4kancLZvrISFGvxxiFUR
 ye9g==
X-Gm-Message-State: AOAM533hpi1SuTT1a8GtUJHRDiHLrnU2L+mXUkvYTGFirRynkxivDdM2
 xeA0uAdZpzFyubCAMiPaU6U=
X-Google-Smtp-Source: ABdhPJztJFQcCE3n2rSSSw3DuRWaVJeOSA9l//lfN8AnWTzHvAktvhG+eFcaWAeZiDdvCRlo/WST3w==
X-Received: by 2002:a05:6000:143:: with SMTP id
 r3mr3830629wrx.331.1606829732966; 
 Tue, 01 Dec 2020 05:35:32 -0800 (PST)
Received: from localhost.localdomain (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id z189sm2943628wme.23.2020.12.01.05.35.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 05:35:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Huacai Chen <chenhc@lemote.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v2 1/6] linux-user/elfload: Move GET_FEATURE macro out of
 get_elf_hwcap() body
Date: Tue,  1 Dec 2020 14:35:20 +0100
Message-Id: <20201201133525.2866838-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201201133525.2866838-1-f4bug@amsat.org>
References: <20201201133525.2866838-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
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

As we are going to add more macros, keep the function body clear.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/elfload.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 0b02a926025..aae28fd929d 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -989,22 +989,22 @@ enum {
 
 #define ELF_HWCAP get_elf_hwcap()
 
+#define GET_FEATURE(_flag, _hwcap) \
+    do { if (cpu->env.insn_flags & (_flag)) { hwcaps |= _hwcap; } } while (0)
+
 static uint32_t get_elf_hwcap(void)
 {
     MIPSCPU *cpu = MIPS_CPU(thread_cpu);
     uint32_t hwcaps = 0;
 
-#define GET_FEATURE(flag, hwcap) \
-    do { if (cpu->env.insn_flags & (flag)) { hwcaps |= hwcap; } } while (0)
-
     GET_FEATURE(ISA_MIPS32R6 | ISA_MIPS64R6, HWCAP_MIPS_R6);
     GET_FEATURE(ASE_MSA, HWCAP_MIPS_MSA);
 
-#undef GET_FEATURE
-
     return hwcaps;
 }
 
+#undef GET_FEATURE
+
 #endif /* TARGET_MIPS */
 
 #ifdef TARGET_MICROBLAZE
-- 
2.26.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBB52D1DB1
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 23:49:29 +0100 (CET)
Received: from localhost ([::1]:59822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmPJw-0000Rl-Rd
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 17:49:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmPEV-0004VL-Oi
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 17:43:51 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:36132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmPEU-0004cM-Bn
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 17:43:51 -0500
Received: by mail-ej1-x643.google.com with SMTP id lt17so21923757ejb.3
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 14:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uPRexVPkDjCG4AyHRPKefAxhlHzd9mlDS2Ak1Dn5wzA=;
 b=d+ZXHw46JlTEA4ZCC/GBW0kDvusDyWvC0qftMX6AI7oL2uEAbQBqzwZkMtJyE3cIdE
 itK22waRtH4usMHqSpemvlvBljKHrM9ITALC7DZTXzg+gipCy+hWwAa4S67Rcbskaktm
 LNZk1HQL543DZKTDyio9O1c49FKSiezAlkY1vGNHoYvzQgQtM2OYAsJk3jllS3TgCb7h
 vI4lVqW+b4GPL9xL2OEdKkoGMEW8pgfA3NBx7LW6fvUbso+Z50Zczs38URkO71FGDkBq
 oJKJL9aSH/4ifFe2ESby2db6WVbyN6qDKJO6yBwbWdi7FaBJitbQzzPiDWoD7YtWxRq+
 BMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uPRexVPkDjCG4AyHRPKefAxhlHzd9mlDS2Ak1Dn5wzA=;
 b=VCbHHcs+wP4YA8amyA9ZJqy5dIUcB4AYvRUIkoZWrkM+3V+gV1P50RRPku78KUeQOT
 FTWH3WjT6v71TR02MtERcZFLzwQBQtjEELVRF4Xb2+J0J0zwONUH0nHH+F5MzypFDiQ4
 t+NzNJZ7nxbcqPCRYTWmS4isTim+Wj5L7i9MC83bQ87/qM3zcffBGCpQf7R6hqOithxn
 QNgmbdBbkJPbNvMwsdD/qLiF9vVshz1/xZz34uROclj6g0q/yuwTLuKimlMKTtdm6QU7
 nwplmYoXmFT426c9EHfKOohctqbmJHmh0dO0+r8hRx+GYfAmhfOPm076dhShW2VmqHB2
 o6NA==
X-Gm-Message-State: AOAM5314nFhiRzVfFcGTtFA92jqmX8bfeyj/mvdLGEQ9XC+3HEkhPZ8v
 yO+ckFVkgsWOUXcMFg75RDF/xbHhZpI=
X-Google-Smtp-Source: ABdhPJzBex17XWkFZiyL70bBdPoH2yGs6L6SMZL6F69z2At/PaaImT0i8xTT3qABDAPupWhsGafWJw==
X-Received: by 2002:a17:906:55d0:: with SMTP id
 z16mr20620124ejp.466.1607381028892; 
 Mon, 07 Dec 2020 14:43:48 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id q26sm13974954ejt.73.2020.12.07.14.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 14:43:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/6] linux-user/elfload: Rename MIPS GET_FEATURE() as
 GET_FEATURE_INSN()
Date: Mon,  7 Dec 2020 23:43:31 +0100
Message-Id: <20201207224335.4030582-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201207224335.4030582-1-f4bug@amsat.org>
References: <20201207224335.4030582-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x643.google.com
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
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to add macros similar to GET_FEATURE().
As this one use the 'insn_flags' field, rename it
GET_FEATURE_INSN().

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/elfload.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index aae28fd929d..0e1d7e7677c 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -989,7 +989,7 @@ enum {
 
 #define ELF_HWCAP get_elf_hwcap()
 
-#define GET_FEATURE(_flag, _hwcap) \
+#define GET_FEATURE_INSN(_flag, _hwcap) \
     do { if (cpu->env.insn_flags & (_flag)) { hwcaps |= _hwcap; } } while (0)
 
 static uint32_t get_elf_hwcap(void)
@@ -997,13 +997,13 @@ static uint32_t get_elf_hwcap(void)
     MIPSCPU *cpu = MIPS_CPU(thread_cpu);
     uint32_t hwcaps = 0;
 
-    GET_FEATURE(ISA_MIPS32R6 | ISA_MIPS64R6, HWCAP_MIPS_R6);
-    GET_FEATURE(ASE_MSA, HWCAP_MIPS_MSA);
+    GET_FEATURE_INSN(ISA_MIPS32R6 | ISA_MIPS64R6, HWCAP_MIPS_R6);
+    GET_FEATURE_INSN(ASE_MSA, HWCAP_MIPS_MSA);
 
     return hwcaps;
 }
 
-#undef GET_FEATURE
+#undef GET_FEATURE_INSN
 
 #endif /* TARGET_MIPS */
 
-- 
2.26.2



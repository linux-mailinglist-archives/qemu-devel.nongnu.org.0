Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4902EA002
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 23:28:56 +0100 (CET)
Received: from localhost ([::1]:54638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwYLP-000518-8F
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 17:28:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwY6I-0007vV-A7
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 17:13:18 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:50187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwY6G-000876-Nn
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 17:13:18 -0500
Received: by mail-wm1-x32a.google.com with SMTP id 190so628874wmz.0
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 14:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l1w3yrD6Xzrx67l04pPoYDp8gom3Vu8h3R+Nb7NOQM0=;
 b=tJGaENIrgnvqwq0rqeDF4WAjhLBQ7tzLg4KijZom/fAp70OgR6YdblD1lqI28Iqr0k
 lAdMdohd55XZMjJOfd6tZexYqxaqf2Ly8f07qvEP+qN+pY4k3tzzUePk6ZXkiPLCKgMf
 4grkYighl94t1r0V/v7A+OpmEAZwYfkJQZiFt16TjykHJy++fGNZwqBNZk68a6W0bQy1
 zvwnfrporadxYRj1PyBhwBmhxuvfWa7pwVD9BLZxvXyNZP/STZX5HyYkRZPSde95szUz
 mkzqnJrzc+PdhDtaiqShLA9f374iPOSsuU/lFsyOxrnRUNuZuLHmgUj1kme/VKOfxAP5
 1hiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=l1w3yrD6Xzrx67l04pPoYDp8gom3Vu8h3R+Nb7NOQM0=;
 b=ba1DgUpnhlVxXvTJpqTUZgMXIVPpBd+Dt2tBsBSvfELl+gWypyCMcIL3AdBq0AWf1y
 H26hmaR+z9a2QJuNutHPOThZa+0pbhz1VHKOx2okWIO+OHE+l+YPlbt9rcUH5dunbEYV
 eI3cGsY1Rffb8DvRk18lHW4AEqDbih7OVjhBxUd+AruWpjZq4lsrRGngpgPot2x8Hiz8
 C66OzC1tMEku3NAzDcg2Fl8bNbv7t7NIpN2JxHvLo74WfrASqqLaRpPOHiMURo0xh6e5
 ZJjbboJgbhjhig3KrIrvZ0TPL/jqgqqrIB3pVhx2YsAk1G2CBJFEOf/JfyBlI1MBoWUP
 dbNQ==
X-Gm-Message-State: AOAM533wGXgPt+HRLzQWEstcx83881vGVPoWZoOHe6IP3y0DXyRSHn9Y
 XXY/ubf8d1FwfaDk50N+uN/Z6TGTY0k=
X-Google-Smtp-Source: ABdhPJxSP9WziwuPE2JwUY/zEamaTZXb9yp/9L+BP0pqpUYL8FdZc8RaxDd8bFAuNolNFgAZomfz4A==
X-Received: by 2002:a05:600c:214a:: with SMTP id
 v10mr778977wml.138.1609798391518; 
 Mon, 04 Jan 2021 14:13:11 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id z15sm95495737wrv.67.2021.01.04.14.13.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 14:13:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/15] target/mips/mips-defs: Rename ISA_MIPS32R5 as
 ISA_MIPS_R5
Date: Mon,  4 Jan 2021 23:11:53 +0100
Message-Id: <20210104221154.3127610-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210104221154.3127610-1-f4bug@amsat.org>
References: <20210104221154.3127610-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
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
 Paul Burton <paulburton@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The MIPS ISA release 5 is common to 32/64-bit CPUs.

To avoid holes in the insn_flags type, update the
definition with the next available bit.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/mips-defs.h | 4 ++--
 target/mips/translate.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
index 12ff2b3280c..181f3715472 100644
--- a/target/mips/mips-defs.h
+++ b/target/mips/mips-defs.h
@@ -19,7 +19,7 @@
 #define ISA_MIPS_R1       0x0000000000000020ULL
 #define ISA_MIPS_R2       0x0000000000000040ULL
 #define ISA_MIPS_R3       0x0000000000000080ULL
-#define ISA_MIPS32R5      0x0000000000000800ULL
+#define ISA_MIPS_R5       0x0000000000000100ULL
 #define ISA_MIPS32R6      0x0000000000002000ULL
 #define ISA_NANOMIPS32    0x0000000000008000ULL
 /*
@@ -81,7 +81,7 @@
 #define CPU_MIPS64R3    (CPU_MIPS64R2 | CPU_MIPS32R3)
 
 /* MIPS Technologies "Release 5" */
-#define CPU_MIPS32R5    (CPU_MIPS32R3 | ISA_MIPS32R5)
+#define CPU_MIPS32R5    (CPU_MIPS32R3 | ISA_MIPS_R5)
 #define CPU_MIPS64R5    (CPU_MIPS64R3 | CPU_MIPS32R5)
 
 /* MIPS Technologies "Release 6" */
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 9c71d306ee5..83fd6c473a5 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -10993,7 +10993,7 @@ static void gen_cp0(CPUMIPSState *env, DisasContext *ctx, uint32_t opc,
             if (ctx->opcode & (1 << bit_shift)) {
                 /* OPC_ERETNC */
                 opn = "eretnc";
-                check_insn(ctx, ISA_MIPS32R5);
+                check_insn(ctx, ISA_MIPS_R5);
                 gen_helper_eretnc(cpu_env);
             } else {
                 /* OPC_ERET */
-- 
2.26.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B38292DC180
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 14:47:14 +0100 (CET)
Received: from localhost ([::1]:36722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpX97-0002yc-KI
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 08:47:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpX6P-00016n-Iv
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 08:44:25 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:36591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpX6O-0005aQ-34
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 08:44:25 -0500
Received: by mail-wm1-x329.google.com with SMTP id y23so2501222wmi.1
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 05:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wLFcl6Vi44+jgM/M1PEATPZTUeRmUNN1l1qQcgVBAnw=;
 b=ZWupw9rokBEvovxkaWwo+oDlGRCDQKzYxtv+uf5nYSjI7Z3Ipwz0vWGDDR4Oh49ryt
 ERTQFzlDSvRHfO3e/OiMYlCBbZlFdkeMpyZ5+vAZ8743fdMwEZEUOCsarOF2fkF7FGN7
 aPKjnSwY9GA5wPScEmI5dJCx3tSIMqlKQtXL4mm1c73nloSIL7abHBatlk0jaMnredZU
 o0SAU928MeMvThW7ysFfFu7/X6mWleezVuzv/lUuZXbm4wi61FBUFT2o833Ipy1u8bfZ
 86kifkeblUBKHoMmv+Kv/Cy8mffNEhGUJz/YNxvTta5Uqc4KX1kDKWLA/jIrNFc51O6t
 SYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wLFcl6Vi44+jgM/M1PEATPZTUeRmUNN1l1qQcgVBAnw=;
 b=Y5jO+1+TqS01UZNtUhyGH0kpNtggj8ggM3WX+6OXPPIcZsWeSXHBHh8rnM+O0eSUPg
 LGW9+fzNYEilOooEcUoNY8QDdORn1cXqWO+VekeZpwkkx6DgVFyrgAZp4rBTcR0RorM7
 0DocfYtylJ8nMNxqSZp1MnXKTVAmRpgkjH4TwM1KAUHmaYvMUEc6haAIdCaihlhhjEr7
 wiPdZI4oASXHjSvidZRtX/p1YqBD13MOdrwsR3IBs2WvNth/b7snH1CY+aTRo+1ylXyU
 /VlicEc/+llptfWaOP6R6HaSsdWBTGGQrkrfme+hQd2O4f3+g32EYWI+OTelzP0fXvwf
 vLXQ==
X-Gm-Message-State: AOAM533siU9MRLAM6EPPFlIUR9qgA0W9SBly43aVdPET/PwIIT59zzpF
 MkP4O/UWM6SM9sZHuM7Z05unzfUljJQ=
X-Google-Smtp-Source: ABdhPJwuZHb5FwUtzmbnO7QzQWri7mvN/ji7Qsw+fr85rHkoWn3J0eC4Gg8DYBVryynvN8TGD4I5Ag==
X-Received: by 2002:a05:600c:21d5:: with SMTP id
 x21mr3448500wmj.10.1608126260587; 
 Wed, 16 Dec 2020 05:44:20 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id z64sm2833660wme.10.2020.12.16.05.44.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 05:44:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/11] target/mips/mips-defs: Rename ISA_MIPS32R5 as
 ISA_MIPS_R5
Date: Wed, 16 Dec 2020 14:43:27 +0100
Message-Id: <20201216134328.851840-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201216134328.851840-1-f4bug@amsat.org>
References: <20201216134328.851840-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
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
 Paul Burton <paulburton@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The MIPS ISA release 5 is common to 32/64-bit CPUs.

To avoid holes in the insn_flags type, update the
definition with the next available bit.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/mips-defs.h | 4 ++--
 target/mips/translate.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
index 171d94c16dc..068fe9c8a19 100644
--- a/target/mips/mips-defs.h
+++ b/target/mips/mips-defs.h
@@ -25,7 +25,7 @@
 #define ISA_MIPS_R1       0x0000000000000020ULL
 #define ISA_MIPS_R2       0x0000000000000040ULL
 #define ISA_MIPS_R3       0x0000000000000080ULL
-#define ISA_MIPS32R5      0x0000000000000800ULL
+#define ISA_MIPS_R5       0x0000000000000100ULL
 #define ISA_MIPS32R6      0x0000000000002000ULL
 #define ISA_NANOMIPS32    0x0000000000008000ULL
 /*
@@ -84,7 +84,7 @@
 #define CPU_MIPS64R3    (CPU_MIPS64R2 | CPU_MIPS32R3)
 
 /* MIPS Technologies "Release 5" */
-#define CPU_MIPS32R5    (CPU_MIPS32R3 | ISA_MIPS32R5)
+#define CPU_MIPS32R5    (CPU_MIPS32R3 | ISA_MIPS_R5)
 #define CPU_MIPS64R5    (CPU_MIPS64R3 | CPU_MIPS32R5)
 
 /* MIPS Technologies "Release 6" */
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 842db4490ce..6406596293c 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -10588,7 +10588,7 @@ static void gen_cp0(CPUMIPSState *env, DisasContext *ctx, uint32_t opc,
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



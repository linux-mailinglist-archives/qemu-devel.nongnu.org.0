Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3132EE958
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 23:56:25 +0100 (CET)
Received: from localhost ([::1]:43864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxeCe-0004Kt-ML
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 17:56:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdlA-0005IB-3W
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:28:00 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:38813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdl6-0006YN-OY
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:27:58 -0500
Received: by mail-wm1-x32e.google.com with SMTP id g185so6835551wmf.3
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2KMW1AHx+CcjcF6oy+EHrDBlKoWTeIJxR2dMpOZQe7U=;
 b=eu/pL2XsD3VR3uKPHuTsM8iVriGrGrjPRln4TPJRfQZh9Wms+y1U2X+v2CLH7nW5uf
 s7UNpD79IzDqtqMDOI+rpEe5hMgNatDvgxevjKH69XI+BZw49OQb1xzQ9pSccDWLoe9x
 UQD8i6iXuWPjvWDV14d5xSEjIgYQ2WP4GF3aQal/85RncyXxdGPnU2uQ+eeoNOOxmpTY
 iePB7so0OQAEj9HHVscAzXTKVj8ONFLG1iH6KPpZV9r++IQUiGniQTmQ3u8uRVUve708
 YE3ZPFb7AKetOsEqIzrRp3ReKkKqbnCy18Gq2Y9QfBgWcWDMTJcgRDJcWhO0bnmmPD0G
 uSXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2KMW1AHx+CcjcF6oy+EHrDBlKoWTeIJxR2dMpOZQe7U=;
 b=aOlEw5DI9Ae763TYAuedlMC/XAFj/6kGoKbU3BBSdBx/eiHOax5UlR5sA9kb4x5cir
 3VCDBTfEKKqUTeisuDtL32YNpF9vwFKQUTC07jno4/0IMcVc8J+BByBcpqfoGRk1JnQq
 XQMlqbaRMScIvMSmQ7XcmGJQZ+ZL6Wd5fM4vdQGTO9idqsOcnkOD5FgZYXzHGzCPcIxW
 Aazmf1NlWKxNALOGfmuvXUJTpvcNjmKWVciZuaKPGDvbbQDaEh/beZO4QFgPE33xzScK
 kE2emCLe83nEiWkzTr6YnOaUEayImZX7wI7IJQtXOwj4s7xmshW8cBG8iVYbJ1pj5Z9A
 JQlw==
X-Gm-Message-State: AOAM533SmCTkhvECv2ByB5e2Gw+Kvr0YQg5ScXARizuhb3ryMnUDIAlj
 xaZ2bgej00gKGDRlw1b9xZoJYVrz/mM=
X-Google-Smtp-Source: ABdhPJwhlHkwhPGlw9CABxGJvzuyyJEPRsNT1YsTzkdqiwuDfohqGuCHk/Hb4esUZif9cgPQE9hFFQ==
X-Received: by 2002:a1c:2b46:: with SMTP id r67mr521041wmr.162.1610058475322; 
 Thu, 07 Jan 2021 14:27:55 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id b83sm9675771wmd.48.2021.01.07.14.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:27:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 58/66] target/mips: Convert Rel6 Special2 opcode to decodetree
Date: Thu,  7 Jan 2021 23:22:45 +0100
Message-Id: <20210107222253.20382-59-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
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

Special2 opcode have been removed from the Release 6.

Add a single decodetree entry for all the opcode class,
triggering Reserved Instruction if ever used.

Remove unreachable check_insn_opc_removed() call.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201208203704.243704-7-f4bug@amsat.org>
---
 target/mips/mips32r6.decode  | 2 ++
 target/mips/rel6_translate.c | 7 +++++++
 target/mips/translate.c      | 2 --
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/target/mips/mips32r6.decode b/target/mips/mips32r6.decode
index 027585ee042..259bac612ab 100644
--- a/target/mips/mips32r6.decode
+++ b/target/mips/mips32r6.decode
@@ -15,3 +15,5 @@
 @lsa                ...... rs:5 rt:5 rd:5 ... sa:2 ......   &lsa
 
 LSA                 000000 ..... ..... ..... 000 .. 000101  @lsa
+
+REMOVED             011100 ----- ----- ----- ----- ------   # SPECIAL2
diff --git a/target/mips/rel6_translate.c b/target/mips/rel6_translate.c
index 631d0b87748..51264f0ce92 100644
--- a/target/mips/rel6_translate.c
+++ b/target/mips/rel6_translate.c
@@ -18,6 +18,13 @@
 #include "decode-mips32r6.c.inc"
 #include "decode-mips64r6.c.inc"
 
+bool trans_REMOVED(DisasContext *ctx, arg_REMOVED *a)
+{
+    gen_reserved_instruction(ctx);
+
+    return true;
+}
+
 static bool trans_LSA(DisasContext *ctx, arg_LSA *a)
 {
     return gen_LSA(ctx, a->rd, a->rt, a->rs, a->sa);
diff --git a/target/mips/translate.c b/target/mips/translate.c
index f4481afb8de..01c1ee546e2 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -27137,8 +27137,6 @@ static void decode_opc_special2_legacy(CPUMIPSState *env, DisasContext *ctx)
     int rs, rt, rd;
     uint32_t op1;
 
-    check_insn_opc_removed(ctx, ISA_MIPS_R6);
-
     rs = (ctx->opcode >> 21) & 0x1f;
     rt = (ctx->opcode >> 16) & 0x1f;
     rd = (ctx->opcode >> 11) & 0x1f;
-- 
2.26.2



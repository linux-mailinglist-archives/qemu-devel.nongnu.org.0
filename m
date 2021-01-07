Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F072EE8D1
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 23:36:35 +0100 (CET)
Received: from localhost ([::1]:60978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxdtS-0000Ou-BQ
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 17:36:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdhj-0008I7-7Z
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:24:27 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:42448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdhh-00052d-Pg
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:24:27 -0500
Received: by mail-wr1-x431.google.com with SMTP id m5so7108176wrx.9
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8VbnptZXgmw1r+fJKrz2Q7we2TDNwx1PgIcbr0B8enM=;
 b=vWEk798tkKQE/nbkyfZecpulRxQ1g9CZ1hflnEYJuTb9GxDtygEnCMLNsN3EucxS2q
 oCEDMtjH1rC4YAOr68TSV4itLsAji+Zc0MW+QwSHyoc1r8m8pIR0+iDNfbBuinMLuthC
 L/r1EuqQ6xuDF49Nuuu1rTL7wok0P2G4gufFVtMI9qfyzC0EwcPlxSHwO9T8R7Zo/Sut
 cw76yjxwPvXiKsRK5YZTKgI7pJ985o8lz80TN6O9zRYqGOV/eNvoW/etUkf+tEHIS/c4
 l6tSZCk8bHtICw89nlSz3aVHHkv47SbEwIgcp/zdk6MOcOqLNaECMyN6WrLBLb2IhGDD
 d52Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8VbnptZXgmw1r+fJKrz2Q7we2TDNwx1PgIcbr0B8enM=;
 b=dM5r1QChrJA+L012XDa8+TY9Wom+DqhnTLSkw0dtBimccVtYTTIsS0LuF2/+SbbpAF
 jLProrqifIYGM54yL9s802di/YllWNYP3BCn+tJL1IXlY3cZCb2/0G+43wYPXA8Zf+IB
 +oB5yElMxJCco/rEg3ajrvG0LDjNff2soUlG1NRnT2Jk9zhDalGshdAwnhQWAEjlvdOH
 z924WoReOZYGle2VHsi/LMvVnFDRVUJgoLTe+xrrydeO0Cie6ivzgViUeQKgPLhK/vH5
 +8d8jObkNFqPnX121H9K56VuQiIWDHR7jwZeFTZZxVbL9RlyllKp+JaDK5uT8DvhSeEt
 +DKg==
X-Gm-Message-State: AOAM530GMhAulxVx+3zw2DL7ROJN6nzJC+I2LIjP0bXX9m33ZALqvZfd
 6CJfB0nNvaoSj3auISn1Z6VfcgzNUKk=
X-Google-Smtp-Source: ABdhPJwgPM2/a71z5sYYShgXCbd3btGleobgBn7VBL17CWaY0SuEJ2YpO/wDeSbt636lq2M1sKJG8g==
X-Received: by 2002:a5d:6a88:: with SMTP id s8mr706468wru.118.1610058264312;
 Thu, 07 Jan 2021 14:24:24 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id r82sm9930125wma.18.2021.01.07.14.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:24:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/66] target/mips/mips-defs: Rename ISA_MIPS32R5 as ISA_MIPS_R5
Date: Thu,  7 Jan 2021 23:22:04 +0100
Message-Id: <20210107222253.20382-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
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

The MIPS ISA release 5 is common to 32/64-bit CPUs.

To avoid holes in the insn_flags type, update the
definition with the next available bit.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210104221154.3127610-15-f4bug@amsat.org>
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



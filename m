Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC842CC5D1
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 19:48:32 +0100 (CET)
Received: from localhost ([::1]:50738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkXAz-0001Jw-Fw
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 13:48:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kkX7Q-0005CQ-5M
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 13:44:48 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:44734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kkX7O-0002d1-Pq
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 13:44:47 -0500
Received: by mail-ej1-x62f.google.com with SMTP id m19so5877369ejj.11
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 10:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vLfle+Khrb+jNknl9qLNu4/IaRmhOoPiQ1bCWscTpa8=;
 b=k6LA4FjKbLo1e0EZcAw8OjDx6WJRuZ5isiJf2gQbNT7J7zzMdv0z55vmdw8Q453dXO
 09RT0/fwoLyjryvAieQaTswBEoRM4BNXid0l0uoXhQkvZMikjylHyqYWgFG+Ikd+Iivt
 kQDn7uSfPOKwyK96uoNxyjC6K7zfgA9HRwbrYHanRhpsoFx2OXl4JyHdu7pmOz2Zqc9U
 rveBrE3r+RK+pZwMkUirkq9bj0hubckUDcbo88yRk9FnlMV1XOGVT+8KjivlxjaB4ZA6
 2yu1Agbhe0LYXfcWHa0JmCga7AUWcDETq/bh2MXTOTq89D0nnAhR4V50nFbyr2y7Klvo
 qUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vLfle+Khrb+jNknl9qLNu4/IaRmhOoPiQ1bCWscTpa8=;
 b=DGjK1Q0i04lDEj6gEKiQZO9tYutgT36I9NNCrzWzNmS4d8yWxXR2/8Hmi9aI7F33rO
 Li3O6Xc6YwAVZ4fK5cSSuUTw7Qf5JOD+4N85UAxo8WAC7dXn9YdXD6uQrVoQ9AwEgLnR
 pRqNFCwV9VlS3Ae9n9hRrlEDgJ2cqY9KemtfaDD/KUSFSarCzTZ3NhcXEf1QpixQGDqi
 uJsDffoJamxZyKDYFbvyk7ZxL/ZJEkV5nGCFEjQtdNEJP3Zrt5MArrjoVn+wwaZm0dW3
 Ai0yYQHHKdplmBv5YdPQgdvRmNHNnu2DLHzm1KYeODfwJlMECIL3hPv+FFvbLfhyl+RF
 Nd/g==
X-Gm-Message-State: AOAM532rQxqhX9PTBWI/3rt7NebmoDcpoNKxQCb1S4RNOmeDQ9ykObXw
 mgTiYHjfwqaf2b98gR9IetKadirx864=
X-Google-Smtp-Source: ABdhPJxANmBj/O2gJNTPFlCEZrpLeO/u99wBmHVQ9W8gHFrDNamvLDWP6Os/K+Pwap/GKdend2V7pQ==
X-Received: by 2002:a17:907:214d:: with SMTP id
 rk13mr1105171ejb.501.1606934685030; 
 Wed, 02 Dec 2020 10:44:45 -0800 (PST)
Received: from x1w.redhat.com (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id z2sm506002edr.47.2020.12.02.10.44.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 10:44:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/9] target/mips: Remove now unused ASE_MSA definition
Date: Wed,  2 Dec 2020 19:44:11 +0100
Message-Id: <20201202184415.1434484-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201202184415.1434484-1-f4bug@amsat.org>
References: <20201202184415.1434484-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhc@lemote.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We don't use ASE_MSA anymore (replaced by ase_msa_available()
checking MSAP bit from CP0_Config3). Remove it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/mips-defs.h          | 1 -
 target/mips/translate_init.c.inc | 8 ++++----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
index ed6a7a9e545..805034b8956 100644
--- a/target/mips/mips-defs.h
+++ b/target/mips/mips-defs.h
@@ -45,7 +45,6 @@
 #define ASE_MT            0x0000000040000000ULL
 #define ASE_SMARTMIPS     0x0000000080000000ULL
 #define ASE_MICROMIPS     0x0000000100000000ULL
-#define ASE_MSA           0x0000000200000000ULL
 /*
  *   bits 40-51: vendor-specific base instruction sets
  */
diff --git a/target/mips/translate_init.c.inc b/target/mips/translate_init.c.inc
index 3b069190ed8..2170f8ace6f 100644
--- a/target/mips/translate_init.c.inc
+++ b/target/mips/translate_init.c.inc
@@ -408,7 +408,7 @@ const mips_def_t mips_defs[] =
         .CP1_fcr31_rw_bitmask = 0xFF83FFFF,
         .SEGBITS = 32,
         .PABITS = 40,
-        .insn_flags = CPU_MIPS32R5 | ASE_MSA,
+        .insn_flags = CPU_MIPS32R5,
         .mmu_type = MMU_TYPE_R4000,
     },
     {
@@ -719,7 +719,7 @@ const mips_def_t mips_defs[] =
         .MSAIR = 0x03 << MSAIR_ProcID,
         .SEGBITS = 48,
         .PABITS = 48,
-        .insn_flags = CPU_MIPS64R6 | ASE_MSA,
+        .insn_flags = CPU_MIPS64R6,
         .mmu_type = MMU_TYPE_R4000,
     },
     {
@@ -759,7 +759,7 @@ const mips_def_t mips_defs[] =
         .MSAIR = 0x03 << MSAIR_ProcID,
         .SEGBITS = 48,
         .PABITS = 48,
-        .insn_flags = CPU_MIPS64R6 | ASE_MSA,
+        .insn_flags = CPU_MIPS64R6,
         .mmu_type = MMU_TYPE_R4000,
     },
     {
@@ -885,7 +885,7 @@ const mips_def_t mips_defs[] =
         .CP1_fcr31_rw_bitmask = 0xFF83FFFF,
         .SEGBITS = 48,
         .PABITS = 48,
-        .insn_flags = CPU_LOONGSON3A | ASE_MSA,
+        .insn_flags = CPU_LOONGSON3A,
         .mmu_type = MMU_TYPE_R4000,
     },
     {
-- 
2.26.2



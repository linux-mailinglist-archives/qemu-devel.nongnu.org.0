Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3AF2DC497
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 17:50:24 +0100 (CET)
Received: from localhost ([::1]:57578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpa0N-0000Hw-5i
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 11:50:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpZfN-0005Pe-F8
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:28:41 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:34004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpZfL-0007nl-8W
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:28:40 -0500
Received: by mail-wr1-x42e.google.com with SMTP id q18so16267074wrn.1
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zRaZ2XrSqwps5n75JXC431veK2scZnrGflijkMP5vE0=;
 b=lbh4N1Z14JgRXog7or/D9KbHZwloQOtgWSATnhdXpnCwfkDhcKsc5QEPHqAwrQWhBW
 FsNoqVwLfXMuOi7PmEqLSavO+xpTdDU93CDy81qjbzFTXo9S8L6TfJeBW+iKLrYIUEpx
 20q377xg0VURq0bvNdN8/XD8Sh8w5JT3/tfuPpPdVH2AyRXMN5Cx7fiAF3IHmjoa5rF/
 ePnYSeO7FV/YfP/jjO2sJFcvu3jgE0NZrpvzLntRmUFa7CjGkP5VWn+Xjpb9PfsDm07I
 KCs9SMYAwrbxlSwxAk2eXH87VdQPkQUlTYiRn+SgX2+W6GDTBVW2czNLkXVIPyFkZWxx
 pXBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zRaZ2XrSqwps5n75JXC431veK2scZnrGflijkMP5vE0=;
 b=lT2PAPYtISbwrPmFdINlyIwunc+KtMEu0XaUm+r4asUEulX4D1VlXaK8pwU2yYyQar
 k80r92fzPQAaCYEczOI3pOowDaiu3CUsFYIglwSHaLk5fJM42tZwfL2FuMkWU3HS+Uzw
 8jylEG55gF6e/cNTl2wR5lcT4BWwJ1GTzjIFwplagdeQSI5JjvB7p1DsUwki59BgNUAe
 lk69dkmC8wQoSpIfNX+akgzhNdJ4QYX3XxW6NuuyIx8bDCVLwMmu7UhxMIC14lkLYyPT
 1ed6MNdz+BvmsrJmEl4iwpzBTO/BxjaUXgnNV9xCcaSivlVCL2oSy6JN4MnlbPrY6mla
 VrTQ==
X-Gm-Message-State: AOAM531SFxLBzDmY9t6Ddqk2WVcVhfD79m+VDkt/Y95BozQbVHsEXOY9
 8U+n0Kv1YcZgl4HO865QonxIwCPjyDY=
X-Google-Smtp-Source: ABdhPJyLrfZOiKaE69Jz2P+rNpP2W76B3g21FnG+NCzu5bIQat/50BLy2o3bJHS/9ypErjeN1adr2g==
X-Received: by 2002:a5d:4d45:: with SMTP id a5mr8037731wru.380.1608136117105; 
 Wed, 16 Dec 2020 08:28:37 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id s133sm3409510wmf.38.2020.12.16.08.28.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 08:28:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/12] target/mips/mips-defs: Rename ISA_MIPS32R3 as
 ISA_MIPS_R3
Date: Wed, 16 Dec 2020 17:27:42 +0100
Message-Id: <20201216162744.895920-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201216162744.895920-1-f4bug@amsat.org>
References: <20201216162744.895920-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
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

The MIPS ISA release 3 is common to 32/64-bit CPUs.

To avoid holes in the insn_flags type, update the
definition with the next available bit.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/mips-defs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
index 9ef3f517aaa..171d94c16dc 100644
--- a/target/mips/mips-defs.h
+++ b/target/mips/mips-defs.h
@@ -24,7 +24,7 @@
 #define ISA_MIPS5         0x0000000000000010ULL
 #define ISA_MIPS_R1       0x0000000000000020ULL
 #define ISA_MIPS_R2       0x0000000000000040ULL
-#define ISA_MIPS32R3      0x0000000000000200ULL
+#define ISA_MIPS_R3       0x0000000000000080ULL
 #define ISA_MIPS32R5      0x0000000000000800ULL
 #define ISA_MIPS32R6      0x0000000000002000ULL
 #define ISA_NANOMIPS32    0x0000000000008000ULL
@@ -80,7 +80,7 @@
 #define CPU_MIPS64R2    (CPU_MIPS64 | ISA_MIPS_R2)
 
 /* MIPS Technologies "Release 3" */
-#define CPU_MIPS32R3    (CPU_MIPS32R2 | ISA_MIPS32R3)
+#define CPU_MIPS32R3    (CPU_MIPS32R2 | ISA_MIPS_R3)
 #define CPU_MIPS64R3    (CPU_MIPS64R2 | CPU_MIPS32R3)
 
 /* MIPS Technologies "Release 5" */
-- 
2.26.2



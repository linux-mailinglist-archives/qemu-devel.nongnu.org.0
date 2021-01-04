Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 654D12EA003
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 23:29:00 +0100 (CET)
Received: from localhost ([::1]:54926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwYLT-00058H-EW
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 17:28:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwY69-0007sJ-8y
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 17:13:09 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:44595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwY67-00085G-Th
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 17:13:09 -0500
Received: by mail-wr1-x431.google.com with SMTP id w5so33599769wrm.11
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 14:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lb2RZp/b5dZkU06uPS3u8Lf6yQtKDoxin1D5fr6aVsg=;
 b=UTU3FK1HtbBl3rg7EkbGFAJ6TfVzTXxOxgCyUrMdjffFP4VOGHL29DyXG5BRMDMMJl
 CGi1N6USF6rieGDkUp5LXrwwjbe6n8Y40/t74OpPdA3sICRYl1q4gYkWOXk11vvnCJpN
 jZuQUxnBreXdf39WjrSvnjwXdTPyntWpyVHFJtFgqxNOjDsME6EoKon+OxXLWcyzkkUk
 +qqZ8RfSTrW3+kq27z19Stq3Co2PY0+H0Gtw49MeBhNkdp1NhPCxKVbuf3pJHgIPV9JB
 6yCMP4f0atTeyUZi3BQhtKT9Q4Ms7ufuIZXKCTTjD1uu5bsE8qCWjbqqz+HaFPj6dqEb
 uo4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Lb2RZp/b5dZkU06uPS3u8Lf6yQtKDoxin1D5fr6aVsg=;
 b=fiCiaHGG74cCI997N7bOiXYNCMMCZaFATtFikNi6ta8F+iadb9O3A+802kFzkNfawD
 RW4/dBzV19oEfNBt0uuWZ1AanxhhErdmHFG5RB58TDhZeRnOcA08DCaZdJPrqdHoNftU
 Jjlsu5biAPN0pjeKy//h1KXbVozvWJI2/kijtnKctEZFRdpcjfDlOfEarHR2Y/ufax8N
 K/pfQxUMvC1R1IuVcrQPco7RFCqWj/2K2Kyi3wrnGOPWV5xpRK2h2/UK4tNF7zK9x/Ho
 mESwTtEnDRf+XZ0Y/TAdE47pDtY39bRuiGAayk9csMLy7wpLB4qOSwhUALZbhpdE5upf
 XRdA==
X-Gm-Message-State: AOAM533m+Jg5Wh+elR9zj+FwEOvz2r+klh9oiekuaT0Oz0/niMqyDJuK
 kX7Faf25ND6fBbkfXMb866oaMnFEEGw=
X-Google-Smtp-Source: ABdhPJwCwKGvxTFO88kjPjeU6cxlRMLo10cUttc7MHHeG4qNKS9urwckYKVzFjQJmJAjEU+z+IeUlA==
X-Received: by 2002:a5d:660b:: with SMTP id n11mr81968492wru.407.1609798386313; 
 Mon, 04 Jan 2021 14:13:06 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id u66sm1264709wmg.2.2021.01.04.14.13.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 14:13:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/15] target/mips/mips-defs: Rename ISA_MIPS32R3 as
 ISA_MIPS_R3
Date: Mon,  4 Jan 2021 23:11:52 +0100
Message-Id: <20210104221154.3127610-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210104221154.3127610-1-f4bug@amsat.org>
References: <20210104221154.3127610-1-f4bug@amsat.org>
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
 Paul Burton <paulburton@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The MIPS ISA release 3 is common to 32/64-bit CPUs.

To avoid holes in the insn_flags type, update the
definition with the next available bit.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/mips-defs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
index d1eeb69dfd7..12ff2b3280c 100644
--- a/target/mips/mips-defs.h
+++ b/target/mips/mips-defs.h
@@ -18,7 +18,7 @@
 #define ISA_MIPS5         0x0000000000000010ULL
 #define ISA_MIPS_R1       0x0000000000000020ULL
 #define ISA_MIPS_R2       0x0000000000000040ULL
-#define ISA_MIPS32R3      0x0000000000000200ULL
+#define ISA_MIPS_R3       0x0000000000000080ULL
 #define ISA_MIPS32R5      0x0000000000000800ULL
 #define ISA_MIPS32R6      0x0000000000002000ULL
 #define ISA_NANOMIPS32    0x0000000000008000ULL
@@ -77,7 +77,7 @@
 #define CPU_MIPS64R2    (CPU_MIPS64R1 | CPU_MIPS32R2)
 
 /* MIPS Technologies "Release 3" */
-#define CPU_MIPS32R3    (CPU_MIPS32R2 | ISA_MIPS32R3)
+#define CPU_MIPS32R3    (CPU_MIPS32R2 | ISA_MIPS_R3)
 #define CPU_MIPS64R3    (CPU_MIPS64R2 | CPU_MIPS32R3)
 
 /* MIPS Technologies "Release 5" */
-- 
2.26.2



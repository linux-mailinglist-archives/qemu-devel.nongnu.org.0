Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B852DC17F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 14:46:51 +0100 (CET)
Received: from localhost ([::1]:34776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpX8k-00022S-WF
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 08:46:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpX5x-0000Zg-3Y
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 08:43:57 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:34467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpX5t-0005QF-U0
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 08:43:55 -0500
Received: by mail-wr1-x436.google.com with SMTP id q18so15713178wrn.1
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 05:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rWhkzIf/6CTljorBq+mR8pkgCAWYYKs0Obfa0b4MU1w=;
 b=qIiZnyWJvffP3c9qPjnrRxkSg9QdQIPYdVRRt1DmCma7hk7ogrzoTrti0hTuhKUqJy
 ZzBaKs72EDIM0J045DgO9khOHzaC/tyhLXNtcFNOEHb7r2/nPLAVYgXZPbO2Bdm6z7lE
 WfAckwL60qUb83QSvAnokBJ9xQIPeS3RnkRVQrTKQ4GsaAG6wuEnKNGU0Fe2Xgz9YGPV
 6dQCDiAAL79r8qwH7OAKfrC5BzGjCb9L+XBN9BDvCBaK9vb/E2r9pd/dS4BlnAAp9Up9
 JDwYerMoLvCLxGgolRA8GUcIipho+OzzmYuMTmAiAjjdrRD1tmO/JfSZcnIV6MK4KnOi
 71QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rWhkzIf/6CTljorBq+mR8pkgCAWYYKs0Obfa0b4MU1w=;
 b=uNusvk5Rms3Xe0/GmDeTn69JGbwoEioeCo31p0N4ACyWO8E+f5Nwyt3Z1lgSZz58Gz
 lRnL6gSTEetxrSo2gvNBAvwrkZbCN02JUC3Fs0jS8QLVuKKbPytkC657VqTRR+NktgnZ
 HjUputMCU9vxiaaih/RCZd/zBf4aWOoK534px4mzkSldLZBLKo0dYgYPibIdsHRfuHCt
 hxcUZZ9qILwz8W0X45CCudEn96NYdMmcTMcB+ZyykSWQB2aScmEe1LE2i66liHBEuBSG
 NSU9SQVq0fibb5tYDUIJV+bt6J0hfc1cdUgX+k8kQ1fVst7fOSoiGAoYGC0rQZWF+Nqe
 qbXQ==
X-Gm-Message-State: AOAM531jay/DJZdtpJhZ8Lwl+WLyZ1f+iyHADkGHksVyVEc+rQIlms+z
 oXUfk6gvKravAKBmbXPQrqTs3xg+kVA=
X-Google-Smtp-Source: ABdhPJw4lh8u8K5nhHA4FpZLZX+I3LxbKr3v1SP3XyMUiGhS+ebkajtoHHJ1gky2nV0zxYZdvm6Xiw==
X-Received: by 2002:a5d:62c8:: with SMTP id o8mr39289508wrv.51.1608126230995; 
 Wed, 16 Dec 2020 05:43:50 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id u85sm2907049wmu.43.2020.12.16.05.43.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 05:43:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/11] target/mips/mips-defs: Use ISA_MIPS32R3 definition to
 check Release 3
Date: Wed, 16 Dec 2020 14:43:21 +0100
Message-Id: <20201216134328.851840-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201216134328.851840-1-f4bug@amsat.org>
References: <20201216134328.851840-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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

Use the single ISA_MIPS32R3 definition to check if the Release 3
ISA is supported, whether the CPU support 32/64-bit.

For now we keep '32' in the definition name, we will rename it
as ISA_MIPS_R3 in few commits.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/mips-defs.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
index 9cfa4c346bf..0d906ca64b3 100644
--- a/target/mips/mips-defs.h
+++ b/target/mips/mips-defs.h
@@ -25,7 +25,6 @@
 #define ISA_MIPS32        0x0000000000000020ULL
 #define ISA_MIPS32R2      0x0000000000000040ULL
 #define ISA_MIPS32R3      0x0000000000000200ULL
-#define ISA_MIPS64R3      0x0000000000000400ULL
 #define ISA_MIPS32R5      0x0000000000000800ULL
 #define ISA_MIPS64R5      0x0000000000001000ULL
 #define ISA_MIPS32R6      0x0000000000002000ULL
@@ -84,7 +83,7 @@
 
 /* MIPS Technologies "Release 3" */
 #define CPU_MIPS32R3    (CPU_MIPS32R2 | ISA_MIPS32R3)
-#define CPU_MIPS64R3    (CPU_MIPS64R2 | CPU_MIPS32R3 | ISA_MIPS64R3)
+#define CPU_MIPS64R3    (CPU_MIPS64R2 | CPU_MIPS32R3)
 
 /* MIPS Technologies "Release 5" */
 #define CPU_MIPS32R5    (CPU_MIPS32R3 | ISA_MIPS32R5)
-- 
2.26.2



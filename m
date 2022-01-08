Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C0E488292
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 09:45:21 +0100 (CET)
Received: from localhost ([::1]:37796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n67Lk-0000il-8h
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 03:45:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Iq-0005OY-5Q
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:38:16 -0500
Received: from [2607:f8b0:4864:20::d2c] (port=42724
 helo=mail-io1-xd2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Im-0003TZ-RQ
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:38:15 -0500
Received: by mail-io1-xd2c.google.com with SMTP id o7so10064155ioo.9
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 23:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yq/esU6h8w+LdCkuWquK/eBiSLOcYx6Uh3QYevpdbXE=;
 b=Ux6bT1h+NL04vRBOs7InSf8TFeJqq3ydq5OuOHgvepvQRx5lu33u2sz7Nnt7yPGDsP
 rajaAKrjxdiIXVo0QjIQKjTYCIFljvW5pb4DpggOUtn6adcxNFz7Aqbn1BkBF7mz9PEt
 o0n59flxBZCm9hwGNzbs+EHSbKJcojP5hdU6mGKtYsNR2gXti+d8zyeVhq6xnX67Z9QF
 dFrxhWKukEu0673ihhwHTq5VnQejfKc6rqwVDT+yIpKloiRkPg1cTEAhwLyMCvsbAOZS
 rNkb/PdZZH47o2wd+kdGdxF7uT/yswgiXVq/Y4vh+sAgm7eCqOGfk0xdE9MQEdWQ54cz
 mz7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yq/esU6h8w+LdCkuWquK/eBiSLOcYx6Uh3QYevpdbXE=;
 b=pzwW+ozYLG3Z65n2E2wExiD+oz9i3i9NgdAAJ7kuzw6vM7kH3PfWNcxmdwsGlEUhXP
 KcRHNVEFAx8YBaS/9n392BcCUM4QF9nwzR+1tVHGFKhHTgfi+1fiU+V4P/FGrDq9g7s6
 MWoJoOpxMq18T85XL9IeFumhv9wfpLiLU8PsDrzt8qsRl8JxeaC7vsV8WFkmgxlsVfo9
 OOHmd1JUbLDU4MmwwjW7sFik05dRvT0/xksTQdSJet+3+RlWNsHk/3eJeLq392/3siZu
 q714ZKFVmgy2aWyJj5RyTk0d67mO/NyAW/5pY1ciUB/f63+baFEHi+Z575EAcNUUAAw+
 YHtA==
X-Gm-Message-State: AOAM533LdqmBfDj0dZFk195udWtf6COpH7mVNdJNHbT1IRg8pKJjQyeG
 OsQ7ixNL6HM5t2ZoBuFZsEeiw5KPMD1PRby7
X-Google-Smtp-Source: ABdhPJzXh8VLD5aHqkgc1xExN0YZGjAUVb3zTkuvHPwAge662IExrA8FeGKJOf8gD8+uRM/NaSFAXg==
X-Received: by 2002:a5e:9b07:: with SMTP id j7mr30935584iok.136.1641627491628; 
 Fri, 07 Jan 2022 23:38:11 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w19sm613022iov.12.2022.01.07.23.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 23:38:11 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 29/37] bsd-user/arm/target_arch_signal.h: arm specific signal
 registers and stack
Date: Sat,  8 Jan 2022 00:37:29 -0700
Message-Id: <20220108073737.5959-30-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108073737.5959-1-imp@bsdimp.com>
References: <20220108073737.5959-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2c
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@FreeBSD.org>, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Defines for registers and stack layout related to signals.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_signal.h | 57 +++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 bsd-user/arm/target_arch_signal.h

diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_arch_signal.h
new file mode 100644
index 00000000000..973183d99ca
--- /dev/null
+++ b/bsd-user/arm/target_arch_signal.h
@@ -0,0 +1,57 @@
+/*
+ *  arm signal definitions
+ *
+ *  Copyright (c) 2013 Stacey D. Son
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+#ifndef _TARGET_ARCH_SIGNAL_H_
+#define _TARGET_ARCH_SIGNAL_H_
+
+#include "cpu.h"
+
+#define TARGET_REG_R0   0
+#define TARGET_REG_R1   1
+#define TARGET_REG_R2   2
+#define TARGET_REG_R3   3
+#define TARGET_REG_R4   4
+#define TARGET_REG_R5   5
+#define TARGET_REG_R6   6
+#define TARGET_REG_R7   7
+#define TARGET_REG_R8   8
+#define TARGET_REG_R9   9
+#define TARGET_REG_R10  10
+#define TARGET_REG_R11  11
+#define TARGET_REG_R12  12
+#define TARGET_REG_R13  13
+#define TARGET_REG_R14  14
+#define TARGET_REG_R15  15
+#define TARGET_REG_CPSR 16
+#define TARGET__NGREG   17
+/* Convenience synonyms */
+#define TARGET_REG_FP   TARGET_REG_R11
+#define TARGET_REG_SP   TARGET_REG_R13
+#define TARGET_REG_LR   TARGET_REG_R14
+#define TARGET_REG_PC   TARGET_REG_R15
+
+#define TARGET_INSN_SIZE    4       /* arm instruction size */
+
+/* Size of the signal trampolin code. See _sigtramp(). */
+#define TARGET_SZSIGCODE    ((abi_ulong)(9 * TARGET_INSN_SIZE))
+
+/* compare to arm/include/_limits.h */
+#define TARGET_MINSIGSTKSZ  (1024 * 4)                  /* min sig stack size */
+#define TARGET_SIGSTKSZ     (TARGET_MINSIGSTKSZ + 32768)  /* recommended size */
+
+#endif /* !_TARGET_ARCH_SIGNAL_H_ */
-- 
2.33.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF97D4AA030
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 20:36:58 +0100 (CET)
Received: from localhost ([::1]:45208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG4O9-0004kV-Of
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 14:36:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nG2hz-00071K-Pu
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 12:49:20 -0500
Received: from [2a00:1450:4864:20::434] (port=39759
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nG2hx-0004Cu-Fi
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 12:49:19 -0500
Received: by mail-wr1-x434.google.com with SMTP id r17so3666810wrr.6
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 09:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qEJf89SevVQot2Hj3ZJkC4AKQIDCORDOul1GSl8azAo=;
 b=NTPiogaiwpNiS/2m8oSA5CBLSFEQLDunFyuHEkbjEvwU2iHb0gbVol80kzO+7NR9a1
 oSSrp0QLkhBfIqlGCRrl9zM+3w2PHiAtjAesjVZCRywKxt2DF6pvTBHLQ2yTY3XI5DLL
 POfsD8p/QG6axinZBKvY4IjVP8LaG9roV+zcRuybnTt9VFSvaBsYcwKlohsd9baWlILo
 Xp0WybuIggeZZ2FZLz47zrEMqy8U4bR072FEf1Q7gjX24uuHi41WQMUnCHlhxWk3e1dW
 0aq5aQv3cdJHAoqbIM14UIhJpHRj+Btrv8NF26lOE1PgcNf069QgdXI2zRC2TZHq1BqQ
 UkYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qEJf89SevVQot2Hj3ZJkC4AKQIDCORDOul1GSl8azAo=;
 b=r54YrckeY7RKlzkhTz/UCOuK/cTjSagBzuN2hn9Td2X3cxCKY18XLDhU8/phflHzj6
 IlTZegiW0fyfC+uBWQNssBYy0qT2HjKX07FY9mGEbFQ0np7wWd6dq6jrMMHRz51O+1CQ
 86uhJen/qc4bBe14wkCXm7XC/uylw1a9URwP4b/S/W+Zca23T51Mn7Oj+TeYIj5Ejz5I
 pfmZukAlBcY0QkdoZPK0p37mvCcrHF4TXjV8xw/Cncc0yU+KEFz7num9J0L2u8oTPtgI
 1DsTorVU2zsL/emdEcm1KcSvDJDluJ+K91nPx50oqXzNfpVaWE5I8Kj+3rILAynTT70k
 N+ww==
X-Gm-Message-State: AOAM5336NbolfSRlm87xu4T918qpQPoecoIQjGA0x24vhYRmUb2iVZAZ
 DP80d0oLllS8lHdZX+pbJPpE1w==
X-Google-Smtp-Source: ABdhPJyLayT6ba46SreIchBkTYWlJnqu+oz15I43g3AKINe0DNAfVa7lnGecvv4+RV+KFt7ww9ZDRA==
X-Received: by 2002:a5d:4943:: with SMTP id r3mr31848wrs.130.1643996956171;
 Fri, 04 Feb 2022 09:49:16 -0800 (PST)
Received: from localhost.localdomain ([122.167.157.188])
 by smtp.gmail.com with ESMTPSA id f13sm11381876wmq.29.2022.02.04.09.49.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 09:49:15 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: [PATCH v9 22/23] docs/system: riscv: Document AIA options for virt
 machine
Date: Fri,  4 Feb 2022 23:16:58 +0530
Message-Id: <20220204174700.534953-23-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204174700.534953-1-anup@brainfault.org>
References: <20220204174700.534953-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::434;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Anup Patel <anup@brainfault.org>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Anup Patel <anup.patel@wdc.com>

We have two new machine options "aia" and "aia-guests" available
for the RISC-V virt machine so let's document these options.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 docs/system/riscv/virt.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
index fa016584bf..373645513a 100644
--- a/docs/system/riscv/virt.rst
+++ b/docs/system/riscv/virt.rst
@@ -63,6 +63,22 @@ The following machine-specific options are supported:
   When this option is "on", ACLINT devices will be emulated instead of
   SiFive CLINT. When not specified, this option is assumed to be "off".
 
+- aia=[none|aplic|aplic-imsic]
+
+  This option allows selecting interrupt controller defined by the AIA
+  (advanced interrupt architecture) specification. The "aia=aplic" selects
+  APLIC (advanced platform level interrupt controller) to handle wired
+  interrupts whereas the "aia=aplic-imsic" selects APLIC and IMSIC (incoming
+  message signaled interrupt controller) to handle both wired interrupts and
+  MSIs. When not specified, this option is assumed to be "none" which selects
+  SiFive PLIC to handle wired interrupts.
+
+- aia-guests=nnn
+
+  The number of per-HART VS-level AIA IMSIC pages to be emulated for a guest
+  having AIA IMSIC (i.e. "aia=aplic-imsic" selected). When not specified,
+  the default number of per-HART VS-level AIA IMSIC pages is 0.
+
 Running Linux kernel
 --------------------
 
-- 
2.25.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3ACAF848
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 10:52:41 +0200 (CEST)
Received: from localhost ([::1]:48104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7yMh-0003Ml-Tg
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 04:52:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57510)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i7xwB-00084p-4v
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 04:25:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i7xw9-0006j3-I0
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 04:25:14 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37695)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i7xw9-0006iY-B1
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 04:25:13 -0400
Received: by mail-wm1-f68.google.com with SMTP id r195so2394647wme.2
 for <qemu-devel@nongnu.org>; Wed, 11 Sep 2019 01:25:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=OBRVpIVwK3kiEvI4bIZsljmE4GCfcTWi7KQvPyiBclk=;
 b=NjqQDcWrqjr7GXc5Ch9Vkk1rG1t2RVF02po3S1Nf5W5wu9WZOQQvEbmwVPrIhj+78o
 PoGpR6GjDdp2O6RYS9e8QANLrbUkl4ENEbKa3nK/kc7J8zl0sGwYk8UsXMTc48dTF0Vb
 GxLkxZlq+ICp23Udqi4EB3aRJMXnI/gz9lGV1K+akDwjMA2emvq7GL9WDNKFDv/nkHTD
 IrVm5Wy4ovI35R5k64rTUb6iftgHwrphOE1I7aQTMDxrlLiqawIfUbCCzFPU2+K1C6Xx
 GuFQhx727Tqpk7luZlrtiqMj5VDxbzYo64zdWAgy/S7I19dTWh71rPswBl7lDzQXIDkX
 mjnQ==
X-Gm-Message-State: APjAAAWafV54wygdHnKuzqm0RtpdIMnFpJ5H7Ucm7PcFBO0zOyFm8KHi
 T9u3OzAFa6IKVTncB0zM4f5TUTVB45Cxng==
X-Google-Smtp-Source: APXvYqwOLMhtedBew8cpZ69/ydvXndLdj0cG0tUWQMpBwxvfRjwiDR5UA3JDT79JTLh+1gaxPO3+MQ==
X-Received: by 2002:a1c:ed16:: with SMTP id l22mr2831850wmh.172.1568190312094; 
 Wed, 11 Sep 2019 01:25:12 -0700 (PDT)
Received: from localhost ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id w8sm2577900wmc.1.2019.09.11.01.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 01:25:11 -0700 (PDT)
Date: Tue, 10 Sep 2019 12:04:53 -0700
Message-Id: <20190910190513.21160-28-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190910190513.21160-1-palmer@sifive.com>
References: <20190910190513.21160-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.68
Subject: [Qemu-devel] [PULL 27/47] riscv: Add a sifive_cpu.h to include both
 E and U cpu type defines
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
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@sifive.com>,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 ilippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bmeng.cn@gmail.com>

Group SiFive E and U cpu type defines into one header file.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 include/hw/riscv/sifive_cpu.h | 31 +++++++++++++++++++++++++++++++
 include/hw/riscv/sifive_e.h   |  7 +------
 include/hw/riscv/sifive_u.h   |  7 +------
 3 files changed, 33 insertions(+), 12 deletions(-)
 create mode 100644 include/hw/riscv/sifive_cpu.h

diff --git a/include/hw/riscv/sifive_cpu.h b/include/hw/riscv/sifive_cpu.h
new file mode 100644
index 0000000000..136799633a
--- /dev/null
+++ b/include/hw/riscv/sifive_cpu.h
@@ -0,0 +1,31 @@
+/*
+ * SiFive CPU types
+ *
+ * Copyright (c) 2017 SiFive, Inc.
+ * Copyright (c) 2019 Bin Meng <bmeng.cn@gmail.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HW_SIFIVE_CPU_H
+#define HW_SIFIVE_CPU_H
+
+#if defined(TARGET_RISCV32)
+#define SIFIVE_E_CPU TYPE_RISCV_CPU_SIFIVE_E31
+#define SIFIVE_U_CPU TYPE_RISCV_CPU_SIFIVE_U34
+#elif defined(TARGET_RISCV64)
+#define SIFIVE_E_CPU TYPE_RISCV_CPU_SIFIVE_E51
+#define SIFIVE_U_CPU TYPE_RISCV_CPU_SIFIVE_U54
+#endif
+
+#endif /* HW_SIFIVE_CPU_H */
diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
index 9c868dd7f9..25ce7aa9d5 100644
--- a/include/hw/riscv/sifive_e.h
+++ b/include/hw/riscv/sifive_e.h
@@ -20,6 +20,7 @@
 #define HW_SIFIVE_E_H
 
 #include "hw/riscv/riscv_hart.h"
+#include "hw/riscv/sifive_cpu.h"
 #include "hw/riscv/sifive_gpio.h"
 
 #define TYPE_RISCV_E_SOC "riscv.sifive.e.soc"
@@ -84,10 +85,4 @@ enum {
 #define SIFIVE_E_PLIC_CONTEXT_BASE 0x200000
 #define SIFIVE_E_PLIC_CONTEXT_STRIDE 0x1000
 
-#if defined(TARGET_RISCV32)
-#define SIFIVE_E_CPU TYPE_RISCV_CPU_SIFIVE_E31
-#elif defined(TARGET_RISCV64)
-#define SIFIVE_E_CPU TYPE_RISCV_CPU_SIFIVE_E51
-#endif
-
 #endif
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index be021ce256..f25bad8f13 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -21,6 +21,7 @@
 
 #include "hw/net/cadence_gem.h"
 #include "hw/riscv/riscv_hart.h"
+#include "hw/riscv/sifive_cpu.h"
 
 #define TYPE_RISCV_U_SOC "riscv.sifive.u.soc"
 #define RISCV_U_SOC(obj) \
@@ -78,10 +79,4 @@ enum {
 #define SIFIVE_U_PLIC_CONTEXT_BASE 0x200000
 #define SIFIVE_U_PLIC_CONTEXT_STRIDE 0x1000
 
-#if defined(TARGET_RISCV32)
-#define SIFIVE_U_CPU TYPE_RISCV_CPU_SIFIVE_U34
-#elif defined(TARGET_RISCV64)
-#define SIFIVE_U_CPU TYPE_RISCV_CPU_SIFIVE_U54
-#endif
-
 #endif
-- 
2.21.0



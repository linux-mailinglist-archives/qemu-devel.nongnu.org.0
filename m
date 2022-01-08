Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 603F94882A8
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 10:01:14 +0100 (CET)
Received: from localhost ([::1]:47374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n672M-0001OW-1m
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 03:25:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Im-0005M1-Nd
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:38:15 -0500
Received: from [2607:f8b0:4864:20::d2e] (port=46621
 helo=mail-io1-xd2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Ij-0003RI-AA
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:38:12 -0500
Received: by mail-io1-xd2e.google.com with SMTP id x6so10011319iol.13
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 23:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e+6KZ3Ysi4G9kovLQZe1VwbKNP6XCvJKHGf2d/pxlNg=;
 b=S74B33RGxxdx5+64KSHucUxj7FM/+N05Ggq9fSh9tehIoatMps7rhyObePqsgaGPOe
 1B93NHWgL+4PWGVkTdhc7+mIsO1tcULHMxhYXsutGPDqmdQEKbWKXCD504v3qmHwj10a
 /edoskLRJExEcyvMI8EKISqGPY5r5itmElnVliYkhl1z9Pb1X2gNG2qBTPJlvIKq+Y5f
 VRUZsW5FFxw0V8eDgYD9yb+K0HWnjmO9KUyObQzJZUcswR/m8GkoJRNa5IEiIvXhB+h9
 BwrOW16Y5vCCgr4JUb7xqnN0Ne5ArkbfYnFfAWPAYflJSjZQPJaFhkiyyv0iTwqob1uQ
 BJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e+6KZ3Ysi4G9kovLQZe1VwbKNP6XCvJKHGf2d/pxlNg=;
 b=VNkkxKUkFJnGszHD3tK9PhDIfogDYwXDU/cengU63NQ6ErUqoxwXRPvxNwP6OpVqln
 5xK6fpTajhokG7z8nFUl/NChA3SHUkxuJRUFg0M3lNuYpJuZBI5lerlSMTSwqyKl08St
 jNymZLLsZiaemnvfBmil9GnXEEMGOEXgHVA/cyc2sR363+7vgjLWNBhoP1E8NWDP6trN
 gt4DYWjTkBEs/uBa3bRMmll3j+aPQEhh+kbt775Yex5kBkzrzFEPoDiLgwCKMwD0kyPz
 F5IuieXqVA1jkCXHfW5zQn5guPxhnaA8kOVl53s/zOynJH9+X8XAcYAGSVJN7A/Q5E/6
 US8w==
X-Gm-Message-State: AOAM533y8SOud0SIPi3ahELjn/oWvUiAE8xUackokiTlASB2dl1NKhbD
 klREWF0PQeCP4lZFpnKmBHxdRQ5Mht6CAfC5
X-Google-Smtp-Source: ABdhPJz3BX9BiqvSXZdegkOimtwJnAbOLOCs2Nb/OLu4Q/jD0M8EN/xnUQK3FucXmefm/n4t+wpNfA==
X-Received: by 2002:a6b:fd19:: with SMTP id c25mr29752395ioi.49.1641627485812; 
 Fri, 07 Jan 2022 23:38:05 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w19sm613022iov.12.2022.01.07.23.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 23:38:05 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/37] bsd-user/arm/target_arch_vmparam.h: Parameters for arm
 address space
Date: Sat,  8 Jan 2022 00:37:23 -0700
Message-Id: <20220108073737.5959-24-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108073737.5959-1-imp@bsdimp.com>
References: <20220108073737.5959-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2e
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2e.google.com
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

Various parameters describing the layout of the ARM address space. In
addition, define routines to get the stack pointer and to set the second
return value.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_vmparam.h | 48 ++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 bsd-user/arm/target_arch_vmparam.h

diff --git a/bsd-user/arm/target_arch_vmparam.h b/bsd-user/arm/target_arch_vmparam.h
new file mode 100644
index 00000000000..4bbc04ddf5b
--- /dev/null
+++ b/bsd-user/arm/target_arch_vmparam.h
@@ -0,0 +1,48 @@
+/*
+ *  arm VM parameters definitions
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
+#ifndef _TARGET_ARCH_VMPARAM_H_
+#define _TARGET_ARCH_VMPARAM_H_
+
+#include "cpu.h"
+
+/* compare to sys/arm/include/vmparam.h */
+#define TARGET_MAXTSIZ      (64 * MiB)           /* max text size */
+#define TARGET_DFLDSIZ      (128 * MiB)          /* initial data size limit */
+#define TARGET_MAXDSIZ      (512 * MiB)          /* max data size */
+#define TARGET_DFLSSIZ      (4 * MiB)            /* initial stack size limit */
+#define TARGET_MAXSSIZ      (64 * MiB)           /* max stack size */
+#define TARGET_SGROWSIZ     (128 * KiB)          /* amount to grow stack */
+
+#define TARGET_RESERVED_VA  0xf7000000
+
+                /* KERNBASE - 512 MB */
+#define TARGET_VM_MAXUSER_ADDRESS   (0xc0000000 - (512 * MiB))
+#define TARGET_USRSTACK             TARGET_VM_MAXUSER_ADDRESS
+
+static inline abi_ulong get_sp_from_cpustate(CPUARMState *state)
+{
+    return state->regs[13]; /* sp */
+}
+
+static inline void set_second_rval(CPUARMState *state, abi_ulong retval2)
+{
+    state->regs[1] = retval2;
+}
+
+#endif  /* ! _TARGET_ARCH_VMPARAM_H_ */
-- 
2.33.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9E632FB70
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 16:41:56 +0100 (CET)
Received: from localhost ([::1]:57530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIZ3z-0007Rm-QR
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 10:41:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIYz9-0000R7-Ts; Sat, 06 Mar 2021 10:36:55 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:42576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIYz8-0008Cu-49; Sat, 06 Mar 2021 10:36:55 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 b2-20020a7bc2420000b029010be1081172so1103307wmj.1; 
 Sat, 06 Mar 2021 07:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kmb7Ed8jPYS6p2YVLkmvbxMki/u380FCBzPMox5kFws=;
 b=CDDjY5iARCnNYzaEHwTgViQLHUyYktwHzQkXLu2EeXiF0BRUfQhyOb/zEd6tqMlsT3
 DNjfzr1jVA7NMc8BrT+hMqZM/KRAglqG0Lz8p/83Iwe9H2G+ybTKwr3EeYFQOYKDlKYg
 7WaA3dWHZYOgMJzuV2x4cMRvilfkBcHNKHPEqfQWYYql6hbmGgLzENdF8On40H/569ZW
 AIw0pod0VCN60+EDFusp9kqvWEsUF5NmuGLWT2sREFvHXozeytBB0TNip/Y0jr30wj0T
 SRLd4Gjg5nDSy0242cVytR1VWNCx6MiZzxcL2rVUB4RjTQ2X9Tdjni0obKOnNjhi0qYX
 ObJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Kmb7Ed8jPYS6p2YVLkmvbxMki/u380FCBzPMox5kFws=;
 b=nL6yg6A5+28y5p8t8+XPCpVI/hY6UhEBGunAVoriLvK5WUhQ3x/eINbJEFYRRj1ZWy
 LxpcKK3rvPPBsoCsJOz9IITznV/O/+KQIslyYnCFd44gMIj3pfnArMj8q3OxyUNwf4ep
 s/UGbcSlN0KNi41MsLPh+TomqeLmklYvLsLgfwTtCLwZEgbUJ3NbmFZ1fEXatpSNLlcy
 4ynoeHezDBnSqLSPEDD2YvPkexcpNaeGljq+yr/R3wL4SBmkQnYXwnY5m/3aIEPILDMk
 1FKy9M0TD8s9wfAVZcjVpnwL8ne9CBLErUg/Fb16R5WWQt/wZJt365PQkLNkI27NntIF
 0t7A==
X-Gm-Message-State: AOAM532yqSg+DBlfA54k6m8BG8mncT0QY1lMY0zjoXboNhgWo0j4o5tU
 Fn31X5wPyQ6++kh7GVmV5LAddwhxzSg=
X-Google-Smtp-Source: ABdhPJwl+/bh3mz8M0/esvilSJ3dm2tuP9Fi6NyGMpwPzz9udk43chNmO1xODDVmrSO4rkWDiNWVhw==
X-Received: by 2002:a05:600c:224e:: with SMTP id
 a14mr13848509wmm.57.1615045012229; 
 Sat, 06 Mar 2021 07:36:52 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id w11sm3461229wrv.88.2021.03.06.07.36.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 07:36:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/14] hw/sh4: Add missing license
Date: Sat,  6 Mar 2021 16:36:13 +0100
Message-Id: <20210306153621.2393879-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210306153621.2393879-1-f4bug@amsat.org>
References: <20210306153621.2393879-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>, Samuel Tardieu <sam@rfc1149.net>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This code was introduced in commit 27c7ca7e775,
("SHIX board emulation (Samuel Tardieu)"). Use
the same license.

Cc: Samuel Tardieu <sam@rfc1149.net>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210222141514.2646278-2-f4bug@amsat.org>
---
 include/hw/sh4/sh.h | 31 ++++++++++++++++++++++++++++---
 hw/block/tc58128.c  | 26 ++++++++++++++++++++++++++
 2 files changed, 54 insertions(+), 3 deletions(-)

diff --git a/include/hw/sh4/sh.h b/include/hw/sh4/sh.h
index 93f464bf4cd..becb5969790 100644
--- a/include/hw/sh4/sh.h
+++ b/include/hw/sh4/sh.h
@@ -1,6 +1,31 @@
-#ifndef QEMU_SH_H
-#define QEMU_SH_H
-/* Definitions for SH board emulation.  */
+/*
+ * Definitions for SH board emulation
+ *
+ * Copyright (c) 2005 Samuel Tardieu
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ *
+ * SPDX-License-Identifier: MIT
+ */
+#ifndef QEMU_HW_SH_H
+#define QEMU_HW_SH_H
 
 #include "hw/sh4/sh_intc.h"
 #include "target/sh4/cpu-qom.h"
diff --git a/hw/block/tc58128.c b/hw/block/tc58128.c
index 9888f01ac60..bfc27ad8993 100644
--- a/hw/block/tc58128.c
+++ b/hw/block/tc58128.c
@@ -1,3 +1,29 @@
+/*
+ * TC58128 NAND EEPROM emulation
+ *
+ * Copyright (c) 2005 Samuel Tardieu
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ *
+ * SPDX-License-Identifier: MIT
+ */
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "hw/sh4/sh.h"
-- 
2.26.2



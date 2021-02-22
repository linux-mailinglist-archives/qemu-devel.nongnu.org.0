Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D5D321A1E
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 15:21:09 +0100 (CET)
Received: from localhost ([::1]:45376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEC5E-00077W-8r
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 09:21:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEBzh-00038X-FI; Mon, 22 Feb 2021 09:15:25 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:33186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEBzf-000157-Qr; Mon, 22 Feb 2021 09:15:25 -0500
Received: by mail-ed1-x529.google.com with SMTP id c6so22228020ede.0;
 Mon, 22 Feb 2021 06:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dmBDOSPHUBsxt7wUc+IzchJdmMa5xMeP6klvWD3BkNU=;
 b=XBlLiYxD2EJfxWNpRZBng0ZIdOp4qk33dyAzgNzZzfVW+xwAvgFt/ShlKWZi798xLh
 VpmSVn2gPatrPrsB79AT+Av+7CGv4Gv72d+EjTtbf79kEebkjkX/EBz6hax1/DrdRELo
 clNDnVXoX/SsvXz/Yx4a6sp4BeVMyDNqG+Lawocy5ynSppj7uLnU5VFFKFip+EwRB9XE
 Cxlrp17NbHaesuc/Pw7/IaVAqY0R24rfBZoVJzq8o/+W1Bvny+FkwdCaIaWqqDF5khyA
 95Y92i3N0ODzc5QW+blNgdHzfyDAMiLKMIi7S30qGYMxX3SNML75Q89oRHX9DUoVoLl5
 IiYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dmBDOSPHUBsxt7wUc+IzchJdmMa5xMeP6klvWD3BkNU=;
 b=NM1kihHaFXrCvx2EqnzO8OrdcYKFdjHnZS3oHtWfG+53fgVdawMwdHCGkC20VgukbE
 Pa1WTbQ/tAe94pI1EpO8CTaTlUimSUwUBaccyq42ustxWwjYhoEArpT0OqR2eoehaxIi
 uOjR5jdBQZw0kUE7jV1t6SxeRB5d4qS/R0kdGpcQqjV58Xdg7ytoSz9n8k1ugLJrIp1+
 daUWIiv2KrXeol2W7HNwBHWeVTHU1qvOAxwdSn4TZ6GI8wNP2/j6vq4igYIBzX2rIZWB
 nUiGuzEAijxOC32kRrQ+g7JL84BOoPAUM9PmIjy9c+z60KAYAxgxCAOtzdFzkdaqNUhY
 da6Q==
X-Gm-Message-State: AOAM530x5BOw9lQ3tDqpQa+gc2Tg9ZbwgQmgZF5+mKjnvYtZXFtpk7R5
 Tcd1BzmN2zxi0VRp7yf5IqrYHYJ2+MM=
X-Google-Smtp-Source: ABdhPJziDjxtZpxDg1Ril4L97/MhhjkqfjiasGnoFsCz0bpnF8pdm7CssmpTNCq10QS+YXIeVgvrbQ==
X-Received: by 2002:a05:6402:34c1:: with SMTP id
 w1mr22960384edc.147.1614003321656; 
 Mon, 22 Feb 2021 06:15:21 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z22sm12096586edb.88.2021.02.22.06.15.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 06:15:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/8] hw/sh4: Add missing license
Date: Mon, 22 Feb 2021 15:15:07 +0100
Message-Id: <20210222141514.2646278-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210222141514.2646278-1-f4bug@amsat.org>
References: <20210222141514.2646278-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x529.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-block@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>, Samuel Tardieu <sam@rfc1149.net>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This code was introduced in commit 27c7ca7e775,
("SHIX board emulation (Samuel Tardieu)"). Use
the same license.

Cc: Samuel Tardieu <sam@rfc1149.net>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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



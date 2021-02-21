Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EB6320E17
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 23:03:01 +0100 (CET)
Received: from localhost ([::1]:34850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDwoe-0002nM-3e
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 17:03:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDwlE-0000c5-92; Sun, 21 Feb 2021 16:59:28 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:34046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDwlC-0000dR-UH; Sun, 21 Feb 2021 16:59:28 -0500
Received: by mail-wr1-x42c.google.com with SMTP id n4so17119095wrx.1;
 Sun, 21 Feb 2021 13:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1wIIiqxyo9qU4hDfl/CUSouFCDD9ilWz0hTE1uhI3Xc=;
 b=L5/0SZNGr+ao89CjY2sDmqb+0o8YfeHrn5C5zQG6mvxHIhVqZc0tJ0UH1DU6fYgyTD
 gv+VU0YRD82LqXBNpKDH0rTMpxXuZPVgv61DgV0lNa33q4+OHngUKHZwaPJcAmSTk1wy
 rtPP6VFKuPyw80xLmAL3/2shJVxsk0ZE8m8DyCTa9a3ywysCR0/j3NHIWDqvOvxceSvq
 GDeas9umFAXq7g31pVw9bUhYrMaKsHsWYK+bS/HU5LJHCW2TCr+ON+irsf+iJApBsYG0
 3BJYIu3hRYv4VqUPviybs7USngAQ4Fb2ih8RCWnv39+SNpBUrnB3pr8l0x6SfgnZr0jF
 2DbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1wIIiqxyo9qU4hDfl/CUSouFCDD9ilWz0hTE1uhI3Xc=;
 b=tsQPcn1tNF1Vbt/0gqpbZVsFTcwNvuWKZyJCcr2YzW7xvTKkYuV/fww36G8sIVwIba
 9wco8BW6j2uRAiBxqZoABi/iTHSMh6Sgqm/nxB8m3tDdomW54f8kapM9HRm2cyF8HuTp
 M1oVqn6J5cgBX5rmcLHjQXht51tfYI6k76FlyAKsSQqfUreokmhbPUy0j6gUqHdd1a10
 ljsYvx+BIdBjCoktR7AFw9seS8mLyYgk3fVCEvap9UZldOuM35tF9Ewm8Z6XoOqZ89mn
 Tt25K167xTxf1a1/mGP915pWHB09ILsl5Aqpx18euX/qZYDtVCL+Ll2NNYBP5ww9HYYf
 yXOg==
X-Gm-Message-State: AOAM5323Mf8fGyPpgJnhek/cKZSyubg6SfzZ3gcT+tdEYBHlmvM/L9jJ
 +yYbg7VJRHrv0PWrDxp08LwWl4ioP0I=
X-Google-Smtp-Source: ABdhPJyt+QIQf6QoRWsZ2y+Nik3FQ1LqyPUmEWEBMOJo+QGxJbFnVlC0bE3jJudoJPVJiSEWDehCGQ==
X-Received: by 2002:a05:6000:1565:: with SMTP id
 5mr19172769wrz.109.1613944763490; 
 Sun, 21 Feb 2021 13:59:23 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o13sm31414267wrs.45.2021.02.21.13.59.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 13:59:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/8] hw/sh4: Add missing license
Date: Sun, 21 Feb 2021 22:59:08 +0100
Message-Id: <20210221215915.2568943-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221215915.2568943-1-f4bug@amsat.org>
References: <20210221215915.2568943-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
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
 include/hw/sh4/sh.h | 12 +++++++++---
 hw/block/tc58128.c  |  7 +++++++
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/include/hw/sh4/sh.h b/include/hw/sh4/sh.h
index 93f464bf4cd..33dde7a56dd 100644
--- a/include/hw/sh4/sh.h
+++ b/include/hw/sh4/sh.h
@@ -1,6 +1,12 @@
-#ifndef QEMU_SH_H
-#define QEMU_SH_H
-/* Definitions for SH board emulation.  */
+/*
+ * Definitions for SH board emulation
+ *
+ * Copyright (c) 2005 Samuel Tardieu
+ *
+ * SPDX-License-Identifier: MIT
+ */
+#ifndef QEMU_HW_SH_H
+#define QEMU_HW_SH_H
 
 #include "hw/sh4/sh_intc.h"
 #include "target/sh4/cpu-qom.h"
diff --git a/hw/block/tc58128.c b/hw/block/tc58128.c
index 9888f01ac60..1a0fa86d8ea 100644
--- a/hw/block/tc58128.c
+++ b/hw/block/tc58128.c
@@ -1,3 +1,10 @@
+/*
+ * TC58128 NAND EEPROM emulation
+ *
+ * Copyright (c) 2005 Samuel Tardieu
+ *
+ * SPDX-License-Identifier: MIT
+ */
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "hw/sh4/sh.h"
-- 
2.26.2



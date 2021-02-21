Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA2A320D61
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 21:05:36 +0100 (CET)
Received: from localhost ([::1]:53396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDuz1-0005Qh-7A
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 15:05:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDuwY-0003h3-Ij; Sun, 21 Feb 2021 15:03:02 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:34517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDuwX-0007vq-2y; Sun, 21 Feb 2021 15:03:02 -0500
Received: by mail-wr1-x434.google.com with SMTP id n4so16951439wrx.1;
 Sun, 21 Feb 2021 12:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1wIIiqxyo9qU4hDfl/CUSouFCDD9ilWz0hTE1uhI3Xc=;
 b=UL89WnRY1mUaPrpRBnVEWxAnf4DdXhiiWLyE5PiuM540+sIxYUoPK70p4bn5AyciSz
 gmBxTngftTCfWB4OIGF47ZlKo3BqyL7H0Y1IBeZxJ7aQFcWgHX6XkoQo76wU31NwX4Ae
 w0z64GO4lLcjYp4/Pd/EPAD9pcw/evTA7nROHxm0265mDyttXPbp0b1tXb0pnkrbhL4P
 H0KXupOtxkKIXnLREZz40n2/0uw38DSRlThWHXrK+S49aE26EQ7TaGjz2h9BYyOZlHKJ
 vmKRpV64OAbdare6poiLt4ULkjym3rmBJ2ULAsWLJiZOq1U2Ze+4wr79qLSSSwzg/drR
 nKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1wIIiqxyo9qU4hDfl/CUSouFCDD9ilWz0hTE1uhI3Xc=;
 b=QyVSUBFBaHcsjB1qIuUDmeCTTsXvknATZKG2cR6MMS7YlKlL5RJNOPVyogliwPOHrW
 tR0gGbRTwcec5UcNAWaNj9OW9zUmMlyKcBefwnKSU3uzcaeazlJl5kZby6zI1iImR2ma
 mySiApF9SXGGtVagIDwFam3G6YGXGNs3X1YXIGBi8xHno8OBtKulvesM+XM/h17BEEZc
 xJ+saKlUJ8Z4WiIkhPdJrz5UwZrs2ty33DJfK7mecdbkppRpYgHxEQmrUsbg8vnkkQ13
 dxphlZ8tE+BvxNi1Til90grhhJjh2iHZxyXsGCJYX1hepdyNsQSVSpZhoUFYtgqPbAI4
 DXlA==
X-Gm-Message-State: AOAM5314LhOwhpvgz7Gv2ckdeTrx7fiAdWoxREkdePIevTLPs51x81ki
 9TPyx5RcSKsFqNS+DJpkuX3+1JG56ZY=
X-Google-Smtp-Source: ABdhPJx+DK7L8XXqmY+theD52Odt3JKpO29iyu85Sx/Nu/ldCCZ+EbQxsZxlcH8gY3EUmwMy+VfFWQ==
X-Received: by 2002:adf:8bd2:: with SMTP id w18mr18633661wra.204.1613937779256; 
 Sun, 21 Feb 2021 12:02:59 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id h13sm25961771wrv.20.2021.02.21.12.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 12:02:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/8] hw/sh4: Add missing license
Date: Sun, 21 Feb 2021 21:02:42 +0100
Message-Id: <20210221200249.2536247-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221200249.2536247-1-f4bug@amsat.org>
References: <20210221200249.2536247-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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



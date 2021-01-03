Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6BC2E8E40
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 22:03:18 +0100 (CET)
Received: from localhost ([::1]:38488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwAWz-0006ri-9q
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 16:03:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwALo-0003cx-Ml
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:51:46 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:45490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwALm-00064C-9x
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:51:43 -0500
Received: by mail-wr1-x432.google.com with SMTP id d26so29418080wrb.12
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 12:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xve8X86xXcoC12f53uFA7Uz4KW4E7YMQPcAROtru5iU=;
 b=tboObtwEmqfca8uUOaagHa9ySXd04fPtELMCod70NqlTmFeVCtCjS21yUDoz495x2h
 xvUPn7DLEIIt8JfJNhnnDP1DB3l4MXu8CLpQdEtiPbSOwYYdbrlg2hotqDz9tVOaCFJz
 WDDrjlKBGyweTZCh/9YKlBy7P+y2ui+vvuU3WFrumiLMCNpSCZvJ4/Qt7hBvh7Qr+kZh
 yPxWy2OZsVrcOZc6TduS7MVFZV0J98HiKTAEvCduaDi3rreC7yGX7Zome57wBr77EBKg
 tIuMiRsTzHJl4RRpt7aZhohyLtIBUyouc/KTlNluz3zNt84SpmpA9VdNGVldBGKvC4FH
 XBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xve8X86xXcoC12f53uFA7Uz4KW4E7YMQPcAROtru5iU=;
 b=LwGTTd+/n/DXjZXjnIVRDNNHU0C5s4AkbY6trW2MzYvDUIx+lL6wh2NtZnMOY8fY6d
 RcRaO1gxr2awV2MeQ9mOdVWfYmRS78NQDAfZk0c5uTZgJJ9kvR2k7f3+7RPiw1OWbJ5g
 UHbUZT/La/k53GB6/WfqZCeqP5d7M4r1rSUMhF6CDC//ZUb3d24lrb/z03YWlWtRk4rw
 SzesRIHOzIRvTDswjglTtor9h98jPSeFWTBA1RItBw6DLeLKg8z1ZWmsIj1fau3qpY/q
 5RKZxqxiketSsz74Xpnd99lqZhi8cT8YM1zO1Ji6YsFsa/pgQDU66PeVPWLWCnlASf/r
 0N4g==
X-Gm-Message-State: AOAM531zwUZK8VWQlHZK6sbF0tRoN1nlBJW2TyPqZNaNAQAhFxm7HmB8
 zl1ceNu3/laJKluBhsppzGfH7Ced4XQ=
X-Google-Smtp-Source: ABdhPJyqE+x3cdlkwXWbN9YVJ7kVef4L5n0Du3UGxgE0n0CPnwIhNocHTkxV8m3X6XHDvB99T1+Jqw==
X-Received: by 2002:adf:82c5:: with SMTP id 63mr77865759wrc.38.1609707100877; 
 Sun, 03 Jan 2021 12:51:40 -0800 (PST)
Received: from localhost.localdomain
 (194.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id g1sm46828125wrq.30.2021.01.03.12.51.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jan 2021 12:51:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/35] vt82c686: Remove unneeded includes and defines
Date: Sun,  3 Jan 2021 21:50:02 +0100
Message-Id: <20210103205021.2837760-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103205021.2837760-1-f4bug@amsat.org>
References: <20210103205021.2837760-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

These are not used or not needed.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <35cefcc3518a3395a796bb6ad6fbc308adc65266.1609584216.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/vt82c686.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index d7ce15bf9f3..02d6759c00b 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -16,9 +16,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/isa/isa.h"
 #include "hw/isa/superio.h"
-#include "hw/sysbus.h"
 #include "migration/vmstate.h"
-#include "hw/mips/mips.h"
 #include "hw/isa/apm.h"
 #include "hw/acpi/acpi.h"
 #include "hw/i2c/pm_smbus.h"
@@ -26,7 +24,6 @@
 #include "qemu/module.h"
 #include "qemu/timer.h"
 #include "exec/address-spaces.h"
-#include "qom/object.h"
 #include "trace.h"
 
 typedef struct SuperIOConfig {
@@ -136,8 +133,6 @@ static void vt82c686b_write_config(PCIDevice *d, uint32_t addr,
     }
 }
 
-#define ACPI_DBG_IO_ADDR  0xb044
-
 struct VT686PMState {
     PCIDevice dev;
     MemoryRegion io;
-- 
2.26.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DFF3AB313
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 13:55:34 +0200 (CEST)
Received: from localhost ([::1]:35084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltqcP-0008Np-D9
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 07:55:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltqae-0005sZ-QA
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 07:53:44 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:39579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltqad-00059J-4H
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 07:53:44 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso6182003wmh.4
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 04:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZVPBTnPyrwKkWmxUGbbjqq6/7nF/87IireIxXO+4BKk=;
 b=LjKqJr/Gn5U2aG2W28+I61UPkbkCxsSmxsOiA4ZmJd2xigzbRTp+cjiB2k9yAkMng/
 wwLaeFioIlkKA2iq9JWBQYBraHPpSErKhnol3cISq3511jgeyOwHcyl/t9kAR5vl6FzY
 2O3MmDTYHu5DoyW2IIvrJTWOqQAyqikbUtOPCIi8m1mXe6y4Uizwl2vaI2UK/WJPNARS
 Es3DQQO+YIfYYwa33XmrtoVZ2pOa3ECRILwo+cp/ODBIEMGvWyRIE66zTuii5PtJTBKE
 DT7iygSekm7rxrM1EpCdTU9TC8gJEhtTH0LJ2umbWW6JslEn4/aWVLKjrn030f9whrPM
 GXqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZVPBTnPyrwKkWmxUGbbjqq6/7nF/87IireIxXO+4BKk=;
 b=bmEq24S95m5crjClBY67H6j2/s3fjzysJU0gugIHtHH17xwpPYbcKKjp2BItYsZI2e
 zRTrXITewVMNJ5kO7aXDHZG45ZnhQALb5jPK/PENIdcq1M+BnGmSS4tAjqDwCp2EfSA3
 3oTtyA3SaWG2HUEnF7GNxQhx2rpC9cWlhTy4dTtfQU+mF4Gs/lxU1an6Ot5AWXOz2ct8
 rjuYgUwcHDYt048u0mrp7FErzV35Yc+/IYuoYBv1z7DmAEsXUcouZRWykD427gvp5YJi
 8sMTeRHm3/twfbwzPDact/2YRHZnW13QLO4biPBmyCYv2G5S9xhWeSMQ9GnjwIkSPNZQ
 /zMw==
X-Gm-Message-State: AOAM531YzkZi026PvLNAI6HuE1up9wsCBtOepUK21XIqOcPy1S4eAoQl
 mHlke3Yxzsn+o/3Cp6VmbNTBrlAHJYgI4g==
X-Google-Smtp-Source: ABdhPJwuPDAlf026IfCYpQKja/6oGbeY7MkU8rKOl/GRLB73dTT1z91F1TkatkBsJxaFsTaRRmqM2Q==
X-Received: by 2002:a1c:2142:: with SMTP id h63mr4686584wmh.84.1623930821248; 
 Thu, 17 Jun 2021 04:53:41 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id g23sm8399630wmk.3.2021.06.17.04.53.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 04:53:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 01/15] hw/input/lm832x: Move lm832x_key_event() declaration
 to "lm832x.h"
Date: Thu, 17 Jun 2021 13:53:20 +0200
Message-Id: <20210617115334.2761573-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617115334.2761573-1-f4bug@amsat.org>
References: <20210617115334.2761573-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

lm832x_key_event() is specific go LM832x devices, not to the
I2C bus API. Move it out of "i2c.h" to a new header.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Corey Minyard <cminyard@mvista.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/i2c/i2c.h      |  3 ---
 include/hw/input/lm832x.h | 26 ++++++++++++++++++++++++++
 hw/arm/nseries.c          |  1 +
 hw/input/lm832x.c         |  1 +
 MAINTAINERS               |  1 +
 5 files changed, 29 insertions(+), 3 deletions(-)
 create mode 100644 include/hw/input/lm832x.h

diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
index ff4129ea704..850815e707c 100644
--- a/include/hw/i2c/i2c.h
+++ b/include/hw/i2c/i2c.h
@@ -142,9 +142,6 @@ I2CSlave *i2c_slave_create_simple(I2CBus *bus, const char *name, uint8_t addr);
  */
 bool i2c_slave_realize_and_unref(I2CSlave *dev, I2CBus *bus, Error **errp);
 
-/* lm832x.c */
-void lm832x_key_event(DeviceState *dev, int key, int state);
-
 extern const VMStateDescription vmstate_i2c_slave;
 
 #define VMSTATE_I2C_SLAVE(_field, _state) {                          \
diff --git a/include/hw/input/lm832x.h b/include/hw/input/lm832x.h
new file mode 100644
index 00000000000..f47e579ff90
--- /dev/null
+++ b/include/hw/input/lm832x.h
@@ -0,0 +1,26 @@
+/*
+ * National Semiconductor LM8322/8323 GPIO keyboard & PWM chips.
+ *
+ * Copyright (C) 2008 Nokia Corporation
+ * Written by Andrzej Zaborowski <andrew@openedhand.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 or
+ * (at your option) version 3 of the License.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HW_INPUT_LM832X
+#define HW_INPUT_LM832X
+
+void lm832x_key_event(DeviceState *dev, int key, int state);
+
+#endif
diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index 0aefa5d0f3e..7b82b8682e8 100644
--- a/hw/arm/nseries.c
+++ b/hw/arm/nseries.c
@@ -34,6 +34,7 @@
 #include "hw/boards.h"
 #include "hw/i2c/i2c.h"
 #include "hw/display/blizzard.h"
+#include "hw/input/lm832x.h"
 #include "hw/input/tsc2xxx.h"
 #include "hw/misc/cbus.h"
 #include "hw/misc/tmp105.h"
diff --git a/hw/input/lm832x.c b/hw/input/lm832x.c
index 4cb1e9de01f..d2b92b457e3 100644
--- a/hw/input/lm832x.c
+++ b/hw/input/lm832x.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "hw/input/lm832x.h"
 #include "hw/i2c/i2c.h"
 #include "hw/irq.h"
 #include "migration/vmstate.h"
diff --git a/MAINTAINERS b/MAINTAINERS
index 636bf2f5365..c56bc112ccf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -792,6 +792,7 @@ F: hw/input/tsc2005.c
 F: hw/misc/cbus.c
 F: hw/rtc/twl92230.c
 F: include/hw/display/blizzard.h
+F: include/hw/input/lm832x.h
 F: include/hw/input/tsc2xxx.h
 F: include/hw/misc/cbus.h
 F: tests/acceptance/machine_arm_n8x0.py
-- 
2.31.1



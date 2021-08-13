Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9363B3EBECB
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Aug 2021 01:36:59 +0200 (CEST)
Received: from localhost ([::1]:40418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEgjS-0007Gj-KR
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 19:36:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3iwEXYQgKCvg1zmftyxmlttlqj.htrvjrz-ij0jqstslsz.twl@flex--wuhaotsh.bounces.google.com>)
 id 1mEghC-0003r0-LZ
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 19:34:38 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:34665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3iwEXYQgKCvg1zmftyxmlttlqj.htrvjrz-ij0jqstslsz.twl@flex--wuhaotsh.bounces.google.com>)
 id 1mEghA-0005yE-O3
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 19:34:38 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 o3-20020a2541030000b0290557cf3415f8so10780066yba.1
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 16:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=zotOGY5mCWDvi55cIML59RymW1qDG9/l/FD5nyqmbOE=;
 b=oaBPTEcRODCBAtYSDeJrFhsDJakNaD8ryEIbacfnnXjwJHuI4pLwUmrpp4Br9dHNzf
 ZFScFPHeM8PwzP5KQ8tIi7/VeZH9tpsCFjQiVd2wAAy767IL4CQaSMqb83B/eCpfyki+
 lrr91JxyVhozWjeRs7Qe2iZ5n0flNH7iBxwMJQyTSEPnVfmbrmPyOxEtdDDvyYiiXMne
 7ccWzOYWtquLdwKuEM7+ikzVC2GvxlGKYkQJEAbyCeO00Or4ZkE3HSoBJZshn300Aug8
 9e+uPKdUuZ1aOF+pI2NqhOHg7buFZhiMkUPiKNdXzrJmLNT5ItgEZafsZQrghe7sl3Gn
 0OTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=zotOGY5mCWDvi55cIML59RymW1qDG9/l/FD5nyqmbOE=;
 b=bhTUQdx18H7bXJMXPQJLcI3WjUY5ek9GpCPpcaJ35UvDwMoi0JVTvcNPTEDxJ5ggHH
 +KUG9ie9NunevTt2d+zZsMXAZVEgoKse1j1t5mkb5aY7r0d7V9YAo2VhUcuhhpS3/ygD
 SDogUDCSyLNBeXs4CNIBcBb/5vDJwAohVRFzhbXMSJ6gJW9wtP8cu1phJzgfHzLR5yow
 qlMk/l/qSEHPet5gvhh30rej5JMAbzs23xF7qnUjPRUH4kICGEAvSLatT+oXkVepgI6g
 iSynlF5jPmPuejoWaeHM/21bX1ZS8hyq9Fi4xiCd4B1AiC7BxuglwiRUImlv/kacC1Ip
 O/Lg==
X-Gm-Message-State: AOAM532iewUp4ORybRJUfX1hQcVX1jix2kKmpmMZdyLBUoLMBWExl0HV
 ZRXXhyzcMjEABj/Vrrft3m0IN35bGViykw==
X-Google-Smtp-Source: ABdhPJyOvjD6cl3bKRLtt3O8o4gG/fgJ4vggCr3pOnh/3jDkLGY1RnBK+oIQ3c3qh6liOcjFfxEuyBu2y9I2kg==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a25:4907:: with SMTP id
 w7mr6192977yba.393.1628897675406; Fri, 13 Aug 2021 16:34:35 -0700 (PDT)
Date: Fri, 13 Aug 2021 16:33:51 -0700
In-Reply-To: <20210813233353.2099459-1-wuhaotsh@google.com>
Message-Id: <20210813233353.2099459-6-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210813233353.2099459-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
Subject: [PATCH 5/7] hw/nvram: Add a new auxiliary function to init at24c
 eeprom
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, minyard@acm.org, 
 wuhaotsh@google.com, titusr@google.com, venture@google.com, 
 Avi.Fishman@nuvoton.com, kfting@nuvoton.com, hskinnemoen@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3iwEXYQgKCvg1zmftyxmlttlqj.htrvjrz-ij0jqstslsz.twl@flex--wuhaotsh.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In NPCM7xx boards, at24c eeproms are backed by drives. However,
these drives use unit number as unique identifier. So if we
specify two drives with the same unit number, error will occured:
`Device with id 'none85' exists`.

Instead of using i2c address as unit number, we now assign unique
unit numbers for each eeproms in each board. This avoids conflict
in providing multiple eeprom contents with the same address.

We add an auxiliary function in the at24c eeprom module for this.
This allows it to easily add at24c eeprom to non-nuvoton boards
like aspeed as well.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Patrick Venture<venture@google.com>
---
 hw/nvram/eeprom_at24c.c         | 18 ++++++++++++++++++
 include/hw/nvram/eeprom_at24c.h | 13 +++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 include/hw/nvram/eeprom_at24c.h

diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
index af6f5dbb99..a9e3702b00 100644
--- a/hw/nvram/eeprom_at24c.c
+++ b/hw/nvram/eeprom_at24c.c
@@ -12,9 +12,11 @@
 #include "qapi/error.h"
 #include "qemu/module.h"
 #include "hw/i2c/i2c.h"
+#include "hw/nvram/eeprom_at24c.h"
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
 #include "sysemu/block-backend.h"
+#include "sysemu/blockdev.h"
 #include "qom/object.h"
 
 /* #define DEBUG_AT24C */
@@ -205,3 +207,19 @@ static void at24c_eeprom_register(void)
 }
 
 type_init(at24c_eeprom_register)
+
+void at24c_eeprom_init_one(I2CBus *i2c_bus, int bus, uint8_t addr,
+                           uint32_t rsize, int unit_number)
+{
+    I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
+    DeviceState *dev = DEVICE(i2c_dev);
+    BlockInterfaceType type = IF_NONE;
+    DriveInfo *dinfo;
+
+    dinfo = drive_get(type, bus, unit_number);
+    if (dinfo) {
+        qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo));
+    }
+    qdev_prop_set_uint32(dev, "rom-size", rsize);
+    i2c_slave_realize_and_unref(i2c_dev, i2c_bus, &error_abort);
+}
diff --git a/include/hw/nvram/eeprom_at24c.h b/include/hw/nvram/eeprom_at24c.h
new file mode 100644
index 0000000000..b649557a07
--- /dev/null
+++ b/include/hw/nvram/eeprom_at24c.h
@@ -0,0 +1,13 @@
+/*
+ * *AT24C* series I2C EEPROM
+ *
+ * Copyright (c) 2015 Michael Davidsaver
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the LICENSE file in the top-level directory.
+ */
+
+/* Init one at24c eeprom device */
+void at24c_eeprom_init_one(I2CBus *i2c_bus, int bus, uint8_t addr,
+                           uint32_t rsize, int unit_number);
+
-- 
2.33.0.rc1.237.g0d66db33f3-goog



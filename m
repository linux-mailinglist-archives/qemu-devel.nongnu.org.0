Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3726D14A4
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 03:05:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pi39M-0003ER-NH; Thu, 30 Mar 2023 21:01:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3-jAmZAcKCh0DHFEH6B9HH9E7.5HFJ7FN-67O7EGHG9GN.HK9@flex--komlodi.bounces.google.com>)
 id 1pi39K-0003Dx-2V
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 21:01:50 -0400
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3-jAmZAcKCh0DHFEH6B9HH9E7.5HFJ7FN-67O7EGHG9GN.HK9@flex--komlodi.bounces.google.com>)
 id 1pi39I-0006bM-Ec
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 21:01:49 -0400
Received: by mail-pf1-x449.google.com with SMTP id
 t67-20020a628146000000b0062d6d838243so7217422pfd.21
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 18:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680224506;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=29sNXL7y+2uWwg7caIe+EWdFRWQP6+Wn+OUoGeGi/Jo=;
 b=BQBJOsKAqmaZMy/H8CVuvp8K345fALxhpgKndYJnHu+gN6OyiZ/hooYEL25bFos2in
 BLTyqBHadQPf3C8hkjHYXtlIlt7NtCBxRUlTjCCAyjF/r52ORv4rChfXFtC6+9AC7x+e
 H6f6FnV0NBGpBNNXemQ7fGttzpvdyiuw3wOU2IfrcLfArZQ6ZEtbFFe4dWpz1XC6iE+b
 KpjwYZkbKV4lQOSR7+jNXfm99VPCAgzVehzGhtqeImAki+7y4UX6SMZBMKTGynRGGo41
 34CFfM2dW3d9sV+80cglf3SHDHmShREA2JhMTfKkI8A0PZ4A+UY0rfJbS7eMmSdCIeT+
 XRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680224506;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=29sNXL7y+2uWwg7caIe+EWdFRWQP6+Wn+OUoGeGi/Jo=;
 b=B3QiZ/53T6AgGzKOhr2l4zeG93MXfpn9X8eqtT8h98YGWNeKYkgCQXcxtLGzxQtiUQ
 8EqoaAdbRFNxg1ZdF+4n4/EjOMn5ckK6Wky4h0wSE32tff/0dJrU4yk/kz8IchfyO275
 EHQ54SohjVOEBh/nq6ok/4ONI2YqvmWK0PX0DvJtKCS9CKDQkimkZwbss+r3r2Jsr1AK
 HNKg7AE4Fg1BN9Rom5UpZqBNaiZ8hprSo594DyFqMpHcsebFQrd10+3v73sBRqG5+e1b
 l0n+OEr/MKzkAOljAvDN64Yb75advjf0+PzoZEQjVjWStgOBNhE1yw9behOrHopCku7D
 iiCw==
X-Gm-Message-State: AAQBX9cbkUe8OIIqskGe/5en8FSdXXQPxERfbXsCZqtF0FtI+YUECVR4
 +YpOUfHre6TXCyPmVWigbmLTxGMfytzGFqxcs9GSGfo4XCRXh7tAfNPonjJd6opNYoNDyFnGV58
 9pglV+5bvpYEgxEG5AHBFK/BmmBJ3IEwINJLChsEfO6Hc9tVJqZbdKkM7aCz5xd8=
X-Google-Smtp-Source: AKy350bC7AGRTuZZVaUgsxb2zrhDmW18HzVKUMBZlmJP/GqsNuzGlk9VGxwhlCBwiquvjVrj4OQAzQGSjgts
X-Received: from komlodi.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:35ee])
 (user=komlodi job=sendgmr) by 2002:a63:e104:0:b0:507:3e33:4390 with SMTP id
 z4-20020a63e104000000b005073e334390mr2391965pgh.6.1680224506532; Thu, 30 Mar
 2023 18:01:46 -0700 (PDT)
Date: Fri, 31 Mar 2023 01:01:23 +0000
In-Reply-To: <20230331010131.1412571-1-komlodi@google.com>
Mime-Version: 1.0
References: <20230331010131.1412571-1-komlodi@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230331010131.1412571-9-komlodi@google.com>
Subject: [PATCH 08/16] hw/i3c/aspeed_i3c: Add IRQ MMIO behavior
From: Joe Komlodi <komlodi@google.com>
To: qemu-devel@nongnu.org
Cc: venture@google.com, komlodi@google.com, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::449;
 envelope-from=3-jAmZAcKCh0DHFEH6B9HH9E7.5HFJ7FN-67O7EGHG9GN.HK9@flex--komlodi.bounces.google.com;
 helo=mail-pf1-x449.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Joe Komlodi <komlodi@google.com>

Reviewed-by: Patrick Venture <venture@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 hw/i3c/aspeed_i3c.c | 57 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/hw/i3c/aspeed_i3c.c b/hw/i3c/aspeed_i3c.c
index 2ed09234ff..b9aa1367d8 100644
--- a/hw/i3c/aspeed_i3c.c
+++ b/hw/i3c/aspeed_i3c.c
@@ -17,6 +17,8 @@
 #include "qapi/error.h"
 #include "migration/vmstate.h"
 #include "trace.h"
+#include "hw/i3c/i3c.h"
+#include "hw/irq.h"
 
 /* I3C Controller Registers */
 REG32(I3C1_REG0, 0x10)
@@ -412,6 +414,46 @@ static const uint32_t ast2600_i3c_device_ro[ASPEED_I3C_DEVICE_NR_REGS] = {
     [R_SLAVE_CONFIG]                = 0xffffffff,
 };
 
+static void aspeed_i3c_device_update_irq(AspeedI3CDevice *s)
+{
+    bool level = !!(s->regs[R_INTR_SIGNAL_EN] & s->regs[R_INTR_STATUS]);
+    qemu_set_irq(s->irq, level);
+}
+
+static uint32_t aspeed_i3c_device_intr_status_r(AspeedI3CDevice *s)
+{
+    /* Only return the status whose corresponding EN bits are set. */
+    return s->regs[R_INTR_STATUS] & s->regs[R_INTR_STATUS_EN];
+}
+
+static void aspeed_i3c_device_intr_status_w(AspeedI3CDevice *s, uint32_t val)
+{
+    /* INTR_STATUS[13:5] is w1c, other bits are RO. */
+    val &= 0x3fe0;
+    s->regs[R_INTR_STATUS] &= ~val;
+
+    aspeed_i3c_device_update_irq(s);
+}
+
+static void aspeed_i3c_device_intr_status_en_w(AspeedI3CDevice *s, uint32_t val)
+{
+    s->regs[R_INTR_STATUS_EN] = val;
+    aspeed_i3c_device_update_irq(s);
+}
+
+static void aspeed_i3c_device_intr_signal_en_w(AspeedI3CDevice *s, uint32_t val)
+{
+    s->regs[R_INTR_SIGNAL_EN] = val;
+    aspeed_i3c_device_update_irq(s);
+}
+
+static void aspeed_i3c_device_intr_force_w(AspeedI3CDevice *s, uint32_t val)
+{
+    /* INTR_FORCE is WO, just set the corresponding INTR_STATUS bits. */
+    s->regs[R_INTR_STATUS] = val;
+    aspeed_i3c_device_update_irq(s);
+}
+
 static uint64_t aspeed_i3c_device_read(void *opaque, hwaddr offset,
                                        unsigned size)
 {
@@ -426,6 +468,9 @@ static uint64_t aspeed_i3c_device_read(void *opaque, hwaddr offset,
     case R_INTR_FORCE:
         value = 0;
         break;
+    case R_INTR_STATUS:
+        value = aspeed_i3c_device_intr_status_r(s);
+        break;
     default:
         value = s->regs[addr];
         break;
@@ -470,6 +515,18 @@ static void aspeed_i3c_device_write(void *opaque, hwaddr offset,
         break;
     case R_RESET_CTRL:
         break;
+    case R_INTR_STATUS:
+        aspeed_i3c_device_intr_status_w(s, val32);
+        break;
+    case R_INTR_STATUS_EN:
+        aspeed_i3c_device_intr_status_en_w(s, val32);
+        break;
+    case R_INTR_SIGNAL_EN:
+        aspeed_i3c_device_intr_signal_en_w(s, val32);
+        break;
+    case R_INTR_FORCE:
+        aspeed_i3c_device_intr_force_w(s, val32);
+        break;
     default:
         s->regs[addr] = val32;
         break;
-- 
2.40.0.348.gf938b09366-goog



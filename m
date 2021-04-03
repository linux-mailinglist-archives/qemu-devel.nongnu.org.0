Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E393535AA
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Apr 2021 00:29:48 +0200 (CEST)
Received: from localhost ([::1]:45464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSom3-0005RV-3G
	for lists+qemu-devel@lfdr.de; Sat, 03 Apr 2021 18:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3C-xoYAcKCpAFy7DEBy08805y.w86Ay6E-xyFy578707E.8B0@flex--venture.bounces.google.com>)
 id 1lSokx-0004WV-1J
 for qemu-devel@nongnu.org; Sat, 03 Apr 2021 18:28:42 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:48853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3C-xoYAcKCpAFy7DEBy08805y.w86Ay6E-xyFy578707E.8B0@flex--venture.bounces.google.com>)
 id 1lSokn-0002pD-Aa
 for qemu-devel@nongnu.org; Sat, 03 Apr 2021 18:28:34 -0400
Received: by mail-yb1-xb49.google.com with SMTP id d1so12995762ybj.15
 for <qemu-devel@nongnu.org>; Sat, 03 Apr 2021 15:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=T5YtRkRKUUIOvoZmqL262NcISbGPOODubGnB2CtWpAQ=;
 b=EI1a+iI7jyULXMrxo+kTtXgWo9gNO8ityODs5UgbjMSa5NClRfyU18fWCeQ3Y4kDiw
 QN0eaxm2gjt/ZSR388Zk/UdDSnZRm9iSEO1iKinhI61DbnP6LSjaMgR7gDpTfzy7TfTG
 MsmOUkO1EzTE6C31S8h4D0ACzRmvphnTZ7NJNByQV48T5eW73rRjV2Boz9CY0GgyywxV
 fkNFhtPDmegDkO1+c3Kj4EJZQk+djo3lxATmVoJ9By8IkruUHbbEdMA80rfCKUOpC+8T
 ZHITpdMBkDVqTGoInKfrIHwPC1Jz3gIfiV/p6nkxXeIzozcI3XDC3gb/fM+ip2XUIml2
 yBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=T5YtRkRKUUIOvoZmqL262NcISbGPOODubGnB2CtWpAQ=;
 b=Ie7mGEHYFppndQkQHi4YfBp9BedMsRdS8Y7cNOYbKaUL+qkDp+RkRTVLLK3kOMFcuQ
 GZpDGXjIzzPnqFh53KTerqqJaM0mIN/xefJLeDj2atawyLdrhVqJQpPJJm0U7wtWpwdL
 b6dmzeazmPea1VOFhWsIxBtoHKb4tE2apWbNZS4q8H1vDbUwXvnLKnI2LSQ1Gb2YLqPM
 OEt+j33CYFXLLS9ocm+d5uJHaz9JCXc2S3i86EIoGQrOIXylcMdv0FNNQl4qW/irIv2u
 nb2Uf9tKDnmgfAz57g946+7ZoeBcPfc00Gq628/VoM0JNvo/GRxX5WFhC7GyQEFFeBDB
 PLIA==
X-Gm-Message-State: AOAM533Klzej0Dc1ZzxINma6ZkyY/lo+xmFYBftjPT20LZ4DzdtJQEQZ
 mWKGBtPmkBxWHCbTdFZfuAkuR1dnY6yD
X-Google-Smtp-Source: ABdhPJyHyXOTrSr939Tw9t5NhVRSIeYTikJIU7ILxZKHOG8pG4+aNYMZj4FUTQGiqNSwtJUOK5xVgEh2EoA+
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:bcbb:2e0c:25df:d735])
 (user=venture job=sendgmr) by 2002:a25:db42:: with SMTP id
 g63mr27328821ybf.404.1617488907285; Sat, 03 Apr 2021 15:28:27 -0700 (PDT)
Date: Sat,  3 Apr 2021 15:28:09 -0700
In-Reply-To: <20210403222810.3481372-1-venture@google.com>
Message-Id: <20210403222810.3481372-2-venture@google.com>
Mime-Version: 1.0
References: <20210403222810.3481372-1-venture@google.com>
X-Mailer: git-send-email 2.31.0.208.g409f899ff0-goog
Subject: [PATCH 1/2] hw/i2c/core: add reachable state boolean
From: Patrick Venture <venture@google.com>
To: cminyard@mvista.com, wuhaotsh@google.com, hskinnemoen@google.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3C-xoYAcKCpAFy7DEBy08805y.w86Ay6E-xyFy578707E.8B0@flex--venture.bounces.google.com;
 helo=mail-yb1-xb49.google.com
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

An i2c device can be reachable or not, controlled by some external
factor.  This field is leveraged by an i2c mux which presents the
devices on the parent bus when the associated channel is enabled and
otherwise not.

Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 hw/i2c/core.c        | 6 ++++++
 include/hw/i2c/i2c.h | 3 +++
 2 files changed, 9 insertions(+)

diff --git a/hw/i2c/core.c b/hw/i2c/core.c
index 21ec52ac5a..fa7db4549d 100644
--- a/hw/i2c/core.c
+++ b/hw/i2c/core.c
@@ -18,6 +18,7 @@
 #define I2C_BROADCAST 0x00
 
 static Property i2c_props[] = {
+    DEFINE_PROP_BOOL("reachable", struct I2CSlave, reachable, true),
     DEFINE_PROP_UINT8("address", struct I2CSlave, address, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
@@ -118,6 +119,9 @@ int i2c_start_transfer(I2CBus *bus, uint8_t address, int recv)
         QTAILQ_FOREACH(kid, &bus->qbus.children, sibling) {
             DeviceState *qdev = kid->child;
             I2CSlave *candidate = I2C_SLAVE(qdev);
+            if (!candidate->reachable) {
+                continue;
+            }
             if ((candidate->address == address) || (bus->broadcast)) {
                 node = g_malloc(sizeof(struct I2CNode));
                 node->elt = candidate;
@@ -262,6 +266,7 @@ const VMStateDescription vmstate_i2c_slave = {
     .minimum_version_id = 1,
     .post_load = i2c_slave_post_load,
     .fields = (VMStateField[]) {
+        VMSTATE_BOOL(reachable, I2CSlave),
         VMSTATE_UINT8(address, I2CSlave),
         VMSTATE_END_OF_LIST()
     }
@@ -272,6 +277,7 @@ I2CSlave *i2c_slave_new(const char *name, uint8_t addr)
     DeviceState *dev;
 
     dev = qdev_new(name);
+    qdev_prop_set_bit(dev, "reachable", true);
     qdev_prop_set_uint8(dev, "address", addr);
     return I2C_SLAVE(dev);
 }
diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
index 277dd9f2d6..e5ca15e486 100644
--- a/include/hw/i2c/i2c.h
+++ b/include/hw/i2c/i2c.h
@@ -44,6 +44,9 @@ struct I2CSlaveClass {
 struct I2CSlave {
     DeviceState qdev;
 
+    /* Whether the i2c child device is reachable from this bus. */
+    bool reachable;
+
     /* Remaining fields for internal use by the I2C code.  */
     uint8_t address;
 };
-- 
2.31.0.208.g409f899ff0-goog



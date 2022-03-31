Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E83C74ED2FB
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 06:42:30 +0200 (CEST)
Received: from localhost ([::1]:43428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZmdi-0002br-1v
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 00:42:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <39C5FYgcKCn8nrporgljrrjoh.frpthpx-ghyhoqrqjqx.ruj@flex--komlodi.bounces.google.com>)
 id 1nZmaP-0006q8-6b
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 00:39:05 -0400
Received: from [2607:f8b0:4864:20::54a] (port=44930
 helo=mail-pg1-x54a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <39C5FYgcKCn8nrporgljrrjoh.frpthpx-ghyhoqrqjqx.ruj@flex--komlodi.bounces.google.com>)
 id 1nZmaN-0002ZE-In
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 00:39:04 -0400
Received: by mail-pg1-x54a.google.com with SMTP id
 p9-20020a63f449000000b0035ec8c16f0bso3514827pgk.11
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 21:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=c1v6AeYJ4nUgS8LTP98DKz2BvMXVuqxPln0naoeiAzI=;
 b=Ek/nHeUKcT/pkHBa3K4QriNUTn6Fag++yEbdQcV5H4YxhTGyX/5OGWQP6+jON9ZXoh
 4EFFjvOIcuN/Hb47KM0AmC2Iw/u4ZqT3hKqeiWjEV2TxWoGaqomte3FxVxP0O8piBxZP
 3NwJZZIE0rEFtBTFTLquSMHhxytNmc626sczU30K/3tZFt4AHL/1mKIcg0S7hg1KokRO
 viabSDK3sh4J+5GsL5JU7ZyU+TZkh3zanrgjmvUBm9QChzjr8dyM/UrjPTjIyCEpIsd3
 eSg0fw93j/Fnfvxuh5UKolv/TYhIy5ELHBcDYxpTINfzhPjWI4vE56gxEzlrK3WYoOMR
 EvQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=c1v6AeYJ4nUgS8LTP98DKz2BvMXVuqxPln0naoeiAzI=;
 b=kp/0SwRAIKnX5SfPfaXjbgA1p1wFin8ysaxiIw5+JRo6EDGpbHAQmB3AZb8hLgA/x6
 rV5x67n4+Gbe0gGqLsdl0IVkXkNVyQ4EkTV3y97x65kxzi7EFwJis2FC+PKn6K2skt3R
 4TLN9jRBw5ueyzmfxVW2QbprJDKNlxQnlv3kdz166IlafWkr4OTJwd9jAJhacnyfhN53
 +zq22ZRwP1DRY1RIG0UavM9NSG3Ivw9m7DjRaOBGwmew1xr6zZb9j4ANNKfhf5CX2he5
 egXdvm4aiHeEot0p+Ktv8Kidw0DG2poFDzxDltc1IIwYEGZbirS6M09OtSAOLe+oRISo
 hRvg==
X-Gm-Message-State: AOAM530jCe90Oh9gb3JLxjdIdveNcTs6W2gqzYjwl0N1s7/JPqR6O59I
 l74XWZL+L5H5R6ZnIGPH0zVlAid2tD6F4be2cKmBDvhQFY8m9qmJjOSB+miPzaynXUO2ResK3b2
 rsEgsuhJx1oL2eE/WsAgSIFvY9Gh/cBubIMLhqR9qaEBtOKxIyxaX8GO1t+Ri+A8=
X-Google-Smtp-Source: ABdhPJwpIeAvDd70Mce8PVkxyZRf4H4LQi7kWJ3iYIVrwSTAyQwse2bwN/Z/SpGLBG2jKcdHuulIsSD1IZmP
X-Received: from komlodi.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:35ee])
 (user=komlodi job=sendgmr) by 2002:aa7:8215:0:b0:4f7:125a:c88c with SMTP id
 k21-20020aa78215000000b004f7125ac88cmr3462612pfi.70.1648701172458; Wed, 30
 Mar 2022 21:32:52 -0700 (PDT)
Date: Thu, 31 Mar 2022 04:32:43 +0000
In-Reply-To: <20220331043248.2237838-1-komlodi@google.com>
Message-Id: <20220331043248.2237838-3-komlodi@google.com>
Mime-Version: 1.0
References: <20220331043248.2237838-1-komlodi@google.com>
X-Mailer: git-send-email 2.35.1.1021.g381101b075-goog
Subject: [RFC PATCH 2/7] aspeed: i2c: Add ctrl_global_rsvd property
From: Joe Komlodi <komlodi@google.com>
To: qemu-devel@nongnu.org
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au, 
 venture@google.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::54a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=39C5FYgcKCn8nrporgljrrjoh.frpthpx-ghyhoqrqjqx.ruj@flex--komlodi.bounces.google.com;
 helo=mail-pg1-x54a.google.com
X-Spam_score_int: -81
X-Spam_score: -8.2
X-Spam_bar: --------
X-Spam_report: (-8.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Aspeed I2C controller is used across other SKUs that have different
reserved bits for the ctrl_global_rsvd register.

Signed-off-by: Joe Komlodi <komlodi@google.com>
Change-Id: I606c5933c527274a9d2b0afe559b2e895767636c
---
 hw/arm/aspeed_ast2600.c     | 2 ++
 hw/i2c/aspeed_i2c.c         | 4 ++++
 include/hw/i2c/aspeed_i2c.h | 2 ++
 3 files changed, 8 insertions(+)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 43f8223139..9f14a35a75 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -344,6 +344,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
                    serial_hd(0), DEVICE_LITTLE_ENDIAN);
 
     /* I2C */
+    object_property_set_int(OBJECT(&s->i2c), "ctrl-global-rsvd", 0xfffc3e00,
+                            &error_abort);
     object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr),
                              &error_abort);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->i2c), errp)) {
diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 03a4f5a910..97eb9d5792 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -648,6 +648,7 @@ static void aspeed_i2c_ctrl_write(void *opaque, hwaddr offset,
 
     switch (offset) {
     case I2C_CTRL_GLOBAL:
+        value &= ~s->ctrl_global_rsvd;
         s->ctrl_global = value;
         break;
     case I2C_CTRL_STATUS:
@@ -730,6 +731,7 @@ static const VMStateDescription aspeed_i2c_vmstate = {
     .minimum_version_id = 2,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(intr_status, AspeedI2CState),
+        VMSTATE_UINT32(ctrl_global_rsvd, AspeedI2CState),
         VMSTATE_STRUCT_ARRAY(busses, AspeedI2CState,
                              ASPEED_I2C_NR_BUSSES, 1, aspeed_i2c_bus_vmstate,
                              AspeedI2CBus),
@@ -828,6 +830,8 @@ static void aspeed_i2c_realize(DeviceState *dev, Error **errp)
 static Property aspeed_i2c_properties[] = {
     DEFINE_PROP_LINK("dram", AspeedI2CState, dram_mr,
                      TYPE_MEMORY_REGION, MemoryRegion *),
+    DEFINE_PROP_UINT32("ctrl-global-rsvd", AspeedI2CState, ctrl_global_rsvd,
+                       0xfffffffe),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
index 4b9be09274..3912fcc3ff 100644
--- a/include/hw/i2c/aspeed_i2c.h
+++ b/include/hw/i2c/aspeed_i2c.h
@@ -71,6 +71,8 @@ struct AspeedI2CState {
     MemoryRegion pool_iomem;
     uint8_t pool[ASPEED_I2C_MAX_POOL_SIZE];
 
+    uint32_t ctrl_global_rsvd;
+
     AspeedI2CBus busses[ASPEED_I2C_NR_BUSSES];
     MemoryRegion *dram_mr;
     AddressSpace dram_as;
-- 
2.35.1.1021.g381101b075-goog



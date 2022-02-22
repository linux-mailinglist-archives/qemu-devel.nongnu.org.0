Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 189B04C0264
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 20:50:41 +0100 (CET)
Received: from localhost ([::1]:53534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMbBI-0006nF-5o
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 14:50:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMaw9-0003KA-NA
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:35:03 -0500
Received: from [2a00:1450:4864:20::62b] (port=46943
 helo=mail-ej1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMaw7-0006qW-Oc
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:35:01 -0500
Received: by mail-ej1-x62b.google.com with SMTP id qx21so45965009ejb.13
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 11:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NSkH+rZ7LIEEh7cIevAxKcBEWeFcCPnBblGfAJiA4f4=;
 b=nYl/o2iyEuQGBlrJTGT9d8EK/cjnRcuQod1VLAwuHmy5I4d9sCqdD0lTwMHcRjXfO0
 czbb+QFrCgH1xzr4tMiRO8uTdW+h3kr4bOd0hJrhP6nAL7YeNpc1+qveOLTo2pZHeHmu
 LBo71KaB5u+aULMSOjIJjE3o0TTIpCq0E7713dm58JgeLSikTgPQYCk3iXLmPNGoOLOF
 k+UXpD3lKjxcFvrYZJH+7JGkPb3ipVfJSrU8PzBYjMIVJRQwbF57AzmNleYFEyOWvdXf
 uzMyZdBzEe8ejl1OPSGTSqmUl/PyHBzhVMHAxEY+wUfmi9w66euP8NfclYGn76PKykgy
 KUGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NSkH+rZ7LIEEh7cIevAxKcBEWeFcCPnBblGfAJiA4f4=;
 b=yWtdyiktEZjDjrnLR1wf/k1ZeJKqL8OhUjFoyFyGDElH1BZ6wPQQqWxR3bLw9ZozB0
 KU38KrBVH58DHsNbz08PvSDZ+Icq+GUFx8ZHCcPbJrESDpAqj1SyXqhIAUApoGOEDRlm
 hAmhsMgZUwLkRTtuZHecmrlc99iEpX4CV0y/u9J6jRLUtAZTB+fakR9/ke+5E1uNDyLI
 tAm/O7LxnMQCacZHfOvxcUgY8C6icAymDHdvPhcLokw2GqE2S7tOp3yN/G4JaiNYg1bn
 4xRU6UaunQUKNVehWGcp+IlaE9ucc4JQanUtLYLlPD0ODAHSF52b3LwzwK+9wo22mxyL
 bKmw==
X-Gm-Message-State: AOAM5333uiQxEhR/yifRa1Q0C6Q8tFe1aT1KJtFY747aZo7sYdhxN3bx
 nj3n8Bxh1bxxtXtwn2HNhV6TbUqudtw=
X-Google-Smtp-Source: ABdhPJwYLWqVnrq9jcPvD4VCJETVS++WNedlUmGm5VYQNvXqgyg2iA1i3Y+bRCDiSSKFnLDEnpIm8A==
X-Received: by 2002:a17:906:95d5:b0:6b3:2e97:25ab with SMTP id
 n21-20020a17090695d500b006b32e9725abmr20892951ejy.322.1645558498348; 
 Tue, 22 Feb 2022 11:34:58 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-089-012-227-088.89.12.pool.telefonica.de. [89.12.227.88])
 by smtp.gmail.com with ESMTPSA id i1sm766532edj.84.2022.02.22.11.34.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 11:34:57 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/22] isa: Drop unused attributes from ISADevice
Date: Tue, 22 Feb 2022 20:34:30 +0100
Message-Id: <20220222193446.156717-7-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222193446.156717-1-shentey@gmail.com>
References: <20220222193446.156717-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Bernhard Beschow <shentey@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that the last users of ISADevice::isairq[] have been resolved during the
previous commits, it can be removed for good.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/isa-bus.c     | 13 -------------
 include/hw/isa/isa.h |  2 --
 2 files changed, 15 deletions(-)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index af5add6a26..c64a14120b 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -87,11 +87,7 @@ qemu_irq isa_get_irq(ISADevice *dev, unsigned isairq)
 
 void isa_init_irq(ISADevice *dev, qemu_irq *p, unsigned isairq)
 {
-    assert(dev->nirqs < ARRAY_SIZE(dev->isairq));
-    assert(isairq < ISA_NUM_IRQS);
-    dev->isairq[dev->nirqs] = isairq;
     *p = isa_get_irq(dev, isairq);
-    dev->nirqs++;
 }
 
 void isa_connect_gpio_out(ISADevice *isadev, int gpioirq, unsigned isairq)
@@ -150,14 +146,6 @@ int isa_register_portio_list(ISADevice *dev,
     return 0;
 }
 
-static void isa_device_init(Object *obj)
-{
-    ISADevice *dev = ISA_DEVICE(obj);
-
-    dev->isairq[0] = -1;
-    dev->isairq[1] = -1;
-}
-
 ISADevice *isa_new(const char *name)
 {
     return ISA_DEVICE(qdev_new(name));
@@ -244,7 +232,6 @@ static const TypeInfo isa_device_type_info = {
     .name = TYPE_ISA_DEVICE,
     .parent = TYPE_DEVICE,
     .instance_size = sizeof(ISADevice),
-    .instance_init = isa_device_init,
     .abstract = true,
     .class_size = sizeof(ISADeviceClass),
     .class_init = isa_device_class_init,
diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index d4417b34b6..d80cab5b79 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -83,8 +83,6 @@ struct ISADevice {
     DeviceState parent_obj;
     /*< public >*/
 
-    int8_t isairq[2];      /* -1 = unassigned */
-    int nirqs;
     int ioport_id;
 };
 
-- 
2.35.1



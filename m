Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4084CFBDE
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:49:35 +0100 (CET)
Received: from localhost ([::1]:60948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRAvn-0000QU-1n
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:49:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRAMh-0004rv-Q0
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:13:20 -0500
Received: from [2a00:1450:4864:20::430] (port=44596
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRAMg-0004PT-9d
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:13:19 -0500
Received: by mail-wr1-x430.google.com with SMTP id u1so22336587wrg.11
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cJh4PYyUI6xHySX36hONClAaQmYIjo+6gw5rU4C8imM=;
 b=k5oeEjoo24eXvS4XM+EhxIOQaiwwcyBDR/C6JspQJ3ZL03rK3wPvMsToBZzAbaYpZz
 is+65AQvdyrwgXujw4oxxutU0+xfmdYCmlo1jZl/NqjOEY0rl2tO1W0mU3+FYahqk5E1
 disRC11KI0mC7o8Obxqv7HZWJJ3tYNhGipVBLGsjaN1NEK7vTYmcecTM8J729Y2B4gim
 m80YWyiD6z/lLjm9vsA/5HId6aG2oHQiyPW2licnsqvbRTmt+ouCz2g/Y48X3wKt1bsk
 8C++ZWUp4MYzIUBod3wqUH5UnqPE87caRiyNeUQKQsWM2HEbvyUpBOuJikSDLeWL9Fe2
 XNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cJh4PYyUI6xHySX36hONClAaQmYIjo+6gw5rU4C8imM=;
 b=whuaVqihu1lo6BSNVR3RZUjMzgZsmP2ZYO3ly39zhAbJfOzKJ0wbw+hgLSjSpTz4ob
 7OggftuYV11hpYCXu26xmpWrPFaaW1GV3b2cnbw4UMdKaNuv1vN/VMVJeAUY85jsViE2
 0mGitU18iEREZnbbO5yjmIw+TVJRGKvBO1ebPaMDTQv9dkGdz5E5xL5fym9CVFQz/PbG
 Dq+pcqB4/wK+FhbKvmZ5nDlcxdgrV4ERxyua+OoPsVTtg4KuiqJbUEG+EIs75S2My20P
 2WGPIV+Imz9ba3CGCxg0j33OvGlKgCgmPHLygq9OfkVM1wJk0xTsHGU8VafrCrMwYDbK
 qt4A==
X-Gm-Message-State: AOAM533XPUcnpU5xIuuXHoUvdE4Q59wfoObylPkt3RbGb5tPLbaa3nW4
 jyiF7Ch5wI7xz/DrghoYgRzvYBjN+fs=
X-Google-Smtp-Source: ABdhPJy9Q6r4NM8TvlaPdho1rmjPf/mIOw9jOMZpifPuEnmYMlVScM0cHkLGBmE/fU2SenOacv+n4w==
X-Received: by 2002:a05:6000:114e:b0:1f0:4b8d:457 with SMTP id
 d14-20020a056000114e00b001f04b8d0457mr7850616wrx.89.1646647996776; 
 Mon, 07 Mar 2022 02:13:16 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v2-20020adf8b42000000b001edc38024c9sm11913880wra.65.2022.03.07.02.13.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Mar 2022 02:13:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/16] isa: Drop unused attributes from ISADevice
Date: Mon,  7 Mar 2022 11:12:05 +0100
Message-Id: <20220307101207.90369-15-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307101207.90369-1-philippe.mathieu.daude@gmail.com>
References: <20220307101207.90369-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bernhard Beschow <shentey@gmail.com>

Now that the last users of ISADevice::isairq[] have been resolved during the
previous commits, it can be removed for good.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220301220037.76555-7-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
2.34.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 508E1481764
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Dec 2021 23:56:37 +0100 (CET)
Received: from localhost ([::1]:48644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2hs4-0001mN-EL
	for lists+qemu-devel@lfdr.de; Wed, 29 Dec 2021 17:56:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2ho3-0004WL-O4
 for qemu-devel@nongnu.org; Wed, 29 Dec 2021 17:52:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2ho2-0000R4-9V
 for qemu-devel@nongnu.org; Wed, 29 Dec 2021 17:52:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640818345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uqL8vZZPvn+NdNRr9VNi7rmG13LdpKOsdG9YYXl47e0=;
 b=NknRLXjCkjZrB4iVDObXU1KBrOBGyogUY/itqO6AjiOZXnbXWGRkSS5KafpYiuwWbtjaG0
 KKssJigIodFjaRT166ZA0+DVYk9wwZeTV+/NYXwfVcCW467W+/imAXc2KKdtBNCcw+VR5f
 F+5eEoUqFZkFblw2HQrC2s5DVn2ng3k=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-m-uCqYawOgqboPdZZiXALA-1; Wed, 29 Dec 2021 17:52:24 -0500
X-MC-Unique: m-uCqYawOgqboPdZZiXALA-1
Received: by mail-wr1-f70.google.com with SMTP id
 v18-20020a5d5912000000b001815910d2c0so5430430wrd.1
 for <qemu-devel@nongnu.org>; Wed, 29 Dec 2021 14:52:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uqL8vZZPvn+NdNRr9VNi7rmG13LdpKOsdG9YYXl47e0=;
 b=JGhBaYH+fBUT5WSptVYD0IxmIfLPZPQ0+Yw712ZIMokYsyv88OhHnxV/bhRdDcF5Db
 xoc35W2Mgo9X99WnEJlJzNhw2r5fIxOvtAtdbk8e5mlpoVnqCUmxv2Zmpr0hEpRIQ4bU
 44344dew5flffrbAL/jhlx4nsfDEPcg0+psTPJkFqrL7Vw22o38QI3c3eAvJPIxDdsFQ
 XYI5w7lkOySxd6GBy5poR0VYxrDqZEAPCrSDmyOmCFCC7BLapmI+Z9iqOtaLL/Qo5TCp
 0Zb71lweKsaVvLs8Y745pJ0Hr2Od5G5Ms+ITDuyTusyljDHISaeupV7pnRkgNi6jD/xz
 aiXQ==
X-Gm-Message-State: AOAM533Uz2W+TimCS9h/qpbGDmRuvSIQ6B80DomZZV8LwBu/X6HnhQa8
 nGsARwsWm8g1PWObHnuGWBfaLSL2ipYyzEinYCLvz2LvKUkG1s//0tUaYzuFOq15wKXCQ79+1Iw
 4AAUobdyYgjiFZW6SZq872QpbCI67IzsGLlwyO3L9qzcVuxnrLeAZunUlpDIuJLe0
X-Received: by 2002:a05:600c:1d8f:: with SMTP id
 p15mr23685446wms.102.1640818343454; 
 Wed, 29 Dec 2021 14:52:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw1+hlMZ/ltqE4Tzud7R7Rd6xQgmcqVKrh37e2H+5JTXkTd/vc993T+03P96RWNnah8R1JRig==
X-Received: by 2002:a05:600c:1d8f:: with SMTP id
 p15mr23685432wms.102.1640818343242; 
 Wed, 29 Dec 2021 14:52:23 -0800 (PST)
Received: from x1w.. (26.red-83-50-86.dynamicip.rima-tde.net. [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id e5sm25289236wrq.116.2021.12.29.14.52.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 14:52:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] hw/sysbus: Document GPIO related functions
Date: Wed, 29 Dec 2021 23:52:06 +0100
Message-Id: <20211229225206.171882-4-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211229225206.171882-1-philmd@redhat.com>
References: <20211229225206.171882-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similarly to cd07d7f9f51 ("qdev: Document GPIO related functions"),
add documentation comments for the various sysbus functions
related to creating and connecting GPIO lines.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/sysbus.h | 67 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 64 insertions(+), 3 deletions(-)

diff --git a/include/hw/sysbus.h b/include/hw/sysbus.h
index 24645ee7996..7b2b7c7faaa 100644
--- a/include/hw/sysbus.h
+++ b/include/hw/sysbus.h
@@ -69,14 +69,75 @@ typedef void FindSysbusDeviceFunc(SysBusDevice *sbdev, void *opaque);
 
 void sysbus_init_mmio(SysBusDevice *dev, MemoryRegion *memory);
 MemoryRegion *sysbus_mmio_get_region(SysBusDevice *dev, int n);
-void sysbus_init_irq(SysBusDevice *dev, qemu_irq *p);
-void sysbus_pass_irq(SysBusDevice *dev, SysBusDevice *target);
-void sysbus_init_ioports(SysBusDevice *dev, uint32_t ioport, uint32_t size);
 
+/**
+ * sysbus_init_irq: Create an output GPIO line
+ * @dev: Sysbus device to create output GPIO for
+ * @irq: Pointer to qemu_irq for the GPIO lines
+ *
+ * Sysbus devices should use this function in their instance_init
+ * or realize methods to create any output GPIO lines they need.
+ *
+ * The @irq argument should be a pointer to either a "qemu_irq" in
+ * the device's state structure. The device implementation can then raise
+ * and lower the GPIO line by calling qemu_set_irq(). (If anything is
+ * connected to the other end of the GPIO this will cause the handler
+ * function for that input GPIO to be called.)
+ *
+ * See sysbus_connect_irq() for how code that uses such a device can
+ * connect to one of its output GPIO lines.
+ *
+ * There is no need to release the @pins allocated array because it
+ * will be automatically released when @dev calls its instance_finalize()
+ * handler.
+ */
+void sysbus_init_irq(SysBusDevice *dev, qemu_irq *irq);
+
+/**
+ * sysbus_pass_irq: Create GPIO lines on container which pass through
+ *                  to a target device
+ * @dev: Device which needs to expose GPIO lines
+ * @target: Device which has GPIO lines
+ *
+ * This function allows a container device to create GPIO arrays on itself
+ * which simply pass through to a GPIO array of another device. It is
+ * useful when modelling complex devices such system-on-chip, where a
+ * sysbus device contains other sysbus devices.
+ *
+ * It is not possible to pass a subset of the GPIO lines with this function.
+ *
+ * To users of the container sysbus device, the GPIO array created on @dev
+ * behaves exactly like any other.
+ */
+void sysbus_pass_irq(SysBusDevice *dev, SysBusDevice *target);
+
+void sysbus_init_ioports(SysBusDevice *dev, uint32_t ioport, uint32_t size);
 
 bool sysbus_has_irq(SysBusDevice *dev, int n);
 bool sysbus_has_mmio(SysBusDevice *dev, unsigned int n);
+
+/**
+ * sysbus_connect_irq: Connect a sysbus device output GPIO line
+ * @dev: sysbus device whose GPIO to connect
+ * @n: Number of the output GPIO line (which must be in range)
+ * @pin: qemu_irq to connect the output line to
+ *
+ * This function connects an output GPIO line on a sysbus device
+ * up to an arbitrary qemu_irq, so that when the device asserts that
+ * output GPIO line, the qemu_irq's callback is invoked.
+ * The index @n of the GPIO line must be valid, otherwise this function
+ * will assert().
+ *
+ * Outbound GPIO lines can be connected to any qemu_irq, but the common
+ * case is connecting them to another device's inbound GPIO line, using
+ * the qemu_irq returned by qdev_get_gpio_in() or qdev_get_gpio_in_named().
+ *
+ * It is not valid to try to connect one outbound GPIO to multiple
+ * qemu_irqs at once, or to connect multiple outbound GPIOs to the
+ * same qemu_irq; see qdev_connect_gpio_out() for details.
+ */
 void sysbus_connect_irq(SysBusDevice *dev, int n, qemu_irq irq);
+
 void sysbus_mmio_map(SysBusDevice *dev, int n, hwaddr addr);
 void sysbus_mmio_map_overlap(SysBusDevice *dev, int n, hwaddr addr,
                              int priority);
-- 
2.33.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE7641DDA9
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 17:36:06 +0200 (CEST)
Received: from localhost ([::1]:45814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVy6P-0000lZ-Hf
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 11:36:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxjR-0000J2-KP
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:12:21 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:43930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxjP-00044X-Ai
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:12:21 -0400
Received: by mail-wr1-x432.google.com with SMTP id x20so10642236wrg.10
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 08:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=zPpRQrWSyjrRJfT0bIIpJXg1qS4RrwpRld2bjFRckaw=;
 b=bRs+islmHLkB3MMy7DkBIu15VNGnQJ08mxpv4Z8jjk1jkgnqZNvLCp6+kqZYM/4/Lj
 iOpxfAkm/lG0i0AijrVMTvXsqgXBc86uAMyp+2Yko+PEze2MTrozGGnSTHOoAqOypAxP
 7KmoEoBnjcM86MJgw3d2u58xHUFCEzbbQyiaYu/rWarV4EySefOcGv6xz5/Fwc3JhTac
 7XeIBsy1JCPmMQnq53Mr3ZPr8u3v2u2+DeiEXN2DiWUvOVEKX0MYtvZrAX8BHikxdbNp
 UWI+OI6bGh/7miv5SLn8zZ6LvbV5uJpCQBHUdLUOyAh4fRdFnKSn1iY6Ao6ZotidPJd6
 tr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zPpRQrWSyjrRJfT0bIIpJXg1qS4RrwpRld2bjFRckaw=;
 b=qzEOOg8YiOxJZb7prtCcyOiZ9Eme1cGD6zqjfHscvVEZ9EShbHVvNWp63wXgC2cPBd
 vtGiONrcx5J0NN0MCSh98rM7mHJViN9e7xlIKUl/7X/fffh8COzuJ4w3fPEGPbAjXRAR
 2rkqfMnEF3k3OHiMQmrSpYWqRhjBpNMEIeOD0A63HY8eHcsCdTN8PNssu6WjmjssuWZz
 d7H2oLo2/3JngozrdYVwXzmDryabgpo5asdHyUtFZ80m46l6y+JuSjrBVieq9XgoXYrz
 RXs6pOPS/LRc32GoZcqE+xDMSXFcgSZLNjXDT7Udr58H5N5QY/YSVhnkXHHlCcq2HmQ2
 1gCw==
X-Gm-Message-State: AOAM532gijxRjZCV/9Iyub2nufb4WMwerVlNwcap1fuHADMtxkFQahT4
 4fIPLLFUGuIE1QZAxRkWlMYCKt+WFou0Jw==
X-Google-Smtp-Source: ABdhPJyORZm/k0lDdg8hAMszK36ANFeYMG06Rl2R372I+mw1AFEoy1XoyoZxgJMaLiCUC2ZjxANanA==
X-Received: by 2002:a05:6000:188d:: with SMTP id
 a13mr6926982wri.103.1633014737391; 
 Thu, 30 Sep 2021 08:12:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g8sm1952098wrm.46.2021.09.30.08.12.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 08:12:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/22] ipack: Rename ipack_bus_new_inplace() to ipack_bus_init()
Date: Thu, 30 Sep 2021 16:11:56 +0100
Message-Id: <20210930151201.9407-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210930151201.9407-1-peter.maydell@linaro.org>
References: <20210930151201.9407-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Rename ipack_bus_new_inplace() to ipack_bus_init(), to bring it in to
line with a "_init for in-place init, _new for allocate-and-return"
convention.  Drop the 'name' argument, because the only caller does
not pass in a name.  If a future caller does need to specify the bus
name, we should create an ipack_bus_init_named() function at that
point.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-id: 20210923121153.23754-3-peter.maydell@linaro.org
---
 include/hw/ipack/ipack.h |  8 ++++----
 hw/ipack/ipack.c         | 10 +++++-----
 hw/ipack/tpci200.c       |  4 ++--
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/hw/ipack/ipack.h b/include/hw/ipack/ipack.h
index 75014e74ae1..cbcdda509d3 100644
--- a/include/hw/ipack/ipack.h
+++ b/include/hw/ipack/ipack.h
@@ -73,9 +73,9 @@ extern const VMStateDescription vmstate_ipack_device;
     VMSTATE_STRUCT(_field, _state, 1, vmstate_ipack_device, IPackDevice)
 
 IPackDevice *ipack_device_find(IPackBus *bus, int32_t slot);
-void ipack_bus_new_inplace(IPackBus *bus, size_t bus_size,
-                           DeviceState *parent,
-                           const char *name, uint8_t n_slots,
-                           qemu_irq_handler handler);
+void ipack_bus_init(IPackBus *bus, size_t bus_size,
+                    DeviceState *parent,
+                    uint8_t n_slots,
+                    qemu_irq_handler handler);
 
 #endif
diff --git a/hw/ipack/ipack.c b/hw/ipack/ipack.c
index f19ecaeb1cf..d28e7f6449e 100644
--- a/hw/ipack/ipack.c
+++ b/hw/ipack/ipack.c
@@ -30,12 +30,12 @@ IPackDevice *ipack_device_find(IPackBus *bus, int32_t slot)
     return NULL;
 }
 
-void ipack_bus_new_inplace(IPackBus *bus, size_t bus_size,
-                           DeviceState *parent,
-                           const char *name, uint8_t n_slots,
-                           qemu_irq_handler handler)
+void ipack_bus_init(IPackBus *bus, size_t bus_size,
+                    DeviceState *parent,
+                    uint8_t n_slots,
+                    qemu_irq_handler handler)
 {
-    qbus_create_inplace(bus, bus_size, TYPE_IPACK_BUS, parent, name);
+    qbus_create_inplace(bus, bus_size, TYPE_IPACK_BUS, parent, NULL);
     bus->n_slots = n_slots;
     bus->set_irq = handler;
 }
diff --git a/hw/ipack/tpci200.c b/hw/ipack/tpci200.c
index d107e134c4e..1f764fc85ba 100644
--- a/hw/ipack/tpci200.c
+++ b/hw/ipack/tpci200.c
@@ -611,8 +611,8 @@ static void tpci200_realize(PCIDevice *pci_dev, Error **errp)
     pci_register_bar(&s->dev, 4, PCI_BASE_ADDRESS_SPACE_MEMORY, &s->las2);
     pci_register_bar(&s->dev, 5, PCI_BASE_ADDRESS_SPACE_MEMORY, &s->las3);
 
-    ipack_bus_new_inplace(&s->bus, sizeof(s->bus), DEVICE(pci_dev), NULL,
-                          N_MODULES, tpci200_set_irq);
+    ipack_bus_init(&s->bus, sizeof(s->bus), DEVICE(pci_dev),
+                   N_MODULES, tpci200_set_irq);
 }
 
 static const VMStateDescription vmstate_tpci200 = {
-- 
2.20.1



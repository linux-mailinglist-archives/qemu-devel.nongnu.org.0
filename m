Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF1B450A35
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 17:53:58 +0100 (CET)
Received: from localhost ([::1]:49564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmfEz-0006P5-9n
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 11:53:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmf0Y-0003Zh-QM
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:39:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmf0X-0005Ig-BV
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:39:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636994340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PBTLwx0PHeZdiY6CH6544AuYOzCiwI2d3fclfLXX6Uk=;
 b=IiK34ZbKQNTyI0d/z8IXeLtD6wseTnqJN/8vy1kFbzSVVSEXZLBH89M3Nr4Fz01uC5crkT
 fhELF6kIiU+/6D+H2KjtYM0rdtecaLOdG+WR5SgEp/RsfjbH8k9g4ldYmMTqioUP5TtpRE
 5pIUZrrqIks8HGynaufbiueB2Kki4vI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-lGwNEqk9PWqZIHLqAQ4Aqw-1; Mon, 15 Nov 2021 11:38:57 -0500
X-MC-Unique: lGwNEqk9PWqZIHLqAQ4Aqw-1
Received: by mail-ed1-f70.google.com with SMTP id
 v9-20020a50d849000000b003dcb31eabaaso14599413edj.13
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 08:38:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PBTLwx0PHeZdiY6CH6544AuYOzCiwI2d3fclfLXX6Uk=;
 b=5Xzlj1AT1b6OicfpeYbCcYXT2ilze5QKxSydp+tluatNF03sitsnlLnOOQygNa4AXO
 UAZuwvVc9z2rvqVpiBHaJOgxIg4RAciy2He/53y1q7yudmpBf/kNhYExhE1JV0aeOEgu
 vmHG+0sAunQ8w0qYhz2Ch1cesIkDHZS91TSzXvOg5txdN20/L/VJGnkXowBdRwzeME3f
 NRwBBhsSiWd7o66OuAOOH/Kp+eXggO6MoXfeDPiOFvJ0nb9BJlNqLlKjxxHAWDkzA7ub
 jB4YqaZoLI+60ysQoTzAcSskL777+8BcwrGFxYobPC9X8/G4CeuGmzF/VaaNbiR0jsWE
 Cpew==
X-Gm-Message-State: AOAM530+dfUZ3y5uPQlro2S9rIEh3D3ZQ0bWINETCk0W1ovmInGLYILe
 UHZh6lJQvs33ZEiPLQUmR1T+irkj+stQSK8JMYXdyO9p8ksox1M/0tHihg/cMJwCf/fOEfosR14
 hs7hJ1veEWbr+veOROAkFULcOZN7DxeBpTwo/75j+2kqBsZnC4bLlQ+lGaLdl
X-Received: by 2002:a05:6402:41a:: with SMTP id
 q26mr58873034edv.387.1636994336113; 
 Mon, 15 Nov 2021 08:38:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz31qq8/UPOH1DsalKos3c7zxAGveuEa2ELgA1mht3SLRoczilwzlMmGzLMnlNS/5Bu9pBRrg==
X-Received: by 2002:a05:6402:41a:: with SMTP id
 q26mr58872996edv.387.1636994335920; 
 Mon, 15 Nov 2021 08:38:55 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:9a71:d0b:1947:b534:3230])
 by smtp.gmail.com with ESMTPSA id u16sm7706666edr.43.2021.11.15.08.38.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 08:38:55 -0800 (PST)
Date: Mon, 15 Nov 2021 11:38:51 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/20] pcie: implement slot power control for pcie root ports
Message-ID: <20211115163607.177432-17-mst@redhat.com>
References: <20211115163607.177432-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211115163607.177432-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

With this patch hot-plugged pci devices will only be visible to the
guest if the guests hotplug driver has enabled slot power.

This should fix the hot-plug race which one can hit when hot-plugging
a pci device at boot, while the guest is in the middle of the pci bus
scan.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20211111130859.1171890-3-kraxel@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci/pcie.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index 914a9bf3d1..13d11a57c7 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -366,6 +366,29 @@ static void hotplug_event_clear(PCIDevice *dev)
     }
 }
 
+static void pcie_set_power_device(PCIBus *bus, PCIDevice *dev, void *opaque)
+{
+    bool *power = opaque;
+
+    pci_set_power(dev, *power);
+}
+
+static void pcie_cap_update_power(PCIDevice *hotplug_dev)
+{
+    uint8_t *exp_cap = hotplug_dev->config + hotplug_dev->exp.exp_cap;
+    PCIBus *sec_bus = pci_bridge_get_sec_bus(PCI_BRIDGE(hotplug_dev));
+    uint32_t sltcap = pci_get_long(exp_cap + PCI_EXP_SLTCAP);
+    uint16_t sltctl = pci_get_word(exp_cap + PCI_EXP_SLTCTL);
+    bool power = true;
+
+    if (sltcap & PCI_EXP_SLTCAP_PCP) {
+        power = (sltctl & PCI_EXP_SLTCTL_PCC) == PCI_EXP_SLTCTL_PWR_ON;
+    }
+
+    pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
+                        pcie_set_power_device, &power);
+}
+
 /*
  * A PCI Express Hot-Plug Event has occurred, so update slot status register
  * and notify OS of the event if necessary.
@@ -434,6 +457,7 @@ void pcie_cap_slot_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
             pci_word_test_and_set_mask(exp_cap + PCI_EXP_LNKSTA,
                                        PCI_EXP_LNKSTA_DLLLA);
         }
+        pcie_cap_update_power(hotplug_pdev);
         return;
     }
 
@@ -451,6 +475,7 @@ void pcie_cap_slot_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
         }
         pcie_cap_slot_event(hotplug_pdev,
                             PCI_EXP_HP_EV_PDC | PCI_EXP_HP_EV_ABP);
+        pcie_cap_update_power(hotplug_pdev);
     }
 }
 
@@ -625,6 +650,7 @@ void pcie_cap_slot_reset(PCIDevice *dev)
                                  PCI_EXP_SLTSTA_PDC |
                                  PCI_EXP_SLTSTA_ABP);
 
+    pcie_cap_update_power(dev);
     hotplug_event_update_event_status(dev);
 }
 
@@ -705,6 +731,7 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
         pci_word_test_and_set_mask(exp_cap + PCI_EXP_SLTSTA,
                                        PCI_EXP_SLTSTA_PDC);
     }
+    pcie_cap_update_power(dev);
 
     hotplug_event_notify(dev);
 
@@ -731,6 +758,7 @@ int pcie_cap_slot_post_load(void *opaque, int version_id)
 {
     PCIDevice *dev = opaque;
     hotplug_event_update_event_status(dev);
+    pcie_cap_update_power(dev);
     return 0;
 }
 
-- 
MST



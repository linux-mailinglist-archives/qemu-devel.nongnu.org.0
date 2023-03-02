Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DF46A7CA8
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:30:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeGe-0005RY-Bf; Thu, 02 Mar 2023 03:26:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeGY-0005IX-P5
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:26:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeGX-0002Re-32
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:26:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qs6Vjv5hksL8MXbWeOMHLJtgCWHyzUlQf+mQ8Y+akP4=;
 b=H8KytBOg0MEUkcWHFuHaOIMVpEIXrsRqaqdEY6dNBlDXkf8BuZ3ciFfKs4+2Y491/BgaYB
 LG4Te1hoG2gI/c+CeAsAVf0Fes9E9Sl/j85Yok1DgMMEU2bA80aPaAgMPpBeFH6BrLbPk9
 X17BAd0PNZIkVhvL+rWMfE22Bp11kPQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-488-NoI7n72zMSGSh7Ptp4RV1A-1; Thu, 02 Mar 2023 03:26:06 -0500
X-MC-Unique: NoI7n72zMSGSh7Ptp4RV1A-1
Received: by mail-wm1-f72.google.com with SMTP id
 k36-20020a05600c1ca400b003eac86e4387so916953wms.8
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:26:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745564;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Qs6Vjv5hksL8MXbWeOMHLJtgCWHyzUlQf+mQ8Y+akP4=;
 b=mO7bEt9nKC+/+k5FBp9IbLbxRejsoO2TOM1j6TBjFMY5weXh/VFNZ/QjWtlWNFQN8q
 Bmk460aGyfWbG4dYDQY9qxNzkbwHKlMRgOeLTr15VsFzjgNNhOOanISoKP5qA5JKm6Ja
 fNc//BPFrGjY0isuf7vs18QFILvl5vhMqZ7bDI91/rm6TpZG3y12vktgCTgMSvXZZbq9
 RcBbD72TKexIWoddA+trv8b1NWixBL0wRvN0YRv0zdoHDyhMac9lZraKl0yjVF8kEkJJ
 YTeXBAXIVG8TvMocBE/edcewM/GFDvUGj+MDzXEqnp0l1Nw8XwBPdBcJl4BcQtrTx2Zm
 HOaA==
X-Gm-Message-State: AO0yUKVUZWzg4V5EioI3FJTpVHQOTdtvG8b53UAcqBfaTsbJ5p5QNd55
 N3RTQcwFEvPfXYVPzJFjg5LbCP54+hl9mk76l1ush4w3opDCSGg2tOWVKh8mX68qX00T7GRf2Da
 /vF+XxT+IgA+D12MT4xZm7ZUDffi0pjVFIwHRCd+jB7EYigvIUQeIsmdCtEEPo++qKw==
X-Received: by 2002:adf:f611:0:b0:2cc:498d:b902 with SMTP id
 t17-20020adff611000000b002cc498db902mr6463512wrp.59.1677745564706; 
 Thu, 02 Mar 2023 00:26:04 -0800 (PST)
X-Google-Smtp-Source: AK7set+jCYLw0YPlJWZVLCsKLke1h0Gz917veZia4dWSqYNUquHflZ0JUqeYIWVUVAOPqydM2YolMA==
X-Received: by 2002:adf:f611:0:b0:2cc:498d:b902 with SMTP id
 t17-20020adff611000000b002cc498db902mr6463495wrp.59.1677745564401; 
 Thu, 02 Mar 2023 00:26:04 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 y14-20020adff14e000000b002c59f18674asm14134101wro.22.2023.03.02.00.26.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:26:03 -0800 (PST)
Date: Thu, 2 Mar 2023 03:26:01 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Anton Kuchin <antonkuchin@yandex-team.ru>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 30/53] pcie: introduce pcie_sltctl_powered_off() helper
Message-ID: <20230302082343.560446-31-mst@redhat.com>
References: <20230302082343.560446-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230302082343.560446-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

In pcie_cap_slot_write_config() we check for PCI_EXP_SLTCTL_PWR_OFF in
a bad form. We should distinguish PCI_EXP_SLTCTL_PWR which is a "mask"
and PCI_EXP_SLTCTL_PWR_OFF which is value for that mask.

Better code is in pcie_cap_slot_unplug_request_cb() and in
pcie_cap_update_power(). Let's use same pattern everywhere. To simplify
things add also a helper.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Anton Kuchin <antonkuchin@yandex-team.ru>
Message-Id: <20230216180356.156832-12-vsementsov@yandex-team.ru>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci/pcie.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index db8360226f..90faf0710a 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -39,6 +39,11 @@
 #define PCIE_DEV_PRINTF(dev, fmt, ...)                                  \
     PCIE_DPRINTF("%s:%x "fmt, (dev)->name, (dev)->devfn, ## __VA_ARGS__)
 
+static bool pcie_sltctl_powered_off(uint16_t sltctl)
+{
+    return (sltctl & PCI_EXP_SLTCTL_PCC) == PCI_EXP_SLTCTL_PWR_OFF
+        && (sltctl & PCI_EXP_SLTCTL_PIC) == PCI_EXP_SLTCTL_PWR_IND_OFF;
+}
 
 /***************************************************************************
  * pci express capability helper functions
@@ -395,6 +400,7 @@ static void pcie_cap_update_power(PCIDevice *hotplug_dev)
 
     if (sltcap & PCI_EXP_SLTCAP_PCP) {
         power = (sltctl & PCI_EXP_SLTCTL_PCC) == PCI_EXP_SLTCTL_PWR_ON;
+        /* Don't we need to check also (sltctl & PCI_EXP_SLTCTL_PIC) ? */
     }
 
     pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
@@ -579,8 +585,7 @@ void pcie_cap_slot_unplug_request_cb(HotplugHandler *hotplug_dev,
         return;
     }
 
-    if (((sltctl & PCI_EXP_SLTCTL_PIC) == PCI_EXP_SLTCTL_PWR_IND_OFF) &&
-        ((sltctl & PCI_EXP_SLTCTL_PCC) == PCI_EXP_SLTCTL_PWR_OFF)) {
+    if (pcie_sltctl_powered_off(sltctl)) {
         /* slot is powered off -> unplug without round-trip to the guest */
         pcie_cap_slot_do_unplug(hotplug_pdev);
         hotplug_event_notify(hotplug_pdev);
@@ -770,10 +775,9 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
      * this is a work around for guests that overwrite
      * control of powered off slots before powering them on.
      */
-    if ((sltsta & PCI_EXP_SLTSTA_PDS) && (val & PCI_EXP_SLTCTL_PCC) &&
-        (val & PCI_EXP_SLTCTL_PIC) == PCI_EXP_SLTCTL_PWR_IND_OFF &&
-        (!(old_slt_ctl & PCI_EXP_SLTCTL_PCC) ||
-        (old_slt_ctl & PCI_EXP_SLTCTL_PIC) != PCI_EXP_SLTCTL_PWR_IND_OFF)) {
+    if ((sltsta & PCI_EXP_SLTSTA_PDS) && pcie_sltctl_powered_off(val) &&
+        !pcie_sltctl_powered_off(old_slt_ctl))
+    {
         pcie_cap_slot_do_unplug(dev);
     }
     pcie_cap_update_power(dev);
-- 
MST



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2ACB3DF6A9
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 22:56:17 +0200 (CEST)
Received: from localhost ([::1]:37444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mB1SS-0007NC-UA
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 16:56:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mB1OV-0000Hp-O3
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 16:52:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mB1OU-0007xV-Aa
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 16:52:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628023929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zxn59icsUcVCuhPxyLLQjU1hA9/qYGB4uEzj4yZU5LM=;
 b=fs3G/ioh1pXpGYFUrl7tUQrK2FNfHAGfCXfiJ1OqGl8p9u8e8SQg9rIDHmIFr9VqPDdo3T
 bt+l9P+K5XNIS58M4bAwRLugLbvHH+5R3LcMg89ZiPTo6KUaz+QtjT/IfBeHZCmrEspv9S
 kLDtzxDlGXFynjlvoQ15cgD0DCPlSy0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-_QDJdkTLNdm0b7Py01CDdA-1; Tue, 03 Aug 2021 16:52:08 -0400
X-MC-Unique: _QDJdkTLNdm0b7Py01CDdA-1
Received: by mail-ed1-f71.google.com with SMTP id
 c1-20020aa7df010000b02903bb5c6f746eso267338edy.10
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 13:52:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Zxn59icsUcVCuhPxyLLQjU1hA9/qYGB4uEzj4yZU5LM=;
 b=i4pQTE8Jjch6o7drS9MZK+iZEe3qiAA9dCPsQh/oJ89UBzkcja+p9Qx7lQBDB6tYRA
 VzrAlJnkgaeUf4Y7zzNZkXOSg3XOOYvfhchFIBAK1cusLvNJNh1jHLjwKTYUFjgdWtLd
 Hixmp5zeSkJ9WQftLH84Y/PB6RvQp0S0ty/fIUaTPycDepLrMnBhKQwVDVOdVQxbijqx
 ffac40dUKja43JepBLziBuXH9/sDICAfa78v2IYIYO2YFtTYglfsOt0FDH1ISXmO9fu5
 02ltJRMlpe5R12eZKo0sdzn7ix9JWEJIl3IZCOr1EN1byKR87r972c+ZEN3cAqw0MnxU
 tceQ==
X-Gm-Message-State: AOAM533Cmj8GhIqpTgClwP5t2Lomh87jHEuUPHgF5uAP4FtxUmg3VgPd
 nj0zBYVL90dyzp8/4b2mjD1h/0vVLGzBHdo0HnE8yGdWeT1qHvwkm8jN6FXc/BdE7Tpg7f5Wv8o
 xCNQsgQfNZ+mHJ78IzvkKHq7PJSx3UWmyBuSUIovImwbTHK5b5E1z4jyvjWBG
X-Received: by 2002:aa7:c1cf:: with SMTP id d15mr19280704edp.201.1628023926475; 
 Tue, 03 Aug 2021 13:52:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSQSNLMPXdB3OY8YSyn411UKhP2KwYFY95QK0LF69MKzO+j4X754+Ms6zNaT0xibqQxYMJZg==
X-Received: by 2002:aa7:c1cf:: with SMTP id d15mr19280689edp.201.1628023926259; 
 Tue, 03 Aug 2021 13:52:06 -0700 (PDT)
Received: from redhat.com ([2.55.141.248])
 by smtp.gmail.com with ESMTPSA id i14sm26648edx.30.2021.08.03.13.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 13:52:05 -0700 (PDT)
Date: Tue, 3 Aug 2021 16:52:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/5] hw/pcie-root-port: Fix hotplug for PCI devices requiring IO
Message-ID: <20210803205043.165034-2-mst@redhat.com>
References: <20210803205043.165034-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210803205043.165034-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Marcel Apfelbaum <marcel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>

Q35 has now ACPI hotplug enabled by default for PCI(e) devices.
As opposed to native PCIe hotplug, guests like Fedora 34
will not assign IO range to pcie-root-ports not supporting
native hotplug, resulting into a regression.

Reproduce by:
    qemu-bin -M q35 -device pcie-root-port,id=p1 -monitor stdio
    device_add e1000,bus=p1
In the Guest OS the respective pcie-root-port will have the IO range
disabled.

Fix it by setting the "reserve-io" hint capability of the
pcie-root-ports so the firmware will allocate the IO range instead.

Acked-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
Message-Id: <20210802090057.1709775-1-marcel@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci-bridge/gen_pcie_root_port.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/pci-bridge/gen_pcie_root_port.c b/hw/pci-bridge/gen_pcie_root_port.c
index ec9907917e..20099a8ae3 100644
--- a/hw/pci-bridge/gen_pcie_root_port.c
+++ b/hw/pci-bridge/gen_pcie_root_port.c
@@ -28,6 +28,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(GenPCIERootPort, GEN_PCIE_ROOT_PORT)
         (GEN_PCIE_ROOT_PORT_AER_OFFSET + PCI_ERR_SIZEOF)
 
 #define GEN_PCIE_ROOT_PORT_MSIX_NR_VECTOR       1
+#define GEN_PCIE_ROOT_DEFAULT_IO_RANGE          4096
 
 struct GenPCIERootPort {
     /*< private >*/
@@ -75,6 +76,7 @@ static bool gen_rp_test_migrate_msix(void *opaque, int version_id)
 static void gen_rp_realize(DeviceState *dev, Error **errp)
 {
     PCIDevice *d = PCI_DEVICE(dev);
+    PCIESlot *s = PCIE_SLOT(d);
     GenPCIERootPort *grp = GEN_PCIE_ROOT_PORT(d);
     PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(d);
     Error *local_err = NULL;
@@ -85,6 +87,9 @@ static void gen_rp_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    if (grp->res_reserve.io == -1 && s->hotplug && !s->native_hotplug) {
+        grp->res_reserve.io = GEN_PCIE_ROOT_DEFAULT_IO_RANGE;
+    }
     int rc = pci_bridge_qemu_reserve_cap_init(d, 0,
                                               grp->res_reserve, errp);
 
-- 
MST



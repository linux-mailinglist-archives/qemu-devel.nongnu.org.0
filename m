Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7627C59741F
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 18:28:07 +0200 (CEST)
Received: from localhost ([::1]:40044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOLtl-0000gE-Jz
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 12:28:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOLir-000269-Mj
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 12:16:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOLim-0000TD-Iz
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 12:16:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660752972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EeMkAHhf9AoIGqHoeQ4LAkZR3KVWS7ogggvX+tcW7Dw=;
 b=A1C6Da3efTyflyQ4ob5e5rbT6Y6n6wTdJnFH9CHwf01mKZEaLHguN05lwL7HPo/m/e3u/a
 V3e7AB2023I2qy/q4dk7cy9P4WYnwYl3OqprcN0ZfNMxuOxRma18VTFJX+CgQ+VU4Il2cK
 OKqxK/N9g7/O0bqP9h8R5VPPkJhRP/o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-648-thGiVR2fObeUDfqWi0NMOg-1; Wed, 17 Aug 2022 12:15:08 -0400
X-MC-Unique: thGiVR2fObeUDfqWi0NMOg-1
Received: by mail-wm1-f69.google.com with SMTP id
 az42-20020a05600c602a00b003a552086ba9so1266988wmb.6
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 09:15:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=EeMkAHhf9AoIGqHoeQ4LAkZR3KVWS7ogggvX+tcW7Dw=;
 b=k62nU5rjBKZAiP4XHtdIOsADtFiDkD0cCtn76/yVK6RkUEtFH5ovOlZytAGnZRXlit
 DaSchKK/hRu1ny8zAciB0mOUSGHiyimj3T4XRgz+cRenVG1j9a8xjjGKCENKeGG8sUJk
 veCDA29+VT7qMFNX0KhcJDA3DVFiMqK3y3Rwk4cuV/y1JTiqzPeuzZ9YkAYFwqvFR0Dw
 vPFfzUe8P+ZSXVxgwS7dYcpiTU2wiNabv8mrk8rI/O7gHLVNhb0dRoTPydTUiKLbc14g
 2pW0G2iiAXj2RnP2XOtC2V+NadCM5mECQZIhowh8VX4EuZeIgjRMfjHo1cZllcNStap9
 WufA==
X-Gm-Message-State: ACgBeo0+UnrzM4vV87WBnkQUxbIzwtuPN/SR5xTTsKnmK5qEio5YPJiX
 My9HkMF0sydj2ByA4iQxtEPtFxxI5hjfdn9OY4UaadgM4dtIoq2rtJgDoRLeZkJwhExtoWAFbY6
 CCYVnruonhuCxcneUNIPuoHUzWtLh+r4/07i7IsHRtjVypftMZxFzQWkyuV52
X-Received: by 2002:a05:600c:4f07:b0:3a3:2277:7064 with SMTP id
 l7-20020a05600c4f0700b003a322777064mr2594478wmq.181.1660752907096; 
 Wed, 17 Aug 2022 09:15:07 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7pSXUwQlbxPGsJ/e8auNOh0Oz/Exj8NMtLR028QHjXR2BEDrE/ZnNFXxC3XDkyxxVHHiK+Cg==
X-Received: by 2002:a05:600c:4f07:b0:3a3:2277:7064 with SMTP id
 l7-20020a05600c4f0700b003a322777064mr2594459wmq.181.1660752906829; 
 Wed, 17 Aug 2022 09:15:06 -0700 (PDT)
Received: from redhat.com ([2.55.43.215]) by smtp.gmail.com with ESMTPSA id
 z1-20020adfec81000000b0021e51c039c5sm13467503wrn.80.2022.08.17.09.15.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 09:15:06 -0700 (PDT)
Date: Wed, 17 Aug 2022 12:15:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel@redhat.com>
Subject: [PULL 10/10] virtio-pci: don't touch pci on virtio reset
Message-ID: <20220817161342.240674-11-mst@redhat.com>
References: <20220817161342.240674-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220817161342.240674-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.082, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

virtio level reset should not affect pci express
registers such as PM, error or link.

Fixes: 27ce0f3afc ("hw/virtio: fix Power Management Control Register for PCI Express virtio devices")
Fixes: d584f1b9ca ("hw/virtio: fix Link Control Register for PCI Express virtio devices")
Fixes: c2cabb3422 ("hw/virtio: fix error enabling flags in Device Control register")
Cc: "Marcel Apfelbaum" <marcel@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-pci.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 5ce61f9b45..a50c5a57d7 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1947,7 +1947,6 @@ static void virtio_pci_reset(DeviceState *qdev)
 {
     VirtIOPCIProxy *proxy = VIRTIO_PCI(qdev);
     VirtioBusState *bus = VIRTIO_BUS(&proxy->bus);
-    PCIDevice *dev = PCI_DEVICE(qdev);
     int i;
 
     virtio_bus_reset(bus);
@@ -1960,6 +1959,13 @@ static void virtio_pci_reset(DeviceState *qdev)
         proxy->vqs[i].avail[0] = proxy->vqs[i].avail[1] = 0;
         proxy->vqs[i].used[0] = proxy->vqs[i].used[1] = 0;
     }
+}
+
+static void virtio_pci_bus_reset(DeviceState *qdev)
+{
+    PCIDevice *dev = PCI_DEVICE(qdev);
+
+    virtio_pci_reset(qdev);
 
     if (pci_is_express(dev)) {
         pcie_cap_deverr_reset(dev);
@@ -2027,7 +2033,7 @@ static void virtio_pci_class_init(ObjectClass *klass, void *data)
     k->class_id = PCI_CLASS_OTHERS;
     device_class_set_parent_realize(dc, virtio_pci_dc_realize,
                                     &vpciklass->parent_dc_realize);
-    dc->reset = virtio_pci_reset;
+    dc->reset = virtio_pci_bus_reset;
 }
 
 static const TypeInfo virtio_pci_info = {
-- 
MST



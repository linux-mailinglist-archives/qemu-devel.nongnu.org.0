Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A87B7310D03
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 16:12:18 +0100 (CET)
Received: from localhost ([::1]:54910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l82mP-0003Cm-O6
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 10:12:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l82hS-0007HE-RT
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:07:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l82hN-0004IV-8e
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:07:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612537624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NM5gGdPhi2A0Xfk2U2Gp/inbSM/ee2Z72/b98qblcAQ=;
 b=YhvNGA3I3qTaKMefKJvarZtOtNT3K0aZXQMAbt1kHsXciE43jbcQwUYOYLV9Nf3bDFMFtA
 LfpwNYj43Mwp0r3vkyeD2BFnrlP5NS4Vg+cinAYhT4izhcafuaCYcTwBSH7ZfjKIzME7aQ
 /4wTgw1P1l27W7z9rVx1v5HhktmoJyE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-HESJU1FtN_CsJZN_k0Ewow-1; Fri, 05 Feb 2021 10:03:58 -0500
X-MC-Unique: HESJU1FtN_CsJZN_k0Ewow-1
Received: by mail-ed1-f69.google.com with SMTP id l23so4453238edt.23
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 07:03:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NM5gGdPhi2A0Xfk2U2Gp/inbSM/ee2Z72/b98qblcAQ=;
 b=G2DeVMMAOwWhlHsWsK/S17nhlfINyQX2T9VxsOwv1cKm0pbVxlV2eh126dRUVgWJk2
 P6MEbRwo/p21ijYNUz8cVLYSildqxJiRYnB2fPxA1lG50u1HhoYzlTEEa06MZpxcWGQQ
 Sdf0aemDxEGY0WFGmLkpuFPb69ecVDypswvh5XJGIU90She1WuRAVXi8Pun69Ej37sjg
 A9eJSTOKj/XwY0mukoB8xbP9prMRsyWVGEdXLkAGVZy7mpE+IMdYj2sfPj+ORkGG7PuH
 XWVLYTeaJdW6vDdb6xawJex4omlxeft0uFngyTATpqdDei/UeNK1TaQVTZ3niuAlIaI9
 Vqrw==
X-Gm-Message-State: AOAM531ThkY4AExFECW82gkBfpKwOJWvkq0L5tRSZU9eUKRe8mkEysPh
 aYMMPekjzIGvXR8yE/JEG/meWlbnrE1AkR/a0ofAPwgFwiNmueu9iaXM7h7Aa+JDqZrPjpVjs4W
 6C6yZ/IJHPJuI0y60JPTr1k4D8ipYDQgIv3cGS7BYMK7rRIvunUIcrFOXVVvT
X-Received: by 2002:a17:906:d189:: with SMTP id
 c9mr4533481ejz.36.1612537437445; 
 Fri, 05 Feb 2021 07:03:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyFkKNbCT01jdx/jX7L40+CRAp4II9nQ02wxf9EHJPpNC5SkmJjQFpmIfk7Y9nOe5ST4JM+qw==
X-Received: by 2002:a17:906:d189:: with SMTP id
 c9mr4533459ejz.36.1612537437238; 
 Fri, 05 Feb 2021 07:03:57 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id sb6sm3755295ejb.54.2021.02.05.07.03.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 07:03:56 -0800 (PST)
Date: Fri, 5 Feb 2021 10:03:54 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 09/16] hw/virtio/virtio-balloon: Remove the "class" property
Message-ID: <20210205150135.94643-10-mst@redhat.com>
References: <20210205150135.94643-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210205150135.94643-1-mst@redhat.com>
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
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

This property was only required for compatibility reasons in the
pc-1.0 machine type and earlier. Now that these machine types have
been removed, the property is not useful anymore.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210203171832.483176-4-thuth@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: David Hildenbrand <david@redhat.com>
---
 hw/virtio/virtio-balloon-pci.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/hw/virtio/virtio-balloon-pci.c b/hw/virtio/virtio-balloon-pci.c
index a2c5cc7207..79a3ba979a 100644
--- a/hw/virtio/virtio-balloon-pci.c
+++ b/hw/virtio/virtio-balloon-pci.c
@@ -34,21 +34,13 @@ struct VirtIOBalloonPCI {
     VirtIOPCIProxy parent_obj;
     VirtIOBalloon vdev;
 };
-static Property virtio_balloon_pci_properties[] = {
-    DEFINE_PROP_UINT32("class", VirtIOPCIProxy, class_code, 0),
-    DEFINE_PROP_END_OF_LIST(),
-};
 
 static void virtio_balloon_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
 {
     VirtIOBalloonPCI *dev = VIRTIO_BALLOON_PCI(vpci_dev);
     DeviceState *vdev = DEVICE(&dev->vdev);
 
-    if (vpci_dev->class_code != PCI_CLASS_OTHERS &&
-        vpci_dev->class_code != PCI_CLASS_MEMORY_RAM) { /* qemu < 1.1 */
-        vpci_dev->class_code = PCI_CLASS_OTHERS;
-    }
-
+    vpci_dev->class_code = PCI_CLASS_OTHERS;
     qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
 }
 
@@ -59,7 +51,6 @@ static void virtio_balloon_pci_class_init(ObjectClass *klass, void *data)
     PCIDeviceClass *pcidev_k = PCI_DEVICE_CLASS(klass);
     k->realize = virtio_balloon_pci_realize;
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
-    device_class_set_props(dc, virtio_balloon_pci_properties);
     pcidev_k->vendor_id = PCI_VENDOR_ID_REDHAT_QUMRANET;
     pcidev_k->device_id = PCI_DEVICE_ID_VIRTIO_BALLOON;
     pcidev_k->revision = VIRTIO_PCI_ABI_VERSION;
-- 
MST



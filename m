Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2428B4CD656
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:28:39 +0100 (CET)
Received: from localhost ([::1]:35658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ8v8-0002iS-5R
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:28:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8Am-00036z-4J
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:40:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8Aj-00012y-HF
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:40:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646401240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gahauiWtzKVRJbmFnIa2BytU7N4O8wddJUnc6uKh6Qk=;
 b=axVKmAazC4Qf3K1NDgKyKYmWbA7Z9werA+dAYUdMMARPUKkAC5OatY9yGl1FYWrei2P/4J
 g8XjhLc22R/bm2YaYlOtmzYbM6X23O42w/dkYsxtAOohpKrlU/wJmmRnyCjXD12+foEi+d
 H10nHGQhyoT4vgwVK6UGpyB2IEysHBk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-IVlmFqPINoy_Q0PpSkmZvg-1; Fri, 04 Mar 2022 08:40:39 -0500
X-MC-Unique: IVlmFqPINoy_Q0PpSkmZvg-1
Received: by mail-wm1-f69.google.com with SMTP id
 26-20020a05600c22da00b00388307f3503so1070396wmg.1
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 05:40:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gahauiWtzKVRJbmFnIa2BytU7N4O8wddJUnc6uKh6Qk=;
 b=ZjPozgaL+jE2FRTnQZbgu17Rlxr9cw7lsdwf9EmBoqI5R1DUx9VxccTev5dm5RNuxA
 GYmNGR1ZYOWGyd7Ljn6nN7jWuQw1O33pZzc0JdbX3wTICHCSzwFKa7lFFDRuG5Io6Ify
 b22Vz8bzkYhIh+MtSFQszpRRO0dHU854yq9GynmbcaL1mdCl8HX1c05U6C1muJiRKseC
 vhXl2aBU1JgBXEJFnS4loWY8VyktrehRdj05UaAjDdN1kVhm8yJ3Ym/gCfYw03esihdx
 XBA6FaQcKxKHZ0xeOxlJeZKLqAirft/DcKaXnZfsgrFh4XiZYQ7H7aKJKGIj+ZWSIQWR
 WTtw==
X-Gm-Message-State: AOAM531tVutjf77q8orTsklmEcuVX1bSQV6svV2sHNkogRLhu8YAWmDz
 H77icGoAHwdS5ypTx2OCAMOa8rVP4Dm/t7dj8KZxMs+h5j3VVEA3wez1JBExDt8RmbaSJzWvRbi
 zv8/Jo3rwZu/dEhjEycGx/BuRxybTCCG2zbu7St7f10k+cwLoxEBOE6lEl/a/
X-Received: by 2002:a7b:c30a:0:b0:389:81d2:b608 with SMTP id
 k10-20020a7bc30a000000b0038981d2b608mr2163025wmj.147.1646401237813; 
 Fri, 04 Mar 2022 05:40:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzPk3HtNixyricsg5hk7oqAP6aBlo9zbet9pTI/uLx8DWCXc/DmyNPhr4BF1e4g02dMFQT4gA==
X-Received: by 2002:a7b:c30a:0:b0:389:81d2:b608 with SMTP id
 k10-20020a7bc30a000000b0038981d2b608mr2163005wmj.147.1646401237506; 
 Fri, 04 Mar 2022 05:40:37 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 r188-20020a1c2bc5000000b00387c81c32e7sm5253444wmr.8.2022.03.04.05.40.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 05:40:35 -0800 (PST)
Date: Fri, 4 Mar 2022 08:40:32 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 26/45] hw/pci-bridge/pxb: Fix missing swizzle
Message-ID: <20220304133556.233983-27-mst@redhat.com>
References: <20220304133556.233983-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220304133556.233983-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jonathan Cameron <jonathan.cameron@huawei.com>

pxb_map_irq_fn() handled the necessary removal of the swizzle
applied to the PXB interrupts by the bus to which it was attached
but neglected to apply the normal swizzle for PCI root ports
on the expander bridge.

Result of this was on ARM virt, the PME interrupts for a second
RP on a PXB instance were miss-routed to #45 rather than #46.

Tested with a selection of different configurations with 1 to 5
RP per PXB instance.  Note on my x86 test setup the PME interrupts
are not triggered so I haven't been able to test this.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Message-Id: <20220118174855.19325-1-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci-bridge/pci_expander_bridge.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index 10e6e7c2ab..de932286b5 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -192,6 +192,12 @@ static int pxb_map_irq_fn(PCIDevice *pci_dev, int pin)
 {
     PCIDevice *pxb = pci_get_bus(pci_dev)->parent_dev;
 
+    /*
+     * First carry out normal swizzle to handle
+     * multple root ports on a pxb instance.
+     */
+    pin = pci_swizzle_map_irq_fn(pci_dev, pin);
+
     /*
      * The bios does not index the pxb slot number when
      * it computes the IRQ because it resides on bus 0
-- 
MST



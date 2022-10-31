Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABB36137B3
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:19:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUIR-0002RP-4l; Mon, 31 Oct 2022 08:53:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUI3-0008Ue-GJ
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:53:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUI1-00032o-ML
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:53:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MtEUbBVVYdPzeiTU39HNTaDMuOUKjIcjW007vq8qqcw=;
 b=JYJcTGKtFdzMagh5Z6YaNgA8+KlrLAKGkWdoMarFmraG6ka/TO6UinY4gScycOUOwZiTd5
 e36ZgzqpqZJu7TS8T9hO3uSHjHLPZqVEFTbInZNpiLdmk7O8gMom32KBxBB0yko925rWvk
 DbWN6RKCNRKNt51SPLqwq7finfUmOf4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-501-npUxjBQ0OLe-f_FoeWS29w-1; Mon, 31 Oct 2022 08:53:14 -0400
X-MC-Unique: npUxjBQ0OLe-f_FoeWS29w-1
Received: by mail-wm1-f72.google.com with SMTP id
 v188-20020a1cacc5000000b003cf76c4ae66so474529wme.7
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:53:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MtEUbBVVYdPzeiTU39HNTaDMuOUKjIcjW007vq8qqcw=;
 b=x+sQ3bgcq3gpk1JdIBUk7wrx1alSjOL2IBbuS7RDQAFtbZw1e57mjV+YapBnyjgC7W
 lo+IvQC1jj+U6ggsVtfZllF0nJmTSPOcV9UFTNe3TzzeE+zvt4J2BEY2XNGT9VX7TMtm
 NFG23gVvL567C3FOUf2xycF/pk20papYnmTMvksnAbNb7vt4GhoX0eCNKewDcAzzkrIo
 v5EsguWnaf/tAb5wXFx6IMve1DdBdkxuTF/RVNBJn6i8E0s58LC6FfBsDJpESMBzUqgb
 /erZqGjz+xJJ7oGvbiwqmtfe83HJcILKzX4tkmEUxTQDCdMGFqKSP6TaFWXgcTcV4bvf
 gz1w==
X-Gm-Message-State: ACrzQf2N3lEkZMHG8loihD4lMSl83vSCDneO1d95QWpATvw3v+Rii0ku
 koAFsoUj0RxmKtN5cwBvWZgtq+HdREZJDRennkP2A7q9iyYdV3tzG8+GTWvgR/8LjVhYY/W2y9C
 g4NS7lQUrW9vJgNnzb1yxBeP7AF20xCxgqzwBNheLO8KEnPpZTl/eHP5Aqvsa
X-Received: by 2002:adf:e5cf:0:b0:236:86e4:cbc3 with SMTP id
 a15-20020adfe5cf000000b0023686e4cbc3mr7924133wrn.135.1667220793167; 
 Mon, 31 Oct 2022 05:53:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5RNJHoVyfI+2xwMRBsNHd/PzJVgR5rEpXeJ/1VhxMYSKhLbcw5tcB+Nzz9wHrcebs5E/AzHA==
X-Received: by 2002:adf:e5cf:0:b0:236:86e4:cbc3 with SMTP id
 a15-20020adfe5cf000000b0023686e4cbc3mr7924112wrn.135.1667220792907; 
 Mon, 31 Oct 2022 05:53:12 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 f18-20020a1cc912000000b003cf5ec79bf9sm7218362wmb.40.2022.10.31.05.53.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:53:12 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:53:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Daney <david.daney@fungible.com>,
 Marcin Nowakowski <marcin.nowakowski@fungible.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@fungible.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PULL 52/86] virtio-rng-pci: Allow setting nvectors, so we can use
 MSI-X
Message-ID: <20221031124928.128475-53-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: David Daney <david.daney@fungible.com>

Most other virtio-pci devices allow MSI-X, let's have it for rng too.

Signed-off-by: David Daney <david.daney@fungible.com>
Reviewed-by: Marcin Nowakowski <marcin.nowakowski@fungible.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@fungible.com>
Message-Id: <20221014160947.66105-1-philmd@fungible.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-rng-pci.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hw/virtio/virtio-rng-pci.c b/hw/virtio/virtio-rng-pci.c
index 151ece6f94..6e76f8b57b 100644
--- a/hw/virtio/virtio-rng-pci.c
+++ b/hw/virtio/virtio-rng-pci.c
@@ -13,6 +13,7 @@
 
 #include "hw/virtio/virtio-pci.h"
 #include "hw/virtio/virtio-rng.h"
+#include "hw/qdev-properties.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
 #include "qom/object.h"
@@ -31,11 +32,23 @@ struct VirtIORngPCI {
     VirtIORNG vdev;
 };
 
+static Property virtio_rng_properties[] = {
+    DEFINE_PROP_BIT("ioeventfd", VirtIOPCIProxy, flags,
+                    VIRTIO_PCI_FLAG_USE_IOEVENTFD_BIT, true),
+    DEFINE_PROP_UINT32("vectors", VirtIOPCIProxy, nvectors,
+                       DEV_NVECTORS_UNSPECIFIED),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void virtio_rng_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
 {
     VirtIORngPCI *vrng = VIRTIO_RNG_PCI(vpci_dev);
     DeviceState *vdev = DEVICE(&vrng->vdev);
 
+    if (vpci_dev->nvectors == DEV_NVECTORS_UNSPECIFIED) {
+        vpci_dev->nvectors = 2;
+    }
+
     if (!qdev_realize(vdev, BUS(&vpci_dev->bus), errp)) {
         return;
     }
@@ -54,6 +67,7 @@ static void virtio_rng_pci_class_init(ObjectClass *klass, void *data)
     pcidev_k->device_id = PCI_DEVICE_ID_VIRTIO_RNG;
     pcidev_k->revision = VIRTIO_PCI_ABI_VERSION;
     pcidev_k->class_id = PCI_CLASS_OTHERS;
+    device_class_set_props(dc, virtio_rng_properties);
 }
 
 static void virtio_rng_initfn(Object *obj)
-- 
MST



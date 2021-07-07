Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD5D3BEA59
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 17:06:20 +0200 (CEST)
Received: from localhost ([::1]:60276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m197z-0007pY-3O
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 11:06:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m1952-0000ao-U4
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 11:03:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m1951-0006bS-BE
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 11:03:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625670194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VfGQ0+aix5AhLvVJQJkbLlqWh4uMrGYeT1y/Vk/0x84=;
 b=Zf6fnTa/G1zQzn0gCgtRk9HAHM3XOkQO0G0F1GSvKuKXvUuAQ8iddwHvtIFPL2TDkzFB6y
 UM8mkf1fUWMtDmghMMve25IlG1F9sbPFTQO8/3SkMKRnpuF4gwdWivYiYervVob9Y8yGV1
 ujyqupgF6nSsVuG2X8k69dEg1JfBjL4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-JeyikNbiNcOwvrlhq9LElg-1; Wed, 07 Jul 2021 11:03:11 -0400
X-MC-Unique: JeyikNbiNcOwvrlhq9LElg-1
Received: by mail-wr1-f72.google.com with SMTP id
 h11-20020adffa8b0000b029013a357d7bdcso495664wrr.18
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 08:03:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VfGQ0+aix5AhLvVJQJkbLlqWh4uMrGYeT1y/Vk/0x84=;
 b=cfemNxWbPPcaM/J3o9zYI1PuyvJceFkd5X8dM7Q5/MxbKV3e9S/9KLroB7mqZKBJ3w
 r33hDWv0zxOqRBl+xbnYsW2/u0xuq6paaJEzKNaKpOTUK2oO7YMdjkmqBbmvaZl5Hc/5
 mNVNbC82w6ApXk8cabU72eOLuLE0/CTAqrPVF6CqK7hVHLuEJf8Mxy3NMVyuxziI5eSU
 OlF0zj9gprNeF9A5eTiwvff7EdG6V0UJmzmTCtBJkeV/66HrEO4vZG7DllizYLNpxJNj
 IS+LDJRC4yAIgUT6fYeXmNLozs4d8y/O8pBZaM+q4/I2Cl/Ctg1yJo3BaNuk/VPRCahS
 /vwQ==
X-Gm-Message-State: AOAM530tDYTYY4k9S1e4agb2QabZIbMvAVLchtdFaG20o6FUFYmjjyo4
 SKcFKqBOfTmUdnc5PYopCA1yIdlx3AQtjPcaOgglFfC/IFjTf9VLMv1xnDaEVydMHBRjI8Fhvh4
 vfgj3yKFQ6yZwEwhmAJL57D6ZtPfBzjEYNaPnRCBXudrYz+ifSXhi2zGAHlRh
X-Received: by 2002:a1c:ed0a:: with SMTP id l10mr27509657wmh.151.1625670189719; 
 Wed, 07 Jul 2021 08:03:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7iAQxWLhlmeAwmnGY8gbb9Ad34SMFfuVOhaiA8QY1H1rSfVjdJc2IIDdBMPxTJ+7GgUpvQw==
X-Received: by 2002:a1c:ed0a:: with SMTP id l10mr27509616wmh.151.1625670189441; 
 Wed, 07 Jul 2021 08:03:09 -0700 (PDT)
Received: from redhat.com ([2.55.150.102])
 by smtp.gmail.com with ESMTPSA id x19sm2060540wmi.10.2021.07.07.08.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 08:03:09 -0700 (PDT)
Date: Wed, 7 Jul 2021 11:03:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/13] virtio-pci: Added check for virtio device presence in
 mm callbacks.
Message-ID: <20210707150157.52328-5-mst@redhat.com>
References: <20210707150157.52328-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210707150157.52328-1-mst@redhat.com>
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
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Andrew Melnychenko <andrew@daynix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew Melnychenko <andrew@daynix.com>

During unplug the virtio device is unplugged from virtio-bus on pci. In some cases,
requests to virtio-pci mm may acquire during/after unplug. Added check that virtio
device is on the bus, for "common" memory region.

Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
Message-Id: <20210609095843.141378-2-andrew@daynix.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-pci.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index f1e105fa52..1bef7a2be8 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1147,6 +1147,10 @@ static uint64_t virtio_pci_common_read(void *opaque, hwaddr addr,
     uint32_t val = 0;
     int i;
 
+    if (vdev == NULL) {
+        return UINT64_MAX;
+    }
+
     switch (addr) {
     case VIRTIO_PCI_COMMON_DFSELECT:
         val = proxy->dfselect;
@@ -1230,6 +1234,10 @@ static void virtio_pci_common_write(void *opaque, hwaddr addr,
     VirtIOPCIProxy *proxy = opaque;
     VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
 
+    if (vdev == NULL) {
+        return;
+    }
+
     switch (addr) {
     case VIRTIO_PCI_COMMON_DFSELECT:
         proxy->dfselect = val;
-- 
MST



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3770F3BEA5A
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 17:06:39 +0200 (CEST)
Received: from localhost ([::1]:33532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m198I-0000Mb-8b
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 11:06:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m1954-0000iz-R2
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 11:03:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m1953-0006bq-81
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 11:03:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625670196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r8YtJo3PAzaP/cJrC4HQaYAbQLl82vsk2k1/IS5JPV8=;
 b=M4zCMrBwpYXonMN3yrsVgiy7VzUzgS9ggcRLBnMC2ao+MQOBEk5h7l1/HmC0IQyCEookZv
 bHjtfYjmtdYNW/QRf8gPocNcN7Ia8XPc/6yN6O4QQoPJR44wt4cYKxKiPVKI1ufFOkNe6O
 jq+p00iHBNFn4fVGk5GLXR3OK+lQlbg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-6rZL2uGyOTOetLOfy6tB1w-1; Wed, 07 Jul 2021 11:03:15 -0400
X-MC-Unique: 6rZL2uGyOTOetLOfy6tB1w-1
Received: by mail-wr1-f71.google.com with SMTP id
 h104-20020adf90710000b029010de8455a3aso874446wrh.12
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 08:03:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=r8YtJo3PAzaP/cJrC4HQaYAbQLl82vsk2k1/IS5JPV8=;
 b=VGyMmQAH7M6GjPaEFqIRqeDf0w9r3dP1ZR7+EDSPea/RqUBR0cvZ2LfWDYzRswtfTA
 OHWmjqku6iDqnDF/r5aIhdMaE+YPvaSjnkAOt855+WmAKHXn6WBVbmwKvl5G7GPx8Xk4
 Z5v6/jKL68vr4zuwOTFX2SIyRiLfIQhMKvOCmVroyMO1ld1GLrbf5HYHbefCw473z+2R
 vtlB7olv+4Lk2GXXbeYWNl1nGYKz+YmTUhSfBT9qunuFJih2CcP551a78rjw3TQQ/OSt
 jHnpgsIKw2zHTTWPAU3I5380E74QKzh99tYDnvJoc1FChh0mwXphjCahonVVahnRSd9A
 Xz9g==
X-Gm-Message-State: AOAM532c69yVSw237FiZD2M8jvSLcmZ0WzVD1YXlx4IYk+a3ZEzkvyFv
 Cg0ZMuN64ekdsiyWg5Othjq3q9swpf1o2KZmdrEQhuh8wRuaVLlTaOZdx4vhCoIx+ETzWbKOUkE
 hYgyTJp9mLi+HoCpelzgi7eL/H+CQC2W9b/bWQYmHe0/1I2l8B+T5K2dDdeZo
X-Received: by 2002:adf:eb82:: with SMTP id t2mr28360113wrn.337.1625670193964; 
 Wed, 07 Jul 2021 08:03:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3YbU1uyMgKlXwm1wvne+ZvzCa8rn8EYiuLKM7Ph+PG2lZE7ckG9xkeuKVwmoMf1uy0/qHuQ==
X-Received: by 2002:adf:eb82:: with SMTP id t2mr28360091wrn.337.1625670193767; 
 Wed, 07 Jul 2021 08:03:13 -0700 (PDT)
Received: from redhat.com ([2.55.150.102])
 by smtp.gmail.com with ESMTPSA id h15sm19984573wrq.88.2021.07.07.08.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 08:03:13 -0700 (PDT)
Date: Wed, 7 Jul 2021 11:03:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/13] virtio-pci: Added check for virtio device in PCI config
 cbs.
Message-ID: <20210707150157.52328-6-mst@redhat.com>
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

Now, if virtio device is not present on virtio-bus - pci config callbacks
will not lead to possible crush. The read will return "-1" which should be
interpreted by a driver that pci device may be unplugged.

Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
Message-Id: <20210609095843.141378-3-andrew@daynix.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-pci.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 1bef7a2be8..c0d9c47df7 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -424,6 +424,11 @@ static uint64_t virtio_pci_config_read(void *opaque, hwaddr addr,
     VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
     uint32_t config = VIRTIO_PCI_CONFIG_SIZE(&proxy->pci_dev);
     uint64_t val = 0;
+
+    if (vdev == NULL) {
+        return UINT64_MAX;
+    }
+
     if (addr < config) {
         return virtio_ioport_read(proxy, addr);
     }
@@ -455,6 +460,11 @@ static void virtio_pci_config_write(void *opaque, hwaddr addr,
     VirtIOPCIProxy *proxy = opaque;
     uint32_t config = VIRTIO_PCI_CONFIG_SIZE(&proxy->pci_dev);
     VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
+
+    if (vdev == NULL) {
+        return;
+    }
+
     if (addr < config) {
         virtio_ioport_write(proxy, addr, val);
         return;
-- 
MST



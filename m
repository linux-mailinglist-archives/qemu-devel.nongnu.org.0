Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82017132B33
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 17:37:27 +0100 (CET)
Received: from localhost ([::1]:52778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iorrC-0005a4-1p
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 11:37:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46731)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1iorlA-0007zm-Da
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 11:31:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1iorl9-0005T0-5c
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 11:31:12 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:53001
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1iorl9-0005RF-1O
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 11:31:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578414668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=75DSOPWG53BQMc2DQp8pZrGaf6WLAio2xZatEQc8yH4=;
 b=NwCOXtFjWowvxj6PnY7VkhZKmzjf+UPSrUgG6npMsJzDQ2gjnFSzxS1sbnRz3vy2cBhlAh
 VQJz84M5vHx+LDizxTgJnIunPTx/1wWvxx3zJQaLWsqt0I65yVStlUFMput5hcfFBIWa0b
 IVumAC9eqt6AOoJNoqXVYbaMmjl2oSg=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-sheGaT3jPIuVOC1QUVkmVA-1; Tue, 07 Jan 2020 11:31:07 -0500
Received: by mail-qk1-f200.google.com with SMTP id u10so160547qkk.1
 for <qemu-devel@nongnu.org>; Tue, 07 Jan 2020 08:31:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ilfUa7pwbD2DsrhFhXRw/VkM07xbn4jtSmYjKOWR/YA=;
 b=tcE3lyNXE+oUXzCGaNFFF1tyuTlECIQK3f/FtLMfyK0PdOzYWOP5mnbWm+zLqjF+4N
 1O3b2TyXPvBd7ixSreqGnLFf4ebcfDTE519qZZbKzsKGfptLyalCACeq2pIzEztgdzQP
 x2mK+Eu/0bZa/B4uIpyDImudF6fi/iH3BP/JskqllG4cPou9ED/91Zh6Dsfra1w6/sqe
 q5QjqAt4n6w5ggCH3OioJFGFUzoWvj6eoOyloZ9a31qUFgPj9sr3AXvRIyywgXdYBj1+
 pK2Zhtl8/+xv1yxySxcp9uwUtewLdhvfWzucsiFaZtLdzm3srUdy0TD/bJSbWXIrDYCP
 HH8w==
X-Gm-Message-State: APjAAAVtXThG9u7qOu5Z7wBMWqdrRI1/Twfe+cl2o69d3F25jNi7mPz6
 Hx/tpYqdNgpl7XTUTEQzQxxEhkt+qwXODoLEqYTAauMu2FWk78jiDKJACeahP8DHF2JTgLMDrBo
 qu9HJtg/r7p7D4eI=
X-Received: by 2002:a0c:9e6d:: with SMTP id z45mr217804qve.65.1578414666250;
 Tue, 07 Jan 2020 08:31:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqwYk1zSLoynRO0i+iVI6DIIR+BbhIy0qAJK6peA5xTlEWqkTHYCWKxAXrd8ILo8K74v61CyqQ==
X-Received: by 2002:a0c:9e6d:: with SMTP id z45mr217786qve.65.1578414666026;
 Tue, 07 Jan 2020 08:31:06 -0800 (PST)
Received: from redhat.com (bzq-79-183-34-164.red.bezeqint.net. [79.183.34.164])
 by smtp.gmail.com with ESMTPSA id 13sm28573qke.85.2020.01.07.08.31.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 08:31:05 -0800 (PST)
Date: Tue, 7 Jan 2020 11:31:02 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 20/32] virtio-mmio: Clear v2 transport state on soft reset
Message-ID: <20200107162850.411448-21-mst@redhat.com>
References: <20200107162850.411448-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200107162850.411448-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-MC-Unique: sheGaT3jPIuVOC1QUVkmVA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Sergio Lopez <slp@redhat.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

At the moment when the guest writes a status of 0, we only reset the
virtio core state but not the virtio-mmio state. The virtio-mmio
specification says (v1.1 cs01, 4.2.2.1 Device Requirements:
MMIO Device Register Layout):

    Upon reset, the device MUST clear all bits in InterruptStatus and
    ready bits in the QueueReady register for all queues in the device.

The core already takes care of InterruptStatus by clearing isr, but we
still need to clear QueueReady.

It would be tempting to clean all registers, but since the specification
doesn't say anything more, guests could rely on the registers keeping
their state across reset. Linux for example, relies on this for
GuestPageSize in the legacy MMIO tranport.

Fixes: 44e687a4d9ab ("virtio-mmio: implement modern (v2) personality (virti=
o-1)")
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Message-Id: <20191213095410.1516119-1-jean-philippe@linaro.org>
Reviewed-by: Sergio Lopez <slp@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-mmio.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
index 94d934c44b..ef40b7a9b2 100644
--- a/hw/virtio/virtio-mmio.c
+++ b/hw/virtio/virtio-mmio.c
@@ -65,6 +65,19 @@ static void virtio_mmio_stop_ioeventfd(VirtIOMMIOProxy *=
proxy)
     virtio_bus_stop_ioeventfd(&proxy->bus);
 }
=20
+static void virtio_mmio_soft_reset(VirtIOMMIOProxy *proxy)
+{
+    int i;
+
+    if (proxy->legacy) {
+        return;
+    }
+
+    for (i =3D 0; i < VIRTIO_QUEUE_MAX; i++) {
+        proxy->vqs[i].enabled =3D 0;
+    }
+}
+
 static uint64_t virtio_mmio_read(void *opaque, hwaddr offset, unsigned siz=
e)
 {
     VirtIOMMIOProxy *proxy =3D (VirtIOMMIOProxy *)opaque;
@@ -378,6 +391,7 @@ static void virtio_mmio_write(void *opaque, hwaddr offs=
et, uint64_t value,
=20
         if (vdev->status =3D=3D 0) {
             virtio_reset(vdev);
+            virtio_mmio_soft_reset(proxy);
         }
         break;
     case VIRTIO_MMIO_QUEUE_DESC_LOW:
--=20
MST



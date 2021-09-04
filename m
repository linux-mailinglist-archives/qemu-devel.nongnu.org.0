Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B70F400D30
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 23:48:33 +0200 (CEST)
Received: from localhost ([::1]:48462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMdWa-0001A2-J0
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 17:48:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdL8-0005GX-FQ
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:36:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdL6-00016u-Cl
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:36:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630791399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pfB4Y9HSTQVin+i7dr55RoRMesM0x0vA9aYgJNYKXbs=;
 b=Lqfo4p0In378R5XYjl0+dJejAM4rNR/zi319/J2iQNq0b3e6MmLDyoZ+RKSql0GnNWb8MH
 3ZmmSGLEg6XRU3k5J9nsKcDM4ABbgw6p1PDdsCYbe+JvPD4WVf4IvFZuGk9qmvhwxNRb7D
 Q8RFtFdAiiDSczguL48t6PtmWvF+h20=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-_xWYaAWBOSiXo9H-j-339g-1; Sat, 04 Sep 2021 17:36:38 -0400
X-MC-Unique: _xWYaAWBOSiXo9H-j-339g-1
Received: by mail-ej1-f71.google.com with SMTP id
 m18-20020a170906849200b005c701c9b87cso862062ejx.8
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 14:36:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pfB4Y9HSTQVin+i7dr55RoRMesM0x0vA9aYgJNYKXbs=;
 b=SgRbp63KJhQFysPw45j6BNdH1w1WVRWfwNzLqCxrWiXzRhNUJeZojwmkR9SBOFZayV
 LpmOYxyFrfnnlkQaIfzb2aKJkQs7upqv9gkwh8q4QeyGK7Pyj2qn5Troqwvjqqa2VOz0
 LZeDXSFL76SNcsALbS1DXc7yPVO1USCpzZZykaUWbziaQWjmkWxu81CopI8+Zck7jJPt
 aZGGZQUAF+4qgsp7U8LAHnkDdh5Cmgzz/ee9VqAeaPxvCJbT6DLM3otFq/4Sw4Issg7X
 iHtAkVd4NLf1j9Rr7jkEZHIVGRPn9O2L0n7O/1zlMKHnnADhi48I1ysWPugBxOwPMWw+
 AfKQ==
X-Gm-Message-State: AOAM530bRp9zAsvKL1YyMHRiGFtptUrf4GPPvrCslLSFwfPPJ8JpKqoH
 z737C4/rAaB/0OuqY8gku7RMZe9/EZ9lOV452G5QsSGxCRYkR2qWlW0XXd6LRHIVRupEUb3T00y
 DMXiDu5lnnbX6Px9NnCCeeqPsNfWW/CZ0RfZUlZnwK9x/C3k4SKp7tFo0cuSL
X-Received: by 2002:a50:9a84:: with SMTP id p4mr5963708edb.189.1630791396989; 
 Sat, 04 Sep 2021 14:36:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzcPIJJ5BqzOY9+w03uWscaL5Wonqz2qjvYryPngN7Eitm/NUJIvvjjKiVdvKmgF4w8F0ZdQ==
X-Received: by 2002:a50:9a84:: with SMTP id p4mr5963691edb.189.1630791396750; 
 Sat, 04 Sep 2021 14:36:36 -0700 (PDT)
Received: from redhat.com ([2.55.150.176])
 by smtp.gmail.com with ESMTPSA id f26sm1888071eds.90.2021.09.04.14.36.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 14:36:36 -0700 (PDT)
Date: Sat, 4 Sep 2021 17:36:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/35] virtio-bus: introduce iommu_enabled()
Message-ID: <20210904213506.486886-14-mst@redhat.com>
References: <20210904213506.486886-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210904213506.486886-1-mst@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jason Wang <jasowang@redhat.com>

This patch introduce a new method for the virtio-bus for the transport
to report whether or not the IOMMU is enabled for the device.

Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20210804034803.1644-2-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/virtio-bus.h |  4 +++-
 hw/virtio/virtio-bus.c         | 14 ++++++++++++++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/include/hw/virtio/virtio-bus.h b/include/hw/virtio/virtio-bus.h
index ef8abe49c5..7ab8c9dab0 100644
--- a/include/hw/virtio/virtio-bus.h
+++ b/include/hw/virtio/virtio-bus.h
@@ -93,6 +93,7 @@ struct VirtioBusClass {
      */
     bool has_variable_vring_alignment;
     AddressSpace *(*get_dma_as)(DeviceState *d);
+    bool (*iommu_enabled)(DeviceState *d);
 };
 
 struct VirtioBusState {
@@ -154,5 +155,6 @@ void virtio_bus_release_ioeventfd(VirtioBusState *bus);
 int virtio_bus_set_host_notifier(VirtioBusState *bus, int n, bool assign);
 /* Tell the bus that the ioeventfd handler is no longer required. */
 void virtio_bus_cleanup_host_notifier(VirtioBusState *bus, int n);
-
+/* Whether the IOMMU is enabled for this device */
+bool virtio_bus_device_iommu_enabled(VirtIODevice *vdev);
 #endif /* VIRTIO_BUS_H */
diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
index 859978d248..d23db98c56 100644
--- a/hw/virtio/virtio-bus.c
+++ b/hw/virtio/virtio-bus.c
@@ -325,6 +325,20 @@ static char *virtio_bus_get_fw_dev_path(DeviceState *dev)
     return NULL;
 }
 
+bool virtio_bus_device_iommu_enabled(VirtIODevice *vdev)
+{
+    DeviceState *qdev = DEVICE(vdev);
+    BusState *qbus = BUS(qdev_get_parent_bus(qdev));
+    VirtioBusState *bus = VIRTIO_BUS(qbus);
+    VirtioBusClass *klass = VIRTIO_BUS_GET_CLASS(bus);
+
+    if (!klass->iommu_enabled) {
+        return false;
+    }
+
+    return klass->iommu_enabled(qbus->parent);
+}
+
 static void virtio_bus_class_init(ObjectClass *klass, void *data)
 {
     BusClass *bus_class = BUS_CLASS(klass);
-- 
MST



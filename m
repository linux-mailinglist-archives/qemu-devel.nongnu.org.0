Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 133F930C3E6
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 16:35:45 +0100 (CET)
Received: from localhost ([::1]:56764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6xiR-0000MP-Rh
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 10:35:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l6xM7-000842-Rk
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:12:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l6xM6-0006lc-4U
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:12:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612278757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0YVwlnyhma8tw3aikrEQmkUKeFTYcxGuyLeIpvMJSOU=;
 b=PGmyiEev0oQVtKuWguEjkRC3br4bY7cRaLNrj6NffUcTQDU6SPNaW/o93EoeU1RASiZYff
 8myrgyKbIA0kJCn+YwJj2M0a/X9/f5jbsYOZ9IUpFLa2M8EsufEq3gDAZdKVVD/JLGWsii
 WYuUxjr0ZNh/tY0MFhEWBtN8dJOFKMk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-AewCk8wDM2yNFedj7aUPMw-1; Tue, 02 Feb 2021 10:12:34 -0500
X-MC-Unique: AewCk8wDM2yNFedj7aUPMw-1
Received: by mail-wm1-f72.google.com with SMTP id f6so1089468wmj.5
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 07:12:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0YVwlnyhma8tw3aikrEQmkUKeFTYcxGuyLeIpvMJSOU=;
 b=h+k0BWMQkSsNuAiBOXidimsG6UFjcHDk1tLzjNIDx+z2wzy5PtjoVsgbz/2CJzw92A
 QXfNEImZ62VrB3dVshTl43Z+lGdBo9mpmLGFiYubjc9hGLxPQq4aICHOo6rcPAz9+QaT
 rFzyUq/e2AeIAV0aGd3Km5N/ldXXcNnysTN5zEQedYMexQeUkw95YEOvGBIb072OYDXm
 VpMYGoM68x3bRwfy78V2B7/Afrsx5kl4Pqxzmjbyv7al+Z6+VS//kh9z0tjPZ3zhdyWf
 0u6tGu6j4WbrnAVtsgaiw9HawclFQSSEbuIOo8J+sckO37eN8OFlp7icamUO+K4VPBBv
 7Pkg==
X-Gm-Message-State: AOAM530F2Q2twf/YcFjjW8CM4VWzh1eb3vOuuOi9EKfdf5m/DUp+xPPM
 p/DMQhEp619yrBkn+F5psvOW43BwcG0qerpqvt25+5Fe8mh/kyLq+mEvjMyFNFIybr2EzQOKvaY
 JvOuqDX7aO9zS2JxGYU8+cuPnyukJpRC2JcUJ81k6toQoOffdMbhgQuff32Gh
X-Received: by 2002:a5d:5112:: with SMTP id s18mr23911608wrt.267.1612278752442; 
 Tue, 02 Feb 2021 07:12:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyfg7nlsaY7tlpR8jbbUTo09gL0jzZe3a+6L4Wonk9c8HHMf2YS7Rjk6QEpRWooCszZm98Umw==
X-Received: by 2002:a5d:5112:: with SMTP id s18mr23911578wrt.267.1612278752134; 
 Tue, 02 Feb 2021 07:12:32 -0800 (PST)
Received: from redhat.com (bzq-79-177-39-148.red.bezeqint.net. [79.177.39.148])
 by smtp.gmail.com with ESMTPSA id o18sm3525878wmh.20.2021.02.02.07.12.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 07:12:31 -0800 (PST)
Date: Tue, 2 Feb 2021 10:12:29 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/9] virtio-mmio: fix guest kernel crash with SHM regions
Message-ID: <20210202151116.1573669-3-mst@redhat.com>
References: <20210202151116.1573669-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210202151116.1573669-1-mst@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <laurent@vivier.eu>

In the kernel, virtio_gpu_init() uses virtio_get_shm_region()
since
commit 6076a9711dc5 ("drm/virtio: implement blob resources: probe for host visible region")
but vm_get_shm_region() unconditionally uses VIRTIO_MMIO_SHM_SEL to
get the address and the length of the region.

commit 38e895487afc ("virtio: Implement get_shm_region for MMIO transport"

As this is not implemented in QEMU, address and length are 0 and passed
as is to devm_request_mem_region() that triggers a crash:

  [drm:virtio_gpu_init] *ERROR* Could not reserve host visible region
  Unable to handle kernel NULL pointer dereference at virtual address (ptrval)

According to the comments in the kernel, a non existent shared region
has a length of (u64)-1.

This is what we return now with this patch to disable the region.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20201220163539.2255963-1-laurent@vivier.eu>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-mmio.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
index e1b5c3b81e..610661d6a5 100644
--- a/hw/virtio/virtio-mmio.c
+++ b/hw/virtio/virtio-mmio.c
@@ -191,6 +191,14 @@ static uint64_t virtio_mmio_read(void *opaque, hwaddr offset, unsigned size)
             return 0;
         }
         return vdev->generation;
+   case VIRTIO_MMIO_SHM_LEN_LOW:
+   case VIRTIO_MMIO_SHM_LEN_HIGH:
+        /*
+         * VIRTIO_MMIO_SHM_SEL is unimplemented
+         * according to the linux driver, if region length is -1
+         * the shared memory doesn't exist
+         */
+        return -1;
     case VIRTIO_MMIO_DEVICE_FEATURES_SEL:
     case VIRTIO_MMIO_DRIVER_FEATURES:
     case VIRTIO_MMIO_DRIVER_FEATURES_SEL:
-- 
MST



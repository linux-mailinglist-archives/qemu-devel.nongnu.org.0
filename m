Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C363310CFF
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 16:11:44 +0100 (CET)
Received: from localhost ([::1]:52868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l82lr-0002GT-Kp
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 10:11:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l82eG-0003gr-PB
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:03:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l82eE-0002wF-74
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:03:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612537429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0YVwlnyhma8tw3aikrEQmkUKeFTYcxGuyLeIpvMJSOU=;
 b=EqNeaZ+b4qXcXkWmkZjqNT2vAdoGgpXHEnWgmosv5FpwjII95zI/b31M2taVuY5nD5Xrma
 CFDQI1rZywluuKEaPOiqLe+8pCYfS3gm3NPeWqkDkitH0y06WlFx2+qmzqIChF9VdCJosx
 LrRgiHK9fD5aFfGicqea/E6mjjx8Htk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-jEhGuVdHMtGuKn6avrIWHA-1; Fri, 05 Feb 2021 10:03:45 -0500
X-MC-Unique: jEhGuVdHMtGuKn6avrIWHA-1
Received: by mail-ej1-f72.google.com with SMTP id yh28so6907615ejb.11
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 07:03:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0YVwlnyhma8tw3aikrEQmkUKeFTYcxGuyLeIpvMJSOU=;
 b=ZOk5hsgASvvVNbGsILZgFvRFwKEfUsUZ6J6zPvI+jU9+j2g6YwfizytuxoJc8rBwj7
 CNVP1d6nS7cWfslxgahaFcfgwhI7+p3fU3P03QcxaeohhsFhKYu32+qeFCknfmMXTbMf
 z8kKiWMB9GlY+QC5wOYgzWbLY7diQ3LW3S78JTI/hhyD6tXqEhqZ7EKZGCftXHSb/6Yj
 AZLzVeqP1TAmHs8YOqbwHsAllzmolJjjh1WfPy94zAx0zhrYHEy/NFG3MlKihJQagE03
 1jjwhXPbI7t33K3fJUhmVRWjnw0a5MIh2pjDIzByx66j9m6TIvZfq7BHlQFJdGYIVCPJ
 xBXQ==
X-Gm-Message-State: AOAM532JF5c6kQh9ine3ZZ2sGWwJch+Eusk3NZ50NzoK7DpIDHlYKF57
 czD+DduDfMrS1thB+8re24/tPCvMlM/M6S2ac9iXYe7YUuzRKFWPaoSRfrKGffhJW8yeEvydCoY
 46PDdcFQBjYzFKPhh1hr7PxTkVEKley+wmdHC451oSRF9JvDUEYdHe2Mw+mqN
X-Received: by 2002:a50:bf4a:: with SMTP id g10mr3759973edk.201.1612537423776; 
 Fri, 05 Feb 2021 07:03:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBBrxNGYfwiVbSab/8GAANM2FFTaEMhekLRBWouXRJNuNvq5AjR2EVFCMWymsGI+Ho1W4LzA==
X-Received: by 2002:a50:bf4a:: with SMTP id g10mr3759944edk.201.1612537423494; 
 Fri, 05 Feb 2021 07:03:43 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id l12sm2068012edn.83.2021.02.05.07.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 07:03:42 -0800 (PST)
Date: Fri, 5 Feb 2021 10:03:41 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 04/16] virtio-mmio: fix guest kernel crash with SHM regions
Message-ID: <20210205150135.94643-5-mst@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
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



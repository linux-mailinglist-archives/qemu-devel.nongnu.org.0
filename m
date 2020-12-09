Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D5B2D48C9
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 19:18:53 +0100 (CET)
Received: from localhost ([::1]:35854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn43A-0000jJ-VY
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 13:18:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3rw-0001X9-NH
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:07:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3rt-0007k8-HX
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:07:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bcDsWwFf1VSLW/JLtS3fVtqy9UgBR89UFwruerLljvk=;
 b=gf3xzncJi1vFF+a9twzk8Ef5ir5ZbAUHBdMg7M658KdNYcdyS3bx/kvafTRv4lVifr4X/1
 Ry+RWabhqt9VAnXuFOlSGk1HBggMtDn406oeRVu0/1LfDtNdU/BWUOLuVuyFD7Z9iIgrGo
 t/ibJSGDiL3Suj+yQPfuMqXcnF4o91o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-wwYqJV0aOyC5msfTjSEKgA-1; Wed, 09 Dec 2020 13:07:10 -0500
X-MC-Unique: wwYqJV0aOyC5msfTjSEKgA-1
Received: by mail-wm1-f72.google.com with SMTP id a134so638287wmd.8
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:07:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bcDsWwFf1VSLW/JLtS3fVtqy9UgBR89UFwruerLljvk=;
 b=G2WUh9hk6lM8woHrKVLidvnCGGVy18EyrZ0859ASAW3PzxFeDRIaIi600a7hL8pKzC
 8FpaVJgNrfTmkIj7murpJajRAmTJ+rNFMdH07Snedh4ixypw61Mb/of3fllBSf/elO5y
 P1qKLNrKheS92EjmOhQqH9Rykk3IafgPD0AuRaUeQE9DjRaFnVXfbhZu351OhvfESDsE
 Rp56+/12/kHcveG8+I+tJ9HyhQOf64XNwweIa4ZRf9q5kF/DQnxdseg21NiF/kmdTloU
 SGlSVLw/YNTYyioBzhhhaaFiTBcSiAJ+xj60lVmz5ppyYGfk6Z9eBF9aqyY3k/S0JzEl
 yZ0g==
X-Gm-Message-State: AOAM532bJ/wl0gj/RL+MQHG0h4p54rbOtlvyNt/0jTyNTWEmnjwQdohZ
 QCbVfIa9Yh1Yb9nVXQmZVCy739HC8tE86yUFMbDg2SVWNVwG3BBSJz0LKoPuOX8jt2zjC82mJoA
 Jog/JQP87/08UQRHSu1OcOs3N/i1DqZiN4UU7YrVWhnityGptYKxCEcpuhW3Z
X-Received: by 2002:adf:ce84:: with SMTP id r4mr3966802wrn.91.1607537229052;
 Wed, 09 Dec 2020 10:07:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzhWa02DiXCxtQKBYRYJj9v4XnFG7sDwQbM6OeD/fCb24WJzn0RaLvu0P/XDS6W8E6TqgQo0A==
X-Received: by 2002:adf:ce84:: with SMTP id r4mr3966778wrn.91.1607537228856;
 Wed, 09 Dec 2020 10:07:08 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id j7sm4472359wmb.40.2020.12.09.10.07.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:07:08 -0800 (PST)
Date: Wed, 9 Dec 2020 13:07:06 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 07/65] virtio: reset device on bad guest index in
 virtio_load()
Message-ID: <20201209180546.721296-8-mst@redhat.com>
References: <20201209180546.721296-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201209180546.721296-1-mst@redhat.com>
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
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 John Levon <john.levon@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Levon <john.levon@nutanix.com>

If we find a queue with an inconsistent guest index value, explicitly mark the
device as needing a reset - and broken - via virtio_error().

There's at least one driver implementation - the virtio-win NetKVM driver - that
is able to handle a VIRTIO_CONFIG_S_NEEDS_RESET notification and successfully
restore the device to a working state. Other implementations do not correctly
handle this, but as the VQ is not in a functional state anyway, this is still
worth doing.

Signed-off-by: John Levon <john.levon@nutanix.com>
Message-Id: <20201120185103.GA442386@sent>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index ceb58fda6c..eff35fab7c 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3161,12 +3161,15 @@ int virtio_load(VirtIODevice *vdev, QEMUFile *f, int version_id)
             nheads = vring_avail_idx(&vdev->vq[i]) - vdev->vq[i].last_avail_idx;
             /* Check it isn't doing strange things with descriptor numbers. */
             if (nheads > vdev->vq[i].vring.num) {
-                qemu_log_mask(LOG_GUEST_ERROR,
-                              "VQ %d size 0x%x Guest index 0x%x "
-                              "inconsistent with Host index 0x%x: delta 0x%x",
-                              i, vdev->vq[i].vring.num,
-                              vring_avail_idx(&vdev->vq[i]),
-                              vdev->vq[i].last_avail_idx, nheads);
+                virtio_error(vdev, "VQ %d size 0x%x Guest index 0x%x "
+                             "inconsistent with Host index 0x%x: delta 0x%x",
+                             i, vdev->vq[i].vring.num,
+                             vring_avail_idx(&vdev->vq[i]),
+                             vdev->vq[i].last_avail_idx, nheads);
+                vdev->vq[i].used_idx = 0;
+                vdev->vq[i].shadow_avail_idx = 0;
+                vdev->vq[i].inuse = 0;
+                continue;
             }
             vdev->vq[i].used_idx = vring_used_idx(&vdev->vq[i]);
             vdev->vq[i].shadow_avail_idx = vring_avail_idx(&vdev->vq[i]);
-- 
MST



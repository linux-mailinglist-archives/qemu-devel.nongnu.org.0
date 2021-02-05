Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2A9310D08
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 16:14:04 +0100 (CET)
Received: from localhost ([::1]:34492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l82o7-0006Sl-93
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 10:14:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l82eU-0004Eo-QW
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:04:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l82eR-000325-Sm
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:04:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612537443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U4gtmotGyc4DgZ4L1F6rz2/tdPPpbSuNOqH2cuNj5uc=;
 b=XiEdf8mAVpERjVXiqT1qHIzmlPa/IHk4Vy2FrGWpHnOMk5WCYmDItd3xbNdZoLpzsIZB68
 Bc+eESNiBOkdQqLt0D9a31Z7qqRqnSEv/1m3r+3RW0Uv11kC+3HDfHt3khyiuUxiXQ6Nyy
 rmG1dIuBc6N38yf8yr/3Sou9ijeorAE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-GE247dIWPeak4cqoJD3ncg-1; Fri, 05 Feb 2021 10:04:01 -0500
X-MC-Unique: GE247dIWPeak4cqoJD3ncg-1
Received: by mail-ed1-f71.google.com with SMTP id o8so7137856edh.12
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 07:04:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=U4gtmotGyc4DgZ4L1F6rz2/tdPPpbSuNOqH2cuNj5uc=;
 b=fBcMVpq8sKAIgJiZwaePKXJKHnz7laMXfcODxW4q6LzAoPBjYSqzAViW1VPMMKf6v0
 E1kaa4kSRxFERsDRglZ63De7Eb7LCS63ptCpGjtq0jsQ2y8z1ZyZCh4NWFyjU/KnplwZ
 yTyYF7DDKY+RQq5z0+NwIVOX+eD0FnzrNRTTn/Ej2bK/4Udjh7yBLDyPFCsXkPLSQVlO
 I8U9DdZ/6meytHsdbKdRsZW6meKPIlnRjfcwQt8CNHM4Kbhu66fuh/XmUQ1w/8G1N1KK
 yp5f9tSvMhNAHEhZkz72sj5M1HD9cAMXFh2l0FdMOFf+TQOKw2htgfL2iDCcS+VWDI/l
 aRiw==
X-Gm-Message-State: AOAM530T6v13Hj6LyfOGe/LAuOewBM3PWvHNCGMvdUESxCtBpejHGNDh
 O/sF966TMcqFvsLkdFJdODQjVg14sRlCgE8eC0Sf2HorgiO7Tw0ymDc5+ivm6GgDPNVIaLP0ztl
 ccSvScnANjHODDA9Ewed+GBnZ8wPqowgfS5xYxCc4UcZYpXRYNQDL9InTBGxi
X-Received: by 2002:a17:906:c08a:: with SMTP id
 f10mr4467503ejz.52.1612537439918; 
 Fri, 05 Feb 2021 07:03:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzD9Lf1PfX9ZX11/EFEB23gXZg8a4wMNwaZAzvMM83H995AuYBvSxLWDlAGzHpeGS1XIY8vAg==
X-Received: by 2002:a17:906:c08a:: with SMTP id
 f10mr4467480ejz.52.1612537439752; 
 Fri, 05 Feb 2021 07:03:59 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id e9sm4106962edk.66.2021.02.05.07.03.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 07:03:59 -0800 (PST)
Date: Fri, 5 Feb 2021 10:03:57 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 10/16] vhost: Check for valid vdev in
 vhost_backend_handle_iotlb_msg
Message-ID: <20210205150135.94643-11-mst@redhat.com>
References: <20210205150135.94643-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210205150135.94643-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eugenio Pérez <eperezma@redhat.com>

Not checking this can lead to invalid dev->vdev member access in
vhost_device_iotlb_miss if backend issue an iotlb message in a bad
timing, either maliciously or by a bug.

Reproduced rebooting a guest with testpmd in txonly forward mode.
 #0  0x0000559ffff94394 in vhost_device_iotlb_miss (
     dev=dev@entry=0x55a0012f6680, iova=10245279744, write=1)
     at ../hw/virtio/vhost.c:1013
 #1  0x0000559ffff9ac31 in vhost_backend_handle_iotlb_msg (
     imsg=0x7ffddcfd32c0, dev=0x55a0012f6680)
     at ../hw/virtio/vhost-backend.c:411
 #2  vhost_backend_handle_iotlb_msg (dev=dev@entry=0x55a0012f6680,
     imsg=imsg@entry=0x7ffddcfd32c0)
     at ../hw/virtio/vhost-backend.c:404
 #3  0x0000559fffeded7b in slave_read (opaque=0x55a0012f6680)
     at ../hw/virtio/vhost-user.c:1464
 #4  0x000055a0000c541b in aio_dispatch_handler (
     ctx=ctx@entry=0x55a0010a2120, node=0x55a0012d9e00)
     at ../util/aio-posix.c:329

Fixes: 020e571b8b ("vhost: rework IOTLB messaging")
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Message-Id: <20210129090728.831208-1-eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-backend.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
index 222bbcc62d..31b33bde37 100644
--- a/hw/virtio/vhost-backend.c
+++ b/hw/virtio/vhost-backend.c
@@ -406,6 +406,11 @@ int vhost_backend_handle_iotlb_msg(struct vhost_dev *dev,
 {
     int ret = 0;
 
+    if (unlikely(!dev->vdev)) {
+        error_report("Unexpected IOTLB message when virtio device is stopped");
+        return -EINVAL;
+    }
+
     switch (imsg->type) {
     case VHOST_IOTLB_MISS:
         ret = vhost_device_iotlb_miss(dev, imsg->iova,
-- 
MST



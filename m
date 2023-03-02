Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 876A96A7C9D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:28:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeG1-0003f1-D1; Thu, 02 Mar 2023 03:25:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeFu-0003N4-0A
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:25:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeFs-0002Lq-99
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:25:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ZksbsNOv/+hJ85tBQeNhtUAxT46QdRsXOaorVG1pUQ=;
 b=eZ2z68yGZyXlZ4W9yD1Aymzi8KxoHh51EmDS5Xppn+FD0Gm9FQPEwzaf50x9fJr4FMKYJT
 97FH5Ygzefp0lGP6dY0MICTnwBQfMKcoR5nVVkTCDPSKkdviBS8C0uXEvnv5+6jqwL9tnf
 p9snyofCNV9Y0NqPkvBR+rArf6oG4uo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-127-J7_pdfHKNGKR2aBYAyqL1A-1; Thu, 02 Mar 2023 03:25:34 -0500
X-MC-Unique: J7_pdfHKNGKR2aBYAyqL1A-1
Received: by mail-wm1-f71.google.com with SMTP id
 k20-20020a05600c1c9400b003e2249bd2b4so5462174wms.5
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:25:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745532;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+ZksbsNOv/+hJ85tBQeNhtUAxT46QdRsXOaorVG1pUQ=;
 b=BtaJ5ejL48knYs1SQKm/VClTlSexsaMcIS94MzpZd4M58diDpF7Lcl8yfhPUGcZRlM
 IRDvFdlXo4jq1Z1Qf4lOxC37BeLrMV3FZIFMYtOdATS6PxqG/eEE4y5Y+Yldi7LU2GFk
 Q9+KwUMbQwYQA+pUDtMErUwQcztwDfsFliVEfNpzu2by//9FM1qYAWDJ99QXl1JRkDB7
 quQEhYvTYzMtw9DEerUnEvaPUMR3jk9lLNUw9RmCKJNdy1KYmE5TqFjOa/ncMZKmbrnW
 S64WURpYqYR4sTCcXlfGPAstT5MyZ32QPOQGngs3eYo8vyY+J5pWmlSdz0VVjlRgnnVI
 911g==
X-Gm-Message-State: AO0yUKXXWPbSccYz7Pc5WG49KyQDbigL65sYfgdKiEfVkvJktLv9XElX
 WgCXqQAaRkQHzMmQm8uRg7UmTWyqr/mfOFnzVx4Z3uxml91ZQ/nCUG2TIoph+STWaWKIjr/p6Wj
 qBVKqqdeD7P9Jyk5o+L3zb4khUEwdLbGdsI4bHq5oUQa9rw1fgA0jufm64wnbe9mfxA==
X-Received: by 2002:a5d:4c52:0:b0:2cd:ceab:df1a with SMTP id
 n18-20020a5d4c52000000b002cdceabdf1amr741354wrt.32.1677745532556; 
 Thu, 02 Mar 2023 00:25:32 -0800 (PST)
X-Google-Smtp-Source: AK7set/8sWmKM91fW7eHIJ8zgIwRWLfFpxOqViq93z85SqdIms9DvJ1cQuPRdX5od14row1ktorSKw==
X-Received: by 2002:a5d:4c52:0:b0:2cd:ceab:df1a with SMTP id
 n18-20020a5d4c52000000b002cdceabdf1amr741338wrt.32.1677745532292; 
 Thu, 02 Mar 2023 00:25:32 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 v12-20020adfedcc000000b002c5a1bd527dsm14591039wro.96.2023.03.02.00.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:25:31 -0800 (PST)
Date: Thu, 2 Mar 2023 03:25:29 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 Lei Yang <leiyang@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 19/53] vdpa: stop all svq on device deletion
Message-ID: <20230302082343.560446-20-mst@redhat.com>
References: <20230302082343.560446-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230302082343.560446-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Eugenio Pérez <eperezma@redhat.com>

Not stopping them leave the device in a bad state when virtio-net
fronted device is unplugged with device_del monitor command.

This is not triggable in regular poweroff or qemu forces shutdown
because cleanup is called right after vhost_vdpa_dev_start(false).  But
devices hot unplug does not call vdpa device cleanups.  This lead to all
the vhost_vdpa devices without stop the SVQ but the last.

Fix it and clean the code, making it symmetric with
vhost_vdpa_svqs_start.

Fixes: dff4426fa656 ("vhost: Add Shadow VirtQueue kick forwarding capabilities")
Reported-by: Lei Yang <leiyang@redhat.com>
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Message-Id: <20230209170004.899472-1-eperezma@redhat.com>
Tested-by: Laurent Vivier <lvivier@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 542e003101..df3a1e92ac 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -689,26 +689,11 @@ static int vhost_vdpa_get_device_id(struct vhost_dev *dev,
     return ret;
 }
 
-static void vhost_vdpa_reset_svq(struct vhost_vdpa *v)
-{
-    if (!v->shadow_vqs_enabled) {
-        return;
-    }
-
-    for (unsigned i = 0; i < v->shadow_vqs->len; ++i) {
-        VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, i);
-        vhost_svq_stop(svq);
-    }
-}
-
 static int vhost_vdpa_reset_device(struct vhost_dev *dev)
 {
-    struct vhost_vdpa *v = dev->opaque;
     int ret;
     uint8_t status = 0;
 
-    vhost_vdpa_reset_svq(v);
-
     ret = vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &status);
     trace_vhost_vdpa_reset_device(dev, status);
     return ret;
@@ -1100,6 +1085,8 @@ static void vhost_vdpa_svqs_stop(struct vhost_dev *dev)
 
     for (unsigned i = 0; i < v->shadow_vqs->len; ++i) {
         VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, i);
+
+        vhost_svq_stop(svq);
         vhost_vdpa_svq_unmap_rings(dev, svq);
 
         event_notifier_cleanup(&svq->hdev_kick);
-- 
MST



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA8C6AFC2C
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:21:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiLH-00011U-01; Tue, 07 Mar 2023 20:11:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiLF-00011G-0E
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:11:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiLD-0001Z6-Ko
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:11:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678237899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KoF+K0Z/bB0Jssj7kEbUqe1HsYBZTQrBtW/A5NQcmoE=;
 b=UMByV/UYq9sxKtXiE4Jm39xQZwPtsJtqo+YbnZEQj6BKUe2q03manNWNU3WpXrLT0Evc5D
 CbCwYEa+3XECMqKHL4TEiBIYuKSxQ8yyCyUAov6SzmQFy9nx30agytcxX4AipnahS5eVhh
 li0e4CgeXhAfDVBo2O1I17I5LJ9qVD8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-52-LJz-7DYBMnqLScILuBAGpA-1; Tue, 07 Mar 2023 20:11:38 -0500
X-MC-Unique: LJz-7DYBMnqLScILuBAGpA-1
Received: by mail-ed1-f70.google.com with SMTP id
 d35-20020a056402402300b004e37aed9832so11979041eda.18
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:11:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678237896;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KoF+K0Z/bB0Jssj7kEbUqe1HsYBZTQrBtW/A5NQcmoE=;
 b=O+nYasFhEo4+8CVZNrtRmgWVsibFk4zSk6tascmDcdjBwmtUQbYlOmW4Q1mqZB+ZTi
 LQTzm0vM3quDOmjaAkuQhvErNhXvN/l4v+D0W44pbie3mwUO7sz4jURK0jmB2HLfUTQ4
 h5EfP0bx3bcXN6nnqQlEzPXlxnJX6N4L/oS3dZsVO/60+XS6sfY4fkamOCVCqto98BcS
 MfpLD0puDULUlvgxr/IIA0xjPc+jVK25iI04zLfraQKuf2Heya8bvhQqkLE/+RlkIWaf
 njUYQSNNTWGoiCEUYAb9IhBQ6/FcA4W5gMdIdH6RpTe9sd/C0tVV8Hj7uZ1rS5ELAWmy
 AsGA==
X-Gm-Message-State: AO0yUKWGYKMm8N4+t4OaxSsNTSq2D9EwLNI9CpzxUydeT6ocypRbQzfu
 deu3luU4nFhpEqgwzA2NBGGKsWCH23A/Toc8+O8VTibO0npdm3ymyEicJ+ksvMZxhWF0e2GE5qo
 woR6TrqI4lwTD/W9/7clEhOdKE8XL7ZlC8YroWoA9fxuatMyG05rat3ytn0FqQBS6sWxQ
X-Received: by 2002:a17:906:b10d:b0:8c0:6422:e0c2 with SMTP id
 u13-20020a170906b10d00b008c06422e0c2mr16594553ejy.22.1678237896305; 
 Tue, 07 Mar 2023 17:11:36 -0800 (PST)
X-Google-Smtp-Source: AK7set9hDjBKQgLNIyrszt0OyvQ3AuV2UyWwjc+JL8w2UWM/ZKyh+VAXaeNfGEQ+4ubNSYQs53gwiQ==
X-Received: by 2002:a17:906:b10d:b0:8c0:6422:e0c2 with SMTP id
 u13-20020a170906b10d00b008c06422e0c2mr16594541ejy.22.1678237896026; 
 Tue, 07 Mar 2023 17:11:36 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 p20-20020a17090653d400b008e97fdd6c7csm6725361ejo.129.2023.03.07.17.11.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:11:35 -0800 (PST)
Date: Tue, 7 Mar 2023 20:11:33 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 Lei Yang <leiyang@redhat.com>
Subject: [PULL 14/73] vdpa: Remember last call fd set
Message-ID: <b2765243863cf93d2bab1a1c2e14d6dc61981a6b.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

As SVQ can be enabled dynamically at any time, it needs to store call fd
always.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Message-Id: <20230303172445.1089785-3-eperezma@redhat.com>
Tested-by: Lei Yang <leiyang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index df3a1e92ac..108cd63289 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -1227,16 +1227,16 @@ static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
                                        struct vhost_vring_file *file)
 {
     struct vhost_vdpa *v = dev->opaque;
+    int vdpa_idx = file->index - dev->vq_index;
+    VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, vdpa_idx);
 
+    /* Remember last call fd because we can switch to SVQ anytime. */
+    vhost_svq_set_svq_call_fd(svq, file->fd);
     if (v->shadow_vqs_enabled) {
-        int vdpa_idx = file->index - dev->vq_index;
-        VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, vdpa_idx);
-
-        vhost_svq_set_svq_call_fd(svq, file->fd);
         return 0;
-    } else {
-        return vhost_vdpa_set_vring_dev_call(dev, file);
     }
+
+    return vhost_vdpa_set_vring_dev_call(dev, file);
 }
 
 static int vhost_vdpa_get_features(struct vhost_dev *dev,
-- 
MST



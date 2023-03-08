Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FD66AFBFF
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:16:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiLd-0002LE-86; Tue, 07 Mar 2023 20:12:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiLb-0002I0-EB
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:12:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiLZ-0001bi-Ot
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:12:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678237921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UuFH6NlrsTnaJq6Zh/BJrEuKPkPGNQB+Ipy4umSvtP0=;
 b=SYRT9Pe2sC7zOPs2Obf1CVc04wnT/4aB+h21xdpaTRWB1yqeVpCpL7QCvi2bphaUFhuzbf
 YIhbHX+a9w1MFKkPyCB06K+GDw3fATX/GfNf8m2Hri9Jsa38XjOaudAmRrRFcRH4WlEBet
 zDwpKgMPc2Dc7mq8ZJ865qySx6FjBPI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-9RL1nWXMOyOEQP0fB4l-TA-1; Tue, 07 Mar 2023 20:12:00 -0500
X-MC-Unique: 9RL1nWXMOyOEQP0fB4l-TA-1
Received: by mail-ed1-f69.google.com with SMTP id
 h15-20020a056402280f00b004bf9e193c23so21672367ede.11
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:12:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678237918;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UuFH6NlrsTnaJq6Zh/BJrEuKPkPGNQB+Ipy4umSvtP0=;
 b=XmJI5Xv1D1vv/xaqR+4LzF55pOSuPHOaMg3c5cD+kK0n4kxavmILcaN8u8DihmQKzc
 iVtzRGqmqxU2qdgFfpio1aPZq7HiYtAzQaGet0ujMEXmMYwR493OOpx+DXbf2PLXjpdr
 QWuox8wXetYTBeFucCYjbNBBsweFbI1J4vwLYGl3y6V5F4UzG95z8SS49DbmxPVTmink
 akGvRbK0KXc28+r9YPyDJZviaBUlZ12gkAPGnzyHRu6ymuqr8Fs61KL3kIZr5ZJM7BKv
 qZJ/7Rt20nc9VQ6g7RZUZ1cLnX9C2SEcrWwiH3cYg/LnU1eJRX5BmYPYL9U/xtV/kvnV
 ridA==
X-Gm-Message-State: AO0yUKXygJWOd1qrc6d4KawZugxVZO/EbOHiVZCr6RXqcMHs5sgrEXp6
 ucK+R9XWkt2BzWPUDVsWhiGoJOjcdnUzgUz7Q1L+Cooo7stYqQd+6uhvmtOhWUKbtridOhwWSJE
 ynpAzAsIfy9Yg45YHz/8zWebGsKxCJfj0FSi5c5DQm154F/p3LwF3i1V57Ox/kJ79Vmap
X-Received: by 2002:a17:906:6a18:b0:8a9:e031:c4ae with SMTP id
 qw24-20020a1709066a1800b008a9e031c4aemr21687154ejc.2.1678237918638; 
 Tue, 07 Mar 2023 17:11:58 -0800 (PST)
X-Google-Smtp-Source: AK7set/hLRCgZ+41dOBU36SZ/y2mHU7EC97RXRvThTl1V3/hZEpuzn2D+P1kZbnctccBKXlNQy1QeA==
X-Received: by 2002:a17:906:6a18:b0:8a9:e031:c4ae with SMTP id
 qw24-20020a1709066a1800b008a9e031c4aemr21687139ejc.2.1678237918381; 
 Tue, 07 Mar 2023 17:11:58 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 dt9-20020a170906b78900b008dd76b67ae6sm6833435ejb.175.2023.03.07.17.11.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:11:57 -0800 (PST)
Date: Tue, 7 Mar 2023 20:11:55 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 Lei Yang <leiyang@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 22/73] vdpa net: block migration if the device has CVQ
Message-ID: <9c363cf6d5982c568431531a8da26ccb0fcb3038.1678237635.git.mst@redhat.com>
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

Devices with CVQ need to migrate state beyond vq state.  Leaving this to
future series.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Message-Id: <20230303172445.1089785-11-eperezma@redhat.com>
Tested-by: Lei Yang <leiyang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vhost-vdpa.h | 1 +
 hw/virtio/vhost-vdpa.c         | 1 +
 net/vhost-vdpa.c               | 9 +++++++++
 3 files changed, 11 insertions(+)

diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index 4a7d396674..c278a2a8de 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -50,6 +50,7 @@ typedef struct vhost_vdpa {
     const VhostShadowVirtqueueOps *shadow_vq_ops;
     void *shadow_vq_ops_opaque;
     struct vhost_dev *dev;
+    Error *migration_blocker;
     VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
 } VhostVDPA;
 
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 49afa59261..e9167977d5 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -438,6 +438,7 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
     v->msg_type = VHOST_IOTLB_MSG_V2;
     vhost_vdpa_init_svq(dev, v);
 
+    error_propagate(&dev->migration_blocker, v->migration_blocker);
     if (!vhost_vdpa_first_dev(dev)) {
         return 0;
     }
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 167b43679d..533ba54317 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -828,6 +828,15 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
 
         s->vhost_vdpa.shadow_vq_ops = &vhost_vdpa_net_svq_ops;
         s->vhost_vdpa.shadow_vq_ops_opaque = s;
+
+        /*
+         * TODO: We cannot migrate devices with CVQ as there is no way to set
+         * the device state (MAC, MQ, etc) before starting the datapath.
+         *
+         * Migration blocker ownership now belongs to s->vhost_vdpa.
+         */
+        error_setg(&s->vhost_vdpa.migration_blocker,
+                   "net vdpa cannot migrate with CVQ feature");
     }
     ret = vhost_vdpa_add(nc, (void *)&s->vhost_vdpa, queue_pair_index, nvqs);
     if (ret) {
-- 
MST



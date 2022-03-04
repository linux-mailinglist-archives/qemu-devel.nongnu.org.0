Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FDE4CD637
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:19:49 +0100 (CET)
Received: from localhost ([::1]:36006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ8ma-0000NS-SO
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:19:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8Ar-0003Ai-Uh
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:40:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8Ao-000154-Mo
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:40:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646401245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SoEIyJ3M3ZHGIXoolRVwuQOGPFG25A4XAUBq+1r+Ueo=;
 b=JWDPTGuOHVc2mtQ9NYUd1vY7k704CMQqYuh31sfjtIUdiJUR9S0GidHrsacL5vtb0A0G5v
 437VnkJMYIgAIcO/rYlYoXGpam6aTDgmHEiO9QptnDxwLd4KahoRbxJQxBaHPmiwMMhK9I
 UYFzuMbQ/KuCZz5mBunTioALLeo4vL0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-332-zewQfvQFNH2SJKR8tKsSPw-1; Fri, 04 Mar 2022 08:40:44 -0500
X-MC-Unique: zewQfvQFNH2SJKR8tKsSPw-1
Received: by mail-wr1-f70.google.com with SMTP id
 g17-20020adfa591000000b001da86c91c22so3388510wrc.5
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 05:40:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=SoEIyJ3M3ZHGIXoolRVwuQOGPFG25A4XAUBq+1r+Ueo=;
 b=zYaFX5GgsSs5wVXKDE2ByDZno9cQzM9RoRWpEBtudxZoNZcHVBK7QFVqbSw5YTtI7v
 PEvPrlO3XmG9/S/+A/7eED9/Hc48vZajuXeInO0KCTY/FR6AwyMMKI9varwVknTwLC90
 PtKzsvMo+zOJN8L3fvzlVU5hqshFqVRMvw8VEYGrW7WGXOagluXz2qMb4XR80GTqmE5S
 3Rg/Yq5E1LAkIBDzuKCc5W/dEHJ31gJlQIp0/FVnckpcQGlP6L4IqQSO8q0DPY8A0c9F
 dW0fkFRGiHEWsmiG/Wvj9+36hDueer+cZapkYqPHwaox6TBjNSm8ArvGLkDZJIGcPM9v
 GrAw==
X-Gm-Message-State: AOAM533N16LOk19UhQNdjV4EKCrPrxOFAEMqCtVcEBW4DGroAU2KDoPG
 wxSewPYv+qfDbjnEjkBrVkMwAHyq5gCnZqVFdjCIsNGO/G4msHbitWiFPILRTRByuHEplyV5oM8
 U9rJgbamzKLZVXbxohX9ddzRJOKupVitcCyFlyf0Sa0Lq0hD5zbpWGN4BEaPJ
X-Received: by 2002:a05:6000:1a85:b0:1f0:61dc:83e0 with SMTP id
 f5-20020a0560001a8500b001f061dc83e0mr5131322wry.409.1646401243205; 
 Fri, 04 Mar 2022 05:40:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy9KIsEg59Qs5cmyCLaL9AZOiazwepWfOQoW8KO7QGnVIldG5Y7ycUjqzMPJ9PH0YCtikW/Ug==
X-Received: by 2002:a05:6000:1a85:b0:1f0:61dc:83e0 with SMTP id
 f5-20020a0560001a8500b001f061dc83e0mr5131306wry.409.1646401242966; 
 Fri, 04 Mar 2022 05:40:42 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 k13-20020a7bc40d000000b00381890032dfsm10723896wmi.1.2022.03.04.05.40.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 05:40:40 -0800 (PST)
Date: Fri, 4 Mar 2022 08:40:37 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 27/45] virtio-net: Unlimit tx queue size if peer is vdpa
Message-ID: <20220304133556.233983-28-mst@redhat.com>
References: <20220304133556.233983-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220304133556.233983-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eugenio Pérez <eperezma@redhat.com>

The code used to limit the maximum size of tx queue for others backends
than vhost_user since the introduction of configurable tx queue size in
9b02e1618cf2 ("virtio-net: enable configurable tx queue size").

As vhost_user, vhost_vdpa devices should deal with memory region
crosses already, so let's use the full tx size.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Message-Id: <20220217175029.2517071-1-eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/virtio-net.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index cf8ab0f8af..b02a0632df 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -628,17 +628,20 @@ static int virtio_net_max_tx_queue_size(VirtIONet *n)
     NetClientState *peer = n->nic_conf.peers.ncs[0];
 
     /*
-     * Backends other than vhost-user don't support max queue size.
+     * Backends other than vhost-user or vhost-vdpa don't support max queue
+     * size.
      */
     if (!peer) {
         return VIRTIO_NET_TX_QUEUE_DEFAULT_SIZE;
     }
 
-    if (peer->info->type != NET_CLIENT_DRIVER_VHOST_USER) {
+    switch(peer->info->type) {
+    case NET_CLIENT_DRIVER_VHOST_USER:
+    case NET_CLIENT_DRIVER_VHOST_VDPA:
+        return VIRTQUEUE_MAX_SIZE;
+    default:
         return VIRTIO_NET_TX_QUEUE_DEFAULT_SIZE;
-    }
-
-    return VIRTQUEUE_MAX_SIZE;
+    };
 }
 
 static int peer_attach(VirtIONet *n, int index)
-- 
MST



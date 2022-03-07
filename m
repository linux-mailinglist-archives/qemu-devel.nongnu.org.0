Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8294D0B8D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 23:57:50 +0100 (CET)
Received: from localhost ([::1]:56696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRMIX-0006It-KG
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 17:57:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM6z-0007NC-7v
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:45:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM6x-0005df-Hw
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:45:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646693151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SoEIyJ3M3ZHGIXoolRVwuQOGPFG25A4XAUBq+1r+Ueo=;
 b=a2XDSwROL5w7p56O0MvlsBox6QB+I9+0yw10aGaf/geGe2nwgKOeWxvUNeB/P6M1BgfiFM
 qA4Lfvp/iB/32VJ0YYmq37FjcUj3NHAnA0EW2LqWIdsgY838v8u9r3bP1AIu1TJc2Blpfa
 i+3DfYQdov/tuBkpGGCFmOaqilG2SZ4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-361-H8h9EsNBN2WArR7aC05VCg-1; Mon, 07 Mar 2022 17:45:50 -0500
X-MC-Unique: H8h9EsNBN2WArR7aC05VCg-1
Received: by mail-wm1-f69.google.com with SMTP id
 3-20020a05600c230300b00384e15ceae4so248622wmo.7
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 14:45:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=SoEIyJ3M3ZHGIXoolRVwuQOGPFG25A4XAUBq+1r+Ueo=;
 b=qjZlzgp0HkwysnhkVgQtGBrnlEOGOk7VZlfHsa1Qe+Xkn9KwPBZ5D4qliB3mfBDApD
 FlCV/VllZ6OTFOWNQKyOW+3XrH6clNggXGk0QHPVjxsVWcKiB9FYm4HubdGhMPx9DXbk
 RcLH4AvMhJJHYAUcmTejn14gU/rEDmvMwxiHivue0Y+JrgoaZ7U2ayGBSrbYo7Q2BAUN
 uRCeqAy9Egtc4yuKr42eO+OMuLqEhstdalQ4LWUut0zxOVeKRFZBM7U3Thwtx/EoRg73
 3k4oOLphUEU5hPZpeczVZOpaiNR7Jebg2Bo6N3Nfgk+D2fwW9nqxBZga7SzWXj8rxonr
 MgIA==
X-Gm-Message-State: AOAM533V4fkWgSow+9FOHhJtMiesoY+o/TZIEpgdKS7OIr1l9Es0UnsC
 nMaDygBPkip4lBzxJyPeecOhy9if3gENfwhTzRvKd4T0XDpmnxBwAP+YiBejrBGln9K89jrCnlr
 apkUaLyYTv16G3Vup61cOfUqUn147rs0NejKhsszuR+SA5IPJLyOyHT+NA2gW
X-Received: by 2002:a5d:6481:0:b0:1f0:46c3:e6f with SMTP id
 o1-20020a5d6481000000b001f046c30e6fmr9813313wri.692.1646693148374; 
 Mon, 07 Mar 2022 14:45:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy47H1hKhpg3fVe5mpyV+oUIrA5YAWhS8sZYwL0Y1zLzZ5VWU2KLsYjPAwRT4tgDC1LaLzvVw==
X-Received: by 2002:a5d:6481:0:b0:1f0:46c3:e6f with SMTP id
 o1-20020a5d6481000000b001f046c30e6fmr9813297wri.692.1646693148093; 
 Mon, 07 Mar 2022 14:45:48 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 l8-20020a5d6688000000b001f04ae0bb6csm12204928wru.58.2022.03.07.14.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 14:45:47 -0800 (PST)
Date: Mon, 7 Mar 2022 17:45:45 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 23/47] virtio-net: Unlimit tx queue size if peer is vdpa
Message-ID: <20220307224357.682101-24-mst@redhat.com>
References: <20220307224357.682101-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307224357.682101-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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



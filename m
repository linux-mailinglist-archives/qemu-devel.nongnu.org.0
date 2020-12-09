Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 184792D49F6
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 20:18:34 +0100 (CET)
Received: from localhost ([::1]:43472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn4yv-0001yY-3M
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 14:18:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3tv-00034k-79
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:09:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3ts-0008KB-K1
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:09:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vx7oUqEVbRuE7vFFRNc/37oqJ1xHKKB+0YZAvOhK9cM=;
 b=FVhiTRORm2z+oStUMABswQTZiV9NB7eyV1j0quVWf4TDnysWMQNkafafUJIXTJRY3Ekdjc
 FgdAAM1rH4rr1NaOTzxagg0ZRwbOXoGnDxyy9ph8cr/5gr/tLK3fbrnQoYWs9+Rc9IbD76
 q9olHFNoHroNA4wu+tYPowCmLmL8yzg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-aVvYWMkKM9i2k9Go79ULGw-1; Wed, 09 Dec 2020 13:09:14 -0500
X-MC-Unique: aVvYWMkKM9i2k9Go79ULGw-1
Received: by mail-wr1-f69.google.com with SMTP id o4so936864wrw.19
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:09:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Vx7oUqEVbRuE7vFFRNc/37oqJ1xHKKB+0YZAvOhK9cM=;
 b=iClo/yfmIGFuPtMoORintARHf/hqY5MzeygrDKCNhBKiSRa18IwBvipmcOJ3o6xcPQ
 R0U+spPUmqnBsBqSbteKIxMqlk+j/3YmQlUFFr4oywB2iNAJNtkpZDXdygOIDVZ15Haq
 +aTn+PMJrzPmMmpRN9A7tmjKEXydoW1p8ov9n3Ruvwj7BywkjcIG6B7Ed54TyE0f/Ol6
 DH0XFBrJuOUZpydmQNwsGLoAd15iFbTD8LoU6sAM000lh6l/mocMlmi8EnteTZ/Dri/C
 09LWMqKbW8hG1FTafugMhBfuHm3HVO8Ma0RY3eF4hOZcoBGxaZMUeuuaA/juG0+41Vv5
 lPTw==
X-Gm-Message-State: AOAM532z/iUa7angWv/XhKY240qU12Nyl9p4cywjnRiYbX81wnB3nrly
 FSqcZC16ZtVFvq1XZZ4QMUcX3np5g0lPpfO72L5ZHKE6n4wAq9L3bQU4Lg0gQ2KcH2tfI+AFxhB
 PCtKqP6w3wDw++vPB8Ao3TEPVRekDItBw2NB7pynwbnl8NV9kb48tat3hHqWZ
X-Received: by 2002:a7b:cc12:: with SMTP id f18mr4103770wmh.110.1607537352606; 
 Wed, 09 Dec 2020 10:09:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwrCw5twg84xYnYK9kjBgGjoQspcvQrV8KG1n1Cga8ifGrSqrtQA5rWiZlcmhr1JaAn/vKTww==
X-Received: by 2002:a7b:cc12:: with SMTP id f18mr4103746wmh.110.1607537352401; 
 Wed, 09 Dec 2020 10:09:12 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id s63sm5615194wms.18.2020.12.09.10.09.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:09:11 -0800 (PST)
Date: Wed, 9 Dec 2020 13:09:09 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 32/65] failover: virtio_net_connect_failover_devices() does
 nothing
Message-ID: <20201209180546.721296-33-mst@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Juan Quintela <quintela@redhat.com>

It just calls virtio_net_find_primary(), so just update the callers.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20201118083748.1328-18-quintela@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/virtio-net.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 747614ff2a..c6200b924e 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -836,19 +836,6 @@ static DeviceState *virtio_net_find_primary(VirtIONet *n, Error **errp)
     return qdev_find_recursive(sysbus_get_default(), n->primary_device_id);
 }
 
-static DeviceState *virtio_connect_failover_devices(VirtIONet *n, Error **errp)
-{
-    DeviceState *prim_dev = NULL;
-    Error *err = NULL;
-
-    prim_dev = virtio_net_find_primary(n, &err);
-    if (!prim_dev) {
-        error_propagate(errp, err);
-    }
-
-    return prim_dev;
-}
-
 static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
 {
     VirtIONet *n = VIRTIO_NET(vdev);
@@ -904,7 +891,7 @@ static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
         qatomic_set(&n->failover_primary_hidden, false);
         failover_add_primary(n, &err);
         if (err) {
-            n->primary_dev = virtio_connect_failover_devices(n, &err);
+            n->primary_dev = virtio_net_find_primary(n, &err);
             if (err) {
                 goto out_err;
             }
@@ -3128,7 +3115,7 @@ static void virtio_net_handle_migration_primary(VirtIONet *n,
     should_be_hidden = qatomic_read(&n->failover_primary_hidden);
 
     if (!n->primary_dev) {
-        n->primary_dev = virtio_connect_failover_devices(n, &err);
+        n->primary_dev = virtio_net_find_primary(n, &err);
         if (!n->primary_dev) {
             return;
         }
-- 
MST



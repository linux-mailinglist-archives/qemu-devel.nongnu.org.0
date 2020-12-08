Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3640D2D3318
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 21:19:22 +0100 (CET)
Received: from localhost ([::1]:55086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmjSD-0000ze-9A
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 15:19:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmils-0005vS-3v
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:35:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmilq-0005HC-AW
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:35:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vx7oUqEVbRuE7vFFRNc/37oqJ1xHKKB+0YZAvOhK9cM=;
 b=EDYppNavEeTxB+KKpxMS/j98s/KFJDPZdrCYK9c9ajOc3+sivgof8w4NFIQRZVNHSyVTQE
 PRfnmEG5LpY3T6G9BJ+bMVDo/ySpIOJucFlhKpGHvK9+SI/lJ63GHTtvw9so+GupwwRYap
 59fm0U3+nMHG2B0cl4f9RDFcjwlM9Nw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-yMxXHfBEPf2MTmPW4HgxyA-1; Tue, 08 Dec 2020 14:35:30 -0500
X-MC-Unique: yMxXHfBEPf2MTmPW4HgxyA-1
Received: by mail-wr1-f72.google.com with SMTP id p18so6547370wro.9
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:35:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Vx7oUqEVbRuE7vFFRNc/37oqJ1xHKKB+0YZAvOhK9cM=;
 b=dXwxYBiGeAMMKLblJRbSrS+pdOFdXoK1dHuYvHf5i239DgovkAOL1BnRrGxtO9WVqF
 XewtXVftcpVvKNw2cU+Mkgg45DsAm0OspbLdLyK4muwbhBmb54eFTkgRkr14D7gSAvTW
 zDCkq0hUNnTooX4U9IrfmJnu9r5skI2Art7YLM0ua7dwYKPJSHl4rsZWWjUO54hs7UzZ
 OU58H9uFz2ghRE5ZYV4JcupXLxnwHCgAZXYqsZW3gUoOPpO4zMD9H8iD+1vKSY3G3Air
 a9qTns7TAZxhAwA9S4Zki5OLDWyQazoheIinaTbgZpvxWYky/BjoJ03sOMdXhK3Do81Q
 WU4w==
X-Gm-Message-State: AOAM533OUvJLG9MnWpbkQLYu5l6h+BJUc1a+AA74Y3gNhMbPYH7YeuMq
 qkzysUY9Bp6lj2Lt/A4or1XaVtNqOKFU0PAw7cSCKotNP9K51t5ebLwWLl7k0hSN5Bp3JvFcrFE
 eOhVHM9ACmYMXGFMB+Rao6Zgs+K8XYqmC30xGAdZCQ6B/gUKPb28R6r7Ic9Rb
X-Received: by 2002:adf:eb91:: with SMTP id t17mr26882672wrn.330.1607456129068; 
 Tue, 08 Dec 2020 11:35:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyV7PGCZlHSrcVQ6sdwdvHq6Fjm8r1gHrQaYMY+VzaokTlobbq9FbGYxauPlc5D+n1DSX6XXw==
X-Received: by 2002:adf:eb91:: with SMTP id t17mr26882651wrn.330.1607456128865; 
 Tue, 08 Dec 2020 11:35:28 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id y68sm5734653wmc.0.2020.12.08.11.35.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:35:28 -0800 (PST)
Date: Tue, 8 Dec 2020 14:35:25 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 32/66] failover: virtio_net_connect_failover_devices() does
 nothing
Message-ID: <20201208193307.646726-33-mst@redhat.com>
References: <20201208193307.646726-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201208193307.646726-1-mst@redhat.com>
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



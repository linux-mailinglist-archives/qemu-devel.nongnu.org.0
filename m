Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D122D3307
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 21:15:14 +0100 (CET)
Received: from localhost ([::1]:46508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmjOD-0005mM-JF
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 15:15:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmilb-0005gr-Mg
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:35:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmilH-0004xk-2j
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:35:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MHcX9e7mD/h+Oeld8nnzKR5yrjwwB4Dy4Q0IjF0Tlvs=;
 b=bowDq+JQx1X/cfvafX7RDDsksKUDAbR2Xp1CI/9MfjbKxEaznBpQbK+8EpsEmwg0e14ZIJ
 qEcZDT2aLAiaE940CX/SoqdTqXunZznsxPgaoB2J/C/EmJD7NeLbTVxbRIujSxDtzkfnX8
 OBMvDkCHWF6lr/OEP7zlu4izoJlvBUQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-mNdWfzWzNHeYEFhhjOGf2w-1; Tue, 08 Dec 2020 14:34:53 -0500
X-MC-Unique: mNdWfzWzNHeYEFhhjOGf2w-1
Received: by mail-wm1-f69.google.com with SMTP id d16so948579wmd.1
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:34:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MHcX9e7mD/h+Oeld8nnzKR5yrjwwB4Dy4Q0IjF0Tlvs=;
 b=ApQqNGEw7gMWXv+QKW7EWCzww4er2nnCwngX++w1YZu4/ZArwUVIUW7nIGrudCdVpZ
 tpdG4hVLz1ZG1+523nwkBjtZZHqGo6QUvhpFZVghbxCWOftZ9tlL5X3PZp3wKJoK64nL
 LWjgH5SWxshU9jhYCPqd0pRhGJi/Bzp/pBStGb+p2JGPcRzcKhzhp3Uve9A+lW4/Ll+Y
 8HYZZs/AQIrtT2tKzI6oTOAyG2FA9hP4v0+1vuhRdrnvjiee7gZahxcFXATktLyyg8vn
 M4d4z7SLIflEX3grc+Nx4s1l8NOqTZv3HvNZfDz0X1tOjbUE5KHByYc0+EquOfQPzfKz
 Bbxw==
X-Gm-Message-State: AOAM532AEnqkyqnQUp595KhCkYHso2a7HTtN0axQA7dgI/TTAGIm/Ano
 rsCsh4Z1FMBPYJL0L7I2WgEfQIdUI7hrPg7Tc5KyybRqC9HtghBpc+SrJVjdGwuKSYgZtJbB9mE
 XPpKyceGJ1/2fHaYQLecmPLKOWve9Yh/J6LoVqmqltmHzkL08U+UKZdqlwCIF
X-Received: by 2002:adf:dc08:: with SMTP id t8mr5672502wri.195.1607456092019; 
 Tue, 08 Dec 2020 11:34:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyK4bw2NQGfbAutI7sy2HcfWlPABL/1yHTQ0PBV4IQfR0FA1dk+ggf6FahjYoNPcYQHq6wwbA==
X-Received: by 2002:adf:dc08:: with SMTP id t8mr5672485wri.195.1607456091842; 
 Tue, 08 Dec 2020 11:34:51 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id q15sm9283332wrw.75.2020.12.08.11.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:34:50 -0800 (PST)
Date: Tue, 8 Dec 2020 14:34:48 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/66] failover: Rename bool to failover_primary_hidden
Message-ID: <20201208193307.646726-24-mst@redhat.com>
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
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

You should not use passive naming variables.
And once there, be able to search for them.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20201118083748.1328-9-quintela@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/virtio-net.h |  3 ++-
 hw/net/virtio-net.c            | 14 +++++++-------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
index c8da637d40..ca68be759f 100644
--- a/include/hw/virtio/virtio-net.h
+++ b/include/hw/virtio/virtio-net.h
@@ -207,7 +207,8 @@ struct VirtIONet {
     DeviceState *primary_dev;
     char *primary_device_id;
     char *standby_id;
-    bool primary_should_be_hidden;
+    /* primary failover device is hidden*/
+    bool failover_primary_hidden;
     bool failover;
     DeviceListener primary_listener;
     Notifier migration_state;
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 3e82108d42..c221671852 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -916,7 +916,7 @@ static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
 
     if (virtio_has_feature(features, VIRTIO_NET_F_STANDBY)) {
         qapi_event_send_failover_negotiated(n->netclient_name);
-        qatomic_set(&n->primary_should_be_hidden, false);
+        qatomic_set(&n->failover_primary_hidden, false);
         failover_add_primary(n, &err);
         if (err) {
             n->primary_dev = virtio_connect_failover_devices(n, &err);
@@ -3127,7 +3127,7 @@ static bool failover_replug_primary(VirtIONet *n, Error **errp)
         return false;
     }
     qdev_set_parent_bus(n->primary_dev, primary_bus, &error_abort);
-    qatomic_set(&n->primary_should_be_hidden, false);
+    qatomic_set(&n->failover_primary_hidden, false);
     hotplug_ctrl = qdev_get_hotplug_handler(n->primary_dev);
     if (hotplug_ctrl) {
         hotplug_handler_pre_plug(hotplug_ctrl, n->primary_dev, &err);
@@ -3148,7 +3148,7 @@ static void virtio_net_handle_migration_primary(VirtIONet *n,
     bool should_be_hidden;
     Error *err = NULL;
 
-    should_be_hidden = qatomic_read(&n->primary_should_be_hidden);
+    should_be_hidden = qatomic_read(&n->failover_primary_hidden);
 
     if (!n->primary_dev) {
         n->primary_dev = virtio_connect_failover_devices(n, &err);
@@ -3163,7 +3163,7 @@ static void virtio_net_handle_migration_primary(VirtIONet *n,
                                qdev_get_vmsd(n->primary_dev),
                                n->primary_dev);
             qapi_event_send_unplug_primary(n->primary_device_id);
-            qatomic_set(&n->primary_should_be_hidden, true);
+            qatomic_set(&n->failover_primary_hidden, true);
         } else {
             warn_report("couldn't unplug primary device");
         }
@@ -3213,8 +3213,8 @@ static int virtio_net_primary_should_be_hidden(DeviceListener *listener,
 
     n->primary_device_opts = device_opts;
 
-    /* primary_should_be_hidden is set during feature negotiation */
-    hide = qatomic_read(&n->primary_should_be_hidden);
+    /* failover_primary_hidden is set during feature negotiation */
+    hide = qatomic_read(&n->failover_primary_hidden);
 
     if (n->primary_device_dict) {
         g_free(n->primary_device_id);
@@ -3271,7 +3271,7 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
     if (n->failover) {
         n->primary_listener.should_be_hidden =
             virtio_net_primary_should_be_hidden;
-        qatomic_set(&n->primary_should_be_hidden, true);
+        qatomic_set(&n->failover_primary_hidden, true);
         device_listener_register(&n->primary_listener);
         n->migration_state.notify = virtio_net_migration_state_notifier;
         add_migration_state_change_notifier(&n->migration_state);
-- 
MST



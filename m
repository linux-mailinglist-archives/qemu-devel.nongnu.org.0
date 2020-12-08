Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A242D32DA
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 20:57:33 +0100 (CET)
Received: from localhost ([::1]:52434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmj76-0001WY-2T
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 14:57:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmilG-0005JM-7L
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:34:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmikz-0004uo-NM
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:34:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OPkEy7zdzU+em153CCBpKaOYJAvGL44aXjwYpC3hvpA=;
 b=GWTnSVswa2HFr/ALkiQQQjHd9mhOxaROONxJokIpl7Wi6Y+ReS+glmDimIQ5UD1YsKVJp1
 gsXG1iqpzgR7BR5PZel1sqlA/qXX6cgUqVBFxAOQGH0BWnDCccVWovob40ZBv8PcyTyB3N
 BvpGIfdXcPyprd9HrDl8AjXlhkr2pug=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-61GeVg1uOUmEyUrnIZ6sVg-1; Tue, 08 Dec 2020 14:34:34 -0500
X-MC-Unique: 61GeVg1uOUmEyUrnIZ6sVg-1
Received: by mail-wr1-f70.google.com with SMTP id o17so37389wra.8
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:34:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OPkEy7zdzU+em153CCBpKaOYJAvGL44aXjwYpC3hvpA=;
 b=D+Mqf4SVNIL0NXb+7efdTPkVO6nV7XoVDOLsYh/TRO9lJl4UwMr390uVJb/XXC/W/2
 ITqF/oz219cP4LHDXggwEWvawZr6fLtPvxp07cBlJqX3U/U3/vZ6Y0vaWv5++kB3mdjP
 g9/RVybv3floNNb9utf1VjL1GW16AF+dgc60OLQGs2XLFP4Qu1+YNsi4l4jWOCzBM/Ut
 xQIY/ZeZexUmXk6yN5r+2BblW6jXrTfZNFtNbRyvw54q4rrmYxWxS78tv4Q4+sf2rp0L
 nqpwpMl2JXPEHiwswFhM2dddLKM/tg1dRqxW4OdhruFPrelgdBPphuXvwuWTUHfNmGaz
 8yMw==
X-Gm-Message-State: AOAM530m5lBdY9Em+1PW3J0szI1affpovVPTShuKL85RQsVnRK/u+vtO
 9T+P6cLZq45rQHQa/g8ohjvRMNgkX+AWJ/bFsi2d4PaDsNsIEECnWc/ZMa3yM3R+7RrDZOsve7I
 RFnbqTFSLKwrt4sFCGsUEPiipTclr8Xzc2Ob3GbMifFAwIoOTSAz1Lor/ejyA
X-Received: by 2002:a1c:2394:: with SMTP id j142mr5337282wmj.42.1607456072845; 
 Tue, 08 Dec 2020 11:34:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxvZoukt1MRltH5mQMQzFCEdcCW9lgrQFnnyxGcq6LfAQRWlc1UvgESuHosMQ9HRUvm6QX6mg==
X-Received: by 2002:a1c:2394:: with SMTP id j142mr5337260wmj.42.1607456072597; 
 Tue, 08 Dec 2020 11:34:32 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id d3sm21264780wrr.2.2020.12.08.11.34.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:34:31 -0800 (PST)
Date: Tue, 8 Dec 2020 14:34:30 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/66] failover: fix indentantion
Message-ID: <20201208193307.646726-18-mst@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Juan Quintela <quintela@redhat.com>

Once there, remove not needed cast.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20201118083748.1328-3-quintela@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/virtio-net.c    | 33 +++++++++++++++------------------
 softmmu/qdev-monitor.c |  4 ++--
 2 files changed, 17 insertions(+), 20 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 9179013ac4..1011a524bf 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -797,7 +797,7 @@ static void failover_add_primary(VirtIONet *n, Error **errp)
     }
 
     n->primary_device_opts = qemu_opts_find(qemu_find_opts("device"),
-            n->primary_device_id);
+                                            n->primary_device_id);
     if (n->primary_device_opts) {
         n->primary_dev = qdev_device_add(n->primary_device_opts, &err);
         if (err) {
@@ -814,9 +814,9 @@ static void failover_add_primary(VirtIONet *n, Error **errp)
     } else {
         error_setg(errp, "Primary device not found");
         error_append_hint(errp, "Virtio-net failover will not work. Make "
-            "sure primary device has parameter"
-            " failover_pair_id=<virtio-net-id>\n");
-}
+                          "sure primary device has parameter"
+                          " failover_pair_id=<virtio-net-id>\n");
+    }
     error_propagate(errp, err);
 }
 
@@ -824,7 +824,6 @@ static int is_my_primary(void *opaque, QemuOpts *opts, Error **errp)
 {
     VirtIONet *n = opaque;
     int ret = 0;
-
     const char *standby_id = qemu_opt_get(opts, "failover_pair_id");
 
     if (standby_id != NULL && (g_strcmp0(standby_id, n->netclient_name) == 0)) {
@@ -841,14 +840,14 @@ static DeviceState *virtio_net_find_primary(VirtIONet *n, Error **errp)
     Error *err = NULL;
 
     if (qemu_opts_foreach(qemu_find_opts("device"),
-                         is_my_primary, n, &err)) {
+                          is_my_primary, n, &err)) {
         if (err) {
             error_propagate(errp, err);
             return NULL;
         }
         if (n->primary_device_id) {
             dev = qdev_find_recursive(sysbus_get_default(),
-                    n->primary_device_id);
+                                      n->primary_device_id);
         } else {
             error_setg(errp, "Primary device id not found");
             return NULL;
@@ -857,8 +856,6 @@ static DeviceState *virtio_net_find_primary(VirtIONet *n, Error **errp)
     return dev;
 }
 
-
-
 static DeviceState *virtio_connect_failover_devices(VirtIONet *n,
                                                     DeviceState *dev,
                                                     Error **errp)
@@ -3126,9 +3123,9 @@ static bool failover_replug_primary(VirtIONet *n, Error **errp)
         return true;
     }
     if (!n->primary_device_opts) {
-        n->primary_device_opts = qemu_opts_from_qdict(
-                qemu_find_opts("device"),
-                n->primary_device_dict, errp);
+        n->primary_device_opts = qemu_opts_from_qdict(qemu_find_opts("device"),
+                                                      n->primary_device_dict,
+                                                      errp);
         if (!n->primary_device_opts) {
             return false;
         }
@@ -3176,8 +3173,8 @@ static void virtio_net_handle_migration_primary(VirtIONet *n,
     if (migration_in_setup(s) && !should_be_hidden) {
         if (failover_unplug_primary(n)) {
             vmstate_unregister(VMSTATE_IF(n->primary_dev),
-                    qdev_get_vmsd(n->primary_dev),
-                    n->primary_dev);
+                               qdev_get_vmsd(n->primary_dev),
+                               n->primary_dev);
             qapi_event_send_unplug_primary(n->primary_device_id);
             qatomic_set(&n->primary_should_be_hidden, true);
         } else {
@@ -3201,7 +3198,7 @@ static void virtio_net_migration_state_notifier(Notifier *notifier, void *data)
 }
 
 static int virtio_net_primary_should_be_hidden(DeviceListener *listener,
-            QemuOpts *device_opts)
+                                               QemuOpts *device_opts)
 {
     VirtIONet *n = container_of(listener, VirtIONet, primary_listener);
     bool match_found = false;
@@ -3211,11 +3208,11 @@ static int virtio_net_primary_should_be_hidden(DeviceListener *listener,
         return -1;
     }
     n->primary_device_dict = qemu_opts_to_qdict(device_opts,
-            n->primary_device_dict);
+                                                n->primary_device_dict);
     if (n->primary_device_dict) {
         g_free(n->standby_id);
         n->standby_id = g_strdup(qdict_get_try_str(n->primary_device_dict,
-                    "failover_pair_id"));
+                                                   "failover_pair_id"));
     }
     if (g_strcmp0(n->standby_id, n->netclient_name) == 0) {
         match_found = true;
@@ -3235,7 +3232,7 @@ static int virtio_net_primary_should_be_hidden(DeviceListener *listener,
     if (n->primary_device_dict) {
         g_free(n->primary_device_id);
         n->primary_device_id = g_strdup(qdict_get_try_str(
-                    n->primary_device_dict, "id"));
+                                            n->primary_device_dict, "id"));
         if (!n->primary_device_id) {
             warn_report("primary_device_id not set");
         }
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index bf79d0bbcd..a25f5d612c 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -573,10 +573,10 @@ void qdev_set_id(DeviceState *dev, const char *id)
 }
 
 static int is_failover_device(void *opaque, const char *name, const char *value,
-                        Error **errp)
+                              Error **errp)
 {
     if (strcmp(name, "failover_pair_id") == 0) {
-        QemuOpts *opts = (QemuOpts *)opaque;
+        QemuOpts *opts = opaque;
 
         if (qdev_should_hide_device(opts)) {
             return 1;
-- 
MST



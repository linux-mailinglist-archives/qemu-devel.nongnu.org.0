Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B16F2D494C
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 19:44:38 +0100 (CET)
Received: from localhost ([::1]:35960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn4S5-0007xn-BL
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 13:44:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3tY-0002YJ-NF
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:08:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3tX-0008Cq-3O
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:08:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G9tzgdRg6V4aRBxWpzbtFZdDzKG4IFZ/VhXBU8iZDCI=;
 b=In5gVuwqHH5o3uulZ1dCkmUionEyJwYwQUwPae5Kbq/ln7OqtIPz910njlOTvWYu+1Kqr8
 4v1k7+n+wmcgguiFMKqFNXhwow5CmLEEy4wp75lIkI1MWGgv7M2pFj7DmZHc9A8URIbysz
 /n0QRvapj1wxDJq27zfqJrXDs298Xb4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-O3IkJdt9MhC08qaUbpP-lw-1; Wed, 09 Dec 2020 13:08:50 -0500
X-MC-Unique: O3IkJdt9MhC08qaUbpP-lw-1
Received: by mail-wr1-f69.google.com with SMTP id d26so746287wrb.1
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:08:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=G9tzgdRg6V4aRBxWpzbtFZdDzKG4IFZ/VhXBU8iZDCI=;
 b=NhpCg4ivTyDSX4rvjIL+YFtIhwqL6hgllcxi/Q5lQFqV6wZB7PCKdBjUqyv3BiYTWz
 gWg/OzWeJKqBHSE3RWJVfHseFUQY5AKfsBu1QJceEnJsqLWLn318s0unuN6C/hdv+rfq
 tIdoaztd/aU669ZZOihaZ2h80IagQ76h5OZH320gM47XcRpR3jf7wpnENszIfJKWFiKa
 wJEQLx7qqOUu/zCvc0Pwktq9Y7HV/S0nHB5ibOZFhJKkG8rtCoNhCW9W9RhOxsK8UWHn
 BQewAsTJ9Wbf4IrRpFcYxEBGuXaW7I62ETump05veNqaQyCgF6zsey27keQT01r/JMbe
 WS8Q==
X-Gm-Message-State: AOAM533xiRawQtEMGspwmHb1Ld85JIkjJKqtMFKRJuskFq9wfm2FsiQT
 LFWrBlyB7Un3M/RgIUl8mhyEuH5PqMRGkmVJgWp1tB9mAV+JuMhnyeurPtUTDOUZRLNYZx02xpi
 L3IOVRlbESs4QfvfffiMFWJLuUqQvvx3Dr67/FWS6RfuJnSZRxKU7KPwwGj/l
X-Received: by 2002:adf:ead1:: with SMTP id o17mr4177970wrn.396.1607537328900; 
 Wed, 09 Dec 2020 10:08:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzgiKFsWwz1ZQKog/J133OT4kz+pfPkug/5LtO6vuvbh+YdUdk/PXdwEysvc99u/5gPwcFf4Q==
X-Received: by 2002:adf:ead1:: with SMTP id o17mr4177939wrn.396.1607537328677; 
 Wed, 09 Dec 2020 10:08:48 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id o74sm6107598wme.36.2020.12.09.10.08.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:08:48 -0800 (PST)
Date: Wed, 9 Dec 2020 13:08:40 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 27/65] failover: Remove primary_device_dict
Message-ID: <20201209180546.721296-28-mst@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

It was only used once.  And we have there opts->id, so no need for it.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20201118083748.1328-13-quintela@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/virtio-net.h |  1 -
 hw/net/virtio-net.c            | 17 ++++-------------
 2 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
index a055f39dd6..fe353d8299 100644
--- a/include/hw/virtio/virtio-net.h
+++ b/include/hw/virtio/virtio-net.h
@@ -202,7 +202,6 @@ struct VirtIONet {
     AnnounceTimer announce_timer;
     bool needs_vnet_hdr_swap;
     bool mtu_bypass_backend;
-    QDict *primary_device_dict;
     DeviceState *primary_dev;
     char *primary_device_id;
     /* primary failover device is hidden*/
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 953d5c2bc8..6e5a56a230 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3186,28 +3186,21 @@ static int virtio_net_primary_should_be_hidden(DeviceListener *listener,
     if (!device_opts) {
         return -1;
     }
-    n->primary_device_dict = qemu_opts_to_qdict(device_opts,
-                                                n->primary_device_dict);
     standby_id = qemu_opt_get(device_opts, "failover_pair_id");
     if (g_strcmp0(standby_id, n->netclient_name) == 0) {
         match_found = true;
     } else {
         match_found = false;
         hide = false;
-        n->primary_device_dict = NULL;
         goto out;
     }
 
     /* failover_primary_hidden is set during feature negotiation */
     hide = qatomic_read(&n->failover_primary_hidden);
-
-    if (n->primary_device_dict) {
-        g_free(n->primary_device_id);
-        n->primary_device_id = g_strdup(qdict_get_try_str(
-                                            n->primary_device_dict, "id"));
-        if (!n->primary_device_id) {
-            warn_report("primary_device_id not set");
-        }
+    g_free(n->primary_device_id);
+    n->primary_device_id = g_strdup(device_opts->id);
+    if (!n->primary_device_id) {
+        warn_report("primary_device_id not set");
     }
 
 out:
@@ -3396,8 +3389,6 @@ static void virtio_net_device_unrealize(DeviceState *dev)
     if (n->failover) {
         device_listener_unregister(&n->primary_listener);
         g_free(n->primary_device_id);
-        qobject_unref(n->primary_device_dict);
-        n->primary_device_dict = NULL;
     }
 
     max_queues = n->multiqueue ? n->max_queues : 1;
-- 
MST



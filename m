Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9856D2D3301
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 21:12:55 +0100 (CET)
Received: from localhost ([::1]:38070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmjLw-0002IK-UD
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 15:12:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmilV-0005eN-1j
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:35:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmilT-00053p-4m
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:35:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G9tzgdRg6V4aRBxWpzbtFZdDzKG4IFZ/VhXBU8iZDCI=;
 b=SdElqgPlR1LeElFS58Aj7uP4b6d0/yCz9DEFqUI9moI0t7iuP6c7r0Uk5RxjBtU7cb/pim
 aOasPvgMfsojRmTNzgBi889wVWeuX7uVQ0gMi51gDo9I8LW+T4GpzE9qaublmQGvvBjkNI
 beH+CPjRglq6MO3Sil2OGLoSL3ZsvUQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-uiW0zXXEOyeGC1X5aryR8g-1; Tue, 08 Dec 2020 14:35:08 -0500
X-MC-Unique: uiW0zXXEOyeGC1X5aryR8g-1
Received: by mail-wr1-f72.google.com with SMTP id r11so4694433wrs.23
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:35:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=G9tzgdRg6V4aRBxWpzbtFZdDzKG4IFZ/VhXBU8iZDCI=;
 b=Fvkc7wT25YWPJKvenqCvY9PZN7C7VB9LUcJAc4rwaXY6kkvvKip18ApX23KOw38m83
 1+opvqOTecOVWb4vA3IO7xbHoANSTUkACHWb59K1zrbukcWSz+RLp6RfEsE9tya0mFpH
 dP+phijULzrwAnGY+D53g/FA5ZT1lhdjzBmprBOpEMZupDE4qe9Ifx7LMhSzEdXOJGnw
 ob1G3YkCYwWcCZRODrB4+d6NT5tvlsBJte432Y5HIiaiNzoqb++R5vRIc0x7ijtvTTaB
 jt0TY0FEpwwbIMnuG6M9g2iUZgA3LSu9T//34uJtW495iCMoDUaWf9KaJrywGcQ4inRB
 adXw==
X-Gm-Message-State: AOAM533E/X3U5lFcM2I4FZwVw1EMVwiKw4EtQzXjVSq7YKUY4gwLZ3eF
 4joR+R+L9TZhfHS9Op4VES6CbOR2ijhAPZHz98W0Hqahg3djg1vojkTtBkxuEmKgEG5FRzGHjeH
 azECRokqsLo1oRB4rf6vvEujPd9Mh5VzCWR/0Zwxu4baLaFlLNn7gmKJQ0GES
X-Received: by 2002:adf:f5c5:: with SMTP id k5mr7324119wrp.286.1607456106745; 
 Tue, 08 Dec 2020 11:35:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzj5iXAbAXdS1fKYrzk0pU6JUduD/7ybq6WvWVC/gkfgqjGJLE4VmMcr0IHMG8ROEuUGPvo+A==
X-Received: by 2002:adf:f5c5:: with SMTP id k5mr7324106wrp.286.1607456106577; 
 Tue, 08 Dec 2020 11:35:06 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id x9sm21621655wru.55.2020.12.08.11.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:35:05 -0800 (PST)
Date: Tue, 8 Dec 2020 14:35:02 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 27/66] failover: Remove primary_device_dict
Message-ID: <20201208193307.646726-28-mst@redhat.com>
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



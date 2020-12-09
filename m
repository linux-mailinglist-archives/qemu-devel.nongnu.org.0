Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA932D490B
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 19:33:55 +0100 (CET)
Received: from localhost ([::1]:43912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn4Hi-0007m8-1S
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 13:33:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3tP-0002Ol-Cy
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:08:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3tM-0008A0-Cc
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:08:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l0qss9gU1YSRIieMwhZYjklQs2fppW1raaUm6UbwM0U=;
 b=Byahc4xnhe6CaOT//9Y/1kgrr+rrLkOgMQednxQgaVHLAaoNqbuR5hl6N3NDvPT6aDgXh1
 RNWJRihUk8HUa99+o7/EfmcdZ1blgvJm4Pl9Yy11/UKmwqdKHLnvK4m8bb+X6SvXrT6AZH
 yttDJBVqp3JKB3c7sw664NBezlxUv/I=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-mfE3FdVVMNCVLu0FRfmAkg-1; Wed, 09 Dec 2020 13:08:41 -0500
X-MC-Unique: mfE3FdVVMNCVLu0FRfmAkg-1
Received: by mail-wr1-f72.google.com with SMTP id p18so946402wro.9
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:08:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=l0qss9gU1YSRIieMwhZYjklQs2fppW1raaUm6UbwM0U=;
 b=PkNscYqqYjvbI2R/dj0DajrOq+XL4KAiTvht+tMi6blFda6aOztWFTUHErq65EMvm4
 5B6q9UcHKJHN77MTSf/hdZV7fABe4vjdxqDWNwCG4+lCc8ezUydT9GEJA6YkZVsfo0+D
 O0WVcL+cE3X6llRjuVH4V/sQ3E7klDcSH9kNrfAPdaAeNUWkOm/brNuOopk4SfIjbEbj
 cm0rOGFaWhSad0IXYpGEbDKRNr7De+fiWEL9VykOKhwGa/DcBuv0X/qTOtUCTXF50MJF
 xNcwDK8bHyy7BzyPAcWo/UMUSSPvliQVTrowXWgcnvuMVIvwcfXevgmhakEVf8tQKr1I
 VHRw==
X-Gm-Message-State: AOAM530GgfO0iIUQt4hdVOOjQgZR46W8mrdmmzFumXHWeoeLZWzzGWXh
 DXGgvv0vCOEhT4RQ+oVtsAL/XeGjytYSpeWqlHUTndzlelgpphoFGY7q1ZkMklffWhZ/xF/aMtQ
 9xanpCc/ncSc6IcmsPcZg6+QxXmWVI2XVOrCROpHY5msvvIABmZfKeOEgJjC0
X-Received: by 2002:a1c:e342:: with SMTP id a63mr4163337wmh.64.1607537320104; 
 Wed, 09 Dec 2020 10:08:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx/fXNpX6B+TKlOh4OBJe2YH6MysLql/V+v1dPGrxTBvyPGXYviB2tZyVZ5//jHh60IOVagVg==
X-Received: by 2002:a1c:e342:: with SMTP id a63mr4163319wmh.64.1607537319880; 
 Wed, 09 Dec 2020 10:08:39 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id i11sm4766045wrm.1.2020.12.09.10.08.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:08:38 -0800 (PST)
Date: Wed, 9 Dec 2020 13:08:37 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 26/65] failover: remove standby_id variable
Message-ID: <20201209180546.721296-27-mst@redhat.com>
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

We can calculate it, and we only use it once anyways.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20201118083748.1328-12-quintela@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/virtio-net.h |  1 -
 hw/net/virtio-net.c            | 11 +++--------
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
index 7159e6c0a0..a055f39dd6 100644
--- a/include/hw/virtio/virtio-net.h
+++ b/include/hw/virtio/virtio-net.h
@@ -205,7 +205,6 @@ struct VirtIONet {
     QDict *primary_device_dict;
     DeviceState *primary_dev;
     char *primary_device_id;
-    char *standby_id;
     /* primary failover device is hidden*/
     bool failover_primary_hidden;
     bool failover;
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 2a99b0e0f6..953d5c2bc8 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3181,23 +3181,19 @@ static int virtio_net_primary_should_be_hidden(DeviceListener *listener,
     VirtIONet *n = container_of(listener, VirtIONet, primary_listener);
     bool match_found = false;
     bool hide = false;
+    const char *standby_id;
 
     if (!device_opts) {
         return -1;
     }
     n->primary_device_dict = qemu_opts_to_qdict(device_opts,
                                                 n->primary_device_dict);
-    if (n->primary_device_dict) {
-        g_free(n->standby_id);
-        n->standby_id = g_strdup(qdict_get_try_str(n->primary_device_dict,
-                                                   "failover_pair_id"));
-    }
-    if (g_strcmp0(n->standby_id, n->netclient_name) == 0) {
+    standby_id = qemu_opt_get(device_opts, "failover_pair_id");
+    if (g_strcmp0(standby_id, n->netclient_name) == 0) {
         match_found = true;
     } else {
         match_found = false;
         hide = false;
-        g_free(n->standby_id);
         n->primary_device_dict = NULL;
         goto out;
     }
@@ -3400,7 +3396,6 @@ static void virtio_net_device_unrealize(DeviceState *dev)
     if (n->failover) {
         device_listener_unregister(&n->primary_listener);
         g_free(n->primary_device_id);
-        g_free(n->standby_id);
         qobject_unref(n->primary_device_dict);
         n->primary_device_dict = NULL;
     }
-- 
MST



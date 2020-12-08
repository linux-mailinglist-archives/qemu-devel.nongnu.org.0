Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A5D2D32DC
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 20:58:36 +0100 (CET)
Received: from localhost ([::1]:55928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmj87-0002vq-93
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 14:58:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmilU-0005e5-O9
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:35:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmilP-00051x-DW
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:35:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l0qss9gU1YSRIieMwhZYjklQs2fppW1raaUm6UbwM0U=;
 b=W0x+e0AGOyOa6H+mrFhonDYvp1wa2ZXmoOc4oXPTtiDERdVMG2JYFjf732PyGgl+qMZp7F
 UZ8QIOQpX8Yoze73wLUk3J8JtQv7xy7dfFYrrBUJxx2ur2UwmV9bU7YUVmLhRdRYlyLQ3g
 zLTucjbnafMSUSfgCUFMWaIeQdnShP0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-_JUe08EtN2KHbcShJJTMmA-1; Tue, 08 Dec 2020 14:35:04 -0500
X-MC-Unique: _JUe08EtN2KHbcShJJTMmA-1
Received: by mail-wm1-f72.google.com with SMTP id d16so948650wmd.1
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:35:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=l0qss9gU1YSRIieMwhZYjklQs2fppW1raaUm6UbwM0U=;
 b=P0TWOi2HOgrn5uBR5OWGtTkXHoHZskPb6cw4hKAA+i+JPjjpLSRVjuHV5nKVzoj4dd
 PO5FNFSFOSK6mFyt4roiPKaDEpuZIj07rLRraK1ZsbpPo+2t+fDIR7yi++/1bw9LsAiY
 wbBN1DMUEXUno4zecy8jQsrK10UwERxbfWTbmnkoQ+1DjILN+DrONw/aYJ6/AbawAV9w
 uocbLWdW/VsLF1zS2vrNZZlbmkoX+su+1h4fUO1fawztDqRL4S8JChlpLyCA79vYcNnb
 Wj1m6jNZ6PZrg299vzqxxIcGd8NQvSuRwjNXp9SyEm9a6hOBTl7MtcRdq3HNt8/cjgjb
 lzhA==
X-Gm-Message-State: AOAM533PzS84zrlE7oW7XfOMzf85iEvIxCyQcFs4F3M91Hr6pk9Ql0PM
 HI1OkeFbWKqeviawW9ZYsau1GzhMvqqtlcquLe5b6rHIYivlmjqsJP5Hqet9mKpqyF54DMexNLe
 Khi150x0wrYjv6xeBDuNdo8qGD8ZEf1DfzO3M3wOJuEaSrPbRRdasExiHwMRy
X-Received: by 2002:adf:fa05:: with SMTP id m5mr26953661wrr.26.1607456103019; 
 Tue, 08 Dec 2020 11:35:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz4hjLwEi+AcdoPnUnz4Opl+cDDpwdm1j8zDvdrrjtVXfiCH9+aBKwUmSENGKek15hpXi++2g==
X-Received: by 2002:adf:fa05:: with SMTP id m5mr26953632wrr.26.1607456102850; 
 Tue, 08 Dec 2020 11:35:02 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id q4sm5242575wmc.2.2020.12.08.11.35.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:35:02 -0800 (PST)
Date: Tue, 8 Dec 2020 14:34:59 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 26/66] failover: remove standby_id variable
Message-ID: <20201208193307.646726-27-mst@redhat.com>
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



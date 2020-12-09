Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8AD2D491F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 19:37:03 +0100 (CET)
Received: from localhost ([::1]:52402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn4Kk-0002wZ-Fp
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 13:37:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3u2-0003B7-JO
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:09:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3u0-0008LY-Rh
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:09:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/3+qUeIA+zTj+aCO/5vf0lMi8Wl7ZhxONweA15S3yAs=;
 b=D8zXfB0If9Kv9S4075Gy2YKg2lictKBV0xVYap5N23elmt1GSzeKO+3/JoGy9ygE6qjGL6
 /jUkbKt574FuGarDprp+Qr7+XotkuX6mzs2m1IYd6LQ+2cvZOKVA8fK3YIF8GUlcgqadgB
 LetB5n8XOxaCsfQRKdsYSFANMCbKFM8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-HRXFcSTkO_6F-GtP8_N17g-1; Wed, 09 Dec 2020 13:09:19 -0500
X-MC-Unique: HRXFcSTkO_6F-GtP8_N17g-1
Received: by mail-wm1-f70.google.com with SMTP id k128so867791wme.7
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:09:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/3+qUeIA+zTj+aCO/5vf0lMi8Wl7ZhxONweA15S3yAs=;
 b=mc5Yy5nPahvjWPIfVBFBYUJX8WaUoFB8eHXodZVOcONXlpJfjx540ylWCL7L74SDaD
 LAv9LNMhabPPGDFJPQK/tb7Svs6WflHhf5EXlEdigNHPFD5aCrSMWdITE/KSmzcT+P2b
 xUKrbw15cydR5F91ku8z/3AfyNIU4LjikIF7m1WucPZ4L7hsBLujxU4p0opJqitEk6x2
 VAwl+TPXu5SVLoiPfSA+90d1eKu8G4i6uYDTCa5VXUzkXkfmoMF982NmYCaMRvRjx0CZ
 jynqyd/ZIGhSdZE4ZsBb+Vb7/pC+C6XuO60r3y65bsIL25wK5a/PzKh3rj541NeBOqn7
 L4ww==
X-Gm-Message-State: AOAM531X8vroyZvVBbjCod7/Y8Xyko2ySwcyaHLPzeRDrT48HVv4K//C
 A8YIZB0tq3+IQeKroYrKZXrhHZHlJNEGHplOkAJIXAcab4vXZnvgfVWE91GOsj/kArAcKociG4P
 isRH1nKMRjKfwWUNdq9tqOLshru8NHkproYpYWgbn4AEgtUj9g781y1seY5fx
X-Received: by 2002:a1c:4e17:: with SMTP id g23mr2634910wmh.101.1607537358155; 
 Wed, 09 Dec 2020 10:09:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzArSjxY1iqyKgvrZSt+pkmbjPQFq5fZqLfztM+AXZ6gPriDOLDirqqmU94UBqxEkC5qfacAw==
X-Received: by 2002:a1c:4e17:: with SMTP id g23mr2634885wmh.101.1607537357952; 
 Wed, 09 Dec 2020 10:09:17 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id r13sm4750047wrm.25.2020.12.09.10.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:09:17 -0800 (PST)
Date: Wed, 9 Dec 2020 13:09:12 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 33/65] failover: Rename to failover_find_primary_device()
Message-ID: <20201209180546.721296-34-mst@redhat.com>
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

This commit:
* Rename them to failover_find_primary_devices() so
  - it starts with failover_
  - it don't connect anything, just find the primary device
* Create documentation for the function

Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20201118083748.1328-19-quintela@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/virtio-net.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index c6200b924e..ff82f1017d 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -826,7 +826,13 @@ static int is_my_primary(void *opaque, QemuOpts *opts, Error **errp)
     return ret;
 }
 
-static DeviceState *virtio_net_find_primary(VirtIONet *n, Error **errp)
+/**
+ * Find the primary device for this failover virtio-net
+ *
+ * @n: VirtIONet device
+ * @errp: returns an error if this function fails
+ */
+static DeviceState *failover_find_primary_device(VirtIONet *n, Error **errp)
 {
     Error *err = NULL;
 
@@ -891,7 +897,7 @@ static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
         qatomic_set(&n->failover_primary_hidden, false);
         failover_add_primary(n, &err);
         if (err) {
-            n->primary_dev = virtio_net_find_primary(n, &err);
+            n->primary_dev = failover_find_primary_device(n, &err);
             if (err) {
                 goto out_err;
             }
@@ -3115,7 +3121,7 @@ static void virtio_net_handle_migration_primary(VirtIONet *n,
     should_be_hidden = qatomic_read(&n->failover_primary_hidden);
 
     if (!n->primary_dev) {
-        n->primary_dev = virtio_net_find_primary(n, &err);
+        n->primary_dev = failover_find_primary_device(n, &err);
         if (!n->primary_dev) {
             return;
         }
-- 
MST



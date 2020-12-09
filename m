Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D232D49D8
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 20:10:50 +0100 (CET)
Received: from localhost ([::1]:60108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn4rR-00053a-8d
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 14:10:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3tl-0002oF-QE
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:09:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3tk-0008GB-4Q
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:09:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iPcVMbbC9/jyi7aveu8uhy5sTDIu0BY2gLP3FrJ8Aig=;
 b=FV+srYC/tbqz0fR3tUD00wsnwY691IyaS6KN5lS5ugQT4Np8rJU6lPM6OMBUaFIV0QkZ8O
 BAa4eCCSVLiH3yULaq5ofcbfLPHFLvLThCp56qcWVEHvrP/jdZempnAZKFqyTbakqIwPjq
 ZlBHcoF/CqvISnsPMozRWdEoedsxmMg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-QkUKU9uoPVekLuHM38e4NQ-1; Wed, 09 Dec 2020 13:09:04 -0500
X-MC-Unique: QkUKU9uoPVekLuHM38e4NQ-1
Received: by mail-wr1-f69.google.com with SMTP id o4so936719wrw.19
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:09:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iPcVMbbC9/jyi7aveu8uhy5sTDIu0BY2gLP3FrJ8Aig=;
 b=T18iZrAXpWcw8Ffj3W0e13jFN/f3cFV2DyLkAlQTymqx7assznNMXFpTlJkw0dQsBz
 MkBmBsUhq0OLltE57FyXfRAVS9QNYdlgPTnKjLBljv35iqG4GggRLTYjCJnEaZQbslpa
 7iLpDdTZa3ZXeOeQ/LfC3NcnPo9y5dV9heKiP35NMgf89ZLAQFZcghXmhM49zU22oVq9
 qSlrZeGXnU5+Cl9sdcfYwrd3jE8fMygu6NHvQBTyH7m+xPmmBBSIVE+8JwvBDwoIesru
 6/nnNr0/KZFl/a87ltFK0yjTHJTWPyHZAgc1m+tVqg1kc9FRST4uP7zKMKD5Z9GIRZyG
 8z/g==
X-Gm-Message-State: AOAM533Tx+txdtii04jn+9u/5P4QyJGW82KVqS6ynQquSq5B7KtB3Pir
 1TTUm0wDW+Z4i/Pw2blYK+LXbL+5srXRJbMfl5GOKIly8eNIgcuF5WBSBwNsEM6Z2e96MFIdRGl
 MEjU3YVdpl/0bRM/ugnolKbHn+OU02GPPF3A9O8f42cuZuyGq3bTpxxZuq5l4
X-Received: by 2002:adf:eb05:: with SMTP id s5mr4045633wrn.333.1607537343440; 
 Wed, 09 Dec 2020 10:09:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzY1gMBCXr5AmYOUCX9lFqWTbHTOUCvxawm0fRC3QdVLkcQ6ZAUVAK/X7+QUq7ueCfXmGGfaA==
X-Received: by 2002:adf:eb05:: with SMTP id s5mr4045617wrn.333.1607537343285; 
 Wed, 09 Dec 2020 10:09:03 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id u3sm2904957wre.54.2020.12.09.10.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:09:02 -0800 (PST)
Date: Wed, 9 Dec 2020 13:08:52 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 29/65] failover: simplify virtio_net_find_primary()
Message-ID: <20201209180546.721296-30-mst@redhat.com>
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

a - is_my_primary() never sets one error
b - If we return 1, primary_device_id is always set

Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20201118083748.1328-15-quintela@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/virtio-net.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 70fa372c08..881907d1bd 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -828,24 +828,12 @@ static int is_my_primary(void *opaque, QemuOpts *opts, Error **errp)
 
 static DeviceState *virtio_net_find_primary(VirtIONet *n, Error **errp)
 {
-    DeviceState *dev = NULL;
     Error *err = NULL;
 
-    if (qemu_opts_foreach(qemu_find_opts("device"),
-                          is_my_primary, n, &err)) {
-        if (err) {
-            error_propagate(errp, err);
-            return NULL;
-        }
-        if (n->primary_device_id) {
-            dev = qdev_find_recursive(sysbus_get_default(),
-                                      n->primary_device_id);
-        } else {
-            error_setg(errp, "Primary device id not found");
-            return NULL;
-        }
+    if (!qemu_opts_foreach(qemu_find_opts("device"), is_my_primary, n, &err)) {
+        return NULL;
     }
-    return dev;
+    return qdev_find_recursive(sysbus_get_default(), n->primary_device_id);
 }
 
 static DeviceState *virtio_connect_failover_devices(VirtIONet *n, Error **errp)
-- 
MST



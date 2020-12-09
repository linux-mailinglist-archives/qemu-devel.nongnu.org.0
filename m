Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E3D2D4915
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 19:34:57 +0100 (CET)
Received: from localhost ([::1]:45240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn4Ii-0008KM-A4
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 13:34:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3t1-0002BX-3F
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:08:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3sy-00084h-0T
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:08:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DyhXDtuex14GnTmqS7jV7i/02scrPG/xS6z1km7MojI=;
 b=N9IW4wD0YN9AXuIGGXtTQ+dKJCrbRg/VdBeih7WxnmHwEXy3G8uXSfaYs4WI0XwM0hYY19
 ZopjHM0HWNHeyasmC6NxCztwET8wSnnzSyTSNJTQ6tJBilULNeUU3EfAQT94vm+EAkvtR8
 t0gEYsUtanS9uY0R96kpGOFeDbP/NS8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-Am--bv8OMe23rIGhbqxsFA-1; Wed, 09 Dec 2020 13:08:16 -0500
X-MC-Unique: Am--bv8OMe23rIGhbqxsFA-1
Received: by mail-wr1-f72.google.com with SMTP id 91so941597wrk.17
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:08:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DyhXDtuex14GnTmqS7jV7i/02scrPG/xS6z1km7MojI=;
 b=FO7lLCOdA+GOvK0Zy9rXFua0Eeu21L0sxTYeFxFdBpiXn1k7UhledCxuyEz3VCT290
 DBSWH1DW5aFw6zKIA8wUWpOWU6YKg49wbN0y7y9d7BKmZKLZ4Oh98F9uihRkuadCM2H2
 wJoTSG7u6fEzmo2evIwMzC4bemtSDwKBn8Wbh9ZgAhMJDDel83N4ETXTyiUkf6FX/uMd
 vrTXNPdDC+32bsk2KHVZpHccYgMgweNcm/fs1ROGR1fqu4sOmxq7lUAj7+Yj5mCROAbj
 wqPTgECDwiKSa08BXxrd9lmw3+Db/v8MkXZ6uqko9fmV6eqXsNMaMekTMY8LnudQRi9F
 qJOw==
X-Gm-Message-State: AOAM530ISqLHCpx0c1/8dF70Z28MAaEQz+d1pvAzIy2js3Ct42wEzOew
 znWU7IQeSmyESMZxPE+a77zoASvpn9FBse1nH+S9Hk6C5ujcu/FOBeKcM/F6U03eMMazixv6kWK
 C5a7HnQ00RfUuQLjMEqPjaQgbz0NieptAz3O2h8Cq9eqClK8OOWZRqhH8tN2Y
X-Received: by 2002:adf:9167:: with SMTP id j94mr4044317wrj.249.1607537294555; 
 Wed, 09 Dec 2020 10:08:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwkvPekH2hNn6UgOy/0cp+DGufcVB9UgVBXthPn3/qTe4jQz1RNYN7BzL55cCdVarLZr2S7oQ==
X-Received: by 2002:adf:9167:: with SMTP id j94mr4044287wrj.249.1607537294346; 
 Wed, 09 Dec 2020 10:08:14 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id s8sm4483939wrn.33.2020.12.09.10.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:08:13 -0800 (PST)
Date: Wed, 9 Dec 2020 13:08:12 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 20/65] failover: Remove unused parameter
Message-ID: <20201209180546.721296-21-mst@redhat.com>
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

Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20201118083748.1328-6-quintela@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/virtio-net.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 786d313330..3f658d6246 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -855,9 +855,7 @@ static DeviceState *virtio_net_find_primary(VirtIONet *n, Error **errp)
     return dev;
 }
 
-static DeviceState *virtio_connect_failover_devices(VirtIONet *n,
-                                                    DeviceState *dev,
-                                                    Error **errp)
+static DeviceState *virtio_connect_failover_devices(VirtIONet *n, Error **errp)
 {
     DeviceState *prim_dev = NULL;
     Error *err = NULL;
@@ -928,7 +926,7 @@ static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
         qatomic_set(&n->primary_should_be_hidden, false);
         failover_add_primary(n, &err);
         if (err) {
-            n->primary_dev = virtio_connect_failover_devices(n, n->qdev, &err);
+            n->primary_dev = virtio_connect_failover_devices(n, &err);
             if (err) {
                 goto out_err;
             }
@@ -3164,7 +3162,7 @@ static void virtio_net_handle_migration_primary(VirtIONet *n,
     should_be_hidden = qatomic_read(&n->primary_should_be_hidden);
 
     if (!n->primary_dev) {
-        n->primary_dev = virtio_connect_failover_devices(n, n->qdev, &err);
+        n->primary_dev = virtio_connect_failover_devices(n, &err);
         if (!n->primary_dev) {
             return;
         }
-- 
MST



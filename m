Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 241B32D4A31
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 20:31:33 +0100 (CET)
Received: from localhost ([::1]:44700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn5BT-0006Ln-SM
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 14:31:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3xZ-0006IC-PR
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:13:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3xX-0001BT-Cp
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:13:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fuBQFRVVX5MCCmBwSGkeXs98mE92CY1nTcQhJRlOYBs=;
 b=CoMLWyP5P/HtwbL0LGaSGzTvyTBMnYxeNIs0Zhw/kBo09IFrz9YB4zFgM9FCQa5ngbCTk1
 131zX0/Zc4zZAMDVFprYZogWvYeci8Ka9bOOevuIzv7upnJiXVPwZG6LiuDCz6jnGs6JGL
 vXuOdxJFnGHXcrd6BxXySdni+1qNv3s=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-VQhC8_oDNy-RsobirYuxxg-1; Wed, 09 Dec 2020 13:09:32 -0500
X-MC-Unique: VQhC8_oDNy-RsobirYuxxg-1
Received: by mail-wr1-f72.google.com with SMTP id d26so747017wrb.1
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:09:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fuBQFRVVX5MCCmBwSGkeXs98mE92CY1nTcQhJRlOYBs=;
 b=GvHS5FhhhlDdNnCn+MFRGsMcyFTlc488Ygrew6zkHeMM8a6SijB87EEdHU45VxSM1U
 5BtvyJitG4u5BV8eYTRogxtcT1ifBHUV6b4lYwAsgHAPNlI0Lb3udNNVV0AjQ/ksMzK1
 zZZdo89QGGpOZjM+Yq7eZAvxRJQ396TQSBrWi79Xbd07MuIFf2ZzeoEgSc0cDNfXDi3h
 QoPMK5SPggXDruo6IZJNZaGr62U3Wlt580ojHcr9bHRc9RA3BcbDzMmo1O8rYaWm9QbO
 gZgTllXOdj0zZeIJQUF29ClWo1uxLJyAGLKXXp0qhKgeyQTPpKQzSKpArZgIuquYb0dO
 ETbQ==
X-Gm-Message-State: AOAM530b2rajyHuFDQwSSVrfa8iA7360thlr2eOIsDQeWtttUds2uyLA
 SS9dHY5Y7loezDACg7aUYOdYgEoMkexP4Yn5O3wFrHXfRXXjgHO05FHJoUcVBF74YoE3tnk7sl+
 KEjsKQlgn4RjvZPGZctDitO/S+dhcr1YiWs9iQ9uTiB9W++MlhgwMHQKDdfqc
X-Received: by 2002:a05:6000:12c3:: with SMTP id
 l3mr4090594wrx.112.1607537370685; 
 Wed, 09 Dec 2020 10:09:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQicQgm1lClpphHV6GFbrPzTBtkL9be29xcEAizrnNbzPsfKOMFt7hhMKCp00Y8PTHipA6uw==
X-Received: by 2002:a05:6000:12c3:: with SMTP id
 l3mr4090570wrx.112.1607537370478; 
 Wed, 09 Dec 2020 10:09:30 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id r128sm5156547wma.5.2020.12.09.10.09.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:09:29 -0800 (PST)
Date: Wed, 9 Dec 2020 13:09:28 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 37/65] failover: remove failover_find_primary_device()
 error parameter
Message-ID: <20201209180546.721296-38-mst@redhat.com>
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

It can never give one error.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20201118083748.1328-23-quintela@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/virtio-net.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index c708c03cf6..b994796734 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -832,7 +832,7 @@ static int is_my_primary(void *opaque, QemuOpts *opts, Error **errp)
  * @n: VirtIONet device
  * @errp: returns an error if this function fails
  */
-static DeviceState *failover_find_primary_device(VirtIONet *n, Error **errp)
+static DeviceState *failover_find_primary_device(VirtIONet *n)
 {
     Error *err = NULL;
 
@@ -897,10 +897,7 @@ static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
         qatomic_set(&n->failover_primary_hidden, false);
         failover_add_primary(n, &err);
         if (err) {
-            n->primary_dev = failover_find_primary_device(n, &err);
-            if (err) {
-                goto out_err;
-            }
+            n->primary_dev = failover_find_primary_device(n);
             failover_add_primary(n, &err);
             if (err) {
                 goto out_err;
@@ -3121,7 +3118,7 @@ static void virtio_net_handle_migration_primary(VirtIONet *n,
     should_be_hidden = qatomic_read(&n->failover_primary_hidden);
 
     if (!n->primary_dev) {
-        n->primary_dev = failover_find_primary_device(n, &err);
+        n->primary_dev = failover_find_primary_device(n);
         if (!n->primary_dev) {
             return;
         }
-- 
MST



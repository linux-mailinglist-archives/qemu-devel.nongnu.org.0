Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 555C42D32F7
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 21:06:57 +0100 (CET)
Received: from localhost ([::1]:49752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmjGC-0003hk-CN
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 15:06:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmimA-0006Qq-6i
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:35:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmim8-0005Rk-FB
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:35:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fuBQFRVVX5MCCmBwSGkeXs98mE92CY1nTcQhJRlOYBs=;
 b=D/I1mAg8arCJlsfcxufSUgI4H0TymyTV5qIfSdQU6y/rBgav7+s5qV/vpPFEmhk6rujJaF
 Vh1K/AsNau+FTXpYzhTFiALiEaa//ZK8Yv1tb3hO8t+l+E7I/9zX6zbHYfXYt2Euz7RFWE
 qEOVrvfO0NwQN8Ibuhh1AeaCo2nFJmk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-y3LiqYkePumE3OJCE_9hiw-1; Tue, 08 Dec 2020 14:35:49 -0500
X-MC-Unique: y3LiqYkePumE3OJCE_9hiw-1
Received: by mail-wm1-f72.google.com with SMTP id j62so1278584wma.4
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:35:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fuBQFRVVX5MCCmBwSGkeXs98mE92CY1nTcQhJRlOYBs=;
 b=WnMycYfDb7qHsCZY9Q8yg25m8E+Uscg89s0sYkIlMO4H6M0CWPj2BgGJdj/LxU/QJB
 pygy3kE1q5G8vK9JvzXF+fXtJBOLysV9Fb6MSb2hVqm25KXIYts8cWBWlZpbckHgdY/W
 UekxBACYOirTmqALJpl5/5jpHesAUw1JIPW2HDatQ2lNkZmyIKVzZKrdLM90A+3t/Mzm
 Yt3/WrW6m/acHeItPE+canpTIBkBpxhUQZNnQY7rxOYWhPNC/pEy/WaSYHPj7jinhs7k
 rdpCuk/3pmzEXLMIGzD8EMpeR9E7bsoI+yqXEKxhpQzzxkKheOcmgDKsrCeBb3VmPxEr
 sL8Q==
X-Gm-Message-State: AOAM530ZocLl9X5YG4Zd6AUnSAc1yoTxswTOLFARflUWB8XnSQfYNk4I
 guSAPhIAPCCo59aiLtsKKXzSNVwWxIq+5hk+uA/wI/luEIP2Cjp41aGVx8o8PKdlWnNGPLb0860
 lWQD897MmEgNrzLl+gJTPAmYMniAy2KzBDqD0xLOEUKykYH7dUZRFVfI8PLN3
X-Received: by 2002:adf:e551:: with SMTP id z17mr26490776wrm.374.1607456148335; 
 Tue, 08 Dec 2020 11:35:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwbBJput458uLDflKY0c7iSbARtZ5JBsuD3NrtmkID6AEtyjnG/RBPRy+NRuyb6paQa0cSwUA==
X-Received: by 2002:adf:e551:: with SMTP id z17mr26490757wrm.374.1607456148122; 
 Tue, 08 Dec 2020 11:35:48 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id w13sm11814554wrt.52.2020.12.08.11.35.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:35:47 -0800 (PST)
Date: Tue, 8 Dec 2020 14:35:45 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 37/66] failover: remove failover_find_primary_device() error
 parameter
Message-ID: <20201208193307.646726-38-mst@redhat.com>
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



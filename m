Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8425B2D32D3
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 20:54:35 +0100 (CET)
Received: from localhost ([::1]:43912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmj4E-0006R2-JK
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 14:54:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmilG-0005JP-Ih
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:34:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmil2-0004vr-4x
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:34:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bvk6Ny86rso8mg1Vb1kLOvKe4SXQYHEXQ5syAnjwF2M=;
 b=YM4exSsbbzQL/6ylOPopDiNFoHDkrTojLHuv1pehr/vBEdEXlN40WYIu//YqS5IGNpH0Rv
 vYGrv2H7WZn3EEIxLWRhRlII/45A3EIG/8fhZbpvuIC/v+7CQx+BYJkqk4fVJH4r/1FbS1
 B6qRGW/gzb7UTiAF6fPfxwC23AzHfzk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-2vjT7ux_NUW_fKhw3C1Z_Q-1; Tue, 08 Dec 2020 14:34:40 -0500
X-MC-Unique: 2vjT7ux_NUW_fKhw3C1Z_Q-1
Received: by mail-wr1-f70.google.com with SMTP id b5so6568388wrp.3
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:34:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bvk6Ny86rso8mg1Vb1kLOvKe4SXQYHEXQ5syAnjwF2M=;
 b=swThCqBzfvsgCYfo5U4VqWfY++AWSwLjaIcUgk7q14dbTH9q43aqGsjTL3lMxTo5gC
 ZSLuvxhYXu1XvTCWgpKUyhFsrWhZT2njCHdLigsKYyp3V5K5K4Lh48h8g0HLMYHw4MHX
 yWsaxYk7/m1RXxE0Nj8Lby8a8i1gd4APQDx5HLmCq1NVBv7wpN17G54WQ943I823waf7
 qt+OML9Du2m0CmDsxe+xS+Es+Jo1a4xoF8CqhPN28A0+ry3PZJK/iaG54eEjO0X07ET9
 bHVgdaDQMOFIxLPjXwYFCCGZawdOsh/ndpuSeu53LX1S1HmceOmnbUexjqRuPh7wvfYV
 TiAQ==
X-Gm-Message-State: AOAM531ZnqZXqJs9hQinMteUq735tf8Tqwfqh01f7mcmNSklIiQSXKcQ
 4jpOadMe8C3MUOmVsG+eSij44ROxXE/PKD8szZaJ1r1ywx5UsZcZe58Mgh303wzPhCFBGfZgmYd
 EkrpsP2j9gIiEZlPO/fMq0t8+Pw7Kpm9hvsIjyCFSH9DxmVTrWA+uBO9DxLkz
X-Received: by 2002:a5d:42cf:: with SMTP id t15mr14448581wrr.267.1607456078759; 
 Tue, 08 Dec 2020 11:34:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzidYw7CHsFGV0sXQ9V4vQ0EwbKiJX3hkCILWb7FT4bOdCIZhkdxeil0nExkaSlkMNRN8lq8w==
X-Received: by 2002:a5d:42cf:: with SMTP id t15mr14448567wrr.267.1607456078600; 
 Tue, 08 Dec 2020 11:34:38 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id v125sm5024362wme.42.2020.12.08.11.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:34:37 -0800 (PST)
Date: Tue, 8 Dec 2020 14:34:35 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/66] failover: primary bus is only used once, and where it
 is set
Message-ID: <20201208193307.646726-20-mst@redhat.com>
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

Just remove the struct member.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20201118083748.1328-5-quintela@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/virtio-net.h | 1 -
 hw/net/virtio-net.c            | 8 ++++----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
index f4852ac27b..c8da637d40 100644
--- a/include/hw/virtio/virtio-net.h
+++ b/include/hw/virtio/virtio-net.h
@@ -205,7 +205,6 @@ struct VirtIONet {
     QemuOpts *primary_device_opts;
     QDict *primary_device_dict;
     DeviceState *primary_dev;
-    BusState *primary_bus;
     char *primary_device_id;
     char *standby_id;
     bool primary_should_be_hidden;
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index a0fa63e7cb..786d313330 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -804,7 +804,6 @@ static void failover_add_primary(VirtIONet *n, Error **errp)
             qemu_opts_del(n->primary_device_opts);
         }
         if (n->primary_dev) {
-            n->primary_bus = n->primary_dev->parent_bus;
             if (err) {
                 qdev_unplug(n->primary_dev, &err);
                 qdev_set_id(n->primary_dev, "");
@@ -3118,6 +3117,7 @@ static bool failover_replug_primary(VirtIONet *n, Error **errp)
     Error *err = NULL;
     HotplugHandler *hotplug_ctrl;
     PCIDevice *pdev = PCI_DEVICE(n->primary_dev);
+    BusState *primary_bus;
 
     if (!pdev->partially_hotplugged) {
         return true;
@@ -3130,12 +3130,12 @@ static bool failover_replug_primary(VirtIONet *n, Error **errp)
             return false;
         }
     }
-    n->primary_bus = n->primary_dev->parent_bus;
-    if (!n->primary_bus) {
+    primary_bus = n->primary_dev->parent_bus;
+    if (!primary_bus) {
         error_setg(errp, "virtio_net: couldn't find primary bus");
         return false;
     }
-    qdev_set_parent_bus(n->primary_dev, n->primary_bus, &error_abort);
+    qdev_set_parent_bus(n->primary_dev, primary_bus, &error_abort);
     qatomic_set(&n->primary_should_be_hidden, false);
     if (!qemu_opt_set_bool(n->primary_device_opts,
                            "partially_hotplugged", true, errp)) {
-- 
MST



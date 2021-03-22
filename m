Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C8B3452C1
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 00:06:35 +0100 (CET)
Received: from localhost ([::1]:38600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOTd4-0003MJ-0W
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 19:06:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOTWp-0006jx-SO
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 19:00:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOTWj-00014b-QU
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 19:00:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616454001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Nqu5CR5/71RBCEO2pfu+7+JzFwUquycm34gwnLoLIUQ=;
 b=F6U0AHmO/eFcvU6wiS0rtDg8leB8dZAYNPn6M7eUrAWEgtXxhXxNgHh1anPCC0h2pADGgy
 +EDfqj7r8N/ZcwvowfWi9lAzOJcBqYxICN583+z9x/3tPF4ISw6jCjzxLaqyT2RMpxYS07
 8p7V7Qo6uZufdDv1yVoMlb5+jtE2LsY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384--rPUKOOIMXCBHKk7kcalWw-1; Mon, 22 Mar 2021 18:59:58 -0400
X-MC-Unique: -rPUKOOIMXCBHKk7kcalWw-1
Received: by mail-wr1-f70.google.com with SMTP id h5so143414wrr.17
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 15:59:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Nqu5CR5/71RBCEO2pfu+7+JzFwUquycm34gwnLoLIUQ=;
 b=Rtvqv7uTcv5F6Xjnl1QtY2n2lPL4iPLTjz5rx+2+mpo2DaPlP6wrPTftbmA0rphqjs
 s/vkSqlZP9Es14+MOqiidE7y1oUvwJf+WUt3jVmmurxxLbzo9U72ngfL+GQ21OEisn0T
 81a5C+FK6MLx3cdrJSmLNajrDtklMl++s7LZ+Z8ZV+1wLCBzL/AEbbEmVMFI5Wl5CEZM
 l/xjmBbwuP4AsHpwNgfPK7CikBBVY2w+Ke0F/mW4ZL5BWyc6BWsKbys/h+3blrfo2cGZ
 DUVQM9To7QGg6KzkgOUZKeCVuovMDctIQrOiTzt72M0tt8POd/JbRXF8um/D9f7nb2KC
 Dq9A==
X-Gm-Message-State: AOAM5320tOz6msry/B20zFSakysGNz9848DZXNA75fa3RUDz4z9LiuwI
 UF7rdJJOHEPftiC3Jdueo0ztnEAW/xLKVYF5b/boLtyGeg+mE2XGyS2WwVH3H2Q2E76Bd8sxpdt
 sS7RCB5Un4nNDF8etbwmOlTUjQacRH/Usaaxe2kPwSWTB0QcTjAb5Vf5oiMb1
X-Received: by 2002:adf:a302:: with SMTP id c2mr833660wrb.212.1616453997354;
 Mon, 22 Mar 2021 15:59:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXlFiMnvLYdab8pPcOXb+/G1FxDQ0BM5Gatuk+fKo29jYA5dTW33zzIhJuIwdTKqI4R6oQwQ==
X-Received: by 2002:adf:a302:: with SMTP id c2mr833644wrb.212.1616453997196;
 Mon, 22 Mar 2021 15:59:57 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id u2sm997328wmm.5.2021.03.22.15.59.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 15:59:56 -0700 (PDT)
Date: Mon, 22 Mar 2021 18:59:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 01/19] virtio: Fix virtio_mmio_read()/virtio_mmio_write()
Message-ID: <20210322225907.541943-2-mst@redhat.com>
References: <20210322225907.541943-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210322225907.541943-1-mst@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <laurent@vivier.eu>

Both functions don't check the personality of the interface (legacy or
modern) before accessing the configuration memory and always use
virtio_config_readX()/virtio_config_writeX().

With this patch, they now check the personality and in legacy mode
call virtio_config_readX()/virtio_config_writeX(), otherwise call
virtio_config_modern_readX()/virtio_config_modern_writeX().

This change has been tested with virtio-mmio guests (virt stretch/armhf and
virt sid/m68k) and virtio-pci guests (pseries RHEL-7.3/ppc64 and /ppc64le).

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210314200300.3259170-1-laurent@vivier.eu>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-mmio.c | 74 +++++++++++++++++++++++++++++------------
 1 file changed, 52 insertions(+), 22 deletions(-)

diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
index 6990b9879c..342c918ea7 100644
--- a/hw/virtio/virtio-mmio.c
+++ b/hw/virtio/virtio-mmio.c
@@ -112,15 +112,28 @@ static uint64_t virtio_mmio_read(void *opaque, hwaddr offset, unsigned size)
 
     if (offset >= VIRTIO_MMIO_CONFIG) {
         offset -= VIRTIO_MMIO_CONFIG;
-        switch (size) {
-        case 1:
-            return virtio_config_readb(vdev, offset);
-        case 2:
-            return virtio_config_readw(vdev, offset);
-        case 4:
-            return virtio_config_readl(vdev, offset);
-        default:
-            abort();
+        if (proxy->legacy) {
+            switch (size) {
+            case 1:
+                return virtio_config_readb(vdev, offset);
+            case 2:
+                return virtio_config_readw(vdev, offset);
+            case 4:
+                return virtio_config_readl(vdev, offset);
+            default:
+                abort();
+            }
+        } else {
+            switch (size) {
+            case 1:
+                return virtio_config_modern_readb(vdev, offset);
+            case 2:
+                return virtio_config_modern_readw(vdev, offset);
+            case 4:
+                return virtio_config_modern_readl(vdev, offset);
+            default:
+                abort();
+            }
         }
     }
     if (size != 4) {
@@ -245,20 +258,37 @@ static void virtio_mmio_write(void *opaque, hwaddr offset, uint64_t value,
 
     if (offset >= VIRTIO_MMIO_CONFIG) {
         offset -= VIRTIO_MMIO_CONFIG;
-        switch (size) {
-        case 1:
-            virtio_config_writeb(vdev, offset, value);
-            break;
-        case 2:
-            virtio_config_writew(vdev, offset, value);
-            break;
-        case 4:
-            virtio_config_writel(vdev, offset, value);
-            break;
-        default:
-            abort();
+        if (proxy->legacy) {
+            switch (size) {
+            case 1:
+                virtio_config_writeb(vdev, offset, value);
+                break;
+            case 2:
+                virtio_config_writew(vdev, offset, value);
+                break;
+            case 4:
+                virtio_config_writel(vdev, offset, value);
+                break;
+            default:
+                abort();
+            }
+            return;
+        } else {
+            switch (size) {
+            case 1:
+                virtio_config_modern_writeb(vdev, offset, value);
+                break;
+            case 2:
+                virtio_config_modern_writew(vdev, offset, value);
+                break;
+            case 4:
+                virtio_config_modern_writel(vdev, offset, value);
+                break;
+            default:
+                abort();
+            }
+            return;
         }
-        return;
     }
     if (size != 4) {
         qemu_log_mask(LOG_GUEST_ERROR,
-- 
MST



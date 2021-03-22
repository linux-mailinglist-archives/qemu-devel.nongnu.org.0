Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4E63449ED
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 16:55:52 +0100 (CET)
Received: from localhost ([::1]:57086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOMuF-0008Th-3V
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 11:55:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOMjV-0004SO-HZ
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:44:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOMjS-0006pL-Uf
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:44:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616427882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Nqu5CR5/71RBCEO2pfu+7+JzFwUquycm34gwnLoLIUQ=;
 b=MqgGlJHgpf4+jORHRGfYXbgcFvwzQp1qmQAZprIggTnv2uHe9nLO5B2ZYIVgut7r6dGimI
 9HcavEcpwT8JhrHEOYQDVfU8QqJQXJdiIpYz/ILMHEPYiCkCLYkpDwgo2HeWgvLwqPt2+Y
 NYSzbrKj7z6Wm/9mtU4wRuZDvL5l6QE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-OQ16Xz-fMqKC5mwZrAJAGg-1; Mon, 22 Mar 2021 11:44:40 -0400
X-MC-Unique: OQ16Xz-fMqKC5mwZrAJAGg-1
Received: by mail-wm1-f71.google.com with SMTP id y9so5038881wma.4
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 08:44:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Nqu5CR5/71RBCEO2pfu+7+JzFwUquycm34gwnLoLIUQ=;
 b=eVzG1yUbtoMsQEc+1zlPzwaq0ZCRxAI0j/0XZ80+GcZ0Hm6lkFy9GEk3GmAkPM0jMq
 rtx9BzVWnr0zwClvcesqQiEx0OWz5ZEZGyprrpqkT14P4JoDdTDrXHtnwdvQv59o7E/5
 mN27BZBRBuDe3gbeTZTWnVCH7HeY7GBRDGH1yrWZT3Q8/aoJGBZspeGUTphj/PJ4cHW4
 +ivsCwQlbXGWAedmpgy1gezqxIuyk+hs7P1X46Ov5/5Q6JuBe4Q59c8tLwYbswdegidd
 OJFXfIdNp47sWZLfbLtYaB9+k/uu8g74G8NN0e/7HQX8AIB5opsCHeZDnseF5HhnBYPQ
 kwfQ==
X-Gm-Message-State: AOAM531ni3ceI7fDK5weRqLBk2D8xRbZ2ncMZBNsj5RLEz6VSYMS60Vm
 4Jn14aAs+U9ktwEbRVze0QlBjR+49lhdQRuX6tkPHG9rp5AAtZWsrUTBpVPAPxdb1W2f6VLLP5q
 rmtnF5vPvptJrkjgfQNJy+tfjnzDAfunYbom58GQb4eDJwuLRtqe+gH9Ik1yk
X-Received: by 2002:adf:80c8:: with SMTP id 66mr173604wrl.344.1616427879008;
 Mon, 22 Mar 2021 08:44:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLtCK6iLqAyTXV/yabbLUBlSBPVX52Q9+gQkM6ynClsEB+hH0SY5Eu8sUMPkNBgYVtC+wgJw==
X-Received: by 2002:adf:80c8:: with SMTP id 66mr173587wrl.344.1616427878769;
 Mon, 22 Mar 2021 08:44:38 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id v14sm19469610wrd.48.2021.03.22.08.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 08:44:38 -0700 (PDT)
Date: Mon, 22 Mar 2021 11:44:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/20] virtio: Fix virtio_mmio_read()/virtio_mmio_write()
Message-ID: <20210322154417.524229-2-mst@redhat.com>
References: <20210322154417.524229-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210322154417.524229-1-mst@redhat.com>
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



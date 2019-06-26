Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA7855EB8
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jun 2019 04:34:24 +0200 (CEST)
Received: from localhost ([::1]:36320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfxlO-0002jr-RD
	for lists+qemu-devel@lfdr.de; Tue, 25 Jun 2019 22:34:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48227)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <elohimes@gmail.com>) id 1hfxjH-0001Vy-Nj
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 22:32:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <elohimes@gmail.com>) id 1hfxj9-0001jE-NY
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 22:32:06 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:47075)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <elohimes@gmail.com>) id 1hfxj9-0001fG-Fd
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 22:32:03 -0400
Received: by mail-pg1-x52e.google.com with SMTP id v9so386699pgr.13
 for <qemu-devel@nongnu.org>; Tue, 25 Jun 2019 19:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ZANkgcEABhOltym3gLKIP0mcuZJzRoKGZl25eRTEJFU=;
 b=J2LQS1kRcu5HSJZh6fvzxCSTxlLQ8agb0MsunsieFMLh4JXQgrYXAzhI1uImXHLDlN
 bYOkVJdDAqZa5zQIelaB3vDIOjhAjJiOh7GWIKDQCu639PSt8dZ3gF2Hx9zqUYgyqzpj
 PPhYw2H8QB3kTfVDFVUPkVF28GMJPlKJOIHGYdKo8Z0u/AiszeFlWOOT8LQK4/p+jAbi
 9Mllp8OGiygWZxbZeRtHVwRpxxzuc3vbq6cRhfxNICR6F51HxGn3JT/fb8Fcr/n7PDQT
 owwVk5/Sm1aWG0tMGgvivsHCbPcyRls0w9S/t0Mv/QsQ2L8zGqOiaX5QgUN0I7iKFHf5
 u7Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ZANkgcEABhOltym3gLKIP0mcuZJzRoKGZl25eRTEJFU=;
 b=eKvij9FQK1/LNrGEr85jhmnX/PfIRYYJepD0gl1kRzeyCU6M6/1FGtCQJFl5SOhPG2
 2XrOHSeLN2uWWkLn2fDHgfGnvk8NcuMeq0iU6+N9KeD4Fe9RZsa9UF2EJkDigm2yT1DB
 Och1OCM1sDDoIk6wUCndOzVOLNz7l7W0pIMm2ueS9L2BimmL7nMVFyRmNZTnayhnB6nk
 ODf9qivncv0P0Nr14pkkYalFVlo0qW2zrYFBJVT1piw+JxPWPkRMooo7PbtYZaBgprnV
 ET7JnXhuWt0E/ZOOyilC2dt59jG04btR+gGApRxRkXg/u05HGmjDK+y9p99PVYUkf036
 z5Gw==
X-Gm-Message-State: APjAAAUpxFFm5w72zmGqbzAnABvetH7bhgvcCEUwJg3qiyGl01VYhfcn
 XaVPGxsYI6X2x1x8Z0f+hxg=
X-Google-Smtp-Source: APXvYqxX351UP6VCQEt1E9bLS6Rbd09cht0WglPjQrU07cQRkoyBUm3aYnzuE+Uj7osajhgvlBMRwA==
X-Received: by 2002:a65:418d:: with SMTP id a13mr281245pgq.332.1561516318808; 
 Tue, 25 Jun 2019 19:31:58 -0700 (PDT)
Received: from localhost ([116.247.112.152])
 by smtp.gmail.com with ESMTPSA id u2sm353994pjv.9.2019.06.25.19.31.58
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 25 Jun 2019 19:31:58 -0700 (PDT)
From: elohimes@gmail.com
X-Google-Original-From: xieyongji@baidu.com
To: mst@redhat.com,
	groug@kaod.org
Date: Wed, 26 Jun 2019 10:31:27 +0800
Message-Id: <20190626023130.31315-3-xieyongji@baidu.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190626023130.31315-1-xieyongji@baidu.com>
References: <20190626023130.31315-1-xieyongji@baidu.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::52e
Subject: [Qemu-devel] [PATCH v4 2/5] virtio: Set "start_on_kick" for legacy
 devices
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
Cc: lvivier@redhat.com, ehabkost@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, Xie Yongji <xieyongji@baidu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xie Yongji <xieyongji@baidu.com>

Besides virtio 1.0 transitional devices, we should also
set "start_on_kick" flag for legacy devices (virtio 0.9).

Signed-off-by: Xie Yongji <xieyongji@baidu.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 hw/virtio/virtio.c         | 6 ++----
 include/hw/virtio/virtio.h | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index c9a6ca04b8..f7504d1395 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -1212,8 +1212,7 @@ void virtio_reset(void *opaque)
         k->reset(vdev);
     }
 
-    vdev->start_on_kick = (virtio_host_has_feature(vdev, VIRTIO_F_VERSION_1) &&
-                          !virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1));
+    vdev->start_on_kick = !virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1);
     vdev->started = false;
     vdev->broken = false;
     vdev->guest_features = 0;
@@ -2325,8 +2324,7 @@ void virtio_init(VirtIODevice *vdev, const char *name,
             g_malloc0(sizeof(*vdev->vector_queues) * nvectors);
     }
 
-    vdev->start_on_kick = (virtio_host_has_feature(vdev, VIRTIO_F_VERSION_1) &&
-                          !virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1));
+    vdev->start_on_kick = !virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1);
     vdev->started = false;
     vdev->device_id = device_id;
     vdev->status = 0;
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 15d5366939..b189788cb2 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -107,7 +107,7 @@ struct VirtIODevice
     bool broken; /* device in invalid state, needs reset */
     bool use_started;
     bool started;
-    bool start_on_kick; /* virtio 1.0 transitional devices support that */
+    bool start_on_kick; /* when virtio 1.0 feature has not been negotiated */
     VMChangeStateEntry *vmstate;
     char *bus_name;
     uint8_t device_endian;
-- 
2.17.1



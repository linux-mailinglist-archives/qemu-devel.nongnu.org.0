Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6902D3304
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 21:14:04 +0100 (CET)
Received: from localhost ([::1]:42812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmjN5-0004HK-61
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 15:14:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmin1-0007Be-OC
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:36:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmimk-0005gR-Pe
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:36:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bSoNUC7DG0wIijNBJsdQD+7RaOmhy7cd4bQD51mQOZk=;
 b=NEGwGLjy0wsaT9sFB1cuTtTSy0awpFM4mK4xPwtPm57MUJeCo7eFNIGV9b18h4Cb4eAjYi
 RicyTU4L3adyee0/9beMxapcTAHmEW+14EwHfpINR01w1InZZd7smLnSz0mZDLiPrK5+S9
 mLdwaduDOlJcJ8eyz6yu+6S9FcZ1MTg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-V3QMUcc1PA-R4NVQYbwbjg-1; Tue, 08 Dec 2020 14:36:28 -0500
X-MC-Unique: V3QMUcc1PA-R4NVQYbwbjg-1
Received: by mail-wr1-f71.google.com with SMTP id n13so6616004wrs.10
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:36:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=bSoNUC7DG0wIijNBJsdQD+7RaOmhy7cd4bQD51mQOZk=;
 b=dSQ35MEyAP5fnkl3Txaw/t16teG74s4auc4QYStajyIEKbirTAZ1alyiBuVRKZJ2zA
 4wxnk5W+KUTt7NwmIi8Qxy62vvCzVRHnbEsvkaS/kMbK/J3vBiZsQGfi/wu3EGPZi0ww
 43uc4qUY5sMgwibPvcDMOheLlhEnrbRrijtzktKIWpz8FHCrhVJYNElRRFL2sFE/o/vZ
 RhNaJpSFuGwL3axGH+ZwDVkJ9CkTADC36TJmZW3kJ4wevQbfoBXGv+CfRvBCDvH3VMf9
 j8mE6wXf3VvQE6AwNVxpvU0zvX5roCcluQOfn2yvVDrIEE/q8oPTl6chtEla1MnkqKqj
 81Bg==
X-Gm-Message-State: AOAM533cQKucTBPq6qS2RuycGT4mvDLh4vS12E7xSjsdlVY0HQQD+Q+X
 CcC4ff1SZYMKQ0XpBV5JRf8J/o1dGgfkU9gPe/cjayOuFyCBLQrKbWaWZuPRFaIi240l0vyAjXw
 utg+opZnprNotf6gPulUXW+RR5vpDxMANLplvBcMUzmpbm5eeLrqPwEpHzQib
X-Received: by 2002:a1c:f002:: with SMTP id a2mr5160758wmb.101.1607456186285; 
 Tue, 08 Dec 2020 11:36:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzw5ApoGMaYJHfh3QE9sLMH2I3MzqeNnYw7kKeA8nUFM8bSyC5hmywdLtJQTwfokDOT7Hb/Iw==
X-Received: by 2002:a1c:f002:: with SMTP id a2mr5160741wmb.101.1607456186075; 
 Tue, 08 Dec 2020 11:36:26 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id u66sm5003252wmg.30.2020.12.08.11.36.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:36:25 -0800 (PST)
Date: Tue, 8 Dec 2020 14:36:21 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 45/66] libvhost-user: replace qemu/memfd.h usage
Message-ID: <20201208193307.646726-46-mst@redhat.com>
References: <20201208193307.646726-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201208193307.646726-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Undo the damage from commit 5f9ff1eff3 ("libvhost-user: Support tracking
inflight I/O in shared memory") which introduced glib dependency through
osdep.h inclusion.

libvhost-user.c tries to stay free from glib usage.

Use glibc memfd_create directly when available (assumed so when
MFD_ALLOW_SEALING is defined). A following commit will make the project
standalone and check for memfd API at configure time, instead of a
panic at runtime.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20201125100640.366523-3-marcandre.lureau@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 contrib/libvhost-user/libvhost-user.c | 50 +++++++++++++++++++++++----
 1 file changed, 43 insertions(+), 7 deletions(-)

diff --git a/contrib/libvhost-user/libvhost-user.c b/contrib/libvhost-user/libvhost-user.c
index 1c1cfbf1e7..54aabd1878 100644
--- a/contrib/libvhost-user/libvhost-user.c
+++ b/contrib/libvhost-user/libvhost-user.c
@@ -42,8 +42,6 @@
 #endif
 
 #include "qemu/atomic.h"
-#include "qemu/osdep.h"
-#include "qemu/memfd.h"
 
 #include "libvhost-user.h"
 
@@ -1615,11 +1613,45 @@ vu_inflight_queue_size(uint16_t queue_size)
            sizeof(uint16_t), INFLIGHT_ALIGNMENT);
 }
 
+#ifdef MFD_ALLOW_SEALING
+static void *
+memfd_alloc(const char *name, size_t size, unsigned int flags, int *fd)
+{
+    void *ptr;
+    int ret;
+
+    *fd = memfd_create(name, MFD_ALLOW_SEALING);
+    if (*fd < 0) {
+        return NULL;
+    }
+
+    ret = ftruncate(*fd, size);
+    if (ret < 0) {
+        close(*fd);
+        return NULL;
+    }
+
+    ret = fcntl(*fd, F_ADD_SEALS, flags);
+    if (ret < 0) {
+        close(*fd);
+        return NULL;
+    }
+
+    ptr = mmap(0, size, PROT_READ | PROT_WRITE, MAP_SHARED, *fd, 0);
+    if (ptr == MAP_FAILED) {
+        close(*fd);
+        return NULL;
+    }
+
+    return ptr;
+}
+#endif
+
 static bool
 vu_get_inflight_fd(VuDev *dev, VhostUserMsg *vmsg)
 {
-    int fd;
-    void *addr;
+    int fd = -1;
+    void *addr = NULL;
     uint64_t mmap_size;
     uint16_t num_queues, queue_size;
 
@@ -1637,9 +1669,13 @@ vu_get_inflight_fd(VuDev *dev, VhostUserMsg *vmsg)
 
     mmap_size = vu_inflight_queue_size(queue_size) * num_queues;
 
-    addr = qemu_memfd_alloc("vhost-inflight", mmap_size,
-                            F_SEAL_GROW | F_SEAL_SHRINK | F_SEAL_SEAL,
-                            &fd, NULL);
+#ifdef MFD_ALLOW_SEALING
+    addr = memfd_alloc("vhost-inflight", mmap_size,
+                       F_SEAL_GROW | F_SEAL_SHRINK | F_SEAL_SEAL,
+                       &fd);
+#else
+    vu_panic(dev, "Not implemented: memfd support is missing");
+#endif
 
     if (!addr) {
         vu_panic(dev, "Failed to alloc vhost inflight area");
-- 
MST



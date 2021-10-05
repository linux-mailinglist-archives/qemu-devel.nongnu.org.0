Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C00DE422DF3
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 18:29:05 +0200 (CEST)
Received: from localhost ([::1]:46030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXnJQ-0004zN-HJ
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 12:29:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmsP-0008Po-Fu
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:01:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmsJ-0004Yj-4l
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:01:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/2tyMA4ubaOTmCnsG3GSjYJgJRE9OF4GDfIrA22J2bo=;
 b=Tc5CWlP3XSS/pAzFNH1Kmm7qMMMQCbhNX+qCpzvD8WreGU17/qxptc6dLLpCUNapB3V7I/
 h51/vQ5Y8uqxuV/xPU1dVkHcLgA/IlxRMBeKRzOpWBONPryfRaVW3tjuar9Alf3aL3d8Iz
 85E8bTeDFcV5ymWirbRTlJVk+4pKSnA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235--BqDjZ0TP3uHTOQDoBPxzA-1; Tue, 05 Oct 2021 12:00:58 -0400
X-MC-Unique: -BqDjZ0TP3uHTOQDoBPxzA-1
Received: by mail-wm1-f70.google.com with SMTP id
 h24-20020a7bc938000000b0030d400be5b5so6530237wml.0
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:00:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/2tyMA4ubaOTmCnsG3GSjYJgJRE9OF4GDfIrA22J2bo=;
 b=q5aNbBpGMztbv9u1TJhHzt1qN7Xif2Pr7Elmq6/kJrdhKb8ea0jTutAVEvwyVfg4RR
 vm45R0M5I3BpOiH7hakT/eylvykTgn5Ll4ZDeTOP7mpFkz/6/3+ExBdOjzw+SyMv0Ecx
 K6XTXnveQ0KhBqqa5qSvsaDT/xdJyHcw4+cPoc1kZKiQO1Xd1zNW8vDw4K17pxdYQxEO
 Djt+wdQTH/7BtqIFVPoxsxnwaTadB/5JdcUJg7uYkKxhScvOyUjgy9H3BwDcc3aF1SMa
 a1kxi0lNfr7TPcZtFSYNnJABKp+gwMvnrHu0EF3ovBbbWiRdmD7L4pWRtsNiLboFEFQ1
 v4dQ==
X-Gm-Message-State: AOAM531LzL0QuKaxUKr04YchQe8zJpTuRbPE/zYp8/JTIHSG3/euJDHw
 LZNY6jfRDd+AK15VHaeiBL4xog4BRm0gDApwjeXc+if/3KY+ru9aOQOMZeQ7tuuDhERHiHdRdDo
 UY9qjtJz/QhOg97HKy31pGXJBoS2buiKRuEz+Prk/U088s5oy7EQYT/gERZ1B
X-Received: by 2002:a05:6000:1866:: with SMTP id
 d6mr22016648wri.205.1633449655506; 
 Tue, 05 Oct 2021 09:00:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJlyJqdWdEnIrLseRw3VwrK3XxkvGTm/ZgAyeTSTmji6PNQ4mf5+ykKko8wgq1lyr511TM+w==
X-Received: by 2002:a05:6000:1866:: with SMTP id
 d6mr22016612wri.205.1633449655279; 
 Tue, 05 Oct 2021 09:00:55 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id q3sm2192119wmc.25.2021.10.05.09.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:00:54 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:00:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/57] vhost-vdpa: open device fd in net_init_vhost_vdpa()
Message-ID: <20211005155946.513818-4-mst@redhat.com>
References: <20211005155946.513818-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005155946.513818-1-mst@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jason Wang <jasowang@redhat.com>

This patch switches to open device fd in net_init_vhost_vpda(). This is
used to prepare for the multiqueue support.

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20210907090322.1756-2-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 net/vhost-vdpa.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 912686457c..73d29a74ef 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -156,24 +156,19 @@ static NetClientInfo net_vhost_vdpa_info = {
 };
 
 static int net_vhost_vdpa_init(NetClientState *peer, const char *device,
-                               const char *name, const char *vhostdev)
+                               const char *name, int vdpa_device_fd)
 {
     NetClientState *nc = NULL;
     VhostVDPAState *s;
-    int vdpa_device_fd = -1;
     int ret = 0;
     assert(name);
     nc = qemu_new_net_client(&net_vhost_vdpa_info, peer, device, name);
     snprintf(nc->info_str, sizeof(nc->info_str), TYPE_VHOST_VDPA);
     s = DO_UPCAST(VhostVDPAState, nc, nc);
-    vdpa_device_fd = qemu_open_old(vhostdev, O_RDWR);
-    if (vdpa_device_fd == -1) {
-        return -errno;
-    }
+
     s->vhost_vdpa.device_fd = vdpa_device_fd;
     ret = vhost_vdpa_add(nc, (void *)&s->vhost_vdpa);
     if (ret) {
-        qemu_close(vdpa_device_fd);
         qemu_del_net_client(nc);
     }
     return ret;
@@ -201,6 +196,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
                         NetClientState *peer, Error **errp)
 {
     const NetdevVhostVDPAOptions *opts;
+    int vdpa_device_fd, ret;
 
     assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
     opts = &netdev->u.vhost_vdpa;
@@ -209,5 +205,16 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
                           (char *)name, errp)) {
         return -1;
     }
-    return net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name, opts->vhostdev);
+
+    vdpa_device_fd = qemu_open_old(opts->vhostdev, O_RDWR);
+    if (vdpa_device_fd == -1) {
+        return -errno;
+    }
+
+    ret = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name, vdpa_device_fd);
+    if (ret) {
+        qemu_close(vdpa_device_fd);
+    }
+
+    return ret;
 }
-- 
MST



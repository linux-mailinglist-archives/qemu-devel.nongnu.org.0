Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 673A0422EFF
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 19:19:57 +0200 (CEST)
Received: from localhost ([::1]:49064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXo6e-00028c-Eu
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 13:19:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmvR-0002BL-MC
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:04:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmvF-00070x-ML
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:04:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g9Wr3YkTOKaztifTi4RRc4EZqPUFUqK9x43E/i+EsSw=;
 b=DOA/da5XP/o1SgBhhfm+EHgCTIHJTQoU8sIqb/4fz4al+JX16PU9JJ8KyVnUKzGmYA01Qp
 eYt9gIzb9id/OokMwdSw1dyfIKVM4WOCBAdFLmT3WG3QxfDqP75ZwmuMgrw7GUGiaa2+Is
 l19H7DZQnvx0mCzPYJg4XNk4IT+s7Cg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-PbKWSs5eNnO90ATZAp23sQ-1; Tue, 05 Oct 2021 12:01:07 -0400
X-MC-Unique: PbKWSs5eNnO90ATZAp23sQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 a10-20020a5d508a000000b00160723ce588so5866451wrt.23
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:01:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=g9Wr3YkTOKaztifTi4RRc4EZqPUFUqK9x43E/i+EsSw=;
 b=KWv4jp8j6lTlQE1Icbc6BHo/eKhurA6bfI/muBOrn1OQFpLSjj42V3lCaS9IeKnBXz
 NVPFk+i17EBK1movnKdX1LZdu4VFb3ssqpKNsFLlIcag3uEW3XFpfKe4fo3b5O3u9zFJ
 wTIpwlLAsXzvjHd5regXFct0WC8Sd+/7Ng5OyvLT5qyjDVPsZ6/iXnD6RmOAudifkc3l
 M0PENnI0/vu0XljnrneAc2qs2l7tcz7tvArBERroBOJ5v7YzcscTDGSLae9yuKhTf5vH
 xk0tBHvklbJtvrj1kiBHB2Z3NMp+gykgt+94B8qCK6s6vNmJpN/99PfQqguqybsMKLyt
 7Usw==
X-Gm-Message-State: AOAM532rb2KTuZjUKBDW47mdvhRAxX+RDgjuIy1Ga6+4A0SW1AKBDsGE
 rBshMCY2rT7X7s5DSyKNbZDrJiKkt8PnZ4ZfnaCCWDRpfo6LqLn64Iy3KdDKm8VSnEm60Pgguqc
 TJdDagD2QpsTc/CxnZHjcidE7cWCMX+N4NDoxmt6OloWrJXNW9v4325JFZvsN
X-Received: by 2002:a05:600c:19d3:: with SMTP id
 u19mr4202610wmq.164.1633449665635; 
 Tue, 05 Oct 2021 09:01:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBGmkgwr07pvMzVheyee/dpOzvFMfIGwt1P1okzRWy9dOAfEG0C5okL1Kx/swBAiPCAHOFxQ==
X-Received: by 2002:a05:600c:19d3:: with SMTP id
 u19mr4202577wmq.164.1633449665400; 
 Tue, 05 Oct 2021 09:01:05 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id t16sm2657110wmi.33.2021.10.05.09.01.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:01:04 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:01:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/57] vhost-vdpa: let net_vhost_vdpa_init() returns
 NetClientState *
Message-ID: <20211005155946.513818-7-mst@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jason Wang <jasowang@redhat.com>

This patch switches to let net_vhost_vdpa_init() to return
NetClientState *. This is used for the callers to allocate multiqueue
NetClientState for multiqueue support.

Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20210907090322.1756-5-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 net/vhost-vdpa.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 73d29a74ef..834dab28dd 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -155,8 +155,10 @@ static NetClientInfo net_vhost_vdpa_info = {
         .has_ufo = vhost_vdpa_has_ufo,
 };
 
-static int net_vhost_vdpa_init(NetClientState *peer, const char *device,
-                               const char *name, int vdpa_device_fd)
+static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
+                                           const char *device,
+                                           const char *name,
+                                           int vdpa_device_fd)
 {
     NetClientState *nc = NULL;
     VhostVDPAState *s;
@@ -170,8 +172,9 @@ static int net_vhost_vdpa_init(NetClientState *peer, const char *device,
     ret = vhost_vdpa_add(nc, (void *)&s->vhost_vdpa);
     if (ret) {
         qemu_del_net_client(nc);
+        return NULL;
     }
-    return ret;
+    return nc;
 }
 
 static int net_vhost_check_net(void *opaque, QemuOpts *opts, Error **errp)
@@ -196,7 +199,8 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
                         NetClientState *peer, Error **errp)
 {
     const NetdevVhostVDPAOptions *opts;
-    int vdpa_device_fd, ret;
+    int vdpa_device_fd;
+    NetClientState *nc;
 
     assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
     opts = &netdev->u.vhost_vdpa;
@@ -211,10 +215,11 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
         return -errno;
     }
 
-    ret = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name, vdpa_device_fd);
-    if (ret) {
+    nc = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name, vdpa_device_fd);
+    if (!nc) {
         qemu_close(vdpa_device_fd);
+        return -1;
     }
 
-    return ret;
+    return 0;
 }
-- 
MST



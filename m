Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8711D422DD5
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 18:22:48 +0200 (CEST)
Received: from localhost ([::1]:33108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXnDL-0004e7-Gb
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 12:22:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmsW-00005u-KO
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:01:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmsU-0004jv-Tw
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:01:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Co6yxN/jFeQeLIIMJX0QvM5s16uKZLl6Gfzgn/2s9wE=;
 b=iBXi/FUikDIxBOc+RsRtelm7/b5i/PtHZJfJkD0V/hr/HVRdLraL3EzWK3YQsBn/UdRaBs
 JBBfctiR1ey/nz9dDorfO4WknYS37u1Qgjy831i7YsMEtXIcQReeVnjlsL0gOdq55WvOm/
 eNHe8slLwQ8Aqx1+uq83Y68CkAcyKqc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-EJXGOjAYOF2LTISv1J69gw-1; Tue, 05 Oct 2021 12:01:11 -0400
X-MC-Unique: EJXGOjAYOF2LTISv1J69gw-1
Received: by mail-wr1-f71.google.com with SMTP id
 r25-20020adfab59000000b001609ddd5579so2866934wrc.21
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:01:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Co6yxN/jFeQeLIIMJX0QvM5s16uKZLl6Gfzgn/2s9wE=;
 b=2WExjougsTVoBivbX2ujPYGyXZGBHcferuS0klzzW+6ziEekX9pBk4pPxxHecvL/eP
 x13MA8WOXwJWBwIPJnjRQlD5lS0MDgTIjI0Iq+tt9F1m8GHniAHpnsBQv74xD1TBCK1N
 HX0z5YDARsK/+Vud0kFa7TNh6LdUCpke+16pCgL1Yv2Y56VHZrE3f411g4O0YRUQnijI
 BnlFdo2zeZ1HjF44e1WZPmP4ky73Ky5LW28s7JPWbwjh+i3I4WIkCBO6g/KmX45F6RS+
 al7PkAgATdS23webcdPg9Y9p9Ml48b7vKgpIpHhdjR9rdr1iq+XV2UTF7QjNdDbMLHKR
 +VMQ==
X-Gm-Message-State: AOAM530ieAD9xdH5PjEGPSnq+fvQteGnmiJZjQBIe4XBOxj+UzIilUG9
 hgjDLlDfcdIuJg+WmpgrGX8uuJdhuZSL0mKMXAEYJqW9MMSECj+y1e0tFCQjtHgeoGNFASS7jvS
 WkX+yBs2d3KLIErZDkHwVwMI61YBOQryQqupsY3y66DMzk4pA3IG17P5vLJ71
X-Received: by 2002:a1c:158:: with SMTP id 85mr4266333wmb.187.1633449669140;
 Tue, 05 Oct 2021 09:01:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAtqpoh20Aupv6Y3IoVcv9eeo24ldQgW6yUKKb5STwRD1WFwdt2SuI37yLh6KXnWBDU8aH/w==
X-Received: by 2002:a1c:158:: with SMTP id 85mr4266299wmb.187.1633449668931;
 Tue, 05 Oct 2021 09:01:08 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id n68sm2351546wmn.13.2021.10.05.09.01.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:01:07 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:01:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/57] net: introduce control client
Message-ID: <20211005155946.513818-8-mst@redhat.com>
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

This patch introduces a boolean for the device has control queue which
can accepts control command via network queue.

The first user would be the control virtqueue support for vhost.

Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20210907090322.1756-6-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/net/net.h |  5 +++++
 net/net.c         | 24 +++++++++++++++++++++---
 2 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/include/net/net.h b/include/net/net.h
index 5d1508081f..4f400b8a09 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -103,6 +103,7 @@ struct NetClientState {
     int vnet_hdr_len;
     bool is_netdev;
     bool do_not_pad; /* do not pad to the minimum ethernet frame length */
+    bool is_datapath;
     QTAILQ_HEAD(, NetFilterState) filters;
 };
 
@@ -134,6 +135,10 @@ NetClientState *qemu_new_net_client(NetClientInfo *info,
                                     NetClientState *peer,
                                     const char *model,
                                     const char *name);
+NetClientState *qemu_new_net_control_client(NetClientInfo *info,
+                                        NetClientState *peer,
+                                        const char *model,
+                                        const char *name);
 NICState *qemu_new_nic(NetClientInfo *info,
                        NICConf *conf,
                        const char *model,
diff --git a/net/net.c b/net/net.c
index 52c99196c6..f0d14dbfc1 100644
--- a/net/net.c
+++ b/net/net.c
@@ -239,7 +239,8 @@ static void qemu_net_client_setup(NetClientState *nc,
                                   NetClientState *peer,
                                   const char *model,
                                   const char *name,
-                                  NetClientDestructor *destructor)
+                                  NetClientDestructor *destructor,
+                                  bool is_datapath)
 {
     nc->info = info;
     nc->model = g_strdup(model);
@@ -258,6 +259,7 @@ static void qemu_net_client_setup(NetClientState *nc,
 
     nc->incoming_queue = qemu_new_net_queue(qemu_deliver_packet_iov, nc);
     nc->destructor = destructor;
+    nc->is_datapath = is_datapath;
     QTAILQ_INIT(&nc->filters);
 }
 
@@ -272,7 +274,23 @@ NetClientState *qemu_new_net_client(NetClientInfo *info,
 
     nc = g_malloc0(info->size);
     qemu_net_client_setup(nc, info, peer, model, name,
-                          qemu_net_client_destructor);
+                          qemu_net_client_destructor, true);
+
+    return nc;
+}
+
+NetClientState *qemu_new_net_control_client(NetClientInfo *info,
+                                            NetClientState *peer,
+                                            const char *model,
+                                            const char *name)
+{
+    NetClientState *nc;
+
+    assert(info->size >= sizeof(NetClientState));
+
+    nc = g_malloc0(info->size);
+    qemu_net_client_setup(nc, info, peer, model, name,
+                          qemu_net_client_destructor, false);
 
     return nc;
 }
@@ -297,7 +315,7 @@ NICState *qemu_new_nic(NetClientInfo *info,
 
     for (i = 0; i < queues; i++) {
         qemu_net_client_setup(&nic->ncs[i], info, peers[i], model, name,
-                              NULL);
+                              NULL, true);
         nic->ncs[i].queue_index = i;
     }
 
-- 
MST



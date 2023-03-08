Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6436AFBE7
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:14:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiM5-0003b9-QK; Tue, 07 Mar 2023 20:12:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiLj-0002xY-Ux
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:12:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiLi-0001dX-AW
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:12:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678237929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NTGWe/7pl2LtGkXf67BPThJG4gqOmFwAmyUVCwtNab0=;
 b=UbX3hgy0hRCxHVtIPAoL7OF86i0l5xL9okWPdxnfcmHwhU6UiPE3XRJiawN9wTGgawEJd3
 ZpF9+bSerMLP2YYn4ydo0T7UOLuIdQBcquLQ2i6XxbnU99npbULtOzQXW7P0BrdQ6VJTzG
 Nn1HAcNjcFNMp6gt7WTFJaVAGHijM9w=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-e2jdFNBdOdKr1K5KEl0tlQ-1; Tue, 07 Mar 2023 20:12:02 -0500
X-MC-Unique: e2jdFNBdOdKr1K5KEl0tlQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 b7-20020a056402350700b004d2a3d5cd3fso16147457edd.8
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:12:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678237921;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NTGWe/7pl2LtGkXf67BPThJG4gqOmFwAmyUVCwtNab0=;
 b=7S96jCpe4MJxzHvdXvCvcr3MtIXyI0OsTaLVd/aI3WakxEN5ihUPfLm4vUw6OEJ2xM
 Qil+ljJEgmi4B0WB+c11ntdk3Q+rpUglMtPTjI7iYRScleihlEc+KIvn0ZaLNOetqPz2
 hWviTJei+vixieWZQ9eI2F4WywSGy+4VsFWWSip23UH48MbZfAq6Lld0owGf1r5krGy8
 GHzMu9ULVKFaGBE1+8yiYIWNAwDWSIhWfmKcFxAFGcfwkucomFiW12rcYMNrn5v6YZaj
 rusx+NjCPXMQIo+GVvyK2SqemCZiyWrlS4LU7+/FsZK9NyJGz4YKOn16B9E6Nsmms2EA
 wTUg==
X-Gm-Message-State: AO0yUKVWlvusTGIV653rm0/6EgB28Ki1vYqHXzPCM984V7p2oqXob7/3
 /zSHgxMra1rYlrcwwUwOhAT+03NJ21FcLcVEuFDEKadE90HKnbFp+ALFBVApodH7YLhTatlQCby
 SvEYSngaqzFTeugLi+W5ASJzrxA+NB6jLWPMUFicUrgW0XXhHZix8D3s4kWp4Jlv5MYY9
X-Received: by 2002:a17:907:6e25:b0:878:54e3:e3e1 with SMTP id
 sd37-20020a1709076e2500b0087854e3e3e1mr20527869ejc.73.1678237921507; 
 Tue, 07 Mar 2023 17:12:01 -0800 (PST)
X-Google-Smtp-Source: AK7set8DUpOU7QS6qISDaILLKeDZ+CWtJ4Vha4a1VIxT4X4VQ0MBhixGTyn1bq3juX5fUq6sP/R0nQ==
X-Received: by 2002:a17:907:6e25:b0:878:54e3:e3e1 with SMTP id
 sd37-20020a1709076e2500b0087854e3e3e1mr20527854ejc.73.1678237921272; 
 Tue, 07 Mar 2023 17:12:01 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 t26-20020a1709060c5a00b008ec793ac3f4sm6726429ejf.192.2023.03.07.17.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:12:00 -0800 (PST)
Date: Tue, 7 Mar 2023 20:11:58 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 Lei Yang <leiyang@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 23/73] vdpa: block migration if device has unsupported features
Message-ID: <5c1ebd4c432eda629aeb7a4ecab45220d0272616.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Eugenio Pérez <eperezma@redhat.com>

A vdpa net device must initialize with SVQ in order to be migratable at
this moment, and initialization code verifies some conditions.  If the
device is not initialized with the x-svq parameter, it will not expose
_F_LOG so the vhost subsystem will block VM migration from its
initialization.

Next patches change this, so we need to verify migration conditions
differently.

QEMU only supports a subset of net features in SVQ, and it cannot
migrate state that cannot track or restore in the destination.  Add a
migration blocker if the device offers an unsupported feature.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Message-Id: <20230303172445.1089785-12-eperezma@redhat.com>
Tested-by: Lei Yang <leiyang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 net/vhost-vdpa.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 533ba54317..1089c35959 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -795,7 +795,8 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
                                        int nvqs,
                                        bool is_datapath,
                                        bool svq,
-                                       struct vhost_vdpa_iova_range iova_range)
+                                       struct vhost_vdpa_iova_range iova_range,
+                                       uint64_t features)
 {
     NetClientState *nc = NULL;
     VhostVDPAState *s;
@@ -818,7 +819,10 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
     s->vhost_vdpa.shadow_vqs_enabled = svq;
     s->vhost_vdpa.iova_range = iova_range;
     s->vhost_vdpa.shadow_data = svq;
-    if (!is_datapath) {
+    if (queue_pair_index == 0) {
+        vhost_vdpa_net_valid_svq_features(features,
+                                          &s->vhost_vdpa.migration_blocker);
+    } else if (!is_datapath) {
         s->cvq_cmd_out_buffer = qemu_memalign(qemu_real_host_page_size(),
                                             vhost_vdpa_net_cvq_cmd_page_len());
         memset(s->cvq_cmd_out_buffer, 0, vhost_vdpa_net_cvq_cmd_page_len());
@@ -956,7 +960,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
     for (i = 0; i < queue_pairs; i++) {
         ncs[i] = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
                                      vdpa_device_fd, i, 2, true, opts->x_svq,
-                                     iova_range);
+                                     iova_range, features);
         if (!ncs[i])
             goto err;
     }
@@ -964,7 +968,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
     if (has_cvq) {
         nc = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
                                  vdpa_device_fd, i, 1, false,
-                                 opts->x_svq, iova_range);
+                                 opts->x_svq, iova_range, features);
         if (!nc)
             goto err;
     }
-- 
MST



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A627380DFA
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 18:17:05 +0200 (CEST)
Received: from localhost ([::1]:49260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhaUq-0002US-E2
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 12:17:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lhaIz-0006w3-CE
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:04:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lhaIv-0005VD-Cf
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:04:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621008284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6a624dvQ4jSjgj/LCoviPdhNQTyYuKtZt78aKXVRxq8=;
 b=P7kv539FCTRCvv0e0E2tpvr27p4PdcahrbJ8B5Kddh/5UkFvzlhqI5t3xWguBKAjywFhF8
 +ID0+JZrX1cqa/52k6JyVKlZ6y6RRC1vbPSWh2zmgqZX5g5e2LMdPw9dHz9EBExanJIKMP
 cMbvqQBH2YpldSRiZPeWPx6S5wuijYE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-vHfI90gIMuChdFY4LHzlsw-1; Fri, 14 May 2021 12:04:32 -0400
X-MC-Unique: vHfI90gIMuChdFY4LHzlsw-1
Received: by mail-wm1-f71.google.com with SMTP id
 r10-20020a05600c2c4ab029014b601975e1so1964447wmg.0
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 09:04:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6a624dvQ4jSjgj/LCoviPdhNQTyYuKtZt78aKXVRxq8=;
 b=SUce+s/KHWOR21v74NcFzJuW1uYaSiDNO7uJme8HSyGRNNpAEYUwZTlAFXupEYK6XM
 XHyfRqTga5PabHWcWn/SUaxYQD7Red59AKCuDoPFkWzroQxRLEHzNM1lXNG0fUtBj7Jb
 HWuxsLfdF2x+yBxYs2/WvOqjfiYK7wN7oGNzKiHcHDW2i/xIHkHyCPDkCyaClRiwxnz8
 4+WHD8X6ZTDA8FKIsJ/3h2dSdfUCu3K8DzPtLhD0Il/wUJkRr1YLvICrDtykitYBVSQi
 m8YcUBTBtrDkbhDDLvnhUKoIBom01KB7xhH0NnSlRjKZn3Q2Kqee0KWtSCwEqCtuGPhF
 vxSg==
X-Gm-Message-State: AOAM530vVDgfpgi+dbcDJeRsCLtBptZrEsCH6FHgu17MkgbLbuW+SdfW
 T9frB4JiD2PraLqgpVO8XDElCFpcINRVgmMcYR7u+CJsrnHnZzbAmpHYhWUoa3dQtffOOFzC/QQ
 NdvF37DOBtCpgCJ/ocby36749aCQnI2wQ5PaZWdaoFctWssLxwSGJI87NxACf
X-Received: by 2002:adf:dcc5:: with SMTP id x5mr60791382wrm.1.1621008271454;
 Fri, 14 May 2021 09:04:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqfqmXSohevGZj3qm6urWV8AT9gZZUbYMHJmEegpW/VFW8Tf2H4GGkeUTpubhwUQn6BY45Tw==
X-Received: by 2002:adf:dcc5:: with SMTP id x5mr60791350wrm.1.1621008271230;
 Fri, 14 May 2021 09:04:31 -0700 (PDT)
Received: from redhat.com ([2a10:800c:1fa6:0:3809:fe0c:bb87:250e])
 by smtp.gmail.com with ESMTPSA id d9sm6971971wrp.47.2021.05.14.09.04.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 09:04:30 -0700 (PDT)
Date: Fri, 14 May 2021 12:04:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/16] virtio-blk: Configure all host notifiers in a single MR
 transaction
Message-ID: <20210514160245.91918-10-mst@redhat.com>
References: <20210514160245.91918-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210514160245.91918-1-mst@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Greg Kurz <groug@kaod.org>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

This allows the virtio-blk-pci device to batch the setup of all its
host notifiers. This significantly improves boot time of VMs with a
high number of vCPUs, e.g. from 3m26.186s down to 0m58.023s for a
pseries machine with 384 vCPUs.

Note that memory_region_transaction_commit() must be called before
virtio_bus_cleanup_host_notifier() because the latter might close
ioeventfds that the transaction still assumes to be around when it
commits.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20210407143501.244343-3-groug@kaod.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/block/dataplane/virtio-blk.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
index d7b5c95d26..cd81893d1d 100644
--- a/hw/block/dataplane/virtio-blk.c
+++ b/hw/block/dataplane/virtio-blk.c
@@ -198,19 +198,30 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
         goto fail_guest_notifiers;
     }
 
+    memory_region_transaction_begin();
+
     /* Set up virtqueue notify */
     for (i = 0; i < nvqs; i++) {
         r = virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), i, true);
         if (r != 0) {
+            int j = i;
+
             fprintf(stderr, "virtio-blk failed to set host notifier (%d)\n", r);
             while (i--) {
                 virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), i, false);
+            }
+
+            memory_region_transaction_commit();
+
+            while (j--) {
                 virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), i);
             }
             goto fail_host_notifiers;
         }
     }
 
+    memory_region_transaction_commit();
+
     s->starting = false;
     vblk->dataplane_started = true;
     trace_virtio_blk_data_plane_start(s);
@@ -246,8 +257,15 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
     return 0;
 
   fail_aio_context:
+    memory_region_transaction_begin();
+
     for (i = 0; i < nvqs; i++) {
         virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), i, false);
+    }
+
+    memory_region_transaction_commit();
+
+    for (i = 0; i < nvqs; i++) {
         virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), i);
     }
   fail_host_notifiers:
@@ -312,8 +330,15 @@ void virtio_blk_data_plane_stop(VirtIODevice *vdev)
 
     aio_context_release(s->ctx);
 
+    memory_region_transaction_begin();
+
     for (i = 0; i < nvqs; i++) {
         virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), i, false);
+    }
+
+    memory_region_transaction_commit();
+
+    for (i = 0; i < nvqs; i++) {
         virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), i);
     }
 
-- 
MST



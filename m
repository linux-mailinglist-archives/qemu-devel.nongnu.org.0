Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C1130C3FB
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 16:39:16 +0100 (CET)
Received: from localhost ([::1]:37238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6xlr-0004Cd-2s
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 10:39:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l6xMV-0008PO-OU
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:13:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l6xMO-0006tR-40
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:13:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612278775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ex128HceN3mgOxe1pMJ75smnNXZzBNmTC/eidh1FHnU=;
 b=iWoIR99p/QaIDGunlbGPaS11WaNWSgIraioB8U6B0y2CvMzOAOFfxxNrkK9ymULYglOYNP
 EL3agOOu2OZTs284i6Uk48BDYt+NwgwhwdzLwVV5aTvK0AOSkeKKvSMPUaCRveDpu13FoG
 3B5hPOvcpXzxLu/hcM8/IWY12aVopCs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-_aElJT0TNE2K6ygGAekpvw-1; Tue, 02 Feb 2021 10:12:52 -0500
X-MC-Unique: _aElJT0TNE2K6ygGAekpvw-1
Received: by mail-wr1-f71.google.com with SMTP id x12so12752895wrw.21
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 07:12:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ex128HceN3mgOxe1pMJ75smnNXZzBNmTC/eidh1FHnU=;
 b=FUIXAolFhP83oB/xIOmyWkP7+CnWvVrmFBF2ysom1R/wlARXHN8uGuilwJRuIa3mUg
 OyK+aS8n48TDej6AlHNC1HlOyakNxphB1pozaVL/pXTj+DlHbp7g8JOkwVdZ5MPk8keU
 Oq5Lj8Kx5h6qcv/UqnBvuNasduaKKavAk9sxr7B2cP7bWSFRPn6IyVBKBOkp3RXzL1rf
 SILWWJ4M8Auy3CvD0IdsI9zy2ZAio6WaYAAx9c0mOzeJGS3UIkHI4+yWJd8qoyC76NAq
 VETf8anVwOpoXh7FFtlkI9g/e2dYZEtfqIlrPxKCM66vUJq959HczgXzCxO2jaeJhFtM
 X9kQ==
X-Gm-Message-State: AOAM533h+oc8t/YFMYjjs80PSEjDU35G/ZPlfEqh8l9u4VFnz8QcAkuG
 nvA+Uu4f7b2CRyeg/TZ0fpW3FCsGeFt19SQnmMWho0z7isfMKqCX/lTdSVS1W8V4KGo99ERopZF
 qJHsf/SsieKq0b1YxvtgcPrWLYBLIjdq4Y7GXsoediVEK0PbuTT0wBVHM/zGc
X-Received: by 2002:adf:cf04:: with SMTP id o4mr24217052wrj.412.1612278770035; 
 Tue, 02 Feb 2021 07:12:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyBsLlVsqlH7GficJtdRA4Jnh2e5wINy1g8bKubBPiWKRZH1FHASXeUrZW2xOTiCxDxelJasA==
X-Received: by 2002:adf:cf04:: with SMTP id o4mr24217036wrj.412.1612278769807; 
 Tue, 02 Feb 2021 07:12:49 -0800 (PST)
Received: from redhat.com (bzq-79-177-39-148.red.bezeqint.net. [79.177.39.148])
 by smtp.gmail.com with ESMTPSA id c9sm3744148wmb.33.2021.02.02.07.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 07:12:49 -0800 (PST)
Date: Tue, 2 Feb 2021 10:12:47 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 9/9] virtio-pmem: add trace events
Message-ID: <20210202151116.1573669-10-mst@redhat.com>
References: <20210202151116.1573669-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210202151116.1573669-1-mst@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
 David Hildenbrand <david@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>

This patch adds trace events for virtio-pmem functionality.
Adding trace events for virtio pmem request, reponse and host
side fsync functionality.

Signed-off-by: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Message-Id: <20201117115705.32195-1-pankaj.gupta.linux@gmail.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-pmem.c | 4 ++++
 hw/virtio/trace-events  | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/hw/virtio/virtio-pmem.c b/hw/virtio/virtio-pmem.c
index ddb0125901..d83e973bf2 100644
--- a/hw/virtio/virtio-pmem.c
+++ b/hw/virtio/virtio-pmem.c
@@ -24,6 +24,7 @@
 #include "sysemu/hostmem.h"
 #include "block/aio.h"
 #include "block/thread-pool.h"
+#include "trace.h"
 
 typedef struct VirtIODeviceRequest {
     VirtQueueElement elem;
@@ -41,6 +42,7 @@ static int worker_cb(void *opaque)
 
     /* flush raw backing image */
     err = fsync(req_data->fd);
+    trace_virtio_pmem_flush_done(err);
     if (err != 0) {
         err = 1;
     }
@@ -59,6 +61,7 @@ static void done_cb(void *opaque, int ret)
     /* Callbacks are serialized, so no need to use atomic ops. */
     virtqueue_push(req_data->pmem->rq_vq, &req_data->elem, len);
     virtio_notify((VirtIODevice *)req_data->pmem, req_data->pmem->rq_vq);
+    trace_virtio_pmem_response();
     g_free(req_data);
 }
 
@@ -69,6 +72,7 @@ static void virtio_pmem_flush(VirtIODevice *vdev, VirtQueue *vq)
     HostMemoryBackend *backend = MEMORY_BACKEND(pmem->memdev);
     ThreadPool *pool = aio_get_thread_pool(qemu_get_aio_context());
 
+    trace_virtio_pmem_flush_request();
     req_data = virtqueue_pop(vq, sizeof(VirtIODeviceRequest));
     if (!req_data) {
         virtio_error(vdev, "virtio-pmem missing request data");
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 2060a144a2..c62727f879 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -122,3 +122,8 @@ virtio_mem_unplug_all_request(void) ""
 virtio_mem_resized_usable_region(uint64_t old_size, uint64_t new_size) "old_size=0x%" PRIx64 "new_size=0x%" PRIx64
 virtio_mem_state_request(uint64_t addr, uint16_t nb_blocks) "addr=0x%" PRIx64 " nb_blocks=%" PRIu16
 virtio_mem_state_response(uint16_t state) "state=%" PRIu16
+
+# virtio-pmem.c
+virtio_pmem_flush_request(void) "flush request"
+virtio_pmem_response(void) "flush response"
+virtio_pmem_flush_done(int type) "fsync return=%d"
-- 
MST



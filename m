Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6D2310D07
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 16:13:50 +0100 (CET)
Received: from localhost ([::1]:33134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l82nt-0005sp-EU
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 10:13:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l82eJ-0003on-WC
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:03:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l82eI-0002xl-3T
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:03:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612537433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ex128HceN3mgOxe1pMJ75smnNXZzBNmTC/eidh1FHnU=;
 b=DZQPfoDgMVDDAtQJDuCmV5VrJOLjehQ+JDkhvky4a/Yp9SEd3XZxQP1gxdcoFjrSHFqZmu
 bWJlY0tXyB0rAgYyY6Z26wPpZmIieVtr/9F1NqGpSU2UCxdDLfjXHLYU2kL2VblWSQdmib
 Kh8vr6lTi074J1FJptoL1HeOh6Mdewg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-ARB0f4D3MzWTUbpOdSUPwA-1; Fri, 05 Feb 2021 10:03:50 -0500
X-MC-Unique: ARB0f4D3MzWTUbpOdSUPwA-1
Received: by mail-ej1-f71.google.com with SMTP id q11so6944242ejd.0
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 07:03:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ex128HceN3mgOxe1pMJ75smnNXZzBNmTC/eidh1FHnU=;
 b=BhtmbmunX45HwdVjFobzwQkF/8IosmEb/7fA8Qs7URJ+QKKQCFPeQE9AZqhmvIL7fc
 +D+17jDt++3FmnTjz8JSBnsIr/PCWS4cyZzjRsbraIu60n6i8qHgeWlsdLs7QKwtvuHP
 AyNnVKq8ESKCcM2RYXd8D7Wub3pflNp25lPuJH5oljsikJHA8FbhjTvS6uc99PPxRxSF
 TCVU+aPr2LoGx5rhLZAiHUjpnA+9X4wx7ezNpnd+h27arhNPo6/w4C7/qeOb1mys7luO
 QLoxxyD7AsgmFFpfLHGt+MoFwI+pIFPTqmrAd9tU3roQBTa5T5gNNWwN9kE9LKg3IT1T
 xiCg==
X-Gm-Message-State: AOAM5327JGrG3LkOJxzwMY9/In3qAIg3AXMV6o3wSCrlibuuLfQHPXNT
 AjFBB+MJ3k6wy+0ZzwoVjLVWxFheWmbcpMyFT7U/E6hnOvA49IMZpTgAyDhyJaJqYPsKtJQe/Hu
 2UWHJr1RmUGDYgk+WUWZu5pHB27faaZHb98v8Urz6S//PIp5b4TnpnB16saU8
X-Received: by 2002:a17:906:a153:: with SMTP id
 bu19mr4531044ejb.287.1612537429193; 
 Fri, 05 Feb 2021 07:03:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyw+OKGpSNtQIJPA589Bj9+HbYzp0n/3kkZ2ShNA6atoKLuf2m9nE78gj2TldRVGp1/cnPcJA==
X-Received: by 2002:a17:906:a153:: with SMTP id
 bu19mr4531020ejb.287.1612537429021; 
 Fri, 05 Feb 2021 07:03:49 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id p12sm4247913edr.82.2021.02.05.07.03.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 07:03:48 -0800 (PST)
Date: Fri, 5 Feb 2021 10:03:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 06/16] virtio-pmem: add trace events
Message-ID: <20210205150135.94643-7-mst@redhat.com>
References: <20210205150135.94643-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210205150135.94643-1-mst@redhat.com>
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
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
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



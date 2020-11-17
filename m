Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E148D2B5EC2
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 12:58:12 +0100 (CET)
Received: from localhost ([::1]:39376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kezci-0002NK-0h
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 06:58:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1kezbs-0001xc-0w
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 06:57:20 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:52671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1kezbq-00041z-9Z
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 06:57:19 -0500
Received: by mail-wm1-x344.google.com with SMTP id 10so2991527wml.2
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 03:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/hSyASsnd4SvRw+QktOsKZONyW7qrzJuvpescptJThA=;
 b=CE0bGfoHynpVyIqSLTgPjyBmSjKO0kIQQKsSWZB1h4UCFedCal46cKHy9HrK/oqPNF
 e/PyPmIY6C5A0xUStUnhmr+6BW57IyePpVS2ldsAwfVWV6zlpW1yKV8CXE4C/rl4BiAC
 bYncR3VABULbsKRrWCVnRkmBIhe2WSH1FSoRDsP1wZt0xzVRm5KyIC1XaqyUwIt3zgtz
 6Bipcm/ap+knRzygiXmARU2qnPaLQQMWU7GUXXl3QygSwTz8OaqTbPCNYB9DRbp9WOf+
 BtJrfFAV5fgwDw4fpqVpOEkLh9nnW3gqFi2j6Uc6NX9V2Zyl1/Kydxb4EwoYCPGp9sxj
 Y0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/hSyASsnd4SvRw+QktOsKZONyW7qrzJuvpescptJThA=;
 b=A/v47PHWaufVVNYzmhZ+s9jF5YDVImcCwOLKKBC+z9PNz4F5t7xmu/dKFHVxlJ+dbD
 Q7CPI8tJgJ1foEdV8SAhvgmEuNlV7lAhGYmFJnBKm4oGmEyuvVJbQquSzNmSrr6ri7dz
 YWQp0JCIjx1qcaCyZkeqESPLC2dxJFkvwY4+lmZmxEE1rJclQvyeWCJW3aZ09V1lGDQi
 sCxurHIgZoMkqAWFlrkKMYAvhorOnDhWCkUxf81faRddH13VZ/aMd8F5faemAObDKUig
 td8O5ASC1sfZuinKDMaXy3C5BXgi7ZsZgGrvm6BFJvXx/pKILUVJAO0aG0cTAxj3r4LP
 ucFg==
X-Gm-Message-State: AOAM532+wFdGKENPM91oYZ+hvP4/FGralc+R9JFnwrzVcUeIaeazX+7Z
 IHL/bHw2IMTTBREU6CAQz9s=
X-Google-Smtp-Source: ABdhPJxn+ESCXnPPKqg6hsUfLbXhnC/1SGwdAUluKVqlaEN+cV41/m5bfPmFXGkv3b41QLNUYEfnDw==
X-Received: by 2002:a7b:c24b:: with SMTP id b11mr3807187wmj.109.1605614235272; 
 Tue, 17 Nov 2020 03:57:15 -0800 (PST)
Received: from lb01399.pb.local
 (p200300ca573cea02894fd6f5c6d10f88.dip0.t-ipconnect.de.
 [2003:ca:573c:ea02:894f:d6f5:c6d1:f88])
 by smtp.gmail.com with ESMTPSA id c17sm3201979wml.14.2020.11.17.03.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 03:57:14 -0800 (PST)
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
To: mst@redhat.com
Subject: [PATCH] virtio-pmem: add trace events
Date: Tue, 17 Nov 2020 12:57:05 +0100
Message-Id: <20201117115705.32195-1-pankaj.gupta.linux@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: pankaj.gupta.linux@gmail.com, qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds trace events for virtio-pmem functionality.
Adding trace events for virtio pmem request, reponse and host
side fsync functionality.

Signed-off-by: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
---
 hw/virtio/trace-events  | 5 +++++
 hw/virtio/virtio-pmem.c | 4 ++++
 2 files changed, 9 insertions(+)

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
-- 
2.20.1



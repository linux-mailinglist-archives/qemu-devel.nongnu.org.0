Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6B739742D
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 15:29:12 +0200 (CEST)
Received: from localhost ([::1]:33690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo4SF-00038n-UR
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 09:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lo4Og-0003kV-R8
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 09:25:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lo4Oe-000803-KN
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 09:25:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622553927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7as5qAeWLteVagtE7XzCCalzb5tH4oL3W1dF5yWD0cs=;
 b=cvXssA/h2L0dPQ0842VMLZ76aVMMMPHTcu0gYXqa+vabwuquNptB2BkdlElSlY0Gi5e1Uh
 5MipoBdyAWXFmK7xEldoW2dDw6gWGf51yBusOfdRpLempJzaB5+MWLDpPx7tPue8yBAfKd
 wPda5EwgPxWsoI/eBGaCoca9QMwWcyc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-EK_C0p0DP7WtlgHGCamxOw-1; Tue, 01 Jun 2021 09:25:26 -0400
X-MC-Unique: EK_C0p0DP7WtlgHGCamxOw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 565558049D4
 for <qemu-devel@nongnu.org>; Tue,  1 Jun 2021 13:25:25 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E3DD060C4A;
 Tue,  1 Jun 2021 13:25:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E8D5C18007B6; Tue,  1 Jun 2021 15:24:14 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 12/13] meson: move virtio trace events to separate file
Date: Tue,  1 Jun 2021 15:24:13 +0200
Message-Id: <20210601132414.432430-13-kraxel@redhat.com>
In-Reply-To: <20210601132414.432430-1-kraxel@redhat.com>
References: <20210601132414.432430-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Markus Armbruster <armbru@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move virtio-gpu trace events to separate trace-events-virtio file.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/trace-virtio.h      |  1 +
 hw/display/virtio-gpu-base.c   |  2 +-
 hw/display/virtio-gpu.c        |  2 +-
 hw/display/meson.build         |  4 ++++
 hw/display/trace-events        | 17 -----------------
 hw/display/trace-events-virtio | 16 ++++++++++++++++
 6 files changed, 23 insertions(+), 19 deletions(-)
 create mode 100644 hw/display/trace-virtio.h
 create mode 100644 hw/display/trace-events-virtio

diff --git a/hw/display/trace-virtio.h b/hw/display/trace-virtio.h
new file mode 100644
index 000000000000..eb0d7dd8fc9f
--- /dev/null
+++ b/hw/display/trace-virtio.h
@@ -0,0 +1 @@
+#include "trace/trace-hw_display_virtio_gpu.h"
diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index dd294276cb38..4c654d5af594 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -17,7 +17,7 @@
 #include "migration/blocker.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
-#include "trace.h"
+#include "trace-virtio.h"
 
 void
 virtio_gpu_base_reset(VirtIOGPUBase *g)
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 4d549377cbc1..a7932126e3c7 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -15,7 +15,7 @@
 #include "qemu/units.h"
 #include "qemu/iov.h"
 #include "ui/console.h"
-#include "trace.h"
+#include "trace-virtio.h"
 #include "sysemu/dma.h"
 #include "sysemu/sysemu.h"
 #include "hw/virtio/virtio.h"
diff --git a/hw/display/meson.build b/hw/display/meson.build
index ac98861986d1..645a12a7af99 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -62,6 +62,10 @@ if config_all_devices.has_key('CONFIG_VIRTIO_GPU')
                     if_true: [files('virtio-gpu-base.c', 'virtio-gpu.c'), pixman])
   virtio_gpu_ss.add(when: 'CONFIG_LINUX', if_true: files('virtio-gpu-udmabuf.c'))
   virtio_gpu_ss.add(when: 'CONFIG_VHOST_USER_GPU', if_true: files('vhost-user-gpu.c'))
+  trace_events_config += {
+    'file'   : meson.source_root() / 'hw' / 'display' / 'trace-events-virtio',
+    'module' : 'hw-display-virtio-gpu',
+  }
   hw_display_modules += {'virtio-gpu': virtio_gpu_ss}
 
   virtio_gpu_gl_ss = ss.source_set()
diff --git a/hw/display/trace-events b/hw/display/trace-events
index 9c1c972c29c6..27654aee8799 100644
--- a/hw/display/trace-events
+++ b/hw/display/trace-events
@@ -22,23 +22,6 @@ vmware_scratch_read(uint32_t index, uint32_t value) "index %d, value 0x%x"
 vmware_scratch_write(uint32_t index, uint32_t value) "index %d, value 0x%x"
 vmware_setmode(uint32_t w, uint32_t h, uint32_t bpp) "%dx%d @ %d bpp"
 
-# virtio-gpu-base.c
-virtio_gpu_features(bool virgl) "virgl %d"
-
-# virtio-gpu.c
-virtio_gpu_cmd_get_display_info(void) ""
-virtio_gpu_cmd_get_edid(uint32_t scanout) "scanout %d"
-virtio_gpu_cmd_set_scanout(uint32_t id, uint32_t res, uint32_t w, uint32_t h, uint32_t x, uint32_t y) "id %d, res 0x%x, w %d, h %d, x %d, y %d"
-virtio_gpu_cmd_set_scanout_blob(uint32_t id, uint32_t res, uint32_t w, uint32_t h, uint32_t x, uint32_t y) "id %d, res 0x%x, w %d, h %d, x %d, y %d"
-virtio_gpu_cmd_res_create_2d(uint32_t res, uint32_t fmt, uint32_t w, uint32_t h) "res 0x%x, fmt 0x%x, w %d, h %d"
-virtio_gpu_cmd_res_create_blob(uint32_t res, uint64_t size) "res 0x%x, size %" PRId64
-virtio_gpu_cmd_res_unref(uint32_t res) "res 0x%x"
-virtio_gpu_cmd_res_back_attach(uint32_t res) "res 0x%x"
-virtio_gpu_cmd_res_back_detach(uint32_t res) "res 0x%x"
-virtio_gpu_cmd_res_xfer_toh_2d(uint32_t res) "res 0x%x"
-virtio_gpu_cmd_res_flush(uint32_t res, uint32_t w, uint32_t h, uint32_t x, uint32_t y) "res 0x%x, w %d, h %d, x %d, y %d"
-virtio_gpu_update_cursor(uint32_t scanout, uint32_t x, uint32_t y, const char *type, uint32_t res) "scanout %d, x %d, y %d, %s, res 0x%x"
-
 # virtio-gpu-virgl.c
 virtio_gpu_gl_cmd_set_scanout(uint32_t id, uint32_t res, uint32_t w, uint32_t h, uint32_t x, uint32_t y) "id %d, res 0x%x, w %d, h %d, x %d, y %d"
 virtio_gpu_gl_cmd_res_create_2d(uint32_t res, uint32_t fmt, uint32_t w, uint32_t h) "res 0x%x, fmt 0x%x, w %d, h %d"
diff --git a/hw/display/trace-events-virtio b/hw/display/trace-events-virtio
new file mode 100644
index 000000000000..52d5c5152f79
--- /dev/null
+++ b/hw/display/trace-events-virtio
@@ -0,0 +1,16 @@
+# virtio-gpu-base.c
+virtio_gpu_features(bool virgl) "virgl %d"
+
+# virtio-gpu.c
+virtio_gpu_cmd_get_display_info(void) ""
+virtio_gpu_cmd_get_edid(uint32_t scanout) "scanout %d"
+virtio_gpu_cmd_set_scanout(uint32_t id, uint32_t res, uint32_t w, uint32_t h, uint32_t x, uint32_t y) "id %d, res 0x%x, w %d, h %d, x %d, y %d"
+virtio_gpu_cmd_set_scanout_blob(uint32_t id, uint32_t res, uint32_t w, uint32_t h, uint32_t x, uint32_t y) "id %d, res 0x%x, w %d, h %d, x %d, y %d"
+virtio_gpu_cmd_res_create_2d(uint32_t res, uint32_t fmt, uint32_t w, uint32_t h) "res 0x%x, fmt 0x%x, w %d, h %d"
+virtio_gpu_cmd_res_create_blob(uint32_t res, uint64_t size) "res 0x%x, size %" PRId64
+virtio_gpu_cmd_res_unref(uint32_t res) "res 0x%x"
+virtio_gpu_cmd_res_back_attach(uint32_t res) "res 0x%x"
+virtio_gpu_cmd_res_back_detach(uint32_t res) "res 0x%x"
+virtio_gpu_cmd_res_xfer_toh_2d(uint32_t res) "res 0x%x"
+virtio_gpu_cmd_res_flush(uint32_t res, uint32_t w, uint32_t h, uint32_t x, uint32_t y) "res 0x%x, w %d, h %d, x %d, y %d"
+virtio_gpu_update_cursor(uint32_t scanout, uint32_t x, uint32_t y, const char *type, uint32_t res) "scanout %d, x %d, y %d, %s, res 0x%x"
-- 
2.31.1



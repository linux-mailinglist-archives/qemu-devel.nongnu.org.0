Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CC939743F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 15:32:02 +0200 (CEST)
Received: from localhost ([::1]:41728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo4Uz-0000MJ-O0
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 09:32:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lo4Oh-0003nJ-Jh
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 09:25:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lo4Of-00081N-E7
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 09:25:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622553928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MREGTdfWsC+iEg1iPte2oenSmyrL5qC41bBzh+rI1Uw=;
 b=ZqI9IbH/xOEei3Nu2u61uxt9sYtgk0V1SHPodZz3fNinypEBCMmIuHJHzakGTXlisKZyzh
 SV+RH60SMUZr8B3qqaQ76HtR0f9Ifu64h0bSFl88serS/+FJrnB7+aTnmOC3aOIjSQ2dAd
 7d7g5YKCb2jorn+i6LwgKapcYN10Ln4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-5mNAwBv6PMONYKOlL-f54A-1; Tue, 01 Jun 2021 09:25:27 -0400
X-MC-Unique: 5mNAwBv6PMONYKOlL-f54A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33939189C461
 for <qemu-devel@nongnu.org>; Tue,  1 Jun 2021 13:25:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A6F2361140;
 Tue,  1 Jun 2021 13:25:25 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 07F8C18007B9; Tue,  1 Jun 2021 15:24:15 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 13/13] meson: move virtio-gl trace events to separate file
Date: Tue,  1 Jun 2021 15:24:14 +0200
Message-Id: <20210601132414.432430-14-kraxel@redhat.com>
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

Move virtio-gpu-gl trace events to separate trace-events-virtio-gl file.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/trace-virtio-gl.h      |  1 +
 hw/display/virtio-gpu-virgl.c     |  2 +-
 hw/display/meson.build            |  4 ++++
 hw/display/trace-events           | 19 -------------------
 hw/display/trace-events-virtio-gl | 18 ++++++++++++++++++
 5 files changed, 24 insertions(+), 20 deletions(-)
 create mode 100644 hw/display/trace-virtio-gl.h
 create mode 100644 hw/display/trace-events-virtio-gl

diff --git a/hw/display/trace-virtio-gl.h b/hw/display/trace-virtio-gl.h
new file mode 100644
index 000000000000..7fbccbf8bd77
--- /dev/null
+++ b/hw/display/trace-virtio-gl.h
@@ -0,0 +1 @@
+#include "trace/trace-hw_display_virtio_gpu_gl.h"
diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index ae48b98382ad..16f15ead4c76 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -13,7 +13,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/iov.h"
-#include "trace.h"
+#include "trace-virtio-gl.h"
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-gpu.h"
 
diff --git a/hw/display/meson.build b/hw/display/meson.build
index 645a12a7af99..373a0dce7cca 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -71,6 +71,10 @@ if config_all_devices.has_key('CONFIG_VIRTIO_GPU')
   virtio_gpu_gl_ss = ss.source_set()
   virtio_gpu_gl_ss.add(when: ['CONFIG_VIRTIO_GPU', 'CONFIG_VIRGL', opengl],
                        if_true: [files('virtio-gpu-gl.c', 'virtio-gpu-virgl.c'), pixman, virgl])
+  trace_events_config += {
+    'file'   : meson.source_root() / 'hw' / 'display' / 'trace-events-virtio-gl',
+    'module' : 'hw-display-virtio-gpu-gl',
+  }
   hw_display_modules += {'virtio-gpu-gl': virtio_gpu_gl_ss}
 endif
 
diff --git a/hw/display/trace-events b/hw/display/trace-events
index 27654aee8799..2127af5a14ef 100644
--- a/hw/display/trace-events
+++ b/hw/display/trace-events
@@ -22,25 +22,6 @@ vmware_scratch_read(uint32_t index, uint32_t value) "index %d, value 0x%x"
 vmware_scratch_write(uint32_t index, uint32_t value) "index %d, value 0x%x"
 vmware_setmode(uint32_t w, uint32_t h, uint32_t bpp) "%dx%d @ %d bpp"
 
-# virtio-gpu-virgl.c
-virtio_gpu_gl_cmd_set_scanout(uint32_t id, uint32_t res, uint32_t w, uint32_t h, uint32_t x, uint32_t y) "id %d, res 0x%x, w %d, h %d, x %d, y %d"
-virtio_gpu_gl_cmd_res_create_2d(uint32_t res, uint32_t fmt, uint32_t w, uint32_t h) "res 0x%x, fmt 0x%x, w %d, h %d"
-virtio_gpu_gl_cmd_res_create_3d(uint32_t res, uint32_t fmt, uint32_t w, uint32_t h, uint32_t d) "res 0x%x, fmt 0x%x, w %d, h %d, d %d"
-virtio_gpu_gl_cmd_res_unref(uint32_t res) "res 0x%x"
-virtio_gpu_gl_cmd_res_back_attach(uint32_t res) "res 0x%x"
-virtio_gpu_gl_cmd_res_back_detach(uint32_t res) "res 0x%x"
-virtio_gpu_gl_cmd_res_xfer_toh_2d(uint32_t res) "res 0x%x"
-virtio_gpu_gl_cmd_res_xfer_toh_3d(uint32_t res) "res 0x%x"
-virtio_gpu_gl_cmd_res_xfer_fromh_3d(uint32_t res) "res 0x%x"
-virtio_gpu_gl_cmd_res_flush(uint32_t res, uint32_t w, uint32_t h, uint32_t x, uint32_t y) "res 0x%x, w %d, h %d, x %d, y %d"
-virtio_gpu_gl_cmd_ctx_create(uint32_t ctx, const char *name) "ctx 0x%x, name %s"
-virtio_gpu_gl_cmd_ctx_destroy(uint32_t ctx) "ctx 0x%x"
-virtio_gpu_gl_cmd_ctx_res_attach(uint32_t ctx, uint32_t res) "ctx 0x%x, res 0x%x"
-virtio_gpu_gl_cmd_ctx_res_detach(uint32_t ctx, uint32_t res) "ctx 0x%x, res 0x%x"
-virtio_gpu_gl_cmd_ctx_submit(uint32_t ctx, uint32_t size) "ctx 0x%x, size %d"
-virtio_gpu_gl_fence_ctrl(uint64_t fence, uint32_t type) "fence 0x%" PRIx64 ", type 0x%x"
-virtio_gpu_gl_fence_resp(uint64_t fence) "fence 0x%" PRIx64
-
 # vga.c
 vga_std_read_io(uint32_t addr, uint32_t val) "addr 0x%x, val 0x%x"
 vga_std_write_io(uint32_t addr, uint32_t val) "addr 0x%x, val 0x%x"
diff --git a/hw/display/trace-events-virtio-gl b/hw/display/trace-events-virtio-gl
new file mode 100644
index 000000000000..1ccb0388917f
--- /dev/null
+++ b/hw/display/trace-events-virtio-gl
@@ -0,0 +1,18 @@
+# virtio-gpu-virgl.c
+virtio_gpu_gl_cmd_set_scanout(uint32_t id, uint32_t res, uint32_t w, uint32_t h, uint32_t x, uint32_t y) "id %d, res 0x%x, w %d, h %d, x %d, y %d"
+virtio_gpu_gl_cmd_res_create_2d(uint32_t res, uint32_t fmt, uint32_t w, uint32_t h) "res 0x%x, fmt 0x%x, w %d, h %d"
+virtio_gpu_gl_cmd_res_create_3d(uint32_t res, uint32_t fmt, uint32_t w, uint32_t h, uint32_t d) "res 0x%x, fmt 0x%x, w %d, h %d, d %d"
+virtio_gpu_gl_cmd_res_unref(uint32_t res) "res 0x%x"
+virtio_gpu_gl_cmd_res_back_attach(uint32_t res) "res 0x%x"
+virtio_gpu_gl_cmd_res_back_detach(uint32_t res) "res 0x%x"
+virtio_gpu_gl_cmd_res_xfer_toh_2d(uint32_t res) "res 0x%x"
+virtio_gpu_gl_cmd_res_xfer_toh_3d(uint32_t res) "res 0x%x"
+virtio_gpu_gl_cmd_res_xfer_fromh_3d(uint32_t res) "res 0x%x"
+virtio_gpu_gl_cmd_res_flush(uint32_t res, uint32_t w, uint32_t h, uint32_t x, uint32_t y) "res 0x%x, w %d, h %d, x %d, y %d"
+virtio_gpu_gl_cmd_ctx_create(uint32_t ctx, const char *name) "ctx 0x%x, name %s"
+virtio_gpu_gl_cmd_ctx_destroy(uint32_t ctx) "ctx 0x%x"
+virtio_gpu_gl_cmd_ctx_res_attach(uint32_t ctx, uint32_t res) "ctx 0x%x, res 0x%x"
+virtio_gpu_gl_cmd_ctx_res_detach(uint32_t ctx, uint32_t res) "ctx 0x%x, res 0x%x"
+virtio_gpu_gl_cmd_ctx_submit(uint32_t ctx, uint32_t size) "ctx 0x%x, size %d"
+virtio_gpu_gl_fence_ctrl(uint64_t fence, uint32_t type) "fence 0x%" PRIx64 ", type 0x%x"
+virtio_gpu_gl_fence_resp(uint64_t fence) "fence 0x%" PRIx64
-- 
2.31.1



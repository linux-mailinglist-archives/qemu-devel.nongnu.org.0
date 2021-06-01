Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E1739743A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 15:30:53 +0200 (CEST)
Received: from localhost ([::1]:38998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo4Ts-0006nP-LF
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 09:30:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lo4Of-0003dx-0C
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 09:25:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lo4Oc-0007ws-AW
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 09:25:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622553925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aIGjlP4zYiuoqvPOaNZOrRya+FfzIwSGe7uDHTOC6e4=;
 b=IRUkcDGo2CZPa4BMf3DS/itZq0zWIsukOMV1tkB01jbh4Na5JJ53nDAgQApiTzzPOTTcVB
 JOdlXYMV8FFAX6YuBUtlbIk0dapmXgdTp+Y4f9DRnq+kYDj9D4wdFV5ZEar9zg891/qyV3
 IsxbPfHrbamFLfARjwVct/8r2d6B9k4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-SQwD6NXTNUy8CyNPbD06EQ-1; Tue, 01 Jun 2021 09:25:24 -0400
X-MC-Unique: SQwD6NXTNUy8CyNPbD06EQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 500746D4EE
 for <qemu-devel@nongnu.org>; Tue,  1 Jun 2021 13:25:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5440A60C4A;
 Tue,  1 Jun 2021 13:25:13 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C59A518007B3; Tue,  1 Jun 2021 15:24:14 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/13] meson: move qxl trace events to separate file
Date: Tue,  1 Jun 2021 15:24:11 +0200
Message-Id: <20210601132414.432430-11-kraxel@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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

Move qxl trace events to separate trace-events-qxl file.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/display/trace-qxl.h      |  1 +
 hw/display/qxl-render.c     |  2 +-
 hw/display/qxl.c            |  2 +-
 hw/display/meson.build      |  4 +++
 hw/display/trace-events     | 67 -------------------------------------
 hw/display/trace-events-qxl | 66 ++++++++++++++++++++++++++++++++++++
 6 files changed, 73 insertions(+), 69 deletions(-)
 create mode 100644 hw/display/trace-qxl.h
 create mode 100644 hw/display/trace-events-qxl

diff --git a/hw/display/trace-qxl.h b/hw/display/trace-qxl.h
new file mode 100644
index 000000000000..aa6355abc34e
--- /dev/null
+++ b/hw/display/trace-qxl.h
@@ -0,0 +1 @@
+#include "trace/trace-hw_display_qxl.h"
diff --git a/hw/display/qxl-render.c b/hw/display/qxl-render.c
index d28849b12176..7a61a750f5a0 100644
--- a/hw/display/qxl-render.c
+++ b/hw/display/qxl-render.c
@@ -22,7 +22,7 @@
 #include "qemu/osdep.h"
 #include "qxl.h"
 #include "sysemu/runstate.h"
-#include "trace.h"
+#include "trace-qxl.h"
 
 static void qxl_blit(PCIQXLDevice *qxl, QXLRect *rect)
 {
diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index 6e1f8ff1b2a7..9d936cbac049 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -32,7 +32,7 @@
 #include "sysemu/runstate.h"
 #include "migration/blocker.h"
 #include "migration/vmstate.h"
-#include "trace.h"
+#include "trace-qxl.h"
 
 #include "qxl.h"
 
diff --git a/hw/display/meson.build b/hw/display/meson.build
index e1f473c1dff5..ac98861986d1 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -42,6 +42,10 @@ if config_all_devices.has_key('CONFIG_QXL')
   qxl_ss = ss.source_set()
   qxl_ss.add(when: 'CONFIG_QXL', if_true: [files('qxl.c', 'qxl-logger.c', 'qxl-render.c'),
                                            pixman, spice])
+  trace_events_config += {
+    'file'   : meson.source_root() / 'hw' / 'display' / 'trace-events-qxl',
+    'module' : 'hw-display-qxl',
+  }
   hw_display_modules += {'qxl': qxl_ss}
 endif
 
diff --git a/hw/display/trace-events b/hw/display/trace-events
index e47264af5da1..d9606677a436 100644
--- a/hw/display/trace-events
+++ b/hw/display/trace-events
@@ -50,73 +50,6 @@ virtio_gpu_update_cursor(uint32_t scanout, uint32_t x, uint32_t y, const char *t
 virtio_gpu_fence_ctrl(uint64_t fence, uint32_t type) "fence 0x%" PRIx64 ", type 0x%x"
 virtio_gpu_fence_resp(uint64_t fence) "fence 0x%" PRIx64
 
-# qxl.c
-disable qxl_interface_set_mm_time(int qid, uint32_t mm_time) "%d %d"
-disable qxl_io_write_vga(int qid, const char *mode, uint32_t addr, uint32_t val) "%d %s addr=%u val=%u"
-qxl_create_guest_primary(int qid, uint32_t width, uint32_t height, uint64_t mem, uint32_t format, uint32_t position) "%d %ux%u mem=0x%" PRIx64 " %u,%u"
-qxl_create_guest_primary_rest(int qid, int32_t stride, uint32_t type, uint32_t flags) "%d %d,%d,%d"
-qxl_destroy_primary(int qid) "%d"
-qxl_enter_vga_mode(int qid) "%d"
-qxl_exit_vga_mode(int qid) "%d"
-qxl_hard_reset(int qid, int64_t loadvm) "%d loadvm=%"PRId64
-qxl_interface_async_complete_io(int qid, uint32_t current_async, void *cookie) "%d current=%d cookie=%p"
-qxl_interface_attach_worker(int qid) "%d"
-qxl_interface_get_init_info(int qid) "%d"
-qxl_interface_set_compression_level(int qid, int64_t level) "%d %"PRId64
-qxl_interface_update_area_complete(int qid, uint32_t surface_id, uint32_t dirty_left, uint32_t dirty_right, uint32_t dirty_top, uint32_t dirty_bottom) "%d surface=%d [%d,%d,%d,%d]"
-qxl_interface_update_area_complete_rest(int qid, uint32_t num_updated_rects) "%d #=%d"
-qxl_interface_update_area_complete_overflow(int qid, int max) "%d max=%d"
-qxl_interface_update_area_complete_schedule_bh(int qid, uint32_t num_dirty) "%d #dirty=%d"
-qxl_io_destroy_primary_ignored(int qid, const char *mode) "%d %s"
-qxl_io_log(int qid, const char *log_buf) "%d %s"
-qxl_io_read_unexpected(int qid) "%d"
-qxl_io_unexpected_vga_mode(int qid, uint64_t addr, uint64_t val, const char *desc) "%d 0x%"PRIx64"=%"PRIu64" (%s)"
-qxl_io_write(int qid, const char *mode, uint64_t addr, const char *aname, uint64_t val, unsigned size, int async) "%d %s addr=%"PRIu64 " (%s) val=%"PRIu64" size=%u async=%d"
-qxl_memslot_add_guest(int qid, uint32_t slot_id, uint64_t guest_start, uint64_t guest_end) "%d %u: guest phys 0x%"PRIx64 " - 0x%" PRIx64
-qxl_post_load(int qid, const char *mode) "%d %s"
-qxl_pre_load(int qid) "%d"
-qxl_pre_save(int qid) "%d"
-qxl_reset_surfaces(int qid) "%d"
-qxl_ring_command_check(int qid, const char *mode) "%d %s"
-qxl_ring_command_get(int qid, const char *mode) "%d %s"
-qxl_ring_command_req_notification(int qid) "%d"
-qxl_ring_cursor_check(int qid, const char *mode) "%d %s"
-qxl_ring_cursor_get(int qid, const char *mode) "%d %s"
-qxl_ring_cursor_req_notification(int qid) "%d"
-qxl_ring_res_push(int qid, const char *mode, uint32_t surface_count, uint32_t free_res, void *last_release, const char *notify) "%d %s s#=%d res#=%d last=%p notify=%s"
-qxl_ring_res_push_rest(int qid, uint32_t ring_has, uint32_t ring_size, uint32_t prod, uint32_t cons) "%d ring %d/%d [%d,%d]"
-qxl_ring_res_put(int qid, uint32_t free_res) "%d #res=%d"
-qxl_set_mode(int qid, int modenr, uint32_t x_res, uint32_t y_res, uint32_t bits, uint64_t devmem) "%d mode=%d [ x=%d y=%d @ bpp=%d devmem=0x%" PRIx64 " ]"
-qxl_soft_reset(int qid) "%d"
-qxl_spice_destroy_surfaces_complete(int qid) "%d"
-qxl_spice_destroy_surfaces(int qid, int async) "%d async=%d"
-qxl_spice_destroy_surface_wait_complete(int qid, uint32_t id) "%d sid=%d"
-qxl_spice_destroy_surface_wait(int qid, uint32_t id, int async) "%d sid=%d async=%d"
-qxl_spice_flush_surfaces_async(int qid, uint32_t surface_count, uint32_t num_free_res) "%d s#=%d, res#=%d"
-qxl_spice_monitors_config(int qid) "%d"
-qxl_spice_loadvm_commands(int qid, void *ext, uint32_t count) "%d ext=%p count=%d"
-qxl_spice_oom(int qid) "%d"
-qxl_spice_reset_cursor(int qid) "%d"
-qxl_spice_reset_image_cache(int qid) "%d"
-qxl_spice_reset_memslots(int qid) "%d"
-qxl_spice_update_area(int qid, uint32_t surface_id, uint32_t left, uint32_t right, uint32_t top, uint32_t bottom) "%d sid=%d [%d,%d,%d,%d]"
-qxl_spice_update_area_rest(int qid, uint32_t num_dirty_rects, uint32_t clear_dirty_region) "%d #d=%d clear=%d"
-qxl_surfaces_dirty(int qid, uint64_t offset, uint64_t size) "%d offset=0x%"PRIx64" size=0x%"PRIx64
-qxl_send_events(int qid, uint32_t events) "%d %d"
-qxl_send_events_vm_stopped(int qid, uint32_t events) "%d %d"
-qxl_set_guest_bug(int qid) "%d"
-qxl_interrupt_client_monitors_config(int qid, int num_heads, void *heads) "%d %d %p"
-qxl_client_monitors_config_unsupported_by_guest(int qid, uint32_t int_mask, void *client_monitors_config) "%d 0x%X %p"
-qxl_client_monitors_config_unsupported_by_device(int qid, int revision) "%d revision=%d"
-qxl_client_monitors_config_capped(int qid, int requested, int limit) "%d %d %d"
-qxl_client_monitors_config_crc(int qid, unsigned size, uint32_t crc32) "%d %u %u"
-qxl_set_client_capabilities_unsupported_by_revision(int qid, int revision) "%d revision=%d"
-
-# qxl-render.c
-qxl_render_blit(int32_t stride, int32_t left, int32_t right, int32_t top, int32_t bottom) "stride=%d [%d, %d, %d, %d]"
-qxl_render_guest_primary_resized(int32_t width, int32_t height, int32_t stride, int32_t bytes_pp, int32_t bits_pp) "%dx%d, stride %d, bpp %d, depth %d"
-qxl_render_update_area_done(void *cookie) "%p"
-
 # vga.c
 vga_std_read_io(uint32_t addr, uint32_t val) "addr 0x%x, val 0x%x"
 vga_std_write_io(uint32_t addr, uint32_t val) "addr 0x%x, val 0x%x"
diff --git a/hw/display/trace-events-qxl b/hw/display/trace-events-qxl
new file mode 100644
index 000000000000..1146bd1640d2
--- /dev/null
+++ b/hw/display/trace-events-qxl
@@ -0,0 +1,66 @@
+# qxl.c
+disable qxl_interface_set_mm_time(int qid, uint32_t mm_time) "%d %d"
+disable qxl_io_write_vga(int qid, const char *mode, uint32_t addr, uint32_t val) "%d %s addr=%u val=%u"
+qxl_create_guest_primary(int qid, uint32_t width, uint32_t height, uint64_t mem, uint32_t format, uint32_t position) "%d %ux%u mem=0x%" PRIx64 " %u,%u"
+qxl_create_guest_primary_rest(int qid, int32_t stride, uint32_t type, uint32_t flags) "%d %d,%d,%d"
+qxl_destroy_primary(int qid) "%d"
+qxl_enter_vga_mode(int qid) "%d"
+qxl_exit_vga_mode(int qid) "%d"
+qxl_hard_reset(int qid, int64_t loadvm) "%d loadvm=%"PRId64
+qxl_interface_async_complete_io(int qid, uint32_t current_async, void *cookie) "%d current=%d cookie=%p"
+qxl_interface_attach_worker(int qid) "%d"
+qxl_interface_get_init_info(int qid) "%d"
+qxl_interface_set_compression_level(int qid, int64_t level) "%d %"PRId64
+qxl_interface_update_area_complete(int qid, uint32_t surface_id, uint32_t dirty_left, uint32_t dirty_right, uint32_t dirty_top, uint32_t dirty_bottom) "%d surface=%d [%d,%d,%d,%d]"
+qxl_interface_update_area_complete_rest(int qid, uint32_t num_updated_rects) "%d #=%d"
+qxl_interface_update_area_complete_overflow(int qid, int max) "%d max=%d"
+qxl_interface_update_area_complete_schedule_bh(int qid, uint32_t num_dirty) "%d #dirty=%d"
+qxl_io_destroy_primary_ignored(int qid, const char *mode) "%d %s"
+qxl_io_log(int qid, const char *log_buf) "%d %s"
+qxl_io_read_unexpected(int qid) "%d"
+qxl_io_unexpected_vga_mode(int qid, uint64_t addr, uint64_t val, const char *desc) "%d 0x%"PRIx64"=%"PRIu64" (%s)"
+qxl_io_write(int qid, const char *mode, uint64_t addr, const char *aname, uint64_t val, unsigned size, int async) "%d %s addr=%"PRIu64 " (%s) val=%"PRIu64" size=%u async=%d"
+qxl_memslot_add_guest(int qid, uint32_t slot_id, uint64_t guest_start, uint64_t guest_end) "%d %u: guest phys 0x%"PRIx64 " - 0x%" PRIx64
+qxl_post_load(int qid, const char *mode) "%d %s"
+qxl_pre_load(int qid) "%d"
+qxl_pre_save(int qid) "%d"
+qxl_reset_surfaces(int qid) "%d"
+qxl_ring_command_check(int qid, const char *mode) "%d %s"
+qxl_ring_command_get(int qid, const char *mode) "%d %s"
+qxl_ring_command_req_notification(int qid) "%d"
+qxl_ring_cursor_check(int qid, const char *mode) "%d %s"
+qxl_ring_cursor_get(int qid, const char *mode) "%d %s"
+qxl_ring_cursor_req_notification(int qid) "%d"
+qxl_ring_res_push(int qid, const char *mode, uint32_t surface_count, uint32_t free_res, void *last_release, const char *notify) "%d %s s#=%d res#=%d last=%p notify=%s"
+qxl_ring_res_push_rest(int qid, uint32_t ring_has, uint32_t ring_size, uint32_t prod, uint32_t cons) "%d ring %d/%d [%d,%d]"
+qxl_ring_res_put(int qid, uint32_t free_res) "%d #res=%d"
+qxl_set_mode(int qid, int modenr, uint32_t x_res, uint32_t y_res, uint32_t bits, uint64_t devmem) "%d mode=%d [ x=%d y=%d @ bpp=%d devmem=0x%" PRIx64 " ]"
+qxl_soft_reset(int qid) "%d"
+qxl_spice_destroy_surfaces_complete(int qid) "%d"
+qxl_spice_destroy_surfaces(int qid, int async) "%d async=%d"
+qxl_spice_destroy_surface_wait_complete(int qid, uint32_t id) "%d sid=%d"
+qxl_spice_destroy_surface_wait(int qid, uint32_t id, int async) "%d sid=%d async=%d"
+qxl_spice_flush_surfaces_async(int qid, uint32_t surface_count, uint32_t num_free_res) "%d s#=%d, res#=%d"
+qxl_spice_monitors_config(int qid) "%d"
+qxl_spice_loadvm_commands(int qid, void *ext, uint32_t count) "%d ext=%p count=%d"
+qxl_spice_oom(int qid) "%d"
+qxl_spice_reset_cursor(int qid) "%d"
+qxl_spice_reset_image_cache(int qid) "%d"
+qxl_spice_reset_memslots(int qid) "%d"
+qxl_spice_update_area(int qid, uint32_t surface_id, uint32_t left, uint32_t right, uint32_t top, uint32_t bottom) "%d sid=%d [%d,%d,%d,%d]"
+qxl_spice_update_area_rest(int qid, uint32_t num_dirty_rects, uint32_t clear_dirty_region) "%d #d=%d clear=%d"
+qxl_surfaces_dirty(int qid, uint64_t offset, uint64_t size) "%d offset=0x%"PRIx64" size=0x%"PRIx64
+qxl_send_events(int qid, uint32_t events) "%d %d"
+qxl_send_events_vm_stopped(int qid, uint32_t events) "%d %d"
+qxl_set_guest_bug(int qid) "%d"
+qxl_interrupt_client_monitors_config(int qid, int num_heads, void *heads) "%d %d %p"
+qxl_client_monitors_config_unsupported_by_guest(int qid, uint32_t int_mask, void *client_monitors_config) "%d 0x%X %p"
+qxl_client_monitors_config_unsupported_by_device(int qid, int revision) "%d revision=%d"
+qxl_client_monitors_config_capped(int qid, int requested, int limit) "%d %d %d"
+qxl_client_monitors_config_crc(int qid, unsigned size, uint32_t crc32) "%d %u %u"
+qxl_set_client_capabilities_unsupported_by_revision(int qid, int revision) "%d revision=%d"
+
+# qxl-render.c
+qxl_render_blit(int32_t stride, int32_t left, int32_t right, int32_t top, int32_t bottom) "stride=%d [%d, %d, %d, %d]"
+qxl_render_guest_primary_resized(int32_t width, int32_t height, int32_t stride, int32_t bytes_pp, int32_t bits_pp) "%dx%d, stride %d, bpp %d, depth %d"
+qxl_render_update_area_done(void *cookie) "%p"
-- 
2.31.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 288E84A005C
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 19:51:20 +0100 (CET)
Received: from localhost ([::1]:48044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDWL6-0003Uu-63
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 13:51:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDW3k-0004RG-OZ
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:33:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nDW3f-0000uu-5q
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:33:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643394792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dSJDJ/uTmwSJ4RdPNgFLHa0xMl2gTxmT2BAl0JEJoTU=;
 b=dxeSyU02QoTuCdhFV/vWXaDQRXkt6R2wGK0wepNxmnmvpiEIAyRNpup2eohgufctFC0tO0
 W/6J/4MqXITZKYUQ4S+PRMsM9XNR3VrMNadNFZ8e/eTQjcRkmRg5C5n2XflZokeLMZChM5
 Hp3SyzSar3HvOmCo2Otiv31/SiIhrkk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-335-8WezpSgYPbSKznNzGUdN0Q-1; Fri, 28 Jan 2022 13:33:09 -0500
X-MC-Unique: 8WezpSgYPbSKznNzGUdN0Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2944810247B1;
 Fri, 28 Jan 2022 18:33:06 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7092277472;
 Fri, 28 Jan 2022 18:31:49 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/36] migration: All this fields are unsigned
Date: Fri, 28 Jan 2022 19:29:58 +0100
Message-Id: <20220128183033.31998-2-quintela@redhat.com>
In-Reply-To: <20220128183033.31998-1-quintela@redhat.com>
References: <20220128183033.31998-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIMWL_WL_HIGH=-0.167, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Eric Blake <eblake@redhat.com>,
 Hannes Reinecke <hare@suse.com>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Igor Mammedov <imammedo@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Laurent Vivier <laurent@vivier.eu>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

So printing it as %d is wrong.  Notice that for the channel id, that
is an uint8_t, but I changed it anyways for consistency.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
---
 migration/multifd-zlib.c | 20 ++++++++++----------
 migration/multifd-zstd.c | 24 ++++++++++++------------
 migration/multifd.c      | 16 ++++++++--------
 migration/trace-events   | 26 +++++++++++++-------------
 4 files changed, 43 insertions(+), 43 deletions(-)

diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
index da6201704c..9f6ebf1076 100644
--- a/migration/multifd-zlib.c
+++ b/migration/multifd-zlib.c
@@ -51,7 +51,7 @@ static int zlib_send_setup(MultiFDSendParams *p, Error **errp)
     zs->opaque = Z_NULL;
     if (deflateInit(zs, migrate_multifd_zlib_level()) != Z_OK) {
         g_free(z);
-        error_setg(errp, "multifd %d: deflate init failed", p->id);
+        error_setg(errp, "multifd %u: deflate init failed", p->id);
         return -1;
     }
     /* To be safe, we reserve twice the size of the packet */
@@ -60,7 +60,7 @@ static int zlib_send_setup(MultiFDSendParams *p, Error **errp)
     if (!z->zbuff) {
         deflateEnd(&z->zs);
         g_free(z);
-        error_setg(errp, "multifd %d: out of memory for zbuff", p->id);
+        error_setg(errp, "multifd %u: out of memory for zbuff", p->id);
         return -1;
     }
     p->data = z;
@@ -132,12 +132,12 @@ static int zlib_send_prepare(MultiFDSendParams *p, Error **errp)
             ret = deflate(zs, flush);
         } while (ret == Z_OK && zs->avail_in && zs->avail_out);
         if (ret == Z_OK && zs->avail_in) {
-            error_setg(errp, "multifd %d: deflate failed to compress all input",
+            error_setg(errp, "multifd %u: deflate failed to compress all input",
                        p->id);
             return -1;
         }
         if (ret != Z_OK) {
-            error_setg(errp, "multifd %d: deflate returned %d instead of Z_OK",
+            error_setg(errp, "multifd %u: deflate returned %d instead of Z_OK",
                        p->id, ret);
             return -1;
         }
@@ -190,7 +190,7 @@ static int zlib_recv_setup(MultiFDRecvParams *p, Error **errp)
     zs->avail_in = 0;
     zs->next_in = Z_NULL;
     if (inflateInit(zs) != Z_OK) {
-        error_setg(errp, "multifd %d: inflate init failed", p->id);
+        error_setg(errp, "multifd %u: inflate init failed", p->id);
         return -1;
     }
     /* To be safe, we reserve twice the size of the packet */
@@ -198,7 +198,7 @@ static int zlib_recv_setup(MultiFDRecvParams *p, Error **errp)
     z->zbuff = g_try_malloc(z->zbuff_len);
     if (!z->zbuff) {
         inflateEnd(zs);
-        error_setg(errp, "multifd %d: out of memory for zbuff", p->id);
+        error_setg(errp, "multifd %u: out of memory for zbuff", p->id);
         return -1;
     }
     return 0;
@@ -247,7 +247,7 @@ static int zlib_recv_pages(MultiFDRecvParams *p, Error **errp)
     int i;
 
     if (flags != MULTIFD_FLAG_ZLIB) {
-        error_setg(errp, "multifd %d: flags received %x flags expected %x",
+        error_setg(errp, "multifd %u: flags received %x flags expected %x",
                    p->id, flags, MULTIFD_FLAG_ZLIB);
         return -1;
     }
@@ -284,19 +284,19 @@ static int zlib_recv_pages(MultiFDRecvParams *p, Error **errp)
         } while (ret == Z_OK && zs->avail_in
                              && (zs->total_out - start) < page_size);
         if (ret == Z_OK && (zs->total_out - start) < page_size) {
-            error_setg(errp, "multifd %d: inflate generated too few output",
+            error_setg(errp, "multifd %u: inflate generated too few output",
                        p->id);
             return -1;
         }
         if (ret != Z_OK) {
-            error_setg(errp, "multifd %d: inflate returned %d instead of Z_OK",
+            error_setg(errp, "multifd %u: inflate returned %d instead of Z_OK",
                        p->id, ret);
             return -1;
         }
     }
     out_size = zs->total_out - out_size;
     if (out_size != expected_size) {
-        error_setg(errp, "multifd %d: packet size received %d size expected %d",
+        error_setg(errp, "multifd %u: packet size received %u size expected %u",
                    p->id, out_size, expected_size);
         return -1;
     }
diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
index 2d5b61106c..cc4e991724 100644
--- a/migration/multifd-zstd.c
+++ b/migration/multifd-zstd.c
@@ -55,7 +55,7 @@ static int zstd_send_setup(MultiFDSendParams *p, Error **errp)
     z->zcs = ZSTD_createCStream();
     if (!z->zcs) {
         g_free(z);
-        error_setg(errp, "multifd %d: zstd createCStream failed", p->id);
+        error_setg(errp, "multifd %u: zstd createCStream failed", p->id);
         return -1;
     }
 
@@ -63,7 +63,7 @@ static int zstd_send_setup(MultiFDSendParams *p, Error **errp)
     if (ZSTD_isError(res)) {
         ZSTD_freeCStream(z->zcs);
         g_free(z);
-        error_setg(errp, "multifd %d: initCStream failed with error %s",
+        error_setg(errp, "multifd %u: initCStream failed with error %s",
                    p->id, ZSTD_getErrorName(res));
         return -1;
     }
@@ -73,7 +73,7 @@ static int zstd_send_setup(MultiFDSendParams *p, Error **errp)
     if (!z->zbuff) {
         ZSTD_freeCStream(z->zcs);
         g_free(z);
-        error_setg(errp, "multifd %d: out of memory for zbuff", p->id);
+        error_setg(errp, "multifd %u: out of memory for zbuff", p->id);
         return -1;
     }
     return 0;
@@ -144,12 +144,12 @@ static int zstd_send_prepare(MultiFDSendParams *p, Error **errp)
         } while (ret > 0 && (z->in.size - z->in.pos > 0)
                          && (z->out.size - z->out.pos > 0));
         if (ret > 0 && (z->in.size - z->in.pos > 0)) {
-            error_setg(errp, "multifd %d: compressStream buffer too small",
+            error_setg(errp, "multifd %u: compressStream buffer too small",
                        p->id);
             return -1;
         }
         if (ZSTD_isError(ret)) {
-            error_setg(errp, "multifd %d: compressStream error %s",
+            error_setg(errp, "multifd %u: compressStream error %s",
                        p->id, ZSTD_getErrorName(ret));
             return -1;
         }
@@ -198,7 +198,7 @@ static int zstd_recv_setup(MultiFDRecvParams *p, Error **errp)
     z->zds = ZSTD_createDStream();
     if (!z->zds) {
         g_free(z);
-        error_setg(errp, "multifd %d: zstd createDStream failed", p->id);
+        error_setg(errp, "multifd %u: zstd createDStream failed", p->id);
         return -1;
     }
 
@@ -206,7 +206,7 @@ static int zstd_recv_setup(MultiFDRecvParams *p, Error **errp)
     if (ZSTD_isError(ret)) {
         ZSTD_freeDStream(z->zds);
         g_free(z);
-        error_setg(errp, "multifd %d: initDStream failed with error %s",
+        error_setg(errp, "multifd %u: initDStream failed with error %s",
                    p->id, ZSTD_getErrorName(ret));
         return -1;
     }
@@ -217,7 +217,7 @@ static int zstd_recv_setup(MultiFDRecvParams *p, Error **errp)
     if (!z->zbuff) {
         ZSTD_freeDStream(z->zds);
         g_free(z);
-        error_setg(errp, "multifd %d: out of memory for zbuff", p->id);
+        error_setg(errp, "multifd %u: out of memory for zbuff", p->id);
         return -1;
     }
     return 0;
@@ -265,7 +265,7 @@ static int zstd_recv_pages(MultiFDRecvParams *p, Error **errp)
     int i;
 
     if (flags != MULTIFD_FLAG_ZSTD) {
-        error_setg(errp, "multifd %d: flags received %x flags expected %x",
+        error_setg(errp, "multifd %u: flags received %x flags expected %x",
                    p->id, flags, MULTIFD_FLAG_ZSTD);
         return -1;
     }
@@ -297,19 +297,19 @@ static int zstd_recv_pages(MultiFDRecvParams *p, Error **errp)
         } while (ret > 0 && (z->in.size - z->in.pos > 0)
                          && (z->out.pos < page_size));
         if (ret > 0 && (z->out.pos < page_size)) {
-            error_setg(errp, "multifd %d: decompressStream buffer too small",
+            error_setg(errp, "multifd %u: decompressStream buffer too small",
                        p->id);
             return -1;
         }
         if (ZSTD_isError(ret)) {
-            error_setg(errp, "multifd %d: decompressStream returned %s",
+            error_setg(errp, "multifd %u: decompressStream returned %s",
                        p->id, ZSTD_getErrorName(ret));
             return ret;
         }
         out_size += z->out.pos;
     }
     if (out_size != expected_size) {
-        error_setg(errp, "multifd %d: packet size received %d size expected %d",
+        error_setg(errp, "multifd %u: packet size received %u size expected %u",
                    p->id, out_size, expected_size);
         return -1;
     }
diff --git a/migration/multifd.c b/migration/multifd.c
index 3242f688e5..4d62850258 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -148,7 +148,7 @@ static int nocomp_recv_pages(MultiFDRecvParams *p, Error **errp)
     uint32_t flags = p->flags & MULTIFD_FLAG_COMPRESSION_MASK;
 
     if (flags != MULTIFD_FLAG_NOCOMP) {
-        error_setg(errp, "multifd %d: flags received %x flags expected %x",
+        error_setg(errp, "multifd %u: flags received %x flags expected %x",
                    p->id, flags, MULTIFD_FLAG_NOCOMP);
         return -1;
     }
@@ -212,8 +212,8 @@ static int multifd_recv_initial_packet(QIOChannel *c, Error **errp)
     }
 
     if (msg.version != MULTIFD_VERSION) {
-        error_setg(errp, "multifd: received packet version %d "
-                   "expected %d", msg.version, MULTIFD_VERSION);
+        error_setg(errp, "multifd: received packet version %u "
+                   "expected %u", msg.version, MULTIFD_VERSION);
         return -1;
     }
 
@@ -229,8 +229,8 @@ static int multifd_recv_initial_packet(QIOChannel *c, Error **errp)
     }
 
     if (msg.id > migrate_multifd_channels()) {
-        error_setg(errp, "multifd: received channel version %d "
-                   "expected %d", msg.version, MULTIFD_VERSION);
+        error_setg(errp, "multifd: received channel version %u "
+                   "expected %u", msg.version, MULTIFD_VERSION);
         return -1;
     }
 
@@ -303,7 +303,7 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
     packet->version = be32_to_cpu(packet->version);
     if (packet->version != MULTIFD_VERSION) {
         error_setg(errp, "multifd: received packet "
-                   "version %d and expected version %d",
+                   "version %u and expected version %u",
                    packet->version, MULTIFD_VERSION);
         return -1;
     }
@@ -317,7 +317,7 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
      */
     if (packet->pages_alloc > pages_max * 100) {
         error_setg(errp, "multifd: received packet "
-                   "with size %d and expected a maximum size of %d",
+                   "with size %u and expected a maximum size of %u",
                    packet->pages_alloc, pages_max * 100) ;
         return -1;
     }
@@ -333,7 +333,7 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
     p->pages->num = be32_to_cpu(packet->pages_used);
     if (p->pages->num > packet->pages_alloc) {
         error_setg(errp, "multifd: received packet "
-                   "with %d pages and expected maximum pages are %d",
+                   "with %u pages and expected maximum pages are %u",
                    p->pages->num, packet->pages_alloc) ;
         return -1;
     }
diff --git a/migration/trace-events b/migration/trace-events
index b48d873b8a..5172cb3b3d 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -115,23 +115,23 @@ ram_write_tracking_ramblock_start(const char *block_id, size_t page_size, void *
 ram_write_tracking_ramblock_stop(const char *block_id, size_t page_size, void *addr, size_t length) "%s: page_size: %zu addr: %p length: %zu"
 
 # multifd.c
-multifd_new_send_channel_async(uint8_t id) "channel %d"
-multifd_recv(uint8_t id, uint64_t packet_num, uint32_t used, uint32_t flags, uint32_t next_packet_size) "channel %d packet_num %" PRIu64 " pages %d flags 0x%x next packet size %d"
-multifd_recv_new_channel(uint8_t id) "channel %d"
+multifd_new_send_channel_async(uint8_t id) "channel %u"
+multifd_recv(uint8_t id, uint64_t packet_num, uint32_t used, uint32_t flags, uint32_t next_packet_size) "channel %u packet_num %" PRIu64 " pages %u flags 0x%x next packet size %u"
+multifd_recv_new_channel(uint8_t id) "channel %u"
 multifd_recv_sync_main(long packet_num) "packet num %ld"
-multifd_recv_sync_main_signal(uint8_t id) "channel %d"
-multifd_recv_sync_main_wait(uint8_t id) "channel %d"
+multifd_recv_sync_main_signal(uint8_t id) "channel %u"
+multifd_recv_sync_main_wait(uint8_t id) "channel %u"
 multifd_recv_terminate_threads(bool error) "error %d"
-multifd_recv_thread_end(uint8_t id, uint64_t packets, uint64_t pages) "channel %d packets %" PRIu64 " pages %" PRIu64
-multifd_recv_thread_start(uint8_t id) "%d"
-multifd_send(uint8_t id, uint64_t packet_num, uint32_t used, uint32_t flags, uint32_t next_packet_size) "channel %d packet_num %" PRIu64 " pages %d flags 0x%x next packet size %d"
-multifd_send_error(uint8_t id) "channel %d"
+multifd_recv_thread_end(uint8_t id, uint64_t packets, uint64_t pages) "channel %u packets %" PRIu64 " pages %" PRIu64
+multifd_recv_thread_start(uint8_t id) "%u"
+multifd_send(uint8_t id, uint64_t packet_num, uint32_t used, uint32_t flags, uint32_t next_packet_size) "channel %u packet_num %" PRIu64 " pages %u flags 0x%x next packet size %u"
+multifd_send_error(uint8_t id) "channel %u"
 multifd_send_sync_main(long packet_num) "packet num %ld"
-multifd_send_sync_main_signal(uint8_t id) "channel %d"
-multifd_send_sync_main_wait(uint8_t id) "channel %d"
+multifd_send_sync_main_signal(uint8_t id) "channel %u"
+multifd_send_sync_main_wait(uint8_t id) "channel %u"
 multifd_send_terminate_threads(bool error) "error %d"
-multifd_send_thread_end(uint8_t id, uint64_t packets, uint64_t pages) "channel %d packets %" PRIu64 " pages %"  PRIu64
-multifd_send_thread_start(uint8_t id) "%d"
+multifd_send_thread_end(uint8_t id, uint64_t packets, uint64_t pages) "channel %u packets %" PRIu64 " pages %"  PRIu64
+multifd_send_thread_start(uint8_t id) "%u"
 multifd_tls_outgoing_handshake_start(void *ioc, void *tioc, const char *hostname) "ioc=%p tioc=%p hostname=%s"
 multifd_tls_outgoing_handshake_error(void *ioc, const char *err) "ioc=%p err=%s"
 multifd_tls_outgoing_handshake_complete(void *ioc) "ioc=%p"
-- 
2.34.1



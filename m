Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B711FF2ED
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jun 2020 15:24:02 +0200 (CEST)
Received: from localhost ([::1]:39234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jluWP-00087D-Rt
	for lists+qemu-devel@lfdr.de; Thu, 18 Jun 2020 09:24:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jluVC-0005wS-9d
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 09:22:46 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:40945
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jluVA-0005ml-Kl
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 09:22:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592486564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=X+BZX1BaGzUe3Qvjw967m9fYyu6CebM9xadgO89zEXQ=;
 b=LcHC+NCSqrhw5tHW11kp/S2ePqhGC34GHEpxLUbAzd3X2NnjMjnqE+gh4Jh6Hr1Y/U2iK6
 Imwa9nnyZ0fBqmxFpq3hqBU09mTtz33uH4dLghmaZypY5TVdCbdVqFsd3UEMcOcNVbyYxn
 d8A/ZTGfnE+kicaUVQb7APLDF+fW4FM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-yyIintg9OmSmvNuGg87J8w-1; Thu, 18 Jun 2020 09:22:42 -0400
X-MC-Unique: yyIintg9OmSmvNuGg87J8w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33962193F579;
 Thu, 18 Jun 2020 13:22:36 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-12-109.pek2.redhat.com
 [10.72.12.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6495E5BAC2;
 Thu, 18 Jun 2020 13:22:33 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL V2 11/33] net: cadence_gem: Fix debug statements
Date: Thu, 18 Jun 2020 21:21:26 +0800
Message-Id: <1592486508-6135-12-git-send-email-jasowang@redhat.com>
In-Reply-To: <1592486508-6135-1-git-send-email-jasowang@redhat.com>
References: <1592486508-6135-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.120; envelope-from=jasowang@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/18 01:21:16
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>

Enabling debug breaks the build, Fix them and make debug statements
always compilable. Fix few statements to use sized integer casting.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/cadence_gem.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index e8f9cc7..2e273dca 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -35,14 +35,13 @@
 #include "sysemu/dma.h"
 #include "net/checksum.h"
 
-#ifdef CADENCE_GEM_ERR_DEBUG
-#define DB_PRINT(...) do { \
-    fprintf(stderr,  ": %s: ", __func__); \
-    fprintf(stderr, ## __VA_ARGS__); \
-    } while (0)
-#else
-    #define DB_PRINT(...)
-#endif
+#define CADENCE_GEM_ERR_DEBUG 0
+#define DB_PRINT(...) do {\
+    if (CADENCE_GEM_ERR_DEBUG) {   \
+        qemu_log(": %s: ", __func__); \
+        qemu_log(__VA_ARGS__); \
+    } \
+} while (0)
 
 #define GEM_NWCTRL        (0x00000000/4) /* Network Control reg */
 #define GEM_NWCFG         (0x00000004/4) /* Network Config reg */
@@ -979,7 +978,7 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
         size += 4;
     }
 
-    DB_PRINT("config bufsize: %d packet size: %ld\n", rxbufsize, size);
+    DB_PRINT("config bufsize: %u packet size: %zd\n", rxbufsize, size);
 
     /* Find which queue we are targeting */
     q = get_queue_from_screen(s, rxbuf_ptr, rxbufsize);
@@ -992,9 +991,9 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
             return -1;
         }
 
-        DB_PRINT("copy %u bytes to 0x%" PRIx64 "\n",
-                 MIN(bytes_to_copy, rxbufsize),
-                 rx_desc_get_buffer(s, s->rx_desc[q]));
+        DB_PRINT("copy %" PRIu32 " bytes to 0x%" PRIx64 "\n",
+                MIN(bytes_to_copy, rxbufsize),
+                rx_desc_get_buffer(s, s->rx_desc[q]));
 
         /* Copy packet data to emulated DMA buffer */
         address_space_write(&s->dma_as, rx_desc_get_buffer(s, s->rx_desc[q]) +
@@ -1160,8 +1159,8 @@ static void gem_transmit(CadenceGEMState *s)
              */
             if ((tx_desc_get_buffer(s, desc) == 0) ||
                 (tx_desc_get_length(desc) == 0)) {
-                DB_PRINT("Invalid TX descriptor @ 0x%x\n",
-                         (unsigned)packet_desc_addr);
+                DB_PRINT("Invalid TX descriptor @ 0x%" HWADDR_PRIx "\n",
+                         packet_desc_addr);
                 break;
             }
 
-- 
2.5.0



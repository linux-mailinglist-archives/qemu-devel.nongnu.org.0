Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9846C1E614A
	for <lists+qemu-devel@lfdr.de>; Thu, 28 May 2020 14:48:36 +0200 (CEST)
Received: from localhost ([::1]:60658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jeHxb-0001Wv-Ew
	for lists+qemu-devel@lfdr.de; Thu, 28 May 2020 08:48:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jeHly-0001pm-7b
 for qemu-devel@nongnu.org; Thu, 28 May 2020 08:36:34 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:50234
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jeHlr-0005Cu-P9
 for qemu-devel@nongnu.org; Thu, 28 May 2020 08:36:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590669386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FTTWm2Ie3ZetkYcgR/YsLvRvE6iLrx2iZOgaTJeYsuo=;
 b=YEtR0YeeCHy33ZC7cz110CQGB4nG/VlQUNm0X4W5s+tW/+jUrZTzyGeHovQKOt5ABC0u7k
 vYADVK9KthLmEOQxY21ciGFbubwVSGiSbt7jtj9NtSZ3AdifEOrd1mimyiv9NenXw+ILXO
 YmdfRIo4XfVdEg43EZGdIwkl9+srBQE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-WqQZlz30MHmC6OHdIHC5jw-1; Thu, 28 May 2020 08:36:22 -0400
X-MC-Unique: WqQZlz30MHmC6OHdIHC5jw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65DD3835B40;
 Thu, 28 May 2020 12:36:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BBBFA610AB;
 Thu, 28 May 2020 12:36:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B6F089D59; Thu, 28 May 2020 14:36:09 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/21] hw/display/vmware_vga: Replace printf() calls by
 qemu_log_mask(ERROR)
Date: Thu, 28 May 2020 14:35:58 +0200
Message-Id: <20200528123609.27362-11-kraxel@redhat.com>
In-Reply-To: <20200528123609.27362-1-kraxel@redhat.com>
References: <20200528123609.27362-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/28 02:50:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Avoid flooding stdio by converting printf() calls to
qemu_log_mask(GUEST_ERROR), which are disabled by default.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20200526062252.19852-11-f4bug@amsat.org
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/vmware_vga.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
index 58ea82e3e581..5c0fc49d9d6e 100644
--- a/hw/display/vmware_vga.c
+++ b/hw/display/vmware_vga.c
@@ -26,6 +26,7 @@
 #include "qemu/module.h"
 #include "qemu/units.h"
 #include "qapi/error.h"
+#include "qemu/log.h"
 #include "hw/loader.h"
 #include "trace.h"
 #include "ui/vnc.h"
@@ -953,7 +954,8 @@ static uint32_t vmsvga_value_read(void *opaque, uint32_t address)
             ret = s->scratch[s->index - SVGA_SCRATCH_BASE];
             break;
         }
-        printf("%s: Bad register %02x\n", __func__, s->index);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Bad register %02x\n", __func__, s->index);
         ret = 0;
         break;
     }
@@ -1002,7 +1004,8 @@ static void vmsvga_value_write(void *opaque, uint32_t address, uint32_t value)
             s->new_width = value;
             s->invalidated = 1;
         } else {
-            printf("%s: Bad width: %i\n", __func__, value);
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: Bad width: %i\n", __func__, value);
         }
         break;
 
@@ -1011,13 +1014,15 @@ static void vmsvga_value_write(void *opaque, uint32_t address, uint32_t value)
             s->new_height = value;
             s->invalidated = 1;
         } else {
-            printf("%s: Bad height: %i\n", __func__, value);
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: Bad height: %i\n", __func__, value);
         }
         break;
 
     case SVGA_REG_BITS_PER_PIXEL:
         if (value != 32) {
-            printf("%s: Bad bits per pixel: %i bits\n", __func__, value);
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: Bad bits per pixel: %i bits\n", __func__, value);
             s->config = 0;
             s->invalidated = 1;
         }
@@ -1082,7 +1087,8 @@ static void vmsvga_value_write(void *opaque, uint32_t address, uint32_t value)
             s->scratch[s->index - SVGA_SCRATCH_BASE] = value;
             break;
         }
-        printf("%s: Bad register %02x\n", __func__, s->index);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Bad register %02x\n", __func__, s->index);
     }
 }
 
-- 
2.18.4



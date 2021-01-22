Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71492300A2D
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 18:51:37 +0100 (CET)
Received: from localhost ([::1]:49290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l30au-0005fw-Gb
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 12:51:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l30YX-0003ZV-BN
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 12:49:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l30YV-0004iK-4N
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 12:49:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611337745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3cYJqJSxpRfhdfFzwRR6c0uMoYnqDQRDW/OpcLay+J4=;
 b=MpONTscnKaYo+8beHM/9sQj43ShPEoATtG8XRdPsr/+qmURYP+v4+vFWuWswIaqZmInEPh
 4eGdBM24Nz1keO7z3vqRh+UMO32Xsxq7EjBsBwMADqOSY04fnxxA2yW/Pn74UHvr/6hycr
 zOeEOcdaeyWLxHxFOugzorJylpWQmts=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-9HB-n-beP0GBOdq-vfxBQg-1; Fri, 22 Jan 2021 12:49:01 -0500
X-MC-Unique: 9HB-n-beP0GBOdq-vfxBQg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B50C7802B40;
 Fri, 22 Jan 2021 17:48:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AE2E2BFE9;
 Fri, 22 Jan 2021 17:48:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 42B73180062C; Fri, 22 Jan 2021 18:48:50 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/8] hw/usb/dev-uas: Report command additional adb length as
 unsupported
Date: Fri, 22 Jan 2021 18:48:47 +0100
Message-Id: <20210122174849.3936119-7-kraxel@redhat.com>
In-Reply-To: <20210122174849.3936119-1-kraxel@redhat.com>
References: <20210122174849.3936119-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Ed Maste <emaste@FreeBSD.org>,
 qemu-block@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Daniele Buono <dbuono@linux.vnet.ibm.com>, Han Han <hhan@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

We are not ready to handle additional CDB data.

If a guest sends a packet with such additional data,
report the command parameter as not supported.

Specify a size (of 1 byte) for the add_cdb member we
are not using, to fix the following warning:

  usb/dev-uas.c:157:31: error: field 'status' with variable sized type 'uas_iu' not at the end of a struct or class is a GNU extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
      uas_iu                    status;
                                ^

Reported-by: Ed Maste <emaste@FreeBSD.org>
Reported-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
Reported-by: Han Han <hhan@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210120153522.1173897-4-philmd@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/dev-uas.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/usb/dev-uas.c b/hw/usb/dev-uas.c
index cec071d96c49..a51402bc0bfd 100644
--- a/hw/usb/dev-uas.c
+++ b/hw/usb/dev-uas.c
@@ -16,6 +16,7 @@
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
+#include "qemu/log.h"
 
 #include "hw/usb.h"
 #include "migration/vmstate.h"
@@ -70,7 +71,7 @@ typedef struct {
     uint8_t    reserved_2;
     uint64_t   lun;
     uint8_t    cdb[16];
-    uint8_t    add_cdb[];
+    uint8_t    add_cdb[1];      /* not supported by QEMU */
 } QEMU_PACKED  uas_iu_command;
 
 typedef struct {
@@ -700,6 +701,11 @@ static void usb_uas_command(UASDevice *uas, uas_iu *iu)
     uint32_t len;
     uint16_t tag = be16_to_cpu(iu->hdr.tag);
 
+    if (iu->command.add_cdb_length > 0) {
+        qemu_log_mask(LOG_UNIMP, "additional adb length not yet supported\n");
+        goto unsupported_len;
+    }
+
     if (uas_using_streams(uas) && tag > UAS_MAX_STREAMS) {
         goto invalid_tag;
     }
@@ -735,6 +741,10 @@ static void usb_uas_command(UASDevice *uas, uas_iu *iu)
     }
     return;
 
+unsupported_len:
+    usb_uas_queue_fake_sense(uas, tag, sense_code_INVALID_PARAM_VALUE);
+    return;
+
 invalid_tag:
     usb_uas_queue_fake_sense(uas, tag, sense_code_INVALID_TAG);
     return;
-- 
2.29.2



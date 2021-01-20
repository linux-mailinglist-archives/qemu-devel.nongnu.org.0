Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6355F2FD482
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 16:49:20 +0100 (CET)
Received: from localhost ([::1]:36768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2FjT-0001ZE-ET
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 10:49:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2FWQ-0004MZ-5C
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:35:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2FWO-00053C-B0
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:35:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611156947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vy08SPUQILRszwUrUSWnviExWQtbBP9Rn4kirCQh3nA=;
 b=K3ZGTfrWxiOJH1skGEe2D6vnAHZc79fqg3V8Jty6PoxKn/odol7lsRk1EjCtUsIKDiEUgs
 HuElU0Ak1BVipelE3Od1ndAhUNv40346yg8YBoHdvrZ3WYLnSaDY/nvQ9zaasN8xhmUewq
 O0l0r8iFSRHqiUyVsnNe8epmJ9Aofw4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-PTqnjCaAMQ6uvCjdk0DCDw-1; Wed, 20 Jan 2021 10:35:43 -0500
X-MC-Unique: PTqnjCaAMQ6uvCjdk0DCDw-1
Received: by mail-ed1-f71.google.com with SMTP id f21so10985741edx.23
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 07:35:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vy08SPUQILRszwUrUSWnviExWQtbBP9Rn4kirCQh3nA=;
 b=Ga+ZVd8aGU+bvvH0/JOyCqOF6xRh1+3yfPQFHH9N9K08/8JY0Y/fuO8z2coTbNM0iw
 B0IAGLovvjwIX+tOWVRDc3AEClhqcFvUvS1r/9qO8UD0syAmadLzcvHj4V8nAtYgn7mY
 CymEm0GsRNtj4X5AEyadxjQb1Lot/5U4n1/KAnhIkKLJRVrV6FyOncv+mCys/sCJ2DYv
 MBtWao0HcALZheoMb9C2oCWXWNOHJxAtI1FaG8LgRT4pzcGVOqgFxPE7vTyFPZb2w2hh
 3xP+xAdDa3ultfljPT0WXrgg/Vel/+W0bRGFiuTYXqJKk1gHsxc8xSa6Steyr98HtKqx
 6qwA==
X-Gm-Message-State: AOAM532N1KY+pgwmJHyLCxWHYxvmDItCQFAdu4nmkudLQABWtuXNQwvu
 l8/Za9EW6NXhpYdQOJPK8IADwprLMMc4GPsvF/W9udHKfiGkC86AvRMR/EvUjm94+9ou23Avx8K
 TmzVUx5VQFf/M208h1X1MYojiwp4oUr0YxE2djQdc4mAyv6RsH9ysPUBEPdTZ0DuQ
X-Received: by 2002:a05:6402:1714:: with SMTP id
 y20mr7449730edu.360.1611156941694; 
 Wed, 20 Jan 2021 07:35:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw8enPAcy7hcRg7vWLAhqswghY4GH4q3U2qKOzBkcNB+KYFU91/zupqwyEmoJs/pn+sTan90Q==
X-Received: by 2002:a05:6402:1714:: with SMTP id
 y20mr7449702edu.360.1611156941492; 
 Wed, 20 Jan 2021 07:35:41 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id fi12sm1047413ejb.49.2021.01.20.07.35.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 07:35:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] hw/usb/dev-uas: Report command additional adb length
 as unsupported
Date: Wed, 20 Jan 2021 16:35:22 +0100
Message-Id: <20210120153522.1173897-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210120153522.1173897-1-philmd@redhat.com>
References: <20210120153522.1173897-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Ed Maste <emaste@FreeBSD.org>,
 qemu-block@nongnu.org, "Gustavo A . R . Silva" <gustavo@embeddedor.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Daniele Buono <dbuono@linux.vnet.ibm.com>, Han Han <hhan@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Gustavo A. R. Silva <gustavo@embeddedor.com>

v2: include Eric feedbacks
---
 hw/usb/dev-uas.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/usb/dev-uas.c b/hw/usb/dev-uas.c
index cec071d96c4..a51402bc0bf 100644
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
2.26.2



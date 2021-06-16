Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8423AA5B4
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 22:54:38 +0200 (CEST)
Received: from localhost ([::1]:58442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltcYX-0005o9-3J
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 16:54:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltcON-0001e3-W0
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:44:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltcOL-0000gc-6K
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:44:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623876244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y+XSms8lsmaWxWcSMyaabFLhR1SIAMwTYvlPcGQF/+0=;
 b=fuxmPK5qC5TDEp0P53krkpx0sYi+CJeCr114ZVm63mzqgNHv+hW650sjNXzwUx2SxTwiLw
 rOpJQImfAsAseAwQZ7CgI+mANJC1GjOy/P4i/IlacjwE7GCf0nmtJnXLwld3GzRgqrygRc
 ZQbC4R5l16qWb1PvOYisT6P7Nzuhj2g=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-6ANMH-XCMMOksGMotS7Mjw-1; Wed, 16 Jun 2021 16:43:56 -0400
X-MC-Unique: 6ANMH-XCMMOksGMotS7Mjw-1
Received: by mail-wm1-f71.google.com with SMTP id
 n21-20020a7bcbd50000b02901a2ee0826aeso1732499wmi.7
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 13:43:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y+XSms8lsmaWxWcSMyaabFLhR1SIAMwTYvlPcGQF/+0=;
 b=Qp+H2vsWpvvxGqozA7gDKz5HMrm8VtELd4YEfuglnRVCCEAd47UNumaYkVGNmwR/c6
 T3a8dPue5glSSrl5sCmJrF+EbD2F4jQrJr0pv3iMYfFao+nKL1+VTdEqAgUVcOdBltAS
 gGzUmPYVk4bQD5aqhRkFjVR3THd2HP69qTUlCCjXkkn2xnd6eME2xZDF279YbStwaNq8
 JTZU9ckF0s+vChmvLZQ1AOrviCrN8OwIsMVZOTld05LCchfc2/UdIkBwJI5s98yJ/pJe
 iBKWnwp7mt3VQBukU5qB3Pxili2FC/DV2PuL/fyZ04y/T13Zwi7gXHhCEKJpliriG5im
 1/qg==
X-Gm-Message-State: AOAM532zF3oAaYadioGPVODsranJ8XC4VNM6SYb66U5Kkvo6dlHcLKkI
 E3KCD3q0QUr9ksv7vHGJbyaFqsiL9X+Vu7d+wuyv1QvcBNU4YCzfoVxUHp8RyLwrD2esDKVDGJK
 2Z/dveY7NiPDH4XVyvVVdm46qs2qiWNOIutP+3MyiDEiHJPZbHmCA9Nhlx2caKZdP
X-Received: by 2002:adf:d227:: with SMTP id k7mr1128724wrh.271.1623876235263; 
 Wed, 16 Jun 2021 13:43:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCFjv4rL99lSTphSmutBg0e/eHY24V0R7vvtUv4PPiA85ngHRUEZlvcC1MGBknBDMOlyPo3A==
X-Received: by 2002:adf:d227:: with SMTP id k7mr1128695wrh.271.1623876235124; 
 Wed, 16 Jun 2021 13:43:55 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id k11sm5887058wmj.1.2021.06.16.13.43.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 13:43:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/23] target/i386/monitor: Return QMP error when SEV is
 disabled in build
Date: Wed, 16 Jun 2021 22:43:09 +0200
Message-Id: <20210616204328.2611406-5-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616204328.2611406-1-philmd@redhat.com>
References: <20210616204328.2611406-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Laszlo Ersek <lersek@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the management layer tries to inject a secret, it gets an empty
response in case the binary built without SEV:

  { "execute": "sev-inject-launch-secret",
    "arguments": { "packet-header": "mypkt", "secret": "mypass", "gpa": 4294959104 }
  }
  {
      "return": {
      }
  }

Make it clearer by returning an error, mentioning the feature is
disabled:

  { "execute": "sev-inject-launch-secret",
    "arguments": { "packet-header": "mypkt", "secret": "mypass", "gpa": 4294959104 }
  }
  {
      "error": {
          "class": "GenericError",
          "desc": "this feature or command is not currently supported"
      }
  }

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/monitor.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 119211f0b06..c83cca80dc2 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -28,6 +28,7 @@
 #include "monitor/hmp-target.h"
 #include "monitor/hmp.h"
 #include "qapi/qmp/qdict.h"
+#include "qapi/qmp/qerror.h"
 #include "sysemu/kvm.h"
 #include "sysemu/sev.h"
 #include "qapi/error.h"
@@ -742,6 +743,10 @@ void qmp_sev_inject_launch_secret(const char *packet_hdr,
                                   bool has_gpa, uint64_t gpa,
                                   Error **errp)
 {
+    if (!sev_enabled()) {
+        error_setg(errp, QERR_UNSUPPORTED);
+        return;
+    }
     if (!has_gpa) {
         uint8_t *data;
         struct sev_secret_area *area;
-- 
2.31.1



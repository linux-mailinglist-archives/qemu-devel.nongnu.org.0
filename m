Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7E34CD622
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:16:00 +0100 (CET)
Received: from localhost ([::1]:55252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ8it-0002OP-Ne
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:15:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8A9-0002Vp-0T
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:40:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8A7-0000g5-5w
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:40:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646401202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hG63fk2e7vwNR105jMKcH2PAlFDWHa3moRydXJnnvuY=;
 b=d8tx+L4NO8LKo0BcRuIVJQy58ONptNscFPaBW+dAoS8MJ6itSwcXkFSDVV1vaT3ilPBliY
 J7hWDOLaCrgAGKo/qZmghxitcWIfDmzeYax+dB4wC8IK+bjidzUKKI8VrqURW6dG5MFLl9
 tMFPVh0siWfh6YCBgUG+yk1nUI83/3k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-400-k9hmETqkNHOziMM8upNzqw-1; Fri, 04 Mar 2022 08:40:01 -0500
X-MC-Unique: k9hmETqkNHOziMM8upNzqw-1
Received: by mail-wm1-f70.google.com with SMTP id
 l13-20020a7bcf0d000000b0038982c6bf8fso405124wmg.7
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 05:40:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=hG63fk2e7vwNR105jMKcH2PAlFDWHa3moRydXJnnvuY=;
 b=5U+nwkOY0MLNSgQFmriB0z0Sn0eWiGM8fdLT1B5lTFMtDwR3oalP3D5EsFUtEzcd4z
 NaZWf8rBuTlXGXA0HJvjMV+hElKTfAdcR1V8I0SWIXd4cJnTYns8E9piPPCUp4HSakGd
 Wn2W39kw2qoJXzY1RbC5AuyHQ1StmjmLS3jZErwKHgayGilUtzqGL9YcFuY//4a+g1JW
 vKTvovUnAy/Sh88N0jK6lbs5WbcGH+LcbzUUEfOpRzoRC/TROZP5iwpaETTxoIoFcb6Q
 7hKEzqUw53wvFeSyErT8DPV59DLLN/EWebhJMt/wi53cv33o7xalTswMrFA+hvmnQodE
 i0BQ==
X-Gm-Message-State: AOAM530wae6TqcVQcA3VbW4E64OzuK7MUN3aaMvqDwqps72a+aHV2Mel
 qpZRakQ9ZBRCweN9ERvWp9eX5Fx7RYOaAFxCBmXcXFa1ZpD6sbJ50KLXuju0rqa6wAx2+ZgpkGB
 H/I8nQy5iMX24hq066VIVVllzaEAiJ6o3A67gnbPrnwrQ79dAM8KZ2/SlYrsh
X-Received: by 2002:adf:912f:0:b0:1e3:909:a6b6 with SMTP id
 j44-20020adf912f000000b001e30909a6b6mr30349935wrj.684.1646401200166; 
 Fri, 04 Mar 2022 05:40:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyUWSSliWsH8On+30xQK9D8r/wwZAQRYIfiYL9qIUzA5vdcDSl2upQv4yV3osq0VqfFQxZVsw==
X-Received: by 2002:adf:912f:0:b0:1e3:909:a6b6 with SMTP id
 j44-20020adf912f000000b001e30909a6b6mr30349906wrj.684.1646401199835; 
 Fri, 04 Mar 2022 05:39:59 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 r20-20020adfa154000000b001f0326a23e1sm4584138wrr.88.2022.03.04.05.39.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 05:39:57 -0800 (PST)
Date: Fri, 4 Mar 2022 08:39:54 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/45] hw/i386: Improve bounds checking in OVMF table parsing
Message-ID: <20220304133556.233983-21-mst@redhat.com>
References: <20220304133556.233983-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220304133556.233983-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Dov Murik <dovmurik@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dov Murik <dovmurik@linux.ibm.com>

When pc_system_parse_ovmf_flash() parses the optional GUIDed table in
the end of the OVMF flash memory area, the table length field is checked
for sizes that are too small, but doesn't error on sizes that are too
big (bigger than the flash content itself).

Add a check for maximal size of the OVMF table, and add an error report
in case the size is invalid.  In such a case, an error like this will be
displayed during launch:

    qemu-system-x86_64: OVMF table has invalid size 4047

and the table parsing is skipped.

Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
Message-Id: <20220222071906.2632426-2-dovmurik@linux.ibm.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 hw/i386/pc_sysfw_ovmf.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc_sysfw_ovmf.c b/hw/i386/pc_sysfw_ovmf.c
index f4dd92c588..df15c9737b 100644
--- a/hw/i386/pc_sysfw_ovmf.c
+++ b/hw/i386/pc_sysfw_ovmf.c
@@ -24,6 +24,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "hw/i386/pc.h"
 #include "cpu.h"
 
@@ -66,7 +67,13 @@ void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size)
     ptr -= sizeof(uint16_t);
     tot_len = le16_to_cpu(*(uint16_t *)ptr) - sizeof(guid) - sizeof(uint16_t);
 
-    if (tot_len <= 0) {
+    if (tot_len < 0 || tot_len > (ptr - flash_ptr)) {
+        error_report("OVMF table has invalid size %d", tot_len);
+        return;
+    }
+
+    if (tot_len == 0) {
+        /* no entries in the OVMF table */
         return;
     }
 
-- 
MST



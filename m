Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D49954CFA74
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:17:18 +0100 (CET)
Received: from localhost ([::1]:60052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRAQW-0001QW-GZ
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:17:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRAC1-0000dV-D2
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:02:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRABz-0002in-OI
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:02:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646647335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hG63fk2e7vwNR105jMKcH2PAlFDWHa3moRydXJnnvuY=;
 b=J1aEWKft+Megn95gk2jxc6SeIP+eXqh/0jBvPFtHTwkDYuUQt6Rlj4OaxcLsjVURNo1Pr0
 cL7FY/to5jHOJULWxQgjsYVriL+9HdCh1IHaN05f18UVAnED0dLTVkN8fRK1TGujhRzMh1
 7+QR2hChUtphu3fZGXfBBKGB7DIIusc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-XIH1NRjFO5iW-VQJM7azsA-1; Mon, 07 Mar 2022 05:02:14 -0500
X-MC-Unique: XIH1NRjFO5iW-VQJM7azsA-1
Received: by mail-ej1-f71.google.com with SMTP id
 r18-20020a17090609d200b006a6e943d09eso6720851eje.20
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:02:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=hG63fk2e7vwNR105jMKcH2PAlFDWHa3moRydXJnnvuY=;
 b=798Au8A8ThzC2EEz9jmQ2ppBTKo9q48JcOPRx989fa+2BEmF7oCkm5hbT9NyICnpfu
 8yzTzXl1XphOEv1ED+6H8JxORUD/V1E28OIQOuyfZZg4DOXD+VvAxFBTnAOUdbY8Cuse
 xWNkbF/B3bi1aEuYrN/AuiJGQRjjIhYLBsIXIoGSwmjIdhxPuBeb+XkfmK5CKNBhbx0J
 1tKWhPEMfhn8w2qoYpnwHFolJTWCwgsyqWORfCkDUtI4d4t8BPDwOPnHdN9TsCcp4uxP
 29A76AxHTMvyYVCYduroxNf5BWYAZPDKeuk1vilXWPKyrJIRxA3UgGWdbfOLn78b8DFh
 E15g==
X-Gm-Message-State: AOAM530sWBFFH3QIIFffzPBbu+JWUjkVa8gQrDg9YBs+g2HXfUnSsyAP
 yBBNn6/qyYE4T7pxD+hB7EUBRmuxtxfUNT2tIn+feP53fRWmqsFVDV0o7xNS0ptZ4W8VX2Nrz3X
 Sk+6Ko5iTfC0l8/DWXNZlcY32unyyB4rTctpVQ1i83JM5T7Ut07cRz5K6HbOv
X-Received: by 2002:a17:906:18b2:b0:6d0:ee54:1add with SMTP id
 c18-20020a17090618b200b006d0ee541addmr8489607ejf.499.1646647332445; 
 Mon, 07 Mar 2022 02:02:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwD352Zlh1g3fU5ES686TgbT2PT1ZWrTE6EmIhj1uw0EOmgqGn30dq/fXC8MZ4ZoWpDZJ2v3A==
X-Received: by 2002:a17:906:18b2:b0:6d0:ee54:1add with SMTP id
 c18-20020a17090618b200b006d0ee541addmr8489581ejf.499.1646647332219; 
 Mon, 07 Mar 2022 02:02:12 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 l20-20020a1709066b9400b006dabdbc8350sm3287698ejr.30.2022.03.07.02.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 02:02:11 -0800 (PST)
Date: Mon, 7 Mar 2022 05:02:08 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 16/47] hw/i386: Improve bounds checking in OVMF table parsing
Message-ID: <20220307100058.449628-17-mst@redhat.com>
References: <20220307100058.449628-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307100058.449628-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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



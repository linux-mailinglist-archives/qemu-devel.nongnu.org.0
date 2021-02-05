Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0DD310CE6
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 16:06:41 +0100 (CET)
Received: from localhost ([::1]:40746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l82gy-0005Rz-Qb
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 10:06:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l82e8-0003cd-O0
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:03:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l82e4-0002sG-63
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:03:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612537419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FfnGZFBb0xSQL+nFAuB9rCSg6we82L8TI7vblfp6mQs=;
 b=GDywUW7FzdEuhyb6nkDYWTStE2bJslE//4struyu5/vuxoorgK05Ck+rlXcrzYVlmLgqIq
 nylqTlFywyZzM6uHO/6kEw4AMwexDbMLWG4SzLHEnDjHMzW/hzze9Quouv+yZIq4tWvd1T
 87z30aV2gdrvYTijq4czjuoZPyo+ocI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-rt_UxAAsMAakbv5MnbkPIg-1; Fri, 05 Feb 2021 10:03:37 -0500
X-MC-Unique: rt_UxAAsMAakbv5MnbkPIg-1
Received: by mail-ed1-f71.google.com with SMTP id i4so7132099edt.11
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 07:03:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=FfnGZFBb0xSQL+nFAuB9rCSg6we82L8TI7vblfp6mQs=;
 b=nDJT2vQcKS23hB7HQ2rbTDbRvCA3IJcUAe6piT1RufII0MLyow1emKvyhbJSMX+xaV
 G5CculSCNWOXqZcnuzN5lJMidAJ2ZJLCNzYDol3CL8zAlzESl78UUyKd99Kb14X3QH8I
 8f79Co2+Jeiodc2cszgOfMhMkEnxX9jdB4Zm/jFventpnDzcCywo7bIrpa5kfXUI3QZT
 hoF5Iq4QZaed1ZAkD9UiUUr8x3BwVd6O/662E7G+VSEKFAY13E7fLYYOfsOCKybk+P9r
 rSMYhCz5yLPlEplnxvln9igq7KYuciqXOM1F59Ddldv+BwHu7jWSaGPAeYYl88pNspoF
 w3eA==
X-Gm-Message-State: AOAM533m3S+8Uugny+0M3LwkKIj5cjNT+WPA39Gb+iNsQ8jmzA4jW8LU
 lYTekDuH9K4MQTs1Vx4D+lhMPhnfM9ekC8GFtAiryZodjrzwIidn/QFYW/HiC12GVgW117y6sgJ
 r+h3NF0DXs2S4hxbUhs0uLZ39OF1SaO0y94COQh12bOeagUyKmokgVQqgasQY
X-Received: by 2002:a17:907:35d1:: with SMTP id
 ap17mr4595668ejc.79.1612537415508; 
 Fri, 05 Feb 2021 07:03:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw9ahgxlqK9JSEGFDwdUy7pn7FaRJeAzB2PwKX9dkYHG9H0imIJ5Fzqw3bNREQfSli75J57oQ==
X-Received: by 2002:a17:907:35d1:: with SMTP id
 ap17mr4595529ejc.79.1612537414197; 
 Fri, 05 Feb 2021 07:03:34 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id h3sm3288744ejl.111.2021.02.05.07.03.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 07:03:33 -0800 (PST)
Date: Fri, 5 Feb 2021 10:03:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 01/16] pci: reject too large ROMs
Message-ID: <20210205150135.94643-2-mst@redhat.com>
References: <20210205150135.94643-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210205150135.94643-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Laszlo Ersek <lersek@redhat.com>,
 Peter Xu <peterx@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

get_image_size() returns an int64_t, which pci_add_option_rom() assigns
to an "int" without any range checking.  A 32-bit BAR could be up to
2 GiB in size, so reject anything above it.  In order to accomodate
a rounded-up size of 2 GiB, change pci_patch_ids's size argument
to unsigned.

Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210203131828.156467-2-pbonzini@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: David Edmondson <david.edmondson@oracle.com>
---
 hw/pci/pci.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 512e9042ff..58560c044d 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -25,6 +25,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu/datadir.h"
+#include "qemu/units.h"
 #include "hw/irq.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bridge.h"
@@ -2234,7 +2235,7 @@ static uint8_t pci_find_capability_at_offset(PCIDevice *pdev, uint8_t offset)
 
 /* Patch the PCI vendor and device ids in a PCI rom image if necessary.
    This is needed for an option rom which is used for more than one device. */
-static void pci_patch_ids(PCIDevice *pdev, uint8_t *ptr, int size)
+static void pci_patch_ids(PCIDevice *pdev, uint8_t *ptr, uint32_t size)
 {
     uint16_t vendor_id;
     uint16_t device_id;
@@ -2292,7 +2293,7 @@ static void pci_patch_ids(PCIDevice *pdev, uint8_t *ptr, int size)
 static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
                                Error **errp)
 {
-    int size;
+    int64_t size;
     char *path;
     void *ptr;
     char name[32];
@@ -2342,6 +2343,11 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
         error_setg(errp, "romfile \"%s\" is empty", pdev->romfile);
         g_free(path);
         return;
+    } else if (size > 2 * GiB) {
+        error_setg(errp, "romfile \"%s\" too large (size cannot exceed 2 GiB)",
+                   pdev->romfile);
+        g_free(path);
+        return;
     }
     size = pow2ceil(size);
 
-- 
MST



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD60954610D
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 11:10:07 +0200 (CEST)
Received: from localhost ([::1]:53916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzaec-000082-E4
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 05:10:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZYI-0002Hn-52
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:59:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZYG-0006Rh-Bc
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:59:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654847967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6LDOtJkS4XX2TuIYogbWgSBSiVmv/tgrANZtHtjvS2E=;
 b=bzn3RpgqjCBfZW0v/z5E3RYywU7mVkef8ErZgd58ekwgMBQJhskkeTs9yhjHj7RvXMGzoj
 IeBLoUIqB1HldKPxdyY2EDgC6gzu92okW3NtdGgxwGukxeJHapEXyKdT89To/dbBKEpi64
 q/hKyOTHq+iJwOsrrmWv5EF+lMnUYBQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-130-wjZhrPE4P0yB7IZXLpXvRA-1; Fri, 10 Jun 2022 03:59:26 -0400
X-MC-Unique: wjZhrPE4P0yB7IZXLpXvRA-1
Received: by mail-wm1-f70.google.com with SMTP id
 c187-20020a1c35c4000000b003970013833aso9329946wma.1
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 00:59:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=6LDOtJkS4XX2TuIYogbWgSBSiVmv/tgrANZtHtjvS2E=;
 b=Oid9ArJMkCdzPmujn+4Hc1nQE7+qnKDkBYbpKKA2AdgTOWFTNOufJWqTcVeggkgZXJ
 awqI/B+5ahCQq9zAZiMBKopi1pVfdypJ40JLx58We00UjYU7SRcDvQvq1u7Z5oDzNIXw
 rPhFsrLqQ8XaOhfVw+oGKwLozYhXzzPezpLbO4QrPADDdJ8RyjJfNk8+znqBi5gMQzC4
 lbcJfclzJzTOsvJbkOpnLOP3nBQW4Q8gKPSARtx3iCsw9Bge6TdclqWrpuGx9LvIuUdd
 2SfQAYpWJgN2pSPlVE1MXe0LgG72QQShcKgNo/vvycg5+jlHDJEO/5mNVMtbaQvJwAmC
 8XzQ==
X-Gm-Message-State: AOAM531NmgkqVpBZTCT4DFi0RUuqu5UOWes5B8mXcttzYbHxmA58cqul
 FXRUirS0NuuayYp9aeDiXJAFWOR8Bixyg62vo7IGrQLgKnt+bZqlRfYkI9vrSBj7YdOdZV6Cnvu
 LMcK8Z3OYRIc6Nvr+UWImlt97b0m1yMYf/dk83i7yyT3mS5WLFqIr7QFyTaYA
X-Received: by 2002:a05:6000:18ae:b0:211:40df:c00e with SMTP id
 b14-20020a05600018ae00b0021140dfc00emr42749176wri.304.1654847965291; 
 Fri, 10 Jun 2022 00:59:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuCDCo9sZUxu3g33+JpvuDQkcddWPUel6s+fT2JBLSd/0JpvYjYboDnRVbIUJc1u0D3C0fXA==
X-Received: by 2002:a05:6000:18ae:b0:211:40df:c00e with SMTP id
 b14-20020a05600018ae00b0021140dfc00emr42749151wri.304.1654847965000; 
 Fri, 10 Jun 2022 00:59:25 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 q18-20020a5d61d2000000b0020d0c9c95d3sm23591446wrv.77.2022.06.10.00.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:59:24 -0700 (PDT)
Date: Fri, 10 Jun 2022 03:59:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Ani Sinha <ani@anisinha.ca>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PULL 47/54] hw/acpi/viot: move the individual PCI host bridge entry
 generation to a new function
Message-ID: <20220610075631.367501-48-mst@redhat.com>
References: <20220610075631.367501-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220610075631.367501-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Instead of generating each table entry inline, move the individual PCI host bridge
table entry generation to a separate build_pci_host_range() function.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220525173232.31429-3-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/viot.c | 48 +++++++++++++++++++++++++++---------------------
 1 file changed, 27 insertions(+), 21 deletions(-)

diff --git a/hw/acpi/viot.c b/hw/acpi/viot.c
index a41daded71..5dafcbf5ef 100644
--- a/hw/acpi/viot.c
+++ b/hw/acpi/viot.c
@@ -16,6 +16,31 @@ struct viot_pci_ranges {
     uint16_t output_node;
 };
 
+static void build_pci_host_range(GArray *table_data, int min_bus, int max_bus,
+                                 uint16_t output_node)
+{
+    /* Type */
+    build_append_int_noprefix(table_data, 1 /* PCI range */, 1);
+    /* Reserved */
+    build_append_int_noprefix(table_data, 0, 1);
+    /* Length */
+    build_append_int_noprefix(table_data, 24, 2);
+    /* Endpoint start */
+    build_append_int_noprefix(table_data, PCI_BUILD_BDF(min_bus, 0), 4);
+    /* PCI Segment start */
+    build_append_int_noprefix(table_data, 0, 2);
+    /* PCI Segment end */
+    build_append_int_noprefix(table_data, 0, 2);
+    /* PCI BDF start */
+    build_append_int_noprefix(table_data, PCI_BUILD_BDF(min_bus, 0), 2);
+    /* PCI BDF end */
+    build_append_int_noprefix(table_data, PCI_BUILD_BDF(max_bus, 0xff), 2);
+    /* Output node */
+    build_append_int_noprefix(table_data, output_node, 2);
+    /* Reserved */
+    build_append_int_noprefix(table_data, 0, 6);
+}
+
 /* Build PCI range for a given PCI host bridge */
 static int enumerate_pci_host_bridges(Object *obj, void *opaque)
 {
@@ -30,27 +55,8 @@ static int enumerate_pci_host_bridges(Object *obj, void *opaque)
 
             pci_bus_range(bus, &min_bus, &max_bus);
 
-            /* Type */
-            build_append_int_noprefix(blob, 1 /* PCI range */, 1);
-            /* Reserved */
-            build_append_int_noprefix(blob, 0, 1);
-            /* Length */
-            build_append_int_noprefix(blob, 24, 2);
-            /* Endpoint start */
-            build_append_int_noprefix(blob, PCI_BUILD_BDF(min_bus, 0), 4);
-            /* PCI Segment start */
-            build_append_int_noprefix(blob, 0, 2);
-            /* PCI Segment end */
-            build_append_int_noprefix(blob, 0, 2);
-            /* PCI BDF start */
-            build_append_int_noprefix(blob, PCI_BUILD_BDF(min_bus, 0), 2);
-            /* PCI BDF end */
-            build_append_int_noprefix(blob, PCI_BUILD_BDF(max_bus, 0xff), 2);
-            /* Output node */
-            build_append_int_noprefix(blob, pci_ranges->output_node, 2);
-            /* Reserved */
-            build_append_int_noprefix(blob, 0, 6);
-
+            build_pci_host_range(blob, min_bus, max_bus,
+                                 pci_ranges->output_node);
             pci_ranges->count++;
         }
     }
-- 
MST



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15573422E95
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 18:58:07 +0200 (CEST)
Received: from localhost ([::1]:59948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXnlW-00038O-40
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 12:58:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmwC-0002Tp-AX
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:05:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmwA-0007oX-4d
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:05:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bY8TOa5uB6WnEZxzhG2jkPTKURYR/E+YFIiS/+Ed54w=;
 b=Yr6v+6aARTHh22v4RWVOn5dSO13nJ/2EJSvn2t9dFCRPLqL9qv7P3ouls34Cgnj2woHIs+
 kLo4rhz2YGO/joq1i2LnLFye66PuFVBQwd/XU0TT70LXf7OEWwUe7AlK5kpKEvfaUV0TXI
 0bbROPkCsWJH48f7dZYfY+EgRaF5fic=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-fbcEgVYEOfOC9HENTO0eBg-1; Tue, 05 Oct 2021 12:05:00 -0400
X-MC-Unique: fbcEgVYEOfOC9HENTO0eBg-1
Received: by mail-wm1-f72.google.com with SMTP id
 x23-20020a05600c21d700b0030d23749278so1505281wmj.2
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:04:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=bY8TOa5uB6WnEZxzhG2jkPTKURYR/E+YFIiS/+Ed54w=;
 b=x0BJXaJ2pKGkMg81bLapVpNOsb4WC+HSa/aa4OkEU8/Z+O5fL0HC1w3Pb3I0YPOcZu
 hDysOpWccqfIWatbr26pqYqfWzSIleF52NCZpDQ9AN3yBG+y9G00axxK60D8m5J2TzPy
 Jp2EsrBTjaeuC3UXcMdLZyVCXvMd2gkhy+EDhDDA6swBNTJSMcgQhn85E66+C5kci8bJ
 DqaxsWme4WCZ9GQTFmcDgw0RDw6o686FSuFtalU0MthxEzqAPR1H9RLS7ucoNxwvE+/f
 gRCYV/0dmbEgOeOxBKVvPiRTtk+DRJ5QG21fDmxKzaKXfGtDlH6GFFdiu9Ee19sUDdXV
 /Rtw==
X-Gm-Message-State: AOAM531rnQnqle6M650ikSCdLBz9U6+bJ4zU7tagsnqkLzHNgOhHIOOC
 ZAUDUGJX6WmWM1DDupiHsbyqCK2e9P8EjA0rw563uiC1EudwTyP0/OHPo3v/sjKErReYspujDuM
 hxNJlN+dpF5aMZVCW0RfdIwt3VXqYaurNICLVQqpdvklLxu40QosQ2NkBYX1x
X-Received: by 2002:a05:6000:1864:: with SMTP id
 d4mr9588350wri.345.1633449898448; 
 Tue, 05 Oct 2021 09:04:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTZJkQycmqfISX97OEkTZ3TjKblo/yOV0QasL4fD6jJMgA1MgG/gUi6xdLtlwWWOAH3eiRsg==
X-Received: by 2002:a05:6000:1864:: with SMTP id
 d4mr9588311wri.345.1633449898181; 
 Tue, 05 Oct 2021 09:04:58 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id 2sm2275726wmf.30.2021.10.05.09.04.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:04:57 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:04:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 57/57] hw/i386/amd_iommu: Add description/category to
 TYPE_AMD_IOMMU_PCI
Message-ID: <20211005155946.513818-58-mst@redhat.com>
References: <20211005155946.513818-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005155946.513818-1-mst@redhat.com>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

TYPE_AMD_IOMMU_PCI is user-creatable but not well described.
Implement its class_init() handler to add it to the 'Misc
devices' category, and add a description.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210926175648.1649075-4-f4bug@amsat.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/amd_iommu.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index 9014690ba3..9242a0d3ed 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -1621,10 +1621,19 @@ static const TypeInfo amdvi_sysbus = {
     .class_init = amdvi_sysbus_class_init
 };
 
+static void amdvi_pci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    dc->desc = "AMD IOMMU (AMD-Vi) DMA Remapping device";
+}
+
 static const TypeInfo amdvi_pci = {
     .name = TYPE_AMD_IOMMU_PCI,
     .parent = TYPE_PCI_DEVICE,
     .instance_size = sizeof(AMDVIPCIState),
+    .class_init = amdvi_pci_class_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
         { },
-- 
MST



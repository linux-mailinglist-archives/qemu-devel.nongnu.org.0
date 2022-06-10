Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9152B5460BC
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 11:03:15 +0200 (CEST)
Received: from localhost ([::1]:45188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzaXx-00025S-8d
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 05:03:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZYF-0002EI-2F
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:59:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZYD-0006RN-G5
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:59:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654847964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vY1xzJIzfEFTPvZ1LeJ5oBkWj4oB2geqzTQvd5MgtyA=;
 b=guejeZ2GF+WJsYslNQimioUyyCGuxix0gTWxzfFs2S+qx++vdnBUFQk4Hcab0CFpG+dYSQ
 zDe4sW8ApF2qYfjHMUhiIVMa4e1DFilMJSVVF8Bdz3Y0exOzYuh5efxWMulmjspG4PvyRH
 +52iFeH9vPkZR9dp/Vu/LoUQJMi650I=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-kGOw-HiFO1uFQumqw9FeKw-1; Fri, 10 Jun 2022 03:59:23 -0400
X-MC-Unique: kGOw-HiFO1uFQumqw9FeKw-1
Received: by mail-wm1-f72.google.com with SMTP id
 bi22-20020a05600c3d9600b0039c4144992cso957868wmb.5
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 00:59:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=vY1xzJIzfEFTPvZ1LeJ5oBkWj4oB2geqzTQvd5MgtyA=;
 b=ls5An+V+oIIM+Z1UeHNNET4CfcK3rQ6qg89Dl1ecUccUZ8uUxcAmL9OIs2GWivhhD1
 DkfbStEI8CJ0Ar+rBq1JXy8zsE7Ljyp6IgAtJY1xrstPSeAAoAJAVTC47a8W2V52OlML
 eVi5yFTA1H7Lvj0BdzEeJsBy7BitaldD22D8bnZq+Oakg1x8roYvXmKsObfwtjZde0Nw
 5fOBu+AqH+7S7sqZWjPo3NoXaPnlq4DtW+Trfk1ZackUyhpHqbJGAv1gHAIkGltuxRsq
 FVbW+V6H0Yoop4D0M8+jTReIcXH8YD/dKpdAcR8lNqor3D74vcTXPNOSJ8/bDVOrnmPw
 JjdQ==
X-Gm-Message-State: AOAM530EzJ4/0C/lV5BDqxbHGz+cbRj26m4Ey31Z9XURrQsxUGGkoxor
 4YmPusOgQdu2s0ViuSKk3qGZYE+xExzUpIFoJLwmB6zFDeBFibZD20IkDyfCnUPkTxyjlPr2ja1
 If4Xz2Sy6BLsyNsK/FmzbgZRlJ2QVxWpk21px2St91suzoiNS9V3HoTXYbowP
X-Received: by 2002:a5d:48c1:0:b0:20c:52e9:6c5b with SMTP id
 p1-20020a5d48c1000000b0020c52e96c5bmr41179798wrs.233.1654847962170; 
 Fri, 10 Jun 2022 00:59:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyI+bfKtMfNYjPmrar1RUjQATmQM0dzOeCqUk4qqcyEVr4e66H9lzsAVL4NW+8qbaBditF4zA==
X-Received: by 2002:a5d:48c1:0:b0:20c:52e9:6c5b with SMTP id
 p1-20020a5d48c1000000b0020c52e96c5bmr41179780wrs.233.1654847961928; 
 Fri, 10 Jun 2022 00:59:21 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 c2-20020adffb42000000b00210326c4a90sm26901706wrs.49.2022.06.10.00.59.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:59:21 -0700 (PDT)
Date: Fri, 10 Jun 2022 03:59:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Ani Sinha <ani@anisinha.ca>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PULL 46/54] hw/acpi/viot: rename build_pci_range_node() to
 enumerate_pci_host_bridges()
Message-ID: <20220610075631.367501-47-mst@redhat.com>
References: <20220610075631.367501-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220610075631.367501-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

This is in preparation for separating out the VIOT ACPI table build from the
PCI host bridge numeration.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220525173232.31429-2-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/viot.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/acpi/viot.c b/hw/acpi/viot.c
index c1af75206e..a41daded71 100644
--- a/hw/acpi/viot.c
+++ b/hw/acpi/viot.c
@@ -17,7 +17,7 @@ struct viot_pci_ranges {
 };
 
 /* Build PCI range for a given PCI host bridge */
-static int build_pci_range_node(Object *obj, void *opaque)
+static int enumerate_pci_host_bridges(Object *obj, void *opaque)
 {
     struct viot_pci_ranges *pci_ranges = opaque;
     GArray *blob = pci_ranges->blob;
@@ -78,7 +78,7 @@ void build_viot(MachineState *ms, GArray *table_data, BIOSLinker *linker,
     };
 
     /* Build the list of PCI ranges that this viommu manages */
-    object_child_foreach_recursive(OBJECT(ms), build_pci_range_node,
+    object_child_foreach_recursive(OBJECT(ms), enumerate_pci_host_bridges,
                                    &pci_ranges);
 
     /* ACPI table header */
-- 
MST



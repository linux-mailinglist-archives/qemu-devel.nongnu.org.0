Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D82CB546265
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 11:31:30 +0200 (CEST)
Received: from localhost ([::1]:42858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzazJ-0004vc-NE
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 05:31:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZYQ-0002VA-A8
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:59:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZYO-0006Sl-PN
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:59:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654847976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q+gvoPMx9QM9laYWT5x2L/E8Zn2RWI6teIf6Ya2cnjM=;
 b=gJaZ3XtBBzzwxvodxEvHDKUbtjz6BaOwqq+GQ3Arbhl08oWFjIPuE+54zyWDdwZi+uQSRa
 XPAaooXiWoZtXV58JXX8mERwH6wXTflTgS+lzlBT4bH/pkCiuWUyGCT+sQ/S+bsUxNbsFm
 sFMPjXy6o4Yvk72OpVxjO53ofx43htE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-385-2nfE6cpNNda53j7HJVdm0A-1; Fri, 10 Jun 2022 03:59:35 -0400
X-MC-Unique: 2nfE6cpNNda53j7HJVdm0A-1
Received: by mail-wr1-f71.google.com with SMTP id
 p8-20020a5d4588000000b0021033f1f79aso5968302wrq.5
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 00:59:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Q+gvoPMx9QM9laYWT5x2L/E8Zn2RWI6teIf6Ya2cnjM=;
 b=o3zEf/GItnIiPyaKQCFfUL09iOtOrumKqeP7hyLjuAE3orME6qQFiWA4aKFQP8SgNc
 EVFz6QwN0Q6TMEHX9jyiI5OKHUfoRCEn5XWj3n2raEvVYyiy/b0hFZKlE8VfuTCA9sey
 obiXY1CoO9MIPtWkf9Nu/GMYXKD8qRy7bg6WfmpaNVtuz8RqOBqr8sJzTt0d625my37p
 Mecpkpq9i+nqdciNMRnlkQ9nPRHxL4Tf3e+R3lNkOqdGmvromDqMSs8uLTXvNV/7EA2c
 bBlcW7Bwc4QCky/bpWo5OuLMWpyrikD4apGfDuQ8UpDY0AC3tgrbzGzLu8b3oUsY2cKU
 xpHA==
X-Gm-Message-State: AOAM531RtB0roXf9GAqw/JhH4iG5Xu6wGmFJDGdvAJylWjdsiL1GmZKR
 48Cz8L2YlGygFpkkVVQAobq2Bq0rMRJs5Iqt2bEvCKJh3fbMyGwwDmylkKKg8ShsWKyOkwUUhHT
 sR6euNe3YA1nVw3d2UgJGBh2RgB+qGAPPN7neUOyX7I6krpje9ksvmU9sSF4q
X-Received: by 2002:adf:efc3:0:b0:210:3544:4223 with SMTP id
 i3-20020adfefc3000000b0021035444223mr41663591wrp.581.1654847973862; 
 Fri, 10 Jun 2022 00:59:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx60Ha6ClHAgjcLEmmTJpMdObibGwMAZJifRdSwOUB58mXEAGfWP/SiqhjrjB2OFoZGwwtzAg==
X-Received: by 2002:adf:efc3:0:b0:210:3544:4223 with SMTP id
 i3-20020adfefc3000000b0021035444223mr41663572wrp.581.1654847973625; 
 Fri, 10 Jun 2022 00:59:33 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 h62-20020a1c2141000000b0039c151298b7sm2104191wmh.10.2022.06.10.00.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:59:33 -0700 (PDT)
Date: Fri, 10 Jun 2022 03:59:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Ani Sinha <ani@anisinha.ca>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PULL 50/54] hw/acpi/viot: sort VIOT ACPI table entries by PCI host
 bridge min_bus
Message-ID: <20220610075631.367501-51-mst@redhat.com>
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

This ensures that the VIOT ACPI table output is always stable for a given PCI
topology by ensuring that entries are ordered according to min_bus.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220525173232.31429-6-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/viot.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/hw/acpi/viot.c b/hw/acpi/viot.c
index c32bbdd180..4e0bf69067 100644
--- a/hw/acpi/viot.c
+++ b/hw/acpi/viot.c
@@ -64,6 +64,20 @@ static int enumerate_pci_host_bridges(Object *obj, void *opaque)
     return 0;
 }
 
+static gint pci_host_range_compare(gconstpointer a, gconstpointer b)
+{
+    struct viot_pci_host_range *range_a = (struct viot_pci_host_range *)a;
+    struct viot_pci_host_range *range_b = (struct viot_pci_host_range *)b;
+
+    if (range_a->min_bus < range_b->min_bus) {
+        return -1;
+    } else if (range_a->min_bus > range_b->min_bus) {
+        return 1;
+    } else {
+        return 0;
+    }
+}
+
 /*
  * Generate a VIOT table with one PCI-based virtio-iommu that manages PCI
  * endpoints.
@@ -87,6 +101,9 @@ void build_viot(MachineState *ms, GArray *table_data, BIOSLinker *linker,
     object_child_foreach_recursive(OBJECT(ms), enumerate_pci_host_bridges,
                                    pci_host_ranges);
 
+    /* Sort the pci host ranges by min_bus */
+    g_array_sort(pci_host_ranges, pci_host_range_compare);
+
     /* ACPI table header */
     acpi_table_begin(&table, table_data);
     /* Node count */
-- 
MST



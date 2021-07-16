Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F02853CB9B9
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 17:24:48 +0200 (CEST)
Received: from localhost ([::1]:49106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4Pho-0004J4-1Q
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 11:24:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m4PZ2-0001De-D3
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 11:15:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m4PYx-0004Ko-EI
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 11:15:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626448538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/OZKZnTpXtPjXVstCt8swwDVZoRwveMME1l85hvhMPQ=;
 b=CAlqbE7fE9wxrcsFCSfPJxPBn5pFoTf6heYtjm1SnDJrP8Cc/gS7duHE0lWZDxNVrEc0Qr
 1H8fluWc8FsTyLE4+vSJ4AbUCpILhnua5TwDlzCsSLj2HZL0OnU9GIWnYl7FMHazkeSNfy
 i+UpZVxYPmlbNdL/OyeIabcFa6jhh4Y=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-3N6SO1DgMZaWF4WJ5Mut7w-1; Fri, 16 Jul 2021 11:15:37 -0400
X-MC-Unique: 3N6SO1DgMZaWF4WJ5Mut7w-1
Received: by mail-wr1-f69.google.com with SMTP id
 z6-20020a5d4c860000b029013a10564614so4960523wrs.15
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 08:15:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/OZKZnTpXtPjXVstCt8swwDVZoRwveMME1l85hvhMPQ=;
 b=M+O0xVYtJXNMn4Qxb1xJ5weEAygCjUzm1zXEwkzo+aQ69lVDc78IYBMlUP1r3M7mU5
 hWBmc9iQ5EO1V1K/KbspKlWE8X1lfNE/rOKcCk0rXq074C8RDU0klownFC3XNOEPKNZ0
 8GcfvRMoaCciM/6geGOp21GCpKR7uo9dAMgbwHP1hl2+rn6w7Xxe1btTnRJxXjqPe8RZ
 eNqdbP3M9qzmP8AVb3Q7NiOuvB2V2CJ49ZZhnQa1EtpbXHsgXp0YqsTU7GlxN6lIwz2L
 TZexSh3ZVzw9F3jg0F1mZvQwW5029X/XJI0SPdOyekjKN5TN4c/lojDy8QnbPqvoHuKR
 CR/w==
X-Gm-Message-State: AOAM531Y0kV/tEOtLjH5d8ZdjrF3z3oT3NSZDAHtpuynzIJqGf3MEdtp
 KLDHTc9pvskY4yhSbvWAYeE0TkU/WLU0jUgs82uO9edDS8DWZLQdZIvzh1an+busfzzzZKFpGCN
 vSYvRFGLNvKOTg0QrCfA7RYo34XNeYQ01Py0Xdch4q0vbK+tuaEQZOLIJw85N
X-Received: by 2002:a05:600c:1d04:: with SMTP id
 l4mr3889070wms.130.1626448534689; 
 Fri, 16 Jul 2021 08:15:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiJVxBwGP82p5MPbaKU1qk4aCYqWibfhpP4OBfexYOVNvzDo53yOXBDD0bie8h7YQ9aD7dAQ==
X-Received: by 2002:a05:600c:1d04:: with SMTP id
 l4mr3889044wms.130.1626448534448; 
 Fri, 16 Jul 2021 08:15:34 -0700 (PDT)
Received: from redhat.com ([2a10:8004:6ff2:0:a1b1:b3d8:4c4e:4825])
 by smtp.gmail.com with ESMTPSA id d29sm12868881wrb.63.2021.07.16.08.15.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 08:15:34 -0700 (PDT)
Date: Fri, 16 Jul 2021 11:15:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 13/19] hw/i386: Add a default_bus_bypass_iommu pc machine
 option
Message-ID: <20210716151416.155127-14-mst@redhat.com>
References: <20210716151416.155127-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210716151416.155127-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xingang Wang <wangxingang5@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xingang Wang <wangxingang5@huawei.com>

Add a default_bus_bypass_iommu pc machine option to enable/disable
bypass_iommu for default root bus. The option is disabled by default
and can be enabled with:
$QEMU -machine q35,default_bus_bypass_iommu=true

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
Message-Id: <1625748919-52456-5-git-send-email-wangxingang5@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/i386/pc.h |  1 +
 hw/i386/pc.c         | 20 ++++++++++++++++++++
 hw/pci-host/q35.c    |  2 ++
 3 files changed, 23 insertions(+)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 0775f945d7..88dffe7517 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -44,6 +44,7 @@ typedef struct PCMachineState {
     bool sata_enabled;
     bool pit_enabled;
     bool hpet_enabled;
+    bool default_bus_bypass_iommu;
     uint64_t max_fw_size;
 
     /* NUMA information: */
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index f4c7a78362..c2b9d62a35 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1524,6 +1524,21 @@ static void pc_machine_set_hpet(Object *obj, bool value, Error **errp)
     pcms->hpet_enabled = value;
 }
 
+static bool pc_machine_get_default_bus_bypass_iommu(Object *obj, Error **errp)
+{
+    PCMachineState *pcms = PC_MACHINE(obj);
+
+    return pcms->default_bus_bypass_iommu;
+}
+
+static void pc_machine_set_default_bus_bypass_iommu(Object *obj, bool value,
+                                                    Error **errp)
+{
+    PCMachineState *pcms = PC_MACHINE(obj);
+
+    pcms->default_bus_bypass_iommu = value;
+}
+
 static void pc_machine_get_max_ram_below_4g(Object *obj, Visitor *v,
                                             const char *name, void *opaque,
                                             Error **errp)
@@ -1623,6 +1638,7 @@ static void pc_machine_initfn(Object *obj)
 #ifdef CONFIG_HPET
     pcms->hpet_enabled = true;
 #endif
+    pcms->default_bus_bypass_iommu = false;
 
     pc_system_flash_create(pcms);
     pcms->pcspk = isa_new(TYPE_PC_SPEAKER);
@@ -1747,6 +1763,10 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     object_class_property_add_bool(oc, "hpet",
         pc_machine_get_hpet, pc_machine_set_hpet);
 
+    object_class_property_add_bool(oc, "default_bus_bypass_iommu",
+        pc_machine_get_default_bus_bypass_iommu,
+        pc_machine_set_default_bus_bypass_iommu);
+
     object_class_property_add(oc, PC_MACHINE_MAX_FW_SIZE, "size",
         pc_machine_get_max_fw_size, pc_machine_set_max_fw_size,
         NULL, NULL);
diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index 0f37cf056a..ab5a47aff5 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -65,6 +65,8 @@ static void q35_host_realize(DeviceState *dev, Error **errp)
                                 s->mch.address_space_io,
                                 0, TYPE_PCIE_BUS);
     PC_MACHINE(qdev_get_machine())->bus = pci->bus;
+    pci->bypass_iommu =
+        PC_MACHINE(qdev_get_machine())->default_bus_bypass_iommu;
     qdev_realize(DEVICE(&s->mch), BUS(pci->bus), &error_fatal);
 }
 
-- 
MST



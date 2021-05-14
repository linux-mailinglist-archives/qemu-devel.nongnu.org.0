Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9208F380E1C
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 18:25:40 +0200 (CEST)
Received: from localhost ([::1]:39150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhad9-00078p-Ks
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 12:25:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lhaIm-0006lB-96
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:04:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lhaIj-0005Qd-TL
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:04:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621008273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=upZeNF4eA0t53yo34zKkvSJygTJZcKC6c3bGqY8MELc=;
 b=HNH0n/vQ4PDExjcUhtSHwDSp7kYtasNxzLIHXScv/FEshEhWsSzfVQfizGULKZ0vjFtRfq
 5niZywR1FNr9ZiwneDSHjsp9VlKL9sNnnsNcryHo9F886kJYFLgwVlMSJIyXkvrLjJMAxv
 LcI+Nn2X7gsh3LKc24UAlGCxSGT39SE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-nAFIMs7HMWWfUfL-FS43KQ-1; Fri, 14 May 2021 12:04:28 -0400
X-MC-Unique: nAFIMs7HMWWfUfL-FS43KQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 g206-20020a1c39d70000b029016ac627fbe9so6836wma.9
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 09:04:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=upZeNF4eA0t53yo34zKkvSJygTJZcKC6c3bGqY8MELc=;
 b=Bwg+eb+ulwfv7BNQqNJi/MC3Ltld/i4nODyp6hlZXd2RxjYb0tPt0aXFb6bNoQzz9b
 afYo1D1GdDiS9QEYI8ZHrm2EAXClACtpyGVh4BNqtp+V6XoYnq6vwNyWc3y4k/tpzDwm
 yUpqTavu99pJEgMQumJDtp8lfmaMjygz4sOrNcesOWL5aP33uS+olAAEajxykDzI45Y4
 L5LKXhfhQGB8eweDzwcslt9H1rrwqyoVJJ+P5QAteDE0t0/CmTDq5VVqPz76FT1HvbM5
 q0wq5zOgE++DSxXPDzBnl4/y0NGHcjRYTj/gJ0PlZy28DmPWENecRQ1ehr47YmxwH76w
 x/ww==
X-Gm-Message-State: AOAM531ypNfVbsxV8+s5c7UCYpjTza/oNEyFtUwcTDfdAFuePifi8NLd
 n+PG1akceSwG98I9nKYpGfZF1bqyQpPL0YKw4fQzqaB2k3Kp65DNOGDHqB1LORaFI51VtOngos6
 oooUpzHSgYo/dOGE2iFIEF22eID6eBbJmwRFF24B/GzJKx6ujEE84W69DmLS0
X-Received: by 2002:adf:bc46:: with SMTP id a6mr21656637wrh.232.1621008266673; 
 Fri, 14 May 2021 09:04:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0Ftkp4ILuDFhDMzHUHnw0pIlvv26FuDtrrUezXJtHL7kZeS7jRZHGuz7Y1J54CD9mFK34/w==
X-Received: by 2002:adf:bc46:: with SMTP id a6mr21656597wrh.232.1621008266364; 
 Fri, 14 May 2021 09:04:26 -0700 (PDT)
Received: from redhat.com ([2a10:800c:1fa6:0:3809:fe0c:bb87:250e])
 by smtp.gmail.com with ESMTPSA id a1sm2782230wmm.7.2021.05.14.09.04.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 09:04:25 -0700 (PDT)
Date: Fri, 14 May 2021 12:04:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/16] pc-dimm: remove unnecessary get_vmstate_memory_region()
 method
Message-ID: <20210514160245.91918-8-mst@redhat.com>
References: <20210514160245.91918-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210514160245.91918-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>

The get_vmstate_memory_region() method from PCDIMMDeviceClass is only
ever called from this class and is never overridden, so it can be converted
into an ordinary function.
This saves us from having to do an indirect call in order to reach it.

Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
Message-Id: <f42da25471dc4b967796642388294e61e6587047.1619303649.git.maciej.szmigiero@oracle.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/mem/pc-dimm.h |  5 -----
 hw/mem/pc-dimm.c         | 33 ++++++++++++++-------------------
 2 files changed, 14 insertions(+), 24 deletions(-)

diff --git a/include/hw/mem/pc-dimm.h b/include/hw/mem/pc-dimm.h
index 3d3db82641..1473e6db62 100644
--- a/include/hw/mem/pc-dimm.h
+++ b/include/hw/mem/pc-dimm.h
@@ -56,9 +56,6 @@ struct PCDIMMDevice {
  * PCDIMMDeviceClass:
  * @realize: called after common dimm is realized so that the dimm based
  * devices get the chance to do specified operations.
- * @get_vmstate_memory_region: returns #MemoryRegion which indicates the
- * memory of @dimm should be kept during live migration. Will not fail
- * after the device was realized.
  */
 struct PCDIMMDeviceClass {
     /* private */
@@ -66,8 +63,6 @@ struct PCDIMMDeviceClass {
 
     /* public */
     void (*realize)(PCDIMMDevice *dimm, Error **errp);
-    MemoryRegion *(*get_vmstate_memory_region)(PCDIMMDevice *dimm,
-                                               Error **errp);
 };
 
 void pc_dimm_pre_plug(PCDIMMDevice *dimm, MachineState *machine,
diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
index 12b655eda8..a3a2560301 100644
--- a/hw/mem/pc-dimm.c
+++ b/hw/mem/pc-dimm.c
@@ -34,6 +34,16 @@
 
 static int pc_dimm_get_free_slot(const int *hint, int max_slots, Error **errp);
 
+static MemoryRegion *pc_dimm_get_memory_region(PCDIMMDevice *dimm, Error **errp)
+{
+    if (!dimm->hostmem) {
+        error_setg(errp, "'" PC_DIMM_MEMDEV_PROP "' property must be set");
+        return NULL;
+    }
+
+    return host_memory_backend_get_memory(dimm->hostmem);
+}
+
 void pc_dimm_pre_plug(PCDIMMDevice *dimm, MachineState *machine,
                       const uint64_t *legacy_align, Error **errp)
 {
@@ -66,9 +76,8 @@ void pc_dimm_pre_plug(PCDIMMDevice *dimm, MachineState *machine,
 
 void pc_dimm_plug(PCDIMMDevice *dimm, MachineState *machine)
 {
-    PCDIMMDeviceClass *ddc = PC_DIMM_GET_CLASS(dimm);
-    MemoryRegion *vmstate_mr = ddc->get_vmstate_memory_region(dimm,
-                                                              &error_abort);
+    MemoryRegion *vmstate_mr = pc_dimm_get_memory_region(dimm,
+                                                         &error_abort);
 
     memory_device_plug(MEMORY_DEVICE(dimm), machine);
     vmstate_register_ram(vmstate_mr, DEVICE(dimm));
@@ -76,9 +85,8 @@ void pc_dimm_plug(PCDIMMDevice *dimm, MachineState *machine)
 
 void pc_dimm_unplug(PCDIMMDevice *dimm, MachineState *machine)
 {
-    PCDIMMDeviceClass *ddc = PC_DIMM_GET_CLASS(dimm);
-    MemoryRegion *vmstate_mr = ddc->get_vmstate_memory_region(dimm,
-                                                              &error_abort);
+    MemoryRegion *vmstate_mr = pc_dimm_get_memory_region(dimm,
+                                                         &error_abort);
 
     memory_device_unplug(MEMORY_DEVICE(dimm), machine);
     vmstate_unregister_ram(vmstate_mr, DEVICE(dimm));
@@ -205,16 +213,6 @@ static void pc_dimm_unrealize(DeviceState *dev)
     host_memory_backend_set_mapped(dimm->hostmem, false);
 }
 
-static MemoryRegion *pc_dimm_get_memory_region(PCDIMMDevice *dimm, Error **errp)
-{
-    if (!dimm->hostmem) {
-        error_setg(errp, "'" PC_DIMM_MEMDEV_PROP "' property must be set");
-        return NULL;
-    }
-
-    return host_memory_backend_get_memory(dimm->hostmem);
-}
-
 static uint64_t pc_dimm_md_get_addr(const MemoryDeviceState *md)
 {
     return object_property_get_uint(OBJECT(md), PC_DIMM_ADDR_PROP,
@@ -266,7 +264,6 @@ static void pc_dimm_md_fill_device_info(const MemoryDeviceState *md,
 static void pc_dimm_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
-    PCDIMMDeviceClass *ddc = PC_DIMM_CLASS(oc);
     MemoryDeviceClass *mdc = MEMORY_DEVICE_CLASS(oc);
 
     dc->realize = pc_dimm_realize;
@@ -274,8 +271,6 @@ static void pc_dimm_class_init(ObjectClass *oc, void *data)
     device_class_set_props(dc, pc_dimm_properties);
     dc->desc = "DIMM memory module";
 
-    ddc->get_vmstate_memory_region = pc_dimm_get_memory_region;
-
     mdc->get_addr = pc_dimm_md_get_addr;
     mdc->set_addr = pc_dimm_md_set_addr;
     /* for a dimm plugged_size == region_size */
-- 
MST



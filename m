Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED60764DBC6
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 13:58:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5ngu-0006j3-TQ; Thu, 15 Dec 2022 07:50:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5ngs-0006gx-Ao
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:22 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5ngp-00046h-Pw
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:21 -0500
Received: by mail-wm1-x32d.google.com with SMTP id ja17so10764632wmb.3
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 04:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5dJXVk6Pxoxg5miy1GeHW56WuXWRVzOcLZ8zV52nDko=;
 b=E2BhoyqaWDo64yilgy+YmqY8stK7RvyPRYXYzzt6SuPBOEYWxEX8nIksR5iTB3EwbD
 CQ0eW+zNJQf/zLhbMfWcnf2KYRflHE0y/2AxefTi8HhPVf6VkuT9snO+e5S7dE1xbk74
 yFHS8MnDC/0q/jLJ6R+xnwgBJ0ROUUbnsWlICzJ3C3w3ZBQT+KgHrs5OBmVm2jdWYOBX
 7EBxxK5zWV6Zz536NffXqb9ZxQqYXa8Lu3bq2aqb+k98N5URI7N+NUV1vwsaj5OgkHTC
 /2+2P45dSs03oe5wFFzGAppljF2JF8gew56WEvhsGZQyiFa8GAf9BmOFBPQlNLHNU4jv
 6b+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5dJXVk6Pxoxg5miy1GeHW56WuXWRVzOcLZ8zV52nDko=;
 b=VSrE3ahxui8es8KSgEBnbUMu+rMn+XkyUEF6lTNhLLj/5KWyC/q8arg+QXqeaTOiwb
 Jf66h+N/cCruazNsDZP3h2/1le3hdLJv5xSJ3yi8sWylHldg1tuF2kGyM89nK1pmuBRL
 Q0M9gRYynL40GwMV7KB3Ns5okQ1zyBvbv1Q23E1FYuVTijK1kms9D+33cLaibEWxgNtK
 ySdL++iwFgu+d4voE79g+OM7uw6ZxA7eNz2GMgwkBx4NCekExB4Jb8rFloDbRbrjh/9J
 29QLhqvcwv8SyfRp0pqa01NZkUX7+WMEJ5Bl0xunMPD9JS6IcA0OffyqxAAEtzyX9Hx0
 pozw==
X-Gm-Message-State: ANoB5pmTKJQtsqhvfmmKVHdBPI6Y+xkLOdVOoEb7pdgJ+ncPBT1zk/Aq
 vKiARem/CmP3ROUvr5KVHbiXfEgW1YG9nZ/u
X-Google-Smtp-Source: AA0mqf7bcd00/wsfoG8s2Sb5YE+CQV/UhYPhvgTMhRvmF07Z8CJUORg25Hz48Yyh30NfvzwKOlLrjw==
X-Received: by 2002:a05:600c:805:b0:3d1:ebdf:d592 with SMTP id
 k5-20020a05600c080500b003d1ebdfd592mr21365611wmp.22.1671108618403; 
 Thu, 15 Dec 2022 04:50:18 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a05600c354c00b003cfd64b6be1sm8388787wmq.27.2022.12.15.04.50.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 04:50:17 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/29] hw/arm/virt: Add properties to disable high memory
 regions
Date: Thu, 15 Dec 2022 12:49:47 +0000
Message-Id: <20221215125009.980128-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221215125009.980128-1-peter.maydell@linaro.org>
References: <20221215125009.980128-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Gavin Shan <gshan@redhat.com>

The 3 high memory regions are usually enabled by default, but they may
be not used. For example, VIRT_HIGH_GIC_REDIST2 isn't needed by GICv2.
This leads to waste in the PA space.

Add properties ("highmem-redists", "highmem-ecam", "highmem-mmio") to
allow users selectively disable them if needed. After that, the high
memory region for GICv3 or GICv4 redistributor can be disabled by user,
the number of maximal supported CPUs needs to be calculated based on
'vms->highmem_redists'. The follow-up error message is also improved
to indicate if the high memory region for GICv3 and GICv4 has been
enabled or not.

Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-id: 20221029224307.138822-8-gshan@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/virt.rst | 13 +++++++
 hw/arm/virt.c            | 75 ++++++++++++++++++++++++++++++++++++++--
 2 files changed, 86 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 4454706392c..188a4f211f4 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -98,6 +98,19 @@ compact-highmem
   Set ``on``/``off`` to enable/disable the compact layout for high memory regions.
   The default is ``on`` for machine types later than ``virt-7.2``.
 
+highmem-redists
+  Set ``on``/``off`` to enable/disable the high memory region for GICv3 or
+  GICv4 redistributor. The default is ``on``. Setting this to ``off`` will
+  limit the maximum number of CPUs when GICv3 or GICv4 is used.
+
+highmem-ecam
+  Set ``on``/``off`` to enable/disable the high memory region for PCI ECAM.
+  The default is ``on`` for machine types later than ``virt-3.0``.
+
+highmem-mmio
+  Set ``on``/``off`` to enable/disable the high memory region for PCI MMIO.
+  The default is ``on``.
+
 gic-version
   Specify the version of the Generic Interrupt Controller (GIC) to provide.
   Valid values are:
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 3d1371c05c0..0acb71be962 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2096,14 +2096,20 @@ static void machvirt_init(MachineState *machine)
     if (vms->gic_version == VIRT_GIC_VERSION_2) {
         virt_max_cpus = GIC_NCPU;
     } else {
-        virt_max_cpus = virt_redist_capacity(vms, VIRT_GIC_REDIST) +
-            virt_redist_capacity(vms, VIRT_HIGH_GIC_REDIST2);
+        virt_max_cpus = virt_redist_capacity(vms, VIRT_GIC_REDIST);
+        if (vms->highmem_redists) {
+            virt_max_cpus += virt_redist_capacity(vms, VIRT_HIGH_GIC_REDIST2);
+        }
     }
 
     if (max_cpus > virt_max_cpus) {
         error_report("Number of SMP CPUs requested (%d) exceeds max CPUs "
                      "supported by machine 'mach-virt' (%d)",
                      max_cpus, virt_max_cpus);
+        if (vms->gic_version != VIRT_GIC_VERSION_2 && !vms->highmem_redists) {
+            error_printf("Try 'highmem-redists=on' for more CPUs\n");
+        }
+
         exit(1);
     }
 
@@ -2372,6 +2378,49 @@ static void virt_set_compact_highmem(Object *obj, bool value, Error **errp)
     vms->highmem_compact = value;
 }
 
+static bool virt_get_highmem_redists(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    return vms->highmem_redists;
+}
+
+static void virt_set_highmem_redists(Object *obj, bool value, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    vms->highmem_redists = value;
+}
+
+static bool virt_get_highmem_ecam(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    return vms->highmem_ecam;
+}
+
+static void virt_set_highmem_ecam(Object *obj, bool value, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    vms->highmem_ecam = value;
+}
+
+static bool virt_get_highmem_mmio(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    return vms->highmem_mmio;
+}
+
+static void virt_set_highmem_mmio(Object *obj, bool value, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    vms->highmem_mmio = value;
+}
+
+
 static bool virt_get_its(Object *obj, Error **errp)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
@@ -2997,6 +3046,28 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
                                           "Set on/off to enable/disable compact "
                                           "layout for high memory regions");
 
+    object_class_property_add_bool(oc, "highmem-redists",
+                                   virt_get_highmem_redists,
+                                   virt_set_highmem_redists);
+    object_class_property_set_description(oc, "highmem-redists",
+                                          "Set on/off to enable/disable high "
+                                          "memory region for GICv3 or GICv4 "
+                                          "redistributor");
+
+    object_class_property_add_bool(oc, "highmem-ecam",
+                                   virt_get_highmem_ecam,
+                                   virt_set_highmem_ecam);
+    object_class_property_set_description(oc, "highmem-ecam",
+                                          "Set on/off to enable/disable high "
+                                          "memory region for PCI ECAM");
+
+    object_class_property_add_bool(oc, "highmem-mmio",
+                                   virt_get_highmem_mmio,
+                                   virt_set_highmem_mmio);
+    object_class_property_set_description(oc, "highmem-mmio",
+                                          "Set on/off to enable/disable high "
+                                          "memory region for PCI MMIO");
+
     object_class_property_add_str(oc, "gic-version", virt_get_gic_version,
                                   virt_set_gic_version);
     object_class_property_set_description(oc, "gic-version",
-- 
2.25.1



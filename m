Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E952B1192
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 23:33:23 +0100 (CET)
Received: from localhost ([::1]:34362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdL9e-0000Oe-6F
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 17:33:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdKRG-00009z-74
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:47:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdKRE-0003nW-Ar
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:47:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605217647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZjrEp/03Ea7DJhLoDY4D+Ygo5iZLhvkFFezlkMhPFMs=;
 b=OXMqNoFYNAj0uNWCQA+oUGPTq9+Sev2238xQo/trJlKyfkBKDXv6V0CgMSmFFsPVXciR7e
 Tito212AqSy4YteZOhRKDnLiDrLA95QOg/WE2atwqkFM2cmdKmVXbFTxhb+bA7qdAbnjJa
 t2zG0V/eovI71tmB+qdBNXh3+X2+NQQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153--KODvs5fPoCOwqkmsgaXKw-1; Thu, 12 Nov 2020 16:47:23 -0500
X-MC-Unique: -KODvs5fPoCOwqkmsgaXKw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 960FC1074643;
 Thu, 12 Nov 2020 21:47:22 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 10F1E60C13;
 Thu, 12 Nov 2020 21:47:18 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 50/53] qom: Delete DEFINE_PROP_*SIGNED_NODEFAULT macro
Date: Thu, 12 Nov 2020 16:43:47 -0500
Message-Id: <20201112214350.872250-51-ehabkost@redhat.com>
In-Reply-To: <20201112214350.872250-1-ehabkost@redhat.com>
References: <20201112214350.872250-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Those macros are exactly the same as DEFINE_PROP, we can use
DEFINE_PROP directly.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
This is a new patch added in v3 of this series.
---
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
---
 include/qom/property-types.h | 6 ------
 hw/vfio/pci.c                | 6 +++---
 target/arm/cpu.c             | 6 +++---
 3 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/include/qom/property-types.h b/include/qom/property-types.h
index 62551c77e0..91b166badf 100644
--- a/include/qom/property-types.h
+++ b/include/qom/property-types.h
@@ -48,9 +48,6 @@ extern const PropertyInfo prop_info_link;
                 .set_default = true,                                     \
                 .defval.i    = (_type)_defval)
 
-#define DEFINE_PROP_SIGNED_NODEFAULT(_name, _state, _field, _prop, _type) \
-    DEFINE_PROP(_name, _state, _field, _prop, _type)
-
 #define DEFINE_PROP_BIT(_name, _state, _field, _bit, _defval)   \
     DEFINE_PROP(_name, _state, _field, prop_info_bit, uint32_t, \
                 .bitnr       = (_bit),                          \
@@ -62,9 +59,6 @@ extern const PropertyInfo prop_info_link;
                 .set_default = true,                                       \
                 .defval.u  = (_type)_defval)
 
-#define DEFINE_PROP_UNSIGNED_NODEFAULT(_name, _state, _field, _prop, _type) \
-    DEFINE_PROP(_name, _state, _field, _prop, _type)
-
 #define DEFINE_PROP_BIT64(_name, _state, _field, _bit, _defval)   \
     DEFINE_PROP(_name, _state, _field, prop_info_bit64, uint64_t, \
                 .bitnr    = (_bit),                               \
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index edfaed8c9a..f15abacbdf 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3214,9 +3214,9 @@ static Property vfio_pci_dev_properties[] = {
     DEFINE_PROP_UINT32("x-pci-sub-device-id", VFIOPCIDevice,
                        sub_device_id, PCI_ANY_ID),
     DEFINE_PROP_UINT32("x-igd-gms", VFIOPCIDevice, igd_gms, 0),
-    DEFINE_PROP_UNSIGNED_NODEFAULT("x-nv-gpudirect-clique", VFIOPCIDevice,
-                                   nv_gpudirect_clique,
-                                   qdev_prop_nv_gpudirect_clique, uint8_t),
+    DEFINE_PROP("x-nv-gpudirect-clique", VFIOPCIDevice,
+                nv_gpudirect_clique,
+                qdev_prop_nv_gpudirect_clique, uint8_t),
     DEFINE_PROP_OFF_AUTO_PCIBAR("x-msix-relocation", VFIOPCIDevice, msix_relo,
                                 OFF_AUTOPCIBAR_OFF),
     /*
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index cef92879b0..7cf2078622 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1106,9 +1106,9 @@ static Property arm_cpu_has_mpu_property =
  * to override that with an incorrect constant value.
  */
 static Property arm_cpu_pmsav7_dregion_property =
-            DEFINE_PROP_UNSIGNED_NODEFAULT("pmsav7-dregion", ARMCPU,
-                                           pmsav7_dregion,
-                                           prop_info_uint32, uint32_t);
+            DEFINE_PROP("pmsav7-dregion", ARMCPU,
+                        pmsav7_dregion,
+                        prop_info_uint32, uint32_t);
 
 static bool arm_get_pmu(Object *obj, Error **errp)
 {
-- 
2.28.0



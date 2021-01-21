Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C31832FF000
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 17:18:35 +0100 (CET)
Received: from localhost ([::1]:43650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2cfK-0004lM-QQ
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 11:18:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1l2ccf-0003Hq-B5
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 11:15:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1l2cc7-00034q-9j
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 11:15:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611245711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=expx/yH7rLnCgpdu5NCfs5+DOoqpSf10cfqxc5toEjY=;
 b=XlX9Ic5VIiSu528TDtqrbcGhhAYWRaXLfK55zDXVacupxIkNhlhnKqbIdsyz3bWLvNARKe
 /TqGCecg92xlo4sZeq5G7D7l1tZmRI0qm8tD/Ml3htahianosGFUxm6U9mK2orYAE9adSo
 H3kD4spSOzyfOH/Chd2DrxHbttRrZN0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-QbftkLEBP-KDqTKH6Llt_w-1; Thu, 21 Jan 2021 11:15:08 -0500
X-MC-Unique: QbftkLEBP-KDqTKH6Llt_w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4207F1800D41;
 Thu, 21 Jan 2021 16:15:07 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A7001A3D8;
 Thu, 21 Jan 2021 16:15:05 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] machine: add missing doc for memory-backend option
Date: Thu, 21 Jan 2021 11:15:04 -0500
Message-Id: <20210121161504.1007247-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, mprivozn@redhat.com, pkrempa@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add documentation for '-machine memory-backend' CLI option and
how to use it.

And document that x-use-canonical-path-for-ramblock-id,
is considered to be stable to make sure it won't go away by accident.

x- was intended for unstable/iternal properties, and not supposed to
be stable option. However it's too late to rename (drop x-)
it as it would mean that users will have to mantain both
x-use-canonical-path-for-ramblock-id (for QEMU 5.0-5.2) versions
and prefix-less for later versions.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
v2:
 - add doc that x-use-canonical-path-for-ramblock-id is considered stable,
     (Peter Krempa <pkrempa@redhat.com>)
v3:
 - s/x-use-canonical-path-for-ramblock-id=on/x-use-canonical-path-for-ramblock-id=off/
     (Michal Privoznik <mprivozn@redhat.com>)
 - add to commit message why x- prefix is preserved
 - drop clause about x-use-canonical-path-for-ramblock-id being stable
   from help section, but keep it in code comment above
   x-use-canonical-path-for-ramblock-id property. It's sufficient
   to prevent option being changed/removed by accident.
     (Peter Maydell <peter.maydell@linaro.org>)
---
 backends/hostmem.c | 10 ++++++++++
 qemu-options.hx    | 26 +++++++++++++++++++++++++-
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/backends/hostmem.c b/backends/hostmem.c
index 9f9ac95edd..813aeb83c9 100644
--- a/backends/hostmem.c
+++ b/backends/hostmem.c
@@ -498,6 +498,16 @@ host_memory_backend_class_init(ObjectClass *oc, void *data)
         host_memory_backend_get_share, host_memory_backend_set_share);
     object_class_property_set_description(oc, "share",
         "Mark the memory as private to QEMU or shared");
+    /*
+     * Do not delete/rename option. This option must be considered stable
+     * (as if it didn't have the 'x-' prefix including deprecation period) as
+     * long as 4.0 and older machine types exists.
+     * Option will be used by upper layers to override (disable) canonical path
+     * for ramblock-id set by compat properties on old machine types ( <= 4.0),
+     * to keep migration working when backend is used for main RAM with
+     * -machine memory-backend= option (main RAM historically used prefix-less
+     * ramblock-id).
+     */
     object_class_property_add_bool(oc, "x-use-canonical-path-for-ramblock-id",
         host_memory_backend_get_use_canonical_path,
         host_memory_backend_set_use_canonical_path);
diff --git a/qemu-options.hx b/qemu-options.hx
index 62791f56d8..059b1a1d14 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -35,7 +35,8 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
     "                suppress-vmdesc=on|off disables self-describing migration (default=off)\n"
     "                nvdimm=on|off controls NVDIMM support (default=off)\n"
     "                memory-encryption=@var{} memory encryption object to use (default=none)\n"
-    "                hmat=on|off controls ACPI HMAT support (default=off)\n",
+    "                hmat=on|off controls ACPI HMAT support (default=off)\n"
+    "                memory-backend='backend-id' specifies explicitly provided backend for main RAM (default=none)\n",
     QEMU_ARCH_ALL)
 SRST
 ``-machine [type=]name[,prop=value[,...]]``
@@ -96,6 +97,29 @@ SRST
     ``hmat=on|off``
         Enables or disables ACPI Heterogeneous Memory Attribute Table
         (HMAT) support. The default is off.
+
+     ``memory-backend='id'``
+        An alternative to legacy ``-mem-path`` and ``mem-prealloc`` options.
+        Allows to use a memory backend as main RAM.
+
+        For example:
+        ::
+        -object memory-backend-file,id=pc.ram,size=512M,mem-path=/hugetlbfs,prealloc=on,share=on
+        -machine memory-backend=pc.ram
+        -m 512M
+
+        Migration compatibility note:
+        a) as backend id one shall use value of 'default-ram-id', advertised by
+        machine type (available via ``query-machines`` QMP command), if migration
+        to/from old QEMU (<5.0) is expected.
+        b) for machine types 4.0 and older, user shall
+        use ``x-use-canonical-path-for-ramblock-id=off`` backend option
+        if migration to/from old QEMU (<5.0) is expected.
+        For example:
+        ::
+        -object memory-backend-ram,id=pc.ram,size=512M,x-use-canonical-path-for-ramblock-id=off
+        -machine memory-backend=pc.ram
+        -m 512M
 ERST
 
 HXCOMM Deprecated by -machine
-- 
2.27.0



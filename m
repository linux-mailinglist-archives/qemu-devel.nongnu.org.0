Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBE62F22C2
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 23:29:20 +0100 (CET)
Received: from localhost ([::1]:43088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz5gd-000672-Fj
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 17:29:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kz5f3-0005e7-Fr
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 17:27:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kz5ez-0008CN-Kw
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 17:27:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610404054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MF5rvtI35B6c1TYwVYEa0qfgvJ1qe6vHr2nTdT8GSeU=;
 b=IOaXbM4kW/3DgH9WJnm6aYOHoBapKHFKvvFEELZs2WJB7VzqFar19x1EVgarWuRGXiFcuC
 YVXvOwxO9NMvL2TcGEw6JQEhFkOIwv6tqsIp3iHsYw6wvIf1YcEOGcr8yHnIgT03t8/ZlM
 mjXHlRDCA/CRllT4weBjlsI0iJuQ06s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-Vjg65gWCOwGayaupQd2G4Q-1; Mon, 11 Jan 2021 17:27:33 -0500
X-MC-Unique: Vjg65gWCOwGayaupQd2G4Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E29D107ACF7
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 22:27:32 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 248BC5D9DB;
 Mon, 11 Jan 2021 22:27:30 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] machine: add missing doc for memory-backend option
Date: Mon, 11 Jan 2021 17:27:29 -0500
Message-Id: <20210111222729.757402-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: mprivozn@redhat.com, ehabkost@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add documentation for '-machine memory-backend' CLI option and
how to use it.

PS:
While at it add a comment to x-use-canonical-path-for-ramblock-id,
to make sure it won't go away by accident.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 backends/hostmem.c |  8 ++++++++
 qemu-options.hx    | 25 ++++++++++++++++++++++++-
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/backends/hostmem.c b/backends/hostmem.c
index 4bde00e8e7..f6f4e818c7 100644
--- a/backends/hostmem.c
+++ b/backends/hostmem.c
@@ -497,6 +497,14 @@ host_memory_backend_class_init(ObjectClass *oc, void *data)
         host_memory_backend_get_share, host_memory_backend_set_share);
     object_class_property_set_description(oc, "share",
         "Mark the memory as private to QEMU or shared");
+    /*
+     * Do not delete/rename option till 4.0 and older machine types exist,
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
index 459c916d3d..c02628bd26 100644
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
@@ -96,6 +97,28 @@ SRST
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
+        machine type (available via ``query-machines`` QMP command)
+        b) for machine types 4.0 and older, user shall
+        use ``x-use-canonical-path-for-ramblock-id=on`` backend option,
+        if migration to/from old QEMU (<5.0) is expected.
+        For example:
+        ::
+        -object memory-backend-ram,id=pc.ram,size=512M,x-use-canonical-path-for-ramblock-id=on
+        -machine memory-backend=pc.ram
+        -m 512M
 ERST
 
 HXCOMM Deprecated by -machine
-- 
2.27.0



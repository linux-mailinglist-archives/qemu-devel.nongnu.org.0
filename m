Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E702AF856
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 19:41:48 +0100 (CET)
Received: from localhost ([::1]:33384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcv3z-0001lp-FV
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 13:41:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kcv13-0000JA-Bk
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 13:38:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kcv10-00081S-SJ
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 13:38:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605119921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PcPpBCTO/OGmj1460lh+NKkFRuN0e9q5i3elpdRuoLA=;
 b=KHmDynxxD1eronHFagmz9l1+g31xZE+ImdmZObN8XJ5dkP9rGwGXZYEbUgyIMe273da5RK
 oeHPJCA76w3Ko7dazQHwyNNdHHJueWLOqMQLkRP2HP9rUdWROSVu2NErEpMCXEUuEtJh7S
 UpGVxvDkO/R1bqfWKqHYe0UUZq8OyZY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-2RgKfFigOMGsRS4_eq4Mzg-1; Wed, 11 Nov 2020 13:38:38 -0500
X-MC-Unique: 2RgKfFigOMGsRS4_eq4Mzg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42A5C186DD40;
 Wed, 11 Nov 2020 18:38:36 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C363127BCD;
 Wed, 11 Nov 2020 18:38:35 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/12] arm/cpu64: Register "aarch64" as class property
Date: Wed, 11 Nov 2020 13:38:18 -0500
Message-Id: <20201111183823.283752-8-ehabkost@redhat.com>
In-Reply-To: <20201111183823.283752-1-ehabkost@redhat.com>
References: <20201111183823.283752-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 qemu-arm@nongnu.org, "Daniel P. Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Class properties make QOM introspection simpler and easier, as
they don't require an object to be instantiated.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
---
 target/arm/cpu64.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 649213082f..7cf9fc4bc6 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -762,15 +762,6 @@ static void aarch64_cpu_set_aarch64(Object *obj, bool value, Error **errp)
     }
 }
 
-static void aarch64_cpu_initfn(Object *obj)
-{
-    object_property_add_bool(obj, "aarch64", aarch64_cpu_get_aarch64,
-                             aarch64_cpu_set_aarch64);
-    object_property_set_description(obj, "aarch64",
-                                    "Set on/off to enable/disable aarch64 "
-                                    "execution state ");
-}
-
 static void aarch64_cpu_finalizefn(Object *obj)
 {
 }
@@ -790,6 +781,12 @@ static void aarch64_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_num_core_regs = 34;
     cc->gdb_core_xml_file = "aarch64-core.xml";
     cc->gdb_arch_name = aarch64_gdb_arch_name;
+
+    object_class_property_add_bool(oc, "aarch64", aarch64_cpu_get_aarch64,
+                                   aarch64_cpu_set_aarch64);
+    object_class_property_set_description(oc, "aarch64",
+                                          "Set on/off to enable/disable aarch64 "
+                                          "execution state ");
 }
 
 static void aarch64_cpu_instance_init(Object *obj)
@@ -827,7 +824,6 @@ static const TypeInfo aarch64_cpu_type_info = {
     .name = TYPE_AARCH64_CPU,
     .parent = TYPE_ARM_CPU,
     .instance_size = sizeof(ARMCPU),
-    .instance_init = aarch64_cpu_initfn,
     .instance_finalize = aarch64_cpu_finalizefn,
     .abstract = true,
     .class_size = sizeof(AArch64CPUClass),
-- 
2.28.0



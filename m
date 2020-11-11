Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFCF2AF873
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 19:45:44 +0100 (CET)
Received: from localhost ([::1]:45318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcv7n-0006hW-F6
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 13:45:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kcv0t-00008p-O5
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 13:38:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kcv0r-0007vs-V3
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 13:38:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605119913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HbFMJjy+ZSanPn+Sow/4EnPoUc4YBNEueLHqjzrwRBk=;
 b=K2/JIbe8FX4W8K0WdNTnRGJW0uRAACVvhiWGCMKJQLCGZnwSnwiKbr4gJIJnQMxq3l/4/P
 mQCQhef8DWOpTq+lmol2UzyQAaWkhKGFX5qY0PzYh2DYH8sFPqv+xjOC3Z3YV4pwKUkE88
 twYci5Np68NP8Nw9aAgvVzeDJAOW5JU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-d6yJAgX8M_u_HDof7KmGJA-1; Wed, 11 Nov 2020 13:38:29 -0500
X-MC-Unique: d6yJAgX8M_u_HDof7KmGJA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3869D801FC4;
 Wed, 11 Nov 2020 18:38:28 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E8B0727BCD;
 Wed, 11 Nov 2020 18:38:27 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/12] vexpress-a15: Register "virtualization" as class
 property
Date: Wed, 11 Nov 2020 13:38:13 -0500
Message-Id: <20201111183823.283752-3-ehabkost@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 hw/arm/vexpress.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index da25ce3b2c..c228567ce9 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -766,12 +766,6 @@ static void vexpress_a15_instance_init(Object *obj)
      * but can also be specifically set to on or off.
      */
     vms->virt = true;
-    object_property_add_bool(obj, "virtualization", vexpress_get_virt,
-                             vexpress_set_virt);
-    object_property_set_description(obj, "virtualization",
-                                    "Set on/off to enable/disable the ARM "
-                                    "Virtualization Extensions "
-                                    "(defaults to same as 'secure')");
 }
 
 static void vexpress_a9_instance_init(Object *obj)
@@ -819,6 +813,14 @@ static void vexpress_a15_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
 
     vmc->daughterboard = &a15_daughterboard;
+
+    object_class_property_add_bool(oc, "virtualization", vexpress_get_virt,
+                                   vexpress_set_virt);
+    object_class_property_set_description(oc, "virtualization",
+                                          "Set on/off to enable/disable the ARM "
+                                          "Virtualization Extensions "
+                                          "(defaults to same as 'secure')");
+
 }
 
 static const TypeInfo vexpress_info = {
-- 
2.28.0



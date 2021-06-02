Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29835398523
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 11:20:03 +0200 (CEST)
Received: from localhost ([::1]:39386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loN2g-0004gj-3y
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 05:20:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1loN0W-0001wJ-FX
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 05:17:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1loN0T-0002DT-IK
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 05:17:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622625464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=adTVVJEPZdSvV0XUZRnaYT48XleLc7OPqo1SzNBkzbY=;
 b=Gi3JCz+yhftXAbhn2fB+gWE5z7cFHlTSeonHDKgsgACIk/q60F6IqVnPKTadbVqK6Vk0hw
 I9xAQok5URrd5nnMF36KIasffBG3tqWz7/I/Bpv8pON61R3pjDE/LM4My8GXAqA9pCHQPY
 Z+5HUs+p9dyvGunFKIZQ/psc82Wtubk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-bIO2USUYOkK5VCRydZ9PnA-1; Wed, 02 Jun 2021 05:17:43 -0400
X-MC-Unique: bIO2USUYOkK5VCRydZ9PnA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 536CC107ACE6;
 Wed,  2 Jun 2021 09:17:42 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0356B1002EF0;
 Wed,  2 Jun 2021 09:17:29 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8401C180087D; Wed,  2 Jun 2021 11:17:27 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/9] Add module metadata macros, add qxl module annotations
Date: Wed,  2 Jun 2021 11:17:19 +0200
Message-Id: <20210602091727.1023563-2-kraxel@redhat.com>
In-Reply-To: <20210602091727.1023563-1-kraxel@redhat.com>
References: <20210602091727.1023563-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, armbru@redhat.com,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Stealing an idea from the linux kernel:  Place module metadata
in an .modinfo elf section.  This patch adds macros and qxl module
annotations as example.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/qemu/module.h | 18 ++++++++++++++++++
 hw/display/qxl.c      |  4 ++++
 2 files changed, 22 insertions(+)

diff --git a/include/qemu/module.h b/include/qemu/module.h
index 944d403cbd15..afb9656ba4e7 100644
--- a/include/qemu/module.h
+++ b/include/qemu/module.h
@@ -73,4 +73,22 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail);
 void module_load_qom_one(const char *type);
 void module_load_qom_all(void);
 
+/*
+ * objdump -t -s -j .modinfo ${module}.so
+ */
+
+#define ___PASTE(a, b) a##b
+#define __PASTE(a, b) ___PASTE(a, b)
+
+#define modinfo(kind, value)                             \
+    static const char __PASTE(kind, __LINE__)[]          \
+        __attribute__((__used__))                        \
+        __attribute__((section(".modinfo")))             \
+        __attribute__((aligned(1)))                      \
+        = stringify(kind) "=" value
+
+#define module_obj(name) modinfo(obj, name)
+#define module_dep(name) modinfo(dep, name)
+#define module_arch(name) modinfo(arch, name)
+
 #endif
diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index 6e1f8ff1b2a7..84f99088e0a0 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -2522,6 +2522,7 @@ static const TypeInfo qxl_primary_info = {
     .parent        = TYPE_PCI_QXL,
     .class_init    = qxl_primary_class_init,
 };
+module_obj("qxl-vga");
 
 static void qxl_secondary_class_init(ObjectClass *klass, void *data)
 {
@@ -2538,6 +2539,7 @@ static const TypeInfo qxl_secondary_info = {
     .parent        = TYPE_PCI_QXL,
     .class_init    = qxl_secondary_class_init,
 };
+module_obj("qxl");
 
 static void qxl_register_types(void)
 {
@@ -2547,3 +2549,5 @@ static void qxl_register_types(void)
 }
 
 type_init(qxl_register_types)
+
+module_dep("ui-spice-core");
-- 
2.31.1



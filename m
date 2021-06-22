Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B74D3B0564
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 14:59:58 +0200 (CEST)
Received: from localhost ([::1]:53804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvg0T-0007BR-3V
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 08:59:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lvfsA-0006mh-Mh
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 08:51:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lvfs8-0000pH-Pw
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 08:51:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624366280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=igynxy3YOEjND3VjYBJIzFRvAhPKBdO6NCzFVbZz6EU=;
 b=BkERAo6g4WGYYw0pznucO8ReTNncP6zJxq9+DViEyQfYkbgBM7wBbciZkhzVKnoe55HW3f
 h9QwMCrFlXeMkDO++EbISrXvOBJQcK0PcXNLCf3FyDw+aHvwtNpHQHu5wk4KbZsLfvm9V5
 99I+xyT1YIZVcYLS7/8Vdr9/MTYtTpY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-4ozURl79MOiuOpURdW-d1Q-1; Tue, 22 Jun 2021 08:51:18 -0400
X-MC-Unique: 4ozURl79MOiuOpURdW-d1Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7EE068042F3
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 12:51:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 452315D9F0;
 Tue, 22 Jun 2021 12:51:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D5EDE1800909; Tue, 22 Jun 2021 14:51:10 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] modules: module.h kerneldoc annotations
Date: Tue, 22 Jun 2021 14:51:09 +0200
Message-Id: <20210622125110.262843-4-kraxel@redhat.com>
In-Reply-To: <20210622125110.262843-1-kraxel@redhat.com>
References: <20210622125110.262843-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

---
 include/qemu/module.h | 59 +++++++++++++++++++++++++++++++++----------
 1 file changed, 45 insertions(+), 14 deletions(-)

diff --git a/include/qemu/module.h b/include/qemu/module.h
index 7f4b1af8198c..8bc80535a4d4 100644
--- a/include/qemu/module.h
+++ b/include/qemu/module.h
@@ -74,11 +74,18 @@ void module_load_qom_one(const char *type);
 void module_load_qom_all(void);
 void module_allow_arch(const char *arch);
 
-/*
- * module info annotation macros
+/**
+ * DOC: module info annotation macros
  *
- * scripts/modinfo-collect.py will collect module info,
- * using the preprocessor and -DQEMU_MODINFO
+ * `scripts/modinfo-collect.py` will collect module info,
+ * using the preprocessor and -DQEMU_MODINFO.
+ *
+ * `scripts/modinfo-generate.py` will create a module meta-data database
+ * from the collected information so qemu knows about module
+ * dependencies and QOM objects implemented by modules.
+ *
+ * See `*.modinfo` and `modinfo.c` in the build directory to check the
+ * script results.
  */
 #ifdef QEMU_MODINFO
 # define modinfo(kind, value) \
@@ -87,24 +94,48 @@ void module_allow_arch(const char *arch);
 # define modinfo(kind, value)
 #endif
 
-/* module implements QOM type <name> */
+/**
+ * module_obj
+ *
+ * @name: QOM type.
+ *
+ * This module implements QOM type @name.
+ */
 #define module_obj(name) modinfo(obj, name)
 
-/* module has a dependency on <name> */
+/**
+ * module_dep
+ *
+ * @name: module name
+ *
+ * This module depends on module @name.
+ */
 #define module_dep(name) modinfo(dep, name)
 
-/* module is for target architecture <name> */
+/**
+ * module_arch
+ *
+ * @arch: target architecture
+ *
+ * This module is for target architecture @arch.
+ *
+ * Note that target-dependent modules are tagged automatically, so
+ * this is only needed in case target-independent modules should be
+ * restricted.  Use case example: the ccw bus is implemented by s390x
+ * only.
+ */
 #define module_arch(name) modinfo(arch, name)
 
-/* module registers QemuOpts <name> */
+/**
+ * module_opts
+ *
+ * @name: QemuOpts name
+ *
+ * This module registers QemuOpts @name.
+ */
 #define module_opts(name) modinfo(opts, name)
 
-/*
- * module info database
- *
- * scripts/modinfo-generate.c will build this using the data collected
- * by scripts/modinfo-collect.py
- */
+/* module info database (created by scripts/modinfo-generate.py) */
 typedef struct QemuModinfo QemuModinfo;
 struct QemuModinfo {
     const char *name;
-- 
2.31.1



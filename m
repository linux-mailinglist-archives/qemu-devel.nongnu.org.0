Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 121753C1604
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:31:16 +0200 (CEST)
Received: from localhost ([::1]:57962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Vzf-0007CV-1X
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:31:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vn2-0000jE-M0
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:12 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:37580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vn0-0008G5-F6
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:12 -0400
Received: by mail-ej1-x635.google.com with SMTP id i20so10270377ejw.4
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ACYfEquz/Y0lv0eg/ZgLdCLCLVz6X0RUHqWmwg/DiSE=;
 b=jvCCX14gKNxmQULE2e+qwjc7Bw6kp7FZpCFi7JII7COV7s/HY8CnDRmCpAzL7gF3wp
 eTzIFHVxZz6+hKkkIhuR4TeZEk0Sj4QNSilSnw2torjwtfdw2BgnXoMaDpZSbCKfzaB5
 tJllYdTD1S0j6jWcd8bC3F1xn73yhcr2q79WelY/XcCzowAlFl8B4iGxV7VH18Kp3X/A
 9PydDufUzGQpVD8CsgYDK6QYhRCcZQBdhj0c4HMukK/ubEPzKP3dDhTcj2FX/iixbrrE
 htp+4VeKdjDc5plwzthq2Akq3D+CyyQXDYqkMKkNWcJLOK1aPuC+MoWqPXuMXOO9RXDR
 5TTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ACYfEquz/Y0lv0eg/ZgLdCLCLVz6X0RUHqWmwg/DiSE=;
 b=Hrd7OokiLits7Dy3nU1A33y97I1CLzoyFpWYQli6Wfx2s+OGBpBTqzp2pOIKwdU02J
 a7LTjptTGsCFGOejRI2wOwi9BBZ59MiMFB7tWbfbHqHkUA0SQj5LPRhYbzztCVgTvLag
 FDCRhS9V9qxbvpGClxATsnrrIstYi60+WBA3fWuJfbZFzk1aKD/LXycHVjOGhZ/oM5b4
 3jS1UT/HA6+vklGySZO2BrJaUutoysW/ekuZ6wv1e/8N7PJ/fkalhigvOshiSitviOrZ
 q7/csAI62dTdEcA/qupU0HQSqJP3+msw4EIONxMkLtrdGjEuK6QxSBopnYsji/rQiI8C
 +ugg==
X-Gm-Message-State: AOAM5320MGuLOgUoXtleu9ugz+DqaaU5zbPYcvEviLeEsJunxj8elS7J
 6cTy6vU/QHwbLYMqBTiAa5hvlwHGpiw=
X-Google-Smtp-Source: ABdhPJxe2FR4D6ERJNrML8LrWd2zEUHAZqERACcLQ5SyupfKmAYyCnFjONLK+e5pN3dQ4/y7ZjdUxg==
X-Received: by 2002:a17:906:b851:: with SMTP id
 ga17mr31930218ejb.86.1625757489150; 
 Thu, 08 Jul 2021 08:18:09 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ak16sm1103694ejc.17.2021.07.08.08.18.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:18:08 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 27/48] modules: module.h kerneldoc annotations
Date: Thu,  8 Jul 2021 17:17:27 +0200
Message-Id: <20210708151748.408754-28-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708151748.408754-1-pbonzini@redhat.com>
References: <20210708151748.408754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Jose R . Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Jose R. Ziviani <jziviani@suse.de>
Message-Id: <20210624103836.2382472-24-kraxel@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/module.h | 59 +++++++++++++++++++++++++++++++++----------
 1 file changed, 45 insertions(+), 14 deletions(-)

diff --git a/include/qemu/module.h b/include/qemu/module.h
index 7f4b1af819..8bc80535a4 100644
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




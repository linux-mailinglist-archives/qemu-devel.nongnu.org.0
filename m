Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 367D2391DA2
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 19:13:48 +0200 (CEST)
Received: from localhost ([::1]:38944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llx6J-00073s-89
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 13:13:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llwxv-0006cP-Mp
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:05:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llwxt-0003xk-Jn
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:05:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622048705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3uXX+K1GXf7TrWdaqri3KbXM16p7ZXQ8jRKVT3E8l+g=;
 b=XNOdayGYX72ZcmXqWcZ+uo7PH3MINKlCyIRJG/7z6ipEGb9gvG9JxL8GhcGXxS/cG/78Za
 E+ZnH/OALk78AzrlY5Zb+6liU4hCSzyGOtBnCLIMOHxGFcKYPgVtNkFBTfWRIDII+uyxQR
 r64yfChYrrAmu+cTFHflHV20IRa6agc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-MWbAe25kP6ioY2AldiXzBw-1; Wed, 26 May 2021 13:05:01 -0400
X-MC-Unique: MWbAe25kP6ioY2AldiXzBw-1
Received: by mail-wr1-f71.google.com with SMTP id
 1-20020adf93810000b029010fd5ac4ed7so600348wrp.15
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 10:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3uXX+K1GXf7TrWdaqri3KbXM16p7ZXQ8jRKVT3E8l+g=;
 b=tIzxJcxj2SVuf3p3KL6rjvDCfGAqjMIIP+RKqrwsrLqiX5uyu7WnGOedhtN/Fui1xD
 pZ2w8oHUZdYVEAYripAfkRs+XSxmEkSMQzbIFcCh+K0D1KFLA35TmRYNowNdSEhWMHgl
 cp/gT7URtY4GaOBo+E3qSRiAMI8sQMfakM1tH85OoB3gDBYeiFYf4QB1uwre5k8j926j
 mJjM6qPc4jGlFshvvjD2lKiGE5S4i1Rw9RzOw4boUfqEovdU9FckcX1CiT7Zji21sO08
 VJn8/R8kgjV551aNLwuZdSpJGBQOIreyZzJCA37lnSgRtN6BvU5Fadg3AUVetdsKN8hA
 8+1Q==
X-Gm-Message-State: AOAM531MxUZFTPG71e4A4Dz+LFWH0nkKXFEu3e/zW1WzbgutzKDOh9h6
 ktPYZw2J1zFov/My1CRjoBadm6up6WJ+xBWHiDBL1GPcgKN7jqJULo3g9nClJeU75Z6vHFGziLr
 qSnsoxEEjZSkjKhhapL5xhzlSP9JX065yb2bdUwAcpBPdPoobRqrT9J0pmHkOa+rQ
X-Received: by 2002:adf:fa42:: with SMTP id y2mr33945036wrr.12.1622048699908; 
 Wed, 26 May 2021 10:04:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1cnHw/E71Lh8KfQ4kl/CRqEG9TJdCE27goJKc5KOzwuECBffF+uGm07qXVlNgGBOvKjL72Q==
X-Received: by 2002:adf:fa42:: with SMTP id y2mr33945011wrr.12.1622048699726; 
 Wed, 26 May 2021 10:04:59 -0700 (PDT)
Received: from localhost.localdomain (64.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.64])
 by smtp.gmail.com with ESMTPSA id w12sm20326986wrt.16.2021.05.26.10.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 10:04:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 02/12] accel: Introduce 'query-accels' QMP command
Date: Wed, 26 May 2021 19:04:22 +0200
Message-Id: <20210526170432.343588-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210526170432.343588-1-philmd@redhat.com>
References: <20210526170432.343588-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the 'query-accels' QMP command which returns a list
of built-in accelerator names.

- Accelerator is a QAPI enum of all existing accelerators,

- AcceleratorInfo is a QAPI structure providing accelerator
  specific information. Currently the common structure base
  provides the name of the accelerator, while the specific
  part is empty, but each accelerator can expand it.

- 'query-accels' QMP command returns a list of @AcceleratorInfo

For example on a KVM-only build we get:

    { "execute": "query-accels" }
    {
        "return": [
            {
                "name": "qtest"
            },
            {
                "name": "kvm"
            }
        ]
    }

Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v8:
- Include code snippet from Markus adding to machine-target.json
  to be able to use enum values or union branches conditional.
- Use accel_find() on enum to be sure the accelerator is enabled
  at runtime (chat with jsnow / eblake).

Cc: Eric Blake <eblake@redhat.com>
Cc: John Snow <jsnow@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
---
 qapi/machine-target.json | 54 ++++++++++++++++++++++++++++++++++++++++
 accel/accel-qmp.c        | 32 ++++++++++++++++++++++++
 accel/meson.build        |  2 +-
 3 files changed, 87 insertions(+), 1 deletion(-)
 create mode 100644 accel/accel-qmp.c

diff --git a/qapi/machine-target.json b/qapi/machine-target.json
index e7811654b72..586a61b5d99 100644
--- a/qapi/machine-target.json
+++ b/qapi/machine-target.json
@@ -329,3 +329,57 @@
 ##
 { 'command': 'query-cpu-definitions', 'returns': ['CpuDefinitionInfo'],
   'if': 'defined(TARGET_PPC) || defined(TARGET_ARM) || defined(TARGET_I386) || defined(TARGET_S390X) || defined(TARGET_MIPS)' }
+
+##
+# @Accelerator:
+#
+# An enumeration of accelerator names.
+#
+# Since: 6.1
+##
+{ 'enum': 'Accelerator',
+  'data': [
+      { 'name': 'hax', 'if': 'defined(CONFIG_HAX)' },
+      { 'name': 'hvf', 'if': 'defined(CONFIG_HVF)' },
+      { 'name': 'kvm', 'if': 'defined(CONFIG_KVM)' },
+      { 'name': 'qtest' },
+      { 'name': 'tcg', 'if': 'defined(CONFIG_TCG)' },
+      { 'name': 'whpx', 'if': 'defined(CONFIG_WHPX)' },
+      { 'name': 'xen', 'if': 'defined(CONFIG_XEN_BACKEND)' } ] }
+
+##
+# @AcceleratorInfo:
+#
+# Accelerator information.
+#
+# @name: The accelerator name.
+#
+# Since: 6.1
+##
+{ 'struct': 'AcceleratorInfo',
+  'data': { 'name': 'Accelerator' } }
+
+##
+# @query-accels:
+#
+# Get a list of AcceleratorInfo for all built-in accelerators.
+#
+# Returns: a list of @AcceleratorInfo describing each accelerator.
+#
+# Since: 6.1
+#
+# Example:
+#
+# -> { "execute": "query-accels" }
+# <- { "return": [
+#        {
+#            "name": "qtest"
+#        },
+#        {
+#            "name": "kvm"
+#        }
+#    ] }
+#
+##
+{ 'command': 'query-accels',
+  'returns': ['AcceleratorInfo'] }
diff --git a/accel/accel-qmp.c b/accel/accel-qmp.c
new file mode 100644
index 00000000000..0098297caa5
--- /dev/null
+++ b/accel/accel-qmp.c
@@ -0,0 +1,32 @@
+/*
+ * QEMU accelerators, QMP commands
+ *
+ * Copyright (c) 2021 Red Hat Inc.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/accel.h"
+#include "qapi/qapi-types-machine-target.h"
+#include "qapi/qapi-commands-machine-target.h"
+
+AcceleratorInfoList *qmp_query_accels(Error **errp)
+{
+    AcceleratorInfoList *list = NULL, **tail = &list;
+
+    for (Accelerator accel = 0; accel < ACCELERATOR__MAX; accel++) {
+        AcceleratorInfo *info;
+
+        if (!accel_find(Accelerator_str(accel))) {
+            /* Accelerator available at build time but not at runtime. */
+            continue;
+        }
+
+        info = g_new0(AcceleratorInfo, 1);
+        info->name = accel;
+        QAPI_LIST_APPEND(tail, info);
+    }
+
+    return list;
+}
diff --git a/accel/meson.build b/accel/meson.build
index b44ba30c864..7a48f6d568d 100644
--- a/accel/meson.build
+++ b/accel/meson.build
@@ -1,4 +1,4 @@
-specific_ss.add(files('accel-common.c'))
+specific_ss.add(files('accel-common.c', 'accel-qmp.c'))
 softmmu_ss.add(files('accel-softmmu.c'))
 user_ss.add(files('accel-user.c'))
 
-- 
2.26.3



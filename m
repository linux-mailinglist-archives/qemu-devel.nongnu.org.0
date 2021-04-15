Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A63D8361066
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 18:49:08 +0200 (CEST)
Received: from localhost ([::1]:54624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX5Ax-0004ma-MP
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 12:49:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX4vp-00033W-3z
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:33:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX4vn-00067R-4l
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:33:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618504406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NxYz1h0hu+rZ/LwuHs61u9ZCcyihVB9Q3XHDDjiOe3s=;
 b=GecB4FF/h70/NpUE9jLMOGGGpqOYjYC6vb/R9kahihBfb88yBd9FPm0k/7UE55nBXdZ2Nw
 OdDTfdTAZq62g3h9bGtQHLUtOzWFga3eoDc/K2kRlc6F0ymdMrE75NdZytoXPSlKdgR5PB
 7qqaCwnYdcfA23LqwXsAwdEKDzZkdEY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-598-TQdgCuAkPDe3WtlDeO1UyA-1; Thu, 15 Apr 2021 12:33:24 -0400
X-MC-Unique: TQdgCuAkPDe3WtlDeO1UyA-1
Received: by mail-wr1-f70.google.com with SMTP id
 t14-20020a5d6a4e0000b029010277dcae0fso2986994wrw.22
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 09:33:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NxYz1h0hu+rZ/LwuHs61u9ZCcyihVB9Q3XHDDjiOe3s=;
 b=ei7Whn8E9SFfMREmBOGuEkPh916YLWIyes3vaTQZPfwmpakWPMbaGg6QS/Bd0fVxhh
 0lqr4mOKtq1Ru90MwXAQTKi7bmM475Y0APZ6Qy/gd20HyzUZu07MMBx/ec34XajGUxHG
 Uu73eI2bvM2dRpeBwRqwbNqDWnj4sR7XW/fAkzURr3cgZJ44QMv0yVMIrS70smURXVWS
 3k6K0TYB5cezZFQ5C5AdbRjiIm2cWQSQ5CQodCXnjZTec6Y4y1soTeY3U3SE2eTDDZ3Y
 h/noXLa6CxMx3RNdEsboDREmK4umQ/lkI0bJahlCGe+AF17Y46mzVxosabrlFH428GQ/
 g0nw==
X-Gm-Message-State: AOAM533CQlRPDsv9qtlDYJ9q/yXC20lerHBKHH9eM3nFboLGDNLAMPnp
 9vZO1CtpsgDod88zOpB7qDBYNruFcpfIcy8fKNiBcqfFj8lA91Qu5qtLHbnqBHVyon9/D6RsxGE
 1EiMKBjjH33tLv586Ae0BAtUo+c/XBpYZCEj0nHwgb0Fn18TO+IcBtesqHheQl32E
X-Received: by 2002:a5d:6410:: with SMTP id z16mr3523500wru.40.1618504402354; 
 Thu, 15 Apr 2021 09:33:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7+/CDBXvuwvWMe/2DoJMFX9WGk+8Z0nFYJDUN1t/brTFYJbgMxtcWGJfKfOgm2qb32hIwlg==
X-Received: by 2002:a5d:6410:: with SMTP id z16mr3523455wru.40.1618504402125; 
 Thu, 15 Apr 2021 09:33:22 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id g3sm4369989wrp.46.2021.04.15.09.33.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 09:33:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/12] accel: Introduce 'query-accels' QMP command
Date: Thu, 15 Apr 2021 18:32:54 +0200
Message-Id: <20210415163304.4120052-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210415163304.4120052-1-philmd@redhat.com>
References: <20210415163304.4120052-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>
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

Note that we can't make the enum values or union branches conditional
because of target-specific poisoning of accelerator definitions.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Since v3: Simplify over-engineered AcceleratorInfo (Markus, kept Eric R-b)
Since v2: @since 6.0 -> 6.1, added note (Eric)
Since v1: 'type' -> 'name' in comments
---
 qapi/machine.json | 47 +++++++++++++++++++++++++++++++++++++++++++++
 accel/accel-qmp.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++
 accel/meson.build |  2 +-
 3 files changed, 97 insertions(+), 1 deletion(-)
 create mode 100644 accel/accel-qmp.c

diff --git a/qapi/machine.json b/qapi/machine.json
index 6e90d463fc9..1ef729f6f84 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1274,3 +1274,50 @@
 ##
 { 'event': 'MEM_UNPLUG_ERROR',
   'data': { 'device': 'str', 'msg': 'str' } }
+
+##
+# @Accelerator:
+#
+# An enumeration of accelerator names.
+#
+# Since: 6.1
+##
+{ 'enum': 'Accelerator',
+  'data': [ 'qtest', 'tcg', 'kvm', 'hax', 'hvf', 'whpx', 'xen' ] }
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
index 00000000000..426737b3f9a
--- /dev/null
+++ b/accel/accel-qmp.c
@@ -0,0 +1,49 @@
+/*
+ * QEMU accelerators, QMP commands
+ *
+ * Copyright (c) 2021 Red Hat Inc.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/qapi-commands-machine.h"
+
+static const bool accel_builtin_list[ACCELERATOR__MAX] = {
+    [ACCELERATOR_QTEST] = true,
+#ifdef CONFIG_TCG
+    [ACCELERATOR_TCG] = true,
+#endif
+#ifdef CONFIG_KVM
+    [ACCELERATOR_KVM] = true,
+#endif
+#ifdef CONFIG_HAX
+    [ACCELERATOR_HAX] = true,
+#endif
+#ifdef CONFIG_HVF
+    [ACCELERATOR_HVF] = true,
+#endif
+#ifdef CONFIG_WHPX
+    [ACCELERATOR_WHPX] = true,
+#endif
+#ifdef CONFIG_XEN_BACKEND
+    [ACCELERATOR_XEN] = true,
+#endif
+};
+
+AcceleratorInfoList *qmp_query_accels(Error **errp)
+{
+    AcceleratorInfoList *list = NULL, **tail = &list;
+
+    for (Accelerator accel = 0; accel < ACCELERATOR__MAX; accel++) {
+        if (accel_builtin_list[accel]) {
+            AcceleratorInfo *info = g_new0(AcceleratorInfo, 1);
+
+            info->name = accel;
+
+            QAPI_LIST_APPEND(tail, info);
+        }
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



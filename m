Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA0E184ED4
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Mar 2020 19:43:42 +0100 (CET)
Received: from localhost ([::1]:35288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCpHZ-00034P-KQ
	for lists+qemu-devel@lfdr.de; Fri, 13 Mar 2020 14:43:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58974)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jCpG3-0000zG-9r
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 14:42:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jCpG0-00058v-Rq
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 14:42:06 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:56524
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jCpG0-00058T-OF
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 14:42:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584124924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MMbU/diGS00g0pvlpe3jSpRPWqFNO+dtHJ/d6bVgPlQ=;
 b=G46ggMs8XSW2i//5MqrrsLSH9mZZb8oL2XvPnQL/p9rudW4EC6ckl2cPFr0ixVPeu5CmWj
 aQxpxjcWxKnkiHXOEz3H2VCDZlaZ0CmU67AicQYswxTHzMJI0xT8KKlUpNQDu4onZsTcRS
 w8XA16sS2e4LdUQwyGWcUTPY0tHdOAc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-iWtQSEAQNCGwtL-dSBCN-Q-1; Fri, 13 Mar 2020 14:42:02 -0400
X-MC-Unique: iWtQSEAQNCGwtL-dSBCN-Q-1
Received: by mail-wm1-f70.google.com with SMTP id x7so3305890wmi.4
 for <qemu-devel@nongnu.org>; Fri, 13 Mar 2020 11:42:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=egEt2W36eZavUAEYv8kmj5EFYJaBOLSeei+z/jwYPss=;
 b=Xq2j1aOleR0u0JU0Igq4u+CeDr0niVqLB/P/EXOfA4FaDWpTONqyy/VNBdpDKMpTDc
 PJFGcdtX0aUYwzRlsCvfXSl6Z1DOKt45s6rckbEfMwbpckzBmlMaIFjxjQDl2+/eZD2v
 tKE1D2ulhBvzRMQR4fMjtGccM3n1OoKJHmh4L28jVqa3+1AvJMozMavUxJrMfkVmFa9/
 5DdVvS0VGrj8844OkeZu3RyZLlSico1GRvGf0KvBTOlmylc0EKWokxvVIebDiHL8OK0W
 ZTt37fdXuW+lB4dWPrZO3WFaE0EUKkYwo8HYznnRXHGRQwJ6iMRZk7IBJNsitHtUcqYP
 1RtQ==
X-Gm-Message-State: ANhLgQ2oPgXu4l3cemFTWCURdUoQEhJ1jMcElzom3H3yeN3XKzlpUrRC
 MTSBmXnitTegmsWuUa2tDdd7yg50xNYD5xTYHpB1R/xKk0/GoZUzOBZKotRkEClOaetilkklF3E
 Dfwyd+ha01/WL5WQ=
X-Received: by 2002:adf:ee86:: with SMTP id b6mr18621995wro.282.1584124920291; 
 Fri, 13 Mar 2020 11:42:00 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuLrTORgqCfLm8OnZDa2oFWk8qqCpbXRbSvQucYUkye5joO8VbjQT87mi7dwP+py7FOqeYIqg==
X-Received: by 2002:adf:ee86:: with SMTP id b6mr18621971wro.282.1584124920037; 
 Fri, 13 Mar 2020 11:42:00 -0700 (PDT)
Received: from x1w.redhat.com (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id o5sm19073133wmb.8.2020.03.13.11.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2020 11:41:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/9] target/i386: Restrict X86CPUFeatureWord to X86 targets
Date: Fri, 13 Mar 2020 19:41:45 +0100
Message-Id: <20200313184153.11275-2-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200313184153.11275-1-philmd@redhat.com>
References: <20200313184153.11275-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Ben Warren <ben@skyportsystems.com>, Peter Lieven <pl@kamp.de>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Igor Mammedov <imammedo@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move out x86-specific structures from generic machine code.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 qapi/machine-target.json   | 45 ++++++++++++++++++++++++++++++++++++++
 qapi/machine.json          | 42 -----------------------------------
 target/i386/cpu.c          |  2 +-
 target/i386/machine-stub.c | 22 +++++++++++++++++++
 target/i386/Makefile.objs  |  3 ++-
 5 files changed, 70 insertions(+), 44 deletions(-)
 create mode 100644 target/i386/machine-stub.c

diff --git a/qapi/machine-target.json b/qapi/machine-target.json
index f2c82949d8..fb7a4b7850 100644
--- a/qapi/machine-target.json
+++ b/qapi/machine-target.json
@@ -3,6 +3,51 @@
 # This work is licensed under the terms of the GNU GPL, version 2 or later=
.
 # See the COPYING file in the top-level directory.
=20
+##
+# @X86CPURegister32:
+#
+# A X86 32-bit register
+#
+# Since: 1.5
+##
+{ 'enum': 'X86CPURegister32',
+  'data': [ 'EAX', 'EBX', 'ECX', 'EDX', 'ESP', 'EBP', 'ESI', 'EDI' ],
+  'if': 'defined(TARGET_I386)' }
+
+##
+# @X86CPUFeatureWordInfo:
+#
+# Information about a X86 CPU feature word
+#
+# @cpuid-input-eax: Input EAX value for CPUID instruction for that feature=
 word
+#
+# @cpuid-input-ecx: Input ECX value for CPUID instruction for that
+#                   feature word
+#
+# @cpuid-register: Output register containing the feature bits
+#
+# @features: value of output register, containing the feature bits
+#
+# Since: 1.5
+##
+{ 'struct': 'X86CPUFeatureWordInfo',
+  'data': { 'cpuid-input-eax': 'int',
+            '*cpuid-input-ecx': 'int',
+            'cpuid-register': 'X86CPURegister32',
+            'features': 'int' },
+  'if': 'defined(TARGET_I386)' }
+
+##
+# @DummyForceArrays:
+#
+# Not used by QMP; hack to let us use X86CPUFeatureWordInfoList internally
+#
+# Since: 2.5
+##
+{ 'struct': 'DummyForceArrays',
+  'data': { 'unused': ['X86CPUFeatureWordInfo'] },
+  'if': 'defined(TARGET_I386)' }
+
 ##
 # @CpuModelInfo:
 #
diff --git a/qapi/machine.json b/qapi/machine.json
index 6c11e3cf3a..de05730704 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -505,48 +505,6 @@
    'dst': 'uint16',
    'val': 'uint8' }}
=20
-##
-# @X86CPURegister32:
-#
-# A X86 32-bit register
-#
-# Since: 1.5
-##
-{ 'enum': 'X86CPURegister32',
-  'data': [ 'EAX', 'EBX', 'ECX', 'EDX', 'ESP', 'EBP', 'ESI', 'EDI' ] }
-
-##
-# @X86CPUFeatureWordInfo:
-#
-# Information about a X86 CPU feature word
-#
-# @cpuid-input-eax: Input EAX value for CPUID instruction for that feature=
 word
-#
-# @cpuid-input-ecx: Input ECX value for CPUID instruction for that
-#                   feature word
-#
-# @cpuid-register: Output register containing the feature bits
-#
-# @features: value of output register, containing the feature bits
-#
-# Since: 1.5
-##
-{ 'struct': 'X86CPUFeatureWordInfo',
-  'data': { 'cpuid-input-eax': 'int',
-            '*cpuid-input-ecx': 'int',
-            'cpuid-register': 'X86CPURegister32',
-            'features': 'int' } }
-
-##
-# @DummyForceArrays:
-#
-# Not used by QMP; hack to let us use X86CPUFeatureWordInfoList internally
-#
-# Since: 2.5
-##
-{ 'struct': 'DummyForceArrays',
-  'data': { 'unused': ['X86CPUFeatureWordInfo'] } }
-
 ##
 # @NumaCpuOptions:
 #
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index a84553e50c..0753fe4935 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -37,7 +37,7 @@
 #include "qemu/option.h"
 #include "qemu/config-file.h"
 #include "qapi/error.h"
-#include "qapi/qapi-visit-machine.h"
+#include "qapi/qapi-visit-machine-target.h"
 #include "qapi/qapi-visit-run-state.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qerror.h"
diff --git a/target/i386/machine-stub.c b/target/i386/machine-stub.c
new file mode 100644
index 0000000000..cb301af057
--- /dev/null
+++ b/target/i386/machine-stub.c
@@ -0,0 +1,22 @@
+/*
+ * QAPI x86 CPU features stub
+ *
+ * Copyright (c) 2020 Red Hat, Inc.
+ *
+ * Author:
+ *   Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qapi/qapi-visit-machine-target.h"
+
+void visit_type_X86CPUFeatureWordInfoList(Visitor *v, const char *name,
+                                      X86CPUFeatureWordInfoList **obj,
+                                      Error **errp)
+{
+}
diff --git a/target/i386/Makefile.objs b/target/i386/Makefile.objs
index 48e0c28434..1cdfc9f50c 100644
--- a/target/i386/Makefile.objs
+++ b/target/i386/Makefile.objs
@@ -17,6 +17,7 @@ obj-$(CONFIG_HAX) +=3D hax-all.o hax-mem.o hax-posix.o
 endif
 obj-$(CONFIG_HVF) +=3D hvf/
 obj-$(CONFIG_WHPX) +=3D whpx-all.o
-endif
+endif # CONFIG_SOFTMMU
 obj-$(CONFIG_SEV) +=3D sev.o
 obj-$(call lnot,$(CONFIG_SEV)) +=3D sev-stub.o
+obj-$(call lnot,$(CONFIG_SOFTMMU)) +=3D machine-stub.o
--=20
2.21.1



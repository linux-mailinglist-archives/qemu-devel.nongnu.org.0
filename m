Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD551860BF
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 01:23:23 +0100 (CET)
Received: from localhost ([::1]:60650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDdXM-0002Wj-E1
	for lists+qemu-devel@lfdr.de; Sun, 15 Mar 2020 20:23:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50020)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jDdEh-0005Uw-Mk
 for qemu-devel@nongnu.org; Sun, 15 Mar 2020 20:04:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jDdEg-0000fe-93
 for qemu-devel@nongnu.org; Sun, 15 Mar 2020 20:04:03 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:57012
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jDdEg-0000d2-59
 for qemu-devel@nongnu.org; Sun, 15 Mar 2020 20:04:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584317041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AYi+AQJNRazdsNeUR0yPxUEV7hTHsjPmGgUWtXU2qgA=;
 b=CGVv5x5ZgSQrJNJtyQN3Y9LWhPUJo4aj3SKOuvsfw7FwmPfD1GHONF+WGAFy/MRDWP+2BA
 Yj7C8cNkLec+isV/P3q3uPx+3e1yS3KiLvyWNPDLLO/iGLoWopIYaCj7MAW16y6mejD93I
 ZTWXK2FywzudSW4aad+4HdmeuVQ+Ehs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-RpqUfw6_NpOerphFR4Xajg-1; Sun, 15 Mar 2020 20:03:59 -0400
X-MC-Unique: RpqUfw6_NpOerphFR4Xajg-1
Received: by mail-wr1-f71.google.com with SMTP id s4so2723362wrb.19
 for <qemu-devel@nongnu.org>; Sun, 15 Mar 2020 17:03:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3gQwWJ04PppyimNpXPOyqaqOtjbzf9sfLB9iKaREjik=;
 b=cip3LCjaX5P6+bJokdcLJR+0k8Klk3oxuH80Tv1cfc0dh//0dxyDKkUlmArDAoEPe6
 bc4Nz+otgYFVW7DNITapJHavcHFHw1Hdl9wXoVjaPIDLc55mKCiq1oPSuAhuuOOvXQcP
 UxCeqXWW+TjwDbTCU83kL1fI+x/pdC5pMOlvAfIkvYrmnyx30JDsxh5q0mLFqOZ5o1fv
 QXC175jKoi1F+zBCu+SwjtWQo/8ZuRDuWtVZfe7PpfdFqUXMlMPgz8swMeqWNaEqQOeO
 46bbJZF1jrgbQOWb9bJmCK5hd0kLVDtr3AWz2A+FSWbf2WS5KYLBUZCINDSxTptLmHPB
 pyzA==
X-Gm-Message-State: ANhLgQ2457NcBVrIyegmtjg0TgoH+KmRoRrGEVHSicJAW8yI3zkvyg8K
 /0jhLyONBje+oHojCvIPz//0LPh6da6UKKojNjpsA/IUT+YS8OeUO9oSzh6OeY3aTjbsGSy3UGp
 6wD2KRlYddPRN2sA=
X-Received: by 2002:adf:b1d2:: with SMTP id r18mr30594146wra.86.1584317038278; 
 Sun, 15 Mar 2020 17:03:58 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vs57CIc4cfIwRdodJub2JqPW2Nfc9eopczHBFdj1k/5QBswdShbdLFHQ+cT1aZu/UDlxDpSow==
X-Received: by 2002:adf:b1d2:: with SMTP id r18mr30594126wra.86.1584317037982; 
 Sun, 15 Mar 2020 17:03:57 -0700 (PDT)
Received: from localhost.localdomain (191.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.191])
 by smtp.gmail.com with ESMTPSA id c26sm26931384wmb.8.2020.03.15.17.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2020 17:03:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/8] target/i386: Restrict X86CPUFeatureWord to X86 targets
Date: Mon, 16 Mar 2020 01:03:41 +0100
Message-Id: <20200316000348.29692-2-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316000348.29692-1-philmd@redhat.com>
References: <20200316000348.29692-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
 Eduardo Habkost <ehabkost@redhat.com>, Ben Warren <ben@skyportsystems.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Lieven <pl@kamp.de>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move out x86-specific structures from generic machine code.

Acked-by: Richard Henderson <richard.henderson@linaro.org>
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



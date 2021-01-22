Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC97300E24
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 21:52:06 +0100 (CET)
Received: from localhost ([::1]:55932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l33PZ-0002G0-9I
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 15:52:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l33JR-0005TQ-8j
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:45:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l33JL-0002tC-GT
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:45:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611348338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cxJdntCxJ3BjqvkWrgOloscdbx5pYTRX48FDf3Cb8HY=;
 b=N1xJppUZdvMalv7/8hhrDra/PbyYJ3+qM0NCvxHQ8zPrLeWCP1vSgkEylTaJzKKzb2pmRu
 QizGbQf5PkGdcRJAQb+pWqr1qJ9QKoUA4/Yp/p7gbmIrSTIivxD+U4pEemMu5aaaFpCJhB
 qmM0MKm/33DLz4NZE/OYIfActE/SMfw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186--MMTNVxoM3uTna0SueucZw-1; Fri, 22 Jan 2021 15:45:37 -0500
X-MC-Unique: -MMTNVxoM3uTna0SueucZw-1
Received: by mail-ed1-f71.google.com with SMTP id a24so3495067eda.14
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 12:45:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cxJdntCxJ3BjqvkWrgOloscdbx5pYTRX48FDf3Cb8HY=;
 b=iuE7t9gxWSEGGHshmFyUI8DE3DeUcvVx/pPxTq7qUNBQAVshigPQMV2MAg+N4PAxui
 MqKZ12z89MyKPq+2ksSBqH1iXF/c2+2OT7/cgnX2VddqOiHP0G8FpMjcf3S87F5jl6J3
 v/I20IDtB5Z0G95dwOca7TjTcANEy4MXWT/VPDWjMzHe1zrSsiUjIPr3eQINJ7dXpHW7
 bjc9Hd+5GgYT8lWKTcvWzw3i6flGryaG8wLYSl6uB4uJ+BVVnfsvFRjHBaiOJJFG91o6
 N25d/La4lyJhrzrAv987aPWsS01rqYgN9XaPOtvWpINQDH0zhLNT1KFbn4aXumRuHt6f
 Eqbw==
X-Gm-Message-State: AOAM532U5kZUQzGM5lKE3kVYdIG3/Ay0wXl84gaXpieDI5lhKXKtIN54
 smmyV4g2DOiWfzSxUMvi8aMponZ+TYMzedzmMHNYoUYMG9IiofehYK3HkOOLrQN/z1CAdZcJL4A
 aJXxYlFn9+tnXwPUiDmn035NkOwO/3uXxZgMG21V4FPAfVZiZZ96oZRk7I5LqG7rY
X-Received: by 2002:a05:6402:3553:: with SMTP id
 f19mr4648167edd.271.1611348333321; 
 Fri, 22 Jan 2021 12:45:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJylG3PQPMZ+pmhjaJnFVCvdbv4ETZsUHLRN7de/wqP9aSq+Sp3Aq6Nu3qOMsUHoUuX5l2j/Eg==
X-Received: by 2002:a05:6402:3553:: with SMTP id
 f19mr4648148edd.271.1611348333137; 
 Fri, 22 Jan 2021 12:45:33 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id f9sm6171331edm.6.2021.01.22.12.45.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 12:45:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 09/12] qapi/meson: Restrict qdev code to system-mode
 emulation
Date: Fri, 22 Jan 2021 21:44:38 +0100
Message-Id: <20210122204441.2145197-10-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210122204441.2145197-1-philmd@redhat.com>
References: <20210122204441.2145197-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Beside a CPU device, user-mode emulation doesn't access
anything else from qdev subsystem.

Tools don't need anything from qdev.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Cc: Laurent Vivier <laurent@vivier.eu>
Cc: Eduardo Habkost <ehabkost@redhat.com>
---
 stubs/qdev.c      | 23 +++++++++++++++++++++++
 MAINTAINERS       |  1 +
 qapi/meson.build  |  6 +++++-
 stubs/meson.build |  2 ++
 4 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 stubs/qdev.c

diff --git a/stubs/qdev.c b/stubs/qdev.c
new file mode 100644
index 00000000000..92e61431344
--- /dev/null
+++ b/stubs/qdev.c
@@ -0,0 +1,23 @@
+/*
+ * QOM stubs
+ *
+ * Copyright (c) 2021 Red Hat, Inc.
+ *
+ * Author:
+ *   Philippe Mathieu-Daudé <philmd@redhat.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/qapi-events-qdev.h"
+
+void qapi_event_send_device_deleted(bool has_device,
+                                    const char *device,
+                                    const char *path)
+{
+    /* Nothing to do. */
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index 34359a99b8e..d2dd7c24228 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2523,6 +2523,7 @@ F: qapi/qom.json
 F: qapi/qdev.json
 F: scripts/coccinelle/qom-parent-type.cocci
 F: softmmu/qdev-monitor.c
+F: stubs/qdev.c
 F: qom/
 F: tests/check-qom-interface.c
 F: tests/check-qom-proplist.c
diff --git a/qapi/meson.build b/qapi/meson.build
index ab68e7900e4..2839871b478 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -35,7 +35,6 @@
   'misc-target',
   'net',
   'pragma',
-  'qdev',
   'pci',
   'qom',
   'rdma',
@@ -49,6 +48,11 @@
   'ui',
   'yank',
 ]
+if have_system
+  qapi_all_modules += [
+    'qdev',
+  ]
+endif
 
 qapi_storage_daemon_modules = [
   'block-core',
diff --git a/stubs/meson.build b/stubs/meson.build
index 1a656cd0704..a054d5877fb 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -53,4 +53,6 @@
 if have_system
   stub_ss.add(files('semihost.c'))
   stub_ss.add(files('xen-hw-stub.c'))
+else
+  stub_ss.add(files('qdev.c'))
 endif
-- 
2.26.2



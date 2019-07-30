Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9787E7B060
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jul 2019 19:42:53 +0200 (CEST)
Received: from localhost ([::1]:35242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsW9E-0001Su-Lj
	for lists+qemu-devel@lfdr.de; Tue, 30 Jul 2019 13:42:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35619)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mehta.aaru20@gmail.com>) id 1hsW2V-0004za-1Y
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 13:35:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mehta.aaru20@gmail.com>) id 1hsW2T-0000Cg-7d
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 13:35:54 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:38981)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mehta.aaru20@gmail.com>)
 id 1hsW2T-0000CE-2N; Tue, 30 Jul 2019 13:35:53 -0400
Received: by mail-pg1-x541.google.com with SMTP id u17so30423368pgi.6;
 Tue, 30 Jul 2019 10:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A+f1nTAYThN43NLD0uFt8nEj4oW9MitsnNvRn4dZPNs=;
 b=iEvjzGuYgahHWT1Z3PIRJl/R9ajdp30ubHk9xsq76TkimbsYzRGfnX6YfC5MvbrayB
 iKP8ffwy1HSAytSpToGhcbmoHxnerHFpZkuHZE0ER0E26pdeV14fcowI1flaa3vjwnWP
 KPL6Ty3df1TGm6sIA0YSZ474zx9bS34fRoNLOe9LXiCfROKtgIq5l3wpiTui4/rwF6dk
 0jl5ukFY7Z4IcmX9FbzqyQFQPICljUUe42IQ8m2KzpGWq+7yaIN4jRl1ThrtdQOX2LU7
 ODHUBukN+saMmuBPFKf6zDGu+b/rrqE7F/O+qC0dN99mk+SP/NHOfCGx6ASYSY/5mGFh
 v72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A+f1nTAYThN43NLD0uFt8nEj4oW9MitsnNvRn4dZPNs=;
 b=W7RK0fyupHNH9IfK1yIAUvD24NhpFSOl8NCOf8b44S91xz1vWwOOKMjbn8w+cZtPRw
 5/B7eYJf3aDxWmeQq/nrMtR89wWZBoAscNeucJkGB1ezFeGe7uBfJe23ZwAiV9tTd5GG
 H7A9BQAGzU7l82I93vicvnDNel/VzlAAxcAMf5D0sXxTTmbQyVDPL0jkc1zQ9ohrZUQl
 74xsnPwH6qfBE1jt/jELKbfP3WVed3DPTg/0kmnYEnsdx5sp+AMwuLibhgvEBNikoelE
 0T/9h3unXHE7qha2kGQ6Dlxy5AMI3GJHAgSQYEJXphYMZa9VOY6BRtBCkOdqKUwm+GIt
 lOJw==
X-Gm-Message-State: APjAAAXaA+Fh/tDpjFras5JovdN6p96saawkJUju/RIeaM9dg9xuu7KI
 XLZL9X5r0bZ/6GjqkgKSXxZZGSCeujpT7w==
X-Google-Smtp-Source: APXvYqwzZFj3rRlwa8lFyoT2yc4Ndyp7IdpMr3rwZTLSSuPV8lO0dsY01HSoWEh7qqiCJ4xCLYTyNQ==
X-Received: by 2002:a17:90a:380d:: with SMTP id
 w13mr115837061pjb.138.1564508150964; 
 Tue, 30 Jul 2019 10:35:50 -0700 (PDT)
Received: from localhost.localdomain ([136.233.9.97])
 by smtp.gmail.com with ESMTPSA id q24sm59122895pjp.14.2019.07.30.10.35.45
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 30 Jul 2019 10:35:50 -0700 (PDT)
From: Aarushi Mehta <mehta.aaru20@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue, 30 Jul 2019 23:04:30 +0530
Message-Id: <20190730173441.26486-6-mehta.aaru20@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190730173441.26486-1-mehta.aaru20@gmail.com>
References: <20190730173441.26486-1-mehta.aaru20@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: [Qemu-devel] [PATCH v8 05/16] stubs: add stubs for io_uring
 interface
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Sergio Lopez <slp@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 saket.sinha89@gmail.com, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefan@redhat.com>, Julia Suvorova <jusual@mail.ru>,
 Aarushi Mehta <mehta.aaru20@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Aarushi Mehta <mehta.aaru20@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 MAINTAINERS         |  1 +
 stubs/Makefile.objs |  1 +
 stubs/io_uring.c    | 32 ++++++++++++++++++++++++++++++++
 3 files changed, 34 insertions(+)
 create mode 100644 stubs/io_uring.c

diff --git a/MAINTAINERS b/MAINTAINERS
index be688fcd5e..bca5de7d6c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2536,6 +2536,7 @@ R: Stefan Hajnoczi <stefan@redhat.com>
 L: qemu-block@nongnu.org
 S: Maintained
 F: block/io_uring.c
+F: stubs/io_uring.c
 
 qcow2
 M: Kevin Wolf <kwolf@redhat.com>
diff --git a/stubs/Makefile.objs b/stubs/Makefile.objs
index 9c7393b08c..5cf160a9c8 100644
--- a/stubs/Makefile.objs
+++ b/stubs/Makefile.objs
@@ -13,6 +13,7 @@ stub-obj-y += iothread.o
 stub-obj-y += iothread-lock.o
 stub-obj-y += is-daemonized.o
 stub-obj-$(CONFIG_LINUX_AIO) += linux-aio.o
+stub-obj-$(CONFIG_LINUX_IO_URING) += io_uring.o
 stub-obj-y += machine-init-done.o
 stub-obj-y += migr-blocker.o
 stub-obj-y += change-state-handler.o
diff --git a/stubs/io_uring.c b/stubs/io_uring.c
new file mode 100644
index 0000000000..622d1e4648
--- /dev/null
+++ b/stubs/io_uring.c
@@ -0,0 +1,32 @@
+/*
+ * Linux io_uring support.
+ *
+ * Copyright (C) 2009 IBM, Corp.
+ * Copyright (C) 2009 Red Hat, Inc.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+#include "qemu/osdep.h"
+#include "block/aio.h"
+#include "block/raw-aio.h"
+
+void luring_detach_aio_context(LuringState *s, AioContext *old_context)
+{
+    abort();
+}
+
+void luring_attach_aio_context(LuringState *s, AioContext *new_context)
+{
+    abort();
+}
+
+LuringState *luring_init(Error **errp)
+{
+    abort();
+}
+
+void luring_cleanup(LuringState *s)
+{
+    abort();
+}
-- 
2.21.0



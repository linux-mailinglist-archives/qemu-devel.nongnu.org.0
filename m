Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7876299E0
	for <lists+qemu-devel@lfdr.de>; Fri, 24 May 2019 16:15:14 +0200 (CEST)
Received: from localhost ([127.0.0.1]:55308 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hUAyY-0003mn-0K
	for lists+qemu-devel@lfdr.de; Fri, 24 May 2019 10:15:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40414)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mehta.aaru20@gmail.com>) id 1hUAoF-0003KZ-FB
	for qemu-devel@nongnu.org; Fri, 24 May 2019 10:04:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mehta.aaru20@gmail.com>) id 1hUAnw-0002YT-1d
	for qemu-devel@nongnu.org; Fri, 24 May 2019 10:04:17 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:39268)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mehta.aaru20@gmail.com>)
	id 1hUAnv-0002Y9-SF; Fri, 24 May 2019 10:04:15 -0400
Received: by mail-pf1-x443.google.com with SMTP id z26so5400650pfg.6;
	Fri, 24 May 2019 07:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FCCo4ZKd5wKU/RZQx2PmB632H55T8NWp+BdOu+4KPVU=;
	b=as+Vk1dQb/OXplBcCrodEcfjzrOyUFTkmKNpRxw4yv6TfUS5817UwshGDj0XJ6ejnM
	9+ioAfKcEBh7hWfuzfrzaeimZSP183So3K2xgOBvf2HvS2mv64ogRTgzP2mAonU/TgMp
	qKXaqD/Ii1f/FqshcpBCxukvQFy4BqZDUCgmfyfKVXY4UWEZXhsmXl1YEtJIjCrkji3x
	ELwQPsQvwBt1oFOeMW6FQgejkECNLrBVhWDgSx3kgb22PLsCDaaKddiV95mMvTBlES9L
	4zrPrSbKD/tjuwPtCnyO5+2dLmPMZ0VOBgpS92vYTxFP5bZR3iHZM1paYvMWCBvDNxt2
	X4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=FCCo4ZKd5wKU/RZQx2PmB632H55T8NWp+BdOu+4KPVU=;
	b=Z6eo/z18iDMw/CLxIYhmK/Y643IYUbyw9HJynLSJUGuEDCf2yJb7WqhfTUh1s86r95
	WmIMgt/HeOqUtHpS12ll3WQkPh0l8rVL3ZGRmKy+n2WIz6hm7v4f1ghH1sEgb8++23Dl
	VSBh5M2U7WucgRIWjX0tWZkUz3EwbPCVJAw4FMnURzi6fhwNiwsebnOAsm5HJZk1aiQV
	4HPd+jTK5AV5rB/8qTpd4TyXGrIZ/3D0YrK78W12v8gRX4mACyJ0A4SljRk1/VeHv1FM
	UU5DBHo7Kft6JyWPmd4ze85WvWsK+5Wi+AukWN/9vPDHUMMJsvxDpmSGYMV39a3aNEc2
	ofqw==
X-Gm-Message-State: APjAAAW2eLTenmYS1/dq7CSYBnfqe0Za4yVr6LqTFx1Wp/eVZZTIq1nr
	FIA5k58uKIzxGcStQPO5b2GNoDPXslUbTQ==
X-Google-Smtp-Source: APXvYqyblh9DSPxCfWtwBOq4be18VYrZfmBpEm3WGqUYA9EKA1eo8NqDaKBKhFGyKgiknrfFTbWuRg==
X-Received: by 2002:a17:90a:6348:: with SMTP id
	v8mr9485166pjs.34.1558706654512; 
	Fri, 24 May 2019 07:04:14 -0700 (PDT)
Received: from localhost.localdomain ([120.57.120.132])
	by smtp.gmail.com with ESMTPSA id
	u11sm2556766pfh.130.2019.05.24.07.04.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 May 2019 07:04:13 -0700 (PDT)
From: Aarushi Mehta <mehta.aaru20@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri, 24 May 2019 19:33:32 +0530
Message-Id: <20190524140337.13415-5-mehta.aaru20@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190524140337.13415-1-mehta.aaru20@gmail.com>
References: <20190524140337.13415-1-mehta.aaru20@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: [Qemu-devel] [RFC PATCH v2 4/9] stubs: add aio interface stubs for
 io_uring
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
	saket.sinha89@gmail.com, Stefan Hajnoczi <stefanha@redhat.com>,
	Julia Suvorova <jusual@mail.ru>, Aarushi Mehta <mehta.aaru20@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Aarushi Mehta <mehta.aaru20@gmail.com>
---
 MAINTAINERS         | 10 ++++++++++
 stubs/Makefile.objs |  1 +
 stubs/io_uring.c    | 32 ++++++++++++++++++++++++++++++++
 3 files changed, 43 insertions(+)
 create mode 100644 stubs/io_uring.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 3cacd751bf..b8fc1e3fe3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2504,6 +2504,16 @@ F: block/file-posix.c
 F: block/file-win32.c
 F: block/win32-aio.c

+Linux io_uring
+M: Aarushi Mehta <mehta.aaru20@gmail.com>
+R: Stefan Hajnoczi <stefan@redhat.com>
+L: qemu-block@nongnu.org
+S: Maintained
+F: stubs/io_uring.c
+
+
+L: qemu-block@nongnu.original
+
 qcow2
 M: Kevin Wolf <kwolf@redhat.com>
 M: Max Reitz <mreitz@redhat.com>
diff --git a/stubs/Makefile.objs b/stubs/Makefile.objs
index 73452ad265..ea158cf0ee 100644
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
2.17.1


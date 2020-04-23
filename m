Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D311B6558
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Apr 2020 22:24:00 +0200 (CEST)
Received: from localhost ([::1]:39870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRiO7-0000Se-6B
	for lists+qemu-devel@lfdr.de; Thu, 23 Apr 2020 16:23:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55394)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRiM9-00056e-2k
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 16:21:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRiM8-0003da-BW
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 16:21:56 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44439
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jRiM7-0003dT-W2
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 16:21:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587673314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aOyVErqFCmyf9pd+Nr+epVzmP7eWXaoL84ISysXFv0Q=;
 b=Zln9NDJphptNcX3TP8SNVTX5xwA2AhSk8Z4d3viMP3xpCVfi4griM5C434x/eEHdIyrAze
 glBMYYh6XDAdWf8pXOZZPSWXGBoG1P5UEUQCFSq/BRfYa+JH8VKY8H8vUYI73qXhswRrnQ
 zOujGeDw+8o9RMi4R5iBmYfCbnnCDvc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-Jw5aTiasMhqOwhfWO5B5eA-1; Thu, 23 Apr 2020 16:21:53 -0400
X-MC-Unique: Jw5aTiasMhqOwhfWO5B5eA-1
Received: by mail-wr1-f72.google.com with SMTP id v9so3380384wrt.7
 for <qemu-devel@nongnu.org>; Thu, 23 Apr 2020 13:21:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8gYfBqFeTywo96T3GTdB1ETByq33AuAVSUY1XmaFyaw=;
 b=LgYPmQxL4iyho6dE3VUMLdfZYNnnu6rUQ64GGSeQCjRt1/ZRRc9Hx2tlQMd2ytGHPl
 /mNtEwHp7hp6c1Bd2hJq8Uh3Gvl8u1yMTLvwzq5WeG+C3W/BlKU1QdF0Ep3hSx27dfPL
 FaOGx8FSnSINrletJoIfxXavy+Zq+j0orrd8Ir5mA8JqOUkWEtVSfu4R0rh0Bx1qM2PV
 ZS25gcRVJIOInFPJI0OQrgjl9p4tQj1+lhOr2exLb4cKo0L0WPX+sZWmY1FiqVdYoJb1
 4wrX+/YH+UbLHMNzOtKexRj/36s/olKWkwd+OiArOzKuQOijp7o+ir4PncJqJPYzNloa
 EDgg==
X-Gm-Message-State: AGi0PubdnMNwPUKed84HGtqS60SdD2YSLH5WzMvq3z9JEiPdCZBHcJ4r
 e4fSwQoY5rpajs61IgCgrza+CMkcO7Fhn2RFbAJfWyNvTK6RltWBL91KhmyioN13FDornmfqnYJ
 S74ZQuqYwuS8YOB0=
X-Received: by 2002:a7b:c7d2:: with SMTP id z18mr6191719wmk.72.1587673311684; 
 Thu, 23 Apr 2020 13:21:51 -0700 (PDT)
X-Google-Smtp-Source: APiQypLrHSHmXL1n+qmnOhiwmPwsBhOEScKtOKHLfqMligKeD1o9ZGj3ONDh33mP0lG3nxN3nRqrUw==
X-Received: by 2002:a7b:c7d2:: with SMTP id z18mr6191700wmk.72.1587673311445; 
 Thu, 23 Apr 2020 13:21:51 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id a67sm5423740wmc.30.2020.04.23.13.21.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 13:21:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/7] stubs: Split machine-init-done as machine-init and
 machine-notify
Date: Thu, 23 Apr 2020 22:21:11 +0200
Message-Id: <20200423202112.644-7-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200423202112.644-1-philmd@redhat.com>
References: <20200423202112.644-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/23 16:21:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As the machine notify handlers are only used in system emulation,
split the current file in two, and only build the notifier when
system emulation is used.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 stubs/machine-init.c                            | 4 ++++
 stubs/{machine-init-done.c =3D> machine-notify.c} | 2 --
 stubs/Makefile.objs                             | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)
 create mode 100644 stubs/machine-init.c
 rename stubs/{machine-init-done.c =3D> machine-notify.c} (78%)

diff --git a/stubs/machine-init.c b/stubs/machine-init.c
new file mode 100644
index 0000000000..7622930ee0
--- /dev/null
+++ b/stubs/machine-init.c
@@ -0,0 +1,4 @@
+#include "qemu/osdep.h"
+#include "sysemu/sysemu.h"
+
+bool machine_init_done =3D true;
diff --git a/stubs/machine-init-done.c b/stubs/machine-notify.c
similarity index 78%
rename from stubs/machine-init-done.c
rename to stubs/machine-notify.c
index cd8e81392d..d164ecccb9 100644
--- a/stubs/machine-init-done.c
+++ b/stubs/machine-notify.c
@@ -1,8 +1,6 @@
 #include "qemu/osdep.h"
 #include "sysemu/sysemu.h"
=20
-bool machine_init_done =3D true;
-
 void qemu_add_machine_init_done_notifier(Notifier *notify)
 {
 }
diff --git a/stubs/Makefile.objs b/stubs/Makefile.objs
index 45be5dc0ed..765659a3f9 100644
--- a/stubs/Makefile.objs
+++ b/stubs/Makefile.objs
@@ -15,7 +15,8 @@ stub-obj-y +=3D iothread-lock.o
 stub-obj-y +=3D is-daemonized.o
 stub-obj-$(CONFIG_LINUX_AIO) +=3D linux-aio.o
 stub-obj-$(CONFIG_LINUX_IO_URING) +=3D io_uring.o
-stub-obj-y +=3D machine-init-done.o
+stub-obj-y +=3D machine-init.o
+stub-obj-$(CONFIG_SOFTMMU) +=3D machine-notify.o
 stub-obj-y +=3D migr-blocker.o
 stub-obj-y +=3D change-state-handler.o
 stub-obj-y +=3D monitor.o
--=20
2.21.1



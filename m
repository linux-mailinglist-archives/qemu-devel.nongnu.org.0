Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E6C12D953
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Dec 2019 14:58:13 +0100 (CET)
Received: from localhost ([::1]:42862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1imI2G-0007Xd-R2
	for lists+qemu-devel@lfdr.de; Tue, 31 Dec 2019 08:58:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57615)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1imHCj-0006Dz-CN
 for qemu-devel@nongnu.org; Tue, 31 Dec 2019 08:04:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1imHCi-0005GK-2d
 for qemu-devel@nongnu.org; Tue, 31 Dec 2019 08:04:57 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:50010
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1imHCh-0005Dl-Tf
 for qemu-devel@nongnu.org; Tue, 31 Dec 2019 08:04:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577797495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L4FIU7l8aHF+JOoUTi8oH5RPAOXgLNMJ1yy3YOAblVo=;
 b=QnPdRT8l4G7Em+HCl+IQtl+w/LvIAU+kC1hVZtLiptVcp+S/ZqILJL5D9WFbX/P/qEzmm8
 K/sQNhsTUPXQ90anauBEZS6VspwAl7Kg5SfRBxdiscmznlNK2dwO156eML9UckF+vKxwnh
 CcPBG5M4f443GhgMvZQsJLQWTagAZgU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-1yzh4JCjPxCLd0GBoDYIGg-1; Tue, 31 Dec 2019 08:04:54 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D54D800D4E
 for <qemu-devel@nongnu.org>; Tue, 31 Dec 2019 13:04:53 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B8962620A6
 for <qemu-devel@nongnu.org>; Tue, 31 Dec 2019 13:04:52 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 79/86] make mem_path local variable
Date: Tue, 31 Dec 2019 14:04:03 +0100
Message-Id: <1577797450-88458-80-git-send-email-imammedo@redhat.com>
In-Reply-To: <1577797450-88458-1-git-send-email-imammedo@redhat.com>
References: <1577797450-88458-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 1yzh4JCjPxCLd0GBoDYIGg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's no longer used anywhere beside main(),
so make it local variable that is used for CLI compat
purposes to keep -mem-path option working.

Under hood QEMU will use it to create
  memory-backend-file,mem-path=3D...
backend and use its MemoryRegion as main RAM.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 include/sysemu/sysemu.h | 1 -
 vl.c                    | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 80c57fd..8de9065 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -53,7 +53,6 @@ extern uint8_t *boot_splash_filedata;
 extern bool enable_mlock;
 extern bool enable_cpu_pm;
 extern QEMUClockType rtc_clock;
-extern const char *mem_path;
 extern int mem_prealloc;
=20
 #define MAX_OPTION_ROMS 16
diff --git a/vl.c b/vl.c
index 60dffb4..4ee14f6 100644
--- a/vl.c
+++ b/vl.c
@@ -140,7 +140,6 @@ enum vga_retrace_method vga_retrace_method =3D VGA_RETR=
ACE_DUMB;
 int display_opengl;
 const char* keyboard_layout =3D NULL;
 ram_addr_t ram_size;
-const char *mem_path =3D NULL;
 int mem_prealloc =3D 0; /* force preallocation of physical target memory *=
/
 bool enable_mlock =3D false;
 bool enable_cpu_pm =3D false;
@@ -2868,6 +2867,7 @@ int main(int argc, char **argv, char **envp)
     Error *err =3D NULL;
     bool list_data_dirs =3D false;
     char *dir, **dirs;
+    const char *mem_path =3D NULL;
     BlockdevOptionsQueue bdo_queue =3D QSIMPLEQ_HEAD_INITIALIZER(bdo_queue=
);
     QemuPluginList plugin_list =3D QTAILQ_HEAD_INITIALIZER(plugin_list);
=20
--=20
2.7.4



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DF113D944
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jan 2020 12:45:00 +0100 (CET)
Received: from localhost ([::1]:40396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1is3a7-0008Gh-4O
	for lists+qemu-devel@lfdr.de; Thu, 16 Jan 2020 06:44:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56907)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1is3Z9-0007k6-6l
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 06:44:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1is3Z4-0000rj-2P
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 06:43:57 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:27114
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1is3Z3-0000rM-Uk
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 06:43:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579175033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cyOezF3QCcWjBk5RuK5OHcuACdjuHTsHms5krZNBTco=;
 b=QJIC0bYYsn0kbONdvnBH+rifAevy3xgEeKcX34rhW8YOBndQFaSqxeevKCENyvQdn8s73r
 GqeHoex2Rcul2Ju37GyACss+t3c8gd2co29h97at3mCxKTrdt7b5TqE9Tk5NHhlLc7uTJh
 BHMsgWO7EApHMPX5s0FuLV0OM0FMnlY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-PJeiR2xMMw-eneHGpmqZEg-1; Thu, 16 Jan 2020 06:43:51 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01FD110054E3;
 Thu, 16 Jan 2020 11:43:50 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-187.brq.redhat.com [10.40.205.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 222F58886E;
 Thu, 16 Jan 2020 11:43:41 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] Makefile: Keep trace-events-subdirs ordered
Date: Thu, 16 Jan 2020 12:43:39 +0100
Message-Id: <20200116114339.30670-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: PJeiR2xMMw-eneHGpmqZEg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Adding the same directory multiple times to trace-events-subdirs
might trigger build failures, in particular when using the LTTng
Userspace Tracer library as backend.

For example when using two times the hw/core/ directory:

    $ ./configure --enable-trace-backends=3Dust && make
   [...]
     CC      trace-ust-all.o
   In file included from trace-ust-all.h:13,
                    from trace-ust-all.c:13:
   trace-ust-all.h:35151:1: error: redefinition of =E2=80=98__tracepoint_cb=
_qemu___loader_write_rom=E2=80=99
   35151 | TRACEPOINT_EVENT(
         | ^~~~~~~~~~~~~~~~
   trace-ust-all.h:31791:1: note: previous definition of =E2=80=98__tracepo=
int_cb_qemu___loader_write_rom=E2=80=99 was here
   31791 | TRACEPOINT_EVENT(
         | ^~~~~~~~~~~~~~~~

To ease review and reduce likelihood of merge failures (see [*]),
keep trace-events-subdirs ordered when possible, following eb7ccb3c0.

[*] https://www.mail-archive.com/qemu-devel@nongnu.org/msg671007.html
    Duplicate trace-events-subdirs entries generates duplicated
    symbols when using the LTTng Userspace Tracer library.

Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: Add build log error in commit description (lvivier)

"Fixes: 26b8e6dc & 8d5d515a0"

To be even safer we should use $(sort $(trace-events-subdirs))
---
 Makefile.objs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile.objs b/Makefile.objs
index 7c1e50f9d6..d62f908965 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -142,8 +142,8 @@ trace-events-subdirs +=3D nbd
 trace-events-subdirs +=3D scsi
 endif
 ifeq ($(CONFIG_SOFTMMU),y)
-trace-events-subdirs +=3D chardev
 trace-events-subdirs +=3D audio
+trace-events-subdirs +=3D chardev
 trace-events-subdirs +=3D hw/9pfs
 trace-events-subdirs +=3D hw/acpi
 trace-events-subdirs +=3D hw/alpha
@@ -191,6 +191,7 @@ trace-events-subdirs +=3D migration
 trace-events-subdirs +=3D net
 trace-events-subdirs +=3D ui
 endif
+trace-events-subdirs +=3D hw/core
 trace-events-subdirs +=3D hw/display
 trace-events-subdirs +=3D qapi
 trace-events-subdirs +=3D qom
@@ -203,7 +204,6 @@ trace-events-subdirs +=3D target/riscv
 trace-events-subdirs +=3D target/s390x
 trace-events-subdirs +=3D target/sparc
 trace-events-subdirs +=3D util
-trace-events-subdirs +=3D hw/core
=20
 trace-events-files =3D $(SRC_PATH)/trace-events $(trace-events-subdirs:%=
=3D$(SRC_PATH)/%/trace-events)
=20
--=20
2.21.1



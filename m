Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B55A31314BD
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jan 2020 16:22:25 +0100 (CET)
Received: from localhost ([::1]:53400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioUD2-0005tq-92
	for lists+qemu-devel@lfdr.de; Mon, 06 Jan 2020 10:22:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45470)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1ioTeu-0003DT-9j
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:47:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1ioTes-00033A-Of
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:47:08 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:40960
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ioTes-00032y-KS
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:47:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578322026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cqma/e1P8hEy6n21kibvDtbtjBSCEF0OHFHrI+9r2FM=;
 b=hpaiWsbyvxkUC1FcyPqNneinUViiONoXkXXMnJw/zcFILAnk+PlDjV+jjeqtQbzg5FgHG/
 Kkocw0+ofOrj4yqDyskzgZbewVsf3SiMik+8m7vjffRDTVe4m7Ac4a32inHSgYhQ+L2o0H
 6W/MZpmRfKxFpXfP/zb9azl9ZX21O3k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-jKiCKiZNMgKGEPD1TNgCDQ-1; Mon, 06 Jan 2020 09:47:04 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A518D8A2441;
 Mon,  6 Jan 2020 14:47:03 +0000 (UTC)
Received: from localhost (ovpn-112-48.ams2.redhat.com [10.36.112.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 72D4B1BC6D;
 Mon,  6 Jan 2020 14:46:58 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL v2 3/9] docs: start a document to describe D-Bus usage
Date: Mon,  6 Jan 2020 18:46:16 +0400
Message-Id: <20200106144622.1520994-4-marcandre.lureau@redhat.com>
In-Reply-To: <20200106144622.1520994-1-marcandre.lureau@redhat.com>
References: <20200106144622.1520994-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: jKiCKiZNMgKGEPD1TNgCDQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 MAINTAINERS            |   5 ++
 docs/interop/dbus.rst  | 105 +++++++++++++++++++++++++++++++++++++++++
 docs/interop/index.rst |   1 +
 3 files changed, 111 insertions(+)
 create mode 100644 docs/interop/dbus.rst

diff --git a/MAINTAINERS b/MAINTAINERS
index d280186a98..72b253a5bd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2206,6 +2206,11 @@ F: tests/migration-test.c
 F: docs/devel/migration.rst
 F: qapi/migration.json
=20
+D-Bus
+M: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
+S: Maintained
+F: docs/interop/dbus.rst
+
 Seccomp
 M: Eduardo Otubo <otubo@redhat.com>
 S: Supported
diff --git a/docs/interop/dbus.rst b/docs/interop/dbus.rst
new file mode 100644
index 0000000000..ef80d4204d
--- /dev/null
+++ b/docs/interop/dbus.rst
@@ -0,0 +1,105 @@
+=3D=3D=3D=3D=3D
+D-Bus
+=3D=3D=3D=3D=3D
+
+Introduction
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+QEMU may be running with various helper processes involved:
+ - vhost-user* processes (gpu, virtfs, input, etc...)
+ - TPM emulation (or other devices)
+ - user networking (slirp)
+ - network services (DHCP/DNS, samba/ftp etc)
+ - background tasks (compression, streaming etc)
+ - client UI
+ - admin & cli
+
+Having several processes allows stricter security rules, as well as
+greater modularity.
+
+While QEMU itself uses QMP as primary IPC (and Spice/VNC for remote
+display), D-Bus is the de facto IPC of choice on Unix systems. The
+wire format is machine friendly, good bindings exist for various
+languages, and there are various tools available.
+
+Using a bus, helper processes can discover and communicate with each
+other easily, without going through QEMU. The bus topology is also
+easier to apprehend and debug than a mesh. However, it is wise to
+consider the security aspects of it.
+
+Security
+=3D=3D=3D=3D=3D=3D=3D=3D
+
+A QEMU D-Bus bus should be private to a single VM. Thus, only
+cooperative tasks are running on the same bus to serve the VM.
+
+D-Bus, the protocol and standard, doesn't have mechanisms to enforce
+security between peers once the connection is established. Peers may
+have additional mechanisms to enforce security rules, based for
+example on UNIX credentials.
+
+The daemon can control which peers can send/recv messages using
+various metadata attributes, however, this is alone is not generally
+sufficient to make the deployment secure.  The semantics of the actual
+methods implemented using D-Bus are just as critical. Peers need to
+carefully validate any information they received from a peer with a
+different trust level.
+
+dbus-daemon policy
+------------------
+
+dbus-daemon can enforce various policies based on the UID/GID of the
+processes that are connected to it. It is thus a good idea to run
+helpers as different UID from QEMU and set appropriate policies.
+
+Depending on the use case, you may choose different scenarios:
+
+ - Everything the same UID
+
+   - Convenient for developers
+   - Improved reliability - crash of one part doens't take
+     out entire VM
+   - No security benefit over traditional QEMU, unless additional
+     unless additional controls such as SELinux or AppArmor are
+     applied
+
+ - Two UIDs, one for QEMU, one for dbus & helpers
+
+   - Moderately improved user based security isolation
+
+ - Many UIDs, one for QEMU one for dbus and one for each helpers
+
+   - Best user based security isolation
+   - Complex to manager distinct UIDs needed for each VM
+
+For example, to allow only ``qemu`` user to talk to ``qemu-helper``
+``org.qemu.Helper1`` service, a dbus-daemon policy may contain:
+
+.. code:: xml
+
+  <policy user=3D"qemu">
+     <allow send_destination=3D"org.qemu.Helper1"/>
+     <allow receive_sender=3D"org.qemu.Helper1"/>
+  </policy>
+
+  <policy user=3D"qemu-helper">
+     <allow own=3D"org.qemu.Helper1"/>
+  </policy>
+
+
+dbus-daemon can also perfom SELinux checks based on the security
+context of the source and the target. For example, ``virtiofs_t``
+could be allowed to send a message to ``svirt_t``, but ``virtiofs_t``
+wouldn't be allowed to send a message to ``virtiofs_t``.
+
+See dbus-daemon man page for details.
+
+Guidelines
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+When implementing new D-Bus interfaces, it is recommended to follow
+the "D-Bus API Design Guidelines":
+https://dbus.freedesktop.org/doc/dbus-api-design.html
+
+The "org.qemu.*" prefix is reserved for services implemented &
+distributed by the QEMU project.
diff --git a/docs/interop/index.rst b/docs/interop/index.rst
index 3e33fb5933..ded134ea75 100644
--- a/docs/interop/index.rst
+++ b/docs/interop/index.rst
@@ -13,6 +13,7 @@ Contents:
    :maxdepth: 2
=20
    bitmaps
+   dbus
    live-block-operations
    pr-helper
    qemu-ga
--=20
2.25.0.rc1.1.gb0343b22ed



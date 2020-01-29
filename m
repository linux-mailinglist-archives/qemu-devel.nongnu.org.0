Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C72514D0ED
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jan 2020 20:04:25 +0100 (CET)
Received: from localhost ([::1]:50292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwsdU-0004Ve-Kl
	for lists+qemu-devel@lfdr.de; Wed, 29 Jan 2020 14:04:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38484)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iwscZ-00046n-Uy
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 14:03:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iwscY-0004Tj-6Z
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 14:03:27 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:55679
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iwscY-0004T8-39
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 14:03:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580324605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VvSpx654IyJy8qtmFIUaAm7UgZeOUHxjzj9bbM4ngkI=;
 b=HwPcEcjYVDoCcoic7jMkUx+AGVVBxCfDEMnOqgQnxfwEwglSFBpKdftsAjP+yRjWzmJBUz
 29VshU+77vnyEMf9PkOSrrMI8ZoLj+NJre22n+vhLQbZmDLWiJ2PSW06b8N4Sywy9VjtHg
 J3MSb7mCgUnglb9s7e1Z09b9U8/0IsU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-5IbvbSKkNVWBwuP49FokyQ-1; Wed, 29 Jan 2020 14:03:23 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A8A0107ACC5;
 Wed, 29 Jan 2020 19:03:22 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-184.brq.redhat.com [10.40.205.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FC9D87B06;
 Wed, 29 Jan 2020 19:03:18 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] MAINTAINERS: Cover hppa-softmmu.mak in the HP-PARISC Machines
 section
Date: Wed, 29 Jan 2020 20:03:16 +0100
Message-Id: <20200129190316.16901-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 5IbvbSKkNVWBwuP49FokyQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: qemu-trivial@nongnu.org, Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Modifications to default-configs/hppa-softmmu.mak should be
reviewed by the hppa-softmmu users (currently a single machine).

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index efd3f3875f..2c00a49c42 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -896,6 +896,7 @@ HP B160L
 M: Richard Henderson <rth@twiddle.net>
 R: Helge Deller <deller@gmx.de>
 S: Odd Fixes
+F: default-configs/hppa-softmmu.mak
 F: hw/hppa/
 F: pc-bios/hppa-firmware.img
=20
--=20
2.21.1



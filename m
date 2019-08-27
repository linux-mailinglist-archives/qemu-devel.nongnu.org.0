Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D0D9E50A
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Aug 2019 11:58:46 +0200 (CEST)
Received: from localhost ([::1]:49016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2YFS-00007B-2z
	for lists+qemu-devel@lfdr.de; Tue, 27 Aug 2019 05:58:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53373)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1i2YCH-0004o0-F2
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 05:55:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1i2YCG-00054s-Ht
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 05:55:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33986)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1i2YCG-00054d-CE
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 05:55:28 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B2E4E5AFF8
 for <qemu-devel@nongnu.org>; Tue, 27 Aug 2019 09:55:27 +0000 (UTC)
Received: from localhost (ovpn-116-148.ams2.redhat.com [10.36.116.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F7E05C220;
 Tue, 27 Aug 2019 09:55:16 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: virtio-fs@redhat.com,
	qemu-devel@nongnu.org
Date: Tue, 27 Aug 2019 10:54:36 +0100
Message-Id: <20190827095437.18819-4-stefanha@redhat.com>
In-Reply-To: <20190827095437.18819-1-stefanha@redhat.com>
References: <20190827095437.18819-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Tue, 27 Aug 2019 09:55:27 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 3/4] virtiofsd: install virtiofsd in libexec
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Build and install virtiofsd on Linux hosts.  This is also how
vhost-user-gpu is handled.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Makefile b/Makefile
index a3dfdd6fa8..ef6eca07cc 100644
--- a/Makefile
+++ b/Makefile
@@ -317,6 +317,8 @@ HELPERS-y =3D
 HELPERS-$(call land,$(CONFIG_SOFTMMU),$(CONFIG_LINUX)) =3D qemu-bridge-h=
elper$(EXESUF)
=20
 ifdef CONFIG_LINUX
+HELPERS-y +=3D virtiofsd$(EXESUF)
+
 ifdef CONFIG_VIRGL
 ifdef CONFIG_GBM
 HELPERS-y +=3D vhost-user-gpu$(EXESUF)
--=20
2.21.0



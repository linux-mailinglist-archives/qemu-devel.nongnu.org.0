Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC8135D9C
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 15:14:28 +0200 (CEST)
Received: from localhost ([127.0.0.1]:41266 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYVkJ-0003N8-3K
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 09:14:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56395)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1hYVjI-00031k-U9
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 09:13:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1hYVjH-0002iS-Or
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 09:13:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53604)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1hYVjH-0001lp-Ju; Wed, 05 Jun 2019 09:13:23 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E13CD30BBE7A;
	Wed,  5 Jun 2019 13:12:28 +0000 (UTC)
Received: from localhost (ovpn-112-54.ams2.redhat.com [10.36.112.54])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 285E4101F96D;
	Wed,  5 Jun 2019 13:12:21 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  5 Jun 2019 15:12:21 +0200
Message-Id: <20190605131221.29432-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Wed, 05 Jun 2019 13:12:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] docs/vhost-user.json: some firmware.json copy
 leftovers
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
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 docs/interop/vhost-user.json | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/interop/vhost-user.json b/docs/interop/vhost-user.json
index ae88c03117..da6aaf51c8 100644
--- a/docs/interop/vhost-user.json
+++ b/docs/interop/vhost-user.json
@@ -178,11 +178,11 @@
 #
 #   - /usr/share/qemu/vhost-user/50-crosvm-gpu.json
 #
-# then the sysadmin can prevent the default QEMU being used at all with
+# then the sysadmin can prevent the default QEMU GPU being used at all w=
ith
 #
 #   $ touch /etc/qemu/vhost-user/50-qemu-gpu.json
 #
-# The sysadmin can replace/alter the distro default OVMF with
+# The sysadmin can replace/alter the distro default QEMU GPU with
 #
 #   $ vim /etc/qemu/vhost-user/50-qemu-gpu.json
 #
@@ -190,7 +190,7 @@
 #
 #   $ vim /etc/qemu/vhost-user/10-qemu-gpu.json
 #
-# or they can provide a parallel OVMF with lower priority
+# or they can provide a parallel QEMU GPU with lower priority
 #
 #   $ vim /etc/qemu/vhost-user/99-qemu-gpu.json
 #
--=20
2.22.0.rc2.384.g1a9a72ea1d



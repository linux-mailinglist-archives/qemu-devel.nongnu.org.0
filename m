Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDF92E0B2
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 17:12:39 +0200 (CEST)
Received: from localhost ([127.0.0.1]:56040 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hW0Fq-0001Ma-TA
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 11:12:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42991)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hW0CR-0007Ba-Km
	for qemu-devel@nongnu.org; Wed, 29 May 2019 11:09:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hW0CQ-0001xj-CM
	for qemu-devel@nongnu.org; Wed, 29 May 2019 11:09:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43352)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hW0CQ-0001xS-7N
	for qemu-devel@nongnu.org; Wed, 29 May 2019 11:09:06 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5D343C075BC5
	for <qemu-devel@nongnu.org>; Wed, 29 May 2019 15:08:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-250.ams2.redhat.com
	[10.36.117.250])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DF9617F3F
	for <qemu-devel@nongnu.org>; Wed, 29 May 2019 15:08:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id A3C6E1132BD3; Wed, 29 May 2019 17:08:53 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 29 May 2019 17:08:53 +0200
Message-Id: <20190529150853.9772-4-armbru@redhat.com>
In-Reply-To: <20190529150853.9772-1-armbru@redhat.com>
References: <20190529150853.9772-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 29 May 2019 15:08:57 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 3/3] MAINTAINERS: Polish headline decorations
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 MAINTAINERS | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 196282d165..f8a5a3d448 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -65,7 +65,7 @@ F: *
 F: */
=20
 Responsible Disclosure, Reporting Security Issues
-------------------------------
+-------------------------------------------------
 W: https://wiki.qemu.org/SecurityProcess
 M: Michael S. Tsirkin <mst@redhat.com>
 L: secalert@redhat.com
@@ -106,8 +106,8 @@ K: ^Subject:.*(?i)s390x?
 T: git https://github.com/cohuck/qemu.git s390-next
 L: qemu-s390x@nongnu.org
=20
-Guest CPU cores (TCG):
-----------------------
+Guest CPU cores (TCG)
+---------------------
 Overall CPU cores (TCG)
 M: Richard Henderson <rth@twiddle.net>
 R: Paolo Bonzini <pbonzini@redhat.com>
@@ -342,9 +342,8 @@ M: Alex Benn=C3=A9e <alex.bennee@linaro.org>
 S: Maintained
 F: tests/tcg/multiarch/
=20
-Guest CPU Cores (KVM):
-----------------------
-
+Guest CPU Cores (KVM)
+---------------------
 Overall CPU cores (KVM)
 M: Paolo Bonzini <pbonzini@redhat.com>
 L: kvm@vger.kernel.org
@@ -400,9 +399,8 @@ S: Supported
 F: target/i386/kvm.c
 F: scripts/kvm/vmxcap
=20
-Guest CPU Cores (Xen):
-----------------------
-
+Guest CPU Cores (Xen)
+---------------------
 X86 CPU cores (Xen)
 M: Stefano Stabellini <sstabellini@kernel.org>
 M: Anthony Perard <anthony.perard@citrix.com>
@@ -423,9 +421,8 @@ F: include/hw/block/dataplane/xen*
 F: include/hw/xen/
 F: include/sysemu/xen-mapcache.h
=20
-Hosts:
-------
-
+Hosts
+-----
 LINUX
 M: Michael S. Tsirkin <mst@redhat.com>
 M: Cornelia Huck <cohuck@redhat.com>
@@ -462,6 +459,7 @@ X: qga/*win32*
 F: qemu.nsi
=20
 Alpha Machines
+--------------
 M: Richard Henderson <rth@twiddle.net>
 S: Maintained
 F: hw/alpha/
@@ -1196,7 +1194,7 @@ F: hw/s390x/s390-pci*
 L: qemu-s390x@nongnu.org
=20
 UniCore32 Machines
--------------
+------------------
 PKUnity-3 SoC initramfs-with-busybox
 M: Guan Xuetao <gxt@mprc.pku.edu.cn>
 S: Maintained
--=20
2.17.2



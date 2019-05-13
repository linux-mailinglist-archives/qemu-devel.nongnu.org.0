Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B2A1B0FE
	for <lists+qemu-devel@lfdr.de>; Mon, 13 May 2019 09:13:39 +0200 (CEST)
Received: from localhost ([127.0.0.1]:52290 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQ59W-0006K0-O2
	for lists+qemu-devel@lfdr.de; Mon, 13 May 2019 03:13:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43030)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hQ54E-0002RU-HN
	for qemu-devel@nongnu.org; Mon, 13 May 2019 03:08:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hQ4pv-0002KN-Af
	for qemu-devel@nongnu.org; Mon, 13 May 2019 02:53:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59868)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hQ4pv-0002I7-13
	for qemu-devel@nongnu.org; Mon, 13 May 2019 02:53:23 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C5559307CDC7
	for <qemu-devel@nongnu.org>; Mon, 13 May 2019 06:53:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-74.ams2.redhat.com
	[10.36.117.74])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2D0AE18A52;
	Mon, 13 May 2019 06:53:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 3BC98A1E4; Mon, 13 May 2019 08:53:10 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 13 May 2019 08:53:04 +0200
Message-Id: <20190513065310.10263-2-kraxel@redhat.com>
In-Reply-To: <20190513065310.10263-1-kraxel@redhat.com>
References: <20190513065310.10263-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Mon, 13 May 2019 06:53:18 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 1/7] libvhost-user: fix
 -Waddress-of-packed-member
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

/home/elmarco/src/qemu/contrib/libvhost-user/libvhost-user.c: In function=
 =E2=80=98vu_set_mem_table_exec_postcopy=E2=80=99:
/home/elmarco/src/qemu/contrib/libvhost-user/libvhost-user.c:546:31: warn=
ing: taking address of packed member of =E2=80=98struct VhostUserMsg=E2=80=
=99 may result in an unaligned pointer value [-Waddress-of-packed-member]
  546 |     VhostUserMemory *memory =3D &vmsg->payload.memory;
      |                               ^~~~~~~~~~~~~~~~~~~~~
/home/elmarco/src/qemu/contrib/libvhost-user/libvhost-user.c: In function=
 =E2=80=98vu_set_mem_table_exec=E2=80=99:
/home/elmarco/src/qemu/contrib/libvhost-user/libvhost-user.c:688:31: warn=
ing: taking address of packed member of =E2=80=98struct VhostUserMsg=E2=80=
=99 may result in an unaligned pointer value [-Waddress-of-packed-member]
  688 |     VhostUserMemory *memory =3D &vmsg->payload.memory;
      |                               ^~~~~~~~~~~~~~~~~~~~~
/home/elmarco/src/qemu/contrib/libvhost-user/libvhost-user.c: In function=
 =E2=80=98vu_set_vring_addr_exec=E2=80=99:
/home/elmarco/src/qemu/contrib/libvhost-user/libvhost-user.c:817:36: warn=
ing: taking address of packed member of =E2=80=98struct VhostUserMsg=E2=80=
=99 may result in an unaligned pointer value [-Waddress-of-packed-member]
  817 |     struct vhost_vring_addr *vra =3D &vmsg->payload.addr;
      |                                    ^~~~~~~~~~~~~~~~~~~

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Message-id: 20190503130034.24916-2-marcandre.lureau@redhat.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 contrib/libvhost-user/libvhost-user.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/contrib/libvhost-user/libvhost-user.c b/contrib/libvhost-use=
r/libvhost-user.c
index e08d6c7b9741..dcf4a969f238 100644
--- a/contrib/libvhost-user/libvhost-user.c
+++ b/contrib/libvhost-user/libvhost-user.c
@@ -542,7 +542,7 @@ static bool
 vu_set_mem_table_exec_postcopy(VuDev *dev, VhostUserMsg *vmsg)
 {
     int i;
-    VhostUserMemory *memory =3D &vmsg->payload.memory;
+    VhostUserMemory m =3D vmsg->payload.memory, *memory =3D &m;
     dev->nregions =3D memory->nregions;
=20
     DPRINT("Nregions: %d\n", memory->nregions);
@@ -684,7 +684,7 @@ static bool
 vu_set_mem_table_exec(VuDev *dev, VhostUserMsg *vmsg)
 {
     int i;
-    VhostUserMemory *memory =3D &vmsg->payload.memory;
+    VhostUserMemory m =3D vmsg->payload.memory, *memory =3D &m;
=20
     for (i =3D 0; i < dev->nregions; i++) {
         VuDevRegion *r =3D &dev->regions[i];
@@ -813,7 +813,7 @@ vu_set_vring_num_exec(VuDev *dev, VhostUserMsg *vmsg)
 static bool
 vu_set_vring_addr_exec(VuDev *dev, VhostUserMsg *vmsg)
 {
-    struct vhost_vring_addr *vra =3D &vmsg->payload.addr;
+    struct vhost_vring_addr addr =3D vmsg->payload.addr, *vra =3D &addr;
     unsigned int index =3D vra->index;
     VuVirtq *vq =3D &dev->vq[index];
=20
--=20
2.18.1



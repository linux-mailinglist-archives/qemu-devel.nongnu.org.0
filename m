Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C03625F81
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 10:30:03 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38356 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTMdO-0001XZ-MS
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 04:30:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59758)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hTMbP-0000fh-Pa
	for qemu-devel@nongnu.org; Wed, 22 May 2019 04:28:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hTMas-00058X-RZ
	for qemu-devel@nongnu.org; Wed, 22 May 2019 04:27:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56522)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hTMas-00057L-KN
	for qemu-devel@nongnu.org; Wed, 22 May 2019 04:27:26 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BF8AB307D847
	for <qemu-devel@nongnu.org>; Wed, 22 May 2019 08:27:25 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-74.ams2.redhat.com
	[10.36.117.74])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 750FB648A9;
	Wed, 22 May 2019 08:27:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 28B95A200; Wed, 22 May 2019 10:27:17 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 22 May 2019 10:27:15 +0200
Message-Id: <20190522082717.9354-2-kraxel@redhat.com>
In-Reply-To: <20190522082717.9354-1-kraxel@redhat.com>
References: <20190522082717.9354-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Wed, 22 May 2019 08:27:25 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 1/3] libvhost-user: fix cast warnings on 32 bits
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
	Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Fixes warnings:
 warning: cast to pointer from integer of different size
 [-Wint-to-pointer-cast]

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-id: 20190514104126.6294-2-marcandre.lureau@redhat.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 contrib/libvhost-user/libvhost-user.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/contrib/libvhost-user/libvhost-user.c b/contrib/libvhost-use=
r/libvhost-user.c
index 3825b1cacff5..0ffa0f45c890 100644
--- a/contrib/libvhost-user/libvhost-user.c
+++ b/contrib/libvhost-user/libvhost-user.c
@@ -621,7 +621,7 @@ vu_set_mem_table_exec_postcopy(VuDev *dev, VhostUserM=
sg *vmsg)
          * data that's already arrived in the shared process.
          * TODO: How to do hugepage
          */
-        ret =3D madvise((void *)dev_region->mmap_addr,
+        ret =3D madvise((void *)(uintptr_t)dev_region->mmap_addr,
                       dev_region->size + dev_region->mmap_offset,
                       MADV_DONTNEED);
         if (ret) {
@@ -633,7 +633,7 @@ vu_set_mem_table_exec_postcopy(VuDev *dev, VhostUserM=
sg *vmsg)
          * in neighbouring pages.
          * TODO: Turn this backon later.
          */
-        ret =3D madvise((void *)dev_region->mmap_addr,
+        ret =3D madvise((void *)(uintptr_t)dev_region->mmap_addr,
                       dev_region->size + dev_region->mmap_offset,
                       MADV_NOHUGEPAGE);
         if (ret) {
@@ -666,7 +666,7 @@ vu_set_mem_table_exec_postcopy(VuDev *dev, VhostUserM=
sg *vmsg)
         DPRINT("%s: region %d: Registered userfault for %llx + %llx\n",
                 __func__, i, reg_struct.range.start, reg_struct.range.le=
n);
         /* Now it's registered we can let the client at it */
-        if (mprotect((void *)dev_region->mmap_addr,
+        if (mprotect((void *)(uintptr_t)dev_region->mmap_addr,
                      dev_region->size + dev_region->mmap_offset,
                      PROT_READ | PROT_WRITE)) {
             vu_panic(dev, "failed to mprotect region %d for postcopy (%s=
)",
--=20
2.18.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC1D9EADA
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Aug 2019 16:24:46 +0200 (CEST)
Received: from localhost ([::1]:52000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2cOr-0007OD-2O
	for lists+qemu-devel@lfdr.de; Tue, 27 Aug 2019 10:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40170)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1i2cNz-0006yp-HL
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 10:23:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1i2cNy-00071N-FO
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 10:23:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52230)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1i2cNy-00070z-A8
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 10:23:50 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 624D7307D915;
 Tue, 27 Aug 2019 14:23:49 +0000 (UTC)
Received: from localhost (ovpn-116-148.ams2.redhat.com [10.36.116.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE80E5DC18;
 Tue, 27 Aug 2019 14:23:41 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: virtio-fs@redhat.com,
	qemu-devel@nongnu.org
Date: Tue, 27 Aug 2019 15:23:40 +0100
Message-Id: <20190827142340.23811-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Tue, 27 Aug 2019 14:23:49 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] virtiofsd: fix "filed" -> "failed" typo in
 error message
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
Cc: Jun Piao <piaojun@huawei.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reported-by: Jun Piao <piaojun@huawei.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
Based-on: <20190823092401.11883-1-stefanha@redhat.com>
          ("[PATCH 0/2] virtiofsd: use "fuse_log.h" APIs instead of <err.=
h>")

 contrib/virtiofsd/passthrough_ll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/virtiofsd/passthrough_ll.c b/contrib/virtiofsd/passt=
hrough_ll.c
index f348b0be9d..ff0c446187 100644
--- a/contrib/virtiofsd/passthrough_ll.c
+++ b/contrib/virtiofsd/passthrough_ll.c
@@ -673,7 +673,7 @@ retry:
 	}
 	if (stat.st_dev !=3D inode->key.dev || stat.st_ino !=3D inode->key.ino)=
 {
 		if (!retries)
-			fuse_warning("lo_parent_and_name: filed to match last\n");
+			fuse_warning("lo_parent_and_name: failed to match last\n");
 		goto fail_unref;
 	}
 	*parent =3D p;
--=20
2.21.0



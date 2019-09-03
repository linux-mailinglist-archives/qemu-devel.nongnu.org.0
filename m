Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C57A6A78
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Sep 2019 15:53:11 +0200 (CEST)
Received: from localhost ([::1]:46460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i59F7-0004zT-Py
	for lists+qemu-devel@lfdr.de; Tue, 03 Sep 2019 09:53:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56023)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1i58yy-0002eE-8f
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 09:36:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1i58yx-0006fH-AK
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 09:36:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45576)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1i58yu-0006YP-QV; Tue, 03 Sep 2019 09:36:24 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DA2244E93D;
 Tue,  3 Sep 2019 13:36:23 +0000 (UTC)
Received: from localhost (ovpn-204-98.brq.redhat.com [10.40.204.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 75BE960A35;
 Tue,  3 Sep 2019 13:36:23 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Tue,  3 Sep 2019 15:35:49 +0200
Message-Id: <20190903133553.6500-13-mreitz@redhat.com>
In-Reply-To: <20190903133553.6500-1-mreitz@redhat.com>
References: <20190903133553.6500-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Tue, 03 Sep 2019 13:36:23 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL v2 12/16] file-posix: fix request_alignment typo
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

Fixes: a6b257a08e3d72219f03e461a52152672fec0612
       ("file-posix: Handle undetectable alignment")
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-id: 20190827101328.4062-1-stefanha@redhat.com
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/file-posix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 447f937aa1..71f168ee2f 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -380,7 +380,7 @@ static void raw_probe_alignment(BlockDriverState *bs,=
 int fd, Error **errp)
         for (i =3D 0; i < ARRAY_SIZE(alignments); i++) {
             align =3D alignments[i];
             if (raw_is_io_aligned(fd, buf + align, max_align)) {
-                /* Fallback to request_aligment. */
+                /* Fallback to request_alignment. */
                 s->buf_align =3D (align !=3D 1) ? align : bs->bl.request=
_alignment;
                 break;
             }
--=20
2.21.0



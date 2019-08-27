Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CCC9E583
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Aug 2019 12:14:56 +0200 (CEST)
Received: from localhost ([::1]:49084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2YV4-0005Fl-Q2
	for lists+qemu-devel@lfdr.de; Tue, 27 Aug 2019 06:14:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56125)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1i2YTs-0004gT-1j
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 06:13:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1i2YTr-0005AH-36
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 06:13:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34646)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>)
 id 1i2YTn-00058q-PJ; Tue, 27 Aug 2019 06:13:35 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C471531CD6B;
 Tue, 27 Aug 2019 10:13:34 +0000 (UTC)
Received: from localhost (ovpn-116-148.ams2.redhat.com [10.36.116.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B74B845BE;
 Tue, 27 Aug 2019 10:13:29 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 27 Aug 2019 11:13:28 +0100
Message-Id: <20190827101328.4062-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Tue, 27 Aug 2019 10:13:34 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] file-posix: fix request_alignment typo
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-trivial@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes: a6b257a08e3d72219f03e461a52152672fec0612
       ("file-posix: Handle undetectable alignment")
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/file-posix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index fbeb0068db..67abd1f01c 100644
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



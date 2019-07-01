Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E72A42CFB
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jun 2019 19:07:59 +0200 (CEST)
Received: from localhost ([::1]:33926 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hb6j8-00018N-GJ
	for lists+qemu-devel@lfdr.de; Wed, 12 Jun 2019 13:07:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57877)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hb6UP-0007Qv-U6
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 12:52:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hb6UO-0006M8-1A
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 12:52:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51784)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hb6UK-0006Cf-9G
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 12:52:42 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 490F0308795E
 for <qemu-devel@nongnu.org>; Wed, 12 Jun 2019 16:52:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-148.ams2.redhat.com
 [10.36.116.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 19A101001B11;
 Wed, 12 Jun 2019 16:52:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A173C11385D4; Wed, 12 Jun 2019 18:52:29 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 12 Jun 2019 18:52:22 +0200
Message-Id: <20190612165229.26976-5-armbru@redhat.com>
In-Reply-To: <20190612165229.26976-1-armbru@redhat.com>
References: <20190612165229.26976-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Wed, 12 Jun 2019 16:52:31 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 04/11] block/gluster: update .help of
 BLOCK_OPT_PREALLOC option
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
Cc: Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefano Garzarella <sgarzare@redhat.com>

Add missing 'falloc' among the allowed values of 'preallocation'
option; show it and 'full' only when they are supported.
('falloc' is supported if defined CONFIG_GLUSTERFS_FALLOCATE,
'full' is supported if defined CONFIG_GLUSTERFS_ZEROFILL)

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20190524075848.23781-4-sgarzare@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 block/gluster.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/block/gluster.c b/block/gluster.c
index dc16f0c329..62f8ff2147 100644
--- a/block/gluster.c
+++ b/block/gluster.c
@@ -98,7 +98,14 @@ static QemuOptsList qemu_gluster_create_opts =3D {
         {
             .name =3D BLOCK_OPT_PREALLOC,
             .type =3D QEMU_OPT_STRING,
-            .help =3D "Preallocation mode (allowed values: off, full)"
+            .help =3D "Preallocation mode (allowed values: off"
+#ifdef CONFIG_GLUSTERFS_FALLOCATE
+                    ", falloc"
+#endif
+#ifdef CONFIG_GLUSTERFS_ZEROFILL
+                    ", full"
+#endif
+                    ")"
         },
         {
             .name =3D GLUSTER_OPT_DEBUG,
--=20
2.21.0



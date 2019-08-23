Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C694D9AD6A
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 12:41:19 +0200 (CEST)
Received: from localhost ([::1]:53932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i170Q-00078w-Lh
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 06:41:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37379)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1i16z3-0006WY-4T
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 06:39:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1i16z0-0007dw-Nh
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 06:39:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41126)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1i16z0-0007bm-HN
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 06:39:50 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BACE318C890F
 for <qemu-devel@nongnu.org>; Fri, 23 Aug 2019 10:39:49 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-117-244.ams2.redhat.com
 [10.36.117.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E20176CE68;
 Fri, 23 Aug 2019 10:39:48 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	quintela@redhat.com,
	berrange@redhat.com
Date: Fri, 23 Aug 2019 11:39:46 +0100
Message-Id: <20190823103946.7388-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Fri, 23 Aug 2019 10:39:49 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] qemu-file: Rework old qemu_fflush comment
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Commit 11808bb removed the non-iovec based write support,
the comment hung on.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/qemu-file.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index e33c46764f..075faf03c3 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -201,9 +201,8 @@ static void qemu_iovec_release_ram(QEMUFile *f)
 /**
  * Flushes QEMUFile buffer
  *
- * If there is writev_buffer QEMUFileOps it uses it otherwise uses
- * put_buffer ops. This will flush all pending data. If data was
- * only partially flushed, it will set an error state.
+ * This will flush all pending data. If data was only partially flushed,=
 it
+ * will set an error state.
  */
 void qemu_fflush(QEMUFile *f)
 {
--=20
2.21.0



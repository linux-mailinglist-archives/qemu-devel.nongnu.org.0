Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0541CF8EB6
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Nov 2019 12:37:57 +0100 (CET)
Received: from localhost ([::1]:33682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUUUe-0003by-0T
	for lists+qemu-devel@lfdr.de; Tue, 12 Nov 2019 06:37:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35579)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <slp@redhat.com>) id 1iUUP2-0007GC-7n
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 06:32:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <slp@redhat.com>) id 1iUUOy-000195-57
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 06:32:08 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:31243
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <slp@redhat.com>) id 1iUUOw-000189-1o
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 06:32:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573558321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6lW7FaNY79zsFV9+XLGaGBYg6heTfL4IuCc6Bq9FTHg=;
 b=C3DQJy+W1wmR4Ise3F6X2gkgez8M4HKH3I+byW4PgUYAydg7xDWhG4dCwPr2hjwyQtpbgu
 LSdD8EGWU678AYEo6RQVWpZtzWxkieKQilXp1Kyj9N+s5asfZB9PdIL615KNyt3ulfv2jw
 rkCZKzl5gLrx8nT8ke+eW5/GiE9CQjA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-n0LTeF1gOB6W5R6BJ_0HfQ-1; Tue, 12 Nov 2019 06:30:22 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C26F8017E0;
 Tue, 12 Nov 2019 11:30:21 +0000 (UTC)
Received: from dritchie.redhat.com (unknown [10.33.36.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BBB1760A89;
 Tue, 12 Nov 2019 11:30:19 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/8] blockdev: fix coding style issues in
 drive_backup_prepare
Date: Tue, 12 Nov 2019 12:30:06 +0100
Message-Id: <20191112113012.71136-3-slp@redhat.com>
In-Reply-To: <20191112113012.71136-1-slp@redhat.com>
References: <20191112113012.71136-1-slp@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: n0LTeF1gOB6W5R6BJ_0HfQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix a couple of minor coding style issues in drive_backup_prepare.

Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 blockdev.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index 5d30aff1e5..e8b673c5f3 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -3592,7 +3592,7 @@ static void drive_backup_prepare(BlkActionState *comm=
on, Error **errp)
=20
     if (!backup->has_format) {
         backup->format =3D backup->mode =3D=3D NEW_IMAGE_MODE_EXISTING ?
-                         NULL : (char*) bs->drv->format_name;
+                         NULL : (char *) bs->drv->format_name;
     }
=20
     /* Early check to avoid creating target */
@@ -3602,8 +3602,10 @@ static void drive_backup_prepare(BlkActionState *com=
mon, Error **errp)
=20
     flags =3D bs->open_flags | BDRV_O_RDWR;
=20
-    /* See if we have a backing HD we can use to create our new image
-     * on top of. */
+    /*
+     * See if we have a backing HD we can use to create our new image
+     * on top of.
+     */
     if (backup->sync =3D=3D MIRROR_SYNC_MODE_TOP) {
         source =3D backing_bs(bs);
         if (!source) {
--=20
2.23.0



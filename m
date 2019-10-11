Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56407D486C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 21:28:08 +0200 (CEST)
Received: from localhost ([::1]:56244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJ0a6-00057x-SF
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 15:28:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37643)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iJ0Pn-0000er-F0
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 15:17:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iJ0Pm-0003yM-8e
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 15:17:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50928)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iJ0Pm-0003y6-33
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 15:17:26 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5A248300BEAB;
 Fri, 11 Oct 2019 19:17:25 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-117-210.ams2.redhat.com
 [10.36.117.210])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E0A15D6C8;
 Fri, 11 Oct 2019 19:17:24 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, quintela@redhat.com, eric.auger@redhat.com,
 richardw.yang@linux.intel.com
Subject: [PULL 15/21] migration/postcopy: rename postcopy_ram_enable_notify to
 postcopy_ram_incoming_setup
Date: Fri, 11 Oct 2019 20:16:40 +0100
Message-Id: <20191011191646.226814-16-dgilbert@redhat.com>
In-Reply-To: <20191011191646.226814-1-dgilbert@redhat.com>
References: <20191011191646.226814-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Fri, 11 Oct 2019 19:17:25 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wei Yang <richardw.yang@linux.intel.com>

Function postcopy_ram_incoming_setup and postcopy_ram_incoming_cleanup
is a pair. Rename to make it clear for audience.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20191010011316.31363-2-richardw.yang@linux.intel.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/postcopy-ram.c | 4 ++--
 migration/postcopy-ram.h | 2 +-
 migration/savevm.c       | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index a793bad477..abccafc8c8 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -1094,7 +1094,7 @@ retry:
     return NULL;
 }
=20
-int postcopy_ram_enable_notify(MigrationIncomingState *mis)
+int postcopy_ram_incoming_setup(MigrationIncomingState *mis)
 {
     /* Open the fd for the kernel to give us userfaults */
     mis->userfault_fd =3D syscall(__NR_userfaultfd, O_CLOEXEC | O_NONBLO=
CK);
@@ -1307,7 +1307,7 @@ int postcopy_request_shared_page(struct PostCopyFD =
*pcfd, RAMBlock *rb,
     return -1;
 }
=20
-int postcopy_ram_enable_notify(MigrationIncomingState *mis)
+int postcopy_ram_incoming_setup(MigrationIncomingState *mis)
 {
     assert(0);
     return -1;
diff --git a/migration/postcopy-ram.h b/migration/postcopy-ram.h
index fb4cd11d28..9941feb63a 100644
--- a/migration/postcopy-ram.h
+++ b/migration/postcopy-ram.h
@@ -20,7 +20,7 @@ bool postcopy_ram_supported_by_host(MigrationIncomingSt=
ate *mis);
  * Make all of RAM sensitive to accesses to areas that haven't yet been =
written
  * and wire up anything necessary to deal with it.
  */
-int postcopy_ram_enable_notify(MigrationIncomingState *mis);
+int postcopy_ram_incoming_setup(MigrationIncomingState *mis);
=20
 /*
  * Initialise postcopy-ram, setting the RAM to a state where we can go i=
nto
diff --git a/migration/savevm.c b/migration/savevm.c
index bf3da58ecc..95574c4e9d 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1869,7 +1869,7 @@ static int loadvm_postcopy_handle_listen(MigrationI=
ncomingState *mis)
      * shouldn't be doing anything yet so don't actually expect requests
      */
     if (migrate_postcopy_ram()) {
-        if (postcopy_ram_enable_notify(mis)) {
+        if (postcopy_ram_incoming_setup(mis)) {
             postcopy_ram_incoming_cleanup(mis);
             return -1;
         }
--=20
2.23.0



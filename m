Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCEA834E0
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Aug 2019 17:16:01 +0200 (CEST)
Received: from localhost ([::1]:34104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hv1Bw-0005c7-FV
	for lists+qemu-devel@lfdr.de; Tue, 06 Aug 2019 11:16:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50914)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hv1Ai-0003qb-9n
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 11:14:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hv1Ah-0004fS-82
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 11:14:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43802)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hv1Ah-0004f3-2A
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 11:14:43 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6742B772C8
 for <qemu-devel@nongnu.org>; Tue,  6 Aug 2019 15:14:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-251.ams2.redhat.com
 [10.36.117.251])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BBF510016E8;
 Tue,  6 Aug 2019 15:14:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6080E11385D5; Tue,  6 Aug 2019 17:14:35 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  6 Aug 2019 17:14:11 +0200
Message-Id: <20190806151435.10740-6-armbru@redhat.com>
In-Reply-To: <20190806151435.10740-1-armbru@redhat.com>
References: <20190806151435.10740-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Tue, 06 Aug 2019 15:14:42 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 05/29] queue: Drop superfluous #include
 qemu/atomic.h
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
Cc: Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When commit 5f7d05ecfda added QLIST_INSERT_HEAD_RCU() to qemu/queue.h,
it had to include qemu/atomic.h.  Commit 341774fe6cc removed
QLIST_INSERT_HEAD_RCU() again, but neglected to remove the #include.
Do that now.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 include/qemu/queue.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/qemu/queue.h b/include/qemu/queue.h
index 0379bd8fdb..73bf4a984d 100644
--- a/include/qemu/queue.h
+++ b/include/qemu/queue.h
@@ -78,8 +78,6 @@
  * For details on the use of these macros, see the queue(3) manual page.
  */
=20
-#include "qemu/atomic.h" /* for smp_wmb() */
-
 /*
  * List definitions.
  */
--=20
2.21.0



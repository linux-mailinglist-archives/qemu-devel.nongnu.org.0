Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC9C76521
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jul 2019 14:07:11 +0200 (CEST)
Received: from localhost ([::1]:39242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqz09-0001BY-UI
	for lists+qemu-devel@lfdr.de; Fri, 26 Jul 2019 08:07:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58401)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hqyys-0005Va-8h
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 08:05:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hqyyq-0007tx-2L
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 08:05:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36298)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hqyyp-0007pO-PT
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 08:05:47 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 91CED307D84B
 for <qemu-devel@nongnu.org>; Fri, 26 Jul 2019 12:05:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-30.ams2.redhat.com
 [10.36.116.30])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FD971001938
 for <qemu-devel@nongnu.org>; Fri, 26 Jul 2019 12:05:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 563FC1132E85; Fri, 26 Jul 2019 14:05:42 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 26 Jul 2019 14:05:19 +0200
Message-Id: <20190726120542.9894-6-armbru@redhat.com>
In-Reply-To: <20190726120542.9894-1-armbru@redhat.com>
References: <20190726120542.9894-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Fri, 26 Jul 2019 12:05:45 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 05/28] queue: Drop superfluous #include
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When commit 5f7d05ecfda added QLIST_INSERT_HEAD_RCU() to qemu/queue.h,
it had to include qemu/atomic.h.  Commit 341774fe6cc removed
QLIST_INSERT_HEAD_RCU() again, but neglected to remove the #include.
Do that now.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
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



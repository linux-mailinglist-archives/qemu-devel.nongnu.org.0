Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F38A89083D
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Aug 2019 21:34:31 +0200 (CEST)
Received: from localhost ([::1]:59424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyhza-00072M-Uf
	for lists+qemu-devel@lfdr.de; Fri, 16 Aug 2019 15:34:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45757)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1hyhyN-0006aG-7T
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 15:33:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hyhyL-0008Ln-QZ
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 15:33:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49136)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hyhyL-0008L1-Lc
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 15:33:13 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 22CFB308FBAC
 for <qemu-devel@nongnu.org>; Fri, 16 Aug 2019 19:33:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E13798428E
 for <qemu-devel@nongnu.org>; Fri, 16 Aug 2019 19:33:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5F86410E6CCA; Fri, 16 Aug 2019 21:33:05 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 16 Aug 2019 21:33:05 +0200
Message-Id: <20190816193305.12090-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Fri, 16 Aug 2019 19:33:11 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] monitor/qmp: Update comment for commit
 4eaca8de268
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

Commit 4eaca8de268 dropped monitor_qmp_respond()'s parameter @id
without updating its function comment.  Fix that.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 monitor/qmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/monitor/qmp.c b/monitor/qmp.c
index e1b196217d..9d9e5d8b27 100644
--- a/monitor/qmp.c
+++ b/monitor/qmp.c
@@ -97,7 +97,7 @@ void qmp_send_response(MonitorQMP *mon, const QDict *rs=
p)
 }
=20
 /*
- * Emit QMP response @rsp with ID @id to @mon.
+ * Emit QMP response @rsp to @mon.
  * Null @rsp can only happen for commands with QCO_NO_SUCCESS_RESP.
  * Nothing is emitted then.
  */
--=20
2.21.0



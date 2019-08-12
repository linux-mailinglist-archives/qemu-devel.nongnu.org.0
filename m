Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A41896BF
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Aug 2019 07:26:11 +0200 (CEST)
Received: from localhost ([::1]:42954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hx2qR-0005Ax-5c
	for lists+qemu-devel@lfdr.de; Mon, 12 Aug 2019 01:26:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57155)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hx2oU-000066-GD
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 01:24:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hx2oT-00067m-F5
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 01:24:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45992)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hx2oT-00066s-9r
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 01:24:09 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 976B93C917;
 Mon, 12 Aug 2019 05:24:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 630C8196BA;
 Mon, 12 Aug 2019 05:24:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CD73D11385D5; Mon, 12 Aug 2019 07:23:59 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 12 Aug 2019 07:23:35 +0200
Message-Id: <20190812052359.30071-6-armbru@redhat.com>
In-Reply-To: <20190812052359.30071-1-armbru@redhat.com>
References: <20190812052359.30071-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Mon, 12 Aug 2019 05:24:08 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v4 05/29] queue: Drop superfluous #include
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When commit 5f7d05ecfda added QLIST_INSERT_HEAD_RCU() to qemu/queue.h,
it had to include qemu/atomic.h.  Commit 341774fe6cc removed
QLIST_INSERT_HEAD_RCU() again, but neglected to remove the #include.
Do that now.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F328B361
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Aug 2019 11:08:15 +0200 (CEST)
Received: from localhost ([::1]:50424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxSms-0006WN-8c
	for lists+qemu-devel@lfdr.de; Tue, 13 Aug 2019 05:08:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49688)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kraxel@redhat.com>) id 1hxSmN-000666-Qc
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 05:07:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1hxSmM-00080a-P2
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 05:07:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:13600)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hxSmM-0007zk-K1
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 05:07:42 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8D87C142BE8
 for <qemu-devel@nongnu.org>; Tue, 13 Aug 2019 09:07:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-144.ams2.redhat.com
 [10.36.116.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 575618497C;
 Tue, 13 Aug 2019 09:07:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1B15516E08; Tue, 13 Aug 2019 11:07:27 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 13 Aug 2019 11:07:27 +0200
Message-Id: <20190813090727.18058-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Tue, 13 Aug 2019 09:07:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2] Add git-publish profile for security bugs
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simplifies sending security patches to all people listed in
https://wiki.qemu.org/SecurityProcess.  Should also make it
harder to send a copy to the mailing list by accident.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 .gitpublish | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/.gitpublish b/.gitpublish
index a13f8c7c0ecd..01f8279fa840 100644
--- a/.gitpublish
+++ b/.gitpublish
@@ -49,3 +49,15 @@ base = master
 to = qemu-devel@nongnu.org
 cc = qemu-ppc@nongnu.org
 cccmd = scripts/get_maintainer.pl --noroles --norolestats --nogit --nogit-fallback 2>/dev/null
+
+# https://wiki.qemu.org/SecurityProcess
+[gitpublishprofile "security"]
+base = master
+to = mst@redhat.com
+to = pmatouse@redhat.com
+to = sstabellini@kernel.org
+to = secalert@redhat.com
+to = mdroth@linux.vnet.ibm.com
+to = pjp@redhat.com
+suppresscc = all
+inspect-emails = true
-- 
2.18.1



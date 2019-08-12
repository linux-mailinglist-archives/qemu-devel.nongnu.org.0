Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F8689796
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Aug 2019 09:12:50 +0200 (CEST)
Received: from localhost ([::1]:43412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hx4Ve-0004Zx-17
	for lists+qemu-devel@lfdr.de; Mon, 12 Aug 2019 03:12:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45792)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kraxel@redhat.com>) id 1hx4V8-0004BL-RM
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 03:12:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1hx4V7-0005qy-Nc
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 03:12:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50774)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hx4V7-0005qj-Io
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 03:12:17 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DACCB308624A
 for <qemu-devel@nongnu.org>; Mon, 12 Aug 2019 07:12:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-144.ams2.redhat.com
 [10.36.116.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 151EF10016E8;
 Mon, 12 Aug 2019 07:12:14 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DF51516E32; Mon, 12 Aug 2019 09:12:12 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 12 Aug 2019 09:12:12 +0200
Message-Id: <20190812071212.24551-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Mon, 12 Aug 2019 07:12:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] Add git-publish profile for security bugs
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
 .gitpublish | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/.gitpublish b/.gitpublish
index a13f8c7c0ecd..55750c45ed89 100644
--- a/.gitpublish
+++ b/.gitpublish
@@ -49,3 +49,14 @@ base = master
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
-- 
2.18.1



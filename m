Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C65FC22A43
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 05:11:04 +0200 (CEST)
Received: from localhost ([127.0.0.1]:56972 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSYhb-0002jW-HV
	for lists+qemu-devel@lfdr.de; Sun, 19 May 2019 23:11:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49078)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1hSYfS-0001mM-4F
	for qemu-devel@nongnu.org; Sun, 19 May 2019 23:08:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1hSYfR-0001Os-7F
	for qemu-devel@nongnu.org; Sun, 19 May 2019 23:08:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33888)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peterx@redhat.com>) id 1hSYfR-0001OY-2O
	for qemu-devel@nongnu.org; Sun, 19 May 2019 23:08:49 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 66741307CDEA
	for <qemu-devel@nongnu.org>; Mon, 20 May 2019 03:08:48 +0000 (UTC)
Received: from xz-x1.nay.redhat.com (dhcp-15-205.nay.redhat.com [10.66.15.205])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4C839100200A;
	Mon, 20 May 2019 03:08:45 +0000 (UTC)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 20 May 2019 11:08:25 +0800
Message-Id: <20190520030839.6795-2-peterx@redhat.com>
In-Reply-To: <20190520030839.6795-1-peterx@redhat.com>
References: <20190520030839.6795-1-peterx@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Mon, 20 May 2019 03:08:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 01/15] checkpatch: Allow
 SPDX-License-Identifier
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	peterx@redhat.com, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

According to: https://spdx.org/ids-how, let's still allow QEMU to use
the SPDX license identifier:

// SPDX-License-Identifier: ***

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 scripts/checkpatch.pl | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 88682cb0a9..c2aaf421da 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1949,7 +1949,8 @@ sub process {
 		}
 
 # no C99 // comments
-		if ($line =~ m{//}) {
+		if ($line =~ m{//} &&
+		    $rawline !~ m{// SPDX-License-Identifier: }) {
 			ERROR("do not use C99 // comments\n" . $herecurr);
 		}
 		# Remove C99 comments.
-- 
2.17.1



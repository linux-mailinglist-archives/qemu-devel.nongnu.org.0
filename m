Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C413D2E32
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 17:54:26 +0200 (CEST)
Received: from localhost ([::1]:41474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIalk-0007w5-Vi
	for lists+qemu-devel@lfdr.de; Thu, 10 Oct 2019 11:54:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60894)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iIaK9-0006R7-St
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 11:25:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iIaK7-0004ci-Sg
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 11:25:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43050)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iIaK3-0004Zt-7f; Thu, 10 Oct 2019 11:25:47 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 437ED7F748;
 Thu, 10 Oct 2019 15:25:46 +0000 (UTC)
Received: from localhost (unknown [10.36.118.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B15CB19C69;
 Thu, 10 Oct 2019 15:25:45 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 15/23] iotests/201: Create socket in $SOCK_DIR
Date: Thu, 10 Oct 2019 17:24:49 +0200
Message-Id: <20191010152457.17713-16-mreitz@redhat.com>
In-Reply-To: <20191010152457.17713-1-mreitz@redhat.com>
References: <20191010152457.17713-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Thu, 10 Oct 2019 15:25:46 +0000 (UTC)
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/201 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/201 b/tests/qemu-iotests/201
index 7abf740fe4..86fa37e714 100755
--- a/tests/qemu-iotests/201
+++ b/tests/qemu-iotests/201
@@ -24,7 +24,7 @@ echo "QA output created by $seq"
=20
 status=3D1	# failure is the default!
=20
-MIG_SOCKET=3D"${TEST_DIR}/migrate"
+MIG_SOCKET=3D"${SOCK_DIR}/migrate"
=20
 # get standard environment, filters and checks
 . ./common.rc
--=20
2.21.0



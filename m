Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DCAD437E
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 16:54:17 +0200 (CEST)
Received: from localhost ([::1]:51672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIwJ6-0000gs-95
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 10:54:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50039)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iIwG2-0004tc-1Z
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 10:51:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iIwG0-0007CR-JQ
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 10:51:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54222)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1iIwFy-0007Az-7l; Fri, 11 Oct 2019 10:51:02 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7389B300CB26;
 Fri, 11 Oct 2019 14:51:01 +0000 (UTC)
Received: from thuth.com (dhcp-200-228.str.redhat.com [10.33.200.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 64E1F60468;
 Fri, 11 Oct 2019 14:51:00 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Max Reitz <mreitz@redhat.com>,
	qemu-block@nongnu.org
Subject: [PATCH 2/5] iotests: Test 041 does not work on macOS
Date: Fri, 11 Oct 2019 16:50:44 +0200
Message-Id: <20191011145047.19051-3-thuth@redhat.com>
In-Reply-To: <20191011145047.19051-1-thuth@redhat.com>
References: <20191011145047.19051-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Fri, 11 Oct 2019 14:51:01 +0000 (UTC)
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

041 works fine on Linux, FreeBSD and OpenBSD, so let's mark it as
only supported on these systems.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qemu-iotests/041 | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/041 b/tests/qemu-iotests/041
index 8568426311..7211f1950a 100755
--- a/tests/qemu-iotests/041
+++ b/tests/qemu-iotests/041
@@ -1123,4 +1123,5 @@ class TestOrphanedSource(iotests.QMPTestCase):
 
 if __name__ == '__main__':
     iotests.main(supported_fmts=['qcow2', 'qed'],
-                 supported_protocols=['file'])
+                 supported_protocols=['file'],
+                 supported_platforms=['linux', 'freebsd', 'openbsd6'])
-- 
2.18.1



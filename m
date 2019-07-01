Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5FB34618
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jun 2019 14:01:32 +0200 (CEST)
Received: from localhost ([127.0.0.1]:50906 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hY88B-0001a7-Qp
	for lists+qemu-devel@lfdr.de; Tue, 04 Jun 2019 08:01:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57327)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hY84V-0007xN-Mt
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 07:57:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hY7zN-0000R6-5t
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 07:52:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43866)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hY7zM-0000Pi-0H
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 07:52:24 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 590388F90F
	for <qemu-devel@nongnu.org>; Tue,  4 Jun 2019 11:52:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-148.ams2.redhat.com
	[10.36.116.148])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 23B6D5D9D2;
	Tue,  4 Jun 2019 11:52:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id A93AC11386A7; Tue,  4 Jun 2019 13:52:21 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  4 Jun 2019 13:52:21 +0200
Message-Id: <20190604115221.28364-4-armbru@redhat.com>
In-Reply-To: <20190604115221.28364-1-armbru@redhat.com>
References: <20190604115221.28364-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 04 Jun 2019 11:52:23 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 3/3] qemu-bridge-helper: Document known
 shortcomings
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
Cc: jasowang@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qemu-bridge-helper.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/qemu-bridge-helper.c b/qemu-bridge-helper.c
index f9940deefd..95624bc300 100644
--- a/qemu-bridge-helper.c
+++ b/qemu-bridge-helper.c
@@ -10,7 +10,17 @@
  *
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
- *
+ */
+
+/*
+ * Known shortcomings:
+ * - There is no manual page
+ * - The syntax of the ACL file is not documented anywhere
+ * - parse_acl_file() doesn't report fopen() failure properly, fails
+ *   to check ferror() after fgets() failure, arbitrarily truncates
+ *   long lines, handles whitespace inconsistently, error messages
+ *   don't point to the offending file and line, errors in included
+ *   files are reported, but otherwise ignored, ...
  */
=20
 #include "qemu/osdep.h"
--=20
2.21.0



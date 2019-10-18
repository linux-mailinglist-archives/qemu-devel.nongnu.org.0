Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56896DBF08
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 09:54:36 +0200 (CEST)
Received: from localhost ([::1]:36094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLN5n-0002jx-9C
	for lists+qemu-devel@lfdr.de; Fri, 18 Oct 2019 03:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59529)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iLMvR-0000To-7a
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 03:43:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iLMvQ-0007gh-7H
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 03:43:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59754)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iLMvQ-0007fy-12
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 03:43:52 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 444B318C8906;
 Fri, 18 Oct 2019 07:43:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.118.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F18861001B36;
 Fri, 18 Oct 2019 07:43:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A07D41132986; Fri, 18 Oct 2019 09:43:45 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/7] qapi: Clear scripts/qapi/doc.py executable bits again
Date: Fri, 18 Oct 2019 09:43:45 +0200
Message-Id: <20191018074345.24034-8-armbru@redhat.com>
In-Reply-To: <20191018074345.24034-1-armbru@redhat.com>
References: <20191018074345.24034-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Fri, 18 Oct 2019 07:43:51 +0000 (UTC)
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
Cc: kwolf@redhat.com, marcandre.lureau@redhat.com, mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit fbf09a2fa4 "qapi: add 'ifcond' to visitor methods" brought back
the executable bits.  Fix that.  Drop the #! line for good measure.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 scripts/qapi/doc.py | 1 -
 1 file changed, 1 deletion(-)
 mode change 100755 =3D> 100644 scripts/qapi/doc.py

diff --git a/scripts/qapi/doc.py b/scripts/qapi/doc.py
old mode 100755
new mode 100644
index 1c5125249f..dc8919bab7
--- a/scripts/qapi/doc.py
+++ b/scripts/qapi/doc.py
@@ -1,4 +1,3 @@
-#!/usr/bin/env python
 # QAPI texi generator
 #
 # This work is licensed under the terms of the GNU LGPL, version 2+.
--=20
2.21.0



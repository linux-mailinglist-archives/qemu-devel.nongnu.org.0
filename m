Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A38FCDEA31
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 12:58:28 +0200 (CEST)
Received: from localhost ([::1]:37770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMVON-00017z-By
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 06:58:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45808)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iMVKP-0004NM-Jn
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 06:54:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iMVKO-0001pg-Bk
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 06:54:21 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:24450
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iMVKO-0001pU-8E
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 06:54:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571655259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EWEY4b6PjdseCjRZ6lS/PKvEvsNUldXSh2Vzzbk2YUI=;
 b=W0FQs+VqIUB4JcHmHqjSPC6pTG3cjZRK3dD7mX2Ym0ND6FfDPzvR3Av/FuLCJ/ruOrA7yB
 UDEt9u4r3Rrq5H9U6wHnJ3wbZUWF6VqucGtOYPKhwrK1a37499I0IcqwSiwcOqW/Ecsih4
 iD979yCxW13AOO2mbycZIw6+/rCpO0w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-uajou6qzP_KSOFcec3-lFw-1; Mon, 21 Oct 2019 06:54:16 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0023480183E;
 Mon, 21 Oct 2019 10:54:16 +0000 (UTC)
Received: from thuth.com (dhcp-200-228.str.redhat.com [10.33.200.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 85D2C60BE2;
 Mon, 21 Oct 2019 10:54:12 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Max Reitz <mreitz@redhat.com>,
	qemu-block@nongnu.org
Subject: [PATCH v2 5/6] iotests: Enable more tests in the 'auto' group to
 improve test coverage
Date: Mon, 21 Oct 2019 12:53:49 +0200
Message-Id: <20191021105350.1710-6-thuth@redhat.com>
In-Reply-To: <20191021105350.1710-1-thuth@redhat.com>
References: <20191021105350.1710-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: uajou6qzP_KSOFcec3-lFw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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

According to Kevin, tests 030, 040 and 041 are among the most valuable
tests that we have, so we should always run them if possible, even if
they take a little bit longer.

According to Max, it would be good to have a test for iothreads and
migration. 127 and 256 seem to be good candidates for iothreads. For
migration, let's enable 091, 181, 183, and 203 (which also tests
iothreads).

Reviewed-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qemu-iotests/group | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/tests/qemu-iotests/group b/tests/qemu-iotests/group
index a73df279e5..2dd671b82e 100644
--- a/tests/qemu-iotests/group
+++ b/tests/qemu-iotests/group
@@ -51,7 +51,7 @@
 027 rw auto quick
 028 rw backing quick
 029 rw auto quick
-030 rw backing
+030 rw auto backing
 031 rw auto quick
 032 rw auto quick
 033 rw auto quick
@@ -61,8 +61,8 @@
 037 rw auto backing quick
 038 rw auto backing quick
 039 rw auto quick
-040 rw
-041 rw backing
+040 rw auto
+041 rw auto backing
 042 rw auto quick
 043 rw auto backing
 044 rw
@@ -112,7 +112,7 @@
 088 rw quick
 089 rw auto quick
 090 rw auto quick
-091 rw migration
+091 rw auto migration
 092 rw quick
 093 throttle
 094 rw quick
@@ -148,7 +148,7 @@
 124 rw backing
 125 rw
 126 rw auto backing
-127 rw backing quick
+127 rw auto backing quick
 128 rw quick
 129 rw quick
 130 rw auto quick
@@ -197,9 +197,9 @@
 177 rw auto quick
 178 img
 179 rw auto quick
-181 rw migration
+181 rw auto migration
 182 rw quick
-183 rw migration
+183 rw auto migration
 184 rw auto quick
 185 rw
 186 rw auto
@@ -218,7 +218,7 @@
 200 rw
 201 rw migration
 202 rw quick
-203 rw migration
+203 rw auto migration
 204 rw quick
 205 rw quick
 206 rw
@@ -270,7 +270,7 @@
 253 rw quick
 254 rw backing quick
 255 rw quick
-256 rw quick
+256 rw auto quick
 257 rw
 258 rw quick
 260 rw quick
--=20
2.18.1



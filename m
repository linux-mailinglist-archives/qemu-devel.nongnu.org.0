Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 584A1170CFC
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 01:08:25 +0100 (CET)
Received: from localhost ([::1]:51958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j76j2-0007Mt-AT
	for lists+qemu-devel@lfdr.de; Wed, 26 Feb 2020 19:08:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43616)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1j76hn-0005SD-DT
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 19:07:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1j76hm-0006Xm-C6
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 19:07:07 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:21851
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>) id 1j76hm-00069l-7Y
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 19:07:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582762017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F2/TLEFNAnR/6w7FDslSwzZinHAthOw8JkWxuNg8xwY=;
 b=CDxs1mCzJDl2iWWht0/T9y/PgM6RW8RuryXxtizXeLsrWyUxMJsWAGPRYUOp+LejJS9Nfz
 6VWdDR6Q5M16guw8/nXyj2ngwiVmXssHjlLgdOQSrAXLrVrKS14Xe1IqzreOMdAubikZnQ
 /gAWSQau7Ig83ZKfIDNWme4vQ6+elZk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-VMiw1pFgN9W-VOmcYnoqNw-1; Wed, 26 Feb 2020 19:06:51 -0500
X-MC-Unique: VMiw1pFgN9W-VOmcYnoqNw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95FE918FF661;
 Thu, 27 Feb 2020 00:06:50 +0000 (UTC)
Received: from probe.redhat.com (ovpn-123-58.rdu2.redhat.com [10.10.123.58])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 17963390;
 Thu, 27 Feb 2020 00:06:50 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 9/9] iotests: add pylintrc file
Date: Wed, 26 Feb 2020 19:06:39 -0500
Message-Id: <20200227000639.9644-10-jsnow@redhat.com>
In-Reply-To: <20200227000639.9644-1-jsnow@redhat.com>
References: <20200227000639.9644-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Repeatable results. run `pylint iotests.py` and you should get a pass.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/pylintrc | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 tests/qemu-iotests/pylintrc

diff --git a/tests/qemu-iotests/pylintrc b/tests/qemu-iotests/pylintrc
new file mode 100644
index 0000000000..feed506f75
--- /dev/null
+++ b/tests/qemu-iotests/pylintrc
@@ -0,0 +1,20 @@
+[MESSAGES CONTROL]
+
+# Disable the message, report, category or checker with the given id(s). Y=
ou
+# can either give multiple identifiers separated by comma (,) or put this
+# option multiple times (only on the command line, not in the configuratio=
n
+# file where it should appear only once). You can also use "--disable=3Dal=
l" to
+# disable everything first and then reenable specific checks. For example,=
 if
+# you want to run only the similarities checker, you can use "--disable=3D=
all
+# --enable=3Dsimilarities". If you want to run only the classes checker, b=
ut have
+# no Warning level messages displayed, use "--disable=3Dall --enable=3Dcla=
sses
+# --disable=3DW".
+disable=3Dinvalid-name,
+        missing-docstring,
+        line-too-long,
+        too-many-lines,
+        too-few-public-methods,
+        too-many-arguments,
+        too-many-locals,
+        too-many-branches,
+        too-many-public-methods,
\ No newline at end of file
--=20
2.21.1



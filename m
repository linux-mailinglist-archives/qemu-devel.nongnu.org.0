Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A19B8AA516
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Sep 2019 15:52:01 +0200 (CEST)
Received: from localhost ([::1]:46276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5sB6-0000H0-OR
	for lists+qemu-devel@lfdr.de; Thu, 05 Sep 2019 09:52:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50255)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1i5s54-0004S9-Lb
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 09:45:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1i5s53-0005Bp-Ko
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 09:45:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42326)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1i5s52-0005Al-09
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 09:45:44 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DAAF4307BCC4;
 Thu,  5 Sep 2019 13:45:42 +0000 (UTC)
Received: from dhcp-17-64.lcy.redhat.com (unknown [10.42.17.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9CD195C1D4;
 Thu,  5 Sep 2019 13:45:41 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  5 Sep 2019 14:45:26 +0100
Message-Id: <20190905134526.32146-5-berrange@redhat.com>
In-Reply-To: <20190905134526.32146-1-berrange@redhat.com>
References: <20190905134526.32146-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Thu, 05 Sep 2019 13:45:42 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 4/4] docs: split the CODING_STYLE doc into
 distinct groups
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 CODING_STYLE.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/CODING_STYLE.rst b/CODING_STYLE.rst
index 39397f0f6f..427699e0e4 100644
--- a/CODING_STYLE.rst
+++ b/CODING_STYLE.rst
@@ -7,6 +7,9 @@ QEMU Coding Style
 Please use the script checkpatch.pl in the scripts directory to check
 patches before submitting.
=20
+Formatting and style
+********************
+
 Whitespace
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
@@ -205,6 +208,9 @@ comment anyway.)
 Rationale: Consistency, and ease of visually picking out a multiline
 comment from the surrounding code.
=20
+Language usage
+**************
+
 Preprocessor
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
@@ -526,6 +532,9 @@ are still some caveats to beware of
     }
=20
=20
+QEMU Specific Idioms
+********************
+
 Error handling and reporting
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
=20
--=20
2.21.0



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03235A21A3
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Aug 2019 19:00:56 +0200 (CEST)
Received: from localhost ([::1]:52144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i3Nn4-0001y4-Vm
	for lists+qemu-devel@lfdr.de; Thu, 29 Aug 2019 13:00:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47528)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1i3NdL-00015j-Ih
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 12:50:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1i3NdK-0007wW-Hq
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 12:50:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47588)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1i3NdK-0007wC-CX
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 12:50:50 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B05127FDCC;
 Thu, 29 Aug 2019 16:50:49 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-60.ams2.redhat.com
 [10.36.112.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D63AE1001B05;
 Thu, 29 Aug 2019 16:50:47 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 29 Aug 2019 17:50:36 +0100
Message-Id: <20190829165036.9773-5-berrange@redhat.com>
In-Reply-To: <20190829165036.9773-1-berrange@redhat.com>
References: <20190829165036.9773-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Thu, 29 Aug 2019 16:50:49 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 4/4] docs: split the CODING_STYLE doc into
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
 Stefan Hajnoczi <stefanha@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F7224D60
	for <lists+qemu-devel@lfdr.de>; Tue, 21 May 2019 12:59:21 +0200 (CEST)
Received: from localhost ([127.0.0.1]:51356 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hT2UK-0003py-Pm
	for lists+qemu-devel@lfdr.de; Tue, 21 May 2019 06:59:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56812)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hT2P6-0008Pe-Co
	for qemu-devel@nongnu.org; Tue, 21 May 2019 06:53:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hT2P5-0004Vj-EZ
	for qemu-devel@nongnu.org; Tue, 21 May 2019 06:53:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33780)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>) id 1hT2P5-0004Uc-9A
	for qemu-devel@nongnu.org; Tue, 21 May 2019 06:53:55 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8661D3092674;
	Tue, 21 May 2019 10:53:54 +0000 (UTC)
Received: from thuth.com (ovpn-116-22.ams2.redhat.com [10.36.116.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 547E078425;
	Tue, 21 May 2019 10:53:53 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Tue, 21 May 2019 12:53:33 +0200
Message-Id: <20190521105344.11637-3-thuth@redhat.com>
In-Reply-To: <20190521105344.11637-1-thuth@redhat.com>
References: <20190521105344.11637-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Tue, 21 May 2019 10:53:54 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 02/13] tests/libqtest: Fix description of
 qtest_vinitf() and qtest_initf()
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
Cc: kwolf@redhat.com, lvivier@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These functions are convenience wrappers of qtest_init() and not of
qtest_start().

Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <20190513154759.24973-1-thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/libqtest.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/libqtest.h b/tests/libqtest.h
index 3f7675fcf0..a98ea15b7d 100644
--- a/tests/libqtest.h
+++ b/tests/libqtest.h
@@ -29,7 +29,7 @@ extern QTestState *global_qtest;
  * @fmt...: Format for creating other arguments to pass to QEMU, formatt=
ed
  * like sprintf().
  *
- * Convenience wrapper around qtest_start().
+ * Convenience wrapper around qtest_init().
  *
  * Returns: #QTestState instance.
  */
@@ -41,7 +41,7 @@ QTestState *qtest_initf(const char *fmt, ...) GCC_FMT_A=
TTR(1, 2);
  * like vsprintf().
  * @ap: Format arguments.
  *
- * Convenience wrapper around qtest_start().
+ * Convenience wrapper around qtest_init().
  *
  * Returns: #QTestState instance.
  */
--=20
2.21.0



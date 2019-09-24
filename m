Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 590E2BCAF8
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Sep 2019 17:17:06 +0200 (CEST)
Received: from localhost ([::1]:46894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCmYr-0001rV-0K
	for lists+qemu-devel@lfdr.de; Tue, 24 Sep 2019 11:17:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37970)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iClYd-0008DK-A7
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 10:12:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iClYb-0007py-R3
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 10:12:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35338)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iClYT-0007n6-Pp; Tue, 24 Sep 2019 10:12:38 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8471230A7B89;
 Tue, 24 Sep 2019 14:12:36 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.15])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 990645C1B2;
 Tue, 24 Sep 2019 14:12:31 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/timer/pl031: Add warning "do not use as model to implement
 a RTC"
Date: Tue, 24 Sep 2019 16:12:28 +0200
Message-Id: <20190924141228.25009-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Tue, 24 Sep 2019 14:12:36 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter said we should "not use the pl031 as a good model of how
to do an RTC, it has some definite flaws."
Add this information to the PL031 header for other developers.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/timer/pl031.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/timer/pl031.c b/hw/timer/pl031.c
index 2b3e261006..da453b5b04 100644
--- a/hw/timer/pl031.c
+++ b/hw/timer/pl031.c
@@ -1,6 +1,14 @@
 /*
  * ARM AMBA PrimeCell PL031 RTC
  *
+ * Note from the maintainer:
+ *
+ * Don't use the pl031 code as a good model of how to do an RTC,
+ * it has some definite flaws. x86 or ppc RTC handling is probably
+ * a better place to look.
+ *
+ * See https://lists.gnu.org/archive/html/qemu-devel/2019-09/msg05399.ht=
ml
+ *
  * Copyright (c) 2007 CodeSourcery
  *
  * This file is free software; you can redistribute it and/or modify
--=20
2.20.1



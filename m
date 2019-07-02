Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B575CE7E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 13:36:35 +0200 (CEST)
Received: from localhost ([::1]:51882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiH5P-0007tk-5I
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 07:36:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60944)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hiH3J-0006CG-KE
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 07:34:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hiH3I-0001Z4-En
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 07:34:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49356)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hiH3I-0001X8-8A
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 07:34:24 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 14EF3C057F2E;
 Tue,  2 Jul 2019 11:34:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-102.ams2.redhat.com
 [10.36.116.102])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 92C6E1750A;
 Tue,  2 Jul 2019 11:34:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 25B5B1132ADD; Tue,  2 Jul 2019 13:34:14 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  2 Jul 2019 13:34:11 +0200
Message-Id: <20190702113414.6896-2-armbru@redhat.com>
In-Reply-To: <20190702113414.6896-1-armbru@redhat.com>
References: <20190702113414.6896-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Tue, 02 Jul 2019 11:34:18 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 1/4] Makefile: Remove code to smooth transition
 to config.status
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When commit bdf523e6923 made configure generate config.status, it
added a fallback to Makefile to smooth the transition, with a TODO
"code can be removed after QEMU 1.7."  It's been more than five years.
Remove it.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <20190528082308.22032-2-armbru@redhat.com>
---
 Makefile | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index b1c93ac027..0f2cb271a2 100644
--- a/Makefile
+++ b/Makefile
@@ -73,14 +73,7 @@ CONFIG_ALL=3Dy
=20
 config-host.mak: $(SRC_PATH)/configure $(SRC_PATH)/pc-bios $(SRC_PATH)/V=
ERSION
 	@echo $@ is out-of-date, running configure
-	@# TODO: The next lines include code which supports a smooth
-	@# transition from old configurations without config.status.
-	@# This code can be removed after QEMU 1.7.
-	@if test -x config.status; then \
-	    ./config.status; \
-        else \
-	    sed -n "/.*Configured with/s/[^:]*: //p" $@ | sh; \
-	fi
+	@./config.status
 else
 config-host.mak:
 ifneq ($(filter-out $(UNCHECKED_GOALS),$(MAKECMDGOALS)),$(if $(MAKECMDGO=
ALS),,fail))
--=20
2.21.0



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B13D5E325
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jul 2019 13:50:25 +0200 (CEST)
Received: from localhost ([::1]:35070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hidmK-0006xx-ND
	for lists+qemu-devel@lfdr.de; Wed, 03 Jul 2019 07:50:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43421)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hidjw-0005Ai-3V
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 07:47:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hidju-0007gn-UN
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 07:47:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50008)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hidju-00075g-NR
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 07:47:54 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2593758E5C;
 Wed,  3 Jul 2019 11:47:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-136.ams2.redhat.com
 [10.36.116.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B9D97A7E1;
 Wed,  3 Jul 2019 11:47:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 432DD1132ADD; Wed,  3 Jul 2019 13:47:14 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  3 Jul 2019 13:47:11 +0200
Message-Id: <20190703114714.4234-2-armbru@redhat.com>
In-Reply-To: <20190703114714.4234-1-armbru@redhat.com>
References: <20190703114714.4234-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Wed, 03 Jul 2019 11:47:19 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL v2 1/4] Makefile: Remove code to smooth
 transition to config.status
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



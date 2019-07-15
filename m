Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A136835C
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jul 2019 07:58:15 +0200 (CEST)
Received: from localhost ([::1]:35280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hmu06-0005RE-32
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 01:58:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37678)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hmtzb-0004C3-5p
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 01:57:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hmtza-0007Xj-8v
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 01:57:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59018)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hmtza-0007Vd-3B
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 01:57:42 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9EF2E30862BE;
 Mon, 15 Jul 2019 05:57:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-111.ams2.redhat.com
 [10.36.116.111])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E115F5D717;
 Mon, 15 Jul 2019 05:57:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 675951138660; Mon, 15 Jul 2019 07:57:36 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 15 Jul 2019 07:57:35 +0200
Message-Id: <20190715055736.15214-2-armbru@redhat.com>
In-Reply-To: <20190715055736.15214-1-armbru@redhat.com>
References: <20190715055736.15214-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Mon, 15 Jul 2019 05:57:40 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH for-4.1 1/2] Makefile: Fix missing dependency
 of on qemu-tech.texi
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
Cc: peter.maydell@linaro.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The qemu-doc.{html,info,pdf,txt} depend on qemu-doc.texi and its
include files.  Except qemu-tech.texi is missing.  Has always been
missing as far as I can see.  Fix it.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 1fcbaed62c..8212a1446c 100644
--- a/Makefile
+++ b/Makefile
@@ -1020,7 +1020,8 @@ pdf: qemu-doc.pdf docs/interop/qemu-qmp-ref.pdf doc=
s/interop/qemu-ga-ref.pdf
 txt: qemu-doc.txt docs/interop/qemu-qmp-ref.txt docs/interop/qemu-ga-ref=
.txt
=20
 qemu-doc.html qemu-doc.info qemu-doc.pdf qemu-doc.txt: \
-	qemu-img.texi qemu-nbd.texi qemu-options.texi qemu-option-trace.texi \
+	qemu-img.texi qemu-nbd.texi qemu-options.texi \
+	qemu-tech.texi qemu-option-trace.texi \
 	qemu-deprecated.texi qemu-monitor.texi qemu-img-cmds.texi qemu-ga.texi =
\
 	qemu-monitor-info.texi docs/qemu-block-drivers.texi \
 	docs/qemu-cpu-models.texi docs/security.texi
--=20
2.21.0



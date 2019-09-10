Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3045CAE3F0
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Sep 2019 08:45:36 +0200 (CEST)
Received: from localhost ([::1]:34262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7ZuA-0004Hy-PN
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 02:45:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38543)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1i7ZmO-0004kB-Em
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 02:37:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1i7ZmL-0007hJ-Ks
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 02:37:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44416)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1i7ZmL-0007gZ-FD
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 02:37:29 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0CB3C9B286;
 Tue, 10 Sep 2019 06:37:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 937B260852;
 Tue, 10 Sep 2019 06:37:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 21C6F1165362; Tue, 10 Sep 2019 08:37:24 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 10 Sep 2019 08:37:09 +0200
Message-Id: <20190910063724.28470-2-armbru@redhat.com>
In-Reply-To: <20190910063724.28470-1-armbru@redhat.com>
References: <20190910063724.28470-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Tue, 10 Sep 2019 06:37:28 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 01/16] scripts/git.orderfile: Match QAPI
 schema more precisely
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
Cc: marcandre.lureau@redhat.com, mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pattern *.json also matches the tests/qapi-schema/*.json.  Separates
them from the tests/qapi-schema/*.{err,exit,out} in diffs.  I hate
that.  Change the pattern to match just the "real" QAPI schemata.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/git.orderfile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/git.orderfile b/scripts/git.orderfile
index ac699700b1..e89790941c 100644
--- a/scripts/git.orderfile
+++ b/scripts/git.orderfile
@@ -19,11 +19,11 @@ Makefile*
 *.mak
=20
 # qapi schema
-*.json
+qapi/*.json
+qga/*.json
=20
 # headers
 *.h
=20
 # code
 *.c
-
--=20
2.21.0



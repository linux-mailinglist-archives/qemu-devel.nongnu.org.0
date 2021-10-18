Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6B5431D3A
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 15:47:52 +0200 (CEST)
Received: from localhost ([::1]:49234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcSzX-0007vW-Ar
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 09:47:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mcSxA-0006V1-2Z
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 09:45:24 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:33507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mcSx7-0007iE-Mf
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 09:45:23 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-CyGRPhX_PfuRsHwvtGOs8w-1; Mon, 18 Oct 2021 09:45:11 -0400
X-MC-Unique: CyGRPhX_PfuRsHwvtGOs8w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 780989F92A;
 Mon, 18 Oct 2021 13:45:10 +0000 (UTC)
Received: from bahia.huguette (unknown [10.39.192.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F1867908B;
 Mon, 18 Oct 2021 13:45:09 +0000 (UTC)
Subject: [PATCH] README: Fix some documentation URLs
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Date: Mon, 18 Oct 2021 15:45:08 +0200
Message-ID: <163456470882.196333.17366490695504718038.stgit@bahia.huguette>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All of these pages live in the wiki, not in the main web site.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 README.rst |   14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/README.rst b/README.rst
index 79b19f1481e1..23795b837740 100644
--- a/README.rst
+++ b/README.rst
@@ -59,9 +59,9 @@ of other UNIX targets. The simple steps to build QEMU are=
:
=20
 Additional information can also be found online via the QEMU website:
=20
-* `<https://qemu.org/Hosts/Linux>`_
-* `<https://qemu.org/Hosts/Mac>`_
-* `<https://qemu.org/Hosts/W32>`_
+* `<https://wiki.qemu.org/Hosts/Linux>`_
+* `<https://wiki.qemu.org/Hosts/Mac>`_
+* `<https://wiki.qemu.org/Hosts/W32>`_
=20
=20
 Submitting patches
@@ -84,8 +84,8 @@ the Developers Guide.
 Additional information on submitting patches can be found online via
 the QEMU website
=20
-* `<https://qemu.org/Contribute/SubmitAPatch>`_
-* `<https://qemu.org/Contribute/TrivialPatches>`_
+* `<https://wiki.qemu.org/Contribute/SubmitAPatch>`_
+* `<https://wiki.qemu.org/Contribute/TrivialPatches>`_
=20
 The QEMU website is also maintained under source control.
=20
@@ -144,7 +144,7 @@ reported via GitLab.
=20
 For additional information on bug reporting consult:
=20
-* `<https://qemu.org/Contribute/ReportABug>`_
+* `<https://wiki.qemu.org/Contribute/ReportABug>`_
=20
=20
 ChangeLog
@@ -168,4 +168,4 @@ main methods being email and IRC
 Information on additional methods of contacting the community can be
 found online via the QEMU website:
=20
-* `<https://qemu.org/Contribute/StartHere>`_
+* `<https://wiki.qemu.org/Contribute/StartHere>`_




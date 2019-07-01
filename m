Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A47321446A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 May 2019 08:20:09 +0200 (CEST)
Received: from localhost ([127.0.0.1]:51116 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNWyu-0008AM-Rn
	for lists+qemu-devel@lfdr.de; Mon, 06 May 2019 02:20:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55574)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNWxs-0007oV-Dp
	for qemu-devel@nongnu.org; Mon, 06 May 2019 02:19:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNWxr-0008Ap-Gm
	for qemu-devel@nongnu.org; Mon, 06 May 2019 02:19:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48520)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hNWxp-00089C-1h; Mon, 06 May 2019 02:19:01 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DE7AD30832C9;
	Mon,  6 May 2019 06:18:59 +0000 (UTC)
Received: from thuth.com (ovpn-116-74.ams2.redhat.com [10.36.116.74])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6CCDB98B0;
	Mon,  6 May 2019 06:18:58 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  6 May 2019 08:18:54 +0200
Message-Id: <20190506061854.22207-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Mon, 06 May 2019 06:19:00 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [QEMU PATCH] MAINTAINERS: Downgrade status of block
 sections without "M:" to "Odd Fixes"
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
Cc: kwolf@redhat.com, qemu-trivial@nongnu.org, Niels de Vos <ndevos@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes might still get picked up via the qemu-block mailing list,
so the status is not "Orphan" yet.
Also add the gluster mailing list as suggested by Niels here:

 https://patchwork.kernel.org/patch/10613297/#22409943

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 66ddbda9c9..899a4cd572 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2404,12 +2404,13 @@ F: block/ssh.c
=20
 CURL
 L: qemu-block@nongnu.org
-S: Supported
+S: Odd Fixes
 F: block/curl.c
=20
 GLUSTER
 L: qemu-block@nongnu.org
-S: Supported
+L: integration@gluster.org
+S: Odd Fixes
 F: block/gluster.c
=20
 Null Block Driver
--=20
2.21.0



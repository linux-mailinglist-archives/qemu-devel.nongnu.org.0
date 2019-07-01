Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4221A150
	for <lists+qemu-devel@lfdr.de>; Fri, 10 May 2019 18:22:20 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46211 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hP8Hs-00083G-1t
	for lists+qemu-devel@lfdr.de; Fri, 10 May 2019 12:22:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39999)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hP8CM-000490-UM
	for qemu-devel@nongnu.org; Fri, 10 May 2019 12:16:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hP8CL-0008GX-UL
	for qemu-devel@nongnu.org; Fri, 10 May 2019 12:16:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51558)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hP8CJ-0008BC-Me; Fri, 10 May 2019 12:16:35 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0750A3082A4C;
	Fri, 10 May 2019 16:16:35 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-116-183.ams2.redhat.com
	[10.36.116.183])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2261317791;
	Fri, 10 May 2019 16:16:33 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Fri, 10 May 2019 18:16:01 +0200
Message-Id: <20190510161614.23236-3-kwolf@redhat.com>
In-Reply-To: <20190510161614.23236-1-kwolf@redhat.com>
References: <20190510161614.23236-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Fri, 10 May 2019 16:16:35 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 02/15] MAINTAINERS: Downgrade status of block
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

Fixes might still get picked up via the qemu-block mailing list,
so the status is not "Orphan" yet.
Also add the gluster mailing list as suggested by Niels here:

 https://patchwork.kernel.org/patch/10613297/#22409943

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Niels de Vos <ndevos@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
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
2.20.1



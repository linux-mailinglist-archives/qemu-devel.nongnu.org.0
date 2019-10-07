Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADC4CECFB
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Oct 2019 21:49:46 +0200 (CEST)
Received: from localhost ([::1]:49304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHZ0q-0000a0-M9
	for lists+qemu-devel@lfdr.de; Mon, 07 Oct 2019 15:49:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60974)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iHYzw-0008Qh-9h
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 15:48:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iHYzv-0008Tj-AU
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 15:48:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41230)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1iHYzr-0008Ri-TX; Mon, 07 Oct 2019 15:48:44 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7376E51EE6;
 Mon,  7 Oct 2019 19:48:42 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-162.phx2.redhat.com [10.3.116.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F9495D6A3;
 Mon,  7 Oct 2019 19:48:41 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qemu-nbd: Document benefit of --pid-file
Date: Mon,  7 Oct 2019 14:48:40 -0500
Message-Id: <20191007194840.29518-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Mon, 07 Oct 2019 19:48:42 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: vsementsov@virtuozzo.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

One benefit of --pid-file is that it is easier to probe the file
system to see if a pid file has been created than it is to probe if a
socket is available for connection. Document that this is an
intentional feature.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 qemu-nbd.texi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/qemu-nbd.texi b/qemu-nbd.texi
index 7f55657722bd..d495bbe8a0ed 100644
--- a/qemu-nbd.texi
+++ b/qemu-nbd.texi
@@ -118,7 +118,8 @@ in list mode.
 @item --fork
 Fork off the server process and exit the parent once the server is runni=
ng.
 @item --pid-file=3DPATH
-Store the server's process ID in the given file.
+Store the server's process ID in the given file.  The pid file is not
+created until after the server socket is open.
 @item --tls-authz=3DID
 Specify the ID of a qauthz object previously created with the
 --object option. This will be used to authorize connecting users
--=20
2.21.0



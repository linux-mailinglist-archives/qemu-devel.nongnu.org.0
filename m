Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96419B8284
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Sep 2019 22:35:07 +0200 (CEST)
Received: from localhost ([::1]:48424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iB38s-0007de-4y
	for lists+qemu-devel@lfdr.de; Thu, 19 Sep 2019 16:35:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48000)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crobinso@redhat.com>) id 1iB37c-000786-BU
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 16:33:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crobinso@redhat.com>) id 1iB37a-0001cO-IF
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 16:33:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:16583)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crobinso@redhat.com>) id 1iB37a-0001bN-DH
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 16:33:46 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2A2E08D3BC
 for <qemu-devel@nongnu.org>; Thu, 19 Sep 2019 20:33:45 +0000 (UTC)
Received: from worklaptop.redhat.com (ovpn-122-66.rdu2.redhat.com
 [10.10.122.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 314375C1B5;
 Thu, 19 Sep 2019 20:33:38 +0000 (UTC)
From: Cole Robinson <crobinso@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] vhost-user-gpu: Drop trailing json comma
Date: Thu, 19 Sep 2019 16:33:44 -0400
Message-Id: <7f5dd2ac9f3504e2699f23e69bc3d8051b729832.1568925097.git.crobinso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Thu, 19 Sep 2019 20:33:45 +0000 (UTC)
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Trailing comma is not valid json:

$ cat contrib/vhost-user-gpu/50-qemu-gpu.json.in | jq
parse error: Expected another key-value pair at line 5, column 1

Signed-off-by: Cole Robinson <crobinso@redhat.com>
---
 contrib/vhost-user-gpu/50-qemu-gpu.json.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/vhost-user-gpu/50-qemu-gpu.json.in b/contrib/vhost-u=
ser-gpu/50-qemu-gpu.json.in
index 658b545864..f5edd097f8 100644
--- a/contrib/vhost-user-gpu/50-qemu-gpu.json.in
+++ b/contrib/vhost-user-gpu/50-qemu-gpu.json.in
@@ -1,5 +1,5 @@
 {
   "description": "QEMU vhost-user-gpu",
   "type": "gpu",
-  "binary": "@libexecdir@/vhost-user-gpu",
+  "binary": "@libexecdir@/vhost-user-gpu"
 }
--=20
2.23.0



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0202B148D
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Sep 2019 20:48:53 +0200 (CEST)
Received: from localhost ([::1]:37722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8U9F-0000fj-3X
	for lists+qemu-devel@lfdr.de; Thu, 12 Sep 2019 14:48:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60261)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1i8U6p-0000B1-Gi
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 14:46:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1i8U6n-0006cK-RX
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 14:46:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59608)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1i8U6n-0006a6-33
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 14:46:21 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 66435C057F31
 for <qemu-devel@nongnu.org>; Thu, 12 Sep 2019 18:46:12 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-234.phx2.redhat.com [10.3.116.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2358D600CC;
 Thu, 12 Sep 2019 18:46:11 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 12 Sep 2019 13:46:07 -0500
Message-Id: <20190912184607.3507-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Thu, 12 Sep 2019 18:46:12 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] build: Don't ignore qapi-visit-core.c
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
Cc: Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This file is version-controlled, and not generated from a .json file.

Fixes: bf582c3461b
Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index e9bbc006d39e..7de868d1eab4 100644
--- a/.gitignore
+++ b/.gitignore
@@ -41,6 +41,7 @@
 /qapi/qapi-types-*.[ch]
 /qapi/qapi-types.[ch]
 /qapi/qapi-visit-*.[ch]
+!/qapi/qapi-visit-core.c
 /qapi/qapi-visit.[ch]
 /qapi/qapi-doc.texi
 /qemu-doc.html
--=20
2.21.0



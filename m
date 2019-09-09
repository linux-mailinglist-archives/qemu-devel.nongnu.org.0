Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A579AD9BC
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Sep 2019 15:11:00 +0200 (CEST)
Received: from localhost ([::1]:56486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7JRb-0003Pl-K5
	for lists+qemu-devel@lfdr.de; Mon, 09 Sep 2019 09:10:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56228)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1i7JPQ-00025C-84
 for qemu-devel@nongnu.org; Mon, 09 Sep 2019 09:08:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1i7JPP-0008MX-9M
 for qemu-devel@nongnu.org; Mon, 09 Sep 2019 09:08:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59772)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1i7JPP-0008MB-4M
 for qemu-devel@nongnu.org; Mon, 09 Sep 2019 09:08:43 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7C7637FDFD
 for <qemu-devel@nongnu.org>; Mon,  9 Sep 2019 13:08:42 +0000 (UTC)
Received: from donizetti.redhat.com (ovpn-112-63.ams2.redhat.com
 [10.36.112.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4CFC1608C2;
 Mon,  9 Sep 2019 13:08:41 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  9 Sep 2019 15:08:40 +0200
Message-Id: <20190909130840.25117-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Mon, 09 Sep 2019 13:08:42 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] win32: fix README file in NSIS installer
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
Cc: berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Adjust after the rST conversion and consequent renaming.

Fixes: 336a7451e8803c21a2da6e7d1eca8cfb8e8b219a
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qemu.nsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu.nsi b/qemu.nsi
index d0df0f4e3a..da18438071 100644
--- a/qemu.nsi
+++ b/qemu.nsi
@@ -119,7 +119,7 @@ Section "${PRODUCT} (required)"
     File "${SRCDIR}\Changelog"
     File "${SRCDIR}\COPYING"
     File "${SRCDIR}\COPYING.LIB"
-    File "${SRCDIR}\README"
+    File "${SRCDIR}\README.rst"
     File "${SRCDIR}\VERSION"
=20
     File "${BINDIR}\*.bmp"
--=20
2.21.0



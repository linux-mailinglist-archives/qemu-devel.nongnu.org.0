Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB84C17CDB
	for <lists+qemu-devel@lfdr.de>; Wed,  8 May 2019 17:09:45 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38807 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOOCW-0004Tj-SY
	for lists+qemu-devel@lfdr.de; Wed, 08 May 2019 11:09:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36353)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hOO98-0002gR-8X
	for qemu-devel@nongnu.org; Wed, 08 May 2019 11:06:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hOO97-0007DK-Ch
	for qemu-devel@nongnu.org; Wed, 08 May 2019 11:06:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47121)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hOO97-0007Cn-7W; Wed, 08 May 2019 11:06:13 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3534A19DD1;
	Wed,  8 May 2019 15:06:12 +0000 (UTC)
Received: from thuth.com (ovpn-116-100.ams2.redhat.com [10.36.116.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5C0DB50A63;
	Wed,  8 May 2019 15:06:11 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  8 May 2019 17:06:08 +0200
Message-Id: <20190508150608.3311-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 08 May 2019 15:06:12 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] include/exec/poison: Mark TARGET_FMT_lu as
 poisoned, too
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
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already poison TARGET_FMT_lx and TARGET_FMT_ld, but apparently
forgot to poison TARGET_FMT_lu, too. Do it now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/exec/poison.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/exec/poison.h b/include/exec/poison.h
index 1a7a57baae..b862320fa6 100644
--- a/include/exec/poison.h
+++ b/include/exec/poison.h
@@ -44,6 +44,7 @@
 #pragma GCC poison TARGET_LONG_BITS
 #pragma GCC poison TARGET_FMT_lx
 #pragma GCC poison TARGET_FMT_ld
+#pragma GCC poison TARGET_FMT_lu
=20
 #pragma GCC poison TARGET_PAGE_SIZE
 #pragma GCC poison TARGET_PAGE_MASK
--=20
2.21.0



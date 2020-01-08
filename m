Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F3F134B75
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jan 2020 20:25:29 +0100 (CET)
Received: from localhost ([::1]:48334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipGxM-0007Ns-IW
	for lists+qemu-devel@lfdr.de; Wed, 08 Jan 2020 14:25:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49726)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1ipGwE-0006Lc-H7
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 14:24:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1ipGwC-0001sH-55
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 14:24:17 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:35459
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1ipGwB-0001rO-VR
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 14:24:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578511455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WwFOMrqX73wgS5ZRyMqgaVo5lAi6RtsybQOFo8tMJvc=;
 b=HEA7QVVdb0CDU/iZNv4eXtB2k/aUeKr1WQMcj8WIvttVxSEeIIeLeut5C3GhGN0CZNFQTo
 KmA54LAEZSN5mp/CAQC7Q+3I1a0zDrXTVa0FnJo9PSuf8WLnXSBni/N2yTllyqPpiRAm++
 XGjb+XD2etJGWHH+Rjo9T3AcOzhi+aM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-R1vzWpBGPg-acnVnEso3KQ-1; Wed, 08 Jan 2020 14:24:12 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F6E018552A0;
 Wed,  8 Jan 2020 19:24:11 +0000 (UTC)
Received: from thuth.com (ovpn-117-114.ams2.redhat.com [10.36.117.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 226DE7C36E;
 Wed,  8 Jan 2020 19:24:07 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH] include/sysemu/sysemu.h: Remove usused variable no_quit
Date: Wed,  8 Jan 2020 20:24:02 +0100
Message-Id: <20200108192402.19672-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: R1vzWpBGPg-acnVnEso3KQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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

The no_quit variable has been removed in commit 78782712a62d56 ("vl: drop
no_quit variable"), so let's remove the extern declaration in the header
now, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/sysemu/sysemu.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 80c57fdc4e..686f4217a6 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -44,7 +44,6 @@ extern int alt_grab;
 extern int ctrl_grab;
 extern int cursor_hide;
 extern int graphic_rotate;
-extern int no_quit;
 extern int no_shutdown;
 extern int old_param;
 extern int boot_menu;
--=20
2.18.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4230F139B6
	for <lists+qemu-devel@lfdr.de>; Sat,  4 May 2019 14:18:17 +0200 (CEST)
Received: from localhost ([127.0.0.1]:55833 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMtcO-00007u-1t
	for lists+qemu-devel@lfdr.de; Sat, 04 May 2019 08:18:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53697)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hMtbB-00084t-F7
	for qemu-devel@nongnu.org; Sat, 04 May 2019 08:17:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hMtbA-0001r5-FH
	for qemu-devel@nongnu.org; Sat, 04 May 2019 08:17:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57766)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hMtb9-0001q4-LU; Sat, 04 May 2019 08:16:59 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E096C30821A5;
	Sat,  4 May 2019 12:16:57 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FBFF5D9C4;
	Sat,  4 May 2019 12:16:52 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Sat,  4 May 2019 14:16:50 +0200
Message-Id: <20190504121650.12651-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Sat, 04 May 2019 12:16:58 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] hw/display/cirrus_vga: Update the
 documentation URL
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The documentation URL is not working, but is backed up by the
Wayback Machine on the Internet Archive.
Replace the outdated link by a captured one.
Add another link to the VGADOC4b.ZIP archive content.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/display/cirrus_vga.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/display/cirrus_vga.c b/hw/display/cirrus_vga.c
index a0e71469f4d..a04440b3748 100644
--- a/hw/display/cirrus_vga.c
+++ b/hw/display/cirrus_vga.c
@@ -23,8 +23,13 @@
  * THE SOFTWARE.
  */
 /*
- * Reference: Finn Thogersons' VGADOC4b
- *   available at http://home.worldonline.dk/~finth/
+ * Reference: Finn Thogersons' VGADOC4b:
+ *
+ *  http://web.archive.org/web/20021019054927/http://home.worldonline.dk=
/finth/
+ *
+ * VGADOC4b.ZIP content available at:
+ *
+ *  https://pdos.csail.mit.edu/6.828/2005/readings/hardware/vgadoc
  */
 #include "qemu/osdep.h"
 #include "qemu/units.h"
--=20
2.20.1



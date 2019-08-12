Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6055896CB
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Aug 2019 07:27:31 +0200 (CEST)
Received: from localhost ([::1]:42984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hx2ri-0000F4-VR
	for lists+qemu-devel@lfdr.de; Mon, 12 Aug 2019 01:27:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57215)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hx2oY-0000JL-51
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 01:24:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hx2oV-0006Ba-O0
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 01:24:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41442)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hx2oV-0006A0-Dv
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 01:24:11 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9EE903083047
 for <qemu-devel@nongnu.org>; Mon, 12 Aug 2019 05:24:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 69F1928571;
 Mon, 12 Aug 2019 05:24:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 069981136429; Mon, 12 Aug 2019 07:24:00 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 12 Aug 2019 07:23:47 +0200
Message-Id: <20190812052359.30071-18-armbru@redhat.com>
In-Reply-To: <20190812052359.30071-1-armbru@redhat.com>
References: <20190812052359.30071-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Mon, 12 Aug 2019 05:24:10 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v4 17/29] Include qom/object.h slightly less
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

hw/hw.h used to include headers hardware emulation "usually" needs.
The previous commits removed all but one of them, to good effect.
Only qom/object.h is left.  Remove that one, too.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/hw/display/edid.h | 2 +-
 include/hw/hw.h           | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/hw/display/edid.h b/include/hw/display/edid.h
index 7948bd2c40..ff99dc0a05 100644
--- a/include/hw/display/edid.h
+++ b/include/hw/display/edid.h
@@ -1,7 +1,7 @@
 #ifndef EDID_H
 #define EDID_H
=20
-#include "hw/hw.h"
+#include "qom/object.h"
=20
 typedef struct qemu_edid_info {
     const char *vendor; /* http://www.uefi.org/pnp_id_list */
diff --git a/include/hw/hw.h b/include/hw/hw.h
index 8e18358e6a..8079b911fa 100644
--- a/include/hw/hw.h
+++ b/include/hw/hw.h
@@ -6,8 +6,6 @@
 #error Cannot include hw/hw.h from user emulation
 #endif
=20
-#include "qom/object.h"
-
 void QEMU_NORETURN hw_error(const char *fmt, ...) GCC_FMT_ATTR(1, 2);
=20
 #endif
--=20
2.21.0



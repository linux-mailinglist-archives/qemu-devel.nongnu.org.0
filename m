Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C0889D3A
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Aug 2019 13:38:48 +0200 (CEST)
Received: from localhost ([::1]:44492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hx8f2-0004IQ-4T
	for lists+qemu-devel@lfdr.de; Mon, 12 Aug 2019 07:38:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36106)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hx8eC-0002u2-2n
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 07:37:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hx8eB-0008MD-4v
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 07:37:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53874)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hx8eA-0008Lf-Vu; Mon, 12 Aug 2019 07:37:55 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4039E308C381;
 Mon, 12 Aug 2019 11:37:54 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-96.brq.redhat.com [10.40.204.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E5235D9CA;
 Mon, 12 Aug 2019 11:37:51 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 12 Aug 2019 13:37:37 +0200
Message-Id: <20190812113739.16587-2-philmd@redhat.com>
In-Reply-To: <20190812113739.16587-1-philmd@redhat.com>
References: <20190812113739.16587-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Mon, 12 Aug 2019 11:37:54 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 1/2] hw/display/sm501: Remove unused include
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
Cc: Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The "cpu.h" include makes devices target-specific. Since it
is not used, remove it, so the device become generic (we can
now compile it once for all targets).

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/display/sm501.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 5918f59b2b..b15fb1ab00 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -28,7 +28,6 @@
 #include "qapi/error.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
-#include "cpu.h"
 #include "hw/hw.h"
 #include "hw/char/serial.h"
 #include "ui/console.h"
--=20
2.20.1



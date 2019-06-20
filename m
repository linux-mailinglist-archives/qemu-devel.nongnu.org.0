Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E51A84D238
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jun 2019 17:32:57 +0200 (CEST)
Received: from localhost ([::1]:49294 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdz3Y-0002wH-I3
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 11:32:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44870)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kraxel@redhat.com>) id 1hdypD-0005m3-O0
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 11:18:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1hdyih-000454-3R
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 11:11:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45842)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hdyig-00042m-U2
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 11:11:23 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 56AB530811C7;
 Thu, 20 Jun 2019 15:11:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-212.ams2.redhat.com
 [10.36.116.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E6EC25D9E5;
 Thu, 20 Jun 2019 15:11:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BF45917446; Thu, 20 Jun 2019 17:11:04 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 20 Jun 2019 17:11:02 +0200
Message-Id: <20190620151104.2678-2-kraxel@redhat.com>
In-Reply-To: <20190620151104.2678-1-kraxel@redhat.com>
References: <20190620151104.2678-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Thu, 20 Jun 2019 15:11:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 1/3] seabios: add config for ati vgabios
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 roms/config.vga-ati | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 roms/config.vga-ati

diff --git a/roms/config.vga-ati b/roms/config.vga-ati
new file mode 100644
index 000000000000..12506b664442
--- /dev/null
+++ b/roms/config.vga-ati
@@ -0,0 +1,4 @@
+CONFIG_QEMU=y
+CONFIG_BUILD_VGABIOS=y
+CONFIG_VGA_ATI=y
+CONFIG_VGA_PCI=y
-- 
2.18.1



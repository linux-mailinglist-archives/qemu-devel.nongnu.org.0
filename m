Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9301A1A2
	for <lists+qemu-devel@lfdr.de>; Fri, 10 May 2019 18:38:32 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46470 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hP8XX-0007n3-Cq
	for lists+qemu-devel@lfdr.de; Fri, 10 May 2019 12:38:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45229)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1hP8Us-0006HT-8c
	for qemu-devel@nongnu.org; Fri, 10 May 2019 12:35:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1hP8Ur-00079p-8K
	for qemu-devel@nongnu.org; Fri, 10 May 2019 12:35:46 -0400
Received: from mail.ilande.co.uk ([46.43.2.167]:46058
	helo=mail.default.ilande.uk0.bigv.io)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1hP8Ur-00075l-2M; Fri, 10 May 2019 12:35:45 -0400
Received: from host109-147-184-225.range109-147.btcentralplus.com
	([109.147.184.225] helo=kentang.home)
	by mail.default.ilande.uk0.bigv.io with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1hP8U9-00015K-T9; Fri, 10 May 2019 17:35:03 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au,
	hsp.cat7@gmail.com
Date: Fri, 10 May 2019 17:35:36 +0100
Message-Id: <20190510163536.4242-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.11.0
X-SA-Exim-Connect-IP: 109.147.184.225
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.43.2.167
Subject: [Qemu-devel] [PATCH] configure: copy MacOS NDRV driver into
 sharedir for out-of-tree builds
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make sure that we include *.ndrv files with those being copied to sharedir
during out-of-tree builds. This ensures that the MacOS driver is correctly
located and loaded by qemu-system-ppc.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 configure | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configure b/configure
index 63f312bd1f..9493537301 100755
--- a/configure
+++ b/configure
@@ -7886,6 +7886,7 @@ for bios_file in \
     $source_path/pc-bios/*.dtb \
     $source_path/pc-bios/*.img \
     $source_path/pc-bios/openbios-* \
+    $source_path/pc-bios/*.ndrv \
     $source_path/pc-bios/u-boot.* \
     $source_path/pc-bios/edk2-*.fd.bz2 \
     $source_path/pc-bios/palcode-*
-- 
2.11.0



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C68302CA
	for <lists+qemu-devel@lfdr.de>; Thu, 30 May 2019 21:30:27 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58229 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWQks-0007gb-6W
	for lists+qemu-devel@lfdr.de; Thu, 30 May 2019 15:30:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34681)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <olaf@aepfle.de>) id 1hWQjp-0007Pg-Dz
	for qemu-devel@nongnu.org; Thu, 30 May 2019 15:29:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <olaf@aepfle.de>) id 1hWQjo-0002FE-HG
	for qemu-devel@nongnu.org; Thu, 30 May 2019 15:29:21 -0400
Received: from mo6-p00-ob.smtp.rzone.de ([2a01:238:20a:202:5300::12]:36743)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <olaf@aepfle.de>) id 1hWQjn-0002Bc-Sa
	for qemu-devel@nongnu.org; Thu, 30 May 2019 15:29:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1559244554;
	s=strato-dkim-0002; d=aepfle.de;
	h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
	Subject:Sender;
	bh=iM3LMV33wWK5A6S5NQiiphOyt314pgydAcJzpdNmfHE=;
	b=oENx/EdmZLh+AH2BeKxfq5x84ZUp3zj515DrUQOT7pTFjptYOJi0SwSQtqv5EH0o5k
	ko+O6Eg9xIPAfSwHj//A2H5L3w6iZLiOsbTtjmOEIdtvrbeUqKTu11tWn4EPUtG/6sk6
	/YlqtgyzdSE6xiK5gDuDge4ZRKWcGidWCyimJ8LOeUiFy1Ao17nGdlw3h973nU6AhO1q
	PYZnN69LZ9hyI6ocg7z3MZTTLvMl8SLAAbUopzPw/KCfGrQo6ZgVWpoToR/xrRgkZZ1d
	13dxpenPG3EvkSCkY+TCsNpDe8dAvP0cPqHxUEMydEt//+6MUDvGO5SsuBbzqtVoclXX
	nBPQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS325Njw=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.21 SBL|AUTH)
	with ESMTPSA id N09966v4UJSahZu
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1
	with 521 ECDH bits, eq. 15360 bits RSA))
	(Client did not present a certificate);
	Thu, 30 May 2019 21:28:36 +0200 (CEST)
From: Olaf Hering <olaf@aepfle.de>
To: qemu-devel@nongnu.org
Date: Thu, 30 May 2019 21:28:11 +0200
Message-Id: <20190530192812.17637-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.16.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 2a01:238:20a:202:5300::12
Subject: [Qemu-devel] [PATCH v1] Makefile: remove DESTDIR from firmware file
 content
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
Cc: Olaf Hering <olaf@aepfle.de>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The resulting firmware files should only contain the runtime path.
Fixes commit 26ce90fde5c ("Makefile: install the edk2 firmware images
and their descriptors")

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index f0be624f47..61267bf1a4 100644
--- a/Makefile
+++ b/Makefile
@@ -844,7 +844,7 @@ ifneq ($(DESCS),)
 	$(INSTALL_DIR) "$(DESTDIR)$(qemu_datadir)/firmware"
 	set -e; tmpf=$$(mktemp); trap 'rm -f -- "$$tmpf"' EXIT; \
 	for x in $(DESCS); do \
-		sed -e 's,@DATADIR@,$(DESTDIR)$(qemu_datadir),' \
+		sed -e 's,@DATADIR@,$(qemu_datadir),' \
 			"$(SRC_PATH)/pc-bios/descriptors/$$x" > "$$tmpf"; \
 		$(INSTALL_DATA) "$$tmpf" \
 			"$(DESTDIR)$(qemu_datadir)/firmware/$$x"; \


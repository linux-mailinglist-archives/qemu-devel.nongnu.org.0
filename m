Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A61267CC
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 18:14:00 +0200 (CEST)
Received: from localhost ([127.0.0.1]:47296 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTTsO-0006C2-3v
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 12:14:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57676)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hTTn6-0002Lt-IW
	for qemu-devel@nongnu.org; Wed, 22 May 2019 12:08:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hTTn5-0004P4-LA
	for qemu-devel@nongnu.org; Wed, 22 May 2019 12:08:32 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:59251)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hTTn0-00049w-Mr; Wed, 22 May 2019 12:08:27 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1MbizQ-1gw4y03Q58-00dJan; Wed, 22 May 2019 18:07:35 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Date: Wed, 22 May 2019 18:07:17 +0200
Message-Id: <20190522160723.31484-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190522160723.31484-1-laurent@vivier.eu>
References: <20190522160723.31484-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8/OIAyrTkqTcAuQg62h07r/34My5u/HfOdVK+CMrqTqlSdimxTP
	ZN9Imj4FsLcoo6w8E/ebCTO63T8oC+fMWRQFtcUR82YJDFZ7UdjM1F62hTVMdvzZAM6JJS3
	2jBe0h1O3cdmu4SKox2QqqB347ea+ISL4mSoHkdHw2pSnmPjwL9EDppgZtEixxcvTc653ef
	+F4LRdCfRqcsnNfuI58Mg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+bZ/mQYuGLo=:WTfh+LileZT1teCRAgNj+l
	3CUWrZhNnyvhTqRaamczEFyclLbNnqEPSwA45I1k57+3nJZyKZ3fnGL26sKaECFisP2lj5CNm
	29gWpXuLfRHL+qRmf80kRO5Rbl0rs03hqxmeFxgdGWQmGn7HK1gzib45/kA4Gx6a9hlemdq44
	qlcctoMSPs00LS6CbpDSeuFT0JgyyTuOUJkH7aGtK8jKHfDf0bz1iM7CX5pGxvs5BArZGVbYn
	8IsK5m/8DpdehiUG9bFMWxsadP7hCL6dAXMiy2JRo6SrnoQRHnpdQ9jpZvc2rFAbiMLzJEWF1
	ZoBCLK5jAQrB5/QZgHdSQ0KYROvb0+aVHGNb7bA9bSpurTk+ZPLF9Ud0KkoeHqHto07/HUJ7B
	uCEgYsGdlT9Z6LPZS+yuMM9Tt67ZpQBmPQ2WDu6v41UyhGX4bj1H9H83IsTBwURYFCc0Q9Mq8
	hb85tF8UNKHbd2RMusVT8N7Nx9GKd5nsRO61qvEtwGSpiKbJwWOUGJ1m3ordjSrqEKTS3HGiC
	emB4/SkwS5wTmrRCmJOnpBW1DuQSLMW3iJ+ghPJjZhQFm58RO+9/sAgAMv11JXNdzHj0D2J2w
	TokD2EN8VrEFmjTU+A4Wyu+rA0NhYVNQx5MGcpCo7p/XDA4dGCKxW/NyfSPvXEiIEg/XC/isV
	QYAiXicPcvVIAbUUWYm9/JldIBw2sGG2bpUrZJ+fIiYxOevk5C1FCWQyUipBLYRgvjBitVqzL
	H7VrxprWILQXdkq1HUmCX6pjGP1aiLhPNF2BVOUZslzsfUIPiYxyEkK+2HA=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.24
Subject: [Qemu-devel] [PULL 3/9] roms: List and describe the Makefile
 'clean' rule
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
	Farhan Ali <alifm@linux.ibm.com>, Pierre Morel <pmorel@linux.ibm.com>,
	Juan Quintela <quintela@redhat.com>, qemu-trivial@nongnu.org,
	Laszlo Ersek <lersek@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	Alex Williamson <alex.williamson@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>, Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	qemu-s390x@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20190506141923.12183-3-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 roms/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/roms/Makefile b/roms/Makefile
index ea6aec56abdd..078d3fb70563 100644
--- a/roms/Makefile
+++ b/roms/Makefile
@@ -62,6 +62,8 @@ default:
 	@echo "  u-boot.e500    -- update u-boot.e500"
 	@echo "  u-boot.sam460  -- update u-boot.sam460"
 	@echo "  efi            -- update UEFI (edk2) platform firmware"
+	@echo "  clean          -- delete the files generated by the previous" \
+	                          "build targets"
 
 bios: build-seabios-config-seabios-128k build-seabios-config-seabios-256k
 	cp seabios/builds/seabios-128k/bios.bin ../pc-bios/bios.bin
-- 
2.20.1



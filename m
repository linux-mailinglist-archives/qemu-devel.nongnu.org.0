Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0D148516F
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 11:51:00 +0100 (CET)
Received: from localhost ([::1]:37490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n53sh-0005X2-Jx
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 05:50:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n53q2-0003O3-UH
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:48:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n53pz-0001tE-VQ
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:48:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641379691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EwxDEJPZvxGs8hf6jwA9E67JWOMILyRAO72wLPXfvvA=;
 b=dSD6aKI3A25I82744b0iU84MvuZg/4A8dl6/rRBoTXHZuLCD6sjzaIiiV/k7LWvhEZ4Nt+
 1UPi33tfCVY0r+/+O4LhfH7KS61Maks/cHp0BJl0ZUVbylPGf7oF/j0iFIfhrlRipLf92Z
 HW3/hSM1R8kBQL1xSxzd0tHrJ1kVqxk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-HD0GTik-PvSg0man7w5MYg-1; Wed, 05 Jan 2022 05:48:06 -0500
X-MC-Unique: HD0GTik-PvSg0man7w5MYg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB26084E254;
 Wed,  5 Jan 2022 10:48:04 +0000 (UTC)
Received: from thuth.com (dhcp-192-229.str.redhat.com [10.33.192.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 524091F312;
 Wed,  5 Jan 2022 10:48:02 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Subject: [PATCH] MAINTAINERS: Improve the PowerPC machines section
Date: Wed,  5 Jan 2022 11:48:00 +0100
Message-Id: <20220105104800.407570-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add some documentation files to the corresponding machine sections
and mention the machine names in the section titles where it is
not so obvious (e.g. that "taihu" is a 405 machine).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f871d759fd..53cf0fdc00 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1245,7 +1245,7 @@ F: hw/openrisc/openrisc_sim.c
 
 PowerPC Machines
 ----------------
-405
+405 (ref405ep and taihu)
 L: qemu-ppc@nongnu.org
 S: Orphan
 F: hw/ppc/ppc405_boards.c
@@ -1281,6 +1281,7 @@ New World (mac99)
 M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
 L: qemu-ppc@nongnu.org
 S: Odd Fixes
+F: docs/system/ppc/powermac.rst
 F: hw/ppc/mac_newworld.c
 F: hw/pci-host/uninorth.c
 F: hw/pci-bridge/dec.[hc]
@@ -1299,6 +1300,7 @@ Old World (g3beige)
 M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
 L: qemu-ppc@nongnu.org
 S: Odd Fixes
+F: docs/system/ppc/powermac.rst
 F: hw/ppc/mac_oldworld.c
 F: hw/pci-host/grackle.c
 F: hw/misc/macio/
@@ -1312,6 +1314,7 @@ PReP
 M: Hervé Poussineau <hpoussin@reactos.org>
 L: qemu-ppc@nongnu.org
 S: Maintained
+F: docs/system/ppc/prep.rst
 F: hw/ppc/prep.c
 F: hw/ppc/prep_systemio.c
 F: hw/ppc/rs6000_mc.c
@@ -1324,7 +1327,7 @@ F: include/hw/isa/pc87312.h
 F: include/hw/rtc/m48t59.h
 F: tests/avocado/ppc_prep_40p.py
 
-sPAPR
+sPAPR (pseries)
 M: Cédric Le Goater <clg@kaod.org>
 M: Daniel Henrique Barboza <danielhb413@gmail.com>
 R: David Gibson <david@gibson.dropbear.id.au>
@@ -1336,8 +1339,8 @@ F: include/hw/*/spapr*
 F: hw/*/xics*
 F: include/hw/*/xics*
 F: pc-bios/slof.bin
-F: docs/specs/ppc-spapr-hcalls.txt
-F: docs/specs/ppc-spapr-hotplug.txt
+F: docs/system/ppc/pseries.rst
+F: docs/specs/ppc-spapr-*
 F: tests/qtest/spapr*
 F: tests/qtest/libqos/*spapr*
 F: tests/qtest/rtas*
@@ -1348,6 +1351,7 @@ PowerNV (Non-Virtualized)
 M: Cédric Le Goater <clg@kaod.org>
 L: qemu-ppc@nongnu.org
 S: Maintained
+F: docs/system/ppc/powernv.rst
 F: hw/ppc/pnv*
 F: hw/intc/pnv*
 F: hw/intc/xics_pnv.c
-- 
2.27.0



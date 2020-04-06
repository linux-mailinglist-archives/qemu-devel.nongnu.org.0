Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB0519FACE
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Apr 2020 18:52:23 +0200 (CEST)
Received: from localhost ([::1]:35220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLUz0-0001p0-Oe
	for lists+qemu-devel@lfdr.de; Mon, 06 Apr 2020 12:52:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54347)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <anthony.perard@citrix.com>) id 1jLUy3-0000yZ-42
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 12:51:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <anthony.perard@citrix.com>) id 1jLUy1-00059T-6e
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 12:51:21 -0400
Received: from esa3.hc3370-68.iphmx.com ([216.71.145.155]:16004)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <anthony.perard@citrix.com>)
 id 1jLUy0-000588-UF
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 12:51:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586191881;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lS0sFJMTodWBkW8jI02r656PmL06C+B84fIruUD4v5g=;
 b=KWrrm5iNVuudAeP9GuMMb3+bwTg1VxYwfy3OPf6RxlSL4v8puPPCOqkD
 WIvb+G78na48YJ9Yvsq1N80IGjC2KlImcSebCGApMgVkvD44Vira14/X3
 +IIaGBs+NfKxWRooPbiZXHINBdE4wtb2xbolnx3UYRnNq8hH0R7UYi3pr Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +bvA6czzRs/TzEkr9WNTA1OStkGaiyx0dMmn57XNuJ2ilj/lwkDGO0zvOJjd5b+YKjd6nn693J
 kfRQZgLKZlNxHBu44XySTQOlidI/wSNZNfVpFIkwC7i5nBW43Jz3ur9eSF2kuG6Fh0igFgFFEj
 e+7CHjzjxlDdCDV5vUmYodWDt+Y7aEv5BtKouZsRxzrx/+toXfIWYvMF6sy+MHiwuYJQCHxvha
 W9i7Y9X9bSfRbGta3o3eMuOh1jjYXeIob+Z2bBM5diL8VJ+OSrwq45v9fxqmXST9N3cMrkdiix
 igI=
X-SBRS: 2.7
X-MesageID: 15233974
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,351,1580792400"; d="scan'208";a="15233974"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH] MAINTAINERS: Add xen-usb.c to Xen section
Date: Mon, 6 Apr 2020 17:50:43 +0100
Message-ID: <20200406165043.1447837-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 216.71.145.155
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9d156d73b31e..839959f7e4ac 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -440,6 +440,7 @@ F: hw/9pfs/xen-9p*
 F: hw/char/xen_console.c
 F: hw/display/xenfb.c
 F: hw/net/xen_nic.c
+F: hw/usb/xen-usb.c
 F: hw/block/xen*
 F: hw/block/dataplane/xen*
 F: hw/xen/
-- 
Anthony PERARD



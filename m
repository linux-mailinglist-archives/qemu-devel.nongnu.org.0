Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5941A1020
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Apr 2020 17:23:55 +0200 (CEST)
Received: from localhost ([::1]:49168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLq4w-0000j7-Lk
	for lists+qemu-devel@lfdr.de; Tue, 07 Apr 2020 11:23:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38711)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <anthony.perard@citrix.com>) id 1jLq3u-00083D-Bh
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 11:22:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <anthony.perard@citrix.com>) id 1jLq3t-0000QK-8S
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 11:22:50 -0400
Received: from esa4.hc3370-68.iphmx.com ([216.71.155.144]:15905)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <anthony.perard@citrix.com>)
 id 1jLq3s-0000Ov-V0
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 11:22:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586272968;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=p4pqrvqLWTeQJ2N/iED4+aXuC2skShBJ4HGL3c8YB1Y=;
 b=ZG/fTVNRz4PSa40xUZVKlqr6QHYjj4rQ8HyjJ37tRWBCIbt8u6QqwEw8
 kqRhO4Rwv9O0r7jlibQ6LNVFzUNbavl7zl79cIxG2FEJrS1nAaPcRme7u
 vxL91aUQL8r1KVln6qxz4BKdz+svIixFsY70CH6kpzm+RUNgPA4OavfnJ w=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 5+opBNhuKZjxrRGFQXvAaJMdbcrJU69J57N5qV2v5aq49GjtbNrkEyM5Jmgq3OiYKidpOMYe78
 wdi0th0m74HMsZ7tDLtfOBtLwmPvmz0Ne4665Fi9FXXkm0HXsaK6t2IsYaREOpq50ZCa7emJ4V
 iSQCYz0wsi/QRa8stCQJtuca3iMxokWAcCbU99E+KIN4cgvgRWNz1HfbldysuqtLyP3XY7bGew
 zXEAgcrWH4Dd1EK2yrTr0GMlWofR2KN1vO+FUBzk2cxYdaNg490IcIBRXUVUWOCAChZGbiiZGL
 56Q=
X-SBRS: 2.7
X-MesageID: 15974520
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,355,1580792400"; d="scan'208";a="15974520"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Subject: [PULL 0/3] xen queue for 5.0
Date: Tue, 7 Apr 2020 16:22:34 +0100
Message-ID: <20200407152237.1468704-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 216.71.155.144
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
Cc: Peter Maydell <peter.maydell@linaro.org>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 8f0d25c464a1989d606f7b988d07b1147dfcde33:

  Merge remote-tracking branch 'remotes/philmd-gitlab/tags/acceptance-fixes-20200407' into staging (2020-04-07 15:10:11 +0100)

are available in the Git repository at:

  https://xenbits.xen.org/git-http/people/aperard/qemu-dm.git tags/pull-xen-20200407

for you to fetch changes up to 758af9cfabfb000eb00e42b9738e655b18fdd812:

  MAINTAINERS: Add xen-usb.c to Xen section (2020-04-07 16:13:26 +0100)

----------------------------------------------------------------
Xen queue for QEMU 5.0

- Fix for xen-block.
- A fix for a Coverity false positive in xen-usb.
- Update MAINTAINERS to add xen-usb.c to Xen section.

----------------------------------------------------------------
Anthony PERARD (2):
      xen-block: Fix uninitialized variable
      MAINTAINERS: Add xen-usb.c to Xen section

Peter Maydell (1):
      hw/usb/xen-usb.c: Pass struct usbback_req* to usbback_packet_complete()

 MAINTAINERS          |  1 +
 hw/block/xen-block.c |  2 +-
 hw/usb/xen-usb.c     | 10 ++++------
 3 files changed, 6 insertions(+), 7 deletions(-)


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D54BB0EC4
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Sep 2019 14:19:36 +0200 (CEST)
Received: from localhost ([::1]:33810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8O4U-0002ZA-Cm
	for lists+qemu-devel@lfdr.de; Thu, 12 Sep 2019 08:19:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50129)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Paul.Durrant@citrix.com>) id 1i8O1u-0000y7-4c
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 08:16:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Paul.Durrant@citrix.com>) id 1i8O1s-0004pQ-Pi
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 08:16:53 -0400
Received: from esa4.hc3370-68.iphmx.com ([216.71.155.144]:42935)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <Paul.Durrant@citrix.com>)
 id 1i8O1s-0004nz-Ig
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 08:16:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568290612;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fZN3nZZEsONTUMbidkhgiHdbtQz4Q860Fkmdy/WVaMY=;
 b=Ed7n9Jt+oA0M6MpKWV0sv8MZ1Sm6MbnkfTMDsp1yL2q9Sfzv3HDEU+X2
 acmEmI4nL1Sp9efuP5RchQdo3FsL68UsKNGl+Lyv4G50d6Q1jV57BegC/
 fkr2RNn3Op7xx8vXE9ZhiWbznaSBZHK4yf+jGbcdnIpXIniHWjjrKIH7n Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 6wHN8IyTQQNCrDCSVYBAKFOsJBLYiDlSmmbQiTmRAsOpx8FABfQfigeDeayvR6sDPvoLrlHZc7
 H6hjvuq35i4cIG2fMH+M4S2d19urxN30ZA+VYdbxtkjLf46AHGQAxbrFeEVGA+j7v0LbLAR59R
 cWCSqU6+PDDM8DYewZpLpVQj5YVCx3wm2mc03He/RHWst5MwB+C8K/1ZspK2/40mJcmfkQxiC5
 wxJQhRJTk7mlq0h5e1CXDeACM3h9GU9u8X6jyNfOeNMABHhWpClpWyCdrn4RqywJmU/8D6vRAA
 rcU=
X-SBRS: 2.7
X-MesageID: 5769902
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,497,1559534400"; 
   d="scan'208";a="5769902"
From: Paul Durrant <paul.durrant@citrix.com>
To: <qemu-devel@nongnu.org>, <xen-devel@lists.xenproject.org>
Date: Thu, 12 Sep 2019 13:16:43 +0100
Message-ID: <20190912121646.29148-1-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 216.71.155.144
Subject: [Qemu-devel] [PATCH v2 0/3] xen: fix a potential crash in xen-bus
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series fixes a potential segfault caused by NotifierList corruption
in xen-bus. The first two patches lay the groundwork and the third
actually fixes the problem.

Paul Durrant (3):
  xen / notify: introduce a new XenWatchList abstraction
  xen: introduce separate XenWatchList for XenDevice objects
  xen: perform XenDevice clean-up in XenBus watch handler

 hw/xen/trace-events      |   9 +-
 hw/xen/xen-bus.c         | 267 ++++++++++++++++++++++++++++-----------
 include/hw/xen/xen-bus.h |   7 +-
 include/qemu/notify.h    |   2 +
 util/notify.c            |   5 +
 5 files changed, 213 insertions(+), 77 deletions(-)
---
Cc: Anthony Perard <anthony.perard@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
-- 
2.20.1.2.gb21ebb6



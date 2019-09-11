Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4881CAFEDA
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 16:39:05 +0200 (CEST)
Received: from localhost ([::1]:51738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i83lw-0001qT-5z
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 10:39:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43787)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Paul.Durrant@citrix.com>) id 1i83jN-0008RU-7b
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 10:36:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Paul.Durrant@citrix.com>) id 1i83jM-0000nR-0C
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 10:36:24 -0400
Received: from esa2.hc3370-68.iphmx.com ([216.71.145.153]:1554)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <Paul.Durrant@citrix.com>)
 id 1i83jL-0000ma-MX
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 10:36:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568212584;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3XwCKMnGmyGT5kVTl3oKhIMv998hFroIhC3faxPFwXw=;
 b=E5OBRS1uQ9mUbsDsbpwT087KZDPe+FQEPrLkp+7sE8jpKhBEGtVKewpd
 LrCeHcv4raUQ/mEPh4/B5zevCzpg3coJEjTlRLswgRtLzehr8E8EYV4kS
 4USQuCvUQe+Fx7rOUNnw/K/3CsNmL9r29Vydcqrsb+P+ddqYnT7XpmA6K s=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: L6SAZik8xsVrNDnFj2N+Aya3BqFqrx0OO8jGxxDMlKLjWOvwhZMZrV+ST6V9vCSxeDiyddSsMX
 tpl1qJ2bNWIpBhWiioLvEoLlHDkp0mvwtpQ5930ny7O3V77gHgmeyeZHfyYPUijsHqK8d4i6yB
 jTXjjPoLJwIFzvJZ8j+niKM1N8cuQ3et8ck945S7EvkY+8a5I3QiwukQPkIEJWTN80BN88fp2e
 +QMqiuhbSmUeSdWMKzxlQSZibwwOWZOIJxTM4VS3wj8SAbGMKh8Y2KD4C4dgNpDq4FYeq12MZj
 aWg=
X-SBRS: 2.7
X-MesageID: 5434109
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,493,1559534400"; 
   d="scan'208";a="5434109"
From: Paul Durrant <paul.durrant@citrix.com>
To: <qemu-devel@nongnu.org>, <xen-devel@lists.xenproject.org>
Date: Wed, 11 Sep 2019 15:36:15 +0100
Message-ID: <20190911143618.23477-1-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 216.71.145.153
Subject: [Qemu-devel] [PATCH 0/3] xen: fix a potential crash in xen-bus
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
 hw/xen/xen-bus.c         | 266 ++++++++++++++++++++++++++++-----------
 include/hw/xen/xen-bus.h |   7 +-
 include/qemu/notify.h    |   2 +
 util/notify.c            |   5 +
 5 files changed, 212 insertions(+), 77 deletions(-)
---
Cc: Anthony Perard <anthony.perard@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
-- 
2.20.1.2.gb21ebb6



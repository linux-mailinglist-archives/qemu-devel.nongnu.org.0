Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 057F09ACF7
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 12:18:47 +0200 (CEST)
Received: from localhost ([::1]:53780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i16eb-00028O-PH
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 06:18:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60772)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <anthony.perard@citrix.com>) id 1i16bd-0008Bq-4e
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 06:15:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <anthony.perard@citrix.com>) id 1i16bb-0004Ct-UL
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 06:15:40 -0400
Received: from esa4.hc3370-68.iphmx.com ([216.71.155.144]:44800)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <anthony.perard@citrix.com>)
 id 1i16bb-0004Bu-K7
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 06:15:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566555339;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9TGuM99SRVq01HqRm4swGEc23rvh9wM2Moq9R5yoqyg=;
 b=f5PqRjSfeQIkfptn4sWfedvCHayquZOPuwy2LKuhU1NM1gNIjPvyOt7M
 L00nwWr8QvXwNW/hhth34X+kE6QIbh2sE91PWDZmr5NWiAQfIIKtObsLs
 YSjTJltl6CBClgOyDhBZKrlmyxHUVDX7xDikUn2bNdlBnuQwhKZ6yyzHO A=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1cydaJSag6Xz0SyD8+gqMTtPwqF2eNre6jB6Ua+6CHOAbIL2imYZEAeKwY1FaUVV8a3GIvPU9w
 JrCnYA9t7Kdt+G/ZZRe/2fz3d3gGSKFMRdQaSC5t5BBYZKtLGfjQ0ZAldoOtBLirh7//fSh4wO
 B0inKx1tIH9o4iVkhqjx7PiDJx5/VbhqyBdL4Bn9/thNV5RuaRDJ4e2ABCHhRZYMH/zCfhjFtb
 7wKDtJzs1G3m5GC5VcbqBnj3DuuW2M0vEnERsGXkCH3E0sXlkukof4P9u23tp26ndMWv8Q9i54
 T1M=
X-SBRS: 2.7
X-MesageID: 4885193
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,420,1559534400"; 
   d="scan'208";a="4885193"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 23 Aug 2019 11:15:32 +0100
Message-ID: <20190823101534.465-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 216.71.155.144
Subject: [Qemu-devel] [PATCH v2 0/2] Fix for the xen-bus driver
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
Cc: Anthony PERARD <anthony.perard@citrix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cheers,

Anthony PERARD (2):
  xen-bus: Fix backend state transition on device reset
  xen-bus: Avoid rewriting identical values to xenstore

 hw/xen/xen-bus.c | 34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

-- 
Anthony PERARD



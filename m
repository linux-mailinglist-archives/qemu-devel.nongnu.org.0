Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C642B49F32
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jun 2019 13:29:43 +0200 (CEST)
Received: from localhost ([::1]:55708 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdCJ5-0005oG-1F
	for lists+qemu-devel@lfdr.de; Tue, 18 Jun 2019 07:29:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44024)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <anthony.perard@citrix.com>) id 1hdCDO-0001lf-5F
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 07:23:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <anthony.perard@citrix.com>) id 1hdCDM-00071N-O9
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 07:23:50 -0400
Received: from esa5.hc3370-68.iphmx.com ([216.71.155.168]:47313)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <anthony.perard@citrix.com>)
 id 1hdCDM-0006yd-ES
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 07:23:48 -0400
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: A2bladOBuTxayASWh72KMp+5U0jfv7eGwE94lJFaZrLMrBPbJs47GsZ2iNT22rCqE0MLJqeXfw
 8KGdqEVAxzPV9RkgmJ3/QHw6MdLyz1fTp2Mx4LUNLZsQzNpyi1ZFR0Xsmj+wgwylE1D47ttfrb
 a8PZ2ZNyk2HDYWFPZHNXRTylP17PkdWIDC+5c1GoF27NKTYHKVmx7UKnL7FMyIh1jzPQZPzcoo
 ut/mHIBjYjGePtycN2FkH2Wvuz1nMilUznEsGTjbnZ0d+VTnker7KF1XEzEX7muRO/aXsycKYS
 jV4=
X-SBRS: 2.7
X-MesageID: 1860620
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,389,1557201600"; 
   d="scan'208";a="1860620"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 18 Jun 2019 12:23:37 +0100
Message-ID: <20190618112341.513-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 216.71.155.168
Subject: [Qemu-devel] [PATCH v2 0/4] Fix build of Xen support + cleanup
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Paul Durrant <paul.durrant@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Fix the build in osstest and some cleanup

For reference:

Recent flight failure:
https://lists.xenproject.org/archives/html/xen-devel/2019-06/msg01022.html

Bisect result:
https://lists.xenproject.org/archives/html/xen-devel/2019-06/msg01029.html

Thanks.

Anthony PERARD (4):
  xen: Fix build with public headers
  xen: Import other xen/io/*.h
  xen: Drop includes of xen/hvm/params.h
  xen: Avoid VLA

 hw/9pfs/xen-9pfs.h                       |    4 +-
 hw/block/xen_blkif.h                     |    5 +-
 hw/char/xen_console.c                    |    2 +-
 hw/display/xenfb.c                       |    7 +-
 hw/i386/xen/xen-hvm.c                    |   16 +-
 hw/i386/xen/xen-mapcache.c               |    2 -
 hw/net/xen_nic.c                         |    2 +-
 hw/usb/xen-usb.c                         |    3 +-
 hw/xen/xen-legacy-backend.c              |    2 -
 include/hw/xen/interface/grant_table.h   |   36 +
 include/hw/xen/interface/io/blkif.h      |  712 +++++++++++++++
 include/hw/xen/interface/io/console.h    |   46 +
 include/hw/xen/interface/io/fbif.h       |  156 ++++
 include/hw/xen/interface/io/kbdif.h      |  566 ++++++++++++
 include/hw/xen/interface/io/netif.h      | 1010 ++++++++++++++++++++++
 include/hw/xen/interface/io/protocols.h  |   42 +
 include/hw/xen/{ => interface}/io/ring.h |    0
 include/hw/xen/interface/io/usbif.h      |  254 ++++++
 include/hw/xen/interface/io/xenbus.h     |   70 ++
 include/hw/xen/xen_common.h              |    2 +-
 20 files changed, 2914 insertions(+), 23 deletions(-)
 create mode 100644 include/hw/xen/interface/grant_table.h
 create mode 100644 include/hw/xen/interface/io/blkif.h
 create mode 100644 include/hw/xen/interface/io/console.h
 create mode 100644 include/hw/xen/interface/io/fbif.h
 create mode 100644 include/hw/xen/interface/io/kbdif.h
 create mode 100644 include/hw/xen/interface/io/netif.h
 create mode 100644 include/hw/xen/interface/io/protocols.h
 rename include/hw/xen/{ => interface}/io/ring.h (100%)
 create mode 100644 include/hw/xen/interface/io/usbif.h
 create mode 100644 include/hw/xen/interface/io/xenbus.h

-- 
Anthony PERARD



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFF21754B0
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Mar 2020 08:41:05 +0100 (CET)
Received: from localhost ([::1]:55904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8fhI-0003CX-7N
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 02:41:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59885)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jasowang@redhat.com>) id 1j8fgF-0002N0-OJ
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 02:40:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jasowang@redhat.com>) id 1j8fgE-00034Y-8Q
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 02:39:59 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:47152
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jasowang@redhat.com>) id 1j8fgE-00031r-4z
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 02:39:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583134796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=A0HzH+AfTZxUTr3S5yrBeuGFBH8tlXM6oFaZJFeU32w=;
 b=M81AhQyYdoDj5wk4Yqwyio9mBEmY52cvuldCxYFN4YmZEFA6HDExam67G4R1ukYcfiYuDm
 9n7tcpxulCuaWCCvRe1On7MzxToGIMNoN3FFxnbFgpAuEEtgn9KUTCW35M187/9Z1tft21
 lXD2KC8FD34BHum6ahILeNOLChCfiY4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-hLpTHL9iODKvSNb8uN_wuQ-1; Mon, 02 Mar 2020 02:39:54 -0500
X-MC-Unique: hLpTHL9iODKvSNb8uN_wuQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BA2C100550E;
 Mon,  2 Mar 2020 07:39:53 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-12-58.pek2.redhat.com
 [10.72.12.58])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9AB8990CF1;
 Mon,  2 Mar 2020 07:39:51 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL 00/23] Net patches
Date: Mon,  2 Mar 2020 15:39:26 +0800
Message-Id: <1583134789-23861-1-git-send-email-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit e0175b71638cf4398903c0d25f93fe62e0606389=
:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20200=
228' into staging (2020-02-28 16:39:27 +0000)

are available in the git repository at:

  https://github.com/jasowang/qemu.git tags/net-pull-request

for you to fetch changes up to 41aa2e3f9b27fd259a13711545d933a20f1d2f16:

  l2tpv3: fix RFC number typo in qemu-options.hx (2020-03-02 15:30:08 +0800=
)

----------------------------------------------------------------

----------------------------------------------------------------
Bin Meng (1):
      hw: net: cadence_gem: Fix build errors in DB_PRINT()

Finn Thain (14):
      dp8393x: Mask EOL bit from descriptor addresses
      dp8393x: Always use 32-bit accesses
      dp8393x: Clean up endianness hacks
      dp8393x: Have dp8393x_receive() return the packet size
      dp8393x: Update LLFA and CRDA registers from rx descriptor
      dp8393x: Clear RRRA command register bit only when appropriate
      dp8393x: Implement packet size limit and RBAE interrupt
      dp8393x: Don't clobber packet checksum
      dp8393x: Use long-word-aligned RRA pointers in 32-bit mode
      dp8393x: Pad frames to word or long word boundary
      dp8393x: Clear descriptor in_use field to release packet
      dp8393x: Always update RRA pointers and sequence numbers
      dp8393x: Don't reset Silicon Revision register
      dp8393x: Don't stop reception upon RBE interrupt assertion

Lukas Straub (4):
      block/replication.c: Ignore requests after failover
      tests/test-replication.c: Add test for for secondary node continuing =
replication
      net/filter.c: Add Options to insert filters anywhere in the filter li=
st
      colo: Update Documentation for continuous replication

Stefan Hajnoczi (1):
      l2tpv3: fix RFC number typo in qemu-options.hx

Yuri Benditovich (3):
      e1000e: Avoid hw_error if legacy mode used
      NetRxPkt: Introduce support for additional hash types
      NetRxPkt: fix hash calculation of IPV6 TCP

 block/replication.c        |  35 ++++++-
 docs/COLO-FT.txt           | 224 +++++++++++++++++++++++++++++++++--------=
----
 docs/block-replication.txt |  28 ++++--
 hw/net/cadence_gem.c       |  11 ++-
 hw/net/dp8393x.c           | 200 ++++++++++++++++++++++++++--------------
 hw/net/e1000e_core.c       |  15 +--
 hw/net/net_rx_pkt.c        |  44 ++++++++-
 hw/net/net_rx_pkt.h        |   6 +-
 hw/net/trace-events        |   4 +
 include/net/filter.h       |   2 +
 net/filter.c               |  92 ++++++++++++++++++-
 qemu-options.hx            |  35 +++++--
 tests/test-replication.c   |  52 +++++++++++
 13 files changed, 591 insertions(+), 157 deletions(-)



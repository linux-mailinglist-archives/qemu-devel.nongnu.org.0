Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D60C23B8FAC
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 11:20:08 +0200 (CEST)
Received: from localhost ([::1]:53078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lysrf-0001Kt-U5
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 05:20:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lysqG-0007Sp-6k
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 05:18:40 -0400
Received: from mga09.intel.com ([134.134.136.24]:16181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lysqD-00005Q-F2
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 05:18:39 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10031"; a="208454103"
X-IronPort-AV: E=Sophos;i="5.83,313,1616482800"; d="scan'208";a="208454103"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 02:18:33 -0700
X-IronPort-AV: E=Sophos;i="5.83,313,1616482800"; d="scan'208";a="420334983"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 02:18:30 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: [PULL V2 0/6] COLO-Proxy patches for 2021-06-25 
Date: Thu,  1 Jul 2021 17:11:24 +0800
Message-Id: <20210701091130.3022093-1-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.24; envelope-from=chen.zhang@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Lukas Straub <lukasstraub2@web.de>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, qemu-dev <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Zhang Chen <chen.zhang@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jason,

Please help to queue COLO-proxy patches to net branch.

Thanks
Chen


The following changes since commit b22726abdfa54592d6ad88f65b0297c0e8b363e2:

  Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.1-pull-request' into staging (2021-06-22 16:07:53 +0100)

are available in the Git repository at:

  https://github.com/zhangckid/qemu.git master-colo-21jun25-pull-request-v2

for you to fetch changes up to 90f0c348ae42192aa4efd379e5fa79ca643987f4:

  net/net.c: Add handler for passthrough filter command (2021-07-01 16:55:23 +0800)

----------------------------------------------------------------

This series add passthrough support frame to object with network
processing function. The first object is colo-compare.

V2: Optimize HMP code from Dave's comment.

----------------------------------------------------------------

Zhang Chen (6):
  qapi/net: Add IPFlowSpec and QMP command for filter passthrough
  util/qemu-sockets.c: Add inet_parse_base to handle
    InetSocketAddressBase
  hmp-commands: Add new HMP command for filter passthrough
  net/colo-compare: Move data structure and define to .h file.
  net/colo-compare: Add passthrough list to CompareState
  net/net.c: Add handler for passthrough filter command

 hmp-commands.hx        |  26 ++++++
 include/monitor/hmp.h  |   2 +
 include/qemu/sockets.h |   1 +
 monitor/hmp-cmds.c     |  67 ++++++++++++++
 net/colo-compare.c     | 160 ++++++++++----------------------
 net/colo-compare.h     |  98 ++++++++++++++++++++
 net/net.c              | 205 +++++++++++++++++++++++++++++++++++++++++
 qapi/net.json          |  78 ++++++++++++++++
 util/qemu-sockets.c    |  14 +++
 9 files changed, 542 insertions(+), 109 deletions(-)

-- 
2.25.1



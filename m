Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0007823AAF2
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Aug 2020 18:54:04 +0200 (CEST)
Received: from localhost ([::1]:46320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k2dit-0005xn-WF
	for lists+qemu-devel@lfdr.de; Mon, 03 Aug 2020 12:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1k2di0-00058r-Rt
 for qemu-devel@nongnu.org; Mon, 03 Aug 2020 12:53:08 -0400
Received: from esa3.hc3370-68.iphmx.com ([216.71.145.155]:15259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1k2dhy-0000HG-TU
 for qemu-devel@nongnu.org; Mon, 03 Aug 2020 12:53:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596473587;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qUEzT/sythxNJ9sGpLp+qH5wmPU56dvfrIxZ3Qy2z3c=;
 b=AVDwyuCv2zxXsIvRxwgL7ao2XNB69TBsSf8zEW5bbmdvjeoMQNslBx3f
 JoivP0xzQD2SJlugINJ8r9QLyXh16qTE1L4um/nwx+XC4cJ5OOkFr0wfj
 3SQOBUnBddjMVwjs0RND+jn4ixCeqtO03qGd5i/A41ax++DF/EQUVOVQy c=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Hs8xDfMQ8nyk+/4NscBbN7hK37UarIUXmgFSJxkAi2tcwAHYMYp0cMsfQwhouMF5pAnfi1xWv1
 dOG1ygyAZdGvaL5BcbMAeVBkVY3OqVTXE5R+/r6tP19JlyXRUPvBT0E8HZSHdCLXMMpAyHBhYu
 6GaPljbE5m3QcoAlEmh66MNNzO2R5dD99GvpB000qX0zt3k/e3XveVApjzhwMOL1ahkOeLwh4i
 fAbtOfz7Xo741x4nrVNSn0S1RaIR1shXFDHO9GbHMZ8nAzoerHiXpZB2RIoVzXfCmAVCLRa8Ah
 6Hc=
X-SBRS: 3.7
X-MesageID: 23750296
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,430,1589256000"; d="scan'208";a="23750296"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Subject: [PULL 0/1] xen queue 2020-08-03
Date: Mon, 3 Aug 2020 17:52:50 +0100
Message-ID: <20200803165251.907213-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.145.155;
 envelope-from=anthony.perard@citrix.com; helo=esa3.hc3370-68.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/03 12:35:21
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Peter Maydell <peter.maydell@linaro.org>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 45a150aa2b3492acf6691c7bdbeb25a8545d8345:

  Merge remote-tracking branch 'remotes/ericb/tags/pull-bitmaps-2020-08-03' into staging (2020-08-03 15:13:49 +0100)

are available in the Git repository at:

  https://xenbits.xen.org/git-http/people/aperard/qemu-dm.git tags/pull-xen-20200803

for you to fetch changes up to b3fcc98f391e9a60a369d825333b852871cf67b0:

  accel/xen: Fix xen_enabled() behavior on target-agnostic objects (2020-08-03 17:39:38 +0100)

----------------------------------------------------------------
xen patches

bug fix

----------------------------------------------------------------
Philippe Mathieu-Daudé (1):
      accel/xen: Fix xen_enabled() behavior on target-agnostic objects

 include/sysemu/xen.h | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)


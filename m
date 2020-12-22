Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAE22E0B41
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 15:00:29 +0100 (CET)
Received: from localhost ([::1]:39826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kriDF-00061y-0A
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 09:00:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhanghan64@huawei.com>)
 id 1krdBc-0001ou-GE; Tue, 22 Dec 2020 03:38:28 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhanghan64@huawei.com>)
 id 1krdBX-0002j8-6u; Tue, 22 Dec 2020 03:38:28 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4D0V7y5CnLz7Jbr;
 Tue, 22 Dec 2020 16:37:18 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.498.0; Tue, 22 Dec 2020
 16:37:50 +0800
From: Zhang Han <zhanghan64@huawei.com>
To: <jasowang@redhat.com>
Subject: [PATCH 0/9] Fix some style problems in net
Date: Tue, 22 Dec 2020 16:23:31 +0800
Message-ID: <20201222082340.67405-1-zhanghan64@huawei.com>
X-Mailer: git-send-email 2.29.1.59.gf9b6481aed
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=zhanghan64@huawei.com;
 helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 22 Dec 2020 08:55:42 -0500
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
Cc: alex.chen@huawei.com, hunongda@huawei.com, qemu-trivial@nongnu.org,
 hang.zhanghailiang@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some style problems in net directory are found by checkpatch.pl. Fix these
style problems.

Zhang Han (9):
  net: Add spaces around operator/delete redundant spaces
  net: Add braces for statements/fix braces' position
  net: transfer // comments to /**/
  net: transfer "foo* bar" to "foo *"
  net: fix lines over 90 characters
  net: Transfer tabs to spcaes
  net: remove assignment in if condition
  net: Remove initialization of static ints
  net: Fix the indent problems

 net/checksum.c    |  11 +-
 net/eth.c         |   2 +-
 net/net.c         |  26 +++--
 net/queue.c       |   5 +-
 net/slirp.c       |   8 +-
 net/socket.c      |  32 +++---
 net/tap-bsd.c     |   6 +-
 net/tap-linux.c   |  20 ++--
 net/tap-linux.h   |  10 +-
 net/tap-solaris.c |  76 ++++++++------
 net/tap-win32.c   | 258 +++++++++++++++++++++++++---------------------
 net/vde.c         |   4 +-
 net/vhost-user.c  |   2 +-
 13 files changed, 259 insertions(+), 201 deletions(-)

-- 
2.29.1.59.gf9b6481aed



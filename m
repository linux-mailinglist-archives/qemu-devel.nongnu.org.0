Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 450FB2CD09E
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 08:54:08 +0100 (CET)
Received: from localhost ([::1]:48854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkjRG-0003N2-QT
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 02:54:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kkjPh-0002HU-6x; Thu, 03 Dec 2020 02:52:29 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kkjPe-00047Z-Ix; Thu, 03 Dec 2020 02:52:28 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Cmp2R1WW3zhldb;
 Thu,  3 Dec 2020 15:51:59 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Thu, 3 Dec 2020
 15:52:09 +0800
From: Gan Qixin <ganqixin@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH v2 0/4] Use lock guard macros in block
Date: Thu, 3 Dec 2020 15:50:51 +0800
Message-ID: <20201203075055.127773-1-ganqixin@huawei.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=ganqixin@huawei.com;
 helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, zhang.zhanghailiang@huawei.com, armbru@redhat.com,
 Gan Qixin <ganqixin@huawei.com>, kuhn.chenqun@huawei.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v1->v2:

-Patch1:
    Add Paolo Bonzini reviewed tag and delete the .c suffix in the commit
message.

-Patch2:
    Add Paolo Bonzini reviewed tag and delete the .c suffix in the commit
message.

-Patch3:
    Delete the .c suffix in the commit.
    Changes suggested by Kevin Wolf: Fix wrong indentation format.
    
-Patch4:
    Delete the .c suffix in the commit.
    Changes suggested by Kevin Wolf: Replace QEMU_LOCK_GUARD with
WITH_QEMU_LOCK_GUARD, and delete the redundant qemu_mutex_unlock().

Gan Qixin (4):
  block/accounting: Use lock guard macros
  block/curl: Use lock guard macros
  block/throttle-groups: Use lock guard macros
  block/iscsi: Use lock guard macros

 block/accounting.c      | 32 +++++++++++++-------------
 block/curl.c            | 28 +++++++++++------------
 block/iscsi.c           | 50 ++++++++++++++++++++---------------------
 block/throttle-groups.c | 48 +++++++++++++++++++--------------------
 4 files changed, 76 insertions(+), 82 deletions(-)

-- 
2.27.0



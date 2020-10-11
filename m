Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF0928A78B
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Oct 2020 15:41:04 +0200 (CEST)
Received: from localhost ([::1]:43252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRbax-0008AI-VM
	for lists+qemu-devel@lfdr.de; Sun, 11 Oct 2020 09:41:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yubihong@huawei.com>)
 id 1kRXv3-000186-Mc; Sun, 11 Oct 2020 05:45:33 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:5170 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yubihong@huawei.com>)
 id 1kRXv1-0007P0-1b; Sun, 11 Oct 2020 05:45:33 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 79F3994EFF560202831A;
 Sun, 11 Oct 2020 17:45:12 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Sun, 11 Oct 2020
 17:45:02 +0800
From: Bihong Yu <yubihong@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH v1 0/8] Fix some style problems in migration
Date: Sun, 11 Oct 2020 18:17:01 +0800
Message-ID: <1602411429-12043-1-git-send-email-yubihong@huawei.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=yubihong@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/11 05:45:13
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 11 Oct 2020 09:36:15 -0400
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
Cc: alex.chen@huawei.com, zhengchuan@huawei.com, wanghao232@huawei.com,
 dgilbert@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Recently I am reading migration related code, find some style problems in
migration directory while using checkpatch.pl to check migration code. Fix the
error style problems.

Bihong Yu (8):
  migration: Do not use C99 // comments
  migration: Don't use '#' flag of printf format
  migration: Add spaces around operator
  migration: Open brace '{' following struct go on the same line
  migration: Add braces {} for if statement
  migration: Do not initialise statics and globals to 0 or NULL
  migration: Open brace '{' following function declarations go on the
    next line
  migration: Delete redundant spaces

 migration/block.c        |  4 ++--
 migration/migration.c    |  4 ++--
 migration/migration.h    |  3 +--
 migration/postcopy-ram.c |  2 +-
 migration/ram.c          | 14 ++++++++------
 migration/rdma.c         |  7 ++++---
 migration/savevm.c       |  4 ++--
 migration/vmstate.c      | 10 +++++-----
 8 files changed, 25 insertions(+), 23 deletions(-)

-- 
1.8.3.1



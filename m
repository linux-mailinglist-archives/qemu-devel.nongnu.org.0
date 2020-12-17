Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C81502DCE71
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 10:33:38 +0100 (CET)
Received: from localhost ([::1]:58082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kppfE-0005df-Fp
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 04:33:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chaihaoyu1@huawei.com>)
 id 1kppe1-0004w8-LM; Thu, 17 Dec 2020 04:32:21 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chaihaoyu1@huawei.com>)
 id 1kppdz-0004kj-44; Thu, 17 Dec 2020 04:32:21 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CxRZd0TVVzhrb1;
 Thu, 17 Dec 2020 17:31:21 +0800 (CST)
Received: from [10.108.235.54] (10.108.235.54) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Thu, 17 Dec 2020 17:31:53 +0800
From: chaihaoyu <chaihaoyu1@huawei.com>
Subject: [PATCH v1 0/3] Fix some style problems in block
To: <qemu-block@nongnu.org>, <kwolf@redhat.com>
Message-ID: <507b1862-437b-59d1-070e-140cccfea11b@huawei.com>
Date: Thu, 17 Dec 2020 17:31:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.108.235.54]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=chaihaoyu1@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: alex.chen@huawei.com, hunongda@huawei.com, zhang.zhanghailiang@huawei.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch fixed some code style problems while using checkpatch.pl tool, please review.

Date: Wen, 16 Dec 2020 17:19:37 +0800
Subject: [PATCH] Fix some style problems in block
signed-off-by: Haoyu Chai<chaihaoyu1@huawei.com>
---

Haoyu Chai (3):
  block: some space-style errors while coding
  block: braces {} are necessary for all arms of this statement
  block: "(foo*)" should be "(foo *)"
---
 block/bochs.c        | 16 +++++-----
 block/cloop.c        |  2 +-
 block/commit.c       |  3 +-
 block/curl.c         | 24 +++++++++------
 block/dmg.c          |  4 +-
 block/file-posix.c   | 72 +++++++++++++++++++++++++-------------------
 block/file-win32.c   | 42 ++++++++++++++------------
 block/parallels.c    | 12 ++++----
 block/qcow2.c        | 15 ++++-----
 softmmu/bootdevice.c |  4 +--
 10 files changed, 108 insertions(+), 86 deletions(-)


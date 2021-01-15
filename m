Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6A72F7137
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 04:53:32 +0100 (CET)
Received: from localhost ([::1]:57266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0GB0-0005lF-Ls
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 22:53:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chaihaoyu1@huawei.com>)
 id 1l0GA4-0005Io-OE
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 22:52:32 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chaihaoyu1@huawei.com>)
 id 1l0GA0-0002if-LU
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 22:52:32 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DH6fh2J0kzj7tJ;
 Fri, 15 Jan 2021 11:51:08 +0800 (CST)
Received: from [10.108.235.54] (10.108.235.54) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Fri, 15 Jan 2021 11:52:03 +0800
From: chaihaoyu <chaihaoyu1@huawei.com>
Subject: [PATCH v2 0/5] softmmu: some space-style problems while coding
To: <qemu-devel@nongnu.org>, <pbonzini@redhat.com>, Peter Xu
 <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <aaa530f5-b7ec-3198-a80b-efb88de20c6c@huawei.com>
Date: Fri, 15 Jan 2021 11:52:02 +0800
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
Cc: alex.chen@huawei.com, hunongda@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

recently I found some code style problems while using checkpatch.pl tool,please review.

Haoyu Chai (5):
 softmmu: add spaces around operator
 softmmu: braces {} are needed for if statement
 softmmu: don't use '#' flag of printf format ('%#') in format strings
 softmmu: "foo* bar" should be "foo *bar"
 softmmu: code indent should never use tabs

 softmmu/bootdevice.c   |  4 ++--
 softmmu/cpus.c         |  6 ++++--
 softmmu/device_tree.c  |  2 +-
 softmmu/dma-helpers.c  |  3 ++-
 softmmu/globals.c      |  2 +-
 softmmu/memory.c       | 19 ++++++++++---------
 softmmu/physmem.c      | 17 +++++++++++------
 softmmu/qdev-monitor.c | 16 ++++++++++------
 softmmu/runstate.c     |  4 ++--
 9 files changed, 43 insertions(+), 30 deletions(-)

-- 
2.29.1.59.gf9b6481aed


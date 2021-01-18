Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 021512F981E
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 04:19:34 +0100 (CET)
Received: from localhost ([::1]:55560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1L4n-00055m-2G
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 22:19:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhouyang789@huawei.com>)
 id 1l1L3c-0003uB-Dm
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 22:18:20 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhouyang789@huawei.com>)
 id 1l1L3a-0006nr-77
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 22:18:20 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DJxlY31WXzl6Hq;
 Mon, 18 Jan 2021 11:16:41 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.498.0; Mon, 18 Jan 2021
 11:17:56 +0800
From: zhouyang <zhouyang789@huawei.com>
To: <alex.bennee@linaro.org>
Subject: [PATCH v3 0/5] Fix some style problems in contrib
Date: Mon, 18 Jan 2021 11:09:59 +0800
Message-ID: <20210118031004.1662363-1-zhouyang789@huawei.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhouyang789@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: alex.chen@huawei.com, qemu-devel@nongnu.org, zhouyang789@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v3 -> v2
add Cc 

zhouyang (5):
  contrib: Don't use '#' flag of printf format
  contrib: Fix some code style problems, ERROR: "foo * bar" should be
    "foo *bar"
  contrib: Add spaces around operator
  contrib: space required after that ','
  contrib: Open brace '{' following struct go on the same line

 contrib/ivshmem-server/main.c |  2 +-
 contrib/plugins/hotblocks.c   |  2 +-
 contrib/plugins/hotpages.c    |  2 +-
 contrib/plugins/howvec.c      | 19 +++++++++----------
 contrib/plugins/lockstep.c    |  6 +++---
 5 files changed, 15 insertions(+), 16 deletions(-)

-- 
2.23.0



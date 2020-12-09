Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0182D392D
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 04:17:10 +0100 (CET)
Received: from localhost ([::1]:54900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmpyX-0000Ea-NJ
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 22:17:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhouyang789@huawei.com>)
 id 1kmpuB-0004Yq-TO; Tue, 08 Dec 2020 22:12:39 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhouyang789@huawei.com>)
 id 1kmpu7-0008N4-I9; Tue, 08 Dec 2020 22:12:39 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CrMXd3KhgzhpBY;
 Wed,  9 Dec 2020 11:12:01 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Wed, 9 Dec 2020
 11:12:15 +0800
From: zhouyang <zhouyang789@huawei.com>
To: <alex.bennee@linaro.org>
Subject: [PATCH v2 0/5] Fix some style problems in contrib
Date: Wed, 9 Dec 2020 11:04:42 +0800
Message-ID: <20201209030447.2135652-1-zhouyang789@huawei.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=zhouyang789@huawei.com; helo=szxga06-in.huawei.com
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
Cc: alex.chen@huawei.com, hunongda@huawei.com, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v1 -> v2:
Changed the "From:" and "Signed-off-by:" lines from "zhouyang (T)" 
to my real name "zhouyang".

I found some style problems while check the code using checkpatch.pl 
and fixed them, please review.

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



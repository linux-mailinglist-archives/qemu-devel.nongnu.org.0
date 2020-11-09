Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDD02AB296
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Nov 2020 09:41:20 +0100 (CET)
Received: from localhost ([::1]:34754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kc2jn-0004aC-BO
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 03:41:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kc2iD-0003av-H1; Mon, 09 Nov 2020 03:39:41 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kc2iB-0004a8-8N; Mon, 09 Nov 2020 03:39:41 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CV4DC6MxlzLvsM;
 Mon,  9 Nov 2020 16:39:23 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Mon, 9 Nov 2020
 16:39:25 +0800
From: Alex Chen <alex.chen@huawei.com>
To: <alex.bennee@linaro.org>, <mjt@tls.msk.ru>, <laurent@vivier.eu>
Subject: [PATCH v3 0/2] plugins: Fix some resource leaks
Date: Mon, 9 Nov 2020 08:28:27 +0000
Message-ID: <20201109082829.87496-1-alex.chen@huawei.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=alex.chen@huawei.com;
 helo=szxga05-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 03:39:34
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
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
Cc: alex.chen@huawei.com, qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 zhengchuan@huawei.com, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are 3 resource leaks in contrib/plugins/lockstep.c, fix it.

v2->v3:
- change the "From" line to "Alex Chen"

v1->v2:
- add the cover letter
- modify the subject of the patch[2/2]

Alex Chen (2):
  plugins: Fix resource leak in connect_socket()
  plugins: Fix two resource leaks in setup_socket()

 contrib/plugins/lockstep.c | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.19.1



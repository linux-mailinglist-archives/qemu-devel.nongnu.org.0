Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 835682F72F5
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 07:38:02 +0100 (CET)
Received: from localhost ([::1]:35142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0IkD-0007bj-Kz
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 01:38:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chaihaoyu1@huawei.com>)
 id 1l0IjR-0007C0-J3
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 01:37:13 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chaihaoyu1@huawei.com>)
 id 1l0IjO-0003zm-CW
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 01:37:13 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DHBJW17Gmzl4x0;
 Fri, 15 Jan 2021 14:35:39 +0800 (CST)
Received: from [10.108.235.54] (10.108.235.54) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Fri, 15 Jan 2021 14:36:47 +0800
To: <alex.bennee@linaro.org>, <qemu-devel@nongnu.org>
From: chaihaoyu <chaihaoyu1@huawei.com>
Subject: [PATCH] plugin: foo * bar should be foo *bar
Message-ID: <75b8b38e-1898-b8d1-d3ad-f771e19fc725@huawei.com>
Date: Fri, 15 Jan 2021 14:36:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.108.235.54]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=chaihaoyu1@huawei.com; helo=szxga04-in.huawei.com
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
Cc: alex.chen@huawei.com, hunongda@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

recently I a code style problem while using checkpatch.pl tool,please review.
foo * bar should be foo *bar:

Signed-off-by: Haoyu Chai <chaihaoyu1@huawei.com>

---
 plugins/api.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/plugins/api.c b/plugins/api.c
index bbdc5a4eb4..9661824b89 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -309,7 +309,7 @@ uint64_t qemu_plugin_hwaddr_device_offset(const struct qemu_plugin_hwaddr *haddr
  */

 #ifndef CONFIG_USER_ONLY
-static MachineState * get_ms(void)
+static MachineState *get_ms(void)
 {
     return MACHINE(qdev_get_machine());
 }
-- 
2.29.1.59.gf9b6481aed


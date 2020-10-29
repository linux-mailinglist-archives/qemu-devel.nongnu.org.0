Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 803F629EF17
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Oct 2020 16:04:01 +0100 (CET)
Received: from localhost ([::1]:53130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kY9T6-0006Xc-Hc
	for lists+qemu-devel@lfdr.de; Thu, 29 Oct 2020 11:04:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chaihaoyu1@huawei.com>)
 id 1kY6m8-0002uo-Mj
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 08:11:28 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chaihaoyu1@huawei.com>)
 id 1kY6m5-0006iN-7N
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 08:11:28 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CMPRf2rWjzhd93;
 Thu, 29 Oct 2020 20:11:10 +0800 (CST)
Received: from [10.108.235.54] (10.108.235.54) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Thu, 29 Oct 2020 20:10:59 +0800
Subject: [PATCH 1/1] plugin: foo * bar should be foo *bar
References: <122e27ba-05e5-6cdf-344f-13636451a408@huawei.com>
To: <alex.bennee@linaro.org>
From: chaihaoyu <chaihaoyu1@huawei.com>
X-Forwarded-Message-Id: <122e27ba-05e5-6cdf-344f-13636451a408@huawei.com>
Message-ID: <c88e3ba7-c689-fae8-947e-b6c78742b52b@huawei.com>
Date: Thu, 29 Oct 2020 20:10:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <122e27ba-05e5-6cdf-344f-13636451a408@huawei.com>
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.108.235.54]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=chaihaoyu1@huawei.com; helo=szxga05-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/29 08:11:09
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 29 Oct 2020 10:57:05 -0400
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
 qemu-trival@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Date: Thu, 29 Oct 2020 15:53:44 +0800
signed-off-by: Haoyu Chai<chaihaoyu1@huawei.com>
Reported-by: Euler Robot <euler.robot@huawei.com>

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


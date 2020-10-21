Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2630294A45
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Oct 2020 11:14:33 +0200 (CEST)
Received: from localhost ([::1]:42162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVACW-0001Dm-7q
	for lists+qemu-devel@lfdr.de; Wed, 21 Oct 2020 05:14:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kVABE-0000oE-Fv; Wed, 21 Oct 2020 05:13:13 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:5712 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kVABA-0007Qg-Tj; Wed, 21 Oct 2020 05:13:11 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 9C30922E28C1FD90A4FD;
 Wed, 21 Oct 2020 17:12:53 +0800 (CST)
Received: from [10.174.187.138] (10.174.187.138) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Wed, 21 Oct 2020 17:12:52 +0800
Message-ID: <5F8FFB94.3030209@huawei.com>
Date: Wed, 21 Oct 2020 17:12:52 +0800
From: AlexChen <alex.chen@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
 rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: <kwolf@redhat.com>, <mreitz@redhat.com>
Subject: block: Remove unused include
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.138]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=alex.chen@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/21 03:34:19
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The "qemu-common.h" include is not used, remove it.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: AlexChen <alex.chen@huawei.com>
---
 block/dmg-lzfse.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/block/dmg-lzfse.c b/block/dmg-lzfse.c
index 19d25bc646..6798cf4fbf 100644
--- a/block/dmg-lzfse.c
+++ b/block/dmg-lzfse.c
@@ -22,7 +22,6 @@
  * THE SOFTWARE.
  */
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "dmg.h"
 #include <lzfse.h>

-- 
2.19.1


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0F02438BC
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Aug 2020 12:40:00 +0200 (CEST)
Received: from localhost ([::1]:58490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6AeN-0003Ek-Cf
	for lists+qemu-devel@lfdr.de; Thu, 13 Aug 2020 06:39:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1k6AXI-0000IB-B1; Thu, 13 Aug 2020 06:32:41 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4188 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1k6AXF-0006qZ-HB; Thu, 13 Aug 2020 06:32:40 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 378D9D8E5E5DE70B5005;
 Thu, 13 Aug 2020 18:32:32 +0800 (CST)
Received: from localhost.localdomain (10.175.104.175) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Thu, 13 Aug 2020 18:32:23 +0800
From: Peng Liang <liangpeng10@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [RFC 9/9] target/arm: Add more CPU features
Date: Thu, 13 Aug 2020 18:26:57 +0800
Message-ID: <20200813102657.2588720-10-liangpeng10@huawei.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200813102657.2588720-1-liangpeng10@huawei.com>
References: <20200813102657.2588720-1-liangpeng10@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=liangpeng10@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/13 06:32:27
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com,
 zhang.zhanghailiang@huawei.com, mst@redhat.com, cohuck@redhat.com,
 xiexiangyou@huawei.com, Peng Liang <liangpeng10@huawei.com>,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add i8mm, bf16, and dgh CPU features for AArch64.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Signed-off-by: Peng Liang <liangpeng10@huawei.com>
---
 target/arm/cpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 0f620e8afe..9e2ddbc3ed 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1319,6 +1319,9 @@ static struct CPUFeatureInfo cpu_features[] = {
     FIELD_INFO(ID_AA64ISAR1, FRINTTS, false, 1, 0, false),
     FIELD_INFO(ID_AA64ISAR1, SB, false, 1, 0, false),
     FIELD_INFO(ID_AA64ISAR1, SPECRES, false, 1, 0, false),
+    FIELD_INFO(ID_AA64ISAR1, I8MM, false, 1, 0, false),
+    FIELD_INFO(ID_AA64ISAR1, BF16, false, 1, 0, false),
+    FIELD_INFO(ID_AA64ISAR1, DGH, false, 1, 0, false),
 
     FIELD_INFO(ID_AA64PFR0, EL0, false, 1, 0, false),
     FIELD_INFO(ID_AA64PFR0, EL1, false, 1, 0, false),
-- 
2.18.4



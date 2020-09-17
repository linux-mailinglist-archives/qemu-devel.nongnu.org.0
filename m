Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E6E26D186
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Sep 2020 05:25:47 +0200 (CEST)
Received: from localhost ([::1]:55050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIkYM-0001l5-Rs
	for lists+qemu-devel@lfdr.de; Wed, 16 Sep 2020 23:25:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kIkUN-0004w5-QJ; Wed, 16 Sep 2020 23:21:39 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:44680 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kIkTp-0004QL-M3; Wed, 16 Sep 2020 23:21:39 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 765CCAFAF5B114C6D711;
 Thu, 17 Sep 2020 11:20:53 +0800 (CST)
Received: from localhost (10.174.185.104) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Thu, 17 Sep 2020
 11:20:44 +0800
From: Ying Fang <fangying1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH 01/12] linux headers: Update linux header with
 KVM_ARM_SET_MP_AFFINITY
Date: Thu, 17 Sep 2020 11:20:22 +0800
Message-ID: <20200917032033.2020-2-fangying1@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20200917032033.2020-1-fangying1@huawei.com>
References: <20200917032033.2020-1-fangying1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.104]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=fangying1@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 23:20:51
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
Cc: peter.maydell@linaro.org, drjones@redhat.com,
 zhang.zhanghailiang@huawei.com, alex.chen@huawei.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, alistair.francis@wdc.com,
 Ying Fang <fangying1@huawei.com>, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Ying Fang <fangying1@huawei.com>
---
 linux-headers/linux/kvm.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index a28c366737..461a2302e7 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -1031,6 +1031,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_PPC_SECURE_GUEST 181
 #define KVM_CAP_HALT_POLL 182
 #define KVM_CAP_ASYNC_PF_INT 183
+#define KVM_CAP_ARM_MP_AFFINITY 187
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
@@ -1470,6 +1471,8 @@ struct kvm_s390_ucas_mapping {
 #define KVM_S390_SET_CMMA_BITS      _IOW(KVMIO, 0xb9, struct kvm_s390_cmma_log)
 /* Memory Encryption Commands */
 #define KVM_MEMORY_ENCRYPT_OP      _IOWR(KVMIO, 0xba, unsigned long)
+/* Available with KVM_CAP_ARM_MP_AFFINITY */
+#define KVM_ARM_SET_MP_AFFINITY    _IOWR(KVMIO, 0xbb, unsigned long)
 
 struct kvm_enc_region {
 	__u64 addr;
-- 
2.23.0



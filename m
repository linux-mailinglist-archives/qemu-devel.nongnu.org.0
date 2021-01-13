Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 911B32F47B5
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 10:39:28 +0100 (CET)
Received: from localhost ([::1]:40144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzcch-0005nQ-Ic
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 04:39:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shiliyang@huawei.com>)
 id 1kzcWa-0008FK-CF
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 04:33:08 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shiliyang@huawei.com>)
 id 1kzcWY-0003kP-99
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 04:33:08 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DG2Jc42KjzMJhK;
 Wed, 13 Jan 2021 17:31:44 +0800 (CST)
Received: from [10.108.235.13] (10.108.235.13) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Wed, 13 Jan 2021 17:32:56 +0800
Subject: [PATCH V3 3/4] bsd-user: space required after semicolon
References: <b820b729-88a8-1103-b7a7-b66b637947d9@huawei.com>
To: <qemu-devel@nongnu.org>, <peter.maydell@linaro.org>
From: shiliyang <shiliyang@huawei.com>
Message-ID: <339c2da9-065e-d535-b63e-b35478b050c6@huawei.com>
Date: Wed, 13 Jan 2021 17:32:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <b820b729-88a8-1103-b7a7-b66b637947d9@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.108.235.13]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=shiliyang@huawei.com;
 helo=szxga05-in.huawei.com
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

This patch fixes error style problems found by checkpatch.pl:
ERROR: space required after that ';'

Signed-off-by: Liyang Shi <shiliyang@huawei.com>

---
 bsd-user/elfload.c | 2 +-
 bsd-user/syscall.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index a121e71339..fab9da757c 100644
--- a/bsd-user/elfload.c
+++ b/bsd-user/elfload.c
@@ -1227,7 +1227,7 @@ int load_elf_binary(struct linux_binprm *bprm, struct target_pt_regs *regs,
     end_data = 0;
     interp_ex.a_info = 0;

-    for(i=0;i < elf_ex.e_phnum; i++) {
+    for (i = 0; i < elf_ex.e_phnum; i++) {
         if (elf_ppnt->p_type == PT_INTERP) {
             if ( elf_interpreter != NULL )
             {
diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
index 9b471b665c..e16dc80478 100644
--- a/bsd-user/syscall.c
+++ b/bsd-user/syscall.c
@@ -271,7 +271,7 @@ static abi_long lock_iovec(int type, struct iovec *vec, abi_ulong target_addr,
     target_vec = lock_user(VERIFY_READ, target_addr, count * sizeof(struct target_iovec), 1);
     if (!target_vec)
         return -TARGET_EFAULT;
-    for(i = 0;i < count; i++) {
+    for (i = 0; i < count; i++) {
         base = tswapl(target_vec[i].iov_base);
         vec[i].iov_len = tswapl(target_vec[i].iov_len);
         if (vec[i].iov_len != 0) {
@@ -297,7 +297,7 @@ static abi_long unlock_iovec(struct iovec *vec, abi_ulong target_addr,
     target_vec = lock_user(VERIFY_READ, target_addr, count * sizeof(struct target_iovec), 1);
     if (!target_vec)
         return -TARGET_EFAULT;
-    for(i = 0;i < count; i++) {
+    for (i = 0; i < count; i++) {
         if (target_vec[i].iov_base) {
             base = tswapl(target_vec[i].iov_base);
             unlock_user(vec[i].iov_base, base, copy ? vec[i].iov_len : 0);
-- 
2.29.1.59.gf9b6481aed



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF075714C3
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 10:38:06 +0200 (CEST)
Received: from localhost ([::1]:42564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBBPB-0000dF-Ga
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 04:38:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1oBAvo-0005XN-8M
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 04:07:44 -0400
Received: from mail.loongson.cn ([114.242.206.163]:59292 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1oBAvl-0002CM-Ov
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 04:07:44 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_9JdKs1i3NgYAA--.15429S2; 
 Tue, 12 Jul 2022 16:01:34 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, f4bug@amsat.org, peter.maydell@linaro.org
Subject: [PATCH v1 0/5] Fix LoongArch coverity error and cpu name bug
Date: Tue, 12 Jul 2022 16:01:28 +0800
Message-Id: <20220712080133.4176971-1-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx_9JdKs1i3NgYAA--.15429S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZw4kJrWfWw17WFy8AFykAFb_yoW3AFg_CF
 nay3s2kw4UW3WUAFWavr90ywnxGF48KFnIyF4DWr47CrW5JrnxXw4UK395Zr10vr48Xrs5
 CrWIqry5Aw1YkjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUUUUUUU
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series fix some errors for LoongArch virt machine
1. Fix coverity errors such as out-of-bounds, integer overflow,
cond_at_most, etc.
2. Fix loongarch_cpu_class_by_name function.

Xiaojuan Yang (5):
  target/loongarch/cpu: Fix cpu_class_by_name function
  hw/intc/loongarch_pch_pic: Fix coverity errors in update irq
  target/loongarch/cpu: Fix coverity errors about excp_names
  target/loongarch/tlb_helper: Fix coverity integer overflow error
  target/loongarch/op_helper: Fix coverity cond_at_most error

 hw/intc/loongarch_pch_pic.c   | 16 ++++++++++------
 target/loongarch/cpu.c        | 11 ++++-------
 target/loongarch/op_helper.c  |  2 +-
 target/loongarch/tlb_helper.c |  4 ++--
 4 files changed, 17 insertions(+), 16 deletions(-)

-- 
2.31.1



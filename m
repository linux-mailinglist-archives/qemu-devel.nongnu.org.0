Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D57F261E9C1
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 04:33:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orssl-0000Oj-Cr; Sun, 06 Nov 2022 22:33:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1orssj-0000NF-DC
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 22:33:05 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1orssg-0004WN-Mi
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 22:33:05 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Dxu9hjfGhj1e8EAA--.16230S3;
 Mon, 07 Nov 2022 11:32:51 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxJldifGhjjUMOAA--.21646S2; 
 Mon, 07 Nov 2022 11:32:50 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	stefanha@gmail.com
Subject: [PULL 0/2] loongarch for 7.2 patches
Date: Mon,  7 Nov 2022 11:32:48 +0800
Message-Id: <20221107033250.4163885-1-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxJldifGhjjUMOAA--.21646S2
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvdXoW7JF1fAryUtryUKFyUZr43KFg_yoWkZFg_WF
 yxJF18CrWUWw1UAr4jkry5Jw17JF48GFn0kF1DtrWxCr13Jr15Jr4qqFs5Zr1jvF18Xrn8
 Ar42yryfCr1UtjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
 xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUU5
 37CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4
 vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7Cj
 xVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x
 0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E
 6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWrMcvjeVCFs4IE7x
 kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv
 6cx26rWl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
 8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE
 2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42
 xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF
 7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0zRVWlkUUUUU=
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 466e81ff12013d026e2d0154266fce82bce2ee9b:

  Merge tag 'vfio-fixes-v7.2-rc0.0' of https://gitlab.com/alex.williamson/qemu into staging (2022-11-05 08:41:01 -0400)

are available in the Git repository at:

  https://gitlab.com/gaosong/qemu.git tags/pull-loongarch-20221107

for you to fetch changes up to e913bace61c539a88feb489b424554ebb2d5d3a3:

  target/loongarch: Fix return value of CHECK_FPE (2022-11-07 10:54:11 +0800)

----------------------------------------------------------------
pull-loongarch-20221107

----------------------------------------------------------------
Rui Wang (2):
      target/loongarch: Separate the hardware flags into MMU index and PLV
      target/loongarch: Fix return value of CHECK_FPE

 target/loongarch/cpu.h                             | 18 +++++++++---------
 target/loongarch/insn_trans/trans_farith.c.inc     |  2 +-
 target/loongarch/insn_trans/trans_privileged.c.inc |  4 ++--
 target/loongarch/tlb_helper.c                      |  4 ++--
 target/loongarch/translate.c                       |  5 +++--
 target/loongarch/translate.h                       |  3 ++-
 6 files changed, 19 insertions(+), 17 deletions(-)



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF4260072C
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 08:59:45 +0200 (CEST)
Received: from localhost ([::1]:34822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okK6C-0001nx-5X
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 02:59:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1okJnG-0005hJ-0L
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 02:40:10 -0400
Received: from mail.loongson.cn ([114.242.206.163]:57804 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1okJmz-0002SY-KK
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 02:40:09 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id AQAAf8CxhOSw+Exj8gMAAA--.86S2;
 Mon, 17 Oct 2022 14:39:45 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	stefanha@gmail.com
Subject: [PULL 0/5] loongarch-to-apply queue
Date: Mon, 17 Oct 2022 14:39:39 +0800
Message-Id: <20221017063944.1443723-1-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxhOSw+Exj8gMAAA--.86S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uw4DCr4kJryUCw1xXry8Grg_yoW8Jw17pr
 WSkFy3Gr4rJrZrJrn7tw13JF15JFn7Gr4IqF17K348CF4kZr18Xr18t34IgFyUJ347Gryj
 qr18Aw15WF4UZwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 5c2439a92ce4a1c5a53070bd803d6f7647e702ca:

  Merge tag 'pull-riscv-to-apply-20221014' of https://github.com/alistair23/qemu into staging (2022-10-16 15:53:13 -0400)

are available in the Git repository at:

  https://gitlab.com/gaosong/qemu.git tags/pull-loongarch-20221017

for you to fetch changes up to 5ef4a4af8b41fb175374726f379a2aea79929023:

  hw/intc: Fix LoongArch ipi device emulation (2022-10-17 10:28:35 +0800)

----------------------------------------------------------------
pull-loongarch-20221017

----------------------------------------------------------------
Song Gao (3):
      target/loongarch: bstrins.w src register need EXT_NONE
      target/loongarch: Fix fnm{sub/add}_{s/d} set wrong flags
      softfloat: logB(0) should raise divideByZero exception

WANG Xuerui (1):
      linux-user: Fix struct statfs ABI on loongarch64

Xiaojuan Yang (1):
      hw/intc: Fix LoongArch ipi device emulation

 fpu/softfloat-parts.c.inc                      |  1 +
 hw/intc/loongarch_ipi.c                        |  1 -
 linux-user/syscall_defs.h                      |  3 ++-
 target/loongarch/insn_trans/trans_bit.c.inc    | 36 ++++++++++++++++----------
 target/loongarch/insn_trans/trans_farith.c.inc | 12 ++++-----
 5 files changed, 31 insertions(+), 22 deletions(-)



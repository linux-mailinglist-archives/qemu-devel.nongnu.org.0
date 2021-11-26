Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B4C45E464
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 03:25:47 +0100 (CET)
Received: from localhost ([::1]:52990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqQvp-0000pQ-Ux
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 21:25:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mqQte-0007FE-1B
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 21:23:31 -0500
Received: from mail.loongson.cn ([114.242.206.163]:40388 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mqQtN-0000U1-Ge
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 21:23:15 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxT8sNRaBhLQAAAA--.8S2;
 Fri, 26 Nov 2021 10:23:09 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] Move target_signal.h generic definitions to
 generic/signal.h
Date: Fri, 26 Nov 2021 10:23:05 +0800
Message-Id: <1637893388-10282-1-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxT8sNRaBhLQAAAA--.8S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CFyUKr4rGF1DuFyxWF45KFg_yoW5JrW5pa
 yfJ3s7Jr1xJrW8G347Jw17Xa48Xa4UGr1DC3Zaq34kJ34SvFWrWw1DCF4rG345XF95GFs0
 gFWDAr1DKrWUWFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Cc: alex.bennee@linaro.org, richard.henderson@linaro.org, laurent@vivier.eu,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

This seris:
 - Move target_signal.h generic defintions to generic/signal.h, 
 - target_syscall.h remove TARGET_MINSIGSTKSZ
 - Remove unused definitions TARGET_SIGSTKSZ.

Song Gao (3):
  linux-user: Move target_signal.h generic definitions to
    generic/signal.h
  linux-user: target_syscall.h remove definition TARGET_MINSIGSTKSZ
  linux-user: Remove TARGET_SIGSTKSZ

 linux-user/aarch64/target_signal.h     | 18 ------------------
 linux-user/aarch64/target_syscall.h    |  1 -
 linux-user/alpha/target_signal.h       |  1 -
 linux-user/alpha/target_syscall.h      |  1 -
 linux-user/arm/target_signal.h         | 18 ------------------
 linux-user/arm/target_syscall.h        |  1 -
 linux-user/cris/target_signal.h        | 18 ------------------
 linux-user/cris/target_syscall.h       |  1 -
 linux-user/generic/signal.h            | 15 +++++++++++++++
 linux-user/hexagon/target_signal.h     | 11 -----------
 linux-user/hppa/target_signal.h        |  1 -
 linux-user/hppa/target_syscall.h       |  1 -
 linux-user/i386/target_signal.h        | 18 ------------------
 linux-user/i386/target_syscall.h       |  1 -
 linux-user/m68k/target_signal.h        | 18 ------------------
 linux-user/m68k/target_syscall.h       |  1 -
 linux-user/microblaze/target_signal.h  | 18 ------------------
 linux-user/microblaze/target_syscall.h |  1 -
 linux-user/mips/target_signal.h        |  1 -
 linux-user/mips/target_syscall.h       |  1 -
 linux-user/mips64/target_signal.h      |  1 -
 linux-user/mips64/target_syscall.h     |  1 -
 linux-user/nios2/target_signal.h       | 16 ----------------
 linux-user/nios2/target_syscall.h      |  1 -
 linux-user/openrisc/target_signal.h    | 23 -----------------------
 linux-user/openrisc/target_syscall.h   |  1 -
 linux-user/ppc/target_signal.h         | 18 ------------------
 linux-user/ppc/target_syscall.h        |  1 -
 linux-user/riscv/target_signal.h       | 12 ------------
 linux-user/riscv/target_syscall.h      |  1 -
 linux-user/s390x/target_signal.h       | 15 ---------------
 linux-user/s390x/target_syscall.h      |  1 -
 linux-user/sh4/target_signal.h         | 18 ------------------
 linux-user/sh4/target_syscall.h        |  1 -
 linux-user/sparc/target_signal.h       |  1 -
 linux-user/sparc/target_syscall.h      |  1 -
 linux-user/x86_64/target_signal.h      | 18 ------------------
 linux-user/x86_64/target_syscall.h     |  1 -
 linux-user/xtensa/target_signal.h      | 17 -----------------
 39 files changed, 15 insertions(+), 279 deletions(-)

-- 
1.8.3.1



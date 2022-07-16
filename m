Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C875576CB3
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jul 2022 11:05:44 +0200 (CEST)
Received: from localhost ([::1]:48834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCdk7-0004JE-K5
	for lists+qemu-devel@lfdr.de; Sat, 16 Jul 2022 05:05:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oCdZO-0005cq-NW
 for qemu-devel@nongnu.org; Sat, 16 Jul 2022 04:54:42 -0400
Received: from mail.loongson.cn ([114.242.206.163]:50062 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oCdZL-0006eR-RW
 for qemu-devel@nongnu.org; Sat, 16 Jul 2022 04:54:38 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxz9PCfNJijWQiAA--.28082S2; 
 Sat, 16 Jul 2022 16:54:26 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, alex.bennee@linaro.org, f4bug@amsat.org,
 gaosong@loongson.cn, peter.maydell@linaro.org, yangxiaojuan@loongson.cn
Subject: [PATCH 0/8] tests/tcg/loongarch64: Add some tests.
Date: Sat, 16 Jul 2022 16:54:18 +0800
Message-Id: <20220716085426.3098060-1-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxz9PCfNJijWQiAA--.28082S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WF48trW8WryfJr4rZw1xuFg_yoW8Cw1xp3
 43Cr15Krs7GFyfArnxK3s8Wr1ftryfG3W293Wagr10vrWIkry2qr1FgryDXFy3t340qryI
 vwsaqw1fWFyUJFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
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

Hi, All

This series adds some float reference files, fixes some
float_convd/float_convs/float_madds bugs, and adds some
instructions tests.

Thanks.
Song Gao


Philippe Mathieu-Daudé (1):
  tests/tcg/loongarch64: Add float reference files

Song Gao (7):
  fpu/softfloat: Add LoongArch specialization for pickNaNMulAdd
  target/loongarch: Fix float_convd/float_convs test failing
  tests/tcg/loongarch64: Add clo related instructions test
  tests/tcg/loongarch64: Add div and mod related instructions test
  tests/tcg/loongarch64: Add fclass test
  tests/tcg/loongarch64: Add som comparison instructions test
  tests/tcg/loongarch64: Add pcadd related instructions test

 fpu/softfloat-specialize.c.inc        |  23 +
 target/loongarch/fpu_helper.c         | 143 ++--
 tests/tcg/loongarch64/Makefile.target |  19 +
 tests/tcg/loongarch64/float_convd.ref | 988 ++++++++++++++++++++++++++
 tests/tcg/loongarch64/float_convs.ref | 748 +++++++++++++++++++
 tests/tcg/loongarch64/float_madds.ref | 768 ++++++++++++++++++++
 tests/tcg/loongarch64/test_bit.c      |  88 +++
 tests/tcg/loongarch64/test_div.c      |  54 ++
 tests/tcg/loongarch64/test_fclass.c   | 130 ++++
 tests/tcg/loongarch64/test_fpcom.c    |  37 +
 tests/tcg/loongarch64/test_pcadd.c    |  38 +
 11 files changed, 2973 insertions(+), 63 deletions(-)
 create mode 100644 tests/tcg/loongarch64/Makefile.target
 create mode 100644 tests/tcg/loongarch64/float_convd.ref
 create mode 100644 tests/tcg/loongarch64/float_convs.ref
 create mode 100644 tests/tcg/loongarch64/float_madds.ref
 create mode 100644 tests/tcg/loongarch64/test_bit.c
 create mode 100644 tests/tcg/loongarch64/test_div.c
 create mode 100644 tests/tcg/loongarch64/test_fclass.c
 create mode 100644 tests/tcg/loongarch64/test_fpcom.c
 create mode 100644 tests/tcg/loongarch64/test_pcadd.c

-- 
2.31.1



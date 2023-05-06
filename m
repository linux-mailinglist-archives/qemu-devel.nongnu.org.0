Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 537A06F8F40
	for <lists+qemu-devel@lfdr.de>; Sat,  6 May 2023 08:38:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvBWY-0005h8-Vn; Sat, 06 May 2023 02:36:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pvBWO-0005fq-JU
 for qemu-devel@nongnu.org; Sat, 06 May 2023 02:35:57 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pvBWL-00049s-K1
 for qemu-devel@nongnu.org; Sat, 06 May 2023 02:35:56 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Cx+ek99VVkqKQFAA--.9286S3;
 Sat, 06 May 2023 14:35:41 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxDbM89VVkhCNNAA--.9773S2; 
 Sat, 06 May 2023 14:35:40 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [PULL v2 00/45] loongarch-to-apply queue
Date: Sat,  6 May 2023 14:34:55 +0800
Message-Id: <20230506063540.178794-1-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxDbM89VVkhCNNAA--.9773S2
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxJF13XFyrCF4DurW5Gw4DArb_yoWrXFyDpr
 y3ZrnrtFW8JrZ7Xr1kXa9xZrn0qr1xG3y2v3Wft348uw43Ar97ZF18t3s2gFyUXayUGry2
 qF10kwn8XF45X37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bnxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2
 zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxF
 aVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
 Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY
 6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6x
 AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY
 1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7xRE6wZ7UUUUU==
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit eb5c3932a383ba1ef3a911232c644f2e053ef66c:

  Merge tag 'pw-pull-request' of https://gitlab.com/marcandre.lureau/qemu into staging (2023-05-05 19:18:05 +0100)

are available in the Git repository at:

  https://gitlab.com/gaosong/qemu.git tags/pull-loongarch-20230506

for you to fetch changes up to 725d7e763a802321e1bb303348afc551d564d31e:

  hw/intc: don't use target_ulong for LoongArch ipi (2023-05-06 11:19:50 +0800)

----------------------------------------------------------------
Add LoongArch LSX instructions.

v2: Fixes build error.

----------------------------------------------------------------
Alex Bennée (1):
      hw/intc: don't use target_ulong for LoongArch ipi

Song Gao (44):
      target/loongarch: Add LSX data type VReg
      target/loongarch: meson.build support build LSX
      target/loongarch: Add CHECK_SXE maccro for check LSX enable
      target/loongarch: Implement vadd/vsub
      target/loongarch: Implement vaddi/vsubi
      target/loongarch: Implement vneg
      target/loongarch: Implement vsadd/vssub
      target/loongarch: Implement vhaddw/vhsubw
      target/loongarch: Implement vaddw/vsubw
      target/loongarch: Implement vavg/vavgr
      target/loongarch: Implement vabsd
      target/loongarch: Implement vadda
      target/loongarch: Implement vmax/vmin
      target/loongarch: Implement vmul/vmuh/vmulw{ev/od}
      target/loongarch: Implement vmadd/vmsub/vmaddw{ev/od}
      target/loongarch: Implement vdiv/vmod
      target/loongarch: Implement vsat
      target/loongarch: Implement vexth
      target/loongarch: Implement vsigncov
      target/loongarch: Implement vmskltz/vmskgez/vmsknz
      target/loongarch: Implement LSX logic instructions
      target/loongarch: Implement vsll vsrl vsra vrotr
      target/loongarch: Implement vsllwil vextl
      target/loongarch: Implement vsrlr vsrar
      target/loongarch: Implement vsrln vsran
      target/loongarch: Implement vsrlrn vsrarn
      target/loongarch: Implement vssrln vssran
      target/loongarch: Implement vssrlrn vssrarn
      target/loongarch: Implement vclo vclz
      target/loongarch: Implement vpcnt
      target/loongarch: Implement vbitclr vbitset vbitrev
      target/loongarch: Implement vfrstp
      target/loongarch: Implement LSX fpu arith instructions
      target/loongarch: Implement LSX fpu fcvt instructions
      target/loongarch: Implement vseq vsle vslt
      target/loongarch: Implement vfcmp
      target/loongarch: Implement vbitsel vset
      target/loongarch: Implement vinsgr2vr vpickve2gr vreplgr2vr
      target/loongarch: Implement vreplve vpack vpick
      target/loongarch: Implement vilvl vilvh vextrins vshuf
      target/loongarch: Implement vld vst
      target/loongarch: Implement vldi
      target/loongarch: Use {set/get}_gpr replace to cpu_fpr
      target/loongarch: CPUCFG support LSX

 hw/intc/loongarch_ipi.c                         |    2 +-
 linux-user/loongarch64/signal.c                 |    4 +-
 target/loongarch/cpu.c                          |    5 +-
 target/loongarch/cpu.h                          |   27 +-
 target/loongarch/disas.c                        |  911 +++++
 target/loongarch/fpu_helper.c                   |    2 +-
 target/loongarch/gdbstub.c                      |    4 +-
 target/loongarch/helper.h                       |  566 +++
 target/loongarch/insn_trans/trans_farith.c.inc  |   72 +-
 target/loongarch/insn_trans/trans_fcmp.c.inc    |   12 +-
 target/loongarch/insn_trans/trans_fmemory.c.inc |   37 +-
 target/loongarch/insn_trans/trans_fmov.c.inc    |   31 +-
 target/loongarch/insn_trans/trans_lsx.c.inc     | 4400 +++++++++++++++++++++++
 target/loongarch/insns.decode                   |  811 +++++
 target/loongarch/internals.h                    |   23 +
 target/loongarch/lsx_helper.c                   | 3004 ++++++++++++++++
 target/loongarch/machine.c                      |   79 +-
 target/loongarch/meson.build                    |    1 +
 target/loongarch/translate.c                    |   55 +-
 target/loongarch/translate.h                    |    1 +
 20 files changed, 9989 insertions(+), 58 deletions(-)
 create mode 100644 target/loongarch/insn_trans/trans_lsx.c.inc
 create mode 100644 target/loongarch/lsx_helper.c



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BA0688089
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 15:51:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNaqv-0005PD-GY; Thu, 02 Feb 2023 09:46:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pNYvV-000791-IO
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 07:42:53 -0500
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pNYvT-0000em-MS
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 07:42:53 -0500
Received: from [167.98.27.226] (helo=lawrence-thinkpad.office.codethink.co.uk)
 by imap5.colo.codethink.co.uk with esmtpsa (Exim 4.94.2 #2 (Debian))
 id 1pNYvD-004Q6t-8c; Thu, 02 Feb 2023 12:42:36 +0000
From: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
To: qemu-devel@nongnu.org
Cc: dickon.hood@codethink.co.uk, nazar.kazakov@codethink.co.uk,
 kiran.ostrolenk@codethink.co.uk, frank.chang@sifive.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 pbonzini@redhat.com, philipp.tomsich@vrull.eu, kvm@vger.kernel.org,
 Lawrence Hunter <lawrence.hunter@codethink.co.uk>
Subject: [PATCH 00/39] Add RISC-V vector cryptography extensions
Date: Thu,  2 Feb 2023 12:41:51 +0000
Message-Id: <20230202124230.295997-1-lawrence.hunter@codethink.co.uk>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=78.40.148.171;
 envelope-from=lawrence.hunter@codethink.co.uk; helo=imap5.colo.codethink.co.uk
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, URI_NOVOWEL=0.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 02 Feb 2023 09:46:13 -0500
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

This patch series introduces an implementation for the six instruction sets
of the draft RISC-V vector cryptography extensions specification.

This patch set implements the instruction sets as per the 20221202
version of the specification (1). We plan to update to the latest spec
once stabilised.

Work performed by Dickon, Lawrence, Nazar, Kiran, and William from Codethink
sponsored by SiFive, as well as Max Chou and Frank Chang from SiFive.

For convenience we have created a git repo with our patches on top of a
recent master. https://github.com/CodethinkLabs/qemu-ct

1. https://github.com/riscv/riscv-crypto/releases

Dickon Hood (1):
  target/riscv: Add vrol.[vv,vx] and vror.[vv,vx,vi] decoding,
    translation and execution support

Kiran Ostrolenk (4):
  target/riscv: Add vsha2ms.vv decoding, translation and execution
    support
  target/riscv: add zvksh cpu property
  target/riscv: Add vsm3c.vi decoding, translation and execution support
  target/riscv: expose zvksh cpu property

Lawrence Hunter (16):
  target/riscv: Add vclmul.vv decoding, translation and execution
    support
  target/riscv: Add vclmul.vx decoding, translation and execution
    support
  target/riscv: Add vclmulh.vv decoding, translation and execution
    support
  target/riscv: Add vclmulh.vx decoding, translation and execution
    support
  target/riscv: Add vaesef.vv decoding, translation and execution
    support
  target/riscv: Add vaesef.vs decoding, translation and execution
    support
  target/riscv: Add vaesdf.vv decoding, translation and execution
    support
  target/riscv: Add vaesdf.vs decoding, translation and execution
    support
  target/riscv: Add vaesdm.vv decoding, translation and execution
    support
  target/riscv: Add vaesdm.vs decoding, translation and execution
    support
  target/riscv: Add vaesz.vs decoding, translation and execution support
  target/riscv: Add vsha2c[hl].vv decoding, translation and execution
    support
  target/riscv: Add vsm3me.vv decoding, translation and execution
    support
  target/riscv: add zvkg cpu property
  target/riscv: Add vghmac.vv decoding, translation and execution
    support
  target/riscv: expose zvkg cpu property

Max Chou (5):
  crypto: Move SM4_SBOXWORD from target/riscv
  crypto: Add SM4 constant parameter CK.
  target/riscv: Add zvksed cfg property
  target/riscv: Add Zvksed support
  target/riscv: Expose Zvksed property

Nazar Kazakov (10):
  target/riscv: add zvkb cpu property
  target/riscv: Add vrev8.v decoding, translation and execution support
  target/riscv: Add vandn.[vv,vx,vi] decoding, translation and execution
    support
  target/riscv: expose zvkb cpu property
  target/riscv: add zvkns cpu property
  target/riscv: Add vaeskf1.vi decoding, translation and execution
    support
  target/riscv: Add vaeskf2.vi decoding, translation and execution
    support
  target/riscv: expose zvkns cpu property
  target/riscv: add zvknh cpu properties
  target/riscv: expose zvknh cpu properties

William Salmon (3):
  target/riscv: Add vbrev8.v decoding, translation and execution support
  target/riscv: Add vaesem.vv decoding, translation and execution
    support
  target/riscv: Add vaesem.vs decoding, translation and execution
    support

 crypto/sm4.c                                 |   10 +
 include/crypto/sm4.h                         |    8 +
 include/qemu/bitops.h                        |   32 +
 target/arm/crypto_helper.c                   |   10 +-
 target/riscv/cpu.c                           |   33 +
 target/riscv/cpu.h                           |    7 +
 target/riscv/crypto_helper.c                 |    1 +
 target/riscv/helper.h                        |   69 ++
 target/riscv/insn32.decode                   |   48 +
 target/riscv/insn_trans/trans_rvzvkb.c.inc   |  162 +++
 target/riscv/insn_trans/trans_rvzvkg.c.inc   |    9 +
 target/riscv/insn_trans/trans_rvzvknh.c.inc  |   47 +
 target/riscv/insn_trans/trans_rvzvkns.c.inc  |  119 ++
 target/riscv/insn_trans/trans_rvzvksed.c.inc |   35 +
 target/riscv/insn_trans/trans_rvzvksh.c.inc  |   20 +
 target/riscv/meson.build                     |    4 +-
 target/riscv/translate.c                     |    6 +
 target/riscv/vcrypto_helper.c                | 1013 ++++++++++++++++++
 target/riscv/vector_helper.c                 |  242 +----
 target/riscv/vector_internals.c              |   63 ++
 target/riscv/vector_internals.h              |  226 ++++
 21 files changed, 1914 insertions(+), 250 deletions(-)
 create mode 100644 target/riscv/insn_trans/trans_rvzvkb.c.inc
 create mode 100644 target/riscv/insn_trans/trans_rvzvkg.c.inc
 create mode 100644 target/riscv/insn_trans/trans_rvzvknh.c.inc
 create mode 100644 target/riscv/insn_trans/trans_rvzvkns.c.inc
 create mode 100644 target/riscv/insn_trans/trans_rvzvksed.c.inc
 create mode 100644 target/riscv/insn_trans/trans_rvzvksh.c.inc
 create mode 100644 target/riscv/vcrypto_helper.c
 create mode 100644 target/riscv/vector_internals.c
 create mode 100644 target/riscv/vector_internals.h

-- 
2.39.1



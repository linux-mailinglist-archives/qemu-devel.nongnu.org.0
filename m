Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A3247A42B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 06:00:04 +0100 (CET)
Received: from localhost ([::1]:59842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzAmG-0001mJ-Fm
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 00:00:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAjj-0007d7-N8
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:57:23 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:51296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAjf-0007zJ-Of
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:57:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976239; x=1671512239;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=L2Y4b6UY9vupLexnU9s1Zaol1ohY3RkQnwuxXkCOWsg=;
 b=V49cmm9J10UmcOHH1Rt/XfawTpuchcwdM5sTzNNjrAqp29TZ9TgsPPd/
 eunM1xSmnDCxeGoHrbeHrCoWGT19tcaXLnxqaKFwH5t6HZ3uBJWY3Sb28
 G5CthF/tJlNm+bmWKwsaJlL8bxTjTv1lJNkT/s7wBdaTIKfw3743Jjmvz
 YieNb4Hy6DYtN+jEkGcOTJj2i/DidAtPSDzsgEbDcLDcICjq31q5UOpKE
 /sysTHFxHuVw8CHTITKVT18z0KCaQJWw9+QSGoe+i7/SMJbrRqk1+0m0N
 YJ5OMJwcN6EWo6nhEnqUhTRpvAiviTfuI6l55PErS9mPGSawBpY9qIsD5 g==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="292661853"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 12:57:16 +0800
IronPort-SDR: 8cLkGkA9Hm2kQENgaD5DTcz8V+XV0q6vlZPgmkDXtQxiGyVOeDmqJlhcfHqq3CJ0HXuU03J8jh
 g5ofpVrTLxnvf+KDCWL+qkAiF0o6TzqpzKPRjbpybD6PJRQOL/Ht57P6CP1Gvx3ou6ej53hKU/
 /aR38RvGM5akiyybOhvVdhs6focvLmPLg82KN3vF2S8MLz6v4INkr/LgvC33PfHKnbvt4tqaaH
 rNmnPbEovV1sBtHsZWH1NMddOK4/GNhXXdp3XNJ69N3udIAsPeOR68cvuY7fxG7h3RN8WcHWYK
 73d7Sda3r0JbzUa8GHkTHPXJ
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:31:33 -0800
IronPort-SDR: qPIVQknnwLIZ5SKAAgQgAnAXhFXJemF0I6UipIHXMxDQkFVq/yoKh/MdhByrVFaAfrI8B73fKV
 EwA39/AtMuB1HxxkNBl2dLoKZV3xa7x4VkHoVnaRsLm5SsIbuujnRe0DAydixdaZm8A7Zwj51x
 ZEYYZ/WCwtXPuiNnkiP9yFog08Eg4EOvr9H2WZyGYxa9GcH0LYDhzIKdT/YrEsKkjZKhjBC7vr
 X/ZCTH0/bDYJX3Qdkzs1TFEjndMipefoe6sJiNgKqinW9P4U5uR9PaPEwIoz7TKhIqXAbcUlpJ
 g0I=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:57:17 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS4X2kfcz1RwFN
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 20:57:16 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1639976235;
 x=1642568236; bh=L2Y4b6UY9vupLexnU9s1Zaol1ohY3RkQnwuxXkCOWsg=; b=
 utdrSjpoZkoEJ5IVsPSsMbEflBWUl6mISqmn55gi1D0pPyECnwvuo7DfHNElEOSh
 QeLou6t819M1RMeIKR6BGGHaj5aEZN0c6i/W+1ThIMYGAQbwrvCszzUbed2YAzMU
 q2HUUsacflFqeVIbwZRkksc4+uD5gV+fYyW0FASC/+NRUAjs3TIIale55s1tMWyu
 7gdxTkjrfK1MrReX8v14QvO1XJ0jRCrXiBrel0jKn+m97UX8ajqQ0KYy4ycofsMG
 ATYNOwzVBG3S3a3SQvKtEKL7XMHIOZ+72k48lK0j4us6jcDCD0OVznkFWeotM0w0
 Fl2x7KdFrQOy7qc6AwEtuQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 9JqvrWKUhZJU for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 20:57:15 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS4S5kpkz1RtVG;
 Sun, 19 Dec 2021 20:57:12 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 00/88] riscv-to-apply queue
Date: Mon, 20 Dec 2021 14:55:37 +1000
Message-Id: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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

From: Alistair Francis <alistair.francis@wdc.com>

The following changes since commit 212a33d3b0c65ae2583bb1d06cb140cd089089=
4c:

  Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into stagin=
g (2021-12-19 16:36:10 -0800)

are available in the Git repository at:

  git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20211220-1

for you to fetch changes up to 7e322a7f23a60b0e181b55ef722fdf390ec4e463:

  hw/riscv: Use load address rather than entry point for fw_dynamic next_=
addr (2021-12-20 14:53:31 +1000)

----------------------------------------------------------------
First RISC-V PR for QEMU 7.0

 - Add support for ratified 1.0 Vector extension
 - Drop support for draft 0.7.1 Vector extension
 - Support Zfhmin and Zfh extensions
 - Improve kernel loading for non-Linux platforms

----------------------------------------------------------------
Frank Chang (75):
      target/riscv: zfh: add Zfh cpu property
      target/riscv: zfh: implement zfhmin extension
      target/riscv: zfh: add Zfhmin cpu property
      target/riscv: drop vector 0.7.1 and add 1.0 support
      target/riscv: Use FIELD_EX32() to extract wd field
      target/riscv: rvv-1.0: set mstatus.SD bit if mstatus.VS is dirty
      target/riscv: rvv-1.0: introduce writable misa.v field
      target/riscv: rvv-1.0: add translation-time vector context status
      target/riscv: rvv-1.0: remove rvv related codes from fcsr registers
      target/riscv: rvv-1.0: check MSTATUS_VS when accessing vector csr r=
egisters
      target/riscv: rvv-1.0: remove MLEN calculations
      target/riscv: rvv-1.0: add fractional LMUL
      target/riscv: rvv-1.0: add VMA and VTA
      target/riscv: rvv-1.0: update check functions
      target/riscv: introduce more imm value modes in translator function=
s
      target/riscv: rvv:1.0: add translation-time nan-box helper function
      target/riscv: rvv-1.0: remove amo operations instructions
      target/riscv: rvv-1.0: configure instructions
      target/riscv: rvv-1.0: stride load and store instructions
      target/riscv: rvv-1.0: index load and store instructions
      target/riscv: rvv-1.0: fix address index overflow bug of indexed lo=
ad/store insns
      target/riscv: rvv-1.0: fault-only-first unit stride load
      target/riscv: rvv-1.0: load/store whole register instructions
      target/riscv: rvv-1.0: update vext_max_elems() for load/store insns
      target/riscv: rvv-1.0: take fractional LMUL into vector max element=
s calculation
      target/riscv: rvv-1.0: floating-point square-root instruction
      target/riscv: rvv-1.0: floating-point classify instructions
      target/riscv: rvv-1.0: count population in mask instruction
      target/riscv: rvv-1.0: find-first-set mask bit instruction
      target/riscv: rvv-1.0: set-X-first mask bit instructions
      target/riscv: rvv-1.0: iota instruction
      target/riscv: rvv-1.0: element index instruction
      target/riscv: rvv-1.0: allow load element with sign-extended
      target/riscv: rvv-1.0: register gather instructions
      target/riscv: rvv-1.0: integer scalar move instructions
      target/riscv: rvv-1.0: floating-point move instruction
      target/riscv: rvv-1.0: floating-point scalar move instructions
      target/riscv: rvv-1.0: whole register move instructions
      target/riscv: rvv-1.0: integer extension instructions
      target/riscv: rvv-1.0: single-width averaging add and subtract inst=
ructions
      target/riscv: rvv-1.0: single-width bit shift instructions
      target/riscv: rvv-1.0: integer add-with-carry/subtract-with-borrow
      target/riscv: rvv-1.0: narrowing integer right shift instructions
      target/riscv: rvv-1.0: widening integer multiply-add instructions
      target/riscv: rvv-1.0: single-width saturating add and subtract ins=
tructions
      target/riscv: rvv-1.0: integer comparison instructions
      target/riscv: rvv-1.0: floating-point compare instructions
      target/riscv: rvv-1.0: mask-register logical instructions
      target/riscv: rvv-1.0: slide instructions
      target/riscv: rvv-1.0: floating-point slide instructions
      target/riscv: rvv-1.0: narrowing fixed-point clip instructions
      target/riscv: rvv-1.0: single-width floating-point reduction
      target/riscv: rvv-1.0: widening floating-point reduction instructio=
ns
      target/riscv: rvv-1.0: single-width scaling shift instructions
      target/riscv: rvv-1.0: remove widening saturating scaled multiply-a=
dd
      target/riscv: rvv-1.0: remove vmford.vv and vmford.vf
      target/riscv: rvv-1.0: remove integer extract instruction
      target/riscv: rvv-1.0: floating-point min/max instructions
      target/riscv: introduce floating-point rounding mode enum
      target/riscv: rvv-1.0: floating-point/integer type-convert instruct=
ions
      target/riscv: rvv-1.0: widening floating-point/integer type-convert
      target/riscv: add "set round to odd" rounding mode helper function
      target/riscv: rvv-1.0: narrowing floating-point/integer type-conver=
t
      target/riscv: rvv-1.0: relax RV_VLEN_MAX to 1024-bits
      target/riscv: rvv-1.0: implement vstart CSR
      target/riscv: rvv-1.0: trigger illegal instruction exception if frm=
 is not valid
      target/riscv: rvv-1.0: floating-point reciprocal square-root estima=
te instruction
      target/riscv: rvv-1.0: floating-point reciprocal estimate instructi=
on
      target/riscv: rvv-1.0: rename r2_zimm to r2_zimm11
      target/riscv: rvv-1.0: add vsetivli instruction
      target/riscv: rvv-1.0: add evl parameter to vext_ldst_us()
      target/riscv: rvv-1.0: add vector unit-stride mask load/store insns
      target/riscv: rvv-1.0: rename vmandnot.mm and vmornot.mm to vmandn.=
mm and vmorn.mm
      target/riscv: rvv-1.0: update opivv_vadc_check() comment
      target/riscv: rvv-1.0: Add ELEN checks for widening and narrowing i=
nstructions

Greentime Hu (1):
      target/riscv: rvv-1.0: add vlenb register

Hsiangkai Wang (1):
      target/riscv: gdb: support vector registers for rv64 & rv32

Jessica Clarke (1):
      hw/riscv: Use load address rather than entry point for fw_dynamic n=
ext_addr

Khem Raj (1):
      riscv: Set 5.4 as minimum kernel version for riscv32

Kito Cheng (5):
      target/riscv: zfh: half-precision load and store
      target/riscv: zfh: half-precision computational
      target/riscv: zfh: half-precision convert and move
      target/riscv: zfh: half-precision floating-point compare
      target/riscv: zfh: half-precision floating-point classify

LIU Zhiwei (3):
      target/riscv: rvv-1.0: add mstatus VS field
      target/riscv: rvv-1.0: add sstatus VS field
      target/riscv: rvv-1.0: add vcsr register

Vineet Gupta (1):
      target/riscv: Enable bitmanip Zb[abcs] instructions

 linux-user/riscv/target_syscall.h         |    3 +-
 target/riscv/cpu.h                        |   63 +-
 target/riscv/cpu_bits.h                   |   10 +
 target/riscv/helper.h                     |  464 ++--
 target/riscv/internals.h                  |   40 +-
 target/riscv/insn32.decode                |  332 +--
 hw/riscv/boot.c                           |   13 +-
 target/riscv/cpu.c                        |   28 +-
 target/riscv/cpu_helper.c                 |   39 +-
 target/riscv/csr.c                        |   63 +-
 target/riscv/fpu_helper.c                 |  197 +-
 target/riscv/gdbstub.c                    |  184 ++
 target/riscv/translate.c                  |   93 +-
 target/riscv/vector_helper.c              | 3601 +++++++++++++++--------=
------
 target/riscv/insn_trans/trans_rvv.c.inc   | 2429 ++++++++++++-------
 target/riscv/insn_trans/trans_rvzfh.c.inc |  537 +++++
 16 files changed, 4997 insertions(+), 3099 deletions(-)
 create mode 100644 target/riscv/insn_trans/trans_rvzfh.c.inc


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5980B69005B
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 07:31:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ0SO-0007Yj-L9; Thu, 09 Feb 2023 01:30:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pQ0Ru-0007Wr-KX
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 01:30:26 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pQ0Rs-0000i5-2Q
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 01:30:26 -0500
Received: by mail-pf1-x430.google.com with SMTP id g9so684688pfo.5
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 22:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=njXVRjdqAIj6CTIIatbT4wsUa0mFlZOVyx7I42sf2f0=;
 b=InMuF6ezUcEV1MbiYueOp+huoPiP3qowsm+zerSIK7eHUowBQboKHUVGpzWMKpX0bK
 aSTz0/EWEl7r61eQY7H7ER0GWvJDKIMgHQN26rEakwqaYo8h3IsUe3av83SzUaK6yFOS
 kc1PvryhPMCVdyXMzC9/SMLZu6INLpW0Delu1dWW1cZMSXODZshUNbJldZNUAYqJiXyR
 xb5bmdI9PICoZIsbVC/aGIZLNFLgyeXhyk8BTaR/97DKa3s1qnaD+CmqbdGwXUekYUW7
 rRmIN6mB2ECZwj9BndgOz80KGj1nP+P1YMawRLiEB6KRfrV/Ur1gvHy9AYjxyOrrSMEh
 S0jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=njXVRjdqAIj6CTIIatbT4wsUa0mFlZOVyx7I42sf2f0=;
 b=ojo8AkuSrupuJbjKZxri2XXWj0Q8s2l+W2PzzBZJscok8qXAekIFB9xUrv237ntfK0
 5FllMpqmc7VQP6OtnPU8OSoEh6Yx3PwMEVyd6VgJwLWj1sFxuu1KzIvrPmM0kWFz/IsT
 P5KOt4TtanVB4rdwsa48+C+OkIcJp1UL+Ab8zjdaqYcx2D5EnjeBLLB7LcHQBYPguYW+
 ly1BW6FbwDJqbkUJ9cVYocGr/LeQtu70pp0zoMacig7PdEBKKhHqM6Wh/7sI8q3LG9wj
 NJ4PKcvsEl6hVNnirQiU/vjxBruwFnb4SaAOGBQvU/7Lie7b/u5WB1+QUagLvo5a4vsM
 Xsew==
X-Gm-Message-State: AO0yUKXoDW2Oy/oxzpQCk6epCJ2yfGkRrWG4mw0ECpc8286Aqvrdcaiq
 jtRUNe5uQH7Yy94kOBLMteeOXM69Y487BJrt
X-Google-Smtp-Source: AK7set/2CbznLWTVU/N/FqIijvflmytYMllg+HeUmHDCN+sGHm18H29TSsvWfuRh6R8xvARIlMJkRA==
X-Received: by 2002:a05:6a00:4092:b0:594:1f1c:3d2b with SMTP id
 bw18-20020a056a00409200b005941f1c3d2bmr4506973pfb.0.1675924221969; 
 Wed, 08 Feb 2023 22:30:21 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 u15-20020aa7848f000000b00593c434b1b8sm543649pfn.48.2023.02.08.22.30.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 22:30:21 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v1 RFC Zisslpcfi 0/9] zimops and zisslpcfi extension to riscv
Date: Wed,  8 Feb 2023 22:29:38 -0800
Message-Id: <20230209062947.3585481-1-debug@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=debug@rivosinc.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Still learning to use git send-mail. Hopefully this time cover-letter
also reaches everyone.

I am sending this patch series as RFC for an extension which helps
software enforce control-flow integrity (cfi) on riscv CPUs. Currently
spec is called zisslpcfi spec - https://github.com/riscv/riscv-cfi.
This literally means "unprivileged integer shadow stack & landing pad
based cfi".

Sending this as RFC because
- Even though I dont expect major change in zimops, it's still on the stove.
- zisslpcfi is tied up nicely still being worked on.
- I would like eyeballing on indirect branch tracking implementation.

zisslpcfi (CFI) extends ISA in following manner:

Forward cfi (indirect call/jmp)
- Landing pad instruction requirement for indirect call/jmp
  All indirect call and jump must land on landing pad instruction `lpcll`
  else CPU will raise illegal instruction exception. `lpcll` stands for
  land pad check lower label.

- Static label (25bit label) checking instructions for indirect call/jmp
  Extension provides mechanism using which a compiler generated label
  value can be set in a designated CSR at call site and it can be checked
  at the call target. If mismatch happens, CPU will raise illegal
  instruction exception. Compiler can generate hash based on function
  signature type. Extension provide mechanisms using which label value
  is part of the instruction itself as immediate and thus has static
  immutable property.

Backward cfi (returns)
- Shadow stack (SS) for function returns
  Extension provides sspush x1/x5, sspop x1/x5 and sschkra instructions.
  sspush will push on shadow stack while sspop will pop from shadow stack
  sschkra will succeed only when x1 == x5 is true else it will raise
  illegal instruction exception. Shadow stacks introduces new virtual
  memory type and thus new PTE encodings. Existing reserved encoding of
  R=0,W=1,X=0 is now shadow stack PTE encoding (only if backward cfi is
  enabled for current mode). New virtual memory type allows CPU to
  distinguish so that stores coming from sspush or ssamoswap can succeed
  while regular stores raise access violations.

opcodes:
zisslpcfi opcodes are carved out of new opcode encodings. These opcodes
encodings were reserved until now. A new extension called zimops make
these opcodes into "may be operations". zimops stands for unprivileged
may be operations (mops) and if implemented default behavior is to mov 0
to rd. zisslpcfi extension changes executable in a way where it should be
able to run on riscv cpu which implements cfi extension as well as riscv
cpu which doesn't implement cfi extension. As long as zimops is
implemented, all such instructions will not fault and simply move 0 to rd.
A hart implementing cfi must implement zimops. Any future extension can
re-purpose zimops to change behavior and claim them while also not
breaking binary/executable compatiblity . zisslpcfi is first such
extension to modify zimops behavior.

Instructions:
zisslpcfi defines following instructions.

Backward control flow
*********************

sspush x1/x5:
Decrement shadow stack pointer and pushes x1 or x5 on shadow stack.

sspop x1/x5:
Pops from shadow stack into x1 or x5. Increments shadow stack pointer.

ssprr:
Reads current shadow stack pointer into a destination register.

sschckra:
Compares x1 with x5. Raises illegal instr exception if x1 != x5.

ssamoswap:
Atomically swaps value on top of shadow stack.


Forward control flow
********************
Forward control flow extends architecture to allow software to set labels
(25bits of label) at call/jmp site and check labels at target. Extension
gives instructions to set label as part of immediate in instruction itself
. Since immediate is limited in terms of bit length, labels are set and
checked in ladder fashion of 9, 8 and 8 bits.

lpsll, lpsml, lpsul:
sets lower (9bit), mid (8bit) and upper (8bit) label values in CSR_LPLR
respectively.

lpcll, lpcml, lpcul:
checks lower (9bit), mid (8bit) and upper (8bit) label values with
CSR_LPLR respectively. Check label instructions raise illegal instruction
fault when labels mismatch. `lpcll` has dual purpose; it acts as landing
pad instruction as well label checking for lower 9 bits.

More on shadow stack
********************
Shadow stacks have new encodings (R=0,W=1,X=0) in first level page tables
to ensure they can be writeable only via special shadow stack management
instructions and regular stores are disallowed. Regular stores on shadow
stack memory raise AMO/store access fault. Shadow stack load (sspop) on
non-shadow stack memory raise load access fault. Shadow stack store
(sspush) on non-shadow stack memory raise store access fault.

To provide each mode their own shadow stack translations, this
implementation flushes shadow stack translations on privilege change and
thus each mode keep their own translation as long as mode doesn't change.
Shadow stack accesses need to coexist with normal accesses, but have
different permission checks. Since hypervisor access instructions and
shadow stack accesses are mutually exclusive (both use dedicated
instructions), they don't need independent bits in the MMU index assignments.

Tests and other bits
********************
For convenience this patch is based on below qemu branch
https://github.com/deepak0414/qemu/tree/scfi_menvcfg_gh_Zisslpcfi-0.1

I've been able to boot linux kernel using this implementation and run
test apps. Kernel branch I am using is below
https://github.com/deepak0414/linux-riscv-cfi/tree/Zisslpcfi-0.4_v6.1-rc2

In order to perform unit-tests, I've been using riscv-test and created
unit tests to test implementation. riscv-tests branch URL is below
https://github.com/deepak0414/riscv-tests/tree/cfi_tests

Deepak Gupta (9):
  target/riscv: adding zimops and zisslpcfi extension to RISCV cpu
    config
  target/riscv: zisslpcfi CSR, bit positions and other definitions
  target/riscv: implements CSRs and new bits in existing CSRs in
    zisslpcfi
  target/riscv: helper functions for forward and backward cfi
  target/riscv: state save and restore of zisslppcfi state
  target/riscv: MMU changes for back cfi's shadow stack
  target/riscv: Tracking indirect branches (fcfi) using TCG
  target/riscv: Instructions encodings, implementation and handlers
  target/riscv: diassembly support for zisslpcfi instructions

 disas/riscv.c                                 | 127 ++++++-
 target/riscv/cpu-param.h                      |   1 +
 target/riscv/cpu.c                            |  15 +
 target/riscv/cpu.h                            |  15 +
 target/riscv/cpu_bits.h                       |  40 +++
 target/riscv/cpu_helper.c                     | 196 +++++++++--
 target/riscv/csr.c                            | 137 +++++++-
 target/riscv/helper.h                         |   7 +
 target/riscv/insn32.decode                    |  29 ++
 target/riscv/insn_trans/trans_rvi.c.inc       |  14 +
 target/riscv/insn_trans/trans_zimops.c.inc    |  53 +++
 target/riscv/insn_trans/trans_zisslpcfi.c.inc | 310 ++++++++++++++++++
 target/riscv/op_helper.c                      |  79 +++++
 target/riscv/pmp.c                            |   9 +
 target/riscv/pmp.h                            |   3 +-
 target/riscv/translate.c                      |  54 +++
 16 files changed, 1067 insertions(+), 22 deletions(-)
 create mode 100644 target/riscv/insn_trans/trans_zimops.c.inc
 create mode 100644 target/riscv/insn_trans/trans_zisslpcfi.c.inc

-- 
2.25.1



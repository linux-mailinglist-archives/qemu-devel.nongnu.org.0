Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 222C02ACE76
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 05:15:01 +0100 (CET)
Received: from localhost ([::1]:44744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcL3c-0003Nc-5J
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 23:15:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kcL2B-0001nn-7Y; Mon, 09 Nov 2020 23:13:31 -0500
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144]:44836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kcL28-0001x9-P7; Mon, 09 Nov 2020 23:13:30 -0500
Received: by mail-il1-x144.google.com with SMTP id z2so10518514ilh.11;
 Mon, 09 Nov 2020 20:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wtPuYAi1xCJZQd/OOZeThn29PSsn3d9y0pa0XZLVOhg=;
 b=QsUiFxnwdHi7SIat+HLe55DTgU96Un8V7cbo7y/ZNOVDZphKiYKFvJ/z6BRo6g/uBK
 BlcUOicE2sA4JSShLhzCweFLMwPtftuhiZiJEqzO3OyftD0b0lcYQcz3XsBI47akz6OD
 68dOQ7SZgsxZMIDmGqewDwceB2a2QERwbQfRmSgGoNTMY+yG8VsjSoYuaujw4nWlJwBp
 qBp0VFH6lfsr/zZ5sabF0ixJ3/n975ypUygAlqoY/81RR7Ok0aPy0YUie/ikY2Q7WFte
 lqKz+f++IWfcQ1OTv+CxSuzg+jGjCMvP2d8yiacxv+lJEqU3jUalTUFYZlrP6BXnaG6i
 Rgqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wtPuYAi1xCJZQd/OOZeThn29PSsn3d9y0pa0XZLVOhg=;
 b=Y6cKtkQXixf2+mOCpaUuvOZEn9b7Gno3WWKXKRPVmMkKIGEzZEyCe39knVNLUJdEWO
 1vSDw4DLY+W6SzKG6ATQXxbd9WYXSP4trvBEm7o2mLrEsTfSlkMCDyKLJ0HrTzpdRJpt
 M3QS6lI48QheNDVdWB1X42SdMlE4MLgc9TCLfsN4v2qBNq+6mWbA1Vt18S1FfDAOaB1A
 OKFFfoxr8+o/WUxR6fyYc2cWjG1A13c7HKgn0k0jIZy9In3p8CN9ZwIeNP9ZkP+CWJ5m
 E/hL9OnI4a3uFJhmxMpkDMINo/UbVsDunlwi9+6226jLKdkjVaIJMaNJSMlAmpgmKjhW
 z4rg==
X-Gm-Message-State: AOAM5321J7ZWhsY0qT8oYcW64TwMa2oVpnwW6Q4/YN3YihEe75HnQ7Mg
 ht22oJmmw3HJJFkmn7qsHY6VMydRpsm3IGUgO7TOUZ89zjc=
X-Google-Smtp-Source: ABdhPJz0mbWP3jDe1HCf/QtKNk2k1bj4LsFoiIEt4EcTANd+TkJpzWNjVtlAJa5HVM1gUuJkt2ZDt/utnPkjwQTKy2M=
X-Received: by 2002:a92:d991:: with SMTP id r17mr13738147iln.227.1604981607300; 
 Mon, 09 Nov 2020 20:13:27 -0800 (PST)
MIME-Version: 1.0
References: <20200929190448.31116-1-frank.chang@sifive.com>
 <CAE_xrPgMu=o5ArbRW1t-YFnZMDo0zGmwvPARB-HtpXHiLqvawQ@mail.gmail.com>
 <CAE_xrPjOSpsgPBALLmPjJDN1F+6SfDE_fZgkkASivV7X32dSTA@mail.gmail.com>
In-Reply-To: <CAE_xrPjOSpsgPBALLmPjJDN1F+6SfDE_fZgkkASivV7X32dSTA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 9 Nov 2020 20:01:26 -0800
Message-ID: <CAKmqyKNu+KajwcPUxPDQSYqAUFGZtuscxek6kM0ys=N0ZcQWyg@mail.gmail.com>
Subject: Re: [RFC v5 00/68] support vector extension v1.0
To: Frank Chang <frank.chang@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::144;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x144.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 9, 2020 at 6:09 PM Frank Chang <frank.chang@sifive.com> wrote:
>
> ping 2nd~

I mentioned earlier that I will wait until this becomes a patch series
to review it. Overall it looks like it's on the right track though.

Alistair

>
> On Tue, Oct 20, 2020 at 3:42 PM Frank Chang <frank.chang@sifive.com> wrote:
>>
>> On Wed, Sep 30, 2020 at 3:04 AM <frank.chang@sifive.com> wrote:
>>>
>>> From: Frank Chang <frank.chang@sifive.com>
>>>
>>> This patchset implements the vector extension v1.0 for RISC-V on QEMU.
>>>
>>> This patchset is sent as RFC because RVV v1.0 is still in draft state.
>>> v2 patchset was sent for RVV v0.9 and bumped to RVV v1.0 since v3 patchset.
>>>
>>> The port is available here:
>>> https://github.com/sifive/qemu/tree/rvv-1.0-upstream-v5
>>>
>>> You can change the cpu argument: vext_spec to v1.0 (i.e. vext_spec=v1.0)
>>> to run with RVV v1.0 instructions.
>>>
>>> Note: This patchset depends on two other patchsets listed in Based-on
>>>       section below so it might not able to be built unless those two
>>>       patchsets are applied.
>>>
>>> Changelog:
>>>
>>> v5
>>>   * refactor RVV v1.0 check functions.
>>>     (Thanks to Richard Henderson's bitwise tricks.)
>>>   * relax RV_VLEN_MAX to 1024-bits.
>>>   * implement vstart CSR's behaviors.
>>>   * trigger illegal instruction exception if frm is not valid for
>>>     vector floating-point instructions.
>>>   * rebase on riscv-to-apply.next.
>>>
>>> v4
>>>   * remove explicit float flmul variable in DisasContext.
>>>   * replace floating-point calculations with shift operations to
>>>     improve performance.
>>>   * relax RV_VLEN_MAX to 512-bits.
>>>
>>> v3
>>>   * apply nan-box helpers from Richard Henderson.
>>>   * remove fp16 api changes as they are sent independently in another
>>>     pathcset by Chih-Min Chao.
>>>   * remove all tail elements clear functions as tail elements can
>>>     retain unchanged for either VTA set to undisturbed or agnostic.
>>>   * add fp16 nan-box check generator function.
>>>   * add floating-point rounding mode enum.
>>>   * replace flmul arithmetic with shifts to avoid floating-point
>>>     conversions.
>>>   * add Zvqmac extension.
>>>   * replace gdbstub vector register xml files with dynamic generator.
>>>   * bumped to RVV v1.0.
>>>   * RVV v1.0 related changes:
>>>     * add vl<nf>re<eew>.v and vs<nf>r.v vector whole register
>>>       load/store instructions
>>>     * add vrgatherei16 instruction.
>>>     * rearranged bits in vtype to make vlmul bits into a contiguous
>>>       field.
>>>
>>> v2
>>>   * drop v0.7.1 support.
>>>   * replace invisible return check macros with functions.
>>>   * move mark_vs_dirty() to translators.
>>>   * add SSTATUS_VS flag for s-mode.
>>>   * nan-box scalar fp register for floating-point operations.
>>>   * add gdbstub files for vector registers to allow system-mode
>>>     debugging with GDB.
>>>
>>> Based-on: <20200909001647.532249-1-richard.henderson@linaro.org/>
>>> Based-on: <1596102747-20226-1-git-send-email-chihmin.chao@sifive.com/>
>>>
>>> Frank Chang (62):
>>>   target/riscv: drop vector 0.7.1 and add 1.0 support
>>>   target/riscv: Use FIELD_EX32() to extract wd field
>>>   target/riscv: rvv-1.0: introduce writable misa.v field
>>>   target/riscv: rvv-1.0: add translation-time vector context status
>>>   target/riscv: rvv-1.0: remove rvv related codes from fcsr registers
>>>   target/riscv: rvv-1.0: check MSTATUS_VS when accessing vector csr
>>>     registers
>>>   target/riscv: rvv-1.0: remove MLEN calculations
>>>   target/riscv: rvv-1.0: add fractional LMUL
>>>   target/riscv: rvv-1.0: add VMA and VTA
>>>   target/riscv: rvv-1.0: update check functions
>>>   target/riscv: introduce more imm value modes in translator functions
>>>   target/riscv: rvv:1.0: add translation-time nan-box helper function
>>>   target/riscv: rvv-1.0: configure instructions
>>>   target/riscv: rvv-1.0: stride load and store instructions
>>>   target/riscv: rvv-1.0: index load and store instructions
>>>   target/riscv: rvv-1.0: fix address index overflow bug of indexed
>>>     load/store insns
>>>   target/riscv: rvv-1.0: fault-only-first unit stride load
>>>   target/riscv: rvv-1.0: amo operations
>>>   target/riscv: rvv-1.0: load/store whole register instructions
>>>   target/riscv: rvv-1.0: update vext_max_elems() for load/store insns
>>>   target/riscv: rvv-1.0: take fractional LMUL into vector max elements
>>>     calculation
>>>   target/riscv: rvv-1.0: floating-point square-root instruction
>>>   target/riscv: rvv-1.0: floating-point classify instructions
>>>   target/riscv: rvv-1.0: mask population count instruction
>>>   target/riscv: rvv-1.0: find-first-set mask bit instruction
>>>   target/riscv: rvv-1.0: set-X-first mask bit instructions
>>>   target/riscv: rvv-1.0: iota instruction
>>>   target/riscv: rvv-1.0: element index instruction
>>>   target/riscv: rvv-1.0: allow load element with sign-extended
>>>   target/riscv: rvv-1.0: register gather instructions
>>>   target/riscv: rvv-1.0: integer scalar move instructions
>>>   target/riscv: rvv-1.0: floating-point move instruction
>>>   target/riscv: rvv-1.0: floating-point scalar move instructions
>>>   target/riscv: rvv-1.0: whole register move instructions
>>>   target/riscv: rvv-1.0: integer extension instructions
>>>   target/riscv: rvv-1.0: single-width averaging add and subtract
>>>     instructions
>>>   target/riscv: rvv-1.0: single-width bit shift instructions
>>>   target/riscv: rvv-1.0: integer add-with-carry/subtract-with-borrow
>>>   target/riscv: rvv-1.0: narrowing integer right shift instructions
>>>   target/riscv: rvv-1.0: widening integer multiply-add instructions
>>>   target/riscv: rvv-1.0: single-width saturating add and subtract
>>>     instructions
>>>   target/riscv: rvv-1.0: integer comparison instructions
>>>   target/riscv: rvv-1.0: floating-point compare instructions
>>>   target/riscv: rvv-1.0: mask-register logical instructions
>>>   target/riscv: rvv-1.0: slide instructions
>>>   target/riscv: rvv-1.0: floating-point slide instructions
>>>   target/riscv: rvv-1.0: narrowing fixed-point clip instructions
>>>   target/riscv: rvv-1.0: single-width floating-point reduction
>>>   target/riscv: rvv-1.0: widening floating-point reduction instructions
>>>   target/riscv: rvv-1.0: single-width scaling shift instructions
>>>   target/riscv: rvv-1.0: remove widening saturating scaled multiply-add
>>>   target/riscv: rvv-1.0: remove vmford.vv and vmford.vf
>>>   target/riscv: rvv-1.0: remove integer extract instruction
>>>   target/riscv: rvv-1.0: floating-point min/max instructions
>>>   target/riscv: introduce floating-point rounding mode enum
>>>   target/riscv: rvv-1.0: floating-point/integer type-convert
>>>     instructions
>>>   target/riscv: rvv-1.0: widening floating-point/integer type-convert
>>>   target/riscv: add "set round to odd" rounding mode helper function
>>>   target/riscv: rvv-1.0: narrowing floating-point/integer type-convert
>>>   target/riscv: rvv-1.0: relax RV_VLEN_MAX to 1024-bits
>>>   target/riscv: implement vstart CSR
>>>   target/riscv: trigger illegal instruction exception if frm is not
>>>     valid
>>>
>>> Greentime Hu (1):
>>>   target/riscv: rvv-1.0: add vlenb register
>>>
>>> Hsiangkai Wang (2):
>>>   target/riscv: gdb: modify gdb csr xml file to align with csr register
>>>     map
>>>   target/riscv: gdb: support vector registers for rv64 & rv32
>>>
>>> LIU Zhiwei (3):
>>>   target/riscv: rvv-1.0: add mstatus VS field
>>>   target/riscv: rvv-1.0: add sstatus VS field
>>>   target/riscv: rvv-1.0: add vcsr register
>>>
>>>  gdb-xml/riscv-32bit-csr.xml             |   18 +-
>>>  gdb-xml/riscv-64bit-csr.xml             |   18 +-
>>>  target/riscv/cpu.c                      |   11 +-
>>>  target/riscv/cpu.h                      |   95 +-
>>>  target/riscv/cpu_bits.h                 |   10 +
>>>  target/riscv/cpu_helper.c               |   16 +-
>>>  target/riscv/csr.c                      |   79 +-
>>>  target/riscv/fpu_helper.c               |   17 +-
>>>  target/riscv/gdbstub.c                  |  172 +-
>>>  target/riscv/helper.h                   |  495 ++--
>>>  target/riscv/insn32-64.decode           |   18 +-
>>>  target/riscv/insn32.decode              |  288 +-
>>>  target/riscv/insn_trans/trans_rvv.c.inc | 2430 +++++++++++------
>>>  target/riscv/internals.h                |   22 +-
>>>  target/riscv/translate.c                |   72 +-
>>>  target/riscv/vector_helper.c            | 3316 +++++++++++------------
>>>  16 files changed, 4118 insertions(+), 2959 deletions(-)
>>>
>>> --
>>> 2.17.1
>>>
>>
>> ping~


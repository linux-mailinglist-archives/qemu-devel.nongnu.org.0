Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C33847B516
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 22:22:18 +0100 (CET)
Received: from localhost ([::1]:47460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzQ6q-00016x-R6
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 16:22:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzQ43-0006bB-UC
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:19:23 -0500
Received: from [2607:f8b0:4864:20::102a] (port=38411
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzQ41-0007SJ-Oy
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:19:23 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 n15-20020a17090a394f00b001b0f6d6468eso408057pjf.3
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 13:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=O05leoknvpdtaHNL9o/rQ/eok01xxXe3B7HmEEIjS1c=;
 b=oKuKoeihfORcQf9lC4EgLifYnJb8jYnaHgX3IKKhDzuFOQ7Hs8CMv4zA+8fQX2fZWf
 GgKkjA4Z4OgoIJJE5T2ncxD7eUBUMoZJpz2gt+8AubOLJCGxbva0WSTeuVp73SY+J1zP
 tOMlE0E2xdt5rZEMMqZC/f0X9tRvWo5seEuBCUWqbUDKWBzetDf8BvexSUM6neLx3sUj
 yhJvJqKREbA/UNl3nIrL2k2/b7Th1KVBTT1qvMPgY753EiuXMlXyonn1CRtW11Db8VbK
 Qp6KKOc/eK/rFsX+f4/DH7QP5DRJntIHhGmvnew8TQF1w2HxdwXgctLRmh6iBV3eZJAI
 Mvlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O05leoknvpdtaHNL9o/rQ/eok01xxXe3B7HmEEIjS1c=;
 b=cP0kdPVrXGgTcu+cZumvyiDlfNSu4b1mZWgB7/PPykFjYn2mRwWMc3AElk5MYvVVYI
 vNOfKB2OehYcoHSqO8mvq6NdwfqCcSW2vcA5uEBytW3V54E5zNWHcyI4zdxchdUqwwiu
 VGdzW/Dv8OSK9OGioi4HOsahmfV+9CCTWqUTFf6LouJXuOImSsZXjdxIJmK5zJIdITZs
 Qb/3TMk/dOk8pFmTW3c+ObUc3UB7LncPut+GFrgiji0HxlE+xSUhr60FWC+SOIcRz9R+
 Uh4LOswg2l5SEsuepxeQw3gfYN/374mvTtbtuKn0+5dFadwZpR14ldQL7LF+URekA2lK
 F7Ow==
X-Gm-Message-State: AOAM5313vjclx5CANXXF8klujb/1Zat8MM2AxjCknJ8+xmW2bRSzwrdZ
 U6MUSUbqA8QuMn8EAznzzcSuoA==
X-Google-Smtp-Source: ABdhPJzFrNGhZyO5QZ6nCpsOFcDQ1d7XkBMY9/0KDW8a7N4JrqXM8uc45sYSCteebXz3R11OVDEzOQ==
X-Received: by 2002:a17:90b:903:: with SMTP id bo3mr69360pjb.11.1640035160389; 
 Mon, 20 Dec 2021 13:19:20 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id f8sm3538420pga.69.2021.12.20.13.19.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 13:19:19 -0800 (PST)
Subject: Re: [PULL 00/88] riscv-to-apply queue
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org
References: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cb118f86-7b9e-1279-7ff2-c5e396357810@linaro.org>
Date: Mon, 20 Dec 2021 13:19:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.608,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/19/21 8:55 PM, Alistair Francis wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
> 
> The following changes since commit 212a33d3b0c65ae2583bb1d06cb140cd0890894c:
> 
>    Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2021-12-19 16:36:10 -0800)
> 
> are available in the Git repository at:
> 
>    git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20211220-1
> 
> for you to fetch changes up to 7e322a7f23a60b0e181b55ef722fdf390ec4e463:
> 
>    hw/riscv: Use load address rather than entry point for fw_dynamic next_addr (2021-12-20 14:53:31 +1000)
> 
> ----------------------------------------------------------------
> First RISC-V PR for QEMU 7.0
> 
>   - Add support for ratified 1.0 Vector extension
>   - Drop support for draft 0.7.1 Vector extension
>   - Support Zfhmin and Zfh extensions
>   - Improve kernel loading for non-Linux platforms
> 
> ----------------------------------------------------------------
> Frank Chang (75):
>        target/riscv: zfh: add Zfh cpu property
>        target/riscv: zfh: implement zfhmin extension
>        target/riscv: zfh: add Zfhmin cpu property
>        target/riscv: drop vector 0.7.1 and add 1.0 support
>        target/riscv: Use FIELD_EX32() to extract wd field
>        target/riscv: rvv-1.0: set mstatus.SD bit if mstatus.VS is dirty
>        target/riscv: rvv-1.0: introduce writable misa.v field
>        target/riscv: rvv-1.0: add translation-time vector context status
>        target/riscv: rvv-1.0: remove rvv related codes from fcsr registers
>        target/riscv: rvv-1.0: check MSTATUS_VS when accessing vector csr registers
>        target/riscv: rvv-1.0: remove MLEN calculations
>        target/riscv: rvv-1.0: add fractional LMUL
>        target/riscv: rvv-1.0: add VMA and VTA
>        target/riscv: rvv-1.0: update check functions
>        target/riscv: introduce more imm value modes in translator functions
>        target/riscv: rvv:1.0: add translation-time nan-box helper function
>        target/riscv: rvv-1.0: remove amo operations instructions
>        target/riscv: rvv-1.0: configure instructions
>        target/riscv: rvv-1.0: stride load and store instructions
>        target/riscv: rvv-1.0: index load and store instructions
>        target/riscv: rvv-1.0: fix address index overflow bug of indexed load/store insns
>        target/riscv: rvv-1.0: fault-only-first unit stride load
>        target/riscv: rvv-1.0: load/store whole register instructions
>        target/riscv: rvv-1.0: update vext_max_elems() for load/store insns
>        target/riscv: rvv-1.0: take fractional LMUL into vector max elements calculation
>        target/riscv: rvv-1.0: floating-point square-root instruction
>        target/riscv: rvv-1.0: floating-point classify instructions
>        target/riscv: rvv-1.0: count population in mask instruction
>        target/riscv: rvv-1.0: find-first-set mask bit instruction
>        target/riscv: rvv-1.0: set-X-first mask bit instructions
>        target/riscv: rvv-1.0: iota instruction
>        target/riscv: rvv-1.0: element index instruction
>        target/riscv: rvv-1.0: allow load element with sign-extended
>        target/riscv: rvv-1.0: register gather instructions
>        target/riscv: rvv-1.0: integer scalar move instructions
>        target/riscv: rvv-1.0: floating-point move instruction
>        target/riscv: rvv-1.0: floating-point scalar move instructions
>        target/riscv: rvv-1.0: whole register move instructions
>        target/riscv: rvv-1.0: integer extension instructions
>        target/riscv: rvv-1.0: single-width averaging add and subtract instructions
>        target/riscv: rvv-1.0: single-width bit shift instructions
>        target/riscv: rvv-1.0: integer add-with-carry/subtract-with-borrow
>        target/riscv: rvv-1.0: narrowing integer right shift instructions
>        target/riscv: rvv-1.0: widening integer multiply-add instructions
>        target/riscv: rvv-1.0: single-width saturating add and subtract instructions
>        target/riscv: rvv-1.0: integer comparison instructions
>        target/riscv: rvv-1.0: floating-point compare instructions
>        target/riscv: rvv-1.0: mask-register logical instructions
>        target/riscv: rvv-1.0: slide instructions
>        target/riscv: rvv-1.0: floating-point slide instructions
>        target/riscv: rvv-1.0: narrowing fixed-point clip instructions
>        target/riscv: rvv-1.0: single-width floating-point reduction
>        target/riscv: rvv-1.0: widening floating-point reduction instructions
>        target/riscv: rvv-1.0: single-width scaling shift instructions
>        target/riscv: rvv-1.0: remove widening saturating scaled multiply-add
>        target/riscv: rvv-1.0: remove vmford.vv and vmford.vf
>        target/riscv: rvv-1.0: remove integer extract instruction
>        target/riscv: rvv-1.0: floating-point min/max instructions
>        target/riscv: introduce floating-point rounding mode enum
>        target/riscv: rvv-1.0: floating-point/integer type-convert instructions
>        target/riscv: rvv-1.0: widening floating-point/integer type-convert
>        target/riscv: add "set round to odd" rounding mode helper function
>        target/riscv: rvv-1.0: narrowing floating-point/integer type-convert
>        target/riscv: rvv-1.0: relax RV_VLEN_MAX to 1024-bits
>        target/riscv: rvv-1.0: implement vstart CSR
>        target/riscv: rvv-1.0: trigger illegal instruction exception if frm is not valid
>        target/riscv: rvv-1.0: floating-point reciprocal square-root estimate instruction
>        target/riscv: rvv-1.0: floating-point reciprocal estimate instruction
>        target/riscv: rvv-1.0: rename r2_zimm to r2_zimm11
>        target/riscv: rvv-1.0: add vsetivli instruction
>        target/riscv: rvv-1.0: add evl parameter to vext_ldst_us()
>        target/riscv: rvv-1.0: add vector unit-stride mask load/store insns
>        target/riscv: rvv-1.0: rename vmandnot.mm and vmornot.mm to vmandn.mm and vmorn.mm
>        target/riscv: rvv-1.0: update opivv_vadc_check() comment
>        target/riscv: rvv-1.0: Add ELEN checks for widening and narrowing instructions
> 
> Greentime Hu (1):
>        target/riscv: rvv-1.0: add vlenb register
> 
> Hsiangkai Wang (1):
>        target/riscv: gdb: support vector registers for rv64 & rv32
> 
> Jessica Clarke (1):
>        hw/riscv: Use load address rather than entry point for fw_dynamic next_addr
> 
> Khem Raj (1):
>        riscv: Set 5.4 as minimum kernel version for riscv32
> 
> Kito Cheng (5):
>        target/riscv: zfh: half-precision load and store
>        target/riscv: zfh: half-precision computational
>        target/riscv: zfh: half-precision convert and move
>        target/riscv: zfh: half-precision floating-point compare
>        target/riscv: zfh: half-precision floating-point classify
> 
> LIU Zhiwei (3):
>        target/riscv: rvv-1.0: add mstatus VS field
>        target/riscv: rvv-1.0: add sstatus VS field
>        target/riscv: rvv-1.0: add vcsr register
> 
> Vineet Gupta (1):
>        target/riscv: Enable bitmanip Zb[abcs] instructions
> 
>   linux-user/riscv/target_syscall.h         |    3 +-
>   target/riscv/cpu.h                        |   63 +-
>   target/riscv/cpu_bits.h                   |   10 +
>   target/riscv/helper.h                     |  464 ++--
>   target/riscv/internals.h                  |   40 +-
>   target/riscv/insn32.decode                |  332 +--
>   hw/riscv/boot.c                           |   13 +-
>   target/riscv/cpu.c                        |   28 +-
>   target/riscv/cpu_helper.c                 |   39 +-
>   target/riscv/csr.c                        |   63 +-
>   target/riscv/fpu_helper.c                 |  197 +-
>   target/riscv/gdbstub.c                    |  184 ++
>   target/riscv/translate.c                  |   93 +-
>   target/riscv/vector_helper.c              | 3601 +++++++++++++++--------------
>   target/riscv/insn_trans/trans_rvv.c.inc   | 2429 ++++++++++++-------
>   target/riscv/insn_trans/trans_rvzfh.c.inc |  537 +++++
>   16 files changed, 4997 insertions(+), 3099 deletions(-)
>   create mode 100644 target/riscv/insn_trans/trans_rvzfh.c.inc

Applied, thanks.

r~


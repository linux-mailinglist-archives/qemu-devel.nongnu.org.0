Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DF65BD6EB
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 00:11:29 +0200 (CEST)
Received: from localhost ([::1]:34094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaOzA-0000E4-1a
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 18:11:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oaOwW-00077w-8e; Mon, 19 Sep 2022 18:08:44 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:42542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oaOwU-00082r-8I; Mon, 19 Sep 2022 18:08:44 -0400
Received: by mail-pg1-x535.google.com with SMTP id t190so626304pgd.9;
 Mon, 19 Sep 2022 15:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=pP6HKM0RiV4ogCZwVhZ/LIRsuuWvxoplmOtdGW3YJOo=;
 b=Z6MbI3IYzNTvMxmjvpOWYAihgRqDUGy9ag6S23Zd8vonuEfEkrCTTJt9F6XbgLWvCj
 U4QcydVKVYGjqx0i7zITOErf5g7YOa06eshjTKwl4GxzOoly+XPdQnZVufdnXpS/tvFD
 e61BxvxJpe4etEG+BRdT9iOMM/oSELZ05hyovB6pvMHD/HgwOCyLeH6zeQtpWbcWNYcM
 uT1//RNUkh5bdA56dCcUMvoQT4DjEc9d1504eor/pywX4NTd1QB969UUCgudzOPpMKcm
 /YNFrdM/8CFFDH70LwjsKosUlga00wxcYiQLlb4KZl7v6Rke4kkCJtm+0eg7GXl5Fo21
 L/Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=pP6HKM0RiV4ogCZwVhZ/LIRsuuWvxoplmOtdGW3YJOo=;
 b=C6FWuHVBOa/+VPa+mpauftk8nmzxRedJwYHzwKW1FJLuJQr0INKw+7lSE+oTRzFUfV
 gdtW+gsTRsSBtDvCuM3UTXuM6VXSQfyHCZxRwX0VIVUjRmNoS6KVg51j18aEoDuLBia7
 8yFmQDTpGt79Y+l0DegdjlU+0BOu+Nkj8XwAuN6ZXbqnwAeFMH2NqASEt9BmhnuUvsYt
 Gizr9rz73ZMpa9QX9YwDZQf3q7VxDoNDK6r0kySQzuvKLCr9ld2/8JEyihvTDZgsqUtZ
 wp63StrqIpkTqahWIVrjzaA0azrCtKVBAEwVXc/IUU6eCxUCaC+NNu/ZOIqxugH0rHxD
 sw7g==
X-Gm-Message-State: ACrzQf1PWGfDajod4FSSk7CzHCL1ifkVdBGw5jIwZBneevsvRBCmQNef
 xnn3rn43YfioRpr7/oVS+riBA6UfP8hDdQIbjZI=
X-Google-Smtp-Source: AMsMyM4Quz9oq9Pa02eDAzHIsJBHaJnU0sWJri7jzPPngweMjJiDPSZBwFPAUU48Jh+mCvAV5auNtloLy9iBvumSqFY=
X-Received: by 2002:a05:6a00:1496:b0:546:2856:6cf5 with SMTP id
 v22-20020a056a00149600b0054628566cf5mr19863596pfu.31.1663625319732; Mon, 19
 Sep 2022 15:08:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220824221701.41932-1-atishp@rivosinc.com>
In-Reply-To: <20220824221701.41932-1-atishp@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 20 Sep 2022 08:08:12 +1000
Message-ID: <CAKmqyKN+M9HYLo0oQ3zD5hvGX5KCLEK5y0D9Roh3qfpsBFsNdw@mail.gmail.com>
Subject: Re: [PATCH v14 0/5] Improve PMU support
To: Atish Patra <atishp@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x535.google.com
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

On Thu, Aug 25, 2022 at 8:22 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> The latest version of the SBI specification includes a Performance Monito=
ring
> Unit(PMU) extension[1] which allows the supervisor to start/stop/configur=
e
> various PMU events. The Sscofpmf ('Ss' for Privileged arch and Supervisor=
-level
> extensions, and 'cofpmf' for Count OverFlow and Privilege Mode Filtering)
> extension[2] allows the perf like tool to handle overflow interrupts and
> filtering support.
>
> This series implements remaining PMU infrastructure to support
> PMU in virt machine. The first seven patches from the original series
> have been merged already.
>
> This will allow us to add any PMU events in future.
> Currently, this series enables the following omu events.
> 1. cycle count
> 2. instruction count
> 3. DTLB load/store miss
> 4. ITLB prefetch miss
>
> The first two are computed using host ticks while last three are counted =
during
> cpu_tlb_fill. We can do both sampling and count from guest userspace.
> This series has been tested on both RV64 and RV32. Both Linux[3] and Open=
sbi[4]
> patches are required to get the perf working.
>
> Here is an output of perf stat/report while running hackbench with latest
> OpenSBI & Linux kernel.
>
> Perf stat:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [root@fedora-riscv ~]# perf stat -e cycles -e instructions -e dTLB-load-m=
isses -e dTLB-store-misses -e iTLB-load-misses \
> > perf bench sched messaging -g 1 -l 10
> # Running 'sched/messaging' benchmark:
> # 20 sender and receiver processes per group
> # 1 groups =3D=3D 40 processes run
>
>      Total time: 0.265 [sec]
>
>  Performance counter stats for 'perf bench sched messaging -g 1 -l 10':
>
>      4,167,825,362      cycles
>      4,166,609,256      instructions              #    1.00  insn per cyc=
le
>          3,092,026      dTLB-load-misses
>            258,280      dTLB-store-misses
>          2,068,966      iTLB-load-misses
>
>        0.585791767 seconds time elapsed
>
>        0.373802000 seconds user
>        1.042359000 seconds sys
>
> Perf record:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [root@fedora-riscv ~]# perf record -e cycles -e instructions \
> > -e dTLB-load-misses -e dTLB-store-misses -e iTLB-load-misses -c 10000 \
> > perf bench sched messaging -g 1 -l 10
> # Running 'sched/messaging' benchmark:
> # 20 sender and receiver processes per group
> # 1 groups =3D=3D 40 processes run
>
>      Total time: 1.397 [sec]
> [ perf record: Woken up 10 times to write data ]
> Check IO/CPU overload!
> [ perf record: Captured and wrote 8.211 MB perf.data (214486 samples) ]
>
> [root@fedora-riscv riscv]# perf report
> Available samples
> 107K cycles                                                              =
      =E2=97=86
> 107K instructions                                                        =
      =E2=96=92
> 250 dTLB-load-misses                                                     =
      =E2=96=92
> 13 dTLB-store-misses                                                     =
      =E2=96=92
> 172 iTLB-load-misses
> ..
>
> Changes from v13->v14:
> 1. Added sanity check for the hashtable in pmu.c
>
> Changes from v12->v13:
> 1. Rebased on top of the apply-next.
> 2. Addressed comments about space & comment block.
>
> Changes from v11->v12:
> 1. Rebased on top of the apply-next.
> 2. Aligned the write function & .min_priv to the previous line.
> 3. Fixed the FDT generations for multi-socket scenario.
> 4. Dropped interrupt property from the DT.
> 5. Generate illegal instruction fault instead of virtual instruction faul=
t
>    for VS/VU access while mcounteren is not set.
>
> Changes from v10->v11:
> 1. Rebased on top of the master where first 7 patches were already merged=
.
> 2. Removed unnecessary additional check in ctr predicate function.
> 3. Removed unnecessary priv version checks in mcountinhibit read/write.
> 4. Added Heiko's reviewed-by/tested-by tags.
>
> Changes from v8->v9:
> 1. Added the write_done flags to the vmstate.
> 2. Fixed the hpmcounter read access from M-mode.
>
> Changes from v7->v8:
> 1. Removeding ordering constraints for mhpmcounter & mhpmevent.
>
> Changes from v6->v7:
> 1. Fixed all the compilation errors for the usermode.
>
> Changes from v5->v6:
> 1. Fixed compilation issue with PATCH 1.
> 2. Addressed other comments.
>
> Changes from v4->v5:
> 1. Rebased on top of the -next with following patches.
>    - isa extension
>    - priv 1.12 spec
> 2. Addressed all the comments on v4
> 3. Removed additional isa-ext DT node in favor of riscv,isa string update
>
> Changes from v3->v4:
> 1. Removed the dummy events from pmu DT node.
> 2. Fixed pmu_avail_counters mask generation.
> 3. Added a patch to simplify the predicate function for counters.
>
> Changes from v2->v3:
> 1. Addressed all the comments on PATCH1-4.
> 2. Split patch1 into two separate patches.
> 3. Added explicit comments to explain the event types in DT node.
> 4. Rebased on latest Qemu.
>
> Changes from v1->v2:
> 1. Dropped the ACks from v1 as signficant changes happened after v1.
> 2. sscofpmf support.
> 3. A generic counter management framework.
>
> [1] https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/riscv-sbi.=
adoc
> [2] https://drive.google.com/file/d/171j4jFjIkKdj5LWcExphq4xG_2sihbfd/edi=
t
> [3] https://github.com/atishp04/qemu/tree/riscv_pmu_v14
>
> Atish Patra (5):
> target/riscv: Add sscofpmf extension support
> target/riscv: Simplify counter predicate function
> target/riscv: Add few cache related PMU events
> hw/riscv: virt: Add PMU DT node to the device tree
> target/riscv: Update the privilege field for sscofpmf CSRs

Sorry, but this doesn't apply. Are you able to rebase it?

Alistair

>
> hw/riscv/virt.c           |  16 ++
> target/riscv/cpu.c        |  12 ++
> target/riscv/cpu.h        |  25 +++
> target/riscv/cpu_bits.h   |  55 +++++
> target/riscv/cpu_helper.c |  25 +++
> target/riscv/csr.c        | 304 +++++++++++++++++----------
> target/riscv/machine.c    |   1 +
> target/riscv/pmu.c        | 425 +++++++++++++++++++++++++++++++++++++-
> target/riscv/pmu.h        |   8 +
> 9 files changed, 760 insertions(+), 111 deletions(-)
>
> --
> 2.25.1
>
>


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E7F4F8A61
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 00:42:59 +0200 (CEST)
Received: from localhost ([::1]:44076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncaqA-0008J3-75
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 18:42:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1ncanV-0007K1-DJ
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 18:40:13 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:45307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1ncanT-0006kG-BY
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 18:40:13 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2eb46d33db9so77502297b3.12
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 15:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FpG47zBkXfGarymUlMAIWv6AJvLliPAfkbVEIXJdHfs=;
 b=O/ns2Cg5YZ9+G2gKaGwza19WwKr4MdZwrJtBwFyeS53O8xLNyzKRDB+S9JjOtmlwj/
 R56A6geh/OFZCiW1YHwiNyPVugKeeYoLFS/eGep0GbpdKo+WQ1/GM+gDFaIr/YEUpW3q
 krFQ2YwzEeRyAxY/Bhv2NEdb//TTvZCWey4JA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FpG47zBkXfGarymUlMAIWv6AJvLliPAfkbVEIXJdHfs=;
 b=swEe6EQ4rM9859fZojrTK6eCxO7C/lr+WCPNf+gZBnDDETyYt3fiQzaoZEJMTq4xbi
 pk838oXKSZ/rezOu5jkWTG3uBKZNfTQkhxV5LMyaTPBjTstc7KX9Qk4hjxDnbtmS303q
 SoUGvx6i/FzhU3fRPfw1pGhNGJMz0ChNwpNglGNHflYKXxF2IDN0v8b/109C5KDdJf3o
 hA4MZOlHB9GI4AQD5Ccu3tBf1KJQ5JkGayMpUAajwDOi/8pYEIY43/w8bhE5IOqOhM9P
 ZADUj97/F62I5/lG/vJeIQWb627qQ1b99OckmCttTsKkqZzebwwWKs5egg4AnYKtiaYM
 aA2Q==
X-Gm-Message-State: AOAM532rHjyuzdekq0W9sxKyH/6wsQ8KnxCH/hgr+nl+dDzNXY17OACW
 Rnei0wHUX6zmGEjArCD2n7hAdXtbRRU9JrpaUmiw
X-Google-Smtp-Source: ABdhPJyiwUZMMgYMT3h5DkcQ90jtzZMR+5lEtJT+MjpBYBWi9K1whtcUeW69ihM2vWijknZQuwgKJZ0mT5qCqMRkSTo=
X-Received: by 2002:a0d:dd49:0:b0:2eb:e5c1:647a with SMTP id
 g70-20020a0ddd49000000b002ebe5c1647amr363249ywe.443.1649371209451; Thu, 07
 Apr 2022 15:40:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220331000127.2107823-1-atishp@rivosinc.com>
In-Reply-To: <20220331000127.2107823-1-atishp@rivosinc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 7 Apr 2022 15:39:58 -0700
Message-ID: <CAOnJCU+M9tv-5O=XKM8pkiNdOHJzxPpcdzF+YO1KA=5WjwWssw@mail.gmail.com>
Subject: Re: [PATCH v7 00/12] Improve PMU support
To: Atish Patra <atishp@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=atishp@atishpatra.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 30, 2022 at 5:01 PM Atish Patra <atishp@rivosinc.com> wrote:
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
> This series implements full PMU infrastructure to support
> PMU in virt machine. This will allow us to add any PMU events in future.
>
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
> Here is an output of perf stat/report while running hackbench with OpenSB=
I & Linux
> kernel patches applied [3]. The kernel patches are available in upstream =
as well.
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
> [3] https://github.com/atishp04/linux/tree/riscv_pmu_v6
> [4] https://github.com/atishp04/qemu/tree/riscv_pmu_v7
>
> Atish Patra (12):
> target/riscv: Fix PMU CSR predicate function
> target/riscv: Implement PMU CSR predicate function for S-mode
> target/riscv: pmu: Rename the counters extension to pmu
> target/riscv: pmu: Make number of counters configurable
> target/riscv: Implement mcountinhibit CSR
> target/riscv: Add support for hpmcounters/hpmevents
> target/riscv: Support mcycle/minstret write operation
> target/riscv: Add sscofpmf extension support
> target/riscv: Simplify counter predicate function
> target/riscv: Add few cache related PMU events
> hw/riscv: virt: Add PMU DT node to the device tree
> target/riscv: Update the privilege field for sscofpmf CSRs
>
> hw/riscv/virt.c           |  28 ++
> target/riscv/cpu.c        |  14 +-
> target/riscv/cpu.h        |  49 ++-
> target/riscv/cpu_bits.h   |  59 +++
> target/riscv/cpu_helper.c |  25 ++
> target/riscv/csr.c        | 879 ++++++++++++++++++++++++++++----------
> target/riscv/machine.c    |  25 ++
> target/riscv/meson.build  |   3 +-
> target/riscv/pmu.c        | 432 +++++++++++++++++++
> target/riscv/pmu.h        |  36 ++
> 10 files changed, 1315 insertions(+), 235 deletions(-)
> create mode 100644 target/riscv/pmu.c
> create mode 100644 target/riscv/pmu.h
>
> --
> 2.25.1
>
>

Any comments on this series ? Kernel patches have been merged. It
would be good to have qemu in upstream as well.


--=20
Regards,
Atish


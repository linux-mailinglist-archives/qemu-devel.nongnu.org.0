Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6E365D698
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 15:54:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD59P-000406-2k; Wed, 04 Jan 2023 09:53:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pD59N-0003zx-FJ
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 09:53:53 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pD59L-0000WM-Cl
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 09:53:53 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 o8-20020a17090a9f8800b00223de0364beso39145368pjp.4
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 06:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4gT0JlQYRiyldUS52PurLIl04P7Is7mrqUVLwprsRzo=;
 b=zd4TTvsLHmj8eslUa9npsNaZKtWGWWe4IzRiWNGtoduKxYk1zeiq+vzzVTr28eq8B2
 3Ww/h45bkz/kQhM6p1/3Z1M+gemOf+WtnTExCNenFnOijMRzrTpRXGP7zKEFxGbPfCsn
 e20Ys/HDYB7IId6ZkkKSpLS/qY/5dbrEocEX+gTWhx44jR18ITEgh4sdAqQo1O2slp0J
 k7Sk6XMoLDkDok2SSs40Uopigj40SyIMZmb39aKn4riLv0/uaMEq9BjDNQU3tVXDphVC
 01QlKjwIUmEp1eJ48LJZ9IzK2qjCPHfV4UcshDyWH1TjQcDPwv4XVfptoC31exib4uLY
 8AGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4gT0JlQYRiyldUS52PurLIl04P7Is7mrqUVLwprsRzo=;
 b=I+if2NBIHRj42E7O1D7EivNU0iqCWC7KCs1C1X1m6OpeJ2UScmJ0+85Rm/zezGDoPX
 cwSUhD63DTF9HAowk9Q3JWe4m1vt2a1sZ2BaJG/mLUCGw3CbrWBRd3mfBuVXlFX0d2Xu
 z+I5HD9riQJic6fA1fugbi9GJxWPeuhac72hhuV5vvF/yG9EMgm9NuU4hFLoozX2RUDz
 p9110l/yNHa+3X2rsOh+z5ma1Q+7GteO9HhaXLqpt9sMpBjhaV5Z9bF5blg/sTW4cpBR
 vms/bPuJ/mo8isrtmdM0rVhXkiylsz8YsZEjs+ZcLFpOdOFU5c9jcPVYLxOx3zEL+UDh
 BTSQ==
X-Gm-Message-State: AFqh2kq2Cnqk5k2tSJjGaoURsIMe1264yCezfH4J1nXpokhhw+OtjV5q
 oGPw+M7Bb//U7TtsqHznA17+5R1OJFubzlyjUpbjXA==
X-Google-Smtp-Source: AMrXdXu88iU7Pzci/1ZctYT55QooB7sP+fybNxEswAOB8FkKab3JBvHfT2OFF/Fy39lTRYFnNOzgVNwF3x+uG29tk68=
X-Received: by 2002:a17:902:9890:b0:189:b0a3:cf4a with SMTP id
 s16-20020a170902989000b00189b0a3cf4amr2186826plp.60.1672844028441; Wed, 04
 Jan 2023 06:53:48 -0800 (PST)
MIME-Version: 1.0
References: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
 <5f487941-0a4f-1f99-a281-8cf004c80662@redhat.com>
In-Reply-To: <5f487941-0a4f-1f99-a281-8cf004c80662@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 Jan 2023 14:53:37 +0000
Message-ID: <CAFEAcA__ReO+Q9y_CNWO5SLdu5wv5Fp7sKNgk9QUwF=YuNmvVw@mail.gmail.com>
Subject: Re: [PULL v2 00/45] riscv-to-apply queue
To: Thomas Huth <thuth@redhat.com>
Cc: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org, 
 alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 4 Jan 2023 at 09:20, Thomas Huth <thuth@redhat.com> wrote:
>
> On 21/12/2022 23.39, Alistair Francis wrote:
> > From: Alistair Francis <alistair.francis@wdc.com>
> >
> > The following changes since commit 222059a0fccf4af3be776fe35a5ea2d6a68f=
9a0b:
> >
> >    Merge tag 'pull-ppc-20221221' of https://gitlab.com/danielhb/qemu in=
to staging (2022-12-21 18:08:09 +0000)
> >
> > are available in the Git repository at:
> >
> >    https://github.com/alistair23/qemu.git tags/pull-riscv-to-apply-2022=
1222-1
> >
> > for you to fetch changes up to 71a9bc59728a054036f3db7dd82dab8f8bd2baf9=
:
> >
> >    hw/intc: sifive_plic: Fix the pending register range check (2022-12-=
22 08:36:30 +1000)
> >
> > ----------------------------------------------------------------
> > First RISC-V PR for QEMU 8.0
> >
> > * Fix PMP propagation for tlb
> > * Collection of bug fixes
> > * Add the `FIELDx_1CLEAR()` macro
> > * Bump the OpenTitan supported version
> > * Add smstateen support
> > * Support native debug icount trigger
> > * Remove the redundant ipi-id property in the virt machine
> > * Support cache-related PMU events in virtual mode
> > * Add some missing PolarFire SoC io regions
> > * Fix mret exception cause when no pmp rule is configured
> > * Fix bug where disabling compressed instructions would crash QEMU
> > * Add Zawrs ISA extension support
> > * A range of code refactoring and cleanups
> >
> > ----------------------------------------------------------------
> > Anup Patel (1):
> >        target/riscv: Typo fix in sstc() predicate
> >
> > Atish Patra (1):
> >        hw/riscv: virt: Remove the redundant ipi-id property
> >
> > Bin Meng (20):
> >        target/riscv: Add some comments for sstatus CSR in riscv_cpu_dum=
p_state()
> >        target/riscv: Fix mret exception cause when no pmp rule is confi=
gured
> >        target/riscv: Simplify helper_sret() a little bit
> >        target/riscv: Clear mstatus.MPRV when leaving M-mode for priv sp=
ec 1.12+
> >        hw/riscv: Select MSI_NONBROKEN in SIFIVE_PLIC
> >        hw/intc: Select MSI_NONBROKEN in RISC-V AIA interrupt controller=
s
> >        hw/riscv: Fix opentitan dependency to SIFIVE_PLIC
> >        hw/riscv: Sort machines Kconfig options in alphabetical order
> >        hw/riscv: spike: Remove misleading comments
> >        hw/intc: sifive_plic: Drop PLICMode_H
> >        hw/intc: sifive_plic: Improve robustness of the PLIC config pars=
er
> >        hw/intc: sifive_plic: Use error_setg() to propagate the error up=
 via errp in sifive_plic_realize()
> >        hw/intc: sifive_plic: Update "num-sources" property default valu=
e
> >        hw/riscv: microchip_pfsoc: Fix the number of interrupt sources o=
f PLIC
> >        hw/riscv: sifive_e: Fix the number of interrupt sources of PLIC
> >        hw/riscv: sifive_u: Avoid using magic number for "riscv, ndev"
> >        hw/riscv: virt: Fix the value of "riscv, ndev" in the dtb
> >        hw/intc: sifive_plic: Change "priority-base" to start from inter=
rupt source 0
> >        hw/riscv: opentitan: Drop "hartid-base" and "priority-base" init=
ialization
> >        hw/intc: sifive_plic: Fix the pending register range check
> >
> > Christoph Muellner (1):
> >        RISC-V: Add Zawrs ISA extension support
> >
> > Conor Dooley (3):
> >        hw/misc: pfsoc: add fabric clocks to ioscb
> >        hw/riscv: pfsoc: add missing FICs as unimplemented
> >        hw/{misc, riscv}: pfsoc: add system controller as unimplemented
> >
> > Fr=C3=A9d=C3=A9ric P=C3=A9trot (1):
> >        hw/intc: sifive_plic: Renumber the S irqs for numa support
> >
> > Jim Shu (2):
> >        target/riscv: support cache-related PMU events in virtual mode
> >        hw/intc: sifive_plic: fix out-of-bound access of source_priority=
 array
> >
> > LIU Zhiwei (5):
> >        target/riscv: Fix PMP propagation for tlb
> >        target/riscv: Add itrigger support when icount is not enabled
> >        target/riscv: Add itrigger support when icount is enabled
> >        target/riscv: Enable native debug itrigger
> >        target/riscv: Add itrigger_enabled field to CPURISCVState
> >
> > Mayuresh Chitale (3):
> >        target/riscv: Add smstateen support
> >        target/riscv: smstateen check for h/s/envcfg
> >        target/riscv: generate virtual instruction exception
> >
> > Richard Henderson (4):
> >        tcg/riscv: Fix range matched by TCG_CT_CONST_M12
> >        tcg/riscv: Fix reg overlap case in tcg_out_addsub2
> >        tcg/riscv: Fix base register for user-only qemu_ld/st
> >        target/riscv: Set pc_succ_insn for !rvc illegal insn
> >
> > Wilfred Mallawa (4):
> >        hw/registerfields: add `FIELDx_1CLEAR()` macro
> >        hw/ssi/ibex_spi: implement `FIELD32_1CLEAR` macro
> >        hw/riscv/opentitan: bump opentitan
> >        hw/riscv/opentitan: add aon_timer base unimpl
> >
> >   include/hw/intc/sifive_plic.h                  |   1 -
> >   include/hw/misc/mchp_pfsoc_ioscb.h             |   4 +
> >   include/hw/misc/mchp_pfsoc_sysreg.h            |   1 +
> >   include/hw/registerfields.h                    |  22 ++
> >   include/hw/riscv/microchip_pfsoc.h             |   7 +-
> >   include/hw/riscv/opentitan.h                   |  10 +-
> >   include/hw/riscv/shakti_c.h                    |   2 +-
> >   include/hw/riscv/sifive_e.h                    |   9 +-
> >   include/hw/riscv/sifive_u.h                    |   2 +-
> >   include/hw/riscv/virt.h                        |   8 +-
> >   target/riscv/cpu.h                             |  10 +
> >   target/riscv/cpu_bits.h                        |  37 +++
> >   target/riscv/debug.h                           |  13 +
> >   target/riscv/helper.h                          |   2 +
> >   target/riscv/pmp.h                             |   6 +-
> >   target/riscv/insn32.decode                     |   4 +
> >   hw/intc/sifive_plic.c                          |  66 +++--
> >   hw/misc/mchp_pfsoc_ioscb.c                     |  78 ++++-
> >   hw/misc/mchp_pfsoc_sysreg.c                    |  18 +-
> >   hw/riscv/microchip_pfsoc.c                     | 121 ++++----
> >   hw/riscv/opentitan.c                           |  26 +-
> >   hw/riscv/sifive_u.c                            |   3 +-
> >   hw/riscv/spike.c                               |   1 -
> >   hw/riscv/virt.c                                |   7 +-
> >   hw/ssi/ibex_spi_host.c                         |  21 +-
>
> FYI, this seems to cause problems in the MSYS2 Cirrus-CI job:
>
>   https://cirrus-ci.com/task/6444497832247296?logs=3Dmain#L2159

OK, I've dropped it from my to-process queue.

thanks
-- PMM


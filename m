Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B73ED71EC2
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jul 2019 20:10:37 +0200 (CEST)
Received: from localhost ([::1]:46454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpzFE-0006tu-Tm
	for lists+qemu-devel@lfdr.de; Tue, 23 Jul 2019 14:10:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34953)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1hpzEy-0006LC-SJ
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 14:10:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hpzEx-0005RF-LG
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 14:10:20 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:42989)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hpzEx-0005Qi-BX; Tue, 23 Jul 2019 14:10:19 -0400
Received: by mail-lj1-x242.google.com with SMTP id t28so41970332lje.9;
 Tue, 23 Jul 2019 11:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bqbnS3M9b12YUiuylx0pw/kfv6nNA08Yis45IWgLi/g=;
 b=lBWRv/0RBLoUVBZvqLgSuiRgol242lR5aVGqI/OMAc71+rszkbhFxnEMgde+goXt3a
 EbCwjrBUspBFHrt0HXt2UvPT0LS4HDW+vDEIDWeri17EDwEZOQq8PU0wO87ZWtIOfkTV
 re9zQhJprqI67NwZQjJLC1MBV7MvTfEgc0Vl5nKikWxzC/dw/1xCJLeGzNduUod+FymK
 s8anRFXX8ws0ZSsqBAYm7mEYVEmRYjrtv2r0A2UI4OrV+04NUddZ3gfpSS53NYX931Pa
 v8RI9105DaLbpx/5ZGSocvBTsbGPD//Ww57rvR8KxziXGzdTBCXIbwiw/hibGK9d9LOj
 2l/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bqbnS3M9b12YUiuylx0pw/kfv6nNA08Yis45IWgLi/g=;
 b=DfmbpLZLB80zfaxLBUMm6TJhJv5KRLp9ymBPZtK1FN/qlXT5lNbZh8iv7qIkCyaa3Z
 SFSlt5Gu+Dy70JWhIIQm5MmQp2G3qNu87eprKhTmZEPG+V5JoXVTbI64SsueCK5M4HQw
 m796VGKbKBNtTTFe+NY6QUqYcNVuXl7mFya5L0vJBv8kgMT68JjU6emO4TkKPkZBWFZ9
 2Z0+JQ9itMZFuDEZx+ufpT/Hu3IKFKoH4arxTM/68KwRRDPvZCD+uHbcCNbJdSHgRddV
 SeX0elWqiilvVOM/aVhOGmFZumCTCxOU97b7+AoDtlqPLCC0iJpigWD7MYybLqQrFMtV
 Flsw==
X-Gm-Message-State: APjAAAXKPd6TItTrDpvd0ZD05QybnE4Q+VaiT0yJ3B1MDIdKH+t+mGc4
 PUrkK8z2SJ5Z1a03vm84q4Iuoq5bORnSAOmXxYw=
X-Google-Smtp-Source: APXvYqwQGLyMCuwinZgNIGRtq5Tz9dTptp/yqnHtmV2M6YjOlharOFTGfDZ/pYjDQW36kqElpFPR+SiKOAbFRDHyUjg=
X-Received: by 2002:a2e:9158:: with SMTP id q24mr40809416ljg.119.1563905418045; 
 Tue, 23 Jul 2019 11:10:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190723120816.1361-1-philmd@redhat.com>
 <20190723120816.1361-3-philmd@redhat.com>
In-Reply-To: <20190723120816.1361-3-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 23 Jul 2019 11:06:49 -0700
Message-ID: <CAKmqyKNrJgUBVB93dHvsoDcksj0r9ckwLpmSHMhZFdcdtYx_HQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::242
Subject: Re: [Qemu-devel] [PATCH-for-4.2 2/2] target/riscv/pmp: Convert
 qemu_log_mask(LOG_TRACE) to trace events
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
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 23, 2019 at 5:08 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Use the always-compiled trace events, remove the now unused
> RISCV_DEBUG_PMP definition.
>
> Note pmpaddr_csr_read() could previously do out-of-bound accesses
> passing addr_index >=3D MAX_RISCV_PMPS.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/pmp.c        | 31 ++++++++++---------------------
>  target/riscv/trace-events |  6 ++++++
>  2 files changed, 16 insertions(+), 21 deletions(-)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index d836288cb4..d4f1007109 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -27,14 +27,7 @@
>  #include "qemu/log.h"
>  #include "qapi/error.h"
>  #include "cpu.h"
> -
> -#define RISCV_DEBUG_PMP 0
> -#define PMP_DEBUG(fmt, ...)                                             =
       \
> -    do {                                                                =
       \
> -        if (RISCV_DEBUG_PMP) {                                          =
       \
> -            qemu_log_mask(LOG_TRACE, "%s: " fmt "\n", __func__, ##__VA_A=
RGS__);\
> -        }                                                               =
       \
> -    } while (0)
> +#include "trace.h"
>
>  static void pmp_write_cfg(CPURISCVState *env, uint32_t addr_index,
>      uint8_t val);
> @@ -302,8 +295,7 @@ void pmpcfg_csr_write(CPURISCVState *env, uint32_t re=
g_index,
>      int i;
>      uint8_t cfg_val;
>
> -    PMP_DEBUG("hart " TARGET_FMT_ld ": reg%d, val: 0x" TARGET_FMT_lx,
> -        env->mhartid, reg_index, val);
> +    trace_pmpcfg_csr_write(env->mhartid, reg_index, val);
>
>      if ((reg_index & 1) && (sizeof(target_ulong) =3D=3D 8)) {
>          qemu_log_mask(LOG_GUEST_ERROR,
> @@ -332,9 +324,7 @@ target_ulong pmpcfg_csr_read(CPURISCVState *env, uint=
32_t reg_index)
>          val =3D pmp_read_cfg(env, (reg_index * sizeof(target_ulong)) + i=
);
>          cfg_val |=3D (val << (i * 8));
>      }
> -
> -    PMP_DEBUG("hart " TARGET_FMT_ld ": reg%d, val: 0x" TARGET_FMT_lx,
> -        env->mhartid, reg_index, cfg_val);
> +    trace_pmpcfg_csr_read(env->mhartid, reg_index, cfg_val);
>
>      return cfg_val;
>  }
> @@ -346,9 +336,7 @@ target_ulong pmpcfg_csr_read(CPURISCVState *env, uint=
32_t reg_index)
>  void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
>      target_ulong val)
>  {
> -    PMP_DEBUG("hart " TARGET_FMT_ld ": addr%d, val: 0x" TARGET_FMT_lx,
> -        env->mhartid, addr_index, val);
> -
> +    trace_pmpaddr_csr_write(env->mhartid, addr_index, val);
>      if (addr_index < MAX_RISCV_PMPS) {
>          if (!pmp_is_locked(env, addr_index)) {
>              env->pmp_state.pmp[addr_index].addr_reg =3D val;
> @@ -369,14 +357,15 @@ void pmpaddr_csr_write(CPURISCVState *env, uint32_t=
 addr_index,
>   */
>  target_ulong pmpaddr_csr_read(CPURISCVState *env, uint32_t addr_index)
>  {
> -    PMP_DEBUG("hart " TARGET_FMT_ld ": addr%d, val: 0x" TARGET_FMT_lx,
> -        env->mhartid, addr_index,
> -        env->pmp_state.pmp[addr_index].addr_reg);
> +    target_ulong val =3D 0;
> +
>      if (addr_index < MAX_RISCV_PMPS) {
> -        return env->pmp_state.pmp[addr_index].addr_reg;
> +        val =3D env->pmp_state.pmp[addr_index].addr_reg;
> +        trace_pmpaddr_csr_read(env->mhartid, addr_index, val);
>      } else {
>          qemu_log_mask(LOG_GUEST_ERROR,
>                        "ignoring pmpaddr read - out of bounds\n");
> -        return 0;
>      }
> +
> +    return val;
>  }
> diff --git a/target/riscv/trace-events b/target/riscv/trace-events
> index 48af0373df..4b6c652ae9 100644
> --- a/target/riscv/trace-events
> +++ b/target/riscv/trace-events
> @@ -1,2 +1,8 @@
>  # target/riscv/cpu_helper.c
>  riscv_trap(uint64_t hartid, bool async, uint64_t cause, uint64_t epc, ui=
nt64_t tval, const char *desc) "hart:%"PRId64", async:%d, cause:%"PRId64", =
epc:0x%"PRIx64", tval:0x%"PRIx64", desc=3D%s"
> +
> +# pmp.c
> +pmpcfg_csr_read(uint64_t mhartid, uint32_t reg_index, uint64_t val) "har=
t %" PRIu64 ": read reg%" PRIu32", val: 0x%" PRIx64
> +pmpcfg_csr_write(uint64_t mhartid, uint32_t reg_index, uint64_t val) "ha=
rt %" PRIu64 ": write reg%" PRIu32", val: 0x%" PRIx64
> +pmpaddr_csr_read(uint64_t mhartid, uint32_t addr_index, uint64_t val) "h=
art %" PRIu64 ": read addr%" PRIu32", val: 0x%" PRIx64
> +pmpaddr_csr_write(uint64_t mhartid, uint32_t addr_index, uint64_t val) "=
hart %" PRIu64 ": write addr%" PRIu32", val: 0x%" PRIx64
> --
> 2.20.1
>
>


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0532350827F
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 09:44:24 +0200 (CEST)
Received: from localhost ([::1]:55134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh50h-0007x1-3O
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 03:44:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nh4yz-00075L-Ny; Wed, 20 Apr 2022 03:42:38 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:42731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nh4yx-0005eW-Ks; Wed, 20 Apr 2022 03:42:37 -0400
Received: by mail-io1-xd2d.google.com with SMTP id c125so966417iof.9;
 Wed, 20 Apr 2022 00:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TCGNQ556syTGCOqD8TOmbHHk80HNiSE8k+Z/nslyw8I=;
 b=hbQYsXF1dEt7kDE0PXLYBrCZOHjcZOzPVCcPD5dKasrhgnLU5Pd+zeSIiAPTckTQ3J
 xqrUha9Qd+/4CCCxwoygwS18nUUXoEMtQLbOf40P7p7xZgdpZmZHqpsn/LAgu2CciHBq
 QL5ntiMVWTEP18smE3JOgXu1CIdfJh69imRAszJOAvfAAGxsZuY51xfnqqGU9/4sQ5He
 gUXZeUuKXhvXCj7xoESmsF6Iymn5AQqQNBgzw/FF3tCVltWfWqn/TZ/WaYQIj5GynvLs
 URpj6dcQoJiQe5OeHzRu7STw1YS5463/HWbPkQM5qa9vygh2vc63ljUsAzj/q2jbdnjZ
 Vn6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TCGNQ556syTGCOqD8TOmbHHk80HNiSE8k+Z/nslyw8I=;
 b=gwFnymgMpgxDRAZwCPqCqXxY8ycG8jOTs2KiIrRfJJ9Yrxqk/WGCRNQeI0mCVy9Vko
 D2Q5SFDWQExN0mlr4nvkTIQGedtWScZ13ABAPVVHAJoFXeKTG42WmdtaL7rBfS6pgtnr
 u5GEZcg0teqSieVrOd/kU1s5+yxEOJIvPAMqLnzud7HcK2mSofMHeL7Yt4kfxrTS7qYL
 ajc9mGmI20QrVFzSx/cSqOtJdM6jln6HMSQzkZba0kqiqagnubinmcHFmc4huJO9V/BD
 acIbCoKWXr1xxo8N7YohcdixHYHr8cNSlT1KmB3w6KCLX7j8wpkegp0DGjAYihKK+DQn
 XJTA==
X-Gm-Message-State: AOAM5338WQoATgX6rPBgtI4itN1jyQO+rmP/gBwlnnXjooBi4KKbXCZ8
 eRwEBvvfi70ffJWBOFL7C970I7VnG6rzZ2fe5Lc=
X-Google-Smtp-Source: ABdhPJzbedCKwE5m471iYvPr6zEVBMirlL3eQma+W3iMKc2ms9NSNNx6pEMMEszhEOTvdzF/u4oWqdRCI7pSAT1e6hQ=
X-Received: by 2002:a05:6638:d06:b0:326:ba0:347 with SMTP id
 q6-20020a0566380d0600b003260ba00347mr8945777jaj.68.1650440553805; Wed, 20 Apr
 2022 00:42:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220419090848.9018-1-frank.chang@sifive.com>
 <20220419090848.9018-4-frank.chang@sifive.com>
In-Reply-To: <20220419090848.9018-4-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 20 Apr 2022 17:42:07 +1000
Message-ID: <CAKmqyKPHrna2n3ewcx+7Pc00xFP9DkCG7c4YCbfX+s=-x2y1YQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] hw/intc: Make RISC-V ACLINT mtime MMIO register
 writable
To: Frank Chang <frank.chang@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Anup Patel <anup.patel@wdc.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jim Shu <jim.shu@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 19, 2022 at 7:10 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> RISC-V privilege spec defines that mtime is exposed as a memory-mapped
> machine-mode read-write register. However, as QEMU uses host monotonic
> timer as timer source, this makes mtime to be read-only in RISC-V
> ACLINT.
>
> This patch makes mtime to be writable by recording the time delta value
> between the mtime value to be written and the timer value at the time
> mtime is written. Time delta value is then added back whenever the timer
> value is retrieved.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Jim Shu <jim.shu@sifive.com>
> ---
>  hw/intc/riscv_aclint.c         | 71 ++++++++++++++++++++++++----------
>  include/hw/intc/riscv_aclint.h |  1 +
>  target/riscv/cpu.h             |  8 ++--
>  target/riscv/cpu_helper.c      |  4 +-
>  4 files changed, 57 insertions(+), 27 deletions(-)
>
> diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
> index ad3c49706f..ad7ccf96cd 100644
> --- a/hw/intc/riscv_aclint.c
> +++ b/hw/intc/riscv_aclint.c
> @@ -38,12 +38,18 @@ typedef struct riscv_aclint_mtimer_callback {
>      int num;
>  } riscv_aclint_mtimer_callback;
>
> -static uint64_t cpu_riscv_read_rtc(uint32_t timebase_freq)
> +static uint64_t cpu_riscv_read_rtc_raw(uint32_t timebase_freq)
>  {
>      return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
>          timebase_freq, NANOSECONDS_PER_SECOND);
>  }
>
> +static uint64_t cpu_riscv_read_rtc(void *opaque)
> +{
> +    RISCVAclintMTimerState *mtimer = opaque;
> +    return cpu_riscv_read_rtc_raw(mtimer->timebase_freq) + mtimer->time_delta;
> +}
> +
>  /*
>   * Called when timecmp is written to update the QEMU timer or immediately
>   * trigger timer interrupt if mtimecmp <= current timer value.
> @@ -51,13 +57,13 @@ static uint64_t cpu_riscv_read_rtc(uint32_t timebase_freq)
>  static void riscv_aclint_mtimer_write_timecmp(RISCVAclintMTimerState *mtimer,
>                                                RISCVCPU *cpu,
>                                                int hartid,
> -                                              uint64_t value,
> -                                              uint32_t timebase_freq)
> +                                              uint64_t value)
>  {
> +    uint32_t timebase_freq = mtimer->timebase_freq;
>      uint64_t next;
>      uint64_t diff;
>
> -    uint64_t rtc_r = cpu_riscv_read_rtc(timebase_freq);
> +    uint64_t rtc_r = cpu_riscv_read_rtc(mtimer);
>
>      cpu->env.timecmp = value;
>      if (cpu->env.timecmp <= rtc_r) {
> @@ -140,11 +146,11 @@ static uint64_t riscv_aclint_mtimer_read(void *opaque, hwaddr addr,
>          }
>      } else if (addr == mtimer->time_base) {
>          /* time_lo for RV32/RV64 or timecmp for RV64 */
> -        uint64_t rtc = cpu_riscv_read_rtc(mtimer->timebase_freq);
> +        uint64_t rtc = cpu_riscv_read_rtc(mtimer);
>          return (size == 4) ? (rtc & 0xFFFFFFFF) : rtc;
>      } else if (addr == mtimer->time_base + 4) {
>          /* time_hi */
> -        return (cpu_riscv_read_rtc(mtimer->timebase_freq) >> 32) & 0xFFFFFFFF;
> +        return (cpu_riscv_read_rtc(mtimer) >> 32) & 0xFFFFFFFF;
>      }
>
>      qemu_log_mask(LOG_UNIMP,
> @@ -157,6 +163,7 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
>      uint64_t value, unsigned size)
>  {
>      RISCVAclintMTimerState *mtimer = opaque;
> +    int i;
>
>      if (addr >= mtimer->timecmp_base &&
>          addr < (mtimer->timecmp_base + (mtimer->num_harts << 3))) {
> @@ -172,20 +179,18 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
>                  /* timecmp_lo for RV32/RV64 */
>                  uint64_t timecmp_hi = env->timecmp >> 32;
>                  riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,
> -                    timecmp_hi << 32 | (value & 0xFFFFFFFF),
> -                    mtimer->timebase_freq);
> +                    timecmp_hi << 32 | (value & 0xFFFFFFFF));
>              } else {
>                  /* timecmp for RV64 */
>                  riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,
> -                                                  value, mtimer->timebase_freq);
> +                                                  value);
>              }
>          } else if ((addr & 0x7) == 4) {
>              if (size == 4) {
>                  /* timecmp_hi for RV32/RV64 */
>                  uint64_t timecmp_lo = env->timecmp;
>                  riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,
> -                    value << 32 | (timecmp_lo & 0xFFFFFFFF),
> -                    mtimer->timebase_freq);
> +                    value << 32 | (timecmp_lo & 0xFFFFFFFF));
>              } else {
>                  qemu_log_mask(LOG_UNIMP,
>                                "aclint-mtimer: invalid timecmp_hi write: %08x",
> @@ -197,15 +202,39 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
>                            (uint32_t)addr);
>          }
>          return;
> -    } else if (addr == mtimer->time_base) {
> -        /* time_lo */
> -        qemu_log_mask(LOG_UNIMP,
> -                      "aclint-mtimer: time_lo write not implemented");
> -        return;
> -    } else if (addr == mtimer->time_base + 4) {
> -        /* time_hi */
> -        qemu_log_mask(LOG_UNIMP,
> -                      "aclint-mtimer: time_hi write not implemented");
> +    } else if (addr == mtimer->time_base || addr == mtimer->time_base + 4) {
> +        uint64_t rtc_r = cpu_riscv_read_rtc_raw(mtimer->timebase_freq);
> +
> +        if (addr == mtimer->time_base) {
> +            if (size == 4) {
> +                /* time_lo for RV32/RV64 */
> +                mtimer->time_delta = ((rtc_r & ~0xFFFFFFFFULL) | value) - rtc_r;
> +            } else {
> +                /* time for RV64 */
> +                mtimer->time_delta = value - rtc_r;
> +            }
> +        } else {
> +            if (size == 4) {
> +                /* time_hi for RV32/RV64 */
> +                mtimer->time_delta = (value << 32 | (rtc_r & 0xFFFFFFFF)) - rtc_r;
> +            } else {
> +                qemu_log_mask(LOG_UNIMP,

This should be a guest error instead

Otherwise:

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> +                              "aclint-mtimer: invalid time_hi write: %08x",
> +                              (uint32_t)addr);
> +                return;
> +            }
> +        }
> +
> +        /* Check if timer interrupt is triggered for each hart. */
> +        for (i = 0; i < mtimer->num_harts; i++) {
> +            CPUState *cpu = qemu_get_cpu(mtimer->hartid_base + i);
> +            CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
> +            if (!env) {
> +                continue;
> +            }
> +            riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu),
> +                                              i, env->timecmp);
> +        }
>          return;
>      }
>
> @@ -315,7 +344,7 @@ DeviceState *riscv_aclint_mtimer_create(hwaddr addr, hwaddr size,
>              continue;
>          }
>          if (provide_rdtime) {
> -            riscv_cpu_set_rdtime_fn(env, cpu_riscv_read_rtc, timebase_freq);
> +            riscv_cpu_set_rdtime_fn(env, cpu_riscv_read_rtc, dev);
>          }
>
>          cb->s = RISCV_ACLINT_MTIMER(dev);
> diff --git a/include/hw/intc/riscv_aclint.h b/include/hw/intc/riscv_aclint.h
> index 229bd08d25..26d4048687 100644
> --- a/include/hw/intc/riscv_aclint.h
> +++ b/include/hw/intc/riscv_aclint.h
> @@ -31,6 +31,7 @@
>  typedef struct RISCVAclintMTimerState {
>      /*< private >*/
>      SysBusDevice parent_obj;
> +    uint64_t time_delta;
>
>      /*< public >*/
>      MemoryRegion mmio;
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 249fce4c3b..0cb7c2a05a 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -286,8 +286,8 @@ struct CPUArchState {
>      type2_trigger_t type2_trig[TRIGGER_TYPE2_NUM];
>
>      /* machine specific rdtime callback */
> -    uint64_t (*rdtime_fn)(uint32_t);
> -    uint32_t rdtime_fn_arg;
> +    uint64_t (*rdtime_fn)(void *);
> +    void *rdtime_fn_arg;
>
>      /* machine specific AIA ireg read-modify-write callback */
>  #define AIA_MAKE_IREG(__isel, __priv, __virt, __vgein, __xlen) \
> @@ -505,8 +505,8 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env);
>  int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts);
>  uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value);
>  #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip value */
> -void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t),
> -                             uint32_t arg);
> +void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(void *),
> +                             void *arg);
>  void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env, uint32_t priv,
>                                     int (*rmw_fn)(void *arg,
>                                                   target_ulong reg,
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index b5bbe6fc39..51a3d96a66 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -632,8 +632,8 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
>      return old;
>  }
>
> -void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t),
> -                             uint32_t arg)
> +void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(void *),
> +                             void *arg)
>  {
>      env->rdtime_fn = fn;
>      env->rdtime_fn_arg = arg;
> --
> 2.35.1
>
>


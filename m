Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4945E64EBCA
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 14:03:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6AN7-00045a-21; Fri, 16 Dec 2022 08:03:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1p6AN5-00045J-5s
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 08:03:27 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1p6AN2-0007ci-9k
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 08:03:26 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 h8-20020a1c2108000000b003d1efd60b65so4111636wmh.0
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 05:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4uUfYENLdJzXsuQfwqnjvT8wPKIX4asMy2YlhEVOYc0=;
 b=zyPqC9n8iyTjFLdF7cTj11/hCklGSJWZoIAsaPXLIdJvfcOfYEF0nUiJs9SodwtddK
 oen+HPQsYDoYC+nMcPpuRcyo8tYQRPteCKmhF6TkH2X+oVCrbsrmp+qHyO3XICF8sP4x
 RXy01wPfmHBX+AUcOYvvjSWz4GyNiCgreo90y32rA95XOffy0DWgbshzt4zhqj64o4Vn
 3TKrFTyv7Gcgo+EAx9tM1+NiH8gSr+BQxi2oErky12oXfIoR5M1DZ/I2LrtafwG7yDpM
 ITJFajyehOD0bkD8z5o6kpX07GBu3GDhJanTh3S5EiUlJkoL5GW/3dTPspCPgK29mlGD
 rBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4uUfYENLdJzXsuQfwqnjvT8wPKIX4asMy2YlhEVOYc0=;
 b=qLkAXVB1tHOzUi6QqVDSIjQHI8ssEk1AvZnfGNOMLBQDROEnRPvsYJRNjcDbJU6MYL
 jDYhPc/FqJOQ1Hp2YdbNBEIKFsHgMiYW4gRC/dtFXkHNrALcLOQyppayMysMwTgj/qor
 FtICczbccCBdSdpfX6dWmSnifL9twVbl+YH3rDNWpUoMAuR6wMvBP46fLtWC2uWKEQdP
 6vekAs5L0EGVdsOsOycdhNWnZqNqwpUreavq0iAIGq1nG1PgIzmqGvDQUKuyzx70luVW
 1SOx4nh03T4w1LALFBsHeZY1oUIAziZgSdnwB9JngWseVRq7+8wAmwLvbBKjEasAYhVU
 +TJA==
X-Gm-Message-State: ANoB5pkKC6tvxuMk8vjYrG/vPbAFg3cQJfzpxdmyWW9s85+VUn3mFvGM
 jO6kH8ki9QTnb9WduLx0a3H0KdUdIB9Jk2desqo+Pw==
X-Google-Smtp-Source: AA0mqf5ASyiiIJiUcHBpncT63nZ0cq5GAcnMcDDqPv4wWw4w99tikloUfIdYAzLw1BGQRnw+dbidh5u8p/xModHq+D8=
X-Received: by 2002:a05:600c:2295:b0:3d1:e710:9905 with SMTP id
 21-20020a05600c229500b003d1e7109905mr449851wmf.81.1671195801430; Fri, 16 Dec
 2022 05:03:21 -0800 (PST)
MIME-Version: 1.0
References: <20221212102250.3365948-1-alexghiti@rivosinc.com>
 <CANzO1D2mTF5nipiugcvaOJMk699-RgzyYiD21kHqR4n3cVjFOg@mail.gmail.com>
In-Reply-To: <CANzO1D2mTF5nipiugcvaOJMk699-RgzyYiD21kHqR4n3cVjFOg@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Fri, 16 Dec 2022 14:03:10 +0100
Message-ID: <CAHVXubiuupjz2zymHHi-3pM=m3v=V287P7_-o1-AjXxZhMYW5w@mail.gmail.com>
Subject: Re: [PATCH v4] riscv: Allow user to set the satp mode
To: Frank Chang <frank.chang@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 qemu-riscv@nongnu.org, 
 qemu-devel@nongnu.org, Ludovic Henry <ludovic@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wm1-x334.google.com
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

Hi Frank,

On Fri, Dec 16, 2022 at 10:32 AM Frank Chang <frank.chang@sifive.com> wrote:
>
> Hi Alexandre,
>
> Thanks for the contribution. This is really helpful.
>
> It seems like if we want to specify the SATP mode for the "named" CPUs,
> we have to do, e.g.:
> cpu->cfg.satp_mode.map |= (1 << idx_satp_mode_from_str("sv39"));
> in each CPU's init function.
>
> Can we add another helper function to wrap this for the "named" CPUs?

Yes sure, I'll add some helpers for the bit operations in general,
that will be cleaner. And I'll set the default satp mode for the
current cpus in each cpu init function too.

Thanks for your remarks,

Alex

>
> Regards,
> Frank Chang
>
>
> On Mon, Dec 12, 2022 at 6:23 PM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
>>
>> RISC-V specifies multiple sizes for addressable memory and Linux probes for
>> the machine's support at startup via the satp CSR register (done in
>> csr.c:validate_vm).
>>
>> As per the specification, sv64 must support sv57, which in turn must
>> support sv48...etc. So we can restrict machine support by simply setting the
>> "highest" supported mode and the bare mode is always supported.
>>
>> You can set the satp mode using the new properties "mbare", "sv32",
>> "sv39", "sv48", "sv57" and "sv64" as follows:
>> -cpu rv64,sv57=on # Linux will boot using sv57 scheme
>> -cpu rv64,sv39=on # Linux will boot using sv39 scheme
>>
>> We take the highest level set by the user:
>> -cpu rv64,sv48=on,sv57=on # Linux will boot using sv57 scheme
>>
>> We make sure that invalid configurations are rejected:
>> -cpu rv64,sv32=on # Can't enable 32-bit satp mode in 64-bit
>> -cpu rv64,sv39=off,sv48=on # sv39 must be supported if higher modes are
>>                            # enabled
>>
>> We accept "redundant" configurations:
>> -cpu rv64,sv48=on,sv57=off # sv39 must be supported if higher modes are
>>
>> In addition, we now correctly set the device-tree entry 'mmu-type' using
>> those new properties.
>>
>> Co-Developed-by: Ludovic Henry <ludovic@rivosinc.com>
>> Signed-off-by: Ludovic Henry <ludovic@rivosinc.com>
>> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>> ---
>> v4:
>> - Use custom boolean properties instead of OnOffAuto properties, based
>>   on ARMVQMap, as suggested by Andrew
>>
>> v3:
>> - Free sv_name as pointed by Bin
>> - Replace satp-mode with boolean properties as suggested by Andrew
>> - Removed RB from Atish as the patch considerably changed
>>
>> v2:
>> - Use error_setg + return as suggested by Alistair
>> - Add RB from Atish
>> - Fixed checkpatch issues missed in v1
>> - Replaced Ludovic email address with the rivos one
>>
>>  hw/riscv/virt.c    |  20 +++--
>>  target/riscv/cpu.c | 217 +++++++++++++++++++++++++++++++++++++++++++--
>>  target/riscv/cpu.h |  25 ++++++
>>  target/riscv/csr.c |  13 ++-
>>  4 files changed, 256 insertions(+), 19 deletions(-)
>>
>> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
>> index a5bc7353b4..9bb5ba7366 100644
>> --- a/hw/riscv/virt.c
>> +++ b/hw/riscv/virt.c
>> @@ -228,7 +228,8 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
>>      int cpu;
>>      uint32_t cpu_phandle;
>>      MachineState *mc = MACHINE(s);
>> -    char *name, *cpu_name, *core_name, *intc_name;
>> +    uint8_t satp_mode_max;
>> +    char *name, *cpu_name, *core_name, *intc_name, *sv_name;
>>
>>      for (cpu = s->soc[socket].num_harts - 1; cpu >= 0; cpu--) {
>>          cpu_phandle = (*phandle)++;
>> @@ -236,14 +237,15 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
>>          cpu_name = g_strdup_printf("/cpus/cpu@%d",
>>              s->soc[socket].hartid_base + cpu);
>>          qemu_fdt_add_subnode(mc->fdt, cpu_name);
>> -        if (riscv_feature(&s->soc[socket].harts[cpu].env,
>> -                          RISCV_FEATURE_MMU)) {
>> -            qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
>> -                                    (is_32_bit) ? "riscv,sv32" : "riscv,sv48");
>> -        } else {
>> -            qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
>> -                                    "riscv,none");
>> -        }
>> +
>> +        satp_mode_max = satp_mode_max_from_map(
>> +                            s->soc[socket].harts[cpu].cfg.satp_mode.map,
>> +                            is_32_bit);
>> +        sv_name = g_strdup_printf("riscv,%s",
>> +                                  satp_mode_str(satp_mode_max, is_32_bit));
>> +        qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type", sv_name);
>> +        g_free(sv_name);
>> +
>>          name = riscv_isa_string(&s->soc[socket].harts[cpu]);
>>          qemu_fdt_setprop_string(mc->fdt, cpu_name, "riscv,isa", name);
>>          g_free(name);
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index d14e95c9dc..639231ce2e 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -27,6 +27,7 @@
>>  #include "time_helper.h"
>>  #include "exec/exec-all.h"
>>  #include "qapi/error.h"
>> +#include "qapi/visitor.h"
>>  #include "qemu/error-report.h"
>>  #include "hw/qdev-properties.h"
>>  #include "migration/vmstate.h"
>> @@ -199,7 +200,7 @@ static const char * const riscv_intr_names[] = {
>>      "reserved"
>>  };
>>
>> -static void register_cpu_props(DeviceState *dev);
>> +static void register_cpu_props(Object *obj);
>>
>>  const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
>>  {
>> @@ -237,7 +238,7 @@ static void riscv_any_cpu_init(Object *obj)
>>      set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
>>  #endif
>>      set_priv_version(env, PRIV_VERSION_1_12_0);
>> -    register_cpu_props(DEVICE(obj));
>> +    register_cpu_props(obj);
>>  }
>>
>>  #if defined(TARGET_RISCV64)
>> @@ -246,7 +247,7 @@ static void rv64_base_cpu_init(Object *obj)
>>      CPURISCVState *env = &RISCV_CPU(obj)->env;
>>      /* We set this in the realise function */
>>      set_misa(env, MXL_RV64, 0);
>> -    register_cpu_props(DEVICE(obj));
>> +    register_cpu_props(obj);
>>      /* Set latest version of privileged specification */
>>      set_priv_version(env, PRIV_VERSION_1_12_0);
>>  }
>> @@ -279,7 +280,7 @@ static void rv128_base_cpu_init(Object *obj)
>>      CPURISCVState *env = &RISCV_CPU(obj)->env;
>>      /* We set this in the realise function */
>>      set_misa(env, MXL_RV128, 0);
>> -    register_cpu_props(DEVICE(obj));
>> +    register_cpu_props(obj);
>>      /* Set latest version of privileged specification */
>>      set_priv_version(env, PRIV_VERSION_1_12_0);
>>  }
>> @@ -289,7 +290,7 @@ static void rv32_base_cpu_init(Object *obj)
>>      CPURISCVState *env = &RISCV_CPU(obj)->env;
>>      /* We set this in the realise function */
>>      set_misa(env, MXL_RV32, 0);
>> -    register_cpu_props(DEVICE(obj));
>> +    register_cpu_props(obj);
>>      /* Set latest version of privileged specification */
>>      set_priv_version(env, PRIV_VERSION_1_12_0);
>>  }
>> @@ -342,7 +343,7 @@ static void riscv_host_cpu_init(Object *obj)
>>  #elif defined(TARGET_RISCV64)
>>      set_misa(env, MXL_RV64, 0);
>>  #endif
>> -    register_cpu_props(DEVICE(obj));
>> +    register_cpu_props(obj);
>>  }
>>  #endif
>>
>> @@ -612,6 +613,71 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
>>      }
>>  }
>>
>> +#define OFFSET_SATP_MODE_64     16
>> +
>> +static uint8_t idx_satp_mode_from_str(const char *satp_mode_str)
>> +{
>> +    if (!strncmp(satp_mode_str, "mbare", 5)) {
>> +        return VM_1_10_MBARE;
>> +    }
>> +
>> +    if (!strncmp(satp_mode_str, "sv32", 4)) {
>> +        return VM_1_10_SV32;
>> +    }
>> +
>> +    if (!strncmp(satp_mode_str, "sv39", 4)) {
>> +        return VM_1_10_SV39 + OFFSET_SATP_MODE_64;
>> +    }
>> +
>> +    if (!strncmp(satp_mode_str, "sv48", 4)) {
>> +        return VM_1_10_SV48 + OFFSET_SATP_MODE_64;
>> +    }
>> +
>> +    if (!strncmp(satp_mode_str, "sv57", 4)) {
>> +        return VM_1_10_SV57 + OFFSET_SATP_MODE_64;
>> +    }
>> +
>> +    if (!strncmp(satp_mode_str, "sv64", 4)) {
>> +        return VM_1_10_SV64 + OFFSET_SATP_MODE_64;
>> +    }
>> +
>> +    /* Will never get there */
>> +    return -1;
>> +}
>> +
>> +uint8_t satp_mode_max_from_map(uint32_t map, bool is_32_bit)
>> +{
>> +    return is_32_bit ?
>> +        (31 - __builtin_clz(map & 0xFFFF)) : (31 - __builtin_clz(map >> 16));
>> +}
>> +
>> +const char *satp_mode_str(uint8_t satp_mode, bool is_32_bit)
>> +{
>> +    if (is_32_bit) {
>> +        switch (satp_mode) {
>> +        case VM_1_10_SV32:
>> +            return "sv32";
>> +        case VM_1_10_MBARE:
>> +            return "none";
>> +        }
>> +    } else {
>> +        switch (satp_mode) {
>> +        case VM_1_10_SV64:
>> +            return "sv64";
>> +        case VM_1_10_SV57:
>> +            return "sv57";
>> +        case VM_1_10_SV48:
>> +            return "sv48";
>> +        case VM_1_10_SV39:
>> +            return "sv39";
>> +        case VM_1_10_MBARE:
>> +            return "none";
>> +        }
>> +    }
>> +
>> +    return NULL;
>> +}
>> +
>>  static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>>  {
>>      CPUState *cs = CPU(dev);
>> @@ -907,6 +973,30 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>>       }
>>  #endif
>>
>> +    bool rv32 = riscv_cpu_mxl(&cpu->env) == MXL_RV32;
>> +
>> +    /*
>> +     * If unset by both the user and the cpu, we fallback to sv32 for 32-bit
>> +     * or sv57 for 64-bit when a MMU is present, and bare otherwise.
>> +     */
>> +    if (cpu->cfg.satp_mode.map == 0) {
>> +        if (riscv_feature(&cpu->env, RISCV_FEATURE_MMU)) {
>> +            if (rv32) {
>> +                cpu->cfg.satp_mode.map |= (1 << idx_satp_mode_from_str("sv32"));
>> +            } else {
>> +                cpu->cfg.satp_mode.map |= (1 << idx_satp_mode_from_str("sv57"));
>> +            }
>> +        } else {
>> +            cpu->cfg.satp_mode.map |= (1 << idx_satp_mode_from_str("mbare"));
>> +        }
>> +    }
>> +
>> +    riscv_cpu_finalize_features(cpu, &local_err);
>> +    if (local_err != NULL) {
>> +        error_propagate(errp, local_err);
>> +        return;
>> +    }
>> +
>>      riscv_cpu_register_gdb_regs_for_features(cs);
>>
>>      qemu_init_vcpu(cs);
>> @@ -915,6 +1005,115 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>>      mcc->parent_realize(dev, errp);
>>  }
>>
>> +static void cpu_riscv_get_satp(Object *obj, Visitor *v, const char *name,
>> +                           void *opaque, Error **errp)
>> +{
>> +    RISCVSATPMap *satp_map = opaque;
>> +    uint8_t idx_satp = idx_satp_mode_from_str(name);
>> +    bool value;
>> +
>> +    value = (satp_map->map & (1 << idx_satp));
>> +
>> +    visit_type_bool(v, name, &value, errp);
>> +}
>> +
>> +static void cpu_riscv_set_satp(Object *obj, Visitor *v, const char *name,
>> +                           void *opaque, Error **errp)
>> +{
>> +    RISCVSATPMap *satp_map = opaque;
>> +    uint8_t idx_satp = idx_satp_mode_from_str(name);
>> +    bool value;
>> +
>> +    if (!visit_type_bool(v, name, &value, errp)) {
>> +        return;
>> +    }
>> +
>> +    if (value) {
>> +        satp_map->map |= 1 << idx_satp;
>> +    }
>> +
>> +    satp_map->init |= 1 << idx_satp;
>> +}
>> +
>> +static void riscv_add_satp_mode_properties(Object *obj)
>> +{
>> +    RISCVCPU *cpu = RISCV_CPU(obj);
>> +
>> +    object_property_add(obj, "mbare", "bool", cpu_riscv_get_satp,
>> +                        cpu_riscv_set_satp, NULL, &cpu->cfg.satp_mode);
>> +    object_property_add(obj, "sv32", "bool", cpu_riscv_get_satp,
>> +                        cpu_riscv_set_satp, NULL, &cpu->cfg.satp_mode);
>> +    object_property_add(obj, "sv39", "bool", cpu_riscv_get_satp,
>> +                        cpu_riscv_set_satp, NULL, &cpu->cfg.satp_mode);
>> +    object_property_add(obj, "sv48", "bool", cpu_riscv_get_satp,
>> +                        cpu_riscv_set_satp, NULL, &cpu->cfg.satp_mode);
>> +    object_property_add(obj, "sv57", "bool", cpu_riscv_get_satp,
>> +                        cpu_riscv_set_satp, NULL, &cpu->cfg.satp_mode);
>> +    object_property_add(obj, "sv64", "bool", cpu_riscv_get_satp,
>> +                        cpu_riscv_set_satp, NULL, &cpu->cfg.satp_mode);
>> +}
>> +
>> +#define error_append_or_setg(errp, str, ...) ({             \
>> +        if (*errp)                                          \
>> +            error_append_hint(errp, str"\n", ##__VA_ARGS__);\
>> +        else                                                \
>> +            error_setg(errp, str, ##__VA_ARGS__);           \
>> +    })
>> +
>> +void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
>> +{
>> +    bool rv32 = riscv_cpu_mxl(&cpu->env) == MXL_RV32;
>> +
>> +    /* Get rid of 32-bit/64-bit incompatibility */
>> +    if (rv32) {
>> +        if (cpu->cfg.satp_mode.map >= (1 << OFFSET_SATP_MODE_64))
>> +            error_append_or_setg(errp, "cannot enable 64-bit satp modes "
>> +                                 "(sv39/sv48/sv57/sv64) if cpu is in 32-bit "
>> +                                 "mode");
>> +    } else {
>> +        if (cpu->cfg.satp_mode.map & (1 << VM_1_10_SV32))
>> +            error_append_or_setg(errp, "cannot enable 32-bit satp mode (sv32) "
>> +                                 "if cpu is in 64-bit mode");
>> +    }
>> +
>> +    /*
>> +     * Then make sure the user did not ask for an invalid configuration as per
>> +     * the specification.
>> +     */
>> +    if (rv32) {
>> +        if (cpu->cfg.satp_mode.map & (1 << VM_1_10_SV32)) {
>> +            if (!(cpu->cfg.satp_mode.map & (1 << VM_1_10_MBARE)) &&
>> +                 (cpu->cfg.satp_mode.init & (1 << VM_1_10_MBARE)))
>> +                error_append_or_setg(errp, "cannot disable mbare satp mode if "
>> +                                     "sv32 is enabled");
>> +        }
>> +    } else {
>> +        uint8_t satp_mode_max;
>> +
>> +        satp_mode_max = satp_mode_max_from_map(cpu->cfg.satp_mode.map, false);
>> +
>> +        for (int i = satp_mode_max - 1; i >= 0; --i) {
>> +            if (!(cpu->cfg.satp_mode.map & (1 << (i + OFFSET_SATP_MODE_64))) &&
>> +                 (cpu->cfg.satp_mode.init & (1 << (i + OFFSET_SATP_MODE_64))))
>> +                error_append_or_setg(errp, "cannot disable %s satp mode if %s "
>> +                                     "is enabled",
>> +                                     satp_mode_str(i, false),
>> +                                     satp_mode_str(satp_mode_max, false));
>> +        }
>> +    }
>> +}
>> +
>> +void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
>> +{
>> +    Error *local_err = NULL;
>> +
>> +    riscv_cpu_satp_mode_finalize(cpu, &local_err);
>> +    if (local_err != NULL) {
>> +        error_propagate(errp, local_err);
>> +        return;
>> +    }
>> +}
>> +
>>  #ifndef CONFIG_USER_ONLY
>>  static void riscv_cpu_set_irq(void *opaque, int irq, int level)
>>  {
>> @@ -1070,13 +1269,16 @@ static Property riscv_cpu_extensions[] = {
>>      DEFINE_PROP_END_OF_LIST(),
>>  };
>>
>> -static void register_cpu_props(DeviceState *dev)
>> +static void register_cpu_props(Object *obj)
>>  {
>>      Property *prop;
>> +    DeviceState *dev = DEVICE(obj);
>>
>>      for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
>>          qdev_property_add_static(dev, prop);
>>      }
>> +
>> +    riscv_add_satp_mode_properties(obj);
>>  }
>>
>>  static Property riscv_cpu_properties[] = {
>> @@ -1094,6 +1296,7 @@ static Property riscv_cpu_properties[] = {
>>
>>      DEFINE_PROP_BOOL("rvv_ta_all_1s", RISCVCPU, cfg.rvv_ta_all_1s, false),
>>      DEFINE_PROP_BOOL("rvv_ma_all_1s", RISCVCPU, cfg.rvv_ma_all_1s, false),
>> +
>>      DEFINE_PROP_END_OF_LIST(),
>>  };
>>
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index 3a9e25053f..1717b33321 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -27,6 +27,7 @@
>>  #include "qom/object.h"
>>  #include "qemu/int128.h"
>>  #include "cpu_bits.h"
>> +#include "qapi/qapi-types-common.h"
>>
>>  #define TCG_GUEST_DEFAULT_MO 0
>>
>> @@ -407,6 +408,22 @@ struct RISCVCPUClass {
>>      DeviceReset parent_reset;
>>  };
>>
>> +/*
>> + * map and init are divided into two 16bit bitmaps: the upper one is for rv64
>> + * and the lower one is for rv32, this is because the value for sv32 (ie. 1)
>> + * may be reused later for another purpose for rv64 (see the specification which
>> + * states that it is "reserved for standard use").
>> + *
>> + * In a 16bit bitmap in map, the most significant set bit is the maximum
>> + * satp mode that is supported.
>> + *
>> + * Both 16bit bitmaps in init are used to make sure the user selected a correct
>> + * combination as per the specification.
>> + */
>> +typedef struct {
>> +    uint32_t map, init;
>> +} RISCVSATPMap;
>> +
>>  struct RISCVCPUConfig {
>>      bool ext_i;
>>      bool ext_e;
>> @@ -480,6 +497,8 @@ struct RISCVCPUConfig {
>>      bool debug;
>>
>>      bool short_isa_string;
>> +
>> +    RISCVSATPMap satp_mode;
>>  };
>>
>>  typedef struct RISCVCPUConfig RISCVCPUConfig;
>> @@ -789,4 +808,10 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops);
>>
>>  void riscv_cpu_register_gdb_regs_for_features(CPUState *cs);
>>
>> +uint8_t satp_mode_max_from_map(uint32_t map, bool is_32_bit);
>> +const char *satp_mode_str(uint8_t satp_mode, bool is_32_bit);
>> +
>> +void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp);
>> +void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp);
>> +
>>  #endif /* RISCV_CPU_H */
>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> index 5c9a7ee287..5c732653b2 100644
>> --- a/target/riscv/csr.c
>> +++ b/target/riscv/csr.c
>> @@ -1109,10 +1109,17 @@ static RISCVException read_mstatus(CPURISCVState *env, int csrno,
>>
>>  static int validate_vm(CPURISCVState *env, target_ulong vm)
>>  {
>> -    if (riscv_cpu_mxl(env) == MXL_RV32) {
>> -        return valid_vm_1_10_32[vm & 0xf];
>> +    uint8_t satp_mode_max;
>> +    RISCVCPU *cpu = RISCV_CPU(env_cpu(env));
>> +    bool is_32_bit = riscv_cpu_mxl(env) == MXL_RV32;
>> +
>> +    vm &= 0xf;
>> +    satp_mode_max = satp_mode_max_from_map(cpu->cfg.satp_mode.map, is_32_bit);
>> +
>> +    if (is_32_bit) {
>> +        return valid_vm_1_10_32[vm] && (vm <= satp_mode_max);
>>      } else {
>> -        return valid_vm_1_10_64[vm & 0xf];
>> +        return valid_vm_1_10_64[vm] && (vm <= satp_mode_max);
>>      }
>>  }
>>
>> --
>> 2.37.2
>>
>>


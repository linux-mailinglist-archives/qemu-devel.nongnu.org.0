Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEA53E2235
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 05:36:47 +0200 (CEST)
Received: from localhost ([::1]:34120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBqf8-0003IJ-Mc
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 23:36:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mBqeG-0002Xi-9d; Thu, 05 Aug 2021 23:35:54 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:43611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mBqeE-0005iC-En; Thu, 05 Aug 2021 23:35:52 -0400
Received: by mail-yb1-xb32.google.com with SMTP id z128so12729240ybc.10;
 Thu, 05 Aug 2021 20:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bJF9FcXTaeHdOWOs5HG1C6ujOZIT/QgWHJKHXzoQNNo=;
 b=iPwzWhyC6blbT1IWZfkHV/+1RfCpfMqpmFbUjCWs4mBjK67ZWy4kgftRwnGWgFakyh
 xw2WxicWdfu19qadBzPkl2Not7kGB74PjbhanyX0QpPbXTKMgp8AfXTRLXMDI12s64Xn
 MVkvUl4KCxl15GTGAODNtlkNELQQqpJgpwvoe5dDS3nUypD4Ksde0DT6WFbjMUh2HfcH
 u3aMEPILjdfTCt+ugQjjnt80x1+x6yeSMMcmVFBYH9cCBUcF3NDw9E/D6ujHfMMkWb+E
 0FwtNUn8S0eBbdSQ8qEbqBl01BeBPEUwWu3KL4eijOJaKyms2cTYwh1/c6WdybV+ZhdB
 YGbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bJF9FcXTaeHdOWOs5HG1C6ujOZIT/QgWHJKHXzoQNNo=;
 b=pPqryslkVz2mhF65oECu2vDuysUep0GUipNTYChX+cbSokXYIOx1HvrptQ/xktG6lf
 Lq3FLUGNoojiCT0wbCnASQDkLazsTxbIw5xUPgl9NPw7kCg+ve6yKaX8gqYr0SXvs0MJ
 uPRZfxUxbnTH7FNMRiUb5KF1JXiV89rMAD40ONY2pWElhyFCbmZ2Lb4aDqRdmBMfR7tb
 M3V2G8FN5RXBSAHPmbYsakjpsCmMEovAkyP8Dm0LUuLOCwj0Uf7JR/dIaYV6Y5f1UvBD
 XMfKjGwNL+lXmV2NbfOvzMU/kdlFdhRzw+R5CdA6jhvcWNCFpG68lxGImS37+yC9OBah
 ESXQ==
X-Gm-Message-State: AOAM532s68rBZ0yjDc27RfMuOSMIe4L1fK7+TFkibXZTCeyymRJEVjYb
 +inBc/ghAFOvz17OHX0JKnZt06/lvoj+YiSu5eI=
X-Google-Smtp-Source: ABdhPJz3SqDhQjEqDMQQZR6YqC/paMyATaU5f8ufuAzA0mD+FVh4FZLhayOpGyWq8NgQGRmQDsb5kmxh1Ee3CwM+0Lc=
X-Received: by 2002:a25:bb08:: with SMTP id z8mr10606259ybg.306.1628220948447; 
 Thu, 05 Aug 2021 20:35:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210805175626.11573-1-ruinland@andestech.com>
 <20210805175626.11573-3-ruinland@andestech.com>
In-Reply-To: <20210805175626.11573-3-ruinland@andestech.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 6 Aug 2021 11:35:36 +0800
Message-ID: <CAEUhbmWXZBwvsDC5VYvQs+3zssNaRFwKz14fJPnPQHJCpwVUPg@mail.gmail.com>
Subject: Re: [RFC PATCH v4 2/4] Adding basic custom/vendor CSR handling
 mechanism
To: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: wangjunqiang <wangjunqiang@iscas.ac.cn>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Dylan Jhong <dylan@andestech.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Alistair

On Fri, Aug 6, 2021 at 1:58 AM Ruinland Chuan-Tzu Tsai
<ruinland@andestech.com> wrote:
>
> From: Ruinalnd ChuanTzu Tsai <ruinland@andestech.com>
>
> For now we add a custom CSR handling mechanism to handle non-standard CSR read
> or write.
>
> The write_stub() and read_zero() are provided for quick placeholder usage if
> such CSRs' behavior are expected to fail-over in its user code.
>
> Signed-off-by: Dylan Jhong <dylan@andestech.com>
> ---
>  target/riscv/cpu.c             | 23 ++++++++++
>  target/riscv/cpu.h             | 31 ++++++++++++-
>  target/riscv/cpu_bits.h        |  4 ++
>  target/riscv/csr.c             | 83 ++++++++++++++++++++++++++++------
>  target/riscv/custom_cpu_bits.h |  8 ++++
>  5 files changed, 134 insertions(+), 15 deletions(-)
>  create mode 100644 target/riscv/custom_cpu_bits.h
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 7401325..3a638b5 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -144,6 +144,29 @@ static void set_resetvec(CPURISCVState *env, target_ulong resetvec)
>  #endif
>  }
>
> +#if defined(CONFIG_RISCV_CUSTOM)
> +static void setup_custom_csr(CPURISCVState *env,
> +                             riscv_custom_csr_operations csr_map_struct[]
> +                             ) {

{ should be put to the next line, per QEMU coding convention. Please
fix this globally in this series.

> +
> +    env->custom_csr_map = g_hash_table_new_full(g_direct_hash, \
> +                                                g_direct_equal, \
> +                                                NULL, NULL);

Is it possible to juse use g_hash_table_new() directly, with both 2
parameters being NULL, given you don't provide the destroy hooks?
like:

    env->custom_csr_map = g_hash_table_new(NULL, NULL);

> +
> +
> +    int i;

nits: please move this to the beginning of this function.

> +    for (i = 0; i < MAX_CUSTOM_CSR_NUM; i++) {
> +        if (csr_map_struct[i].csrno != 0) {
> +            g_hash_table_insert(env->custom_csr_map,
> +                GINT_TO_POINTER(csr_map_struct[i].csrno),
> +                &csr_map_struct[i].csr_opset);
> +        } else {
> +            break;

break? I think we should continue the loop.

> +        }
> +    }
> +}
> +#endif
> +
>  static void riscv_any_cpu_init(Object *obj)
>  {
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 0edb282..52df9bb 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -239,6 +239,16 @@ struct CPURISCVState {
>
>      /* Fields from here on are preserved across CPU reset. */
>      QEMUTimer *timer; /* Internal timer */
> +
> +    /*
> +     * The reason why we have an opset map for custom CSRs and a seperated
> +     * storage map is that we might have heterogeneous architecture, in which
> +     * different harts have different custom CSRs.
> +     * Custom CSR opset map
> +     */
> +    GHashTable *custom_csr_map;
> +    /* Custom CSR val holder */
> +    void *custom_csr_val;
>  };
>
>  OBJECT_DECLARE_TYPE(RISCVCPU, RISCVCPUClass,
> @@ -485,17 +495,36 @@ typedef struct {
>      riscv_csr_op_fn op;
>  } riscv_csr_operations;
>
> +typedef struct {
> +    int csrno;
> +    riscv_csr_operations csr_opset;
> +    } riscv_custom_csr_operations;

} should be put in the beginning without space. Please fix this
globally in this series.

> +
> +/*
> + * The reason why we have an abstraction here is that : We could have CSR
> + * number M on hart A is an alias of CSR number N on hart B. So we make a
> + * CSR number to value address map.
> + */
> +typedef struct  {
> +    int csrno;
> +    target_ulong val;
> +    } riscv_custom_csr_vals;
> +

It looks this struct is not used by any patch in this series?

>  /* CSR function table constants */
>  enum {
> -    CSR_TABLE_SIZE = 0x1000
> +    CSR_TABLE_SIZE = 0x1000,
> +    MAX_CUSTOM_CSR_NUM = 100

To be consistent, name this to be: CUSTOM_CSR_TABLE_SIZE

>  };
>
>  /* CSR function table */
> +extern int andes_custom_csr_size;
> +extern riscv_custom_csr_operations andes_custom_csr_table[MAX_CUSTOM_CSR_NUM];

The above 2 should not be in this patch.

>  extern riscv_csr_operations csr_ops[CSR_TABLE_SIZE];
>
>  void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops);
>  void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops);
>
> +

This is unnecessary.

>  void riscv_cpu_register_gdb_regs_for_features(CPUState *cs);
>
>  #endif /* RISCV_CPU_H */
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index caf4599..de77242 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -593,3 +593,7 @@
>  #define MIE_SSIE                           (1 << IRQ_S_SOFT)
>  #define MIE_USIE                           (1 << IRQ_U_SOFT)
>  #endif
> +
> +#if defined(CONFIG_RISCV_CUSTOM)
> +#include "custom_cpu_bits.h"
> +#endif
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index fd2e636..1c4dc94 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -137,7 +137,8 @@ static int ctr32(CPURISCVState *env, int csrno)
>      return ctr(env, csrno);
>  }
>
> -#if !defined(CONFIG_USER_ONLY)
> +#pragma GCC diagnostic push
> +#pragma GCC diagnostic ignored "-Wunused-function"

Use __attribute__((__unused__)), so we don't need to use GCC push/pop

>  static int any(CPURISCVState *env, int csrno)
>  {
>      return 0;
> @@ -152,6 +153,25 @@ static int any32(CPURISCVState *env, int csrno)
>      return any(env, csrno);
>
>  }
> +#pragma GCC diagnostic pop
> +
> +/* Machine Information Registers */
> +static int read_zero(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    return *val = 0;
> +}
> +
> +/*
> + * XXX: This is just a write stub for developing custom CSR handler,

Remove XXX

> + * if the behavior of writting such CSR is not presentable in QEMU and doesn't

typo: writing.

Is that present, or presentable?

> + * affect the functionality, just stub it.
> + */
> +static int write_stub(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    return 0;
> +}
> +
> +#if !defined(CONFIG_USER_ONLY)
>
>  static int smode(CPURISCVState *env, int csrno)
>  {
> @@ -435,11 +455,6 @@ static const char valid_vm_1_10_64[16] = {
>      [VM_1_10_SV57] = 1
>  };
>
> -/* Machine Information Registers */
> -static int read_zero(CPURISCVState *env, int csrno, target_ulong *val)
> -{
> -    return *val = 0;
> -}
>
>  static int read_mhartid(CPURISCVState *env, int csrno, target_ulong *val)
>  {
> @@ -1264,6 +1279,18 @@ static int write_pmpaddr(CPURISCVState *env, int csrno, target_ulong val)
>
>  #endif
>
> +
> +#if defined(CONFIG_RISCV_CUSTOM)
> +/* Custom CSR related routines and data structures */
> +
> +static gpointer is_custom_csr(CPURISCVState *env, int csrno)

The function name suggests that the return value should be of bool
type. Suggest we do:

static bool is_custom_csr(CPURISCVState *env, int csrno,
riscv_custom_csr_operations *custom_csr_ops)

> +{
> +    gpointer ret;
> +    ret = g_hash_table_lookup(env->custom_csr_map, GINT_TO_POINTER(csrno));
> +    return ret;
> +}
> +#endif
> +
>  /*
>   * riscv_csrrw - read and/or update control and status register
>   *
> @@ -1273,12 +1300,19 @@ static int write_pmpaddr(CPURISCVState *env, int csrno, target_ulong val)
>   * csrrc  <->  riscv_csrrw(env, csrno, ret_value, 0, value);
>   */
>
> +
> +

Unnecessary changes

>  int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
>                  target_ulong new_value, target_ulong write_mask)
>  {
>      int ret;
>      target_ulong old_value;
>      RISCVCPU *cpu = env_archcpu(env);
> +    #if !defined(CONFIG_RISCV_CUSTOM)

Please make sure #if starts from the beginning of this line, without space ahead

> +    riscv_csr_operations *csrop = &csr_ops[csrno];

nits: name this variable to csr_ops

> +    #else
> +    riscv_csr_operations *csrop;
> +    #endif
>
>      /* check privileges and return -1 if check fails */
>  #if !defined(CONFIG_USER_ONLY)
> @@ -1300,6 +1334,7 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
>          (!env->debugger && (effective_priv < get_field(csrno, 0x300)))) {
>          return -RISCV_EXCP_ILLEGAL_INST;
>      }
> +
>  #endif
>
>      /* ensure the CSR extension is enabled. */
> @@ -1307,27 +1342,43 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
>          return -RISCV_EXCP_ILLEGAL_INST;
>      }
>
> +    /* try handle_custom_csr */
> +
> +    #if defined(CONFIG_RISCV_CUSTOM)
> +    if (unlikely(env->custom_csr_map != NULL)) {
> +        riscv_csr_operations *custom_csr_opset = (riscv_csr_operations *)
> +            is_custom_csr(env, csrno);
> +        if (NULL != custom_csr_opset) {
> +            csrop = custom_csr_opset;
> +            } else {
> +            csrop = &csr_ops[csrno];
> +            }
> +        } else {
> +        csrop = &csr_ops[csrno];
> +        }
> +    #endif
> +
>      /* check predicate */
> -    if (!csr_ops[csrno].predicate) {
> +    if (!csrop->predicate) {
>          return -RISCV_EXCP_ILLEGAL_INST;
>      }
> -    ret = csr_ops[csrno].predicate(env, csrno);
> +    ret = csrop->predicate(env, csrno);
>      if (ret < 0) {
>          return ret;
>      }
>
>      /* execute combined read/write operation if it exists */
> -    if (csr_ops[csrno].op) {
> -        return csr_ops[csrno].op(env, csrno, ret_value, new_value, write_mask);
> +    if (csrop->op) {
> +        return csrop->op(env, csrno, ret_value, new_value, write_mask);
>      }
>
>      /* if no accessor exists then return failure */
> -    if (!csr_ops[csrno].read) {
> +    if (!csrop->read) {
>          return -RISCV_EXCP_ILLEGAL_INST;
>      }
>
>      /* read old value */
> -    ret = csr_ops[csrno].read(env, csrno, &old_value);
> +    ret = csrop->read(env, csrno, &old_value);
>      if (ret < 0) {
>          return ret;
>      }
> @@ -1335,8 +1386,8 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
>      /* write value if writable and write mask set, otherwise drop writes */
>      if (write_mask) {
>          new_value = (old_value & ~write_mask) | (new_value & write_mask);
> -        if (csr_ops[csrno].write) {
> -            ret = csr_ops[csrno].write(env, csrno, new_value);
> +        if (csrop->write) {
> +            ret = csrop->write(env, csrno, new_value);
>              if (ret < 0) {
>                  return ret;
>              }
> @@ -1369,6 +1420,10 @@ int riscv_csrrw_debug(CPURISCVState *env, int csrno, target_ulong *ret_value,
>      return ret;
>  }
>
> +#if defined(CONFIG_RISCV_CUSTOM)
> +/* Include the custom CSR table here. */

nits: remove the ending .

> +#endif
> +
>  /* Control and Status Register function table */
>  riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      /* User Floating-Point CSRs */
> diff --git a/target/riscv/custom_cpu_bits.h b/target/riscv/custom_cpu_bits.h
> new file mode 100644
> index 0000000..5df31f8
> --- /dev/null
> +++ b/target/riscv/custom_cpu_bits.h
> @@ -0,0 +1,8 @@
> +/*
> + * RISC-V cpu bits for custom CSR logic.
> + *
> + * Copyright (c) 2021 Andes Technology Corp.
> + * SPDX-License-Identifier: GPL-2.0+
> + */
> +
> +/* This file is intentionally left blank at this commit. */

nits: remove the ending .

%s/at/in

Regards,
Bin


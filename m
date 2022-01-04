Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09089484A58
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 23:05:40 +0100 (CET)
Received: from localhost ([::1]:45414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4rw2-0004WX-En
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 17:05:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n4ru9-0003Gd-AT
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 17:03:41 -0500
Received: from [2607:f8b0:4864:20::d29] (port=45979
 helo=mail-io1-xd29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n4ru6-0006qg-Su
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 17:03:41 -0500
Received: by mail-io1-xd29.google.com with SMTP id i14so45150275ioj.12
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 14:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+YVBVxKw87k2+u6cGbToAvim02AspMtRICByzBJjrzI=;
 b=e2WmRdgkuaEzf30+Jg+IcpqsES074h59sBxDwSgaZKCQCmk1lEMTxcwGsJlIBmQrRw
 h4ER2QOyuCYem2Vrw6sGAz+/Ph4ObYdWraMjQVSdYxOWiS5ahQ+50fLr7OvMOW9fC9/U
 XBdNe2swtw4zxR4yOZPtxGcfwQ9y3zl6sNbAAVLympghE/nM6XSZKFoFEXp7hOTziaJ9
 xBaA/eUh2P78+rpbpbcpSQtZFNA/gK0wXVgUrTtZ/c1tKGdCNkXsi/Y+ooboPKo+mt3M
 x7Nk+DQUUZtHPVmoX11Vvvp5dKhnRMBSJxbO1VTYQ7JAOKeeVDWScz1w4ogIbiji7j1W
 c2ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+YVBVxKw87k2+u6cGbToAvim02AspMtRICByzBJjrzI=;
 b=Wo3Rx6bBxYGCB1DsU6XCTaIByzzZBky8U6PfTtZqyGbAiFW9sZaycgIOsywf6BEZvl
 2CpKMylvkGNrfXR6+LMSBdbExd53JyVqTU+T9qRC+X1S1ztJTp8kkrh/kIg3ptcBXo2G
 QxXcPa0upIB6O4umCAG7MhKPNyAhV64s4sPdBj0IWyUPFnfkIJy0MdOmz//Jc6CHnH0n
 hK9t/6l8kUygVpqJyOzNXn+rlWZO8+xkLCFD5UoaTSpl86k9woirdgopY+AVO+z12Fhr
 T2od/AQWGQkp57Ddz41blrIkjJyps0JXEf6F81PrHNVxDl4bggHr1YVFLbJxx8AXb8Hd
 1yFg==
X-Gm-Message-State: AOAM533J3kEHB3EwiNE4n75OdPu5OU3F+rW9MjI26z3sofekq+95SPXf
 aygIywF+dg/S/LW4/3YjbTpiDMBfaXjpk9arYhg=
X-Google-Smtp-Source: ABdhPJygcSVbSb0N6vfy2A8V9Y6s5646nolrKG5MwTFNFP2iD9lLKXwclQ+ofk9tbQhIhNuh0fDILoUDrsTtu0oXVGs=
X-Received: by 2002:a02:aa8f:: with SMTP id u15mr23753345jai.63.1641333817558; 
 Tue, 04 Jan 2022 14:03:37 -0800 (PST)
MIME-Version: 1.0
References: <00a79b65-288f-f17c-abe4-fcfd3f7971fd@oth-regensburg.de>
 <cover.1641309725.git.konrad.schwarz@siemens.com>
 <03cb38fdfab89a6725fa0c7cadad2055d6be48a4.1641309725.git.konrad.schwarz@siemens.com>
In-Reply-To: <03cb38fdfab89a6725fa0c7cadad2055d6be48a4.1641309725.git.konrad.schwarz@siemens.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 5 Jan 2022 08:03:11 +1000
Message-ID: <CAKmqyKNq6ewguvDAH_v=4N5qPQAMgZSJNU8pJRC91X-Sh_WvXA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] RISC-V: 'info gmem' to show hypervisor guest ->
 physical address translations
To: Konrad Schwarz <konrad.schwarz@siemens.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 5, 2022 at 1:55 AM Konrad Schwarz
<konrad.schwarz@siemens.com> wrote:
>
> This is analog to the existing 'info mem' command and is implemented
> using the same machinery.
>
> Signed-off-by: Konrad Schwarz <konrad.schwarz@siemens.com>

Hello and thanks for the patches

> ---
>  hmp-commands-info.hx         |  16 +++++
>  include/monitor/hmp-target.h |   2 +
>  target/riscv/monitor.c       | 135 +++++++++++++++++++++++++----------
>  3 files changed, 117 insertions(+), 36 deletions(-)
>
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index 407a1da800..fa519f0129 100644
> --- a/hmp-commands-info.hx
> +++ b/hmp-commands-info.hx
> @@ -237,6 +237,22 @@ SRST
>      Show the active virtual memory mappings.
>  ERST
>
> +#if defined TARGET_RISCV
> +    {
> +        .name       = "gmem",
> +        .args_type  = "",
> +        .params     = "",
> +        .help       = "show the hypervisor guest's physical address"
> +                   " translation",
> +        .cmd        = hmp_info_gmem,
> +    },
> +#endif

I don't think we want RISC-V specific commands. Could we not just
extend `info mem` instead?

> +
> +SRST
> +  ``info gmem``
> +    Show the hypervisor guest's physical address translation.
> +ERST
> +
>      {
>          .name       = "mtree",
>          .args_type  = "flatview:-f,dispatch_tree:-d,owner:-o,disabled:-D",
> diff --git a/include/monitor/hmp-target.h b/include/monitor/hmp-target.h
> index ffdc15a34b..9f2dd976f6 100644
> --- a/include/monitor/hmp-target.h
> +++ b/include/monitor/hmp-target.h
> @@ -2,6 +2,7 @@
>   * QEMU monitor
>   *
>   * Copyright (c) 2003-2004 Fabrice Bellard
> + * Copyright (c) 2021 Siemens AG, konrad.schwarz@siemens.com

Generally you would only add a copyright claim for a very large
change. Adding a single function prototype doesn't really cut it.

>   *
>   * Permission is hereby granted, free of charge, to any person obtaining a copy
>   * of this software and associated documentation files (the "Software"), to deal
> @@ -45,6 +46,7 @@ CPUArchState *mon_get_cpu_env(Monitor *mon);
>  CPUState *mon_get_cpu(Monitor *mon);
>
>  void hmp_info_mem(Monitor *mon, const QDict *qdict);
> +void hmp_info_gmem(Monitor *mon, const QDict *qdict);
>  void hmp_info_tlb(Monitor *mon, const QDict *qdict);
>  void hmp_mce(Monitor *mon, const QDict *qdict);
>  void hmp_info_local_apic(Monitor *mon, const QDict *qdict);
> diff --git a/target/riscv/monitor.c b/target/riscv/monitor.c
> index 3f74ea9934..ad58bdf9ca 100644
> --- a/target/riscv/monitor.c
> +++ b/target/riscv/monitor.c
> @@ -25,16 +25,6 @@
>  #include "monitor/monitor.h"
>  #include "monitor/hmp-target.h"
>
> -#ifdef TARGET_RISCV64
> -#define PTE_HEADER_FIELDS       "vaddr            paddr            "\
> -                                "size             attr\n"
> -#define PTE_HEADER_DELIMITER    "---------------- ---------------- "\
> -                                "---------------- -------\n"
> -#else
> -#define PTE_HEADER_FIELDS       "vaddr    paddr            size     attr\n"
> -#define PTE_HEADER_DELIMITER    "-------- ---------------- -------- -------\n"
> -#endif
> -
>  /* Perform linear address sign extension */
>  static target_ulong addr_canonical(int va_bits, target_ulong addr)
>  {
> @@ -47,10 +37,34 @@ static target_ulong addr_canonical(int va_bits, target_ulong addr)
>      return addr;
>  }
>
> -static void print_pte_header(Monitor *mon)
> +static void print_pte_header(Monitor *mon,
> +        char const vaddr_char, char const paddr_char)
>  {
> -    monitor_printf(mon, PTE_HEADER_FIELDS);
> -    monitor_printf(mon, PTE_HEADER_DELIMITER);
> +
> +# define        VIRTUAL_WIDTH\
> +        ((int) ((sizeof "ff" - sizeof "") * sizeof(target_ulong)))
> +# define        PHYSICAL_WIDTH\
> +        ((int) ((sizeof "ff" - sizeof "") * sizeof(hwaddr)))
> +# define        ATTRIBUTE_WIDTH ((int) (sizeof "rwxugad" - sizeof ""))
> +
> +# define        VIRTUAL_COLUMN_WIDTH    (1 + VIRTUAL_WIDTH)
> +# define        PHYSICAL_COLUMN_WIDTH   (1 + PHYSICAL_WIDTH)
> +
> +    static char const dashes[PHYSICAL_WIDTH] = "----------------";
> +
> +    monitor_printf(mon,
> +            "%c%-*s%c%-*s%-*s%-*s\n"
> +            "%-*.*s%-*.*s%-*.*s%-*.*s\n",
> +
> +            vaddr_char, VIRTUAL_COLUMN_WIDTH - 1, "addr",
> +            paddr_char, PHYSICAL_COLUMN_WIDTH - 1, "addr",
> +            VIRTUAL_COLUMN_WIDTH, "size",
> +            ATTRIBUTE_WIDTH, "attr",
> +
> +            VIRTUAL_COLUMN_WIDTH, VIRTUAL_WIDTH, dashes,
> +            PHYSICAL_COLUMN_WIDTH, PHYSICAL_WIDTH, dashes,
> +            VIRTUAL_COLUMN_WIDTH, VIRTUAL_WIDTH, dashes,
> +            ATTRIBUTE_WIDTH, ATTRIBUTE_WIDTH, dashes);
>  }
>
>  static void print_pte(Monitor *mon, int va_bits, target_ulong vaddr,
> @@ -65,21 +79,36 @@ static void print_pte(Monitor *mon, int va_bits, target_ulong vaddr,
>          return;
>      }
>
> -    monitor_printf(mon, TARGET_FMT_lx " " TARGET_FMT_plx " " TARGET_FMT_lx
> -                   " %c%c%c%c%c%c%c\n",
> -                   addr_canonical(va_bits, vaddr),
> -                   paddr, size,
> -                   attr & PTE_R ? 'r' : '-',
> -                   attr & PTE_W ? 'w' : '-',
> -                   attr & PTE_X ? 'x' : '-',
> -                   attr & PTE_U ? 'u' : '-',
> -                   attr & PTE_G ? 'g' : '-',
> -                   attr & PTE_A ? 'a' : '-',
> -                   attr & PTE_D ? 'd' : '-');
> +# if 4 == TARGET_LONG_SIZE
> +#       define  TARGET_xFMT     PRIx32
> +# elif 8 == TARGET_LONG_SIZE
> +#       define  TARGET_xFMT     PRIx64
> +# else
> +#       error TARGET_LONG_SIZE not handled
> +# endif

You can just use TCG_PRIlx instead

Alistair

> +
> +    /* note: RISC-V physical addresses are actually xlen + 2 bits long
> +    OTHO, QEMU wil probably never support addresses longer than 64 bits */
> +    monitor_printf(mon,
> +            "%-*.*" TARGET_xFMT
> +            "%-*.*" PRIx64
> +            "%-*.*" TARGET_xFMT
> +            "%c%c%c%c%c%c%c\n",
> +            VIRTUAL_COLUMN_WIDTH, VIRTUAL_WIDTH, addr_canonical(va_bits, vaddr),
> +            PHYSICAL_COLUMN_WIDTH, PHYSICAL_WIDTH, paddr,
> +            VIRTUAL_COLUMN_WIDTH, VIRTUAL_WIDTH, size,
> +            attr & PTE_R ? 'r' : '-',
> +            attr & PTE_W ? 'w' : '-',
> +            attr & PTE_X ? 'x' : '-',
> +            attr & PTE_U ? 'u' : '-',
> +            attr & PTE_G ? 'g' : '-',
> +            attr & PTE_A ? 'a' : '-',
> +            attr & PTE_D ? 'd' : '-');
>  }
>
>  static void walk_pte(Monitor *mon, hwaddr base, target_ulong start,
>                       int level, int ptidxbits, int ptesize, int va_bits,
> +                     int guest,
>                       target_ulong *vbase, hwaddr *pbase, hwaddr *last_paddr,
>                       target_ulong *last_size, int *last_attr)
>  {
> @@ -89,7 +118,7 @@ static void walk_pte(Monitor *mon, hwaddr base, target_ulong start,
>      target_ulong pte;
>      int ptshift;
>      int attr;
> -    int idx;
> +    int idx, idx_end;
>
>      if (level < 0) {
>          return;
> @@ -98,7 +127,8 @@ static void walk_pte(Monitor *mon, hwaddr base, target_ulong start,
>      ptshift = level * ptidxbits;
>      pgsize = 1UL << (PGSHIFT + ptshift);
>
> -    for (idx = 0; idx < (1UL << ptidxbits); idx++) {
> +    for (idx = 0, idx_end = 1 << (ptidxbits + (guest ? 2 : 0));
> +            idx_end > idx; idx++) {
>          pte_addr = base + idx * ptesize;
>          cpu_physical_memory_read(pte_addr, &pte, ptesize);
>
> @@ -131,7 +161,9 @@ static void walk_pte(Monitor *mon, hwaddr base, target_ulong start,
>              } else {
>                  /* pointer to the next level of the page table */
>                  walk_pte(mon, paddr, start, level - 1, ptidxbits, ptesize,
> -                         va_bits, vbase, pbase, last_paddr,
> +                         va_bits,
> +                         0 /* guest */,
> +                         vbase, pbase, last_paddr,
>                           last_size, last_attr);
>              }
>          }
> @@ -141,7 +173,9 @@ static void walk_pte(Monitor *mon, hwaddr base, target_ulong start,
>
>  }
>
> -static void mem_info_svxx(Monitor *mon, CPUArchState *env)
> +static void mem_info_svxx(Monitor *mon, CPUArchState *env,
> +        target_ulong const atp,
> +        int guest, char const vaddr_char, char const paddr_char)
>  {
>      int levels, ptidxbits, ptesize, vm, va_bits;
>      hwaddr base;
> @@ -152,11 +186,11 @@ static void mem_info_svxx(Monitor *mon, CPUArchState *env)
>      int last_attr;
>
>      if (riscv_cpu_mxl(env) == MXL_RV32) {
> -        base = (hwaddr)get_field(env->satp, SATP32_PPN) << PGSHIFT;
> -        vm = get_field(env->satp, SATP32_MODE);
> +        base = (hwaddr)get_field(atp, SATP32_PPN) << PGSHIFT;
> +        vm = get_field(atp, SATP32_MODE);
>      } else {
> -        base = (hwaddr)get_field(env->satp, SATP64_PPN) << PGSHIFT;
> -        vm = get_field(env->satp, SATP64_MODE);
> +        base = (hwaddr)get_field(atp, SATP64_PPN) << PGSHIFT;
> +        vm = get_field(atp, SATP64_MODE);
>      }
>
>      switch (vm) {
> @@ -189,7 +223,7 @@ static void mem_info_svxx(Monitor *mon, CPUArchState *env)
>      va_bits = PGSHIFT + levels * ptidxbits;
>
>      /* print header */
> -    print_pte_header(mon);
> +    print_pte_header(mon, vaddr_char, paddr_char);
>
>      vbase = -1;
>      pbase = -1;
> @@ -199,6 +233,7 @@ static void mem_info_svxx(Monitor *mon, CPUArchState *env)
>
>      /* walk page tables, starting from address 0 */
>      walk_pte(mon, base, 0, levels - 1, ptidxbits, ptesize, va_bits,
> +             guest,
>               &vbase, &pbase, &last_paddr, &last_size, &last_attr);
>
>      /* don't forget the last one */
> @@ -209,6 +244,7 @@ static void mem_info_svxx(Monitor *mon, CPUArchState *env)
>  void hmp_info_mem(Monitor *mon, const QDict *qdict)
>  {
>      CPUArchState *env;
> +    target_ulong atp;
>
>      env = mon_get_cpu_env(mon);
>      if (!env) {
> @@ -221,19 +257,46 @@ void hmp_info_mem(Monitor *mon, const QDict *qdict)
>          return;
>      }
>
> +    atp = env->satp;
>      if (riscv_cpu_mxl(env) == MXL_RV32) {
> -        if (!(env->satp & SATP32_MODE)) {
> +        if (!(atp & SATP32_MODE)) {
>              monitor_printf(mon, "No translation or protection\n");
>              return;
>          }
>      } else {
> -        if (!(env->satp & SATP64_MODE)) {
> +        if (!(atp & SATP64_MODE)) {
>              monitor_printf(mon, "No translation or protection\n");
>              return;
>          }
>      }
>
> -    mem_info_svxx(mon, env);
> +    mem_info_svxx(mon, env, atp, 0, 'v', 'p');
> +}
> +
> +void hmp_info_gmem(Monitor *mon, const QDict *qdict)
> +{
> +    CPUArchState *env;
> +    target_ulong atp;
> +
> +    env = mon_get_cpu_env(mon);
> +    if (!env) {
> +        monitor_printf(mon, "No CPU available\n");
> +        return;
> +    }
> +
> +    if (!riscv_has_ext(env, RVH)) {
> +        monitor_printf(mon, "hypervisor extension not available\n");
> +        return;
> +    }
> +
> +    atp = env->hgatp;
> +    if (!((MXL_RV32 == riscv_cpu_mxl(env) ? SATP32_MODE : SATP64_MODE)
> +            & atp)) {
> +        monitor_printf(mon, "No translation or protection\n");
> +        return;
> +    }
> +
> +    mem_info_svxx(mon, env, atp, 1, 'g', 'p');
>  }
>
>  static const MonitorDef monitor_defs[] = {
> --
> Konrad Schwarz
>
>


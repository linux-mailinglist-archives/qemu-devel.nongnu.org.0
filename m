Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E982ED53D
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 18:14:50 +0100 (CET)
Received: from localhost ([::1]:53224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxYs5-0000dZ-75
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 12:14:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kxYqD-00083c-Tp; Thu, 07 Jan 2021 12:12:53 -0500
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:44680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kxYqC-0001Pe-Ca; Thu, 07 Jan 2021 12:12:53 -0500
Received: by mail-il1-x12b.google.com with SMTP id r17so7373265ilo.11;
 Thu, 07 Jan 2021 09:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3hqgAn8ppZNyZKrkQqHjs1Tg3157tEgbdJS8oMrQ/IA=;
 b=K9Ey4FYF+AK+Wbm8KUJPoczdVmTv7tYwd870KyoDHofOf9hb18FHcMSWNvtKpBEmte
 3qk6I9//6GFjB58GV9vUX+vCWkKIlyT7+/N+35lAW4Q7Jk73csGipSBHg39iTFwJUNcM
 VFI8X1c3OcVW6ghR5R+x0oRoWqE9RPcHp8qCj6/T8ZqNqUth0y3ySm1RZjl23Rwa0Grj
 QRBFWfmVJw8OlzbfiOMVgHVyU2OmJL0xQCIwH7nDumygD+WljwW1BM5+ycG+NdEmWQCo
 O7g0JNAERDC7pKcjg8vY6quoD/T/f3wKhzu/Vj/Mukzh6FNyMtbLrd3YtCL/vW79LB8k
 oD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3hqgAn8ppZNyZKrkQqHjs1Tg3157tEgbdJS8oMrQ/IA=;
 b=pzwa/+C8LlCTHEvUK0163Q+NAnWlK8LFhD0QZwf/W4M0JzOqrc1sRp7Yx39mOuGw3r
 oAAq3ep/Jwm+O7S0G2qIRDHcf3BSqpwKCCfPkMemaLDkffME2nsHtUA3pgu8GGX6J2y2
 Ci72sT/Rm9p2wqS6T2H17NAZmZNK4U0nQqAHvunspkmJJGZaKoc8ZEaeZSFygzdh3oXs
 ISHGF4GTPiLY5FXaz9m9ixiQo6y/DcEv4NeBYSaNUwdYxgZ/+nZdnHSvmxQ2JyhZIKH9
 PTYe3jgDmH+3PFfihx9WirGp5njKyvcbJ+0C+1zp2HqFNP09HDjRvnfSd2xy/A1nMkzP
 1WJg==
X-Gm-Message-State: AOAM533/7gy3CoddpJA1qz3yKysftKafSmIe+9QYMIZJwAwdcuk9c7xN
 GnlA/NBEXgdf5QHAYx7HtHYRV8CVq+j9YJgSBsQ=
X-Google-Smtp-Source: ABdhPJyI2HXyfH3vcrIHNcoOjCB2PXJ3nw4YzpcdhPdD0ri6Zpb52jRtyrSBAAKMwJD705b/8d4eGonovufRO4jO4DM=
X-Received: by 2002:a92:dc0f:: with SMTP id t15mr9925770iln.267.1610039570576; 
 Thu, 07 Jan 2021 09:12:50 -0800 (PST)
MIME-Version: 1.0
References: <20210106204141.14027-1-sylvain.pelissier@gmail.com>
In-Reply-To: <20210106204141.14027-1-sylvain.pelissier@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 7 Jan 2021 09:12:23 -0800
Message-ID: <CAKmqyKO-kyg49W2pVVpO538DrS-z=-YonKfqWY0+yTBm3_j2Og@mail.gmail.com>
Subject: Re: [PATCH v4] gdb: riscv: Add target description
To: Sylvain Pelissier <sylvain.pelissier@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12b.google.com
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
Cc: "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 6, 2021 at 12:42 PM Sylvain Pelissier
<sylvain.pelissier@gmail.com> wrote:
>
> Target description is not currently implemented in RISC-V
> architecture. Thus GDB won't set it properly when attached.
> The patch implements the target description response.
>
> Signed-off-by: Sylvain Pelissier <sylvain.pelissier@gmail.com>
> Reviewed-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Thanks for addressing all of the comments.

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/cpu.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 254cd83f8b..ed4971978b 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -556,6 +556,18 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> +static gchar *riscv_gdb_arch_name(CPUState *cs)
> +{
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +    CPURISCVState *env = &cpu->env;
> +
> +    if (riscv_cpu_is_32bit(env)) {
> +        return g_strdup("riscv:rv32");
> +    } else {
> +        return g_strdup("riscv:rv64");
> +    }
> +}
> +
>  static void riscv_cpu_class_init(ObjectClass *c, void *data)
>  {
>      RISCVCPUClass *mcc = RISCV_CPU_CLASS(c);
> @@ -591,6 +603,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
>      /* For now, mark unmigratable: */
>      cc->vmsd = &vmstate_riscv_cpu;
>  #endif
> +    cc->gdb_arch_name = riscv_gdb_arch_name;
>  #ifdef CONFIG_TCG
>      cc->tcg_initialize = riscv_translate_init;
>      cc->tlb_fill = riscv_cpu_tlb_fill;
> --
> 2.25.1
>
>


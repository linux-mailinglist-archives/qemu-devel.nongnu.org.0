Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1CF6988CB
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 00:36:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSRJq-00075K-LE; Wed, 15 Feb 2023 18:36:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pSRJl-00074G-Gt
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 18:36:05 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pSRJi-000275-Me
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 18:36:05 -0500
Received: by mail-ed1-x52a.google.com with SMTP id w3so555531edc.2
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 15:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7uuXeuwIdgI6BMWs1jsgteBQ2oOQtfq1YpeuIqpO4KQ=;
 b=CpWUGLsXsparsnHLcwW5tIIbXzjiqeu2zn9y2537PbgkWyV+7XKLlB6kh+VKlHa9l1
 Q25OQO65AC0aaCu5sD4EyHeu7oSsC7PuPoJibPsRQIkkut8f2IAAuWFkekWflf9pgkOJ
 N2dOvOzV8h9JiedlxE5DE1U7A8RalBhMoO/t48e+LnqyZu5YypLs8fnm5ruPxyhW6KHs
 VVKtJYBc2Wh7nEVcweJ10PVs1fioz+VRlWKThvm2+KjmfWxzVMr77HVpwh3UM9KfJJkR
 XKwA+8OGn+0yll5F6pBtmmYTHen8/U09w28ydfDSRZBqZVMrCjRhts0ydjuc/6OirDl+
 qHvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7uuXeuwIdgI6BMWs1jsgteBQ2oOQtfq1YpeuIqpO4KQ=;
 b=2lSeM3HyxlgmhS8s87cyMbytGKi2qdiD1g6g9q2NqDZ4WQH2k4V//0Wr3aHFdRJ9rv
 A3erzacNxCSA6zE3p0/4/+Ga8zGoRjScowdaaIs/9N48mbKfMEfunzmpBm4qQfdKdgYL
 lQXn79o/+AOB+GCAAh+H+t92KOe+o0G895rFeTEr/n+p9OFfyd9suGHSMoAjSePEZ2a9
 tv6Mqdr7Srs0SWDchgQQ3LcRlYPsOnbUJa+frvTH/q7OdssbK21j6vwEocuar1m60RCC
 eCZiV2lxlQTLQXHxdVMfH9ZLL0e8BFoCCFUd47L7OJlnphYX/pMD2tztblPyXA8ifd+F
 90UA==
X-Gm-Message-State: AO0yUKU9LUHseSi/TPu1Nq/5NMyP4v0sQc6Rw7CQ5uQocH/WD+hNgAKu
 HFnEdkMie5K4hiVCXBBTAsKdLI/Uq06nIJWca8pTmugon4RI6g==
X-Google-Smtp-Source: AK7set/o8sTjS+X1jdOHI9xmfLikG5Iya5GEXvUJRri26BuTogpmOJQxCcst/6nOFXSdwK1n5VwZs2lNvUv3DF2VQRE=
X-Received: by 2002:a50:ce42:0:b0:4ac:373f:4e9d with SMTP id
 k2-20020a50ce42000000b004ac373f4e9dmr2165367edj.1.1676504160572; Wed, 15 Feb
 2023 15:36:00 -0800 (PST)
MIME-Version: 1.0
References: <20230209062404.3582018-1-debug@rivosinc.com>
 <20230209062404.3582018-5-debug@rivosinc.com>
 <52823708-4a64-cba9-ef7a-408ffde21b31@linux.alibaba.com>
In-Reply-To: <52823708-4a64-cba9-ef7a-408ffde21b31@linux.alibaba.com>
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 15 Feb 2023 15:35:41 -0800
Message-ID: <CAKC1njTsPRudWjAEdrD1X-8hMRkWYWtsnpT3pZfMROhfMMbGhQ@mail.gmail.com>
Subject: Re: [PATCH v1 RFC Zisslpcfi 4/9] target/riscv: helper functions for
 forward and backward cfi
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, 
 Kip Walker <kip@rivosinc.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=debug@rivosinc.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, Feb 14, 2023 at 10:26 PM LIU Zhiwei
<zhiwei_liu@linux.alibaba.com> wrote:
>
>
> On 2023/2/9 14:23, Deepak Gupta wrote:
> > Implementation for forward cfi and backward cfi needs helper function
> > to determine if currently fcfi and bcfi are enabled. Enable depends on
> > privilege mode and settings in sstatus/menvcfg/henvcfg/mseccfg CSRs.
> >
> > Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> > Signed-off-by: Kip Walker  <kip@rivosinc.com>
> > ---
> >   target/riscv/cpu.h        |  2 ++
> >   target/riscv/cpu_helper.c | 51 +++++++++++++++++++++++++++++++++++++++
> >   2 files changed, 53 insertions(+)
> >
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index 18db61a06a..d14ea4f91d 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -568,6 +568,8 @@ bool riscv_cpu_virt_enabled(CPURISCVState *env);
> >   void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
> >   bool riscv_cpu_two_stage_lookup(int mmu_idx);
> >   int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch);
> > +bool cpu_get_fcfien(CPURISCVState *env);
> > +bool cpu_get_bcfien(CPURISCVState *env);
> >   hwaddr riscv_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
> >   G_NORETURN void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
> >                                                  MMUAccessType access_type, int mmu_idx,
> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > index 9a28816521..a397023840 100644
> > --- a/target/riscv/cpu_helper.c
> > +++ b/target/riscv/cpu_helper.c
> > @@ -30,6 +30,7 @@
> >   #include "sysemu/cpu-timers.h"
> >   #include "cpu_bits.h"
> >   #include "debug.h"
> > +#include "pmp.h"
> >
> >   int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
> >   {
> > @@ -40,6 +41,56 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
> >   #endif
> >   }
> >
> > +bool cpu_get_fcfien(CPURISCVState *env)
> > +{
> > +#ifdef CONFIG_USER_ONLY
> > +    return false;
> > +#else
> > +    /* no cfi extension, return false */
> > +    if (!env_archcpu(env)->cfg.ext_cfi) {
> > +        return false;
> > +    }
> > +
> > +    switch (env->priv) {
> > +    case PRV_U:
> > +        return (env->mstatus & MSTATUS_UFCFIEN) ? true : false;
>
> It's not right. We should also check for menvcfg.cfie. The same to other
> checks in S mode or U mode.
>

Yes you're right. I lost that check in one of the re-factoring.
Thanks. Will fix it.

> Zhiwei
>
> > +    case PRV_S:
> > +        return (env->menvcfg & MENVCFG_SFCFIEN) ? true : false;
> > +    case PRV_M:
> > +        return (env->mseccfg & MSECCFG_MFCFIEN) ? true : false;
> > +    default:
> > +        g_assert_not_reached();
> > +    }
> > +#endif
> > +}
> > +
> > +bool cpu_get_bcfien(CPURISCVState *env)
> > +{
> > +#ifdef CONFIG_USER_ONLY
> > +    return false;
> > +#else
> > +    /* no cfi extension, return false */
> > +    if (!env_archcpu(env)->cfg.ext_cfi) {
> > +        return false;
> > +    }
> > +
> > +    switch (env->priv) {
> > +    case PRV_U:
> > +        return (env->mstatus & MSTATUS_UBCFIEN) ? true : false;
> > +
> > +        /*
> > +         * no gating for back cfi in M/S mode. back cfi is always on for
> > +         * M/S mode
> > +         */
> > +    case PRV_S:
> > +    case PRV_M:
> > +        return true;
> > +    default:
> > +        g_assert_not_reached();
> > +    }
> > +#endif
> > +}
> > +
> >   void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
> >                             target_ulong *cs_base, uint32_t *pflags)
> >   {


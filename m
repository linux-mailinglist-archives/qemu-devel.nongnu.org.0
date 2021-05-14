Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDE438026A
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 05:19:53 +0200 (CEST)
Received: from localhost ([::1]:46418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhOMi-0007mI-BZ
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 23:19:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lhOLP-0006N4-0n; Thu, 13 May 2021 23:18:31 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:44639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lhOLN-0007a1-FN; Thu, 13 May 2021 23:18:30 -0400
Received: by mail-yb1-xb36.google.com with SMTP id h202so37178983ybg.11;
 Thu, 13 May 2021 20:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pU5os8rDGZnlafLROSojoJt7m6u8Z+1HkGVuw1/XriQ=;
 b=kde6Mlc9pU8aeTLLQdHZT7buteJXhsZD/L4E0QusSFSKDg9t/YHc4kvdFW6Sa8Cs2M
 9K6nSoeJvb1xr6Vtipk8WYNxVOaBSb9FZVb19B5tazivm77ZTe+hyBBmsQmR/relLQmq
 S8pu8cd0Q5Fv39fLRLB5jK6a1UeW/VW2ZvgLc0VICyvVF5q44ksAfQ5jTHSmFnCmImdR
 AILULPW+cylIDjXdAHWYv+NJT6GRVNx4RpxV7LHLfAjoK0wYAayglSfkeALwTV+QTIZz
 Uzy3uBrZ3AiUyHR0olBIC7LZH/Hz5HMIFKHQrSOnft+eFyBR1qsoYvo/eFjD+xN6aewU
 SBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pU5os8rDGZnlafLROSojoJt7m6u8Z+1HkGVuw1/XriQ=;
 b=px5vsjIO1WejvAy4pCdGzdcxjFq7gjoWGHJjmM31kGvi0y/BVLv3alc/xuE2MdzpcT
 PqzW4qXr7nnkTbokmCrDbIxq2BG9rv3KnRIJFdLY+xGF9Y0k9LFUXHVI4V2uFtTQr8mQ
 MA4m4nvJLCN+4zGbluFRaR09u71J8dUOvxcyQP1s6bNvUFlAvTWLZ1eq2MIzNg591mKd
 b+svFsWjJ+5VdcBNbJ1lZuGSOMFo+TZ1xbpJvwgpYMrXiXNJ4UwyO2MEl5c3wpMnjO2a
 5nMK0FK/eomQEqWLAmoL/yJBVryiSi+BhQPyiC373yA/RvF6+Fdvo+8YaZhf8Wgktx0Y
 29Wg==
X-Gm-Message-State: AOAM533JXXifyz+r9n1jUiiakwrhU31kaWddky5NV5rZI7/MGQoP6p9t
 EOyZ+qjqf0k05RUNqsN6ZGDRWaG9JGYH2NqJNrg=
X-Google-Smtp-Source: ABdhPJziC/jBEezDvUN1qeVUfsY0wXdIF6LYuSOA5z06GKl5eAtzlPa5tu0ZAJhITIaNf0Yx21uLVvNk0deumFT6wEQ=
X-Received: by 2002:a25:aae1:: with SMTP id t88mr59403004ybi.122.1620962308204; 
 Thu, 13 May 2021 20:18:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210428122528.295103-1-changbin.du@gmail.com>
In-Reply-To: <20210428122528.295103-1-changbin.du@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 14 May 2021 11:18:15 +0800
Message-ID: <CAEUhbmWY=-840tdFei2fKhOWDvzHsu2RHMkV7t+wY-V9gSGN+A@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Dump CSR mscratch/sscratch/satp
To: Changbin Du <changbin.du@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb36.google.com
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 28, 2021 at 8:29 PM Changbin Du <changbin.du@gmail.com> wrote:
>
> This dumps the CSR mscratch/sscratch/satp and meanwhile aligns
> the output of CSR mtval/stval.
>
> Signed-off-by: Changbin Du <changbin.du@gmail.com>
> ---
>  target/riscv/cpu.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 7d6ed80f6b67..73af6f5445ba 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -281,12 +281,15 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>      if (riscv_has_ext(env, RVH)) {
>          qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vscause ", env->vscause);
>      }
> -    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtval ", env->mtval);
> -    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "stval ", env->sbadaddr);
> +    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtval   ", env->mtval);
> +    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "stval   ", env->sbadaddr);
>      if (riscv_has_ext(env, RVH)) {
>          qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "htval ", env->htval);
>          qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtval2 ", env->mtval2);

I believe you also need some alignment for these 2

>      }
> +    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mscratch", env->mscratch);
> +    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "sscratch", env->sscratch);
> +    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "satp    ", env->satp);
>  #endif
>
>      for (i = 0; i < 32; i++) {

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>


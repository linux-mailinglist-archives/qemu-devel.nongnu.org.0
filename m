Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C3951A356
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 17:11:46 +0200 (CEST)
Received: from localhost ([::1]:49896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmGfI-0006vG-SM
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 11:11:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nmGe8-0006Ak-2C
 for qemu-devel@nongnu.org; Wed, 04 May 2022 11:10:32 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:35445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nmGe6-0000wU-Je
 for qemu-devel@nongnu.org; Wed, 04 May 2022 11:10:31 -0400
Received: by mail-io1-xd2e.google.com with SMTP id f4so1802238iov.2
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 08:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XabFLlCeCgVtD6+4MI6dTbmjvDydpqizDkWqS/Ap7Sw=;
 b=A177Mjot7ndYI8KtBQNahomReq5Jfx8PvQiG/b/3X/mf6Rzu8Qdc7lFUr//vNEnpy+
 cNTSit4gv3gOg/OYgW4Eg4lc7ICCGHEf4XH5uTwNzb6Vayf+4Z+Uj0ZETT3EkCgmzCkC
 sB4mA80W3zfp5FYgrb3EhZegD6UjBPE8IZKi8OPgEqU/kIEuOjmA6bC3AwB2v+r0sJRA
 rWxhysTeNzY4/rkR5JavqcCrKA0hE8Me44YEfrKpEZVjYNY2PSJYD0MG+BtKWPny89KA
 BZJsbQ1SHNu+3esj8vKBA/tQY4R+hnd6i3Xm88Sqb7j10Ul0CwIj3gX46KhUvwYhUxB8
 dX2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XabFLlCeCgVtD6+4MI6dTbmjvDydpqizDkWqS/Ap7Sw=;
 b=HnKRIDBSM/cfbuYZ7WKwRCz8GDzy6wBLrnwFhphScm3cTVmSNm6dm9YmYUhgliCXTI
 GPXLg8T2BEgcDxIMdDx8ihBMJoNi5PjL6k4tWOA7j1X/eTRJakLofEUDoedkGd/iPcAb
 pOQsZsTTM/uiba5+M11Dg2lZuZxUL/i05C30m99HYC/BvDbYdbQjP11xtK3lV6o67XQb
 pvjjiw4oKg8pIzRa0Hr0JcgCaPo4z0MyvuHtW1vxhdjJuPOEjHsY4KtsixDg1f905+Df
 PsqdSp5djd6g2M+D2wbiGS9tSrk15qADTDFqJG8sG2Hyo2pJIXrNYVUKFwnp+pMhm0Ur
 ng2g==
X-Gm-Message-State: AOAM530qHUSznkQHRT+mChNegM6YnBvKdSkOlPdDYgLScpWWj1Svh/7x
 7PGDpd4tezLaZSwjQ3nt5HYf3Bs/zSfWOJZywsQFjlVI1+lwO1NkTJQ=
X-Google-Smtp-Source: ABdhPJxwZDuNQs6RbUlgSQWQsJMhdRvP9IWzC6BBrVjn+wMHQsXq33W2UZjyLftfnXLoBFmD0fZaIbi3AyQkC7kIYX0=
X-Received: by 2002:a05:6638:14c1:b0:32a:aa03:93e1 with SMTP id
 l1-20020a05663814c100b0032aaa0393e1mr9485867jak.66.1651677029491; Wed, 04 May
 2022 08:10:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220504043105.2574-1-shuizhuyuanluo@126.com>
In-Reply-To: <20220504043105.2574-1-shuizhuyuanluo@126.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 5 May 2022 01:10:03 +1000
Message-ID: <CAKmqyKPbTh87h=_ibuXBS=TAdF3MxdQ0r=ojwrqci4fUsm+z4A@mail.gmail.com>
Subject: Re: [PATCH] linux-user: Expose risc-v V and H isa bit in
 get_elf_hwcap()
To: nihui <shuizhuyuanluo@126.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 4, 2022 at 2:32 PM nihui <shuizhuyuanluo@126.com> wrote:
>
> This patch brings the optional risc-v vector and hypervisor bits
> in hwcap so that application could detect these isa support from
> /proc/self/auxv correctly in qemu userspace mode.
>
> Signed-off-by: Ni Hui <shuizhuyuanluo@126.com>
> ---
>  linux-user/elfload.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 61063fd974..3f0ef2b8f6 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -1484,7 +1484,8 @@ static uint32_t get_elf_hwcap(void)
>  #define MISA_BIT(EXT) (1 << (EXT - 'A'))
>      RISCVCPU *cpu = RISCV_CPU(thread_cpu);
>      uint32_t mask = MISA_BIT('I') | MISA_BIT('M') | MISA_BIT('A')
> -                    | MISA_BIT('F') | MISA_BIT('D') | MISA_BIT('C');
> +                    | MISA_BIT('F') | MISA_BIT('D') | MISA_BIT('C')
> +                    | MISA_BIT('V') | MISA_BIT('H');

The kernel doesn't support H or V. I understand V should be supported
in the future, but what is the use case for H?

Alistair

>
>      return cpu->env.misa_ext & mask;
>  #undef MISA_BIT
> --
> 2.25.1
>
>


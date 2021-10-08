Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD641426725
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 11:49:44 +0200 (CEST)
Received: from localhost ([::1]:41844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYmVb-0005Wq-L4
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 05:49:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rpathak@ventanamicro.com>)
 id 1mYmTg-0004gw-EF
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 05:47:44 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:34427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rpathak@ventanamicro.com>)
 id 1mYmTe-0003Gj-S6
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 05:47:44 -0400
Received: by mail-ed1-x52d.google.com with SMTP id g10so33242591edj.1
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 02:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+JUrYc6P16NZzBkzvzqyOHjP5/4wv/mYZ80N/CFD/Zk=;
 b=HmzoD5SP5E+KvQzTtXkwCLq9ZVX4ZElK6DAzBzLdqibmiQA1w9FDc1yIk4M7Rly3N1
 Sn7bC2GDVOr4E/jgwAdungxrubFJdG9fQiYBhikQtOhYGq80xss5tqe8G37rWr0W2W82
 JVe6TCnZZw/bgZ6uK0Mxkz4IcMyqcjWEHeS/BYQradD3kBr8J1IqpokK2aIlqk1e9gx9
 Si30gLN/LDWYzUhn7vHFuaTveZA3F52zdWqITBevM0GGqPwpQKONS48lU1bMjutGlmxW
 Jx+zJsxEnbkXo194zSUAKERJAql9mcOj3qboKD278fczxDvxYBabWhjSXTM1lGnOB7s/
 vb9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+JUrYc6P16NZzBkzvzqyOHjP5/4wv/mYZ80N/CFD/Zk=;
 b=2oy2YeHUcM0KFxINqk9Q6RYQIvW3/uiyl7S72qp2YGnun/PeJt4Q2lKbyozJDcaUaq
 nWe6daWWfbEJWWe3IAqOKwFTo42KGNljFRR8mZJTSzr5lEhGzojYgmcFRcZcN5/EaoPU
 Tz4WI2YO1Q5Mc+3IA5DV/mP2OO7OhV/0dGkOKforhyF8PAoCOJ1wBXlNaVzdB5KafryS
 Yg8DjCGsiT9GtUfhs1IpgR9ZSIHwy5NtJQ3IblYKk95QGMsWZYDwSqlJtCdSK64n03pX
 7ct34r1F8oS8KSL64hgmDfgPThlShMWeSMirKOdW30kpv8qudQkQfCGfym80dM/+giVY
 iDpQ==
X-Gm-Message-State: AOAM533Gl4bTMmSYVKKzmS69Pj89gGHF1lNb01y+KmK5w/SjcoSUabfp
 sl37oUB0DPYrXSc5NVm72gOMdgbxuh1QNp4KKK2C1Q==
X-Google-Smtp-Source: ABdhPJzg3tZyDkvQapcTlEexBTjASM9watTXvK151i8Ra1IQ94KGsv/D9re64H5fhNqyEyKJhQ9CYtnvqrbZWdMlAco=
X-Received: by 2002:a05:6402:1a3a:: with SMTP id
 be26mr13688358edb.356.1633686459978; 
 Fri, 08 Oct 2021 02:47:39 -0700 (PDT)
MIME-Version: 1.0
References: <20211003112855.960081-1-rpathak@ventanamicro.com>
 <CAEUhbmUsMrSvQHWWoFRzdUuOyxcaaw=L7h7tk0f5_wsd692=ow@mail.gmail.com>
In-Reply-To: <CAEUhbmUsMrSvQHWWoFRzdUuOyxcaaw=L7h7tk0f5_wsd692=ow@mail.gmail.com>
From: Rahul Pathak <rpathak@ventanamicro.com>
Date: Fri, 8 Oct 2021 15:17:04 +0530
Message-ID: <CA+Oz1=YrvVA2q=Pg6_vwRmQgLgMEwxirTM-pgAkNcCk+Lj2TVw@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: csr: Implement mconfigptr CSR
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=rpathak@ventanamicro.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, pathakraul@gmail.com,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Bin


On Thu, Oct 7, 2021 at 11:07 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Sun, Oct 3, 2021 at 7:29 PM Rahul Pathak <rpathak@ventanamicro.com> wrote:
> >
> > mconfigptr is an mandatory CSR as per the priv spec.
>
> %s/an/a
>

Done

>
> as per the priv spec v1.12
>
> > This csr holds the physical address of the configuration
> > data structure if this data structure is implemented
> > Its an readonly csr set to zero making configuration
> > data structure not supported.
> >
> > Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
> > ---
> >  target/riscv/cpu_bits.h | 1 +
> >  target/riscv/csr.c      | 1 +
> >  2 files changed, 2 insertions(+)
> >
> > diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> > index 999187a9ee..5dc4729ed5 100644
> > --- a/target/riscv/cpu_bits.h
> > +++ b/target/riscv/cpu_bits.h
> > @@ -140,6 +140,7 @@
> >  #define CSR_MARCHID         0xf12
> >  #define CSR_MIMPID          0xf13
> >  #define CSR_MHARTID         0xf14
> > +#define CSR_MCONFIGPTR      0xf15
> >
> >  /* Machine Trap Setup */
> >  #define CSR_MSTATUS         0x300
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index 23fbbd3216..2182943f54 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -1549,6 +1549,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
> >      [CSR_MARCHID]   = { "marchid",   any,   read_zero    },
> >      [CSR_MIMPID]    = { "mimpid",    any,   read_zero    },
> >      [CSR_MHARTID]   = { "mhartid",   any,   read_mhartid },
> > +    [CSR_MCONFIGPTR] = {"mconfigptr", any,  read_zero    },
>
> Not any, as we need to check the priv version >= 1.12


To check the priv version, I am thinking of creating a generic
predicate function
which checks the env->priv_ver.?
Generic predicate function for the priv version can be reused in other such
scenarios also.


>
> >
> >      /* Machine Trap Setup */
> >      [CSR_MSTATUS]     = { "mstatus",    any,   read_mstatus,     write_mstatus     },
> > --
>
> Regards,
> Bin


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAA66E1BD8
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 07:43:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnCCt-0003DM-2S; Fri, 14 Apr 2023 01:42:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1pnCCr-0003Cy-0Z
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 01:42:45 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1pnCCo-0006LW-P5
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 01:42:44 -0400
Received: by mail-qt1-x829.google.com with SMTP id l16so5421037qtv.1
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 22:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681450962; x=1684042962;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IfptujO1LGXVBYlQSYvzLW9qC2T6m4kGNwATCmv4K8o=;
 b=k4VUUKDVQVYvVYekjhcs0Z/lMzU13TkqtEkc0S123hpUcvGYxB4WJQoM6TTsVORSG5
 aPN6/Pi1+35Tbobb+NQ+p59Fxrx0dF8iAJdeMRDgXwLxUaN8dW7IQH2evrdeeuxgd+wY
 W9IwZRkqlZjMPeaU/BZmqSFMLPkhjxOovKzHbbBdnI/MtqXHXqZbW6ofzphB7A+C2iha
 45b7TH+BIxC3UyhzcndMqKkEm8RfqfCS3sXpnfLNVJMd7puvvOR7BHSu9LoM/XEX/ekL
 0nLLXaqTqFJLJxraXEQInv/F0GfuYBU0e7Wk8viIP9ZQIdTQUWicwHisa4uW8pROb0yJ
 bRuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681450962; x=1684042962;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IfptujO1LGXVBYlQSYvzLW9qC2T6m4kGNwATCmv4K8o=;
 b=EAdUGuFobKRaGLPO+sQYEDV59AWPC2lz+WSgogle5XXk/SZkhUdRauvo0W6iWFmDqG
 K57nBZrTT6MCcgjHa2aFCj1gk5TWH2P2dqefkXPAh6fM3ZSV9OIS1IDoK3TZ4IsXufBJ
 U5o0dd4bzPN36WlEJB0GJN8MJagieFRweIWTDD1VgI7owDsQduQLNgrAtbScf8k8ZEkx
 dXeWOyEkOCIPv41Uwk7N0K7tcwVmJQSGB9fsLXx12HeFjSvLPUQo3i/dRLF3oQ7yQZ/z
 iJtJ/BX6tLQlEIEP4J3Bxh4RVZQCP1XVYWR683/AWkY04m/cD5wYUwRxeb13H9DuRKF3
 q2vA==
X-Gm-Message-State: AAQBX9c3udFiSgJJXhh9L1lSdSQArBIvhJcqP9khRe7ENsTQF6409eJz
 DsZCgYLKZry25oVqA0rxtErJs4jOOiiZX7PwQEnrlA==
X-Google-Smtp-Source: AKy350Y0ydJ9YG8AXaXNgG2PKqI0O3zh1lHe1qRRLTsOYJdGhSzf40j0gET0bQyWK5HK0XvUgnMxnVZdvZBJtDcY0zE=
X-Received: by 2002:a05:622a:281:b0:3e0:c4ac:1620 with SMTP id
 z1-20020a05622a028100b003e0c4ac1620mr1533661qtw.13.1681450961728; Thu, 13 Apr
 2023 22:42:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230410141316.3317474-1-mchitale@ventanamicro.com>
 <20230410141316.3317474-4-mchitale@ventanamicro.com>
 <8077963d-2c08-35de-06c1-9cef9d361651@iscas.ac.cn>
In-Reply-To: <8077963d-2c08-35de-06c1-9cef9d361651@iscas.ac.cn>
From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Fri, 14 Apr 2023 11:12:05 +0530
Message-ID: <CAN37VV4vvHKGguUsgceHNpW3s89+OqetwKFKpp-5BGNqZuO2TQ@mail.gmail.com>
Subject: Re: [RFC PATCH 3/4] target/riscv: check smstateen fcsr flag
To: liweiwei <liweiwei@iscas.ac.cn>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Alistair Francis <alistair23@gmail.com>,
 Daniel Barboza <dbarboza@ventanamicro.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=mchitale@ventanamicro.com; helo=mail-qt1-x829.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Mon, Apr 10, 2023 at 8:00=E2=80=AFPM liweiwei <liweiwei@iscas.ac.cn> wro=
te:
>
>
> On 2023/4/10 22:13, Mayuresh Chitale wrote:
> > If misa.F and smstateen_fcsr_ok flag are clear then all the floating
> > point instructions must generate an appropriate exception.
> >
> > Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> > ---
> >   target/riscv/insn_trans/trans_rvf.c.inc   | 24 ++++++++++++++++++++--=
-
> >   target/riscv/insn_trans/trans_rvzfh.c.inc |  4 ++++
> >   2 files changed, 25 insertions(+), 3 deletions(-)
> >
> > diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/ins=
n_trans/trans_rvf.c.inc
> > index 052408f45c..6173dace46 100644
> > --- a/target/riscv/insn_trans/trans_rvf.c.inc
> > +++ b/target/riscv/insn_trans/trans_rvf.c.inc
> > @@ -24,9 +24,27 @@
> >               return false; \
> >   } while (0)
> >
> > -#define REQUIRE_ZFINX_OR_F(ctx) do {\
> > -    if (!ctx->cfg_ptr->ext_zfinx) { \
> > -        REQUIRE_EXT(ctx, RVF); \
> > +#ifndef CONFIG_USER_ONLY
> > +#define smstateen_fcsr_check(ctx) do { \
> > +    if (!ctx->smstateen_fcsr_ok) { \
> > +        if (ctx->virt_enabled) { \
> > +            generate_exception(ctx, RISCV_EXCP_VIRT_INSTRUCTION_FAULT)=
; \
> > +        } else { \
> > +            generate_exception(ctx, RISCV_EXCP_ILLEGAL_INST); \
> > +        } \
>
> We can setctx->virt_inst_excp =3D ctx->virt_enabledand return false here.
Ok.
>
> Or we need store current opcode to bins before generate_exception.
>
> >
> > +        return true; \
> > +    } \
> > +} while (0)
> > +#else
> > +#define smstateen_fcsr_check(ctx)
> > +#endif
> > +
> > +#define REQUIRE_ZFINX_OR_F(ctx) do { \
> > +    if (!has_ext(ctx, RVF)) { \
> > +        if (!ctx->cfg_ptr->ext_zfinx) { \
> > +            return false; \
> > +        } \
> > +        smstateen_fcsr_check(ctx); \
> >       } \
> >   } while (0)
> >
> > diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/i=
nsn_trans/trans_rvzfh.c.inc
> > index 74dde37ff7..304bee1002 100644
> > --- a/target/riscv/insn_trans/trans_rvzfh.c.inc
> > +++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
> > @@ -20,24 +20,28 @@
> >       if (!ctx->cfg_ptr->ext_zfh) {      \
> >           return false;         \
> >       }                         \
> > +    smstateen_fcsr_check(ctx); \
> >   } while (0)
> >
> >   #define REQUIRE_ZHINX_OR_ZFH(ctx) do { \
> >       if (!ctx->cfg_ptr->ext_zhinx && !ctx->cfg_ptr->ext_zfh) { \
> >           return false;                  \
> >       }                                  \
> > +    smstateen_fcsr_check(ctx); \
>
> It's better to remain "\" alignment here.
Ok.

>
> Similar to following cases.
>
> Regards,
>
> Weiwei Li
>
> >   } while (0)
> >
> >   #define REQUIRE_ZFHMIN(ctx) do {              \
> >       if (!ctx->cfg_ptr->ext_zfhmin) {          \
> >           return false;                         \
> >       }                                         \
> > +    smstateen_fcsr_check(ctx); \
> >   } while (0)
> >
> >   #define REQUIRE_ZFHMIN_OR_ZHINXMIN(ctx) do {                 \
> >       if (!(ctx->cfg_ptr->ext_zfhmin || ctx->cfg_ptr->ext_zhinxmin)) { =
\
> >           return false;                                        \
> >       }                                                        \
> > +    smstateen_fcsr_check(ctx); \
> >   } while (0)
> >
> >   static bool trans_flh(DisasContext *ctx, arg_flh *a)
>


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 987164B93BC
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 23:17:23 +0100 (CET)
Received: from localhost ([::1]:41300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKSby-0002pR-8P
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 17:17:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nKSa9-0001iC-FZ
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 17:15:29 -0500
Received: from [2607:f8b0:4864:20::d29] (port=35487
 helo=mail-io1-xd29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nKSa7-0006oO-IV
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 17:15:29 -0500
Received: by mail-io1-xd29.google.com with SMTP id q8so1530401iod.2
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 14:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ndm25C8UnwXrMKk/wVcmc19OOYY+isJ6Q3C6n0SOORE=;
 b=CnC3rZ6Gtx1WWidKwtFaqSM6RILH2VD5JdfCY+ePlTLW0PI1CpEFBnbluNpt8XRQUU
 qdi3kF9QEcx0fkmWIBZiZCubOp0MvkQT7eezL+3JCP9kVdG3M1Op72gp7jnXPYRlpZ92
 ZFczeU+5gr6ZArJpmWMhb30KSplLdwXhC0O3HMqdKPFZopfADRqBPQZ7/QnE0YJSQCPm
 SGECP5rl6gYXPJj2V8IEKJqarZvtKvc1jp6IAS/5IFzUVpvIHNmws6ktKLDC8tWrwQ9R
 vmsz6sawA3sYShyQ0OMssviDXoFSNk2S2JpZYOZLLEsJs3MIR5zkTsQpGCXIaZoXrbqh
 yuzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ndm25C8UnwXrMKk/wVcmc19OOYY+isJ6Q3C6n0SOORE=;
 b=tbJb/7uea0cSMF8uNYPME8uwcqV4dKLLaRmp/HYrcx/XwErtk0O5VEhTdI+SxfXJiz
 lg8cswDxj27VzkuUoU36MkaEHoTAKdmbpSwkr9f1dYjQpzZXrnTnI8LFBep+ebWfN/Oe
 9433enw6qyUkjMNXm6qfozIYHqm+FWfHR3PMiaqUi7u5aLCGEe7u0TvQttKDWkOvyAUN
 4FR0aspdzLUQ40eEYIBqRBLZR8z+hC6BwrCFe4P8eVdH2redsRSEgeBre2Jf3stlRMe7
 KK0Z7l8IMlg4BKNCdBoio8zREIMKqZY8CvR+s1YKiu3kfHxuBBJq0E3uJCfmkAg5w5ZU
 0Nzw==
X-Gm-Message-State: AOAM532fHXEzTDqmRF41jfuYcz0X8W/oR4I/kgECfgu1z/0eK0N1iRoh
 0KKbtfxVUPIYDJ/dLNvwec5203LuVr71MBYwQHU=
X-Google-Smtp-Source: ABdhPJyGK6JmEg3VSdOmCm/i8MIATYLZJfI5eW9urFhIA7YDMpII+5uhf7legbPMsQzuaWTI9lI+VB45HJtKLlyb5g4=
X-Received: by 2002:a05:6638:25b:b0:314:21b0:fb61 with SMTP id
 w27-20020a056638025b00b0031421b0fb61mr3088841jaq.66.1645049725786; Wed, 16
 Feb 2022 14:15:25 -0800 (PST)
MIME-Version: 1.0
References: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
 <20220216062912.319738-8-alistair.francis@opensource.wdc.com>
 <CAAeLtUA7KCTPCkutpTn2GgpWi2nU_Zidsh1yKf6bFKEQ4CWdpA@mail.gmail.com>
In-Reply-To: <CAAeLtUA7KCTPCkutpTn2GgpWi2nU_Zidsh1yKf6bFKEQ4CWdpA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 17 Feb 2022 08:14:59 +1000
Message-ID: <CAKmqyKMoXjMGwA2Rt+rf=U6+Y3bPOB-HReqXkmzdyN_ThM9yKQ@mail.gmail.com>
Subject: Re: [PULL v2 07/35] target/riscv: access cfg structure through
 DisasContext
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.978,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@opensource.wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 16, 2022 at 8:24 PM Philipp Tomsich
<philipp.tomsich@vrull.eu> wrote:
>
> Alistair,
>
> This PULL seems not to include the fixup (which you had intended to
> squash into it) for the regression introduced (i.e. the condition
> being inverted):
>   https://patchwork.kernel.org/project/qemu-devel/patch/20220203153946.2676353-1-philipp.tomsich@vrull.eu/

Well....

It does not include it and I'm not really sure why it doesn't. The V1
PR didn't either.

I thought I had applied it, but I guess not. I have actually applied
it to riscv-to-apply.next now

Alistair


> Without that change this will introduce a regression in Zb[abcs]
> (i.e., it will be enabled when it shouldn't be, and will be disabled
> when it should be on).
>
> Please ignore, if I missed a later stand-alone patch (I just looked at
> the series in Patchworks).
>
> Thanks,
> Philipp.
>
>
> On Wed, 16 Feb 2022 at 07:29, Alistair Francis
> <alistair.francis@opensource.wdc.com> wrote:
> >
> > From: Philipp Tomsich <philipp.tomsich@vrull.eu>
> >
> > The Zb[abcs] support code still uses the RISCV_CPU macros to access
> > the configuration information (i.e., check whether an extension is
> > available/enabled).  Now that we provide this information directly
> > from DisasContext, we can access this directly via the cfg_ptr field.
> >
> > Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > Message-Id: <20220202005249.3566542-5-philipp.tomsich@vrull.eu>
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  target/riscv/insn_trans/trans_rvb.c.inc | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> > index 810431a1d6..f9bd3b7ec4 100644
> > --- a/target/riscv/insn_trans/trans_rvb.c.inc
> > +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> > @@ -19,25 +19,25 @@
> >   */
> >
> >  #define REQUIRE_ZBA(ctx) do {                    \
> > -    if (!RISCV_CPU(ctx->cs)->cfg.ext_zba) {      \
> > +    if (ctx->cfg_ptr->ext_zba) {                 \
> >          return false;                            \
> >      }                                            \
> >  } while (0)
> >
> >  #define REQUIRE_ZBB(ctx) do {                    \
> > -    if (!RISCV_CPU(ctx->cs)->cfg.ext_zbb) {      \
> > +    if (ctx->cfg_ptr->ext_zbb) {                 \
> >          return false;                            \
> >      }                                            \
> >  } while (0)
> >
> >  #define REQUIRE_ZBC(ctx) do {                    \
> > -    if (!RISCV_CPU(ctx->cs)->cfg.ext_zbc) {      \
> > +    if (ctx->cfg_ptr->ext_zbc) {                 \
> >          return false;                            \
> >      }                                            \
> >  } while (0)
> >
> >  #define REQUIRE_ZBS(ctx) do {                    \
> > -    if (!RISCV_CPU(ctx->cs)->cfg.ext_zbs) {      \
> > +    if (ctx->cfg_ptr->ext_zbs) {                 \
> >          return false;                            \
> >      }                                            \
> >  } while (0)
> > --
> > 2.34.1
> >


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A37805EE2FF
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 19:25:00 +0200 (CEST)
Received: from localhost ([::1]:58044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odanr-0007lC-Ml
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 13:24:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1odZNh-0005JR-TH
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 11:53:53 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c]:36578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1odZNT-0006Dj-MC
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 11:53:53 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-131a17bf7fdso3156783fac.3
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 08:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=+Oc0jlT7+bSQWvAROTPIJXYXCuHcJSJ7jipGsmrxoKM=;
 b=gf5qctYcxpxz6tMjOx/mWTrADs3KMK8isirprwKfreIdCmWRJcLuhdb8qPHXpR+4Nn
 1LlmZ4dS52X9uJDMEH42cmE0SLfAHldysgtTX9qm8uEnN46OZe6DLUBD/HyH/z36FAoo
 0EbhYevzMisNgTCLVhsX/fYWWAcB4yOoumwQDMJ68WJLWVBaQDbAxK89Hmv8eksKRqyU
 w0fx9AVQKQTlO7EAfmGH/rikofWR3vpCyZ5Zn7k61UeRi6Dmokz2qKIhnMhhStbxIzw8
 70w6EliGZ5BTGepSiz2CZPCMZuJWBYScmAtTnLFT/QK9NR8wMfArnm2fDXSP/hPIKox/
 d0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=+Oc0jlT7+bSQWvAROTPIJXYXCuHcJSJ7jipGsmrxoKM=;
 b=hFjJ/MxYJtbMSrh/LV4BUrNJ6cJDG7kNY9TrNf7A4CsmhWJCQr+u+PQxncck8HCKb0
 KnInKm1Fx3U5lrpHGHabbatifeuPRGQi7128fJnjnehrgEdn5grjYPIX2rgwMA9dy3ht
 RIrn7/ppNR3bT2iWnzql11f1doJeTFryT6d6nf/3pxXNy9jyGe+POwSUd2qXEGqFQqPU
 W3B5NRIBdD49jcH/JAa5a+e+cvx4ihh7aW/ecKWmgc5HH+YZPNpka72TrJ5yB85Gktil
 crOKxyxrkBGyuXD5lT4F0GMompAa3eh39Wnwap4TbWj614nbGZdQcaLCm2NKZk0JKKez
 XhUg==
X-Gm-Message-State: ACrzQf0yowQAAVbS3RNe46zp5oSqCSLhWL5DwG1sTbXTS505/OEIlYon
 +qUXtyd011QAdVkXgX7cw9wL8OumRegvIIgKo+rK9w==
X-Google-Smtp-Source: AMsMyM5HB9Zat5ulXlg2wBTf0TYj+Fs6xKuB6Rdl9N6uloVkjHHGHo1Skxxz0UQGUKDwI8QywHRf3d6w+sM2pS6gdyw=
X-Received: by 2002:a05:6870:a91f:b0:131:bb72:7313 with SMTP id
 eq31-20020a056870a91f00b00131bb727313mr593450oab.90.1664380417980; Wed, 28
 Sep 2022 08:53:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220925132010.5336-1-jim.shu@sifive.com>
 <CAJ307Eg7xYVKY3Yr_+BDedX0gzuCAm2RdcS5rFMv0N44+J++sw@mail.gmail.com>
In-Reply-To: <CAJ307Eg7xYVKY3Yr_+BDedX0gzuCAm2RdcS5rFMv0N44+J++sw@mail.gmail.com>
From: Jim Shu <jim.shu@sifive.com>
Date: Wed, 28 Sep 2022 23:53:26 +0800
Message-ID: <CALw707qqdcSRu3ByFqE62Uh3QZncCMt1GFB+yFGsTAZ+yRg5yQ@mail.gmail.com>
Subject: Re: [PATCH] hw/intc: sifive_plic: fix hard-coded max priority level
To: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-riscv@nongnu.org, Emmanuel Blot <emmanuel.blot@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=jim.shu@sifive.com; helo=mail-oa1-x2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Hi Cl=C3=A9ment,

Thanks for your opinion. I think it's a good enhancement.

PLIC spec [1] says that interrupt source priority registers should be
WARL =EF=AC=81elds to allow software to determine "the number and position =
of
read-write bits" in each priority speci=EF=AC=81cation, if any. To simplify
discovery of supported priority values, each priority register must
support any combination of values in the bits that are variable within
the register, i.e., if there are two variable bits in the register,
all four combinations of values in those bits must operate as valid
priority levels.

I think "num_priorities + 1" should be power-of-2 and SW could
discover available bits of interrupt source priority.
I'll do this enhancement in the next version patch.

[1] https://github.com/riscv/riscv-plic-spec/blob/master/riscv-plic.adoc#in=
terrupt-priorities

Thanks,
Jim Shu




On Mon, Sep 26, 2022 at 3:52 PM Cl=C3=A9ment Chigot <chigot@adacore.com> wr=
ote:
>
> Hi Jim,
>
> On Sun, Sep 25, 2022 at 3:26 PM Jim Shu <jim.shu@sifive.com> wrote:
> >
> > The maximum priority level is hard-coded when writing to interrupt
> > priority register. However, when writing to priority threshold register=
,
> > the maximum priority level is from num_priorities Property which is
> > configured by platform.
> >
> > Also change interrupt priority register to use num_priorities Property
> > in maximum priority level.
> >
> > Signed-off-by: Emmanuel Blot <emmanuel.blot@sifive.com>
> > Signed-off-by: Jim Shu <jim.shu@sifive.com>
> > Reviewed-by: Frank Chang <frank.chang@sifive.com>
> > ---
> >  hw/intc/sifive_plic.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> > index af4ae3630e..f864efa761 100644
> > --- a/hw/intc/sifive_plic.c
> > +++ b/hw/intc/sifive_plic.c
> > @@ -180,8 +180,10 @@ static void sifive_plic_write(void *opaque, hwaddr=
 addr, uint64_t value,
> >      if (addr_between(addr, plic->priority_base, plic->num_sources << 2=
)) {
> >          uint32_t irq =3D ((addr - plic->priority_base) >> 2) + 1;
> >
> > -        plic->source_priority[irq] =3D value & 7;
> > -        sifive_plic_update(plic);
> > +        if (value <=3D plic->num_priorities) {
> > +            plic->source_priority[irq] =3D value;
> > +            sifive_plic_update(plic);
> > +        }
>
> If I'm not mistaking the documentation [1], these registers are WARL
> (Write-Any-Read-Legal). However, in your case, any value above
> "num_priorities" will be ignored.
>
> We had an issue related to that and ended up making a local patch.
> However, we are assuming that "num_priorities+1" is a power of 2
> (which is currently the case)
>
> -        plic->source_priority[irq] =3D value & 7;
> +        /* Interrupt Priority registers are Write-Any Read-Legal. Cleanu=
p
> +         * incoming values before storing them.
> +         */
> +        plic->source_priority[irq] =3D value % (plic->num_priorities + 1=
);
>
> Note that it should also be done for target_priority a bit below.
> -            if (value <=3D plic->num_priorities) {
> -                plic->target_priority[addrid] =3D value;
> -                sifive_plic_update(plic);
> -            }
> +            /* Priority Thresholds registers are Write-Any Read-Legal. C=
leanup
> +             * incoming values before storing them.
> +             */
> +            plic->target_priority[addrid] =3D value % (plic->num_priorit=
ies + 1);
> +            sifive_plic_update(plic);
>
> [1] https://static.dev.sifive.com/FE310-G000.pdf
>
> Thanks,
> Cl=C3=A9ment


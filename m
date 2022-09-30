Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AC05F0C43
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 15:14:10 +0200 (CEST)
Received: from localhost ([::1]:45224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeFqC-0007ij-FZ
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 09:14:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1oeFli-0003qg-Jb
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 09:09:31 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32]:33507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1oeFlg-00023j-QU
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 09:09:30 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-131dda37dddso4391021fac.0
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 06:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=zgXwLiMeTBAtMDDDK72360hBDz52tjw6sLjNB7sOKuE=;
 b=NaDWdOU8zMEABosvP9uTuDBhb6rp/pkbFNGbFy5tGGlXcvvDwsjvnSYHF3SX95/Q+J
 1SKam5LOBN74cNyCQnNdQ5gjIPsd2Tcy8DIXa6wWnCpcYR7EKnfBiw8h0LkZHXV1TlKC
 zGHLqDfKDULRr9bIaDr2vMWs0dszetHOzwxXsusfLvvJCx+fzTECKCW3c4UCE8V/TKay
 iTnG4sXIVc1GScYUPj3ZhjI96XtoksLezNmX28fhScv+Rz22aG0cPIzahN3p0jAW53eW
 725GqNe2jp+em9W41zKTa9LH1xV+Nugt2EfdilcV6B1U+B+98rj0kavQ7bb/COQfMryi
 8Ryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=zgXwLiMeTBAtMDDDK72360hBDz52tjw6sLjNB7sOKuE=;
 b=l5xOSEBCUtZnSYMMC0BwAuI/zYwYvCZa7DOdm4WMUzOkaa/IAKITmwAlUE1J4JX1mo
 zBfvJDKRj5jmTv+MXsVp3b2eJxPJyt4RlGDVG1WTwy0J/fa+RDQn/Hy6LqBl3Dkl9l5q
 jzdCLWtRLmkDhtqWsDd3iN/HFn0Wj1txWNlJeR+OGra4WzkiY7+BY8PLkEtc8jBUUDzb
 PW3+u82O9+23bpRfdVl35baQz4ICFNRCbGLDANHxG+8ibgPKsvIJ8ieb/gL8VxHc9NCs
 y5KV6XAhyHUQpGsURYpufNcasWnDsC9bNDxEVFa7lB1GwOTeD9MQz+IpZMt+EWNROw1u
 2mAA==
X-Gm-Message-State: ACrzQf0B3v0LIboUyyQ3tyrksdTnwfZR0UCtsUMVFl8cQ//nO9/Rqd5Y
 KJzSlzgdDcx4HrdNJLpHAEU0JpmWG2EjY59PACSTig==
X-Google-Smtp-Source: AMsMyM7btOcGj3mEhpHwjUJdwPGxvJZlylZgdAwYNi+guYabBW+reW9Phlb8yCnrl2rDlAuuCeuMBllz7azWxCTY/yI=
X-Received: by 2002:a05:6870:a2c7:b0:131:d098:9e37 with SMTP id
 w7-20020a056870a2c700b00131d0989e37mr4209511oak.152.1664543367011; Fri, 30
 Sep 2022 06:09:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220930123239.15515-1-jim.shu@sifive.com>
 <20220930123239.15515-3-jim.shu@sifive.com>
 <CAJ307Ehp8Juy74EpmxyOTq6sVuPF+d-uLYD3T93ba4ZtRLxdBA@mail.gmail.com>
In-Reply-To: <CAJ307Ehp8Juy74EpmxyOTq6sVuPF+d-uLYD3T93ba4ZtRLxdBA@mail.gmail.com>
From: Jim Shu <jim.shu@sifive.com>
Date: Fri, 30 Sep 2022 21:09:15 +0800
Message-ID: <CALw707rDW8GwB8fQHyARgY87ZRjPxOV387kZLKWOzqKVZj4=8w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hw/intc: sifive_plic: change interrupt priority
 register to WARL field
To: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=jim.shu@sifive.com; helo=mail-oa1-x32.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

hi Cl=C3=A9ment,

Thank you very much.
I'll fix it in the next version patch.

Thanks,
Jim Shu



On Fri, Sep 30, 2022 at 8:58 PM Cl=C3=A9ment Chigot <chigot@adacore.com> wr=
ote:
>
> Hi Jim,
>
> On Fri, Sep 30, 2022 at 2:32 PM Jim Shu <jim.shu@sifive.com> wrote:
> >
> > PLIC spec [1] requires interrupt source priority registers are WARL
> > field and the number of supported priority is power-of-2 to simplify SW
> > discovery.
> >
> > Existing QEMU RISC-V machine (e.g. shakti_c) don't strictly follow PLIC
> > spec, whose number of supported priority is not power-of-2. Just change
> > each bit of interrupt priority register to WARL field when the number o=
f
> > supported priority is power-of-2.
> >
> > [1] https://github.com/riscv/riscv-plic-spec/blob/master/riscv-plic.ado=
c#interrupt-priorities
> >
> > Signed-off-by: Jim Shu <jim.shu@sifive.com>
> > ---
> >  hw/intc/sifive_plic.c | 21 +++++++++++++++++++--
> >  1 file changed, 19 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> > index f864efa761..218ccff8bd 100644
> > --- a/hw/intc/sifive_plic.c
> > +++ b/hw/intc/sifive_plic.c
> > @@ -180,7 +180,15 @@ static void sifive_plic_write(void *opaque, hwaddr=
 addr, uint64_t value,
> >      if (addr_between(addr, plic->priority_base, plic->num_sources << 2=
)) {
> >          uint32_t irq =3D ((addr - plic->priority_base) >> 2) + 1;
> >
> > -        if (value <=3D plic->num_priorities) {
> > +        if ((plic->num_priorities + 1) & (plic->num_priorities)) {
>
> That's the opposite. If n is a power of 2, n & (n-1) =3D=3D 0 (eg 8 & 7 =
=3D=3D
>  0, 9 & 8 =3D=3D 8).
> Note that n must be positive too. But I'm not sure it matters here.
> I'll let you decide.
>
> > +            /*
> > +             * if "num_priorities + 1" is power-of-2, make each regist=
er bit of
> > +             * interrupt priority WARL (Write-Any-Read-Legal). Just fi=
lter
> > +             * out the access to unsupported priority bits.
> > +             */
> > +            plic->source_priority[irq] =3D value % (plic->num_prioriti=
es + 1);
> > +            sifive_plic_update(plic);
> > +        } else if (value <=3D plic->num_priorities) {
> >              plic->source_priority[irq] =3D value;
> >              sifive_plic_update(plic);
> >          }
> > @@ -207,7 +215,16 @@ static void sifive_plic_write(void *opaque, hwaddr=
 addr, uint64_t value,
> >          uint32_t contextid =3D (addr & (plic->context_stride - 1));
> >
> >          if (contextid =3D=3D 0) {
> > -            if (value <=3D plic->num_priorities) {
> > +            if ((plic->num_priorities + 1) & (plic->num_priorities)) {
>
> Same.
>
> > +                /*
> > +                 * if "num_priorities + 1" is power-of-2, each registe=
r bit of
> > +                 * interrupt priority is WARL (Write-Any-Read-Legal). =
Just
> > +                 * filter out the access to unsupported priority bits.
> > +                 */
> > +                plic->target_priority[addrid] =3D value %
> > +                                                (plic->num_priorities =
+ 1);
> > +                sifive_plic_update(plic);
> > +            } else if (value <=3D plic->num_priorities) {
> >                  plic->target_priority[addrid] =3D value;
> >                  sifive_plic_update(plic);
> >              }
> > --
> > 2.17.1
>
> Cl=C3=A9ment


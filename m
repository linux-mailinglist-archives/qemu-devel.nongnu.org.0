Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 214E94E60BC
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 09:57:41 +0100 (CET)
Received: from localhost ([::1]:54922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXJHl-0001oO-H2
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 04:57:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1nXIqI-0000dt-P4
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 04:29:14 -0400
Received: from [2a00:1450:4864:20::12e] (port=43692
 helo=mail-lf1-x12e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1nXIqG-0005yy-IX
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 04:29:14 -0400
Received: by mail-lf1-x12e.google.com with SMTP id a26so6739691lfg.10
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 01:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7tFhCa/ufv2yy7i3LWMValrcFlu2RkTEzIHyPZuvxtQ=;
 b=YvV7Uh4rgYYQOB/WXLIcEGdGrhQ8+ECXrobMLm8X5/Qlyl52HWw89knp8Kfs/qslpd
 aShY9GboYIazainksH589l5qKEPAmYGjPJb2wFUpW+fY1Yt0R+E0J0iUBpdG477Rfnaq
 cIWJ1y6E8mQoBEhCs9mB6rFrLZbBG0ASx7a6l7pIxvuN28RLB4HZBGLglmh7FmUP5J6j
 TmT1F8TjDFlW3C3i4+A+3ZjIAWsD8Zk3uE674zpT3Sn/6WyybOCVRRy3rbk6BG4ELhej
 VZQsRxxToiposjLIcmbwNau+Oj16KeMhJTcO5CiH2MZ3MbLZZdjvIdubdAR2CgQ8AQaa
 s0TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7tFhCa/ufv2yy7i3LWMValrcFlu2RkTEzIHyPZuvxtQ=;
 b=4KSg58Pt3lmMPW3+KRskFKXTW8KIlpWxdzYVLdlADvKuVtoVCKo70tNo2lgqU0wTFF
 l19K7MvkYkH+yKWeYHJ3kqHgDsYWJ+fMOVbTdP1Ba0zTZiL/7rlerOYWc63qnD+lASu7
 uvpxRAn9LVy2DStX4MQVhrOdl2Vh6Lv0HkdIYoMMaP+Kqlgqi98UI85EDS4St6qRD/v5
 KfM8qg8Q8g8v5U/MXd3enKrKyGLtijKOEGiY5iwynF8fRqOi+P/nOAtRrZpQNpntWT/e
 7//+1BBpxkWFItzJerx+za/mQR39SWifx5ECBCdyfGi8Nqq60zsNsdUEpMj6sYrwrFWG
 lR3w==
X-Gm-Message-State: AOAM532+xUazd9UM2Sz/XUYYhdPeorZgXba0hcrStbis/F4xollOmebJ
 aNVQPH66SmA7Lp3FwEk8PmwCOG3IyRLDArX7BXgnKQ==
X-Google-Smtp-Source: ABdhPJx5FhXzMzBzsnY47TJ/7GZ/P6Me1d4R5+OAhG++a58tGXN+vbqrgQSn2jZlre4lgY3FrWIpPVBmqEVZdikz8Hk=
X-Received: by 2002:a05:6512:1112:b0:44a:4096:39b0 with SMTP id
 l18-20020a056512111200b0044a409639b0mr3076046lfg.35.1648110550662; Thu, 24
 Mar 2022 01:29:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220323111309.9109-1-mchitale@ventanamicro.com>
 <20220323111309.9109-5-mchitale@ventanamicro.com>
 <c0920f62-46fa-46db-84ba-cade2dc4d565@iscas.ac.cn>
In-Reply-To: <c0920f62-46fa-46db-84ba-cade2dc4d565@iscas.ac.cn>
From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Thu, 24 Mar 2022 13:58:34 +0530
Message-ID: <CAN37VV6kQqqSAycfzGnS_dZ0OSxGL0veqQ6F5xFFr2KmMZG-Gg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 4/4] target/riscv: smstateen check for AIA/IMSIC
To: Weiwei Li <liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=mchitale@ventanamicro.com; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 23, 2022 at 6:43 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
>
> =E5=9C=A8 2022/3/23 =E4=B8=8B=E5=8D=887:13, Mayuresh Chitale =E5=86=99=E9=
=81=93:
> > If smstateen is implemented then accesses to AIA
> > registers CSRS, IMSIC CSRs and other IMSIC registers
> > is controlled by setting of corresponding bits in
> > mstateen/hstateen registers. Otherwise an illegal
> > instruction trap or virtual instruction trap is
> > generated.
> >
> > Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> > ---
> >   target/riscv/csr.c | 248 ++++++++++++++++++++++++++++++++++++++++++++=
-
> >   1 file changed, 246 insertions(+), 2 deletions(-)
> >
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index 5959adc9b3..cfdda8dc2b 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -68,6 +68,53 @@ static RISCVException smstateen_acc_ok(CPURISCVState=
 *env, int mode, int bit)
> >       return RISCV_EXCP_NONE;
> >   }
> >
> > +static RISCVException smstateen_aia_acc_ok(CPURISCVState *env, int csr=
no)
> > +{
> > +    int bit, mode;
> > +
> > +    switch (csrno) {
> > +    case CSR_SSETEIPNUM:
> > +    case CSR_SCLREIPNUM:
> > +    case CSR_SSETEIENUM:
> > +    case CSR_SCLREIENUM:
> > +    case CSR_STOPEI:
> > +    case CSR_VSSETEIPNUM:
> > +    case CSR_VSCLREIPNUM:
> > +    case CSR_VSSETEIENUM:
> > +    case CSR_VSCLREIENUM:
> > +    case CSR_VSTOPEI:
> > +    case CSR_HSTATUS:
> > +        mode =3D PRV_S;
> > +        bit =3D SMSTATEEN0_IMSIC;
> > +        break;
> > +
> > +    case CSR_SIEH:
> > +    case CSR_SIPH:
> > +    case CSR_HVIPH:
> > +    case CSR_HVICTL:
> > +    case CSR_HVIPRIO1:
> > +    case CSR_HVIPRIO2:
> > +    case CSR_HVIPRIO1H:
> > +    case CSR_HVIPRIO2H:
> > +    case CSR_VSIEH:
> > +    case CSR_VSIPH:
> > +        mode =3D PRV_S;
> > +        bit =3D SMSTATEEN0_AIA;
> > +        break;
> > +
> > +    case CSR_SISELECT:
> > +    case CSR_VSISELECT:
> > +        mode =3D PRV_S;
> > +        bit =3D SMSTATEEN0_SVSLCT;
> > +        break;
> > +
> > +    default:
> > +        return RISCV_EXCP_NONE;
> > +    }
> > +
> > +    return smstateen_acc_ok(env, mode, bit);
> > +}
> > +
> >   static RISCVException fs(CPURISCVState *env, int csrno)
> >   {
> >   #if !defined(CONFIG_USER_ONLY)
> > @@ -1402,6 +1449,13 @@ static int rmw_xiselect(CPURISCVState *env, int =
csrno, target_ulong *val,
> >                           target_ulong new_val, target_ulong wr_mask)
> >   {
> >       target_ulong *iselect;
> > +    RISCVException ret;
> > +
> > +    /* Check if smstateen is enabled and this access is allowed */
> > +    ret =3D smstateen_aia_acc_ok(env, csrno);
> > +    if (ret !=3D RISCV_EXCP_NONE) {
> > +        return ret;
> > +    }
> >
> >       /* Translate CSR number for VS-mode */
> >       csrno =3D aia_xlate_vs_csrno(env, csrno);
> > @@ -1484,7 +1538,9 @@ static int rmw_xireg(CPURISCVState *env, int csrn=
o, target_ulong *val,
> >       bool virt;
> >       uint8_t *iprio;
> >       int ret =3D -EINVAL;
> > -    target_ulong priv, isel, vgein;
> > +    target_ulong priv, isel, vgein =3D 0;
> > +    CPUState *cs =3D env_cpu(env);
> > +    RISCVCPU *cpu =3D RISCV_CPU(cs);
> >
> >       /* Translate CSR number for VS-mode */
> >       csrno =3D aia_xlate_vs_csrno(env, csrno);
> > @@ -1513,11 +1569,20 @@ static int rmw_xireg(CPURISCVState *env, int cs=
rno, target_ulong *val,
> >       };
> >
> >       /* Find the selected guest interrupt file */
> > -    vgein =3D (virt) ? get_field(env->hstatus, HSTATUS_VGEIN) : 0;
> > +    if (virt) {
> > +        if (!cpu->cfg.ext_smstateen ||
> > +                (env->hstateen[0] & 1UL << SMSTATEEN0_IMSIC)) {
> It seems better that '(' aligned with '!'.
> > +            vgein =3D get_field(env->hstatus, HSTATUS_VGEIN);
> > +        }
> > +    }
> >
> >       if (ISELECT_IPRIO0 <=3D isel && isel <=3D ISELECT_IPRIO15) {
> >           /* Local interrupt priority registers not available for VS-mo=
de */
> >           if (!virt) {
> > +            if (priv =3D=3D PRV_S && cpu->cfg.ext_smstateen &&
> > +                !(env->hstateen[0] & 1UL << SMSTATEEN0_AIA)) {
> > +                goto done;
> > +            }
> >               ret =3D rmw_iprio(riscv_cpu_mxl_bits(env),
> >                               isel, iprio, val, new_val, wr_mask,
> >                               (priv =3D=3D PRV_M) ? IRQ_M_EXT : IRQ_S_E=
XT);
> > @@ -1551,6 +1616,13 @@ static int rmw_xsetclreinum(CPURISCVState *env, =
int csrno, target_ulong *val,
> >       int ret =3D -EINVAL;
> >       bool set, pend, virt;
> >       target_ulong priv, isel, vgein, xlen, nval, wmask;
> > +    RISCVException excp;
> > +
> > +    /* Check if smstateen is enabled and this access is allowed */
> > +    excp =3D smstateen_aia_acc_ok(env, csrno);
> > +    if (excp !=3D RISCV_EXCP_NONE) {
> > +        return excp;
> > +    }
> >
> >       /* Translate CSR number for VS-mode */
> >       csrno =3D aia_xlate_vs_csrno(env, csrno);
> > @@ -1669,6 +1741,13 @@ static int rmw_xtopei(CPURISCVState *env, int cs=
rno, target_ulong *val,
> >       bool virt;
> >       int ret =3D -EINVAL;
> >       target_ulong priv, vgein;
> > +    RISCVException excp;
> > +
> > +    /* Check if smstateen is enabled and this access is allowed */
> > +    excp =3D smstateen_aia_acc_ok(env, csrno);
> > +    if (excp !=3D RISCV_EXCP_NONE) {
> > +        return excp;
> > +    }
> >
> >       /* Translate CSR number for VS-mode */
> >       csrno =3D aia_xlate_vs_csrno(env, csrno);
> > @@ -2014,6 +2093,12 @@ static RISCVException write_mstateen(CPURISCVSta=
te *env, int csrno,
> >           wr_mask |=3D 1UL << SMSTATEEN0_FCSR;
> >       }
> >
> > +    if (riscv_feature(env, RISCV_FEATURE_AIA)) {
> > +        wr_mask |=3D (1UL << SMSTATEEN0_IMSIC)
> > +                | (1UL << SMSTATEEN0_AIA)
> > +                | (1UL << SMSTATEEN0_SVSLCT);
>
> I think it's better as follows:

Ok. Will fix it in the next version.
>
> +        wr_mask |=3D (1UL << SMSTATEEN0_IMSIC) |
> +                   (1UL << SMSTATEEN0_AIA) |
> +                   (1UL << SMSTATEEN0_SVSLCT);
>
> Regards,
>
> Weiwei Li
>


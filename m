Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE5A1BD185
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Apr 2020 03:05:40 +0200 (CEST)
Received: from localhost ([::1]:44962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTbAR-00044P-3K
	for lists+qemu-devel@lfdr.de; Tue, 28 Apr 2020 21:05:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42082)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chenhuacai@gmail.com>) id 1jTb9L-0003XH-Bj
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 21:04:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <chenhuacai@gmail.com>) id 1jTb9K-00007G-4R
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 21:04:31 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:45964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chenhuacai@gmail.com>)
 id 1jTb9J-000077-O6
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 21:04:29 -0400
Received: by mail-io1-xd44.google.com with SMTP id i19so375900ioh.12
 for <qemu-devel@nongnu.org>; Tue, 28 Apr 2020 18:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eCfyDP1KetQqLwkzsy7gRF+XDEXnBFCmIz9rhCzhY64=;
 b=GKca8A1ztMGnU/aVJcnyRiLNBYXzT5/bvKJmmxYX/AZX1lq2YSUN0JNAUDJAL593rq
 YS/Ebek20/PZrJ2PP/U4KpSSDop7XkC3VJem81s+P/uIFLoDTi61q+OZgQbacIejqM4+
 YJVm6uH33wY8PEpE9AGZIDp4XloCUSbFcFLanBYzeH3lsgOVNYCCBhhLv5mTgj9DT7wZ
 m+eK2nlgF7M4cINmCzFluYOHGdut6R8I4tJofH6PGbSR9pcMzQJtTyYT9++G154UVwQT
 uD3CHAKQbzjJaEajVFaty8c4Fe59WFRlptODBhHGMuxxzRHBnG/pm/UuTsdSZ8/PWQwe
 Dq0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eCfyDP1KetQqLwkzsy7gRF+XDEXnBFCmIz9rhCzhY64=;
 b=KB3KgF9NJHO0M80q1UtXrrnR6kBjxN5WRGgW0Lhpr07O43op0vbyaoox/oYby63JFp
 bPkp8djVkRqRY6IwnQwzG4xwHAIZQ3LeweCXeR8fPvGmOQMZnNvfLGJ6DLTbmO8fU1TZ
 FO+ocP0FlqaelN/hw+5J8dFYeFd88M/dZJC+dNIuWSPckJXuVKLNkqJqKC1IkIUdDJEQ
 9JsZCWpnjSG/B8eN7V09BHaiko+zwM6OE3dxhJvIsBguyoLaxELzUD2HzvqAgDT03Rvb
 ApeG/D66dhclOjd+w5lMyUu/1iMATKCn07S60QvXueuUOYbv9Hn8Dciws9JHCDI/EoIS
 dHiQ==
X-Gm-Message-State: AGi0PubO3ZpDAPL8Pqv6sd/1BbcJakheUztyjUTVtJzgKKpxQWqC8/7g
 mrDjwEiDPawm6rBWGSN4VkuVOCSnZlT2c4ZOq/E=
X-Google-Smtp-Source: APiQypJD5rBVxmLYOCPPdC2E+s+pC8iULOy8Fip6MAxBi8jIYo+SSYu3dQN+mTzD5xpkDtwJNT8DmqmWEFQdUaLqhC8=
X-Received: by 2002:a5e:8613:: with SMTP id z19mr27944172ioj.84.1588122268306; 
 Tue, 28 Apr 2020 18:04:28 -0700 (PDT)
MIME-Version: 1.0
References: <1587979995-17717-1-git-send-email-chenhc@lemote.com>
 <1587979995-17717-5-git-send-email-chenhc@lemote.com>
 <CAHiYmc7xZ3TVphhxxTgtEqx2L2pDPsvjXZzXQ-bMQx5U2UuwdQ@mail.gmail.com>
In-Reply-To: <CAHiYmc7xZ3TVphhxxTgtEqx2L2pDPsvjXZzXQ-bMQx5U2UuwdQ@mail.gmail.com>
From: Huacai Chen <chenhuacai@gmail.com>
Date: Wed, 29 Apr 2020 09:11:58 +0800
Message-ID: <CAAhV-H4-_H5qgUmJ8tNMw2uRPBx1qEWJmLW5eptsiu84GyfYXg@mail.gmail.com>
Subject: Re: [PATCH for-5.1 5/7] target/mips: Add more CP0 register for
 save/restore
To: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d44;
 envelope-from=chenhuacai@gmail.com; helo=mail-io1-xd44.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::d44
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
Cc: Huacai Chen <zltjiangshi@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Aleksandar,

On Wed, Apr 29, 2020 at 3:10 AM Aleksandar Markovic
<aleksandar.qemu.devel@gmail.com> wrote:
>
> =D0=BF=D0=BE=D0=BD, 27. =D0=B0=D0=BF=D1=80 2020. =D1=83 11:36 Huacai Chen=
 <zltjiangshi@gmail.com> =D1=98=D0=B5 =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=
=D0=BE/=D0=BB=D0=B0:
> >
> > Add more CP0 register for save/restore, including: EBase, XContext,
> > PageGrain, PWBase, PWSize, PWField, PWCtl, Config*, KScratch1~KScratch6=
.
> >
> > Signed-off-by: Huacai Chen <chenhc@lemote.com>
> > Co-developed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > ---
> >  target/mips/kvm.c     | 212 ++++++++++++++++++++++++++++++++++++++++++=
++++++++
> >  target/mips/machine.c |   2 +
> >  2 files changed, 214 insertions(+)
> >
> > diff --git a/target/mips/kvm.c b/target/mips/kvm.c
> > index de3e26e..96cfa10 100644
> > --- a/target/mips/kvm.c
> > +++ b/target/mips/kvm.c
> > @@ -245,10 +245,16 @@ int kvm_mips_set_ipi_interrupt(MIPSCPU *cpu, int =
irq, int level)
> >      (KVM_REG_MIPS_CP0 | KVM_REG_SIZE_U64 | (8 * (_R) + (_S)))
> >
> >  #define KVM_REG_MIPS_CP0_INDEX          MIPS_CP0_32(0, 0)
> > +#define KVM_REG_MIPS_CP0_RANDOM         MIPS_CP0_32(1, 0)
> >  #define KVM_REG_MIPS_CP0_CONTEXT        MIPS_CP0_64(4, 0)
> >  #define KVM_REG_MIPS_CP0_USERLOCAL      MIPS_CP0_64(4, 2)
> >  #define KVM_REG_MIPS_CP0_PAGEMASK       MIPS_CP0_32(5, 0)
> > +#define KVM_REG_MIPS_CP0_PAGEGRAIN      MIPS_CP0_32(5, 1)
> > +#define KVM_REG_MIPS_CP0_PWBASE         MIPS_CP0_64(5, 5)
> > +#define KVM_REG_MIPS_CP0_PWFIELD        MIPS_CP0_64(5, 6)
> > +#define KVM_REG_MIPS_CP0_PWSIZE         MIPS_CP0_64(5, 7)
> >  #define KVM_REG_MIPS_CP0_WIRED          MIPS_CP0_32(6, 0)
> > +#define KVM_REG_MIPS_CP0_PWCTL          MIPS_CP0_32(6, 6)
> >  #define KVM_REG_MIPS_CP0_HWRENA         MIPS_CP0_32(7, 0)
> >  #define KVM_REG_MIPS_CP0_BADVADDR       MIPS_CP0_64(8, 0)
> >  #define KVM_REG_MIPS_CP0_COUNT          MIPS_CP0_32(9, 0)
> > @@ -258,13 +264,22 @@ int kvm_mips_set_ipi_interrupt(MIPSCPU *cpu, int =
irq, int level)
> >  #define KVM_REG_MIPS_CP0_CAUSE          MIPS_CP0_32(13, 0)
> >  #define KVM_REG_MIPS_CP0_EPC            MIPS_CP0_64(14, 0)
> >  #define KVM_REG_MIPS_CP0_PRID           MIPS_CP0_32(15, 0)
> > +#define KVM_REG_MIPS_CP0_EBASE          MIPS_CP0_64(15, 1)
> >  #define KVM_REG_MIPS_CP0_CONFIG         MIPS_CP0_32(16, 0)
> >  #define KVM_REG_MIPS_CP0_CONFIG1        MIPS_CP0_32(16, 1)
> >  #define KVM_REG_MIPS_CP0_CONFIG2        MIPS_CP0_32(16, 2)
> >  #define KVM_REG_MIPS_CP0_CONFIG3        MIPS_CP0_32(16, 3)
> >  #define KVM_REG_MIPS_CP0_CONFIG4        MIPS_CP0_32(16, 4)
> >  #define KVM_REG_MIPS_CP0_CONFIG5        MIPS_CP0_32(16, 5)
> > +#define KVM_REG_MIPS_CP0_CONFIG6        MIPS_CP0_32(16, 6)
> > +#define KVM_REG_MIPS_CP0_XCONTEXT       MIPS_CP0_64(20, 0)
> >  #define KVM_REG_MIPS_CP0_ERROREPC       MIPS_CP0_64(30, 0)
> > +#define KVM_REG_MIPS_CP0_KSCRATCH1      MIPS_CP0_64(31, 2)
> > +#define KVM_REG_MIPS_CP0_KSCRATCH2      MIPS_CP0_64(31, 3)
> > +#define KVM_REG_MIPS_CP0_KSCRATCH3      MIPS_CP0_64(31, 4)
> > +#define KVM_REG_MIPS_CP0_KSCRATCH4      MIPS_CP0_64(31, 5)
> > +#define KVM_REG_MIPS_CP0_KSCRATCH5      MIPS_CP0_64(31, 6)
> > +#define KVM_REG_MIPS_CP0_KSCRATCH6      MIPS_CP0_64(31, 7)
> >
> >  static inline int kvm_mips_put_one_reg(CPUState *cs, uint64_t reg_id,
> >                                         int32_t *addr)
> > @@ -394,6 +409,29 @@ static inline int kvm_mips_get_one_ureg64(CPUState=
 *cs, uint64_t reg_id,
> >                                           (1U << CP0C5_UFE) | \
> >                                           (1U << CP0C5_FRE) | \
> >                                           (1U << CP0C5_UFR))
> > +#define KVM_REG_MIPS_CP0_CONFIG6_MASK   ((1U << CP0C6_BPPASS) | \
> > +                                         (0x3fU << CP0C6_KPOS) | \
> > +                                         (1U << CP0C6_KE) | \
> > +                                         (1U << CP0C6_VTLBONLY) | \
> > +                                         (1U << CP0C6_LASX) | \
> > +                                         (1U << CP0C6_SSEN) | \
> > +                                         (1U << CP0C6_DISDRTIME) | \
> > +                                         (1U << CP0C6_PIXNUEN) | \
> > +                                         (1U << CP0C6_SCRAND) | \
> > +                                         (1U << CP0C6_LLEXCEN) | \
> > +                                         (1U << CP0C6_DISVC) | \
> > +                                         (1U << CP0C6_VCLRU) | \
> > +                                         (1U << CP0C6_DCLRU) | \
> > +                                         (1U << CP0C6_PIXUEN) | \
> > +                                         (1U << CP0C6_DISBLKLYEN) | \
> > +                                         (1U << CP0C6_UMEMUALEN) | \
> > +                                         (1U << CP0C6_SFBEN) | \
> > +                                         (1U << CP0C6_FLTINT) | \
> > +                                         (1U << CP0C6_VLTINT) | \
> > +                                         (1U << CP0C6_DISBTB) | \
> > +                                         (3U << CP0C6_STPREFCTL) | \
> > +                                         (1U << CP0C6_INSTPREF) | \
> > +                                         (1U << CP0C6_DATAPREF))
> >
> >  static inline int kvm_mips_change_one_reg(CPUState *cs, uint64_t reg_i=
d,
> >                                            int32_t *addr, int32_t mask)
> > @@ -729,6 +767,11 @@ static int kvm_mips_put_cp0_registers(CPUState *cs=
, int level)
> >          DPRINTF("%s: Failed to put CP0_INDEX (%d)\n", __func__, err);
> >          ret =3D err;
> >      }
> > +    err =3D kvm_mips_put_one_reg(cs, KVM_REG_MIPS_CP0_RANDOM, &env->CP=
0_Random);
> > +    if (err < 0) {
> > +        DPRINTF("%s: Failed to put CP0_RANDOM (%d)\n", __func__, err);
> > +        ret =3D err;
> > +    }
> >      err =3D kvm_mips_put_one_ulreg(cs, KVM_REG_MIPS_CP0_CONTEXT,
> >                                   &env->CP0_Context);
> >      if (err < 0) {
> > @@ -747,11 +790,40 @@ static int kvm_mips_put_cp0_registers(CPUState *c=
s, int level)
> >          DPRINTF("%s: Failed to put CP0_PAGEMASK (%d)\n", __func__, err=
);
> >          ret =3D err;
> >      }
> > +    err =3D kvm_mips_put_one_reg(cs, KVM_REG_MIPS_CP0_PAGEGRAIN,
> > +                               &env->CP0_PageGrain);
> > +    if (err < 0) {
> > +        DPRINTF("%s: Failed to put CP0_PAGEGRAIN (%d)\n", __func__, er=
r);
> > +        ret =3D err;
> > +    }
> > +    err =3D kvm_mips_put_one_ulreg(cs, KVM_REG_MIPS_CP0_PWBASE,
> > +                               &env->CP0_PWBase);
> > +    if (err < 0) {
> > +        DPRINTF("%s: Failed to put CP0_PWBASE (%d)\n", __func__, err);
> > +        ret =3D err;
> > +    }
> > +    err =3D kvm_mips_put_one_ulreg(cs, KVM_REG_MIPS_CP0_PWFIELD,
> > +                               &env->CP0_PWField);
> > +    if (err < 0) {
> > +        DPRINTF("%s: Failed to put CP0_PWField (%d)\n", __func__, err)=
;
> > +        ret =3D err;
> > +    }
> > +    err =3D kvm_mips_put_one_ulreg(cs, KVM_REG_MIPS_CP0_PWSIZE,
> > +                               &env->CP0_PWSize);
> > +    if (err < 0) {
> > +        DPRINTF("%s: Failed to put CP0_PWSIZE (%d)\n", __func__, err);
> > +        ret =3D err;
> > +    }
> >      err =3D kvm_mips_put_one_reg(cs, KVM_REG_MIPS_CP0_WIRED, &env->CP0=
_Wired);
> >      if (err < 0) {
> >          DPRINTF("%s: Failed to put CP0_WIRED (%d)\n", __func__, err);
> >          ret =3D err;
> >      }
> > +    err =3D kvm_mips_put_one_reg(cs, KVM_REG_MIPS_CP0_PWCTL, &env->CP0=
_PWCtl);
> > +    if (err < 0) {
> > +        DPRINTF("%s: Failed to put CP0_PWCTL (%d)\n", __func__, err);
> > +        ret =3D err;
> > +    }
> >      err =3D kvm_mips_put_one_reg(cs, KVM_REG_MIPS_CP0_HWRENA, &env->CP=
0_HWREna);
> >      if (err < 0) {
> >          DPRINTF("%s: Failed to put CP0_HWRENA (%d)\n", __func__, err);
> > @@ -799,6 +871,11 @@ static int kvm_mips_put_cp0_registers(CPUState *cs=
, int level)
> >          DPRINTF("%s: Failed to put CP0_PRID (%d)\n", __func__, err);
> >          ret =3D err;
> >      }
> > +    err =3D kvm_mips_put_one_ulreg(cs, KVM_REG_MIPS_CP0_EBASE, &env->C=
P0_EBase);
> > +    if (err < 0) {
> > +        DPRINTF("%s: Failed to put CP0_EBASE (%d)\n", __func__, err);
> > +        ret =3D err;
> > +    }
> >      err =3D kvm_mips_change_one_reg(cs, KVM_REG_MIPS_CP0_CONFIG,
> >                                    &env->CP0_Config0,
> >                                    KVM_REG_MIPS_CP0_CONFIG_MASK);
> > @@ -841,12 +918,61 @@ static int kvm_mips_put_cp0_registers(CPUState *c=
s, int level)
> >          DPRINTF("%s: Failed to change CP0_CONFIG5 (%d)\n", __func__, e=
rr);
> >          ret =3D err;
> >      }
> > +    err =3D kvm_mips_change_one_reg(cs, KVM_REG_MIPS_CP0_CONFIG6,
> > +                                  &env->CP0_Config6,
> > +                                  KVM_REG_MIPS_CP0_CONFIG6_MASK);
> > +    if (err < 0) {
> > +        DPRINTF("%s: Failed to change CP0_CONFIG6 (%d)\n", __func__, e=
rr);
> > +        ret =3D err;
> > +    }
> > +    err =3D kvm_mips_put_one_ulreg(cs, KVM_REG_MIPS_CP0_XCONTEXT,
> > +                                 &env->CP0_XContext);
> > +    if (err < 0) {
> > +        DPRINTF("%s: Failed to put CP0_XCONTEXT (%d)\n", __func__, err=
);
> > +        ret =3D err;
> > +    }
> >      err =3D kvm_mips_put_one_ulreg(cs, KVM_REG_MIPS_CP0_ERROREPC,
> >                                   &env->CP0_ErrorEPC);
> >      if (err < 0) {
> >          DPRINTF("%s: Failed to put CP0_ERROREPC (%d)\n", __func__, err=
);
> >          ret =3D err;
> >      }
> > +    err =3D kvm_mips_put_one_ulreg(cs, KVM_REG_MIPS_CP0_KSCRATCH1,
> > +                                 &env->CP0_KScratch[0]);
> > +    if (err < 0) {
> > +        DPRINTF("%s: Failed to put CP0_KSCRATCH1 (%d)\n", __func__, er=
r);
> > +        ret =3D err;
> > +    }
> > +    err =3D kvm_mips_put_one_ulreg(cs, KVM_REG_MIPS_CP0_KSCRATCH2,
> > +                                 &env->CP0_KScratch[1]);
> > +    if (err < 0) {
> > +        DPRINTF("%s: Failed to put CP0_KSCRATCH2 (%d)\n", __func__, er=
r);
> > +        ret =3D err;
> > +    }
> > +    err =3D kvm_mips_put_one_ulreg(cs, KVM_REG_MIPS_CP0_KSCRATCH3,
> > +                                 &env->CP0_KScratch[2]);
> > +    if (err < 0) {
> > +        DPRINTF("%s: Failed to put CP0_KSCRATCH3 (%d)\n", __func__, er=
r);
> > +        ret =3D err;
> > +    }
> > +    err =3D kvm_mips_put_one_ulreg(cs, KVM_REG_MIPS_CP0_KSCRATCH4,
> > +                                 &env->CP0_KScratch[3]);
> > +    if (err < 0) {
> > +        DPRINTF("%s: Failed to put CP0_KSCRATCH4 (%d)\n", __func__, er=
r);
> > +        ret =3D err;
> > +    }
> > +    err =3D kvm_mips_put_one_ulreg(cs, KVM_REG_MIPS_CP0_KSCRATCH5,
> > +                                 &env->CP0_KScratch[4]);
> > +    if (err < 0) {
> > +        DPRINTF("%s: Failed to put CP0_KSCRATCH5 (%d)\n", __func__, er=
r);
> > +        ret =3D err;
> > +    }
> > +    err =3D kvm_mips_put_one_ulreg(cs, KVM_REG_MIPS_CP0_KSCRATCH6,
> > +                                 &env->CP0_KScratch[5]);
> > +    if (err < 0) {
> > +        DPRINTF("%s: Failed to put CP0_KSCRATCH6 (%d)\n", __func__, er=
r);
> > +        ret =3D err;
> > +    }
> >
> >      return ret;
> >  }
> > @@ -862,6 +988,11 @@ static int kvm_mips_get_cp0_registers(CPUState *cs=
)
> >          DPRINTF("%s: Failed to get CP0_INDEX (%d)\n", __func__, err);
> >          ret =3D err;
> >      }
> > +    err =3D kvm_mips_get_one_reg(cs, KVM_REG_MIPS_CP0_RANDOM, &env->CP=
0_Random);
> > +    if (err < 0) {
> > +        DPRINTF("%s: Failed to get CP0_RANDOM (%d)\n", __func__, err);
> > +        ret =3D err;
> > +    }
> >      err =3D kvm_mips_get_one_ulreg(cs, KVM_REG_MIPS_CP0_CONTEXT,
> >                                   &env->CP0_Context);
> >      if (err < 0) {
> > @@ -880,11 +1011,40 @@ static int kvm_mips_get_cp0_registers(CPUState *=
cs)
> >          DPRINTF("%s: Failed to get CP0_PAGEMASK (%d)\n", __func__, err=
);
> >          ret =3D err;
> >      }
> > +    err =3D kvm_mips_get_one_reg(cs, KVM_REG_MIPS_CP0_PAGEGRAIN,
> > +                               &env->CP0_PageGrain);
> > +    if (err < 0) {
> > +        DPRINTF("%s: Failed to get CP0_PAGEGRAIN (%d)\n", __func__, er=
r);
> > +        ret =3D err;
> > +    }
> > +    err =3D kvm_mips_get_one_ulreg(cs, KVM_REG_MIPS_CP0_PWBASE,
> > +                               &env->CP0_PWBase);
> > +    if (err < 0) {
> > +        DPRINTF("%s: Failed to get CP0_PWBASE (%d)\n", __func__, err);
> > +        ret =3D err;
> > +    }
> > +    err =3D kvm_mips_get_one_ulreg(cs, KVM_REG_MIPS_CP0_PWFIELD,
> > +                               &env->CP0_PWField);
> > +    if (err < 0) {
> > +        DPRINTF("%s: Failed to get CP0_PWFIELD (%d)\n", __func__, err)=
;
> > +        ret =3D err;
> > +    }
> > +    err =3D kvm_mips_get_one_ulreg(cs, KVM_REG_MIPS_CP0_PWSIZE,
> > +                               &env->CP0_PWSize);
> > +    if (err < 0) {
> > +        DPRINTF("%s: Failed to get CP0_PWSIZE (%d)\n", __func__, err);
> > +        ret =3D err;
> > +    }
> >      err =3D kvm_mips_get_one_reg(cs, KVM_REG_MIPS_CP0_WIRED, &env->CP0=
_Wired);
> >      if (err < 0) {
> >          DPRINTF("%s: Failed to get CP0_WIRED (%d)\n", __func__, err);
> >          ret =3D err;
> >      }
> > +    err =3D kvm_mips_get_one_reg(cs, KVM_REG_MIPS_CP0_PWCTL, &env->CP0=
_PWCtl);
> > +    if (err < 0) {
> > +        DPRINTF("%s: Failed to get CP0_PWCtl (%d)\n", __func__, err);
> > +        ret =3D err;
> > +    }
> >      err =3D kvm_mips_get_one_reg(cs, KVM_REG_MIPS_CP0_HWRENA, &env->CP=
0_HWREna);
> >      if (err < 0) {
> >          DPRINTF("%s: Failed to get CP0_HWRENA (%d)\n", __func__, err);
> > @@ -932,6 +1092,11 @@ static int kvm_mips_get_cp0_registers(CPUState *c=
s)
> >          DPRINTF("%s: Failed to get CP0_PRID (%d)\n", __func__, err);
> >          ret =3D err;
> >      }
> > +    err =3D kvm_mips_get_one_ulreg(cs, KVM_REG_MIPS_CP0_EBASE, &env->C=
P0_EBase);
> > +    if (err < 0) {
> > +        DPRINTF("%s: Failed to get CP0_EBASE (%d)\n", __func__, err);
> > +        ret =3D err;
> > +    }
> >      err =3D kvm_mips_get_one_reg(cs, KVM_REG_MIPS_CP0_CONFIG, &env->CP=
0_Config0);
> >      if (err < 0) {
> >          DPRINTF("%s: Failed to get CP0_CONFIG (%d)\n", __func__, err);
> > @@ -962,12 +1127,59 @@ static int kvm_mips_get_cp0_registers(CPUState *=
cs)
> >          DPRINTF("%s: Failed to get CP0_CONFIG5 (%d)\n", __func__, err)=
;
> >          ret =3D err;
> >      }
> > +    err =3D kvm_mips_get_one_reg(cs, KVM_REG_MIPS_CP0_CONFIG6, &env->C=
P0_Config6);
> > +    if (err < 0) {
> > +        DPRINTF("%s: Failed to get CP0_CONFIG6 (%d)\n", __func__, err)=
;
> > +        ret =3D err;
> > +    }
> > +    err =3D kvm_mips_get_one_ulreg(cs, KVM_REG_MIPS_CP0_XCONTEXT,
> > +                                 &env->CP0_XContext);
> > +    if (err < 0) {
> > +        DPRINTF("%s: Failed to get CP0_XCONTEXT (%d)\n", __func__, err=
);
> > +        ret =3D err;
> > +    }
> >      err =3D kvm_mips_get_one_ulreg(cs, KVM_REG_MIPS_CP0_ERROREPC,
> >                                   &env->CP0_ErrorEPC);
> >      if (err < 0) {
> >          DPRINTF("%s: Failed to get CP0_ERROREPC (%d)\n", __func__, err=
);
> >          ret =3D err;
> >      }
> > +    err =3D kvm_mips_get_one_ulreg(cs, KVM_REG_MIPS_CP0_KSCRATCH1,
> > +                                 &env->CP0_KScratch[0]);
> > +    if (err < 0) {
> > +        DPRINTF("%s: Failed to get CP0_KSCRATCH1 (%d)\n", __func__, er=
r);
> > +        ret =3D err;
> > +    }
> > +    err =3D kvm_mips_get_one_ulreg(cs, KVM_REG_MIPS_CP0_KSCRATCH2,
> > +                                 &env->CP0_KScratch[1]);
> > +    if (err < 0) {
> > +        DPRINTF("%s: Failed to get CP0_KSCRATCH2 (%d)\n", __func__, er=
r);
> > +        ret =3D err;
> > +    }
> > +    err =3D kvm_mips_get_one_ulreg(cs, KVM_REG_MIPS_CP0_KSCRATCH3,
> > +                                 &env->CP0_KScratch[2]);
> > +    if (err < 0) {
> > +        DPRINTF("%s: Failed to get CP0_KSCRATCH3 (%d)\n", __func__, er=
r);
> > +        ret =3D err;
> > +    }
> > +    err =3D kvm_mips_get_one_ulreg(cs, KVM_REG_MIPS_CP0_KSCRATCH4,
> > +                                 &env->CP0_KScratch[3]);
> > +    if (err < 0) {
> > +        DPRINTF("%s: Failed to get CP0_KSCRATCH4 (%d)\n", __func__, er=
r);
> > +        ret =3D err;
> > +    }
> > +    err =3D kvm_mips_get_one_ulreg(cs, KVM_REG_MIPS_CP0_KSCRATCH5,
> > +                                 &env->CP0_KScratch[4]);
> > +    if (err < 0) {
> > +        DPRINTF("%s: Failed to get CP0_KSCRATCH5 (%d)\n", __func__, er=
r);
> > +        ret =3D err;
> > +    }
> > +    err =3D kvm_mips_get_one_ulreg(cs, KVM_REG_MIPS_CP0_KSCRATCH6,
> > +                                 &env->CP0_KScratch[5]);
> > +    if (err < 0) {
> > +        DPRINTF("%s: Failed to get CP0_KSCRATCH6 (%d)\n", __func__, er=
r);
> > +        ret =3D err;
> > +    }
> >
> >      return ret;
> >  }
> > diff --git a/target/mips/machine.c b/target/mips/machine.c
> > index 8d5b18b..a84aefc 100644
> > --- a/target/mips/machine.c
> > +++ b/target/mips/machine.c
> > @@ -289,6 +289,8 @@ const VMStateDescription vmstate_mips_cpu =3D {
> >          VMSTATE_INT32(env.CP0_Config1, MIPSCPU),
> >          VMSTATE_INT32(env.CP0_Config2, MIPSCPU),
> >          VMSTATE_INT32(env.CP0_Config3, MIPSCPU),
> > +        VMSTATE_INT32(env.CP0_Config4, MIPSCPU),
> > +        VMSTATE_INT32(env.CP0_Config5, MIPSCPU),
> >          VMSTATE_INT32(env.CP0_Config6, MIPSCPU),
> >          VMSTATE_INT32(env.CP0_Config7, MIPSCPU),
> >          VMSTATE_UINT64(env.CP0_LLAddr, MIPSCPU),
> > --
> > 2.7.0
> >
>
> Huacai,
>
> You need to bump two fields in VMStateDescription any time you add new fi=
elds.
>
> This means two instances of "19" should be changed to "20" here:
>
> const VMStateDescription vmstate_mips_cpu =3D {
> .name =3D "cpu",
> .version_id =3D 19,
> .minimum_version_id =3D 19,
> .post_load =3D cpu_post_load,
> .fields =3D (VMStateField[]) {
>
OK, this will be fixed in V2.

> Thanks,
> Aleksandar


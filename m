Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6692F1F6D8E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jun 2020 20:37:41 +0200 (CEST)
Received: from localhost ([::1]:50876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjS55-00027F-Mu
	for lists+qemu-devel@lfdr.de; Thu, 11 Jun 2020 14:37:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jjS4E-0001LN-DR
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 14:36:46 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:34545)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jjS4A-0002Hv-6e
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 14:36:46 -0400
Received: by mail-wm1-x335.google.com with SMTP id u26so7530890wmn.1
 for <qemu-devel@nongnu.org>; Thu, 11 Jun 2020 11:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=C4lGZTOfBAmv5NvbaIoThipkj369sRzWPqjyESkqsLc=;
 b=kX2uWo0OjNYJhBmdOh5hZM4lz44oipHHSe1xCfqrp2n0XVaVT/aBP8n4QnZfsEeivH
 PNCOD7XD1CWEaM7LQwVpseRzZFYegv4Kg2RNcys0wILCHnjz0tvAD1IPw8mEiZV9TbM0
 dpCivZtI5TNVLH730ZfKp1gZZWlXbmddLeL18oVz/U65f5AmUA5aJJbdwR41yjmtCKKo
 SuzArRR0BkyYEq5L6qYyQNHY6nym1NY1DMg/NXYHUU89HgkWTsxOgaK+zWfjdcHtPWr6
 rZrz+M7e8DsUSWeWDgHdPmO5sPiuDKWfOQo+7V6v5qfK0zsxHhEkEt/gqaGYhk/c9hDU
 Az0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=C4lGZTOfBAmv5NvbaIoThipkj369sRzWPqjyESkqsLc=;
 b=P7Wg1JuyKVI07i4U+qHfAdAZnAd/F+P4APah74hkGrrrXpzjexISO1ZVzII5XPI9lE
 Y2bwD8gfcETsNKHmR63aLIFdx0FKelR+jN7odTsyhu75FD9ph6KzR2cbRQT694XvcGbM
 fhVsY9iCzPB5NmLCCP2iVw19EJ4cjavVGNcniHIHxowrYLMRCk9spUsJrHKMlHiUuUWp
 tc7/rIfKT6YaiVOdU/jNPmrvvH8nCjtc0GqBhBxpFuuTHWByB3TfbnyjNlT44w7Wah4v
 cpgZZIi2TQ4GdDC1BjedKnpPS/u7rwv6uTg+YUnWadj+J1balH32SBju5rYmCqhPyjBY
 lArw==
X-Gm-Message-State: AOAM533JQEQWmt+MSttKYgnAGHdftakYSCCtPZkImTcSmK5ztEII/r/e
 ZIJrNteN7I+GIHXCFcGZfIbmnwlKxbSDqsFcx/k=
X-Google-Smtp-Source: ABdhPJwOdximraw+dbqGzq4Hy8hlo0eRWJNexxJ6Hpa6m1BkpwUc02fCs63o5ZiKrV/EcA0Y87nWkIiFB3A+4FCMfeQ=
X-Received: by 2002:a1c:4c05:: with SMTP id z5mr9017664wmf.129.1591900594877; 
 Thu, 11 Jun 2020 11:36:34 -0700 (PDT)
MIME-Version: 1.0
References: <1591015405-19651-1-git-send-email-aleksandar.qemu.devel@gmail.com>
 <1591015405-19651-5-git-send-email-aleksandar.qemu.devel@gmail.com>
 <87h7vi3p9h.fsf@linaro.org>
In-Reply-To: <87h7vi3p9h.fsf@linaro.org>
From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Date: Thu, 11 Jun 2020 20:36:21 +0200
Message-ID: <CAHiYmc6GuADCpWU4UgqnR1mCkRo=n4GafRU_TQYc8oJ7cVMs_Q@mail.gmail.com>
Subject: Re: [PULL 4/6] target/mips: Add more CP0 register for save/restore
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=aleksandar.qemu.devel@gmail.com; helo=mail-wm1-x335.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

=D1=87=D0=B5=D1=82, 11. =D1=98=D1=83=D0=BD 2020. =D1=83 11:50 Alex Benn=C3=
=A9e <alex.bennee@linaro.org> =D1=98=D0=B5 =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=
=D0=B0=D0=BE/=D0=BB=D0=B0:
>
>
> Aleksandar Markovic <aleksandar.qemu.devel@gmail.com> writes:
>
> > From: Huacai Chen <zltjiangshi@gmail.com>
> >
> > Add more CP0 register for save/restore, including: EBase, XContext,
> > PageGrain, PWBase, PWSize, PWField, PWCtl, Config*, KScratch1~KScratch6=
.
> >
> > Signed-off-by: Huacai Chen <chenhc@lemote.com>
> > Co-developed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > Reviewed-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
> > Signed-off-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
> > Message-Id: <1588501221-1205-6-git-send-email-chenhc@lemote.com>
>
> It seems while our mips cross build has been broken this commit has
> caused a build regression:
>

Alex, this problem should disappear now, since a commit that is
supposed to fix it is upstreamed this afternoon.

From my side, I will expand my test bed for similar cases that require
more thorough attention.

Could you just please confirm or disconfirm that your scenario does
not have this problem anymore?

Thanks,
Aleksandar

>   make docker-test-build@debian-mips-cross J=3D30
>
> Results in:
>
>   /tmp/qemu-test/src/target/mips/kvm.c: In function 'kvm_mips_put_cp0_reg=
isters':
>   /tmp/qemu-test/src/target/mips/kvm.c:412:49: error: 'CP0C6_BPPASS' unde=
clared (first use in this function); did you mean 'CP0C3_LPA'?
>    #define KVM_REG_MIPS_CP0_CONFIG6_MASK   ((1U << CP0C6_BPPASS) | \
>                                                    ^~~~~~~~~~~~
>   /tmp/qemu-test/src/target/mips/kvm.c:923:35: note: in expansion of macr=
o 'KVM_REG_MIPS_CP0_CONFIG6_MASK'
>                                      KVM_REG_MIPS_CP0_CONFIG6_MASK);
>                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   /tmp/qemu-test/src/target/mips/kvm.c:412:49: note: each undeclared iden=
tifier is reported only once for each function it appears in
>    #define KVM_REG_MIPS_CP0_CONFIG6_MASK   ((1U << CP0C6_BPPASS) | \
>                                                    ^~~~~~~~~~~~
>   /tmp/qemu-test/src/target/mips/kvm.c:923:35: note: in expansion of macr=
o 'KVM_REG_MIPS_CP0_CONFIG6_MASK'
>                                      KVM_REG_MIPS_CP0_CONFIG6_MASK);
>                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   /tmp/qemu-test/src/target/mips/kvm.c:413:52: error: 'CP0C6_KPOS' undecl=
ared (first use in this function); did you mean 'CP0C3_IPLV'?
>                                             (0x3fU << CP0C6_KPOS) | \
>                                                       ^~~~~~~~~~
>   /tmp/qemu-test/src/target/mips/kvm.c:923:35: note: in expansion of macr=
o 'KVM_REG_MIPS_CP0_CONFIG6_MASK'
>                                      KVM_REG_MIPS_CP0_CONFIG6_MASK);
>                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   /tmp/qemu-test/src/target/mips/kvm.c:414:49: error: 'CP0C6_KE' undeclar=
ed (first use in this function); did you mean 'CP0C4_AE'?
>                                             (1U << CP0C6_KE) | \
>                                                    ^~~~~~~~
>   /tmp/qemu-test/src/target/mips/kvm.c:923:35: note: in expansion of macr=
o 'KVM_REG_MIPS_CP0_CONFIG6_MASK'
>                                      KVM_REG_MIPS_CP0_CONFIG6_MASK);
>
>
> > ---
> >  target/mips/kvm.c     | 212 ++++++++++++++++++++++++++++++++++++++++++=
++++++++
> >  target/mips/machine.c |   6 +-
> >  2 files changed, 216 insertions(+), 2 deletions(-)
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
>
> It seems a lot of the defines here aren't in this commit. Was one missed?
>
> --
> Alex Benn=C3=A9e


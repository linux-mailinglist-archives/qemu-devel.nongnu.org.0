Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id D55221BD30C
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Apr 2020 05:44:40 +0200 (CEST)
Received: from localhost ([::1]:47898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTdeJ-0001LP-EK
	for lists+qemu-devel@lfdr.de; Tue, 28 Apr 2020 23:44:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56494)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chenhuacai@gmail.com>) id 1jTddW-0000vz-8H
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 23:43:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <chenhuacai@gmail.com>) id 1jTddK-0000vU-7Q
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 23:43:49 -0400
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:38752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chenhuacai@gmail.com>)
 id 1jTddJ-0000vH-Oo
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 23:43:37 -0400
Received: by mail-il1-x142.google.com with SMTP id c18so1100633ile.5
 for <qemu-devel@nongnu.org>; Tue, 28 Apr 2020 20:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ATB2/TxwBQ4MRvujsi7t+js5C6MFt3QCWs8/JL/RSIo=;
 b=vHFHcjyLgf6L6pAGPFvObwuSlXoTcCvAmpaB5BVqmH6N1JCWUogLyJo6xDGpHPaFzL
 cDoBCc9+197Gy29appurQ+voefmefXhdeYQHV3OC1BjF/NVhDL80DE/nZMPXmRh5VaOI
 RDHMeLGc6VGQ7mNzYHurBZrfNAtAGurwFJilr/pJj/GO/F3sWlJlYLOVzwBu0RwAxzyo
 8bC3CF+Qk9aVMp1Kep4lhwbqnug7/haTkjwtOQDQFVTjJFtkChPC8Z9IJTWM9iCnOeIq
 Yp8br4Qsmoxpz7uyDAfihYLMvO+8StvilJwdO5tIbhO4nAGZaXE0HimNUgiAHk6zUm2P
 9DsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ATB2/TxwBQ4MRvujsi7t+js5C6MFt3QCWs8/JL/RSIo=;
 b=LQQcUdSvDemEugHa1DAcJbbje/aLXMLFQcMPHCAyNQImT2WVlabrB8Kw6Xxt4Q2syz
 SrPiq6xzo6Z07RvBGlZY95q5xsiKyLayLcGtVDugePR8odCdt1tlqZtaq7uizwNy0+Gm
 rOFFYzrhBmRrGlo8bKoCaBqS0Qb3metk494BuPQBdzl9bGK87E5VzB0+DnRJJTmxSbg8
 k25EgO/a9DMA9w3PpwGR+avZDnNOuMsQoqPj7yYQD+BbAVhXVk4edoOAc/AfIT95L8cx
 Ar8zGfpi2g2xH3cdWl0jh2Pi0pjXyoN+oy2ss9PtyiqQONBQVxEcgMjZqZ/IjITy7Cs6
 Q5Cw==
X-Gm-Message-State: AGi0Pub3ugVRIbIc9USi44z2o/SkZc4SY8BYJO0kKFtek2KnN0L4eUQu
 +3XU3JYwpDb/Lsrexm1IbJ5MSmaGTmSA/VLI3V0=
X-Google-Smtp-Source: APiQypLtWGwSOwDychBLd4VL0WpzINOr/FKDwASJNtJ8nPit1LnY0p9wljAYFuugy2Lnk+R0roA5hCn1Cky+i2tY8Yk=
X-Received: by 2002:a92:5d0f:: with SMTP id r15mr19711162ilb.251.1588131816402; 
 Tue, 28 Apr 2020 20:43:36 -0700 (PDT)
MIME-Version: 1.0
References: <1587979995-17717-1-git-send-email-chenhc@lemote.com>
 <1587979995-17717-4-git-send-email-chenhc@lemote.com>
 <c1a3aec6-dc45-3484-3a70-c06449bee609@amsat.org>
 <CABDp7Vq-YX0LWU3iM=oygpcKzoS8cmXG6mvTQ5Gm_PbQsQMAgw@mail.gmail.com>
 <CAHiYmc6zFjBtgXRv=8+dqnbDtZqKqiwSDwEi0wKqJmJnys_y0g@mail.gmail.com>
In-Reply-To: <CAHiYmc6zFjBtgXRv=8+dqnbDtZqKqiwSDwEi0wKqJmJnys_y0g@mail.gmail.com>
From: Huacai Chen <chenhuacai@gmail.com>
Date: Wed, 29 Apr 2020 11:51:06 +0800
Message-ID: <CAAhV-H6NFV7hbaOp8BwPck3FWm5ZHBpuoA9FDmN6tby5LcoTeg@mail.gmail.com>
Subject: Re: [PATCH for-5.1 4/7] target/mips: Add Loongson-3 CPU definition
To: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::142;
 envelope-from=chenhuacai@gmail.com; helo=mail-il1-x142.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::142
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
Cc: chen huacai <zltjiangshi@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-level <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Aleksandar,

I've tried translate.google.com, and documents are available here:
Loongson-3A R1 (Loongson-3A1000)
User Manual Part 1:
http://ftp.godson.ac.cn/lemote/3A1000_p1.pdf
http://ftp.godson.ac.cn/lemote/Loongson3A1000_processor_user_manual_P1.pdf
(Chinese Version)
User Manual Part 2:
http://ftp.godson.ac.cn/lemote/3A1000_p2.pdf
http://ftp.godson.ac.cn/lemote/Loongson3A1000_processor_user_manual_P2.pdf
(Chinese Version)

Loongson-3A R2 (Loongson-3A2000)
User Manual Part 1:
http://ftp.godson.ac.cn/lemote/3A2000_p1.pdf
http://ftp.godson.ac.cn/lemote/Loongson3A2000_user1.pdf (Chinese Version)
User Manual Part 2:
http://ftp.godson.ac.cn/lemote/3A2000_p2.pdf
http://ftp.godson.ac.cn/lemote/Loongson3A2000_user2.pdf (Chinese Version)

Loongson-3A R3 (Loongson-3A3000)
User Manual Part 1:
http://ftp.godson.ac.cn/lemote/3A3000_p1.pdf
http://ftp.godson.ac.cn/lemote/Loongson3A3000_3B3000usermanual1.pdf
(Chinese Version)
User Manual Part 2:
http://ftp.godson.ac.cn/lemote/3A3000_p2.pdf
http://ftp.godson.ac.cn/lemote/Loongson3A3000_3B3000usermanual2.pdf
(Chinese Version)

Loongson-3A R4 (Loongson-3A4000)
User Manual Part 1:
http://ftp.godson.ac.cn/lemote/3A4000_p1.pdf
http://ftp.godson.ac.cn/lemote/3A4000user.pdf (Chinese Version)
User Manual Part 2:
I'm sorry that it is unavailable now.

On Wed, Apr 29, 2020 at 2:37 AM Aleksandar Markovic
<aleksandar.qemu.devel@gmail.com> wrote:
>
> Huacai,
>
> Can you please do machine translation of the document?
>
> It can be done via translate.google.com (it accepts pdf files, but
> does not have download feature, and workaround is to "print to pdf"...
>
> Thanks in advance!
> Aleksandar
>
> =D1=83=D1=82=D0=BE, 28. =D0=B0=D0=BF=D1=80 2020. =D1=83 10:26 chen huacai=
 <zltjiangshi@gmail.com> =D1=98=D0=B5 =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=
=D0=BE/=D0=BB=D0=B0:
> >
> > Hi, Philippe,
> >
> > On Tue, Apr 28, 2020 at 2:34 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsa=
t.org> wrote:
> > >
> > > Hi Huacai,
> > >
> > > On 4/27/20 11:33 AM, Huacai Chen wrote:
> > > > Loongson-3 CPU family include Loongson-3A R1/R2/R3/R4 and Loongson-=
3B
> > > > R1/R2. Loongson-3A R4 is the newest and its ISA is almost the super=
set
> > > > of all others. To reduce complexity, we just define a "Loongson-3A"=
 CPU
> > > > which is corresponding to Loongson-3A R4. Loongson-3A has CONFIG6 a=
nd
> > > > CONFIG7, so add their bit-fields as well.
> > >
> > > Is there a public datasheet for R4? (If possible in English).
> > I'm sorry that we only have Chinese datasheet in www.loongson.cn.
> >
> > >
> > > >
> > > > Signed-off-by: Huacai Chen <chenhc@lemote.com>
> > > > Co-developed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > > > ---
> > > >  target/mips/cpu.h                | 28 ++++++++++++++++++++++
> > > >  target/mips/internal.h           |  2 ++
> > > >  target/mips/mips-defs.h          |  7 ++++--
> > > >  target/mips/translate.c          |  2 ++
> > > >  target/mips/translate_init.inc.c | 51 ++++++++++++++++++++++++++++=
++++++++++++
> > > >  5 files changed, 88 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/target/mips/cpu.h b/target/mips/cpu.h
> > > > index 94d01ea..0b3c987 100644
> > > > --- a/target/mips/cpu.h
> > > > +++ b/target/mips/cpu.h
> > > > @@ -940,7 +940,35 @@ struct CPUMIPSState {
> > > >  #define CP0C5_UFR          2
> > > >  #define CP0C5_NFExists     0
> > > >      int32_t CP0_Config6;
> > > > +    int32_t CP0_Config6_rw_bitmask;
> > > > +#define CP0C6_BPPASS          31
> > > > +#define CP0C6_KPOS            24
> > > > +#define CP0C6_KE              23
> > > > +#define CP0C6_VTLBONLY        22
> > > > +#define CP0C6_LASX            21
> > > > +#define CP0C6_SSEN            20
> > > > +#define CP0C6_DISDRTIME       19
> > > > +#define CP0C6_PIXNUEN         18
> > > > +#define CP0C6_SCRAND          17
> > > > +#define CP0C6_LLEXCEN         16
> > > > +#define CP0C6_DISVC           15
> > > > +#define CP0C6_VCLRU           14
> > > > +#define CP0C6_DCLRU           13
> > > > +#define CP0C6_PIXUEN          12
> > > > +#define CP0C6_DISBLKLYEN      11
> > > > +#define CP0C6_UMEMUALEN       10
> > > > +#define CP0C6_SFBEN           8
> > > > +#define CP0C6_FLTINT          7
> > > > +#define CP0C6_VLTINT          6
> > > > +#define CP0C6_DISBTB          5
> > > > +#define CP0C6_STPREFCTL       2
> > > > +#define CP0C6_INSTPREF        1
> > > > +#define CP0C6_DATAPREF        0
> > > >      int32_t CP0_Config7;
> > > > +    int64_t CP0_Config7_rw_bitmask;
> > > > +#define CP0C7_NAPCGEN       2
> > > > +#define CP0C7_UNIMUEN       1
> > > > +#define CP0C7_VFPUCGEN      0
> > > >      uint64_t CP0_LLAddr;
> > > >      uint64_t CP0_MAAR[MIPS_MAAR_MAX];
> > > >      int32_t CP0_MAARI;
> > > > diff --git a/target/mips/internal.h b/target/mips/internal.h
> > > > index 1bf274b..7853cb1 100644
> > > > --- a/target/mips/internal.h
> > > > +++ b/target/mips/internal.h
> > > > @@ -36,7 +36,9 @@ struct mips_def_t {
> > > >      int32_t CP0_Config5;
> > > >      int32_t CP0_Config5_rw_bitmask;
> > > >      int32_t CP0_Config6;
> > > > +    int32_t CP0_Config6_rw_bitmask;
> > > >      int32_t CP0_Config7;
> > > > +    int32_t CP0_Config7_rw_bitmask;
> > > >      target_ulong CP0_LLAddr_rw_bitmask;
> > > >      int CP0_LLAddr_shift;
> > > >      int32_t SYNCI_Step;
> > > > diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
> > > > index a831bb4..c2c96db 100644
> > > > --- a/target/mips/mips-defs.h
> > > > +++ b/target/mips/mips-defs.h
> > > > @@ -51,8 +51,9 @@
> > > >   */
> > > >  #define INSN_LOONGSON2E   0x0001000000000000ULL
> > > >  #define INSN_LOONGSON2F   0x0002000000000000ULL
> > > > -#define INSN_VR54XX       0x0004000000000000ULL
> > > > -#define INSN_R5900        0x0008000000000000ULL
> > > > +#define INSN_LOONGSON3A   0x0004000000000000ULL
> > > > +#define INSN_VR54XX       0x0008000000000000ULL
> > > > +#define INSN_R5900        0x0010000000000000ULL
> > > >  /*
> > > >   *   bits 56-63: vendor-specific ASEs
> > > >   */
> > > > @@ -94,6 +95,8 @@
> > > >  /* Wave Computing: "nanoMIPS" */
> > > >  #define CPU_NANOMIPS32  (CPU_MIPS32R6 | ISA_NANOMIPS32)
> > > >
> > > > +#define CPU_LOONGSON3A  (CPU_MIPS64R2 | INSN_LOONGSON3A)
> > > > +
> > > >  /*
> > > >   * Strictly follow the architecture standard:
> > > >   * - Disallow "special" instruction handling for PMON/SPIM.
> > > > diff --git a/target/mips/translate.c b/target/mips/translate.c
> > > > index 25b595a..2caf4cb 100644
> > > > --- a/target/mips/translate.c
> > > > +++ b/target/mips/translate.c
> > > > @@ -31206,7 +31206,9 @@ void cpu_state_reset(CPUMIPSState *env)
> > > >      env->CP0_Config5 =3D env->cpu_model->CP0_Config5;
> > > >      env->CP0_Config5_rw_bitmask =3D env->cpu_model->CP0_Config5_rw=
_bitmask;
> > > >      env->CP0_Config6 =3D env->cpu_model->CP0_Config6;
> > > > +    env->CP0_Config6_rw_bitmask =3D env->cpu_model->CP0_Config6_rw=
_bitmask;
> > > >      env->CP0_Config7 =3D env->cpu_model->CP0_Config7;
> > > > +    env->CP0_Config7_rw_bitmask =3D env->cpu_model->CP0_Config7_rw=
_bitmask;
> > > >      env->CP0_LLAddr_rw_bitmask =3D env->cpu_model->CP0_LLAddr_rw_b=
itmask
> > > >                                   << env->cpu_model->CP0_LLAddr_shi=
ft;
> > > >      env->CP0_LLAddr_shift =3D env->cpu_model->CP0_LLAddr_shift;
> > > > diff --git a/target/mips/translate_init.inc.c b/target/mips/transla=
te_init.inc.c
> > > > index 6d145a9..a32412d 100644
> > > > --- a/target/mips/translate_init.inc.c
> > > > +++ b/target/mips/translate_init.inc.c
> > > > @@ -802,6 +802,57 @@ const mips_def_t mips_defs[] =3D
> > > >          .mmu_type =3D MMU_TYPE_R4000,
> > > >      },
> > > >      {
> > > > +        .name =3D "Loongson-3A",
> > > > +        .CP0_PRid =3D 0x14C000,
> > > > +        /* 64KB I-cache and d-cache. 4 way with 32 bit cache line =
size.  */
> > > > +        .CP0_Config0 =3D MIPS_CONFIG0 | (0x1 << CP0C0_AR) | (0x2 <=
< CP0C0_AT) |
> > > > +                       (MMU_TYPE_R4000 << CP0C0_MT),
> > > > +        .CP0_Config1 =3D MIPS_CONFIG1 | (1 << CP0C1_FP) | (63 << C=
P0C1_MMU) |
> > > > +                       (2 << CP0C1_IS) | (4 << CP0C1_IL) | (3 << C=
P0C1_IA) |
> > > > +                       (2 << CP0C1_DS) | (4 << CP0C1_DL) | (3 << C=
P0C1_DA) |
> > > > +                       (1 << CP0C1_PC) | (1 << CP0C1_WR) | (1 << C=
P0C1_EP),
> > > > +        .CP0_Config2 =3D MIPS_CONFIG2,
> > > > +        .CP0_Config3 =3D MIPS_CONFIG3 | (1U << CP0C3_M) | (1 << CP=
0C3_MSAP) |
> > > > +                       (1 << CP0C3_BP) | (1 << CP0C3_BI) | (1 << C=
P0C3_ULRI) |
> > > > +                       (1 << CP0C3_RXI) | (1 << CP0C3_LPA) | (1 <<=
 CP0C3_VInt),
> > > > +        .CP0_Config4 =3D MIPS_CONFIG4 | (1U << CP0C4_M) | (2 << CP=
0C4_IE) |
> > > > +                       (1 << CP0C4_AE) | (0x1c << CP0C4_KScrExist)=
,
> > > > +        .CP0_Config4_rw_bitmask =3D 0,
> > > > +        .CP0_Config5 =3D MIPS_CONFIG5 | (1 << CP0C5_NFExists) | (1=
 << 18),
> > > > +        .CP0_Config5_rw_bitmask =3D (1 << CP0C5_K) | (1 << CP0C5_C=
V) |
> > > > +                                  (1 << CP0C5_MSAEn) | (1 << CP0C5=
_UFE) |
> > > > +                                  (1 << CP0C5_FRE) | (1 << CP0C5_S=
BRI),
> > > > +        .CP0_Config6 =3D (1 << CP0C6_VCLRU) | (1 << CP0C6_DCLRU) |=
 (1 << CP0C6_SFBEN) |
> > > > +                       (1 << CP0C6_FLTINT) | (1 << CP0C6_INSTPREF)=
 | (1 << CP0C6_DATAPREF),
> > > > +        .CP0_Config6_rw_bitmask =3D (1 << CP0C6_BPPASS) | (0x3f <<=
 CP0C6_KPOS) |
> > > > +                                  (1 << CP0C6_KE) | (1 << CP0C6_VT=
LBONLY) | (1 << CP0C6_LASX) |
> > > > +                                  (1 << CP0C6_SSEN) | (1 << CP0C6_=
DISDRTIME) |
> > > > +                                  (1 << CP0C6_PIXNUEN) | (1 << CP0=
C6_SCRAND) |
> > > > +                                  (1 << CP0C6_LLEXCEN) | (1 << CP0=
C6_DISVC) |
> > > > +                                  (1 << CP0C6_VCLRU) | (1 << CP0C6=
_DCLRU) |
> > > > +                                  (1 << CP0C6_PIXUEN) | (1 << CP0C=
6_DISBLKLYEN) |
> > > > +                                  (1 << CP0C6_UMEMUALEN) | (1 << C=
P0C6_SFBEN) |
> > > > +                                  (1 << CP0C6_FLTINT) | (1 << CP0C=
6_VLTINT) |
> > > > +                                  (1 << CP0C6_DISBTB) | (3 << CP0C=
6_STPREFCTL) |
> > > > +                                  (1 << CP0C6_INSTPREF) | (1 << CP=
0C6_DATAPREF),
> > > > +        .CP0_Config7 =3D 0,
> > > > +        .CP0_Config7_rw_bitmask =3D (1 << CP0C7_NAPCGEN) | (1 << C=
P0C7_UNIMUEN) | \
> > > > +                                  (1 << CP0C7_VFPUCGEN),
> > > > +        .CP0_LLAddr_rw_bitmask =3D 1,
> > > > +        .SYNCI_Step =3D 16,
> > > > +        .CCRes =3D 2,
> > > > +        .CP0_Status_rw_bitmask =3D 0x7DDBFFFF,
> > > > +        .CP0_PageGrain_rw_bitmask =3D (1U << CP0PG_RIE) | (1 << CP=
0PG_XIE) |
> > > > +                    (1 << CP0PG_ELPA) | (1 << CP0PG_IEC),
> > > > +        .CP1_fcr0 =3D (0x5 << FCR0_PRID) | (0x1 << FCR0_REV) | (0x=
1 << FCR0_F64),
> > > > +        .CP1_fcr31 =3D 0,
> > > > +        .CP1_fcr31_rw_bitmask =3D 0xFF83FFFF,
> > > > +        .SEGBITS =3D 48,
> > > > +        .PABITS =3D 48,
> > > > +        .insn_flags =3D CPU_LOONGSON3A,
> > > > +        .mmu_type =3D MMU_TYPE_R4000,
> > > > +    },
> > > > +    {
> > > >          /* A generic CPU providing MIPS64 DSP R2 ASE features.
> > > >             FIXME: Eventually this should be replaced by a real CPU=
 model. */
> > > >          .name =3D "mips64dspr2",
> > > >
> >
> >
> >
> > --
> > Huacai Chen


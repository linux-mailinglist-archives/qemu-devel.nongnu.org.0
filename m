Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDCD565A06
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 17:39:28 +0200 (CEST)
Received: from localhost ([::1]:45078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8OAY-000802-Gd
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 11:39:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1o8O7u-0005Du-4m; Mon, 04 Jul 2022 11:36:42 -0400
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32]:35666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1o8O7r-0004jZ-PS; Mon, 04 Jul 2022 11:36:41 -0400
Received: by mail-vs1-xe32.google.com with SMTP id 189so9382248vsh.2;
 Mon, 04 Jul 2022 08:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=KDmXTljcu1CXFKimqIwEoawNcJ0qr3y8uXm0tAoESDc=;
 b=axbybu7h8nQBzF2soGH+WDFOxWkbqO38BWnx/0XPiwPwjNLQlaZLJV2xUS/10uD/zK
 qkZohjbTCKCfX6+EiiiFGPkZ2Ukrm0Yf3tm1M1cwQDwF2QnZ7tOHj7xTTh+xzgfvEmah
 whiT2/iQ1qHgmzzmizS/y2byulcJqeVzopH7CGyXYhEjlC+EZYEU2P1hQBbiqL5JXgGH
 pwVqbpa3LaV7eqTffJVfk/Hr932yv8NDFQVJC6RX7lY4JyU6QDWzBGqZIuLCd+UlBz/T
 j04f5jxkiT+0IBPo49BHZWiLtptppLOEPleILumsq6uWgNhln8SWdQzuuCFflc/Ed0dn
 uQgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=KDmXTljcu1CXFKimqIwEoawNcJ0qr3y8uXm0tAoESDc=;
 b=pQEBLZ+YGqCCjKdvb1yVQOqYpoJCQZYWBNBWB+cLxmPXNMJZV3l0uFYaQHV1HiuBPK
 2ndzCUIWgirpVGJIvcM7j8+wOYvhu0fNmQrzIdix0kDugYJEmEYdR6yoykfc3UuUiBS0
 eIBYmHfCI1+2QAtDzRCyPWhN7JU+nj/wpa00TTXbdg9neo+DXDNa1HcsAS/2TeSwVwcZ
 of5AAlbrS+BXD/Gzr6ytOG21bWwkQoSyIwSYt5KCUeQvI5ovUnsTRpyS3jmwOX9Z69rF
 clmTBwHES70H9euHKH+/hEbIuxPXFdgaoq1hNZp8p3einWRA5IYZmlpxM/U6IqxfUucx
 3Tzw==
X-Gm-Message-State: AJIora/wbp19ypGZBgCVeUNlxFBFdbVilWD0Ccd249s4NBSIvCsECBrU
 6fQ3QNy6HX1VnQjb6kABMHKQXdSCS4F04mYtPG8=
X-Google-Smtp-Source: AGRyM1vQYDS3c8yoT6uDcgk9hsLF/y+7pIhuedYnT3Pz5NdzumxaNVKNxR6mhKMZ/6zjMkybhDLWYFS+nfH951MB7X8=
X-Received: by 2002:a67:fbcb:0:b0:354:4efd:db37 with SMTP id
 o11-20020a67fbcb000000b003544efddb37mr17629713vsr.17.1656948998069; Mon, 04
 Jul 2022 08:36:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220703195029.23793-1-pali@kernel.org>
 <20220704101851.lgbeojdntx2bzm4f@pali>
In-Reply-To: <20220704101851.lgbeojdntx2bzm4f@pali>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Mon, 4 Jul 2022 23:36:25 +0800
Message-ID: <CAE2XoE_61LQ9Rd7ZTSGCXDS1Jo_0tdRDbPZqUF9eVr2cn-UK=g@mail.gmail.com>
Subject: Re: [PATCH] target/ppc: Fix MPC8555 and MPC8560 core type to e500v1
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, 
 Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 qemu-level <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000070e35805e2fc803d"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=luoyonggang@gmail.com; helo=mail-vs1-xe32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000070e35805e2fc803d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 4, 2022 at 6:20 PM Pali Roh=C3=A1r <pali@kernel.org> wrote:
>
> On Sunday 03 July 2022 21:50:29 Pali Roh=C3=A1r wrote:
> > Commit 80d11f4467c4 ("Add definitions for Freescale PowerPC
implementations")
> > changed core type of MPC8555 and MPC8560 from e500v1 to e500v2.
> >
> > But both MPC8555 and MPC8560 have just e500v1 cores, there are no
features
> > of e500v2 cores. It can be verified by reading NXP documentations:
> > https://www.nxp.com/docs/en/data-sheet/MPC8555EEC.pdf
> > https://www.nxp.com/docs/en/data-sheet/MPC8560EC.pdf
> > https://www.nxp.com/docs/en/reference-manual/MPC8555ERM.pdf
> > https://www.nxp.com/docs/en/reference-manual/MPC8560RM.pdf
> >
> > Therefore fix core type of MPC8555 and MPC8560 back to e500v1.
> >
> > Fixes: 80d11f4467c4 ("Add definitions for Freescale PowerPC
implementations")
> > Signed-off-by: Pali Roh=C3=A1r <pali@kernel.org>
> > ---
>
> Just for completeness, here is list of all Motorola/Freescale/NXP
> processors which were released and have e500v1 or e500v2 cores.
>
> e500v1:
> MPC8540
> MPC8541
> MPC8555
> MPC8560
>
> e500v2:
> BSC9131
> BSC9132
> C291
> C292
> C293
> MPC8533
> MPC8535
> MPC8536
> MPC8543
> MPC8544
> MPC8545
> MPC8547
> MPC8548
> MPC8567
> MPC8568
> MPC8569
> MPC8572
> P1010
> P1011
> P1012
> P1013
> P1014
> P1015
> P1016
> P1020
> P1021
> P1022
> P1024
> P1025
> P2010
> P2020

I'll suggest add this list into comment or commit message for record

>
> (sorted alphabetically; not by release date / generation / feature set)
>
> All this is from public information available on NXP website.
>
> Seems that qemu has support only for some subset of MPC85?? processors.
>
> Historically processors with e500 cores have mpc85xx family codename and
> lot of software have them in mpc85xx architecture subdirectory.
>
> Note that GCC uses -mcpu=3D8540 option for specifying e500v1 core and
> -mcpu=3D8548 option for specifying e500v2 core.
>
> So sometimes (mpc)8540 is alias for e500v1 and (mpc)8548 is alias for
> e500v2.
>
> >  target/ppc/cpu-models.c | 14 +++++++-------
> >  target/ppc/cpu-models.h | 14 +++++++-------
> >  2 files changed, 14 insertions(+), 14 deletions(-)
> >
> > diff --git a/target/ppc/cpu-models.c b/target/ppc/cpu-models.c
> > index 976be5e0d171..44a2710c5843 100644
> > --- a/target/ppc/cpu-models.c
> > +++ b/target/ppc/cpu-models.c
> > @@ -385,19 +385,19 @@
> >      POWERPC_DEF_SVR("mpc8548e_v21", "MPC8548E v2.1",
> >                      CPU_POWERPC_MPC8548E_v21, POWERPC_SVR_8548E_v21,
e500v2)
> >      POWERPC_DEF_SVR("mpc8555_v10", "MPC8555 v1.0",
> > -                    CPU_POWERPC_MPC8555_v10,  POWERPC_SVR_8555_v10,
 e500v2)
> > +                    CPU_POWERPC_MPC8555_v10,  POWERPC_SVR_8555_v10,
 e500v1)
> >      POWERPC_DEF_SVR("mpc8555_v11", "MPC8555 v1.1",
> > -                    CPU_POWERPC_MPC8555_v11,  POWERPC_SVR_8555_v11,
 e500v2)
> > +                    CPU_POWERPC_MPC8555_v11,  POWERPC_SVR_8555_v11,
 e500v1)
> >      POWERPC_DEF_SVR("mpc8555e_v10", "MPC8555E v1.0",
> > -                    CPU_POWERPC_MPC8555E_v10, POWERPC_SVR_8555E_v10,
e500v2)
> > +                    CPU_POWERPC_MPC8555E_v10, POWERPC_SVR_8555E_v10,
e500v1)
> >      POWERPC_DEF_SVR("mpc8555e_v11", "MPC8555E v1.1",
> > -                    CPU_POWERPC_MPC8555E_v11, POWERPC_SVR_8555E_v11,
e500v2)
> > +                    CPU_POWERPC_MPC8555E_v11, POWERPC_SVR_8555E_v11,
e500v1)
> >      POWERPC_DEF_SVR("mpc8560_v10", "MPC8560 v1.0",
> > -                    CPU_POWERPC_MPC8560_v10,  POWERPC_SVR_8560_v10,
 e500v2)
> > +                    CPU_POWERPC_MPC8560_v10,  POWERPC_SVR_8560_v10,
 e500v1)
> >      POWERPC_DEF_SVR("mpc8560_v20", "MPC8560 v2.0",
> > -                    CPU_POWERPC_MPC8560_v20,  POWERPC_SVR_8560_v20,
 e500v2)
> > +                    CPU_POWERPC_MPC8560_v20,  POWERPC_SVR_8560_v20,
 e500v1)
> >      POWERPC_DEF_SVR("mpc8560_v21", "MPC8560 v2.1",
> > -                    CPU_POWERPC_MPC8560_v21,  POWERPC_SVR_8560_v21,
 e500v2)
> > +                    CPU_POWERPC_MPC8560_v21,  POWERPC_SVR_8560_v21,
 e500v1)
> >      POWERPC_DEF_SVR("mpc8567", "MPC8567",
> >                      CPU_POWERPC_MPC8567,      POWERPC_SVR_8567,
 e500v2)
> >      POWERPC_DEF_SVR("mpc8567e", "MPC8567E",
> > diff --git a/target/ppc/cpu-models.h b/target/ppc/cpu-models.h
> > index 76775a74a9b6..1326493a9a05 100644
> > --- a/target/ppc/cpu-models.h
> > +++ b/target/ppc/cpu-models.h
> > @@ -184,13 +184,13 @@ enum {
> >  #define CPU_POWERPC_MPC8548E_v11     CPU_POWERPC_e500v2_v11
> >  #define CPU_POWERPC_MPC8548E_v20     CPU_POWERPC_e500v2_v20
> >  #define CPU_POWERPC_MPC8548E_v21     CPU_POWERPC_e500v2_v21
> > -#define CPU_POWERPC_MPC8555_v10      CPU_POWERPC_e500v2_v10
> > -#define CPU_POWERPC_MPC8555_v11      CPU_POWERPC_e500v2_v11
> > -#define CPU_POWERPC_MPC8555E_v10     CPU_POWERPC_e500v2_v10
> > -#define CPU_POWERPC_MPC8555E_v11     CPU_POWERPC_e500v2_v11
> > -#define CPU_POWERPC_MPC8560_v10      CPU_POWERPC_e500v2_v10
> > -#define CPU_POWERPC_MPC8560_v20      CPU_POWERPC_e500v2_v20
> > -#define CPU_POWERPC_MPC8560_v21      CPU_POWERPC_e500v2_v21
> > +#define CPU_POWERPC_MPC8555_v10      CPU_POWERPC_e500v1_v20
> > +#define CPU_POWERPC_MPC8555_v11      CPU_POWERPC_e500v1_v20
> > +#define CPU_POWERPC_MPC8555E_v10     CPU_POWERPC_e500v1_v20
> > +#define CPU_POWERPC_MPC8555E_v11     CPU_POWERPC_e500v1_v20
> > +#define CPU_POWERPC_MPC8560_v10      CPU_POWERPC_e500v1_v10
> > +#define CPU_POWERPC_MPC8560_v20      CPU_POWERPC_e500v1_v20
> > +#define CPU_POWERPC_MPC8560_v21      CPU_POWERPC_e500v1_v20
> >  #define CPU_POWERPC_MPC8567          CPU_POWERPC_e500v2_v22
> >  #define CPU_POWERPC_MPC8567E         CPU_POWERPC_e500v2_v22
> >  #define CPU_POWERPC_MPC8568          CPU_POWERPC_e500v2_v22
> > --
> > 2.20.1
> >
>


--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--00000000000070e35805e2fc803d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Mon, Jul 4, 2022 at 6:20 PM Pali Roh=C3=A1r &lt=
;<a href=3D"mailto:pali@kernel.org">pali@kernel.org</a>&gt; wrote:<br>&gt;<=
br>&gt; On Sunday 03 July 2022 21:50:29 Pali Roh=C3=A1r wrote:<br>&gt; &gt;=
 Commit 80d11f4467c4 (&quot;Add definitions for Freescale PowerPC implement=
ations&quot;)<br>&gt; &gt; changed core type of MPC8555 and MPC8560 from e5=
00v1 to e500v2.<br>&gt; &gt;<br>&gt; &gt; But both MPC8555 and MPC8560 have=
 just e500v1 cores, there are no features<br>&gt; &gt; of e500v2 cores. It =
can be verified by reading NXP documentations:<br>&gt; &gt; <a href=3D"http=
s://www.nxp.com/docs/en/data-sheet/MPC8555EEC.pdf">https://www.nxp.com/docs=
/en/data-sheet/MPC8555EEC.pdf</a><br>&gt; &gt; <a href=3D"https://www.nxp.c=
om/docs/en/data-sheet/MPC8560EC.pdf">https://www.nxp.com/docs/en/data-sheet=
/MPC8560EC.pdf</a><br>&gt; &gt; <a href=3D"https://www.nxp.com/docs/en/refe=
rence-manual/MPC8555ERM.pdf">https://www.nxp.com/docs/en/reference-manual/M=
PC8555ERM.pdf</a><br>&gt; &gt; <a href=3D"https://www.nxp.com/docs/en/refer=
ence-manual/MPC8560RM.pdf">https://www.nxp.com/docs/en/reference-manual/MPC=
8560RM.pdf</a><br>&gt; &gt;<br>&gt; &gt; Therefore fix core type of MPC8555=
 and MPC8560 back to e500v1.<br>&gt; &gt;<br>&gt; &gt; Fixes: 80d11f4467c4 =
(&quot;Add definitions for Freescale PowerPC implementations&quot;)<br>&gt;=
 &gt; Signed-off-by: Pali Roh=C3=A1r &lt;<a href=3D"mailto:pali@kernel.org"=
>pali@kernel.org</a>&gt;<br>&gt; &gt; ---<br>&gt;<br>&gt; Just for complete=
ness, here is list of all Motorola/Freescale/NXP<br>&gt; processors which w=
ere released and have e500v1 or e500v2 cores.<br>&gt;<br>&gt; e500v1:<br>&g=
t; MPC8540<br>&gt; MPC8541<br>&gt; MPC8555<br>&gt; MPC8560<br>&gt;<br>&gt; =
e500v2:<br>&gt; BSC9131<br>&gt; BSC9132<br>&gt; C291<br>&gt; C292<br>&gt; C=
293<br>&gt; MPC8533<br>&gt; MPC8535<br>&gt; MPC8536<br>&gt; MPC8543<br>&gt;=
 MPC8544<br>&gt; MPC8545<br>&gt; MPC8547<br>&gt; MPC8548<br>&gt; MPC8567<br=
>&gt; MPC8568<br>&gt; MPC8569<br>&gt; MPC8572<br>&gt; P1010<br>&gt; P1011<b=
r>&gt; P1012<br>&gt; P1013<br>&gt; P1014<br>&gt; P1015<br>&gt; P1016<br>&gt=
; P1020<br>&gt; P1021<br>&gt; P1022<br>&gt; P1024<br>&gt; P1025<br>&gt; P20=
10<br>&gt; P2020<div><br></div><div>I&#39;ll suggest add this list into com=
ment or commit message for record</div><div><br>&gt;<br>&gt; (sorted alphab=
etically; not by release date / generation / feature set)<br>&gt;<br>&gt; A=
ll this is from public information available on NXP website.<br>&gt;<br>&gt=
; Seems that qemu has support only for some subset of MPC85?? processors.<b=
r>&gt;<br>&gt; Historically processors with e500 cores have mpc85xx family =
codename and<br>&gt; lot of software have them in mpc85xx architecture subd=
irectory.<br>&gt;<br>&gt; Note that GCC uses -mcpu=3D8540 option for specif=
ying e500v1 core and<br>&gt; -mcpu=3D8548 option for specifying e500v2 core=
.<br>&gt;<br>&gt; So sometimes (mpc)8540 is alias for e500v1 and (mpc)8548 =
is alias for<br>&gt; e500v2.<br>&gt;<br>&gt; &gt; =C2=A0target/ppc/cpu-mode=
ls.c | 14 +++++++-------<br>&gt; &gt; =C2=A0target/ppc/cpu-models.h | 14 ++=
+++++-------<br>&gt; &gt; =C2=A02 files changed, 14 insertions(+), 14 delet=
ions(-)<br>&gt; &gt;<br>&gt; &gt; diff --git a/target/ppc/cpu-models.c b/ta=
rget/ppc/cpu-models.c<br>&gt; &gt; index 976be5e0d171..44a2710c5843 100644<=
br>&gt; &gt; --- a/target/ppc/cpu-models.c<br>&gt; &gt; +++ b/target/ppc/cp=
u-models.c<br>&gt; &gt; @@ -385,19 +385,19 @@<br>&gt; &gt; =C2=A0 =C2=A0 =
=C2=A0POWERPC_DEF_SVR(&quot;mpc8548e_v21&quot;, &quot;MPC8548E v2.1&quot;,<=
br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0CPU_POWERPC_MPC8548E_v21, POWERPC_SVR_8548E_v21, e500v2)<br>&=
gt; &gt; =C2=A0 =C2=A0 =C2=A0POWERPC_DEF_SVR(&quot;mpc8555_v10&quot;, &quot=
;MPC8555 v1.0&quot;,<br>&gt; &gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CPU_POWERPC_MPC8555_v10, =C2=A0POWERPC_SVR_8=
555_v10, =C2=A0e500v2)<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CPU_POWERPC_MPC8555_v10, =C2=A0POWERPC_SV=
R_8555_v10, =C2=A0e500v1)<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0POWERPC_DEF_SVR(=
&quot;mpc8555_v11&quot;, &quot;MPC8555 v1.1&quot;,<br>&gt; &gt; - =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CPU_POWERPC_M=
PC8555_v11, =C2=A0POWERPC_SVR_8555_v11, =C2=A0e500v2)<br>&gt; &gt; + =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CPU_POWERPC_=
MPC8555_v11, =C2=A0POWERPC_SVR_8555_v11, =C2=A0e500v1)<br>&gt; &gt; =C2=A0 =
=C2=A0 =C2=A0POWERPC_DEF_SVR(&quot;mpc8555e_v10&quot;, &quot;MPC8555E v1.0&=
quot;,<br>&gt; &gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0CPU_POWERPC_MPC8555E_v10, POWERPC_SVR_8555E_v10, e500v2)<b=
r>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0CPU_POWERPC_MPC8555E_v10, POWERPC_SVR_8555E_v10, e500v1)<br>&gt; =
&gt; =C2=A0 =C2=A0 =C2=A0POWERPC_DEF_SVR(&quot;mpc8555e_v11&quot;, &quot;MP=
C8555E v1.1&quot;,<br>&gt; &gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0CPU_POWERPC_MPC8555E_v11, POWERPC_SVR_8555E_v11=
, e500v2)<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0CPU_POWERPC_MPC8555E_v11, POWERPC_SVR_8555E_v11, e500v1=
)<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0POWERPC_DEF_SVR(&quot;mpc8560_v10&quot;,=
 &quot;MPC8560 v1.0&quot;,<br>&gt; &gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CPU_POWERPC_MPC8560_v10, =C2=A0POWERP=
C_SVR_8560_v10, =C2=A0e500v2)<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CPU_POWERPC_MPC8560_v10, =C2=A0POW=
ERPC_SVR_8560_v10, =C2=A0e500v1)<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0POWERPC_D=
EF_SVR(&quot;mpc8560_v20&quot;, &quot;MPC8560 v2.0&quot;,<br>&gt; &gt; - =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CPU_PO=
WERPC_MPC8560_v20, =C2=A0POWERPC_SVR_8560_v20, =C2=A0e500v2)<br>&gt; &gt; +=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CPU_P=
OWERPC_MPC8560_v20, =C2=A0POWERPC_SVR_8560_v20, =C2=A0e500v1)<br>&gt; &gt; =
=C2=A0 =C2=A0 =C2=A0POWERPC_DEF_SVR(&quot;mpc8560_v21&quot;, &quot;MPC8560 =
v2.1&quot;,<br>&gt; &gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0CPU_POWERPC_MPC8560_v21, =C2=A0POWERPC_SVR_8560_v21, =
=C2=A0e500v2)<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0CPU_POWERPC_MPC8560_v21, =C2=A0POWERPC_SVR_8560_v21=
, =C2=A0e500v1)<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0POWERPC_DEF_SVR(&quot;mpc8=
567&quot;, &quot;MPC8567&quot;,<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CPU_POWERPC_MPC8567, =C2=A0=
 =C2=A0 =C2=A0POWERPC_SVR_8567, =C2=A0 =C2=A0 =C2=A0e500v2)<br>&gt; &gt; =
=C2=A0 =C2=A0 =C2=A0POWERPC_DEF_SVR(&quot;mpc8567e&quot;, &quot;MPC8567E&qu=
ot;,<br>&gt; &gt; diff --git a/target/ppc/cpu-models.h b/target/ppc/cpu-mod=
els.h<br>&gt; &gt; index 76775a74a9b6..1326493a9a05 100644<br>&gt; &gt; ---=
 a/target/ppc/cpu-models.h<br>&gt; &gt; +++ b/target/ppc/cpu-models.h<br>&g=
t; &gt; @@ -184,13 +184,13 @@ enum {<br>&gt; &gt; =C2=A0#define CPU_POWERPC=
_MPC8548E_v11 =C2=A0 =C2=A0 CPU_POWERPC_e500v2_v11<br>&gt; &gt; =C2=A0#defi=
ne CPU_POWERPC_MPC8548E_v20 =C2=A0 =C2=A0 CPU_POWERPC_e500v2_v20<br>&gt; &g=
t; =C2=A0#define CPU_POWERPC_MPC8548E_v21 =C2=A0 =C2=A0 CPU_POWERPC_e500v2_=
v21<br>&gt; &gt; -#define CPU_POWERPC_MPC8555_v10 =C2=A0 =C2=A0 =C2=A0CPU_P=
OWERPC_e500v2_v10<br>&gt; &gt; -#define CPU_POWERPC_MPC8555_v11 =C2=A0 =C2=
=A0 =C2=A0CPU_POWERPC_e500v2_v11<br>&gt; &gt; -#define CPU_POWERPC_MPC8555E=
_v10 =C2=A0 =C2=A0 CPU_POWERPC_e500v2_v10<br>&gt; &gt; -#define CPU_POWERPC=
_MPC8555E_v11 =C2=A0 =C2=A0 CPU_POWERPC_e500v2_v11<br>&gt; &gt; -#define CP=
U_POWERPC_MPC8560_v10 =C2=A0 =C2=A0 =C2=A0CPU_POWERPC_e500v2_v10<br>&gt; &g=
t; -#define CPU_POWERPC_MPC8560_v20 =C2=A0 =C2=A0 =C2=A0CPU_POWERPC_e500v2_=
v20<br>&gt; &gt; -#define CPU_POWERPC_MPC8560_v21 =C2=A0 =C2=A0 =C2=A0CPU_P=
OWERPC_e500v2_v21<br>&gt; &gt; +#define CPU_POWERPC_MPC8555_v10 =C2=A0 =C2=
=A0 =C2=A0CPU_POWERPC_e500v1_v20<br>&gt; &gt; +#define CPU_POWERPC_MPC8555_=
v11 =C2=A0 =C2=A0 =C2=A0CPU_POWERPC_e500v1_v20<br>&gt; &gt; +#define CPU_PO=
WERPC_MPC8555E_v10 =C2=A0 =C2=A0 CPU_POWERPC_e500v1_v20<br>&gt; &gt; +#defi=
ne CPU_POWERPC_MPC8555E_v11 =C2=A0 =C2=A0 CPU_POWERPC_e500v1_v20<br>&gt; &g=
t; +#define CPU_POWERPC_MPC8560_v10 =C2=A0 =C2=A0 =C2=A0CPU_POWERPC_e500v1_=
v10<br>&gt; &gt; +#define CPU_POWERPC_MPC8560_v20 =C2=A0 =C2=A0 =C2=A0CPU_P=
OWERPC_e500v1_v20<br>&gt; &gt; +#define CPU_POWERPC_MPC8560_v21 =C2=A0 =C2=
=A0 =C2=A0CPU_POWERPC_e500v1_v20<br>&gt; &gt; =C2=A0#define CPU_POWERPC_MPC=
8567 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CPU_POWERPC_e500v2_v22<br>&gt; &gt; =
=C2=A0#define CPU_POWERPC_MPC8567E =C2=A0 =C2=A0 =C2=A0 =C2=A0 CPU_POWERPC_=
e500v2_v22<br>&gt; &gt; =C2=A0#define CPU_POWERPC_MPC8568 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0CPU_POWERPC_e500v2_v22<br>&gt; &gt; --<br>&gt; &gt; 2.20.1=
<br>&gt; &gt;<br>&gt;<br><br><br>--<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=E6=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=E5=88=9A<br>Yours<br>=
=C2=A0 =C2=A0 sincerely,<br>Yonggang Luo</div></div>

--00000000000070e35805e2fc803d--


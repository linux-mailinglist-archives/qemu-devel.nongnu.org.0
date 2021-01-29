Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB4B308B9F
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 18:36:44 +0100 (CET)
Received: from localhost ([::1]:50554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5XhL-0001kB-KF
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 12:36:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1l5XNK-00081P-S3
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 12:16:02 -0500
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230]:46638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1l5XNI-0000Or-Kb
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 12:16:02 -0500
Received: by mail-lj1-x230.google.com with SMTP id v15so8327464ljk.13
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 09:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UxNAO3Hw9jqA6BhIHN34CklmQt3rRBCY2yr0ZMbSGfI=;
 b=mEYFoIy2fTwEliPZl3tL1NE4oYz0D+GMHHS+fW1WipoCDctRuJq6goZy8+NEXU0Q6p
 Pr1OeC88DyYzRWKpjhccuPEJHq798lHq6oGW2/R2Lnts4PbEdAUG7vFTA3tTXoyczWmF
 pHhncCpGBrSZ9Vj+Fq4fkfaTRvZcNkHifJv/HgD6Zojm5k8vu5a8V79rN1iO1nCtb8Z/
 8EqsIG/XkXUO9fDFhZ+xMjzzZUB2MpZW1Vg7cd+8Rmn+2ubBLQijDWRosXgYrohfaBmR
 +KHfm9TkKZ6MzVZu/sNvvKTvXqMzV4q9K+DYO4cyQiU/TvAbY8zRPoUinaMYPUn7dEfD
 6eDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UxNAO3Hw9jqA6BhIHN34CklmQt3rRBCY2yr0ZMbSGfI=;
 b=Yr5cRdHTiU95Cgk+zexs44vIgW5PV8WoaRuNNb/83bjasVn6y2yQmUfJWPepDvQFT+
 //HN5Fw7LZCVTf/uP/0K0IMUtoYs2ENr3uwpxpbl6FghisZ3cjk1p8EETPLc00n9SLBe
 p8Mw7Qpi5Sw5l+5C9LSEPkU9IDbVhWz+bmjTA7g6BBi9Ge6X2kjtaNHOOkQfWiMCiVg1
 AioSFr1JiI4iduP18Ubn5vgdYOkrsbdGz4Rl0eGEQFGKoL9lJDUVQhpxMhHncblzAlhx
 eX/WfXsI+2wwrJFD0pMIvcrvDo8t7rDATyR1RaP4T0sjxiIR+vRPdglKbzC2JVHv8v79
 7p6A==
X-Gm-Message-State: AOAM530SU74wsVqSOAnECsPGYT9ibniztlDH73gjiud1QZbicRuRRCqp
 PWwmr8fbHOYuyupuUL6NioXCx9z9VzrtmNg5hPw4WQ==
X-Google-Smtp-Source: ABdhPJxmd/e2/TUOolUuJCSIRue70uJCmx4AV8t8Glgp27tLLQM7mWlwWttpSS3csd2FqvdFRbDinTqqCYjwzwLa0fY=
X-Received: by 2002:a2e:8ec3:: with SMTP id e3mr2811491ljl.467.1611940556820; 
 Fri, 29 Jan 2021 09:15:56 -0800 (PST)
MIME-Version: 1.0
References: <20210112165750.30475-1-peter.maydell@linaro.org>
 <20210112165750.30475-18-peter.maydell@linaro.org>
 <461061a0-e516-9e98-308e-a8f270487d5c@amsat.org>
In-Reply-To: <461061a0-e516-9e98-308e-a8f270487d5c@amsat.org>
Date: Fri, 29 Jan 2021 09:15:41 -0800
Message-ID: <CAGcCb10p1Q2vxjfOshYx101206jqrQ9L-KkONqOuAwZpdL77SQ@mail.gmail.com>
Subject: Re: [PULL 17/21] hw/adc: Add an ADC module for NPCM7XX
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="0000000000004a4f1205ba0d2894"
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=wuhaotsh@google.com; helo=mail-lj1-x230.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Tyrone Ting <kfting@nuvoton.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Havard Skinnemoen <hskinnemoen@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Hao Wu <wuhaotsh@google.com>
From: wuhaotsh--- via <qemu-devel@nongnu.org>

--0000000000004a4f1205ba0d2894
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 29, 2021 at 6:41 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
wrote:

> Hi Hao Wu,
>
> On 1/12/21 5:57 PM, Peter Maydell wrote:
> > From: Hao Wu <wuhaotsh@google.com>
> >
> > The ADC is part of NPCM7XX Module. Its behavior is controled by the
> > ADC_CON register. It converts one of the eight analog inputs into a
> > digital input and stores it in the ADC_DATA register when enabled.
> >
> > Users can alter input value by using qom-set QMP command.
> >
> > Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
> > Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> > Signed-off-by: Hao Wu <wuhaotsh@google.com>
> > Message-id: 20210108190945.949196-4-wuhaotsh@google.com
> > [PMM: Added missing hw/adc/trace.h file]
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  docs/system/arm/nuvoton.rst    |   2 +-
> >  meson.build                    |   1 +
> >  hw/adc/trace.h                 |   1 +
> >  include/hw/adc/npcm7xx_adc.h   |  69 ++++++
> >  include/hw/arm/npcm7xx.h       |   2 +
> >  hw/adc/npcm7xx_adc.c           | 301 ++++++++++++++++++++++++++
> >  hw/arm/npcm7xx.c               |  24 ++-
> >  tests/qtest/npcm7xx_adc-test.c | 377 +++++++++++++++++++++++++++++++++
> >  hw/adc/meson.build             |   1 +
> >  hw/adc/trace-events            |   5 +
> >  tests/qtest/meson.build        |   3 +-
> >  11 files changed, 783 insertions(+), 3 deletions(-)
> >  create mode 100644 hw/adc/trace.h
> >  create mode 100644 include/hw/adc/npcm7xx_adc.h
> >  create mode 100644 hw/adc/npcm7xx_adc.c
> >  create mode 100644 tests/qtest/npcm7xx_adc-test.c
> >  create mode 100644 hw/adc/trace-events
> ...
>
> > diff --git a/hw/adc/npcm7xx_adc.c b/hw/adc/npcm7xx_adc.c
> > new file mode 100644
> > index 00000000000..870a6d50c27
> > --- /dev/null
> > +++ b/hw/adc/npcm7xx_adc.c
> > @@ -0,0 +1,301 @@
> > +/*
> > + * Nuvoton NPCM7xx ADC Module
> > + *
> > + * Copyright 2020 Google LLC
> > + *
> > + * This program is free software; you can redistribute it and/or modif=
y
> it
> > + * under the terms of the GNU General Public License as published by t=
he
> > + * Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful, but
> WITHOUT
> > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY =
or
> > + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public Licens=
e
> > + * for more details.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "hw/adc/npcm7xx_adc.h"
> > +#include "hw/qdev-clock.h"
> > +#include "hw/qdev-properties.h"
> > +#include "hw/registerfields.h"
> > +#include "migration/vmstate.h"
> > +#include "qemu/log.h"
> > +#include "qemu/module.h"
> > +#include "qemu/timer.h"
> > +#include "qemu/units.h"
> > +#include "trace.h"
> > +
> > +REG32(NPCM7XX_ADC_CON, 0x0)
> > +REG32(NPCM7XX_ADC_DATA, 0x4)
> > +
> > +/* Register field definitions. */
> > +#define NPCM7XX_ADC_CON_MUX(rv) extract32(rv, 24, 4)
> > +#define NPCM7XX_ADC_CON_INT_EN  BIT(21)
> > +#define NPCM7XX_ADC_CON_REFSEL  BIT(19)
> > +#define NPCM7XX_ADC_CON_INT     BIT(18)
> > +#define NPCM7XX_ADC_CON_EN      BIT(17)
> > +#define NPCM7XX_ADC_CON_RST     BIT(16)
> > +#define NPCM7XX_ADC_CON_CONV    BIT(14)
> > +#define NPCM7XX_ADC_CON_DIV(rv) extract32(rv, 1, 8)
> > +
> > +#define NPCM7XX_ADC_MAX_RESULT      1023
> > +#define NPCM7XX_ADC_DEFAULT_IREF    2000000
> > +#define NPCM7XX_ADC_CONV_CYCLES     20
> > +#define NPCM7XX_ADC_RESET_CYCLES    10
> > +#define NPCM7XX_ADC_R0_INPUT        500000
> > +#define NPCM7XX_ADC_R1_INPUT        1500000
> > +
> > +static void npcm7xx_adc_reset(NPCM7xxADCState *s)
> > +{
> > +    timer_del(&s->conv_timer);
> > +    s->con =3D 0x000c0001;
>
> This initialize CON to:
>
> NPCM7XX_ADC_CON_REFSEL | NPCM7XX_ADC_CON_INT | BIT(0)
>
> What is bit 0?
>
This reset value is from h/w spec. The bit is reserved and not used
currently.

>
> > +    s->data =3D 0x00000000;
> > +}
>

--0000000000004a4f1205ba0d2894
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 29, 2021 at 6:41 AM Phili=
ppe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org" target=3D"_bl=
ank">f4bug@amsat.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Hi Hao Wu,<br>
<br>
On 1/12/21 5:57 PM, Peter Maydell wrote:<br>
&gt; From: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" target=3D"_bla=
nk">wuhaotsh@google.com</a>&gt;<br>
&gt; <br>
&gt; The ADC is part of NPCM7XX Module. Its behavior is controled by the<br=
>
&gt; ADC_CON register. It converts one of the eight analog inputs into a<br=
>
&gt; digital input and stores it in the ADC_DATA register when enabled.<br>
&gt; <br>
&gt; Users can alter input value by using qom-set QMP command.<br>
&gt; <br>
&gt; Reviewed-by: Havard Skinnemoen &lt;<a href=3D"mailto:hskinnemoen@googl=
e.com" target=3D"_blank">hskinnemoen@google.com</a>&gt;<br>
&gt; Reviewed-by: Tyrone Ting &lt;<a href=3D"mailto:kfting@nuvoton.com" tar=
get=3D"_blank">kfting@nuvoton.com</a>&gt;<br>
&gt; Signed-off-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" targe=
t=3D"_blank">wuhaotsh@google.com</a>&gt;<br>
&gt; Message-id: <a href=3D"mailto:20210108190945.949196-4-wuhaotsh@google.=
com" target=3D"_blank">20210108190945.949196-4-wuhaotsh@google.com</a><br>
&gt; [PMM: Added missing hw/adc/trace.h file]<br>
&gt; Reviewed-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.=
org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
&gt; Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linar=
o.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 docs/system/arm/nuvoton.rst=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 hw/adc/trace.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 include/hw/adc/npcm7xx_adc.h=C2=A0 =C2=A0|=C2=A0 69 ++++++<br>
&gt;=C2=A0 include/hw/arm/npcm7xx.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A02 +<br>
&gt;=C2=A0 hw/adc/npcm7xx_adc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 3=
01 ++++++++++++++++++++++++++<br>
&gt;=C2=A0 hw/arm/npcm7xx.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 24 ++-<br>
&gt;=C2=A0 tests/qtest/npcm7xx_adc-test.c | 377 +++++++++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 hw/adc/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 hw/adc/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A05 +<br>
&gt;=C2=A0 tests/qtest/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A03 +-<br>
&gt;=C2=A0 11 files changed, 783 insertions(+), 3 deletions(-)<br>
&gt;=C2=A0 create mode 100644 hw/adc/trace.h<br>
&gt;=C2=A0 create mode 100644 include/hw/adc/npcm7xx_adc.h<br>
&gt;=C2=A0 create mode 100644 hw/adc/npcm7xx_adc.c<br>
&gt;=C2=A0 create mode 100644 tests/qtest/npcm7xx_adc-test.c<br>
&gt;=C2=A0 create mode 100644 hw/adc/trace-events<br>
...<br>
<br>
&gt; diff --git a/hw/adc/npcm7xx_adc.c b/hw/adc/npcm7xx_adc.c<br>
&gt; new file mode 100644<br>
&gt; index 00000000000..870a6d50c27<br>
&gt; --- /dev/null<br>
&gt; +++ b/hw/adc/npcm7xx_adc.c<br>
&gt; @@ -0,0 +1,301 @@<br>
&gt; +/*<br>
&gt; + * Nuvoton NPCM7xx ADC Module<br>
&gt; + *<br>
&gt; + * Copyright 2020 Google LLC<br>
&gt; + *<br>
&gt; + * This program is free software; you can redistribute it and/or modi=
fy it<br>
&gt; + * under the terms of the GNU General Public License as published by =
the<br>
&gt; + * Free Software Foundation; either version 2 of the License, or<br>
&gt; + * (at your option) any later version.<br>
&gt; + *<br>
&gt; + * This program is distributed in the hope that it will be useful, bu=
t WITHOUT<br>
&gt; + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY=
 or<br>
&gt; + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public Licen=
se<br>
&gt; + * for more details.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt; +#include &quot;hw/adc/npcm7xx_adc.h&quot;<br>
&gt; +#include &quot;hw/qdev-clock.h&quot;<br>
&gt; +#include &quot;hw/qdev-properties.h&quot;<br>
&gt; +#include &quot;hw/registerfields.h&quot;<br>
&gt; +#include &quot;migration/vmstate.h&quot;<br>
&gt; +#include &quot;qemu/log.h&quot;<br>
&gt; +#include &quot;qemu/module.h&quot;<br>
&gt; +#include &quot;qemu/timer.h&quot;<br>
&gt; +#include &quot;qemu/units.h&quot;<br>
&gt; +#include &quot;trace.h&quot;<br>
&gt; +<br>
&gt; +REG32(NPCM7XX_ADC_CON, 0x0)<br>
&gt; +REG32(NPCM7XX_ADC_DATA, 0x4)<br>
&gt; +<br>
&gt; +/* Register field definitions. */<br>
&gt; +#define NPCM7XX_ADC_CON_MUX(rv) extract32(rv, 24, 4)<br>
&gt; +#define NPCM7XX_ADC_CON_INT_EN=C2=A0 BIT(21)<br>
&gt; +#define NPCM7XX_ADC_CON_REFSEL=C2=A0 BIT(19)<br>
&gt; +#define NPCM7XX_ADC_CON_INT=C2=A0 =C2=A0 =C2=A0BIT(18)<br>
&gt; +#define NPCM7XX_ADC_CON_EN=C2=A0 =C2=A0 =C2=A0 BIT(17)<br>
&gt; +#define NPCM7XX_ADC_CON_RST=C2=A0 =C2=A0 =C2=A0BIT(16)<br>
&gt; +#define NPCM7XX_ADC_CON_CONV=C2=A0 =C2=A0 BIT(14)<br>
&gt; +#define NPCM7XX_ADC_CON_DIV(rv) extract32(rv, 1, 8)<br>
&gt; +<br>
&gt; +#define NPCM7XX_ADC_MAX_RESULT=C2=A0 =C2=A0 =C2=A0 1023<br>
&gt; +#define NPCM7XX_ADC_DEFAULT_IREF=C2=A0 =C2=A0 2000000<br>
&gt; +#define NPCM7XX_ADC_CONV_CYCLES=C2=A0 =C2=A0 =C2=A020<br>
&gt; +#define NPCM7XX_ADC_RESET_CYCLES=C2=A0 =C2=A0 10<br>
&gt; +#define NPCM7XX_ADC_R0_INPUT=C2=A0 =C2=A0 =C2=A0 =C2=A0 500000<br>
&gt; +#define NPCM7XX_ADC_R1_INPUT=C2=A0 =C2=A0 =C2=A0 =C2=A0 1500000<br>
&gt; +<br>
&gt; +static void npcm7xx_adc_reset(NPCM7xxADCState *s)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 timer_del(&amp;s-&gt;conv_timer);<br>
&gt; +=C2=A0 =C2=A0 s-&gt;con =3D 0x000c0001;<br>
<br>
This initialize CON to:<br>
<br>
NPCM7XX_ADC_CON_REFSEL | NPCM7XX_ADC_CON_INT | BIT(0)<br>
<br>
What is bit 0?<br></blockquote><div>This reset value is from h/w spec. The =
bit is reserved and not used currently.=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 s-&gt;data =3D 0x00000000;<br>
&gt; +}<br>
</blockquote></div></div>

--0000000000004a4f1205ba0d2894--


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC95B454C84
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 18:52:34 +0100 (CET)
Received: from localhost ([::1]:60386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnP6o-0005S2-47
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 12:52:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1mnP4x-0003Li-Oo
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 12:50:39 -0500
Received: from [2a00:1450:4864:20::131] (port=37700
 helo=mail-lf1-x131.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1mnP4v-0002hu-BE
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 12:50:39 -0500
Received: by mail-lf1-x131.google.com with SMTP id c32so12459678lfv.4
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 09:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HoSgA3Rjjgl4hCl3T+4qtK0fiyAYACj89eTCuIOkpIM=;
 b=mWINr3R1u5WQRz1eUNvkk8KXzKxhtbdtlgucqMo1YWhdrt2dFVVPYYBK2z4lC/n5xs
 aiHGXSNHdBF4kYYPReEpzt9WWgxiFo2TZpdUpj/YhOxeY1yeR7kvYSTSGmdgFhwh0Qaz
 0omW+ON0K61U/A1vOkmIrU/jo9fvFTXbk4LHZuNjMDnR9AWt6cVfkcPgI/hDqnDCNqz6
 2URACEu34K6X1KlLDrrFjaVQrqCmMdRYABbMAAy9du10jrfQhZPQ6IZpMKeOHkE9cNnd
 f0J4BuGWeFNW8PV66F9HwVODWHnixKiA0Xple3RMtTlXc9u3Iy6rxtdDL5B3EOzXZKjr
 0wnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HoSgA3Rjjgl4hCl3T+4qtK0fiyAYACj89eTCuIOkpIM=;
 b=6rmm7N30Ux5/kI9yBABGxuVS67umYjSmRX5/hVA772rbradoOTiC6OeQ/HHU3QFsaQ
 2VBoQfxdhRQKixIeWgDr1t7PqU4pvDQKFTE1Nq9cjhKICutcM/VdJqj5XxOxtmL7vV/p
 xkeOqB1JmifKpHa3SxjgaBquLQIbqSKsvlQ8/h7MwY6opUuTT9P+oQmh1jxS4XZf5cRU
 qIg9pnY2tdd/m8d6CThlVCCfnymNcI/P+8XaLDnNR/2Bi1ZdOCUG26iphLWdmQaBOTzp
 yh0CJDUvU8piwyg0qoAnrJBHf58/LNwPbUpIEDa4PrqE23lOc/bB3mxJX0fk4lviOAcP
 aCVQ==
X-Gm-Message-State: AOAM533cAUinxN24HYyWDkPrnVrTsJzumucm/KH4brS34WGU9RZbwTi2
 UtLNtWK35eu6fKWN118OHABI6HBaXhO8MMvWKDHh1g==
X-Google-Smtp-Source: ABdhPJwzMeciXMd/5U1S5KWEiHghMOh2vJpRefedoi9UUB/bXhlmt0XxWIjjb7HErnADpspotHw43vg2/cW1q1LQ7pM=
X-Received: by 2002:a05:6512:368c:: with SMTP id
 d12mr16625478lfs.538.1637171434629; 
 Wed, 17 Nov 2021 09:50:34 -0800 (PST)
MIME-Version: 1.0
References: <20211117163409.3587705-1-armbru@redhat.com>
 <20211117163409.3587705-4-armbru@redhat.com>
 <CAFQmdRaz9aa22KVHup15oquDrt+HviqqNtGvt9tb21=spTKHog@mail.gmail.com>
In-Reply-To: <CAFQmdRaz9aa22KVHup15oquDrt+HviqqNtGvt9tb21=spTKHog@mail.gmail.com>
From: Hao Wu <wuhaotsh@google.com>
Date: Wed, 17 Nov 2021 09:50:13 -0800
Message-ID: <CAGcCb12zYiTcO5t_6872ueNeoj-ggBwnUPCiR+MDAMOjf_N_Fw@mail.gmail.com>
Subject: Re: [PATCH v2 03/13] hw/arm/npcm7xx_boards: Replace drive_get_next()
 by drive_get()
To: Havard Skinnemoen <hskinnemoen@google.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, 
 Tyrone Ting <KFTING@nuvoton.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000cccdb605d0ffadee"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::131
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=wuhaotsh@google.com; helo=mail-lf1-x131.google.com
X-Spam_score_int: -167
X-Spam_score: -16.8
X-Spam_bar: ----------------
X-Spam_report: (-16.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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

--000000000000cccdb605d0ffadee
Content-Type: text/plain; charset="UTF-8"

Yes, there's SD and MMC buses. It looks like the current code only supports
mmc ("soc->mmc.sdhci") but not the sd ("soc->sd.sdhci").

It's probably good to make the bus number a parameter as well and use them
to distinguish. We might need a separate patch to do that.

On Wed, Nov 17, 2021 at 8:54 AM Havard Skinnemoen <hskinnemoen@google.com>
wrote:

> On Wed, Nov 17, 2021 at 8:34 AM Markus Armbruster <armbru@redhat.com>
> wrote:
> >
> > drive_get_next() is basically a bad idea.  It returns the "next" block
> > backend of a certain interface type.  "Next" means bus=0,unit=N, where
> > subsequent calls count N up from zero, per interface type.
> >
> > This lets you define unit numbers implicitly by execution order.  If the
> > order changes, or new calls appear "in the middle", unit numbers change.
> > ABI break.  Hard to spot in review.
> >
> > Machine "quanta-gbs-bmc" connects just one backend with
> > drive_get_next(), but with a helper function.  Change it to use
> > drive_get() directly.  This makes the unit numbers explicit in the
> > code.
> >
> > Cc: Havard Skinnemoen <hskinnemoen@google.com>
> > Cc: Tyrone Ting <kfting@nuvoton.com>
> > Cc: Peter Maydell <peter.maydell@linaro.org>
> > Cc: qemu-arm@nongnu.org
> > Signed-off-by: Markus Armbruster <armbru@redhat.com>
> > ---
> >  hw/arm/npcm7xx_boards.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
> > index dec7d16ae5..d8a49e4e85 100644
> > --- a/hw/arm/npcm7xx_boards.c
> > +++ b/hw/arm/npcm7xx_boards.c
> > @@ -84,9 +84,9 @@ static void npcm7xx_connect_dram(NPCM7xxState *soc,
> MemoryRegion *dram)
> >                               &error_abort);
> >  }
> >
> > -static void sdhci_attach_drive(SDHCIState *sdhci)
> > +static void sdhci_attach_drive(SDHCIState *sdhci, int unit)
> >  {
> > -        DriveInfo *di = drive_get_next(IF_SD);
> > +        DriveInfo *di = drive_get(IF_SD, 0, unit);
>
> +Hao Wu IIRC the chip has separate SD and eMMC buses. Would it make
> sense to take the bus number as a parameter as well? Is bus 0 the
> right one to use in this case?
>
> The existing code always uses bus 0, so this is an improvement either way.
>
> Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
>
> >          BlockBackend *blk = di ? blk_by_legacy_dinfo(di) : NULL;
> >
> >          BusState *bus = qdev_get_child_bus(DEVICE(sdhci), "sd-bus");
> > @@ -374,7 +374,7 @@ static void quanta_gbs_init(MachineState *machine)
> >                            drive_get(IF_MTD, 0, 0));
> >
> >      quanta_gbs_i2c_init(soc);
> > -    sdhci_attach_drive(&soc->mmc.sdhci);
> > +    sdhci_attach_drive(&soc->mmc.sdhci, 0);
> >      npcm7xx_load_kernel(machine, soc);
> >  }
> >
> > --
> > 2.31.1
> >
>

--000000000000cccdb605d0ffadee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes, there&#39;s SD and MMC buses. It looks like the curre=
nt code only supports mmc (&quot;soc-&gt;mmc.sdhci&quot;) but not the sd (&=
quot;soc-&gt;sd.sdhci&quot;).<div><br></div><div>It&#39;s probably good to =
make the bus number a parameter as well and use them to distinguish. We mig=
ht need a separate patch to do that.</div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 17, 2021 at 8:54 AM H=
avard Skinnemoen &lt;<a href=3D"mailto:hskinnemoen@google.com">hskinnemoen@=
google.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Wed, Nov 17, 2021 at 8:34 AM Markus Armbruster &lt;<a href=3D=
"mailto:armbru@redhat.com" target=3D"_blank">armbru@redhat.com</a>&gt; wrot=
e:<br>
&gt;<br>
&gt; drive_get_next() is basically a bad idea.=C2=A0 It returns the &quot;n=
ext&quot; block<br>
&gt; backend of a certain interface type.=C2=A0 &quot;Next&quot; means bus=
=3D0,unit=3DN, where<br>
&gt; subsequent calls count N up from zero, per interface type.<br>
&gt;<br>
&gt; This lets you define unit numbers implicitly by execution order.=C2=A0=
 If the<br>
&gt; order changes, or new calls appear &quot;in the middle&quot;, unit num=
bers change.<br>
&gt; ABI break.=C2=A0 Hard to spot in review.<br>
&gt;<br>
&gt; Machine &quot;quanta-gbs-bmc&quot; connects just one backend with<br>
&gt; drive_get_next(), but with a helper function.=C2=A0 Change it to use<b=
r>
&gt; drive_get() directly.=C2=A0 This makes the unit numbers explicit in th=
e<br>
&gt; code.<br>
&gt;<br>
&gt; Cc: Havard Skinnemoen &lt;<a href=3D"mailto:hskinnemoen@google.com" ta=
rget=3D"_blank">hskinnemoen@google.com</a>&gt;<br>
&gt; Cc: Tyrone Ting &lt;<a href=3D"mailto:kfting@nuvoton.com" target=3D"_b=
lank">kfting@nuvoton.com</a>&gt;<br>
&gt; Cc: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" targ=
et=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
&gt; Cc: <a href=3D"mailto:qemu-arm@nongnu.org" target=3D"_blank">qemu-arm@=
nongnu.org</a><br>
&gt; Signed-off-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.c=
om" target=3D"_blank">armbru@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/arm/npcm7xx_boards.c | 6 +++---<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c<br>
&gt; index dec7d16ae5..d8a49e4e85 100644<br>
&gt; --- a/hw/arm/npcm7xx_boards.c<br>
&gt; +++ b/hw/arm/npcm7xx_boards.c<br>
&gt; @@ -84,9 +84,9 @@ static void npcm7xx_connect_dram(NPCM7xxState *soc, =
MemoryRegion *dram)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;error_abort);<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -static void sdhci_attach_drive(SDHCIState *sdhci)<br>
&gt; +static void sdhci_attach_drive(SDHCIState *sdhci, int unit)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 DriveInfo *di =3D drive_get_next(IF_SD);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 DriveInfo *di =3D drive_get(IF_SD, 0, uni=
t);<br>
<br>
+Hao Wu IIRC the chip has separate SD and eMMC buses. Would it make<br>
sense to take the bus number as a parameter as well? Is bus 0 the<br>
right one to use in this case?<br>
<br>
The existing code always uses bus 0, so this is an improvement either way.<=
br>
<br>
Reviewed-by: Havard Skinnemoen &lt;<a href=3D"mailto:hskinnemoen@google.com=
" target=3D"_blank">hskinnemoen@google.com</a>&gt;<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BlockBackend *blk =3D di ? blk_by_le=
gacy_dinfo(di) : NULL;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BusState *bus =3D qdev_get_child_bus=
(DEVICE(sdhci), &quot;sd-bus&quot;);<br>
&gt; @@ -374,7 +374,7 @@ static void quanta_gbs_init(MachineState *machine)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 drive_get(IF_MTD, 0, 0));<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 quanta_gbs_i2c_init(soc);<br>
&gt; -=C2=A0 =C2=A0 sdhci_attach_drive(&amp;soc-&gt;mmc.sdhci);<br>
&gt; +=C2=A0 =C2=A0 sdhci_attach_drive(&amp;soc-&gt;mmc.sdhci, 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 npcm7xx_load_kernel(machine, soc);<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; --<br>
&gt; 2.31.1<br>
&gt;<br>
</blockquote></div>

--000000000000cccdb605d0ffadee--


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0D4668410
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 21:24:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG46S-0000er-LZ; Thu, 12 Jan 2023 15:23:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1pG46Q-0000eC-7O; Thu, 12 Jan 2023 15:23:10 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1pG46O-0001e9-Dx; Thu, 12 Jan 2023 15:23:09 -0500
Received: by mail-ej1-x62b.google.com with SMTP id tz12so47572724ejc.9;
 Thu, 12 Jan 2023 12:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4YgJnoRRj8q07zq1aQl/2S3bYaj6upl9Qk57j9s4fQk=;
 b=iYc6bI8HXK3a6UZsHhUhtBhKSlMBTBM8JF0P4zmPe9PMN8YJ/QrX3p7EgkRRLRgOLB
 mBk3t8qA6BLRtmDTkgU65wP7o/9K1QqvKwjcKcIsln8gehDOf5p1UWn4V7fc9s/FMhGQ
 HpOCxrp5VsdGJuN2kPTDrbf3P2Fbxpz0nJHSXG8V254IJL2KSfbOPQIlhQQs4i+VOtCA
 v2cy60gDeSafyT27+KzmIdUGpWyospdsuLGoj+g/PTIeCFvjMi82TfF/EXlFbjpiYz6q
 C5FkpB9Sfl1VkvcnjSXRZ09vowOebknoYghsflz/K1HCEP5raIKtl6UPDt0nKCdUJ29N
 wBQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4YgJnoRRj8q07zq1aQl/2S3bYaj6upl9Qk57j9s4fQk=;
 b=uz+StTCu8CzwaqLoYJAuL23Jf5/lxWwpijOe1hmYN0HL8zvpRSuqhoyz0DyAR7MF4o
 6hdh0hdgqkjwyUdgLOOSNdDdpdaAUvCaQgLxYFGT89FqwG44sEuE6oU7JH5+cV9Z8/iR
 d0gXHGLfFkAatMGQVYVBjzCplpLUZXN/Pb27i+yV4Q498xR72ncZjBNmZjYtiD3PzZT8
 NRjJwoLcKdPEB9U5Fk3CBF2uPrHWVui6RBqcaymfsSdVl/XDB10Um/Ze2d5ALIn0PGVn
 iJOJ0S62GkPPdwAjaJzqL1KECRVtIEKfuuXFdlxJeOQQs+FXKTWh2ynBuGysAaU7jzKs
 L/kw==
X-Gm-Message-State: AFqh2kr4hJFHWmOggTbdM7n8O6uPeOgsgCmS04q7VAKI8x0MB/SaD86F
 nZPbTVicKQhNZOuGs+pzwwYxDnKScUXQpRgREbk=
X-Google-Smtp-Source: AMrXdXvHln6Y37ZkBKpskoxiu/vJ6renk2Yy2GnBXfopPh67uxR71g6p8rZ3fTc7mCgDhAfrkKt3E1fqGPt2R/4Rg+Q=
X-Received: by 2002:a17:906:8444:b0:84d:3fa0:ee4f with SMTP id
 e4-20020a170906844400b0084d3fa0ee4fmr1203367ejy.71.1673554985931; Thu, 12 Jan
 2023 12:23:05 -0800 (PST)
MIME-Version: 1.0
References: <cover.1672868854.git.balaton@eik.bme.hu>
 <4162db13bd1da9c6ddd77f185cef738e44790467.1672868854.git.balaton@eik.bme.hu>
 <b821c773-a443-c70b-5d4c-787284028f8a@ilande.co.uk>
 <389d8398-2b77-a64e-7034-79123da6cb86@eik.bme.hu>
In-Reply-To: <389d8398-2b77-a64e-7034-79123da6cb86@eik.bme.hu>
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Thu, 12 Jan 2023 21:22:52 +0100
Message-ID: <CABLmASHE7iiqHnOZxCfaqvz5zwUipG5vunHG_UK8krXu71HOgw@mail.gmail.com>
Subject: Re: [PATCH v7 6/7] mac_newworld: Deprecate mac99 "via" option
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org, 
 qemu-ppc@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000072da8605f216e263"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=hsp.cat7@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--00000000000072da8605f216e263
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 11, 2023 at 1:15 AM BALATON Zoltan <balaton@eik.bme.hu> wrote:

> On Tue, 10 Jan 2023, Mark Cave-Ayland wrote:
> > On 04/01/2023 21:59, BALATON Zoltan wrote:
> >
> >> Setting emulated machine type with a property called "via" is
> >> confusing users so deprecate the "via" option in favour of newly added
> >> explicit machine types. The default via=cuda option is not a valid
> >> config (no real Mac has this combination of hardware) so no machine
> >> type could be defined for that therefore it is kept for backwards
> >> compatibility with older QEMU versions for now but other options
> >> resembling real machines are deprecated.
> >>
> >> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> >
> > I believe that people do use -M mac99,via=cuda to run some rare versions
> of
> > MacOS in QEMU (I think possibly OS X DP and Workgroup Server?), so we
> would
> > want to keep this option somewhere.
>
> The idea is that after previous patches we now have machine types for all
> other via option values (that also match real Mac machines) other than
> via=cude but that is the default for mac99 so after the reprecation period
> when the via option is removed mac99 (which is the same as mac99,via=cuda)
> can remain for this use case (and for backward compatibility) until the
> other machines are fixed to not need this any more. So all via options are
> still available but as different machine types.
>
>
My 2 cents about naming:
It seems less important how the machines are named when their name is not
covering their definition. F.i. the powermac3,1 never had adb, could not be
equipped with a G3 cpu, did not run at 900Mhz. The closest possible
qemu-options based definition of a powermac3,1 (via=pmu) will not run Mac
OS 9.0.4 ;-) due to the 2 USB devices problem. To run that via=cuda is
already needed.



>
> >> ---
> >>   hw/ppc/mac_newworld.c | 9 +++++++++
> >>   1 file changed, 9 insertions(+)
> >>
> >> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
> >> index f07c37328b..adf185bd3a 100644
> >> --- a/hw/ppc/mac_newworld.c
> >> +++ b/hw/ppc/mac_newworld.c
> >> @@ -169,6 +169,15 @@ static void ppc_core99_init(MachineState *machine)
> >>           if (PPC_INPUT(env) == PPC_FLAGS_INPUT_970) {
> >>               warn_report("mac99 with G5 CPU is deprecated, "
> >>                           "use powermac7_3 instead");
> >> +        } else {
> >> +            if (core99_machine->via_config == CORE99_VIA_CONFIG_PMU) {
> >> +                warn_report("mac99,via=pmu is deprecated, "
> >> +                            "use powermac3_1 instead");
> >> +            }
> >> +            if (core99_machine->via_config ==
> CORE99_VIA_CONFIG_PMU_ADB) {
> >> +                warn_report("mac99,via=pmu-adb is deprecated, "
> >> +                            "use powerbook3_2 instead");
> >> +            }
> >>           }
> >>       }
> >>       /* allocate RAM */
> >
> >
> > ATB,
> >
> > Mark.
> >
> >
>
>

--00000000000072da8605f216e263
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 11, 2023 at 1:15 AM BALAT=
ON Zoltan &lt;<a href=3D"mailto:balaton@eik.bme.hu">balaton@eik.bme.hu</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tu=
e, 10 Jan 2023, Mark Cave-Ayland wrote:<br>
&gt; On 04/01/2023 21:59, BALATON Zoltan wrote:<br>
&gt;<br>
&gt;&gt; Setting emulated machine type with a property called &quot;via&quo=
t; is<br>
&gt;&gt; confusing users so deprecate the &quot;via&quot; option in favour =
of newly added<br>
&gt;&gt; explicit machine types. The default via=3Dcuda option is not a val=
id<br>
&gt;&gt; config (no real Mac has this combination of hardware) so no machin=
e<br>
&gt;&gt; type could be defined for that therefore it is kept for backwards<=
br>
&gt;&gt; compatibility with older QEMU versions for now but other options<b=
r>
&gt;&gt; resembling real machines are deprecated.<br>
&gt;&gt; <br>
&gt;&gt; Signed-off-by: BALATON Zoltan &lt;<a href=3D"mailto:balaton@eik.bm=
e.hu" target=3D"_blank">balaton@eik.bme.hu</a>&gt;<br>
&gt;<br>
&gt; I believe that people do use -M mac99,via=3Dcuda to run some rare vers=
ions of <br>
&gt; MacOS in QEMU (I think possibly OS X DP and Workgroup Server?), so we =
would <br>
&gt; want to keep this option somewhere.<br>
<br>
The idea is that after previous patches we now have machine types for all <=
br>
other via option values (that also match real Mac machines) other than <br>
via=3Dcude but that is the default for mac99 so after the reprecation perio=
d <br>
when the via option is removed mac99 (which is the same as mac99,via=3Dcuda=
) <br>
can remain for this use case (and for backward compatibility) until the <br=
>
other machines are fixed to not need this any more. So all via options are =
<br>
still available but as different machine types.<br>
<br></blockquote><div>=C2=A0</div><div>My 2 cents about naming:</div><div>I=
t seems less important how the machines are named when their name is not co=
vering their definition. F.i. the powermac3,1 never had adb, could not be e=
quipped with a G3 cpu, did not run at 900Mhz. The closest possible qemu-opt=
ions based definition of a powermac3,1 (via=3Dpmu) will not run Mac OS 9.0.=
4 ;-) due to the 2 USB devices problem. To run that via=3Dcuda is already n=
eeded. <br></div><div><br></div><div>=C2=A0<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0hw/ppc/mac_newworld.c | 9 +++++++++<br>
&gt;&gt;=C2=A0 =C2=A01 file changed, 9 insertions(+)<br>
&gt;&gt; <br>
&gt;&gt; diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c<br>
&gt;&gt; index f07c37328b..adf185bd3a 100644<br>
&gt;&gt; --- a/hw/ppc/mac_newworld.c<br>
&gt;&gt; +++ b/hw/ppc/mac_newworld.c<br>
&gt;&gt; @@ -169,6 +169,15 @@ static void ppc_core99_init(MachineState *mac=
hine)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (PPC_INPUT(env) =3D=3D =
PPC_FLAGS_INPUT_970) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0warn_report(=
&quot;mac99 with G5 CPU is deprecated, &quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;use powermac7_3 instead&quot;);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (core99_machine-&gt;=
via_config =3D=3D CORE99_VIA_CONFIG_PMU) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 warn_repo=
rt(&quot;mac99,via=3Dpmu is deprecated, &quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;use powermac3_1 instead&quot;);<br=
>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (core99_machine-&gt;=
via_config =3D=3D CORE99_VIA_CONFIG_PMU_ADB) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 warn_repo=
rt(&quot;mac99,via=3Dpmu-adb is deprecated, &quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;use powerbook3_2 instead&quot;);<b=
r>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* allocate RAM */<br>
&gt;<br>
&gt;<br>
&gt; ATB,<br>
&gt;<br>
&gt; Mark.<br>
&gt;<br>
&gt;<br>
<br>
</blockquote></div></div>

--00000000000072da8605f216e263--


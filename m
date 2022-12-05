Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8C9642A4D
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 15:23:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2CN2-00017f-Qb; Mon, 05 Dec 2022 09:23:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ggowri617@gmail.com>)
 id 1p299b-0000p7-9b; Mon, 05 Dec 2022 05:56:55 -0500
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ggowri617@gmail.com>)
 id 1p299Z-0005bE-9V; Mon, 05 Dec 2022 05:56:55 -0500
Received: by mail-lf1-x132.google.com with SMTP id g7so17937620lfv.5;
 Mon, 05 Dec 2022 02:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iYYRBSUv0KkAOiP7FpDeSrChxitZrhyHQMaWH6zoNkY=;
 b=C7r1YM5lIzqVdBFGqeVMgaDsmAZMUWRRMOz/MzX5bZu3+Nxswxo0YMZzsO4+N745Zn
 BQ5Cc8BrOdDbNKA6jfyQwaAQFaw0cxEcTfhxG7D8ib7/hpjKUSkYmOzHB98vmFartDQM
 x9urT+l6SpFvV9Wg/fUMUpoYCFJ+kaDu7o8iXkr3VKJd/HHct8GUmHxZAQebLQWCCjur
 bfuYhV5tdw7iG6k5Rven3CH6XeRkKGx/cgACcPEdSO5lgWCcR7B5IHTOj433XeIRNKZA
 ZTaKR1kQC9rE1dvDhgKc/83kx9orLMwQCF4zMgYVG6U3olMlTj0SkPXo/TIJXYCHTtiF
 6MFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iYYRBSUv0KkAOiP7FpDeSrChxitZrhyHQMaWH6zoNkY=;
 b=ka8eR3nbVPijgePKRm/VzZ18BeAf7+HC7EKViB2sOWBBCADNh4OVQarIq347xHYwrf
 lTP6mJ6m30KhJNJerC5jkl7qyNlK/nL9zv8m4ug/q8HwB6/IzpbsWLU3ZWJ0DUMOuYcZ
 xQ0PUE6tnYw2TsJcmPYpdQXx4EiLweRtgO81sW4USe5qY1tJf79aDkYxVRS99QK++dB/
 yamIPlzG80km3gWLH9w70IQvmp2Ro63P+nzNrKITQ/WSnDbO0IDN+Gbl85N/WOQnuCtr
 Da8Ah+49SbK0rS1xVle/AEv4HZv0GW+RCnsillGTL5TNPKD7dBmxTJf6rG+JZzOAXH8M
 LuLw==
X-Gm-Message-State: ANoB5plsk8n7sS2rNUIw8p9oEZXSvs1wMkch2VR712m3+tCHo07TENet
 wpu3iRkghiEyxQqj7xS4BMnAER4ff0xUSaaP0ek=
X-Google-Smtp-Source: AA0mqf6u/90x7ah4aoFwQX5vtxfGCiDLulSUi61qSF3PhLX5/TVG1/qnXwFnfml0efKQl0CI9bOUQBuRAFsp5Jnq6Ko=
X-Received: by 2002:a05:6512:3b88:b0:4a3:9533:f4c9 with SMTP id
 g8-20020a0565123b8800b004a39533f4c9mr22789670lfv.615.1670237810439; Mon, 05
 Dec 2022 02:56:50 -0800 (PST)
MIME-Version: 1.0
References: <CAJWWW5ikmoujzeYw97QEMG0uBCLyR2mypSe_Td4XJXjXHQFnyQ@mail.gmail.com>
 <dec95b7b-ae39-d0fc-c631-fcf550c0c3cb@linaro.org>
 <BN7PR12MB2801E7666C7FD577A7FC22B1E6189@BN7PR12MB2801.namprd12.prod.outlook.com>
In-Reply-To: <BN7PR12MB2801E7666C7FD577A7FC22B1E6189@BN7PR12MB2801.namprd12.prod.outlook.com>
From: Gowri Shankar <ggowri617@gmail.com>
Date: Mon, 5 Dec 2022 16:26:38 +0530
Message-ID: <CAJWWW5hMxg0jcy_=HnGVEW2akeka+FxPva+fjkcYjPQbbwEYOQ@mail.gmail.com>
Subject: Re: REG: TTC Timer
To: "Konrad, Frederic" <Frederic.Konrad@amd.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
 "qemu-discuss@nongnu.org" <qemu-discuss@nongnu.org>, 
 "Iglesias, Francisco" <francisco.iglesias@amd.com>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: multipart/alternative; boundary="00000000000061bd4005ef128b5e"
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=ggowri617@gmail.com; helo=mail-lf1-x132.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 05 Dec 2022 09:22:55 -0500
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

--00000000000061bd4005ef128b5e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Konrad,

Thanks for your quick response.

Now I want to increment the TTC counter value to enable the system tick.
How to configure the TTC register to increment it in QEMU.

I found the steps to enable the TTC counter which is below. But not able to
increment. If possible could you please share the example source code?

  1. Select clock input source, set prescaler value (slcr.MIO_MUX_SEL
registers, TTC Clock Control register). Ensure TTC is disabled
(ttc.Counter_Control_x [DIS] =3D 1) before proceeding with this step.
2. Set interval value (Interval register). This step is optional, for
interval mode only.
3. Set match value (Match registers). This step is optional, if matching is
to be enabled.
4. Enable interrupt (Interrupt Enable register). This step is optional, if
interrupt is to be enabled.
5. Enable/disable waveform output, enable/disable matching, set counting
direction, set mode, enable counter (TTC Counter Control register). This
step starts the counter.

Thanks & Regards,
P.Gowrishankar

On Mon, Dec 5, 2022 at 4:07 PM Konrad, Frederic <Frederic.Konrad@amd.com>
wrote:

> Hi Philippe,
> Hi Gowri,
>
> The zcu102 has a zynqmp soc object (hw/arm/xlnx-zcu102.c:125):
>
> static void xlnx_zcu102_init(MachineState *machine)
> {
> ...
>     object_initialize_child(OBJECT(machine), "soc", &s->soc,
> TYPE_XLNX_ZYNQMP);
>
> So the TTCs should work in the ZCU102.
>
> Best Regards,
> Fred
>
> -----Original Message-----
> From: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Sent: 05 December 2022 09:24
> To: Gowri Shankar <ggowri617@gmail.com>; QEMU Developers <
> qemu-devel@nongnu.org>; qemu-arm <qemu-arm@nongnu.org>
> Cc: qemu-discuss@nongnu.org; Konrad, Frederic <Frederic.Konrad@amd.com>;
> Iglesias, Francisco <francisco.iglesias@amd.com>; Alistair Francis <
> alistair.francis@wdc.com>
> Subject: Re: REG: TTC Timer
>
> On 22/11/22 12:27, Gowri Shankar wrote:
> > Hi Team,
> >
> > Advance Thanks for Your support.
> >
> > Could you please clarify one point here?
> > I am using a Xilinx ZCU102 machine with QEMU7.1.0.
> >
> > I have seen QEMU 7.1.0 release has TTC timers for the Xilinx-zynqmp
> > SoC model.
> > url: https://wiki.qemu.org/ChangeLog/7.1
> > <https://wiki.qemu.org/ChangeLog/7.1>
> >
> > In this case, can the ZCU102 machine also use the TTC feature?
> > If yes and possible, Could you please share the example code snippet?
> > --
> > Thanks & Regards,
> > P. Gowrishankar.
> > +919944802490
>
> Cc'ing qemu-arm@ mailing list and Xilinx ZCU102 machine developers.
>
>

--=20
Thanks & Regards,
P. Gowrishankar.
+919944802490

--00000000000061bd4005ef128b5e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Konrad,<div><br></div><div>Thanks for your quick respon=
se.</div><div><br></div><div>Now I want to increment the TTC counter value =
to=C2=A0enable=C2=A0the system tick. How to configure the TTC register to i=
ncrement it in QEMU.</div><div><br></div><div>I found the steps to enable t=
he TTC counter which is below. But not able to increment. If possible could=
 you please share the example source code?</div><div><br></div><div>=C2=A0 =
1. Select clock input source, set prescaler value (slcr.MIO_MUX_SEL registe=
rs, TTC Clock Control
register). Ensure TTC is disabled (ttc.Counter_Control_x [DIS] =3D 1) befor=
e proceeding with this
step.=C2=A0</div><div>2. Set interval value (Interval register). This step =
is optional, for interval mode only.=C2=A0</div><div>3. Set match value (Ma=
tch registers). This step is optional, if matching is to be enabled.=C2=A0<=
/div><div>4. Enable interrupt (Interrupt Enable register). This step is opt=
ional, if interrupt is to be enabled.</div><div>5. Enable/disable waveform =
output, enable/disable matching, set counting direction, set mode,
enable counter (TTC Counter Control register). This step starts the counter=
.=C2=A0=C2=A0</div><div><br></div><div><div>Thanks &amp; Regards,<br></div>=
<div>P.Gowrishankar</div></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Mon, Dec 5, 2022 at 4:07 PM Konrad, Frede=
ric &lt;<a href=3D"mailto:Frederic.Konrad@amd.com">Frederic.Konrad@amd.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">H=
i Philippe,<br>
Hi Gowri,<br>
<br>
The zcu102 has a zynqmp soc object (hw/arm/xlnx-zcu102.c:125):<br>
<br>
static void xlnx_zcu102_init(MachineState *machine)<br>
{<br>
...<br>
=C2=A0 =C2=A0 object_initialize_child(OBJECT(machine), &quot;soc&quot;, &am=
p;s-&gt;soc, TYPE_XLNX_ZYNQMP);<br>
<br>
So the TTCs should work in the ZCU102.<br>
<br>
Best Regards,<br>
Fred<br>
<br>
-----Original Message-----<br>
From: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org" =
target=3D"_blank">philmd@linaro.org</a>&gt; <br>
Sent: 05 December 2022 09:24<br>
To: Gowri Shankar &lt;<a href=3D"mailto:ggowri617@gmail.com" target=3D"_bla=
nk">ggowri617@gmail.com</a>&gt;; QEMU Developers &lt;<a href=3D"mailto:qemu=
-devel@nongnu.org" target=3D"_blank">qemu-devel@nongnu.org</a>&gt;; qemu-ar=
m &lt;<a href=3D"mailto:qemu-arm@nongnu.org" target=3D"_blank">qemu-arm@non=
gnu.org</a>&gt;<br>
Cc: <a href=3D"mailto:qemu-discuss@nongnu.org" target=3D"_blank">qemu-discu=
ss@nongnu.org</a>; Konrad, Frederic &lt;<a href=3D"mailto:Frederic.Konrad@a=
md.com" target=3D"_blank">Frederic.Konrad@amd.com</a>&gt;; Iglesias, Franci=
sco &lt;<a href=3D"mailto:francisco.iglesias@amd.com" target=3D"_blank">fra=
ncisco.iglesias@amd.com</a>&gt;; Alistair Francis &lt;<a href=3D"mailto:ali=
stair.francis@wdc.com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<b=
r>
Subject: Re: REG: TTC Timer<br>
<br>
On 22/11/22 12:27, Gowri Shankar wrote:<br>
&gt; Hi Team,<br>
&gt; <br>
&gt; Advance Thanks for Your support.<br>
&gt; <br>
&gt; Could you please clarify one point here?<br>
&gt; I am using a Xilinx ZCU102 machine with QEMU7.1.0.<br>
&gt; <br>
&gt; I have seen QEMU 7.1.0 release has TTC timers for the Xilinx-zynqmp <b=
r>
&gt; SoC model.<br>
&gt; url: <a href=3D"https://wiki.qemu.org/ChangeLog/7.1" rel=3D"noreferrer=
" target=3D"_blank">https://wiki.qemu.org/ChangeLog/7.1</a><br>
&gt; &lt;<a href=3D"https://wiki.qemu.org/ChangeLog/7.1" rel=3D"noreferrer"=
 target=3D"_blank">https://wiki.qemu.org/ChangeLog/7.1</a>&gt;<br>
&gt; <br>
&gt; In this case, can the ZCU102 machine also use the TTC feature?<br>
&gt; If yes and possible, Could you please share the example code snippet?<=
br>
&gt; --<br>
&gt; Thanks &amp; Regards,<br>
&gt; P. Gowrishankar.<br>
&gt; +919944802490<br>
<br>
Cc&#39;ing qemu-arm@ mailing list and Xilinx ZCU102 machine developers.<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Thanks &amp; Regards,<br>P. Gow=
rishankar.<br>+919944802490<br><br><br><br></div></div>

--00000000000061bd4005ef128b5e--


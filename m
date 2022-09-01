Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4B15A9715
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 14:43:47 +0200 (CEST)
Received: from localhost ([::1]:52648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTjXu-00025U-2k
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 08:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTj87-00054c-2X; Thu, 01 Sep 2022 08:17:09 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:40899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTj84-0006St-VV; Thu, 01 Sep 2022 08:17:06 -0400
Received: by mail-qk1-x735.google.com with SMTP id f4so13020805qkl.7;
 Thu, 01 Sep 2022 05:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=1P5odZrjQ5sCu8h6qzRGp2YRuvNMGyJ2EiBE3YA3eAQ=;
 b=XoVBcFlKHRywUQ87kB1YdI5BJ1x4d9tvrFnXV2JBn77BkCzhm4QTZeHYSxt4fU4k6B
 nVOFoC5E/Gu2qYvcitBztXpnJra2UAUXhz0gYVX45bro+HLJd9+pN+sR0MzSNvRBhVL5
 QkD77VzNTQmPgvWU6QsGoC2MjnjkQ53crmwW1/QDG1c/UDFQ29jDjsfhqhzswlq5LN5X
 hIES5KMMhCtyfqvgLjOQkhQMT14HQEB7Lank7AslqGTqrQ9mdTCzezB3btnWrkzRsqLl
 9uu04Qrdjeek9YXbinlZs+OZuYfonrXZrTF5fX0RyLhPt2qPeR3ooxs02JbDhD8KiVFv
 7TDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=1P5odZrjQ5sCu8h6qzRGp2YRuvNMGyJ2EiBE3YA3eAQ=;
 b=zXuhvFvqrvziCRU6tKfe0yJKUjqn5uV6+Yj8uXoG81DP2anoQJMhrxGuXcIvsKT7qy
 Fx5m3o5Z5vZr6XurnL79jF/wpi3wHQvIKIrqa4gkgSqb7QbVo8YsapNtot95htfLL78S
 N0wfrOXdpx0pd5cw0P+t9xzgSPwrfkJ9004nIde+KthvT9sU4Gb+VJoFkKa8rlYpkpJd
 uIhJJuGeTBC4+0+J5HwUFjHTBBeSfkviaT9xtmS0D1VcQcHHbakGiqvfWTt+MTDzYD5l
 rwGT065i4h2RzpDs3cYC1WDrHqH6y5cGNki4yC3oZlKGowZ09gtq0wyEPJYKPTX41Ii4
 EcsQ==
X-Gm-Message-State: ACgBeo0WZ9oKv9Iy53rdjA2QnL4fKzGxKOLYXmW2wvKV58zKut/Rucha
 UpMFlj1oIKeEi7fuSCJIhb3fL5aTy77Yg3VT/2E=
X-Google-Smtp-Source: AA6agR5CRFoVrf3zZgYrRNuQEdAOHTeHhE+9EyQK1ECc03kVhPqmgrAikstABNM0oAnp7/7j4Aithdbo0SSsh3dXXi0=
X-Received: by 2002:a05:620a:a42:b0:6bb:2168:7517 with SMTP id
 j2-20020a05620a0a4200b006bb21687517mr19245916qka.562.1662034623533; Thu, 01
 Sep 2022 05:17:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220831095914.2041-1-shentey@gmail.com>
 <20220831095914.2041-7-shentey@gmail.com>
 <331bbd5a-aeaa-d5c0-cf8f-cde5b22d8a3@eik.bme.hu>
 <96C4E9E5-4875-4B49-B176-673BAAEE7993@gmail.com>
 <48b1c17d-fa2f-c2f7-b22-79eb6e8f55b@eik.bme.hu>
 <5DE06ABD-34E9-4186-9922-B62C92A56798@gmail.com>
 <d32d6e66-ed13-2c9-6da4-d3c63796d66@eik.bme.hu>
In-Reply-To: <d32d6e66-ed13-2c9-6da4-d3c63796d66@eik.bme.hu>
From: Bernhard Beschow <shentey@gmail.com>
Date: Thu, 1 Sep 2022 14:16:50 +0200
Message-ID: <CAG4p6K7_13QNemke_rr8+J5Fr1wqWCcd0pHqsygZRuzc6vDepw@mail.gmail.com>
Subject: Re: [PATCH v3 06/10] hw/isa/vt82c686: Instantiate USB functions in
 host device
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "open list:sam460ex" <qemu-ppc@nongnu.org>, 
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: multipart/alternative; boundary="00000000000057179405e79c97a3"
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=shentey@gmail.com; helo=mail-qk1-x735.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000057179405e79c97a3
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 31, 2022 at 6:02 PM BALATON Zoltan <balaton@eik.bme.hu> wrote:

> On Wed, 31 Aug 2022, BB wrote:
> > Am 31. August 2022 17:03:35 MESZ schrieb BALATON Zoltan <
> balaton@eik.bme.hu>:
> >> On Wed, 31 Aug 2022, BB wrote:
> >>> Am 31. August 2022 15:23:37 MESZ schrieb BALATON Zoltan <
> balaton@eik.bme.hu>:
> >>>> On Wed, 31 Aug 2022, Bernhard Beschow wrote:
> >>>>> The USB functions can be enabled/disabled through the ISA function.
> Also
> >>>>> its interrupt routing can be influenced there.
> >>>>>
> >>>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> >>>>> ---
> >>>>> hw/isa/vt82c686.c   | 12 ++++++++++++
> >>>>> hw/mips/fuloong2e.c |  3 ---
> >>>>> hw/ppc/pegasos2.c   |  4 ----
> >>>>> 3 files changed, 12 insertions(+), 7 deletions(-)
> >>>>>
> >>>>> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> >>>>> index 9d946cea54..66a4b9c230 100644
> >>>>> --- a/hw/isa/vt82c686.c
> >>>>> +++ b/hw/isa/vt82c686.c
> >>>>> @@ -23,6 +23,7 @@
> >>>>> #include "hw/intc/i8259.h"
> >>>>> #include "hw/irq.h"
> >>>>> #include "hw/dma/i8257.h"
> >>>>> +#include "hw/usb/hcd-uhci.h"
> >>>>> #include "hw/timer/i8254.h"
> >>>>> #include "hw/rtc/mc146818rtc.h"
> >>>>> #include "migration/vmstate.h"
> >>>>> @@ -546,6 +547,7 @@ struct ViaISAState {
> >>>>>     qemu_irq *isa_irqs;
> >>>>>     ViaSuperIOState via_sio;
> >>>>>     PCIIDEState ide;
> >>>>> +    UHCIState uhci[2];
> >>>>> };
> >>>>>
> >>>>> static const VMStateDescription vmstate_via = {
> >>>>> @@ -563,6 +565,8 @@ static void via_isa_init(Object *obj)
> >>>>>     ViaISAState *s = VIA_ISA(obj);
> >>>>>
> >>>>>     object_initialize_child(obj, "ide", &s->ide, "via-ide");
> >>>>> +    object_initialize_child(obj, "uhci1", &s->uhci[0],
> "vt82c686b-usb-uhci");
> >>>>> +    object_initialize_child(obj, "uhci2", &s->uhci[1],
> "vt82c686b-usb-uhci");
> >>>>
> >>>> Sorry for not saying this yesterday, this can also be done separately
> so no need for another version of this series if not needed for another
> reason but could we add a define for vt82c686b-usb-uhci in
> include/hw/isa/vt82c686.h and use that here and in
> hw/usb/vt82c686-uhci-pci.c ?
> >>>
> >>> Would creating a dedicated header work, too? Board code doesn't need
> to see the define any longer.
> >>
> >> I don't think it needs a separate header just for this so I'd put it in
> vt82c686.h but I don't mind either way.
> >
> > Alright, I'll take the easy route for now. Splitting in dedicated
> headers (also for the other devices) could be done in a separate series.
>
> I'll do this for via-ac97 when rabasing my WIP patch:
>
> https://osdn.net/projects/qmiga/scm/git/qemu/commits
>
> as I'll need to move ViaAC97State there too for embedding in ViaISAState.
> The other ones
> can stay in vt82c686.h I think.
>
> (The reason this is still WIP is that it does not work and I'm not sure
> why, Maybe I need to test with a Linux guest to find out more but I
> haven't got to that yet.)
>

Hi Zoltan,

I've given your AC97 patches a spin on top of my WIP pc-via branch with a
Mandriva Linux live CD and *drumroll* `qemu-system-x86_64 -M pc -accel kvm
-cpu host`:

https://github.com/shentok/qemu/commits/pc-via

The good news is that the sound controls appeared in the UI but no sound
seemed to be played, though that could also be due to my setup (nested
virtualization).

Perhaps you find it convenient to test with Linux that way.

Best regards,
Bernhard

>
> Regards,
> BALATON Zoltan
>

--00000000000057179405e79c97a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Aug 31, 2022 at 6:02 PM BALATON Z=
oltan &lt;<a href=3D"mailto:balaton@eik.bme.hu">balaton@eik.bme.hu</a>&gt; =
wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On Wed, 31 Aug 2022, BB wrote:<br>
&gt; Am 31. August 2022 17:03:35 MESZ schrieb BALATON Zoltan &lt;<a href=3D=
"mailto:balaton@eik.bme.hu" target=3D"_blank">balaton@eik.bme.hu</a>&gt;:<b=
r>
&gt;&gt; On Wed, 31 Aug 2022, BB wrote:<br>
&gt;&gt;&gt; Am 31. August 2022 15:23:37 MESZ schrieb BALATON Zoltan &lt;<a=
 href=3D"mailto:balaton@eik.bme.hu" target=3D"_blank">balaton@eik.bme.hu</a=
>&gt;:<br>
&gt;&gt;&gt;&gt; On Wed, 31 Aug 2022, Bernhard Beschow wrote:<br>
&gt;&gt;&gt;&gt;&gt; The USB functions can be enabled/disabled through the =
ISA function. Also<br>
&gt;&gt;&gt;&gt;&gt; its interrupt routing can be influenced there.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Signed-off-by: Bernhard Beschow &lt;<a href=3D"mailto:=
shentey@gmail.com" target=3D"_blank">shentey@gmail.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;&gt; hw/isa/vt82c686.c=C2=A0 =C2=A0| 12 ++++++++++++<br>
&gt;&gt;&gt;&gt;&gt; hw/mips/fuloong2e.c |=C2=A0 3 ---<br>
&gt;&gt;&gt;&gt;&gt; hw/ppc/pegasos2.c=C2=A0 =C2=A0|=C2=A0 4 ----<br>
&gt;&gt;&gt;&gt;&gt; 3 files changed, 12 insertions(+), 7 deletions(-)<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c<br>
&gt;&gt;&gt;&gt;&gt; index 9d946cea54..66a4b9c230 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/hw/isa/vt82c686.c<br>
&gt;&gt;&gt;&gt;&gt; +++ b/hw/isa/vt82c686.c<br>
&gt;&gt;&gt;&gt;&gt; @@ -23,6 +23,7 @@<br>
&gt;&gt;&gt;&gt;&gt; #include &quot;hw/intc/i8259.h&quot;<br>
&gt;&gt;&gt;&gt;&gt; #include &quot;hw/irq.h&quot;<br>
&gt;&gt;&gt;&gt;&gt; #include &quot;hw/dma/i8257.h&quot;<br>
&gt;&gt;&gt;&gt;&gt; +#include &quot;hw/usb/hcd-uhci.h&quot;<br>
&gt;&gt;&gt;&gt;&gt; #include &quot;hw/timer/i8254.h&quot;<br>
&gt;&gt;&gt;&gt;&gt; #include &quot;hw/rtc/mc146818rtc.h&quot;<br>
&gt;&gt;&gt;&gt;&gt; #include &quot;migration/vmstate.h&quot;<br>
&gt;&gt;&gt;&gt;&gt; @@ -546,6 +547,7 @@ struct ViaISAState {<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0qemu_irq *isa_irqs;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0ViaSuperIOState via_sio;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0PCIIDEState ide;<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 UHCIState uhci[2];<br>
&gt;&gt;&gt;&gt;&gt; };<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; static const VMStateDescription vmstate_via =3D {<br>
&gt;&gt;&gt;&gt;&gt; @@ -563,6 +565,8 @@ static void via_isa_init(Object *o=
bj)<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0ViaISAState *s =3D VIA_ISA(obj);<br=
>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0object_initialize_child(obj, &quot;=
ide&quot;, &amp;s-&gt;ide, &quot;via-ide&quot;);<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 object_initialize_child(obj, &quot;uhci=
1&quot;, &amp;s-&gt;uhci[0], &quot;vt82c686b-usb-uhci&quot;);<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 object_initialize_child(obj, &quot;uhci=
2&quot;, &amp;s-&gt;uhci[1], &quot;vt82c686b-usb-uhci&quot;);<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Sorry for not saying this yesterday, this can also be done=
 separately so no need for another version of this series if not needed for=
 another reason but could we add a define for vt82c686b-usb-uhci in include=
/hw/isa/vt82c686.h and use that here and in hw/usb/vt82c686-uhci-pci.c ?<br=
>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Would creating a dedicated header work, too? Board code doesn&=
#39;t need to see the define any longer.<br>
&gt;&gt;<br>
&gt;&gt; I don&#39;t think it needs a separate header just for this so I&#3=
9;d put it in vt82c686.h but I don&#39;t mind either way.<br>
&gt;<br>
&gt; Alright, I&#39;ll take the easy route for now. Splitting in dedicated =
headers (also for the other devices) could be done in a separate series.<br=
>
<br>
I&#39;ll do this for via-ac97 when rabasing my WIP patch:<br>
<br>
<a href=3D"https://osdn.net/projects/qmiga/scm/git/qemu/commits" rel=3D"nor=
eferrer" target=3D"_blank">https://osdn.net/projects/qmiga/scm/git/qemu/com=
mits</a><br>
<br>
as I&#39;ll need to move ViaAC97State there too for embedding in ViaISAStat=
e. <br>
The other ones <br>
can stay in vt82c686.h I think.<br>
<br>
(The reason this is still WIP is that it does not work and I&#39;m not sure=
 <br>
why, Maybe I need to test with a Linux guest to find out more but I <br>
haven&#39;t got to that yet.)<br></blockquote><div><br></div><div>Hi Zoltan=
,</div><div><br></div><div>I&#39;ve given your AC97 patches a spin on top o=
f my WIP pc-via branch with a Mandriva Linux live CD and *drumroll* `qemu-s=
ystem-x86_64 -M pc -accel kvm -cpu host`:</div><div><br></div><div><a href=
=3D"https://github.com/shentok/qemu/commits/pc-via">https://github.com/shen=
tok/qemu/commits/pc-via</a></div><div><br></div><div>The good news is that =
the sound controls appeared in the UI but no sound seemed to be played, tho=
ugh that could also be due to my setup (nested virtualization).</div><div><=
br></div><div>Perhaps you find it convenient to test with Linux that way.</=
div><div><br></div><div>Best regards,</div><div>Bernhard<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
<br>
Regards,<br>
BALATON Zoltan<br>
</blockquote></div></div>

--00000000000057179405e79c97a3--


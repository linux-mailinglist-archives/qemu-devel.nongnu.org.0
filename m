Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E057B53325B
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 22:19:01 +0200 (CEST)
Received: from localhost ([::1]:59488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntazd-0006nK-18
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 16:19:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1ntaqI-00066K-Gj
 for qemu-devel@nongnu.org; Tue, 24 May 2022 16:09:22 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:40831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1ntaqG-00029k-Ki
 for qemu-devel@nongnu.org; Tue, 24 May 2022 16:09:22 -0400
Received: by mail-ej1-x62d.google.com with SMTP id wh22so37421788ejb.7
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 13:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T/FqHIf7NSEv04nIwRXyfzp+M95I2EX3ZnQvLtsTKsc=;
 b=MapXtWjdztdEZEVzHf1Kx/OE0x+sZdHdkbcm4F6dYu/+urjYgEmZFtWgGfOWYBNIFw
 uIpKAFmm9TO8yLLTf1AsEnROuAIIgmY2bUvKk4NbYB78YRbLYz2Z3XTJ5g1kNvr+Nf0m
 r2+yLNjORn6PjAGHvY5ib3oOpRGSqWc6RktwvTdcxwWBDKkQIXoYCfK1zMxQaEl9ENZB
 xXAAoTsPnGSXqBSizI6kwcRtj8zkBDKd2+SBxpgVGuxFReGgbwLP5Q02Cm0ogvQBzy3E
 PKyE2wu0gXjM/MEG+8He1psocQZkcKDnsgfxL0fr1g3EnOX/YcvSo5kM9KIqkKmCOO6+
 SSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T/FqHIf7NSEv04nIwRXyfzp+M95I2EX3ZnQvLtsTKsc=;
 b=2FzjvHrpgza0Jrvc1Q+8stvbINWwqj49pZU6f+EfMiL/MWJtJKZo97sTab3Xewtt4f
 sY1z999AQ6nuWTa5uD5eAGlVhisgPa0Nf1cSYXxNlj3qDs8TpY/fweq461BKOdM+nvNw
 8dJusRIqeAkgGMGir/1zDvBrxNd3px5Q4hLw09Z8j0E4PLpVoLrQu0Y2MU4LPpghcfbC
 8TLBY6F8y8MDP7v3pHPxJARb1XZ+kbmXkQh4W89xhIEyc5m/BlBPsLGm4ADrOwt397At
 W1oFZx0fJfMIvI+2wp4aJnFIiEzkiRiEWmuxaOVsClwej9GWurecQGiZ1NVcwVn8YG7d
 QICg==
X-Gm-Message-State: AOAM532StwKp571hLee2HfXs5Hv2mjS2DL+TjsB1PwREnkKeLDdC7Pk+
 0SrcZqffYrVbwLXmm/YNjszF6vV8rlGf/nV+sQEc9Q==
X-Google-Smtp-Source: ABdhPJzL0auNfhjgKsRwuzfftUGNTgAbo01VJp9RAR8zyVhbLb5kNzsEP2q+TO9dQXn3dnIROoHmkzyeoDDq1ddT4pE=
X-Received: by 2002:a17:907:a088:b0:6f4:f661:f77a with SMTP id
 hu8-20020a170907a08800b006f4f661f77amr25991276ejc.77.1653422959284; Tue, 24
 May 2022 13:09:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220223090706.4888-1-damien.hedde@greensocs.com>
 <20220223090706.4888-9-damien.hedde@greensocs.com>
 <5f0b5304-359b-1cc6-6ea0-57ba6b0947f0@gmail.com>
 <427eea9e-710e-cadb-e87f-85c723674662@greensocs.com>
In-Reply-To: <427eea9e-710e-cadb-e87f-85c723674662@greensocs.com>
From: Jim Shu <jim.shu@sifive.com>
Date: Wed, 25 May 2022 04:09:06 +0800
Message-ID: <CALw707qvZzULkt_90K-u8RLV7_9O6=R35Ko5EZv9WKHdLatghg@mail.gmail.com>
Subject: Re: [PATCH v4 08/14] none-machine: add 'ram-addr' property
To: Damien Hedde <damien.hedde@greensocs.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 mark.burton@greensocs.com, edgari@xilinx.com, 
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="00000000000026f92c05dfc78850"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=jim.shu@sifive.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--00000000000026f92c05dfc78850
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tested-by: Jim Shu <jim.shu@sifive.com>

On Fri, Mar 4, 2022 at 12:36 AM Damien Hedde <damien.hedde@greensocs.com>
wrote:

>
>
> On 3/3/22 15:41, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 23/2/22 10:07, Damien Hedde wrote:
> >> Add the property to configure a the base address of the ram.
> >> The default value remains zero.
> >>
> >> This commit is needed to use the 'none' machine as a base, and
> >> subsequently to dynamically populate it using qapi commands. Having
> >> a non null 'ram' is really hard to workaround because of the actual
> >> constraints on the generic loader: it prevents loading binaries
> >> bigger than ram_size (with a null ram, we cannot load anything).
> >> For now we need to be able to use the existing ram creation
> >> feature of the none machine with a configurable base address.
> >>
> >> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> >> ---
> >>   hw/core/null-machine.c | 34 ++++++++++++++++++++++++++++++++--
> >>   1 file changed, 32 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/hw/core/null-machine.c b/hw/core/null-machine.c
> >> index 7eb258af07..5fd1cc0218 100644
> >> --- a/hw/core/null-machine.c
> >> +++ b/hw/core/null-machine.c
> >> @@ -16,9 +16,11 @@
> >>   #include "hw/boards.h"
> >>   #include "exec/address-spaces.h"
> >>   #include "hw/core/cpu.h"
> >> +#include "qapi/visitor.h"
> >>   struct NoneMachineState {
> >>       MachineState parent;
> >> +    uint64_t ram_addr;
> >>   };
> >>   #define TYPE_NONE_MACHINE MACHINE_TYPE_NAME("none")
> >> @@ -26,6 +28,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(NoneMachineState,
> >> NONE_MACHINE)
> >>   static void machine_none_init(MachineState *mch)
> >>   {
> >> +    NoneMachineState *nms =3D NONE_MACHINE(mch);
> >>       CPUState *cpu =3D NULL;
> >>       /* Initialize CPU (if user asked for it) */
> >> @@ -37,9 +40,13 @@ static void machine_none_init(MachineState *mch)
> >>           }
> >>       }
> >> -    /* RAM at address zero */
> >> +    /* RAM at configured address (default: 0) */
> >>       if (mch->ram) {
> >> -        memory_region_add_subregion(get_system_memory(), 0, mch->ram)=
;
> >> +        memory_region_add_subregion(get_system_memory(), nms->ram_add=
r,
> >> +                                    mch->ram);
> >> +    } else if (nms->ram_addr) {
> >> +        error_report("'ram-addr' has been specified but the size is
> >> zero");
> >
> > I'm not sure about this error message, IIUC we can get here if no ram
> > backend is provided, not if we have one zero-sized. Otherwise LGTM.
>
> You're most probably right. Keeping the ram_size to 0 is just one way of
> getting here. I can replace the message by a more generic formulation
> "'ram-addr' has been specified but the machine has no ram"
>
>
>

--00000000000026f92c05dfc78850
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Tested-by: Jim Shu &lt;<a href=3D"mailto:jim.shu@sifive.co=
m" target=3D"_blank">jim.shu@sifive.com</a>&gt;<br></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 4, 2022 at 1=
2:36 AM Damien Hedde &lt;<a href=3D"mailto:damien.hedde@greensocs.com" targ=
et=3D"_blank">damien.hedde@greensocs.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 3/3/22 15:41, Philippe Mathieu-Daud=C3=A9 wrote:<br>
&gt; On 23/2/22 10:07, Damien Hedde wrote:<br>
&gt;&gt; Add the property to configure a the base address of the ram.<br>
&gt;&gt; The default value remains zero.<br>
&gt;&gt;<br>
&gt;&gt; This commit is needed to use the &#39;none&#39; machine as a base,=
 and<br>
&gt;&gt; subsequently to dynamically populate it using qapi commands. Havin=
g<br>
&gt;&gt; a non null &#39;ram&#39; is really hard to workaround because of t=
he actual<br>
&gt;&gt; constraints on the generic loader: it prevents loading binaries<br=
>
&gt;&gt; bigger than ram_size (with a null ram, we cannot load anything).<b=
r>
&gt;&gt; For now we need to be able to use the existing ram creation<br>
&gt;&gt; feature of the none machine with a configurable base address.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Damien Hedde &lt;<a href=3D"mailto:damien.hedde@gre=
ensocs.com" target=3D"_blank">damien.hedde@greensocs.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; =C2=A0 hw/core/null-machine.c | 34 +++++++++++++++++++++++++++++++=
+--<br>
&gt;&gt; =C2=A0 1 file changed, 32 insertions(+), 2 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/hw/core/null-machine.c b/hw/core/null-machine.c<br>
&gt;&gt; index 7eb258af07..5fd1cc0218 100644<br>
&gt;&gt; --- a/hw/core/null-machine.c<br>
&gt;&gt; +++ b/hw/core/null-machine.c<br>
&gt;&gt; @@ -16,9 +16,11 @@<br>
&gt;&gt; =C2=A0 #include &quot;hw/boards.h&quot;<br>
&gt;&gt; =C2=A0 #include &quot;exec/address-spaces.h&quot;<br>
&gt;&gt; =C2=A0 #include &quot;hw/core/cpu.h&quot;<br>
&gt;&gt; +#include &quot;qapi/visitor.h&quot;<br>
&gt;&gt; =C2=A0 struct NoneMachineState {<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MachineState parent;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 uint64_t ram_addr;<br>
&gt;&gt; =C2=A0 };<br>
&gt;&gt; =C2=A0 #define TYPE_NONE_MACHINE MACHINE_TYPE_NAME(&quot;none&quot=
;)<br>
&gt;&gt; @@ -26,6 +28,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(NoneMachineState, <br=
>
&gt;&gt; NONE_MACHINE)<br>
&gt;&gt; =C2=A0 static void machine_none_init(MachineState *mch)<br>
&gt;&gt; =C2=A0 {<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 NoneMachineState *nms =3D NONE_MACHINE(mch);<b=
r>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CPUState *cpu =3D NULL;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Initialize CPU (if user asked fo=
r it) */<br>
&gt;&gt; @@ -37,9 +40,13 @@ static void machine_none_init(MachineState *mch=
)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 /* RAM at address zero */<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 /* RAM at configured address (default: 0) */<b=
r>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (mch-&gt;ram) {<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memory_region_add_subr=
egion(get_system_memory(), 0, mch-&gt;ram);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memory_region_add_subr=
egion(get_system_memory(), nms-&gt;ram_addr,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mc=
h-&gt;ram);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 } else if (nms-&gt;ram_addr) {<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_report(&quot;&#3=
9;ram-addr&#39; has been specified but the size is <br>
&gt;&gt; zero&quot;);<br>
&gt; <br>
&gt; I&#39;m not sure about this error message, IIUC we can get here if no =
ram<br>
&gt; backend is provided, not if we have one zero-sized. Otherwise LGTM.<br=
>
<br>
You&#39;re most probably right. Keeping the ram_size to 0 is just one way o=
f <br>
getting here. I can replace the message by a more generic formulation<br>
&quot;&#39;ram-addr&#39; has been specified but the machine has no ram&quot=
;<br>
<br>
<br>
</blockquote></div>

--00000000000026f92c05dfc78850--


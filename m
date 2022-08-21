Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8250F59B0F3
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Aug 2022 02:08:55 +0200 (CEST)
Received: from localhost ([::1]:45238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPYWM-0001jh-5l
	for lists+qemu-devel@lfdr.de; Sat, 20 Aug 2022 20:08:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shinysaana@gmail.com>)
 id 1oPYTE-0007Ud-Oa; Sat, 20 Aug 2022 20:05:40 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:44621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shinysaana@gmail.com>)
 id 1oPYTC-0003GE-Ev; Sat, 20 Aug 2022 20:05:40 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 r15-20020a17090a1bcf00b001fabf42a11cso8078146pjr.3; 
 Sat, 20 Aug 2022 17:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=fhdD+8huK/AI0ib7AI2ZisCth7sYg+srtwh5O8IUBBo=;
 b=N19b0Z3rzJp7pKE+UeV5dtlYPMTNxqPJBKoFaQHI7G0FHXc7RqGiWgsP3N8wM5PGj0
 o5LexKiGrAlXMv8n0pHUxfYRMK+D/tQhZ4qSUbwNEYV1brncn4hWT3xujBH4mv78rk23
 bOL/oC5pb1yJwmlKEtbuPfMyEk8zyZYIpV6MprHVnJ4IQZK8GuSQO5a/YQaOXG8ZiCTQ
 b3m1nYQH7/5VarfsTTRqg7KaUF2PR6ogRkk7cKIoSmO2I3A+8hxzk3jNk66xwPZKv2K+
 CWJz4Z4z3yyHRPh7/fbp8XqbGSHrRReC+r0xZ8LkkGoQN/4pQHpTROcuIVZVetVE037f
 TQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=fhdD+8huK/AI0ib7AI2ZisCth7sYg+srtwh5O8IUBBo=;
 b=uXxa2mhNUtxiXlL/zDKTkfD1MPxxDzypQc9saJuRvUx4ons+C8SiWXRer49U9J7y7u
 3TkXI4YzVq9GFTfr0m5PLeVQ7G2f7yALRO1oep/FwNZtfgZPAh9rNHgtGV6YMCU44lWI
 OtVyU6Q+6yDJ0ya5mOXJHSQ7L2BoXM/FP9SDv9NVvdLicih79qlqV4X2KcCQJEbx3wYF
 fnIUBdPMIZ5CR4wVK25I9iEuQQun/4c6D39IzjVY0w9bqx0pAbrWnPOQtys+g5c5On1X
 oexwsGUaUhs4dEKr+1vevNROrpguEtTZlsfR+6Nmg6rICG7d0irLsAvzpBDmwZaO/4X1
 Vj7Q==
X-Gm-Message-State: ACgBeo2MEDXDearLcxQKnDDLY064VA7KDiTWQJ02d+qBQNJiIodJKoF3
 mk2/42ao1pGkHH5qdknT7sTvIoZ/Rlr/A++mG1w=
X-Google-Smtp-Source: AA6agR5IRhVuTPXdSTDVWGRFpb5GMXO2dk/g8MPHf1lHo79KkW8W9Lndz3KnXXgDoyhw9SYnFRZTtigzk2JUHhvW4kE=
X-Received: by 2002:a17:902:f54a:b0:16f:16bb:778e with SMTP id
 h10-20020a170902f54a00b0016f16bb778emr13560824plf.37.1661040333759; Sat, 20
 Aug 2022 17:05:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAJtCPL0rRU9Q=s6kUFDHjC5uUmx2w=ePYMMaib6vq57g48qk0Q@mail.gmail.com>
 <CAFEAcA81OfC_Z_uQvrSRUKHQf4mmOgbLrHYiwsfzmgH8u8sUqg@mail.gmail.com>
 <CAJtCPL3yNpNkK0Ljzo=QOFX_gLQtGGcqDoomwJ+RH0hq5G=YQA@mail.gmail.com>
 <87r11gbjbv.fsf@linaro.org>
 <CAFEAcA-6X=ptfDXGWA79-L9kRCQRq6jtci7ODPy0Ct369_EvCA@mail.gmail.com>
In-Reply-To: <CAFEAcA-6X=ptfDXGWA79-L9kRCQRq6jtci7ODPy0Ct369_EvCA@mail.gmail.com>
From: Shiny Saana <shinysaana@gmail.com>
Date: Sun, 21 Aug 2022 02:05:22 +0200
Message-ID: <CAJtCPL3Hef3d6sDA+pYJ6xChHS7y1J+2Cn9qf1NT0hwaBT8iTg@mail.gmail.com>
Subject: Re: Teensy 4.1 Implementation
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000000d289805e6b517e1"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=shinysaana@gmail.com; helo=mail-pj1-x102b.google.com
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

--0000000000000d289805e6b517e1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello!

Thank you all again for your initial guidance.

I've been able to write an initial Teensy 4.1 machine, for now with only
the few important memory regions initialized, and successfully ran some
hand-written ARM code on it.

I was wondering what your opinions might be for implementing the next step,
which in my opinion should be bootstrapping a "kernel" in the format the
board actually expects. This is however the current roadblock I am hitting.

The documentation ( https://www.pjrc.com/teensy/IMXRT1060RM_rev3.pdf ), in
section 9.7.1, gives some informations on how, in the actual Teensy board,
the ROM, executed at boot, initialize the board peripherals, and also reads
from a data structure included in the Flash memory (the user-provided
program) where the CPU should jump to after the ROM has done its work
(somewhere in that same Flash memory, usually).

I was able to successfully dump the ROM of the real board and confirm this
behavior. Given that the current plan is not to emulate every peripherals,
I am of the opinion that writing a very simple ROM that merely reads this
Flash provided data structure and jumps to the provided address sounds like
a good starting point, so that I can keep iterating on writing more and
more complex code through the provided Teensy toolchain, and implementing
needed peripherals.

As such, I have several questions:

1/ To replicate this behaviour, is this considered the correct approach by
the current QEMU maintainers?

2/ If so, I have not been able to find any function that would be able to
load data into a memory region "statically". Does one exist? Is there an
alternative to this process?

3/ Regarding loading the "kernel" of the board, as part of the init
process, I am calling the usual "armv7m_load_kernel" function with its
usual parameters. However, it seems to load it as the very start of the
address space, which is not where the flash memory is, and so is not where
the kernel should be loaded. I wasn't able to find a workaround. Is there
something I'm missing?

Sorry to bother you with so many questions.
Thanks again,
Saana

Le mar. 16 ao=C3=BBt 2022 =C3=A0 12:06, Peter Maydell <peter.maydell@linaro=
.org> a
=C3=A9crit :

> On Tue, 16 Aug 2022 at 10:59, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
> > Shiny Saana <shinysaana@gmail.com> writes:
> > > I personally don't need any of the GPIO interfaces, but if needed
> > > by someone else, that could be a good second step to
> > > work on once that part of the board is implemented.
> >
> > Handling GPIOs in QEMU is fine (we have things like the qdev_init_gpio_=
*
> > functions to handle them). The problem is usually what to do with the
> > actual general purpose pins which aren't wired to something we emulate
> > in the board. Some boards expose their values via QMP properties but I
> > suspect whats really needed is a generic mechanism for exposing GPIO to
> > external scripts rather than have every board define it's own thing.
>
> Yes. However one key thing for trying to get a new board model
> in is not to get tangled up in trying to improve/extend
> the core QEMU facilities for something. That's much harder
> than "my board model supports GPIO output lines to the same
> extent as the other existing board models" :-)
>
> thanks
> -- PMM
>

--0000000000000d289805e6b517e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello!</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Thank you all again for your initial guidance.</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">I&#39;ve been able to write an initial Teensy 4.1 m=
achine, for now with only the few important memory regions initialized, and=
 successfully ran some hand-written ARM code on it.=C2=A0</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">I was wondering what your opinions might =
be for implementing the next step, which in my opinion should be bootstrapp=
ing a &quot;kernel&quot; in the format the board actually expects. This is =
however the current roadblock I am hitting.</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">The documentation ( <a href=3D"https://www.pjrc.com/tee=
nsy/IMXRT1060RM_rev3.pdf">https://www.pjrc.com/teensy/IMXRT1060RM_rev3.pdf<=
/a> ), in section 9.7.1, gives some informations on how, in the actual Teen=
sy board, the ROM, executed at boot, initialize the board peripherals, and =
also reads from a data structure included in the Flash memory (the user-pro=
vided program) where the CPU should jump to after the ROM has done its work=
 (somewhere in that same Flash memory, usually).</div><div dir=3D"auto"><br=
></div><div dir=3D"auto">I was able to successfully dump the ROM of the rea=
l board and confirm this behavior. Given that the current plan is not to em=
ulate every peripherals, I am of the opinion that writing a very simple ROM=
 that merely reads this Flash provided data structure and jumps to the prov=
ided address sounds like a good starting point, so that I can keep iteratin=
g on writing more and more complex code through the provided Teensy toolcha=
in, and implementing needed peripherals.</div><div dir=3D"auto"><br></div><=
div dir=3D"auto">As such, I have several questions:</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">1/ To replicate this behaviour, is this conside=
red the correct approach by the current QEMU maintainers?</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">2/ If so, I have not been able to find an=
y function that would be able to load data into a memory region &quot;stati=
cally&quot;. Does one exist? Is there an alternative to this process?</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">3/ Regarding loading the &quo=
t;kernel&quot; of the board, as part of the init process, I am calling the =
usual &quot;armv7m_load_kernel&quot; function with its usual parameters. Ho=
wever, it seems to load it as the very start of the address space, which is=
 not where the flash memory is, and so is not where the kernel should be lo=
aded. I wasn&#39;t able to find a workaround. Is there something I&#39;m mi=
ssing?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Sorry to bother y=
ou with so many questions.</div><div dir=3D"auto">Thanks again,</div><div d=
ir=3D"auto">Saana</div><div dir=3D"auto"><br></div><div dir=3D"auto">Le=C2=
=A0mar. 16 ao=C3=BBt 2022 =C3=A0 12:06, Peter Maydell &lt;<a href=3D"mailto=
:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; a =C3=A9crit=C2=
=A0:</div><div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:=
solid;padding-left:1ex;border-left-color:rgb(204,204,204)">On Tue, 16 Aug 2=
022 at 10:59, Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org=
" target=3D"_blank">alex.bennee@linaro.org</a>&gt; wrote:<br>
&gt; Shiny Saana &lt;<a href=3D"mailto:shinysaana@gmail.com" target=3D"_bla=
nk">shinysaana@gmail.com</a>&gt; writes:<br>
&gt; &gt; I personally don&#39;t need any of the GPIO interfaces, but if ne=
eded<br>
&gt; &gt; by someone else, that could be a good second step to<br>
&gt; &gt; work on once that part of the board is implemented.<br>
&gt;<br>
&gt; Handling GPIOs in QEMU is fine (we have things like the qdev_init_gpio=
_*<br>
&gt; functions to handle them). The problem is usually what to do with the<=
br>
&gt; actual general purpose pins which aren&#39;t wired to something we emu=
late<br>
&gt; in the board. Some boards expose their values via QMP properties but I=
<br>
&gt; suspect whats really needed is a generic mechanism for exposing GPIO t=
o<br>
&gt; external scripts rather than have every board define it&#39;s own thin=
g.<br>
<br>
Yes. However one key thing for trying to get a new board model<br>
in is not to get tangled up in trying to improve/extend<br>
the core QEMU facilities for something. That&#39;s much harder<br>
than &quot;my board model supports GPIO output lines to the same<br>
extent as the other existing board models&quot; :-)<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div></div>

--0000000000000d289805e6b517e1--


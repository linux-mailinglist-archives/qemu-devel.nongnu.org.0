Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E757859E4CA
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 16:02:46 +0200 (CEST)
Received: from localhost ([::1]:45684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQUUP-0001zH-La
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 10:02:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shinysaana@gmail.com>)
 id 1oQUSK-0008WC-Ru; Tue, 23 Aug 2022 10:00:36 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:43530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shinysaana@gmail.com>)
 id 1oQUSE-0003io-Hv; Tue, 23 Aug 2022 10:00:36 -0400
Received: by mail-pg1-x533.google.com with SMTP id v4so12332387pgi.10;
 Tue, 23 Aug 2022 07:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=95+vQjXaWuB9M1TelnR6G8ijKl+BtlaNTQ/naNhzWwc=;
 b=ndiZ3qO32YE3zMdTyxtsCiwH4EChEFnZIj3dzYKqI/+FG2gtU/iHpK0vfpHbIQ9hjJ
 pMM8pbuRYT037hknqEdyA6cFPPbfS841+orxfHKevL5AWgHsOT1SD76IWsis2ZEmo5oq
 3/Jxfr7jK7QfQ3Q8A0ig5bSXQ0axDXJuP7tQMgrXcnVoHYjE55SpT6i4+tbOv/NmOzmG
 MOetNew7RqYkmN96qVUNoZJoIY63oNmdMQ1emC5n1n/rUJVWOk5UgTlSgxt5eykdwXB6
 Hb+dLqMNf2Ya+ySHByU3GFL9m5IIH0yZ5TwtziUH0+xyq2JxJ+iQbuXxD0x28LtWZz/P
 hSPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=95+vQjXaWuB9M1TelnR6G8ijKl+BtlaNTQ/naNhzWwc=;
 b=UndCAO84pHc8dP7pdFqO8R+Ir9xtChgUipwWOBiBoe//kxXUxx/se9hZaU+ya1Ct0U
 fCCzhvqUbb//em0TCD/0bddUFzQHs+PJ7ApkxuGoBDwg/BrMlbg5yzDPCtF59C2TmFdl
 jMT2hNqJUnEldHzI2LyEsA6fr8JCxI9KPthTlMD0B+KcT3lfyG+1L7pwxk2kTfv/UHaO
 Xo/zPtkTOwZMUq75bS+iaGx6rs3PnJYNocg4DnhTz11sYZ4vZ33ESEjJG+CZj01CmLhh
 mDuXK8slfCi58+T3eSDNHmrproxw6IR6wsjdYkkYnc0pq0EHJWQmuBbxpnU5ORSU5KVn
 dblw==
X-Gm-Message-State: ACgBeo2tKbkA2CJqg/2qPmBsgZkE4BAtx1I+aR7ULWeXTCzLq3rDivmM
 aeh5hBBG6BdUModuVQpkRa/xzGm476m1lfiQ/NjTscfW
X-Google-Smtp-Source: AA6agR7j5Cd5n8ont2dMj3BXIhKOvpoLqWvEYNnho7JNMc1qlo6+WTISTLBxrqIbfUV7wCM6DtTubzBci1zN4OwZ81o=
X-Received: by 2002:a05:6a00:1907:b0:534:f2ef:e8fe with SMTP id
 y7-20020a056a00190700b00534f2efe8femr25311263pfi.65.1661263228130; Tue, 23
 Aug 2022 07:00:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAJtCPL0rRU9Q=s6kUFDHjC5uUmx2w=ePYMMaib6vq57g48qk0Q@mail.gmail.com>
 <CAFEAcA81OfC_Z_uQvrSRUKHQf4mmOgbLrHYiwsfzmgH8u8sUqg@mail.gmail.com>
 <CAJtCPL3yNpNkK0Ljzo=QOFX_gLQtGGcqDoomwJ+RH0hq5G=YQA@mail.gmail.com>
 <87r11gbjbv.fsf@linaro.org>
 <CAFEAcA-6X=ptfDXGWA79-L9kRCQRq6jtci7ODPy0Ct369_EvCA@mail.gmail.com>
 <CAJtCPL3Hef3d6sDA+pYJ6xChHS7y1J+2Cn9qf1NT0hwaBT8iTg@mail.gmail.com>
 <CAFEAcA8TmrMo+MOhOutUuwE=GOEFYUGxgRA2_XGZ2iunMTAe5w@mail.gmail.com>
In-Reply-To: <CAFEAcA8TmrMo+MOhOutUuwE=GOEFYUGxgRA2_XGZ2iunMTAe5w@mail.gmail.com>
From: Shiny Saana <shinysaana@gmail.com>
Date: Tue, 23 Aug 2022 16:00:17 +0200
Message-ID: <CAJtCPL10GL8JL2qb-sZTpmPaHTy7fOoEDb194ZL1NSvXpqGaUQ@mail.gmail.com>
Subject: Re: Teensy 4.1 Implementation
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000097584605e6e8fc11"
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=shinysaana@gmail.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_FONT_FACE_BAD=0.001, HTML_FONT_LOW_CONTRAST=0.001, HTML_MESSAGE=0.001,
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

--00000000000097584605e6e8fc11
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you again for your time!

I didn't know at all about the generic loader!! It feels to me that it will
definitely be very useful in loading the Teensy image.

(To give more background: the Teensy-Arduinon toolchain first compiles an
.elf and then convert that to an Intex hex file. We can retrieve that .elf
in /tmp after compilation, but if all you have is an ihex (which is the
case for my use-case), then you're out of luck.)

To answer your question:

> Do you know what the hardware sets the initial vector
> base address to? (that is, where the ROM itself puts its
> reset/interrupt vector table). I couldn't find anything in
> the datasheet that said that.

From experimentation and dissasembly on the ROM, (located in 0x0020_0000),
the very first int (converted to BE) is "0x2020_1000" , which is located to
"OCRAM2", also referred as "ROM RAM" by the documentation, and the next int
is "0x0020_2091", which both points inside the ROM itself , and which when
forcibly disassembled in Ghidra does look like a function.
So I'm pretty confident the initial vector base address is 0x0020_0000.

Regarding the "kernel loading" issue, I believe that I was initially
mistaken. From other examples online, I believed that it was the way to
load the Teensy image. But thinking and discussing it with another ARM dev,
wouldn't the ROM itself actually be considered the kernel?

The teensy ihex image (converted to raw binary) could then be loaded via
the generic loader (and then, document that behavior in QEMU, and for user
convenience, in my own program using QEMU, I could merely provide a script
that handles the arguments for them).

Knowing that, if the call to  armv7m_load_kernel() is mandatory, maybe it
would make sense to load the ROM in C code via this function, with the
compiled ROM addresses from 0x0000_0000 to 0x001F_FFFF being padded with 0.
I'm *absolutely not sure* if this is a good idea, but that's the one I got
from the understanding that I have.

As always, thank you again for the help (and for using some of your time to
go through the documentation yourself, I genuinely appreciate the help a
great lot.)

Saana

Le mar. 23 ao=C3=BBt 2022 =C3=A0 15:09, Peter Maydell <peter.maydell@linaro=
.org> a
=C3=A9crit :

> On Sun, 21 Aug 2022 at 01:05, Shiny Saana <shinysaana@gmail.com> wrote:
> > I've been able to write an initial Teensy 4.1 machine, for now with
> > only the few important memory regions initialized, and successfully
> > ran some hand-written ARM code on it.
>
> Great, that's good progress!
>
> > The documentation ( https://www.pjrc.com/teensy/IMXRT1060RM_rev3.pdf ),
> > in section 9.7.1, gives some informations on how, in the actual
> > Teensy board, the ROM, executed at boot, initialize the board
> > peripherals, and also reads from a data structure included in the
> > Flash memory (the user-provided program) where the CPU should jump
> > to after the ROM has done its work (somewhere in that same Flash memory=
,
> > usually).
> >
> > I was able to successfully dump the ROM of the real board and
> > confirm this behavior. Given that the current plan is not to
> > emulate every peripherals, I am of the opinion that writing a very
> > simple ROM that merely reads this Flash provided data structure and
> > jumps to the provided address sounds like a good starting point, so
> > that I can keep iterating on writing more and more complex code
> > through the provided Teensy toolchain, and implementing needed
> > peripherals.
> >
> > As such, I have several questions:
> >
> > 1/ To replicate this behaviour, is this considered the correct
> > approach by the current QEMU maintainers?
>
> Yes, I think this is probably a reasonable way to go.
>
> > 2/ If so, I have not been able to find any function that would be
> > able to load data into a memory region "statically". Does one
> > exist? Is there an alternative to this process?
>
> Depends exactly what you want to do. If you want "let the user
> load data to an arbitrary address", then the "generic loader"
> is usually helpful:
> https://www.qemu.org/docs/master/system/generic-loader.html
>
> If you mean "C code within QEMU loads data to a specific place",
> rom_add_blob_fixed_as() is probably what you want. This is how
> hw/arm/boot.c loads both user-provided data files and the
> hand-coded mini-bootloader into the guest.
>
> > 3/ Regarding loading the "kernel" of the board, as part of the
> > init process, I am calling the usual "armv7m_load_kernel" function
> > with its usual parameters. However, it seems to load it as the
> > very start of the address space, which is not where the flash
> > memory is, and so is not where the kernel should be loaded. I
> > wasn't able to find a workaround. Is there something I'm missing?
>
> The behaviour of armv7m_load_kernel() depends on what kind
> of file you pass to -kernel. If you pass -kernel an ELF file,
> then it will get loaded to the addresses as specified by
> the ELF file, so you can use that to put data anywhere you like.
> If you pass it a raw binary file then, yeah, at the moment
> that gets loaded to address 0. There's no real reason for this
> limitation -- it's mainly because when that code was written
> we supported very few M-profile boards, and all of them booted
> from address 0. (That is, the board doesn't set either the
> init-svtor or init-nsvtor properties on the armv7m object to
> anything other than 0.) We could change how this works, but
> the difficulty is that the desire for "Just Do What I Mean"
> behaviour for a specific board tends to conflict with the
> desire for all boards to behave in a consistent manner.
> In particular, at the moment passing a binary file to -kernel
> means "I want this to be loaded so that it has the
> CPU vector table in it and execution starts from reset as
> the architecture says it should"; it can't both mean that
> consistently across M-profile boards and also mean "on the
> teeny board, be an image file intended to boot via the ROM
> loader".
>
> Loading the teeny images via the generic loader rather than
> via -kernel would be one way to sidestep this issue...
>
>
>
> (By the way, calling armv7m_load_kernel() is mandatory even if
> you don't care about loading an image, because it's the function
> that arranges that the CPU gets reset correctly.)
>
> thanks
> -- PMM
>

--00000000000097584605e6e8fc11
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thank you again for your time!</div><div dir=3D"auto"><br=
></div><div dir=3D"auto">I didn&#39;t know at all about the generic loader!=
! It feels to me that it will definitely be very useful in loading the Teen=
sy image.</div><div dir=3D"auto"><br></div><div dir=3D"auto">(To give more =
background: the Teensy-Arduinon toolchain first compiles an .elf and then c=
onvert that to an Intex hex file. We can retrieve that .elf in /tmp after c=
ompilation, but if all you have is an ihex (which is the case for my use-ca=
se), then you&#39;re out of luck.)</div><div dir=3D"auto"><br></div><div di=
r=3D"auto">To answer your question:</div><div dir=3D"auto"><br></div><div s=
tyle=3D"background-color:rgba(0,0,0,0)!important;border-color:rgb(255,255,2=
55)!important;color:rgb(255,255,255)!important" dir=3D"auto"><span style=3D=
"border-color:rgb(0,0,0) rgb(0,0,0) rgb(0,0,0) rgb(204,204,204);color:rgb(0=
,0,0)">&gt; Do you know what the hardware sets the initial vector</span><sp=
an style=3D"border-color:rgb(255,255,255) rgb(255,255,255) rgb(255,255,255)=
 rgb(74,77,80)!important;color:rgb(255,255,255)!important;background-color:=
rgba(0,0,0,0)!important"><font face=3D"-apple-system, HelveticaNeue" style=
=3D"color:rgb(0,0,0)">=C2=A0</font></span></div><div style=3D"background-co=
lor:rgba(0,0,0,0);border-color:rgb(255,255,255)" dir=3D"auto"><span style=
=3D"border-color:rgb(0,0,0) rgb(0,0,0) rgb(0,0,0) rgb(204,204,204);color:rg=
b(0,0,0)">&gt; base address to? (that is, where the ROM itself puts its</sp=
an><br style=3D"font-family:-apple-system,HelveticaNeue"><span style=3D"bor=
der-color:rgb(0,0,0) rgb(0,0,0) rgb(0,0,0) rgb(204,204,204);color:rgb(0,0,0=
)">&gt; reset/interrupt vector table). I couldn&#39;t find anything in</spa=
n><br style=3D"font-family:-apple-system,HelveticaNeue"><span style=3D"bord=
er-color:rgb(0,0,0) rgb(0,0,0) rgb(0,0,0) rgb(204,204,204);color:rgb(0,0,0)=
">&gt; the datasheet that said that.</span><br></div><div style=3D"backgrou=
nd-color:rgba(0,0,0,0);border-color:rgb(255,255,255)" dir=3D"auto"><span st=
yle=3D"border-color:rgb(0,0,0) rgb(0,0,0) rgb(0,0,0) rgb(204,204,204);color=
:rgb(0,0,0)"><br></span></div><div style=3D"background-color:rgba(0,0,0,0);=
border-color:rgb(255,255,255)" dir=3D"auto"><span style=3D"border-color:rgb=
(0,0,0) rgb(0,0,0) rgb(0,0,0) rgb(204,204,204);color:rgb(0,0,0)">From exper=
imentation and dissasembly on the ROM, (located in 0x0020_0000), the very f=
irst int (converted to BE) is &quot;0x2020_1000&quot; , which is located to=
 &quot;OCRAM2&quot;, also referred as &quot;ROM RAM&quot; by the documentat=
ion, and the next int is &quot;0x0020_2091&quot;, which both points inside =
the ROM itself , and which when forcibly disassembled in Ghidra does look l=
ike a function.</span></div><div style=3D"background-color:rgba(0,0,0,0)!im=
portant;border-color:rgb(32,33,36)!important;color:rgb(255,255,255)!importa=
nt" dir=3D"auto"><font style=3D"border-color:rgb(0,0,0) rgb(0,0,0) rgb(0,0,=
0) rgb(204,204,204);color:rgb(0,0,0)">So I&#39;m pretty confident the initi=
al vector base address is 0x0020_0000.</font></div><div style=3D"background=
-color:rgba(0,0,0,0);border-color:rgb(32,33,36)" dir=3D"auto"><font style=
=3D"border-color:rgb(0,0,0) rgb(0,0,0) rgb(0,0,0) rgb(204,204,204);color:rg=
b(0,0,0)"><br></font></div><div style=3D"background-color:rgba(0,0,0,0);bor=
der-color:rgb(32,33,36)" dir=3D"auto"><font style=3D"border-color:rgb(0,0,0=
) rgb(0,0,0) rgb(0,0,0) rgb(204,204,204);color:rgb(0,0,0)">Regarding the &q=
uot;kernel loading&quot; issue, I believe that I was initially mistaken. Fr=
om other examples online, I believed that it was the way to load the Teensy=
 image. But thinking and discussing it with another ARM dev, wouldn&#39;t t=
he ROM itself actually be considered the kernel?=C2=A0</font></div><div sty=
le=3D"background-color:rgba(0,0,0,0);border-color:rgb(32,33,36)" dir=3D"aut=
o"><font style=3D"border-color:rgb(0,0,0) rgb(0,0,0) rgb(0,0,0) rgb(204,204=
,204);color:rgb(0,0,0)"><br></font></div><div style=3D"background-color:rgb=
a(0,0,0,0);border-color:rgb(32,33,36)" dir=3D"auto"><font style=3D"border-c=
olor:rgb(0,0,0) rgb(0,0,0) rgb(0,0,0) rgb(204,204,204);color:rgb(0,0,0)">Th=
e teensy ihex image (converted to raw binary) could then be loaded via the =
generic loader (and then, document that behavior in QEMU, and for user conv=
enience, in my own program using QEMU, I could merely provide a script that=
 handles the arguments for them).</font></div><div style=3D"background-colo=
r:rgba(0,0,0,0);border-color:rgb(32,33,36)" dir=3D"auto"><font style=3D"bor=
der-color:rgb(0,0,0) rgb(0,0,0) rgb(0,0,0) rgb(204,204,204);color:rgb(0,0,0=
)"><br></font></div><div style=3D"background-color:rgba(0,0,0,0)!important;=
border-color:rgb(222,223,227)!important;color:rgb(255,255,255)!important" d=
ir=3D"auto"><font style=3D"border-color:rgb(0,0,0) rgb(0,0,0) rgb(0,0,0) rg=
b(204,204,204);color:rgb(0,0,0)">Knowing that, if the call to=C2=A0</font><=
span style=3D"color:rgb(0,0,0)">=C2=A0</span><span style=3D"color:rgb(0,0,0=
)">armv7m_load_kernel() is mandatory, maybe it would make sense to load the=
 ROM in C code via this function, with the compiled ROM addresses from 0x00=
00_0000 to 0x001F_FFFF being padded with 0.</span></div><div style=3D"backg=
round-color:rgba(0,0,0,0);border-color:rgb(222,223,227)" dir=3D"auto"><span=
 style=3D"color:rgb(0,0,0)">I&#39;m *absolutely not sure* if this is a good=
 idea, but that&#39;s the one I got from the understanding that I have.=C2=
=A0</span></div><div style=3D"background-color:rgba(0,0,0,0);border-color:r=
gb(222,223,227)" dir=3D"auto"><span style=3D"color:rgb(0,0,0)"><br></span><=
/div><div style=3D"background-color:rgba(0,0,0,0);border-color:rgb(222,223,=
227)" dir=3D"auto"><span style=3D"color:rgb(0,0,0)">As always, thank you ag=
ain for the help (and for using some of your time to go through the documen=
tation yourself, I genuinely appreciate the help a great lot.)</span></div>=
<div style=3D"background-color:rgba(0,0,0,0);border-color:rgb(222,223,227)"=
 dir=3D"auto"><span style=3D"color:rgb(0,0,0)"><br></span></div><div style=
=3D"background-color:rgba(0,0,0,0);border-color:rgb(222,223,227)" dir=3D"au=
to"><span style=3D"color:rgb(0,0,0)">Saana</span></div><div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 23 ao=
=C3=BBt 2022 =C3=A0 15:09, Peter Maydell &lt;<a href=3D"mailto:peter.maydel=
l@linaro.org">peter.maydell@linaro.org</a>&gt; a =C3=A9crit=C2=A0:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:=
rgb(204,204,204)" dir=3D"auto">On Sun, 21 Aug 2022 at 01:05, Shiny Saana &l=
t;<a href=3D"mailto:shinysaana@gmail.com" target=3D"_blank">shinysaana@gmai=
l.com</a>&gt; wrote:<br>
&gt; I&#39;ve been able to write an initial Teensy 4.1 machine, for now wit=
h<br>
&gt; only the few important memory regions initialized, and successfully<br=
>
&gt; ran some hand-written ARM code on it.<br>
<br>
Great, that&#39;s good progress!<br>
<br>
&gt; The documentation ( <a href=3D"https://www.pjrc.com/teensy/IMXRT1060RM=
_rev3.pdf" rel=3D"noreferrer" target=3D"_blank">https://www.pjrc.com/teensy=
/IMXRT1060RM_rev3.pdf</a> ),<br>
&gt; in section 9.7.1, gives some informations on how, in the actual<br>
&gt; Teensy board, the ROM, executed at boot, initialize the board<br>
&gt; peripherals, and also reads from a data structure included in the<br>
&gt; Flash memory (the user-provided program) where the CPU should jump<br>
&gt; to after the ROM has done its work (somewhere in that same Flash memor=
y,<br>
&gt; usually).<br>
&gt;<br>
&gt; I was able to successfully dump the ROM of the real board and<br>
&gt; confirm this behavior. Given that the current plan is not to<br>
&gt; emulate every peripherals, I am of the opinion that writing a very<br>
&gt; simple ROM that merely reads this Flash provided data structure and<br=
>
&gt; jumps to the provided address sounds like a good starting point, so<br=
>
&gt; that I can keep iterating on writing more and more complex code<br>
&gt; through the provided Teensy toolchain, and implementing needed<br>
&gt; peripherals.<br>
&gt;<br>
&gt; As such, I have several questions:<br>
&gt;<br>
&gt; 1/ To replicate this behaviour, is this considered the correct<br>
&gt; approach by the current QEMU maintainers?<br>
<br>
Yes, I think this is probably a reasonable way to go.<br>
<br>
&gt; 2/ If so, I have not been able to find any function that would be<br>
&gt; able to load data into a memory region &quot;statically&quot;. Does on=
e<br>
&gt; exist? Is there an alternative to this process?<br>
<br>
Depends exactly what you want to do. If you want &quot;let the user<br>
load data to an arbitrary address&quot;, then the &quot;generic loader&quot=
;<br>
is usually helpful:<br>
<a href=3D"https://www.qemu.org/docs/master/system/generic-loader.html" rel=
=3D"noreferrer" target=3D"_blank">https://www.qemu.org/docs/master/system/g=
eneric-loader.html</a><br>
<br>
If you mean &quot;C code within QEMU loads data to a specific place&quot;,<=
br>
rom_add_blob_fixed_as() is probably what you want. This is how<br>
hw/arm/boot.c loads both user-provided data files and the<br>
hand-coded mini-bootloader into the guest.<br>
<br>
&gt; 3/ Regarding loading the &quot;kernel&quot; of the board, as part of t=
he<br>
&gt; init process, I am calling the usual &quot;armv7m_load_kernel&quot; fu=
nction<br>
&gt; with its usual parameters. However, it seems to load it as the<br>
&gt; very start of the address space, which is not where the flash<br>
&gt; memory is, and so is not where the kernel should be loaded. I<br>
&gt; wasn&#39;t able to find a workaround. Is there something I&#39;m missi=
ng?<br>
<br>
The behaviour of armv7m_load_kernel() depends on what kind<br>
of file you pass to -kernel. If you pass -kernel an ELF file,<br>
then it will get loaded to the addresses as specified by<br>
the ELF file, so you can use that to put data anywhere you like.<br>
If you pass it a raw binary file then, yeah, at the moment<br>
that gets loaded to address 0. There&#39;s no real reason for this<br>
limitation -- it&#39;s mainly because when that code was written<br>
we supported very few M-profile boards, and all of them booted<br>
from address 0. (That is, the board doesn&#39;t set either the<br>
init-svtor or init-nsvtor properties on the armv7m object to<br>
anything other than 0.) We could change how this works, but<br>
the difficulty is that the desire for &quot;Just Do What I Mean&quot;<br>
behaviour for a specific board tends to conflict with the<br>
desire for all boards to behave in a consistent manner.<br>
In particular, at the moment passing a binary file to -kernel<br>
means &quot;I want this to be loaded so that it has the<br>
CPU vector table in it and execution starts from reset as<br>
the architecture says it should&quot;; it can&#39;t both mean that<br>
consistently across M-profile boards and also mean &quot;on the<br>
teeny board, be an image file intended to boot via the ROM<br>
loader&quot;.<br>
<br>
Loading the teeny images via the generic loader rather than<br>
via -kernel would be one way to sidestep this issue...<br>
<br><br>
<br>
(By the way, calling armv7m_load_kernel() is mandatory even if<br>
you don&#39;t care about loading an image, because it&#39;s the function<br=
>
that arranges that the CPU gets reset correctly.)<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div></div>

--00000000000097584605e6e8fc11--


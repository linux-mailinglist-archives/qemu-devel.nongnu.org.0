Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D94EB3AF517
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 20:29:46 +0200 (CEST)
Received: from localhost ([::1]:44290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvOg5-0006yx-PK
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 14:29:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1lvOdR-0004H2-93
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 14:27:01 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:45654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1lvOdO-0005hb-Nf
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 14:27:01 -0400
Received: by mail-il1-x132.google.com with SMTP id b5so4215189ilc.12
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 11:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=02y5qsthKMVvI+T/zrcuYh6N+wLiOSPHoXrtW0D/KeY=;
 b=c9EokzOnZWtCheyrwgpd6MZeMYFb8awYTiEfeFYraofpY9y/r3/BV9NcXln5EZ8kIb
 txHqQDjUw6fvuujgNN3Ly7m/IyU/EPyVEnyKhUV8ewWFxlNK2lCEL0i2kaVzMCH/76PS
 49djpZWdS4KY/aHVQsOXCHe7ojRii1B2fnT07f+mbULYDTEK2htuK3q/ZXmQ7H1L9sNj
 uUDSeWccu4ixBuW8ZYp5Bc2B7RijGwwmJPgUIgUeJlv72/TMIb2JoiTU9IOpVZ0UJ+he
 a9qrczrqmCoZnAg5iTNmemuARW0E799+JQhDBFBWF4tgghKQ1zIhrF8FOp53Vz9dP4ww
 KiJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=02y5qsthKMVvI+T/zrcuYh6N+wLiOSPHoXrtW0D/KeY=;
 b=bwYWobF4Iag65c1zLMbhHfqyINi5LCehy2dY3s82gZoSKbjwtpRGWyQmP9M1qMx6QS
 9WAleXWvxV+mFZIwBEAzq2Ic/h35HyDAcVqbTIwOgZoob9qoZJfVYjIS2T4N8rfm7+Xv
 BxvUp+pstpn5Fik8oTgaLi8GLDJaoaY0DMzz4cnFzdnypg45KMs3JnVrhus/vXYnL5fH
 qbakyHJASlpbTSJsI1mExDbdSNzSGCNCZhJJZ3Q1/o6y0vRQVdX81JghD1yeqRVNi0F5
 9119sUQKhHDv8K2J36C4cbFhoVIuY3pc6m3M01ni4Owaxq492EvTuAy4ls49Lvyf6vuj
 2CKA==
X-Gm-Message-State: AOAM5312DyykUFqyyhdvB2U8ESnOeuA12fwWgACOAuLwey8yR71aZszw
 Sp+Xa09yLul8D0NZ1VOhL0CEvrLkGl5K2q6tyYI=
X-Google-Smtp-Source: ABdhPJzmqKBvvUjJ7F+yfDZ/f+tzCiH42re//79UfkxkWCKYJefDX7i76ERAyFK0xXkSl830XjcUygXhrQhtD/0beqE=
X-Received: by 2002:a05:6e02:156c:: with SMTP id
 k12mr400651ilu.188.1624300016475; 
 Mon, 21 Jun 2021 11:26:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAN6ztm8D4VMf7p-trHNHoOA+1kAXXufTTaHpbyNXZ5qO2_uuPg@mail.gmail.com>
 <6fb6d9d7-3af2-c487-a1d4-aa1140c5a54d@redhat.com>
In-Reply-To: <6fb6d9d7-3af2-c487-a1d4-aa1140c5a54d@redhat.com>
From: "Niteesh G. S." <niteesh.gs@gmail.com>
Date: Mon, 21 Jun 2021 23:56:30 +0530
Message-ID: <CAN6ztm8bjVnFf_X-vEzYOmTdw09bcoQSkVH9h6BdPFr-PEsP_A@mail.gmail.com>
Subject: Re: RFC: Implementation of QMP documentation retrieval command
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000007da16905c54ad19b"
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=niteesh.gs@gmail.com; helo=mail-il1-x132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, ehabkost@redhat.com,
 armbru@redhat.com, wainersm@redhat.com, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000007da16905c54ad19b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Philippe,

On Mon, Jun 21, 2021 at 8:28 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com>
wrote:

> Hi Niteesh,
>
> On 6/16/21 5:48 PM, Niteesh G. S. wrote:
> > Hello,
> >
> > We now have a reasonably working prototype that is capable of
> > sending/receiving
> > commands/responses, syntax highlighting, and a simple notification
> > system. The
> > prototype can be found here
> > https://gitlab.com/niteesh.gs/qemu/-/tree/aqmp-tui-prototype
> > <https://gitlab.com/niteesh.gs/qemu/-/tree/aqmp-tui-prototype>
> > Working on this prototype gives us a lot of hints on things to worry
> > about and other
> > ideas that were worth implementing. Our next goal is to start working o=
n
> > the real TUI
> > based on this prototype.
> >
> > One requested feature of the TUI was to show documentation for the
> > commands typed.
> > To achieve this, a QMP command that lets us query the documentation fro=
m
> > QEMU has
> > to be implemented and some discussion has already been done on it in a
> > previous thread.
> > I request all continue that discussion here and suggest ideas regarding
> > implementation.
> > The goal is to come up with something small and simple which can also b=
e
> > improved upon
> > after the summer.
> >
> > I have a simple implementation of the command that returns dummy
> > documentation here
> >
> https://gitlab.com/niteesh.gs/qemu/-/commit/796a41fb2840b9f3484c6fd5672e6=
fceb73acaef
> > <
> https://gitlab.com/niteesh.gs/qemu/-/commit/796a41fb2840b9f3484c6fd5672e6=
fceb73acaef
> >
>
> I noticed your mail got no comment, and realized you asked us to
> review your patches apart from the mailing list. I am not sure
> if this is an experiment or a misunderstanding, but so far it is
> unlikely you get review external to the mailing list, because it
> is not very practical to reviewers.
>

Sorry for not conveying the main intent of this mail properly.
The main goal of this mail was to start a discussion regarding the
implementation
of the QMP documentation retrieval command for AQMP TUI. There has already
been a small discussion regarding it in my introduction mail but it wasn't
anything
in detail and it stagnated. So I created this mail to have a separate
thread to collect
all points regarding implementation and again start the discussion.
We now have a prototype with the most basic features implemented and
working.
But there is a lot of clean-up that has to be done before I can send the
prototype to the
mailing list for review. And since the prototype is almost done John asked
me to start
a discussion regarding the QMP command so that I can work on it as a side
project
along side the TUI.

TLDR: The goal of this mail wasn't to review the dummy command I had posted
but
rather start a discussion regarding the implementation of the QMP
documentation
retrieval command for the TUI.

Thanks,
Niteesh.



> Maybe some reviewers are willing to look at your tree, but if you
> are looking for a wider audience, I recommend you to follow this
> process (which you already used!):
> https://wiki.qemu.org/Contribute/SubmitAPatch#Submitting_your_Patches
>
> Regards,
>
> Phil.
>
>

--0000000000007da16905c54ad19b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hello=C2=A0Philippe,</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div></div><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Mon, Jun 21, 2021 at 8:28 PM Philippe Mathieu=
-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com" target=3D"_blank">phil=
md@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Hi Niteesh,<br>
<br>
On 6/16/21 5:48 PM, Niteesh G. S. wrote:<br>
&gt; Hello,<br>
&gt; <br>
&gt; We now have a reasonably working prototype that is capable of<br>
&gt; sending/receiving<br>
&gt; commands/responses, syntax highlighting, and a simple notification<br>
&gt; system. The<br>
&gt; prototype can be found here<br>
&gt; <a href=3D"https://gitlab.com/niteesh.gs/qemu/-/tree/aqmp-tui-prototyp=
e" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/niteesh.gs/qemu/=
-/tree/aqmp-tui-prototype</a><br>
&gt; &lt;<a href=3D"https://gitlab.com/niteesh.gs/qemu/-/tree/aqmp-tui-prot=
otype" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/niteesh.gs/q=
emu/-/tree/aqmp-tui-prototype</a>&gt;<br>
&gt; Working on this prototype gives us a lot of hints on things to worry<b=
r>
&gt; about and other<br>
&gt; ideas that were worth implementing. Our next goal is to start working =
on<br>
&gt; the real TUI<br>
&gt; based on this prototype.<br>
&gt; <br>
&gt; One requested feature of the TUI was to show documentation for the<br>
&gt; commands typed.<br>
&gt; To achieve this, a QMP command that lets us query the documentation fr=
om<br>
&gt; QEMU has<br>
&gt; to be implemented and some discussion has already been done on it in a=
<br>
&gt; previous thread.<br>
&gt; I request=C2=A0all continue that discussion here and suggest ideas reg=
arding<br>
&gt; implementation.<br>
&gt; The goal is to come up with something small and simple which can also =
be<br>
&gt; improved upon<br>
&gt; after the summer.<br>
&gt; <br>
&gt; I have a simple implementation of the command that returns dummy<br>
&gt; documentation here<br>
&gt; <a href=3D"https://gitlab.com/niteesh.gs/qemu/-/commit/796a41fb2840b9f=
3484c6fd5672e6fceb73acaef" rel=3D"noreferrer" target=3D"_blank">https://git=
lab.com/niteesh.gs/qemu/-/commit/796a41fb2840b9f3484c6fd5672e6fceb73acaef</=
a><br>
&gt; &lt;<a href=3D"https://gitlab.com/niteesh.gs/qemu/-/commit/796a41fb284=
0b9f3484c6fd5672e6fceb73acaef" rel=3D"noreferrer" target=3D"_blank">https:/=
/gitlab.com/niteesh.gs/qemu/-/commit/796a41fb2840b9f3484c6fd5672e6fceb73aca=
ef</a>&gt;<br>
<br>
I noticed your mail got no comment, and realized you asked us to<br>
review your patches apart from the mailing list. I am not sure<br>
if this is an experiment or a misunderstanding, but so far it is<br>
unlikely you get review external to the mailing list, because it<br>
is not very practical to reviewers.<br></blockquote><div>=C2=A0</div><div><=
div class=3D"gmail_default" style=3D"font-size:small">Sorry for not conveyi=
ng the main intent of this mail properly.</div><div class=3D"gmail_default"=
 style=3D"font-size:small">The main goal of this mail was to start a discus=
sion regarding the implementation</div><div class=3D"gmail_default" style=
=3D"font-size:small">of the QMP documentation retrieval command for AQMP TU=
I. There has already</div><div class=3D"gmail_default" style=3D"font-size:s=
mall">been a small discussion regarding it in my introduction mail but it w=
asn&#39;t anything</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">in detail and it stagnated. So I created this mail to have a separate t=
hread to collect</div><div class=3D"gmail_default" style=3D"font-size:small=
">all points regarding implementation and again start the discussion.=C2=A0=
</div><div class=3D"gmail_default" style=3D"font-size:small">We now have a =
prototype with the most basic features implemented and working.</div><div c=
lass=3D"gmail_default" style=3D"font-size:small">But there is a lot of clea=
n-up that has to be done before I can send the prototype to the</div><div c=
lass=3D"gmail_default" style=3D"font-size:small">mailing list for review. A=
nd since the prototype is almost done John asked me to start</div><div clas=
s=3D"gmail_default" style=3D"font-size:small">a discussion regarding the QM=
P command so that I can work on it as a side project</div><div class=3D"gma=
il_default" style=3D"font-size:small">along side=C2=A0the TUI.</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gma=
il_default" style=3D"font-size:small">TLDR: The goal of this mail wasn&#39;=
t to review the dummy command I had posted but</div><div class=3D"gmail_def=
ault" style=3D"font-size:small">rather start a discussion=C2=A0regarding th=
e implementation of the QMP documentation</div><div class=3D"gmail_default"=
 style=3D"font-size:small">retrieval command for the TUI.</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">Thanks,</div><div class=3D"gmail_default=
" style=3D"font-size:small">Niteesh.</div><br></div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
Maybe some reviewers are willing to look at your tree, but if you<br>
are looking for a wider audience, I recommend you to follow this<br>
process (which you already used!):<br>
<a href=3D"https://wiki.qemu.org/Contribute/SubmitAPatch#Submitting_your_Pa=
tches" rel=3D"noreferrer" target=3D"_blank">https://wiki.qemu.org/Contribut=
e/SubmitAPatch#Submitting_your_Patches</a><br>
<br>
Regards,<br>
<br>
Phil.<br>
<br>
</blockquote></div></div>

--0000000000007da16905c54ad19b--


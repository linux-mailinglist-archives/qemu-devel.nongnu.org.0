Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AFA4D2CCD
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 11:09:46 +0100 (CET)
Received: from localhost ([::1]:33738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRtGM-0008VR-04
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 05:09:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nRtEG-00075G-0Z
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 05:07:36 -0500
Received: from [2a00:1450:4864:20::430] (port=46759
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nRtED-00044Q-Uh
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 05:07:35 -0500
Received: by mail-wr1-x430.google.com with SMTP id x15so2123719wru.13
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 02:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=clSEktqSzt9tH6AxGHnu16VPv7iuL1fiwDRgBErmdok=;
 b=X9Jqm/JVQNTWYHIC83UPUZTYBo0iAOwpTLexW8TGRIsebqdQcXjQsz/UK4bpc5fOsv
 INsOMZIi7MYZGQmDlOnt1Rh8ujK2X8C1FMOzfMlrtNeJ3JYB44J0AhDTHcGp3jVmQkbz
 kATB1+WlemNsSeCUw349KZ+I3q0QB4A8RPRqVZg4ylbauUEwnvkZWqqsZd3UsZevoQu8
 GtNqzKqYu6da/dGQaEDex8Cch2YLrPyn+422xEbUEQd13cv6+wm03UeZRLv/ohPhBQxg
 v3lskJpfNjfJCdQAKpWLnqWjI+Kzp5G/yhLpHy8tfX6rMLB4S3qW2VFnX0/aR+834rK7
 Nl4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=clSEktqSzt9tH6AxGHnu16VPv7iuL1fiwDRgBErmdok=;
 b=pTdiRXC6E+Vb/C236N0JL+igKyISzl3CpWl9sk3qVrwmcLJua7y8CmAuRJE6ENhRnW
 2Si7O4C5FsmUubM8cGZppH/IOaaZEfhc6k1lIU0OqsFTCzfN1IBAtK9+Ywcx/+kB2EVD
 jMph0q3adqqNcIVhSsh1kA779p7Wz3KTbnwh5j1CuSGTREaWk9+QzE8JREfX/8iqdnp9
 Q0/tcDNwe6bR4gVhGp4BnCHt+3bp31KgyB+fpYzbw0iZmw9XVIrVOZcESCdob8XFiKa7
 vb0lkyKFIHQufaiFqcIACiS5BzsjSZZ/GKiNkVnngrSm9NOxUPQpACT3NEBeprwaFZ+x
 nEhQ==
X-Gm-Message-State: AOAM5301s2BXSGm6+Izn8IAlgqxTsgYCKUFpuXxWH10NMmJx5OiJ+Ru0
 kzrINr40aBTOrsxjkXplxDvvQIY32MaPxFmO77s=
X-Google-Smtp-Source: ABdhPJyAg8M334gJXVV41tcqxbjwN3ilbkRUW1oWG08JK3jrD92saSWp/BM9r1Ln78cgNNRL5s4aVCiN7ycYhbd4zfQ=
X-Received: by 2002:a05:6000:c7:b0:1f0:2f56:f784 with SMTP id
 q7-20020a05600000c700b001f02f56f784mr15440657wrx.562.1646820452332; Wed, 09
 Mar 2022 02:07:32 -0800 (PST)
MIME-Version: 1.0
References: <CAMxuvawuMvxWx7xtsf=PbWnu7UypNfVWf+Bufeqbi4J=SjsU9w@mail.gmail.com>
 <1fa142fb-7988-db25-c283-a6b16278f628@gmail.com>
 <CAJ+F1CLDm9+myAJdNQdU2y64Fa-2+ew2oGih_cWim1=vO=sLMw@mail.gmail.com>
 <e1a9ab86-912b-2628-1e60-4aec4eac25d3@gmail.com>
 <CAJ+F1CKJHqA5DJv1WvY8q0k2rNW+ERFbFgMGKggMuMUJCPs5vg@mail.gmail.com>
 <2517a6b9-cc34-3bb1-d17e-d4e30f0e68b7@gmail.com>
 <CAJ+F1CKrDnYdMKNh1nu8LjnQ=gJ9-umgGHW-E1D1sFO1gf=Rdg@mail.gmail.com>
 <76c68a33-b157-f127-36ee-034290bf3e4b@gmail.com>
 <CAJ+F1CLvKn3r68f7LvCP-2Rni_0G7Z21jZrPqNCByHoL6WL+8Q@mail.gmail.com>
 <c080b8ce-c88f-aa37-f47d-1709c9e6dce5@gmail.com>
 <20220309092605.5izvcbp6pougm6ye@sirius.home.kraxel.org>
 <5986332a-1f9c-01bf-e3e7-329cf2d04672@gmail.com>
 <CAJ+F1CJL_33rgpAG3s2TboxgzsgC1fEcDJ5Y=Cxc1Tbb6w0W6w@mail.gmail.com>
 <750d1ed6-9c02-bd1b-3988-eb44665e8e5a@gmail.com>
In-Reply-To: <750d1ed6-9c02-bd1b-3988-eb44665e8e5a@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 9 Mar 2022 14:07:20 +0400
Message-ID: <CAJ+F1CJiLdmrZbfQ0z_ObC0_GveAc4jqcj9JYN8uBCpAJUhJXA@mail.gmail.com>
Subject: Re: [PATCH v3 12/12] ui/console: call gfx_switch() even if the
 current scanout is GL
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000011f97605d9c64473"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001, FREEMAIL_REPLY=1,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000011f97605d9c64473
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Mar 9, 2022 at 2:01 PM Akihiko Odaki <akihiko.odaki@gmail.com>
wrote:

> On 2022/03/09 18:53, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Wed, Mar 9, 2022 at 1:32 PM Akihiko Odaki <akihiko.odaki@gmail.com
> > <mailto:akihiko.odaki@gmail.com>> wrote:
> >
> >     On 2022/03/09 18:26, Gerd Hoffmann wrote:
> >      >    Hi,
> >      >
> >      >> dpy_gfx_switch and dpy_gfx_update need to be called to finish t=
he
> >      >> initialization or switching of the non-OpenGL display. However,
> >     the proposed
> >      >> patch only calls dpy_gfx_switch.
> >      >>
> >      >> vnc actually does not need dpy_gfx_update because the vnc
> >     implementation of
> >      >> dpy_gfx_switch implicitly does the work for dpy_gfx_update, but
> >     the model of
> >      >> ui/console expects the two of dpy_gfx_switch and dpy_gfx_update
> >     is separated
> >      >> and only calling dpy_gfx_switch violates the model.
> >     dpy_gfx_update used to
> >      >> be called even in such a case before and it is a regression.
> >      >
> >      > Well, no, the ->dpy_gfx_switch() callback is supposed to do
> >     everything
> >      > needed to bring the new surface to the screen.  vnc isn't alone
> here,
> >      > gtk for example does the same (see gd_switch()).
> >      >
> >
> >
> > If dpy_gfx_switch() implies a full dpy_gfx_update(), then we would need
> > another callback to just set the new surface. This would avoid
> > intermediary and useless switches to 2d/surface when the scanout is GL.
> >
> > For consistency, we should also declare that gl_scanout_texture and
> > gl_scanout_dmabuf imply full update as well.
> >
> >      > Yes, typically this is roughly the same an explicit
> >     dpy_gfx_update call
> >      > would do.  So this could be changed if it helps making the openg=
l
> >     code
> >      > paths less confusing, but that should be a separate patch series
> and
> >      > separate discussion.
> >      >
> >      > take care,
> >      >    Gerd
> >      >
> >
> >     Then ui/cocoa is probably wrong. I don't think it does the update
> when
> >     dpy_gfx_switch is called.
> >
> >     Please tell me if you think dpy_gfx_switch shouldn't do the implici=
t
> >     update in the future. I'll write a patch to do the update in cocoa'=
s
> >     dpy_gfx_switch implementation otherwise.
> >
> >
> > Can we ack this series first and iterate on top? It solves a number of
> > issues already and is a better starting point.
> >
> > thanks
> >
> > --
> > Marc-Andr=C3=A9 Lureau
>
> The call of dpy_gfx_update in displaychangelistener_display_console
> should be removed. It would simplify the patch.
>
> Also it is still not shown that the series is a better alternative to:
> https://patchew.org/QEMU/20220213024222.3548-1-akihiko.odaki@gmail.com/
>
> The series "ui/dbus: Share one listener for a console" has significantly
> less code than this series and therefore needs some reasoning for that.
>

At this point, your change is much larger than the proposed fixes.

I already discussed the rationale for the current design. To summarize:
- dispatching DCL in the common code allows for greater reuse if an
alternative to dbus emerges, and should help making the code more dynamic
- the GL context split also is a separation of concerns and should help for
alternatives to EGL
- dbus code only handles dbus specifics

My understanding of your proposal is that you would rather see all this
done within the dbus code. I disagree for the reasons above. I may be
proven wrong, but so far, this works as expected minor the left-over and
regressions you pointed out that should be fixed. Going back to a different
design should be done in a next release if sufficiently motivated.
--=20
Marc-Andr=C3=A9 Lureau

--00000000000011f97605d9c64473
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 9, 2022 at 2:01 PM Akih=
iko Odaki &lt;<a href=3D"mailto:akihiko.odaki@gmail.com">akihiko.odaki@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On 2022/03/09 18:53, Marc-Andr=C3=A9 Lureau wrote:<br>
&gt; Hi<br>
&gt; <br>
&gt; On Wed, Mar 9, 2022 at 1:32 PM Akihiko Odaki &lt;<a href=3D"mailto:aki=
hiko.odaki@gmail.com" target=3D"_blank">akihiko.odaki@gmail.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:akihiko.odaki@gmail.com" target=3D"_blank=
">akihiko.odaki@gmail.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 2022/03/09 18:26, Gerd Hoffmann wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 Hi,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; dpy_gfx_switch and dpy_gfx_update need to=
 be called to finish the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; initialization or switching of the non-Op=
enGL display. However,<br>
&gt;=C2=A0 =C2=A0 =C2=A0the proposed<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; patch only calls dpy_gfx_switch.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; vnc actually does not need dpy_gfx_update=
 because the vnc<br>
&gt;=C2=A0 =C2=A0 =C2=A0implementation of<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; dpy_gfx_switch implicitly does the work f=
or dpy_gfx_update, but<br>
&gt;=C2=A0 =C2=A0 =C2=A0the model of<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; ui/console expects the two of dpy_gfx_swi=
tch and dpy_gfx_update<br>
&gt;=C2=A0 =C2=A0 =C2=A0is separated<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; and only calling dpy_gfx_switch violates =
the model.<br>
&gt;=C2=A0 =C2=A0 =C2=A0dpy_gfx_update used to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; be called even in such a case before and =
it is a regression.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Well, no, the -&gt;dpy_gfx_switch() callback =
is supposed to do<br>
&gt;=C2=A0 =C2=A0 =C2=A0everything<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; needed to bring the new surface to the screen=
.=C2=A0 vnc isn&#39;t alone here,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; gtk for example does the same (see gd_switch(=
)).<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; <br>
&gt; <br>
&gt; If dpy_gfx_switch() implies a full dpy_gfx_update(), then we would nee=
d <br>
&gt; another callback to just set the new surface. This would avoid <br>
&gt; intermediary and useless switches to 2d/surface when the scanout is GL=
.<br>
&gt; <br>
&gt; For consistency, we should also declare that gl_scanout_texture and <b=
r>
&gt; gl_scanout_dmabuf imply full update as well.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Yes, typically this is roughly the same an ex=
plicit<br>
&gt;=C2=A0 =C2=A0 =C2=A0dpy_gfx_update call<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; would do.=C2=A0 So this could be changed if i=
t helps making the opengl<br>
&gt;=C2=A0 =C2=A0 =C2=A0code<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; paths less confusing, but that should be a se=
parate patch series and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; separate discussion.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; take care,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 Gerd<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Then ui/cocoa is probably wrong. I don&#39;t think =
it does the update when<br>
&gt;=C2=A0 =C2=A0 =C2=A0dpy_gfx_switch is called.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Please tell me if you think dpy_gfx_switch shouldn&=
#39;t do the implicit<br>
&gt;=C2=A0 =C2=A0 =C2=A0update in the future. I&#39;ll write a patch to do =
the update in cocoa&#39;s<br>
&gt;=C2=A0 =C2=A0 =C2=A0dpy_gfx_switch implementation otherwise.<br>
&gt; <br>
&gt; <br>
&gt; Can we ack this series first and iterate on top? It solves a number of=
 <br>
&gt; issues already and is a better starting point.<br>
&gt; <br>
&gt; thanks<br>
&gt; <br>
&gt; -- <br>
&gt; Marc-Andr=C3=A9 Lureau<br>
<br>
The call of dpy_gfx_update in displaychangelistener_display_console <br>
should be removed. It would simplify the patch.<br>
<br>
Also it is still not shown that the series is a better alternative to:<br>
<a href=3D"https://patchew.org/QEMU/20220213024222.3548-1-akihiko.odaki@gma=
il.com/" rel=3D"noreferrer" target=3D"_blank">https://patchew.org/QEMU/2022=
0213024222.3548-1-akihiko.odaki@gmail.com/</a><br>
<br>
The series &quot;ui/dbus: Share one listener for a console&quot; has signif=
icantly <br>
less code than this series and therefore needs some reasoning for that.<br>=
</blockquote><div><br></div><div>At this point, your change is much larger =
than the proposed fixes.</div></div><div class=3D"gmail_quote"><br></div><d=
iv class=3D"gmail_quote">I already discussed the rationale for the current =
design. To summarize:</div><div class=3D"gmail_quote">- dispatching DCL in =
the common code allows for greater reuse if an alternative to dbus emerges,=
 and should help making the code more dynamic</div>- the GL context split a=
lso is a separation of concerns and should help for alternatives to EGL<br>=
<div class=3D"gmail_quote"><div>- dbus code only handles dbus specifics</di=
v><div><br></div><div>My understanding of your proposal is that you would r=
ather see all this done within the dbus code. I disagree for the reasons ab=
ove. I may be proven wrong, but so far, this works as expected minor the le=
ft-over and regressions you pointed out that should be fixed. Going back to=
 a different design should be done in a next release if sufficiently motiva=
ted.<br></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-=
Andr=C3=A9 Lureau<br></div></div>

--00000000000011f97605d9c64473--


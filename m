Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 074844D2D21
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 11:29:53 +0100 (CET)
Received: from localhost ([::1]:59844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRtZm-0002Hw-05
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 05:29:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nRtYF-0001SE-5U
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 05:28:15 -0500
Received: from [2a00:1450:4864:20::430] (port=40880
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nRtYC-0007MS-S4
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 05:28:14 -0500
Received: by mail-wr1-x430.google.com with SMTP id k24so2257719wrd.7
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 02:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+zhBED1olJtg50Jlh48WTrNishHXIOAOzNFIiFIrDTI=;
 b=dJeWCCNyt3zs6bG6ApfsH3I0OJsch8KUcyXjvpkIl5UzEB73BtAdPMkkkRO2kMucnP
 TMCSDHzBeoGGY6XiPxJYjf5uGQeP++nTo3c8ApCZV0fspVSiwYuXiWqVDcQVV/+nRoL4
 q+CgP3ANJ4yRyi93PWNnXsRxELJUf2tUNStwbdZQSeFwR63pFN9en4m4h2kvYf3vrArE
 b1XokAqAtE0QEGKVNpzpvp50lnjT4zdmZHnQhucwa+hOXzkG7FoNN/jhfQyCjN8Zr5T9
 EjVyQnyHb+sIYgdAWq3zUS9oEMRNZWJWXgwQhwRt8ZX6SxffK6xYvuhj0N9lA7WkdZpK
 OgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+zhBED1olJtg50Jlh48WTrNishHXIOAOzNFIiFIrDTI=;
 b=zDbkAbQzelnb3lF6/YHeI3NGayC+pGjNu7pa9gl8osV5+jf7sSo2z3ZRxZ6zovtxd7
 lEqiWlccDAKNMucVC9hfyZryU7+Yja8CiqYd31kcLmlNP1Jxom8AMiA6PHAEMnxtLIRD
 RAMlY7l4LOZATETnZKfPfdWbJ9/Cr6R5G/vrNbXDi10RroQf6Z3Zb++zr70YhFylt548
 82DmrlRE2o2a+3Go9SZ1Xtif7tw+V+kzrtyW8ILzWtvZ0qyjzuU7R8wiEX++bS/QXBXJ
 i1fdDeitPzjOlEalnDCOlgGRKwM8aZ5pn3G7Fkpbr8s3519byYYF8Y/5M63+5fixJeUg
 zKDg==
X-Gm-Message-State: AOAM530tZKThx/XlCgPxiqXvYhid/TL8n49Zh0Rm8HTn7XbhmXuV0s3h
 H1bFFAyJ56qYhrKFgL68d9FmEZyHcaCz2NAU0ng=
X-Google-Smtp-Source: ABdhPJxJ+lDNhRoFWqpYNopp2WiurtFuqd4NYowQUPUYUW9vvJdb5OKldLJIj4JxOnB2gW2WzxsvOYU5MpbiHutD7rk=
X-Received: by 2002:adf:cd02:0:b0:1f0:767d:b39a with SMTP id
 w2-20020adfcd02000000b001f0767db39amr15161343wrm.529.1646821691345; Wed, 09
 Mar 2022 02:28:11 -0800 (PST)
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
 <CAJ+F1CJiLdmrZbfQ0z_ObC0_GveAc4jqcj9JYN8uBCpAJUhJXA@mail.gmail.com>
 <07871c4c-58bf-b0db-b8b2-da6f0f9acfe2@gmail.com>
In-Reply-To: <07871c4c-58bf-b0db-b8b2-da6f0f9acfe2@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 9 Mar 2022 14:27:58 +0400
Message-ID: <CAJ+F1CK0mEZDLb45VpoLTTVLrsqdr5b=opzBfL0ZQ+pKvtNuGw@mail.gmail.com>
Subject: Re: [PATCH v3 12/12] ui/console: call gfx_switch() even if the
 current scanout is GL
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000ebd03205d9c68de0"
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

--000000000000ebd03205d9c68de0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Mar 9, 2022 at 2:20 PM Akihiko Odaki <akihiko.odaki@gmail.com>
wrote:

> On 2022/03/09 19:07, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Wed, Mar 9, 2022 at 2:01 PM Akihiko Odaki <akihiko.odaki@gmail.com
> > <mailto:akihiko.odaki@gmail.com>> wrote:
> >
> >     On 2022/03/09 18:53, Marc-Andr=C3=A9 Lureau wrote:
> >      > Hi
> >      >
> >      > On Wed, Mar 9, 2022 at 1:32 PM Akihiko Odaki
> >     <akihiko.odaki@gmail.com <mailto:akihiko.odaki@gmail.com>
> >      > <mailto:akihiko.odaki@gmail.com
> >     <mailto:akihiko.odaki@gmail.com>>> wrote:
> >      >
> >      >     On 2022/03/09 18:26, Gerd Hoffmann wrote:
> >      >      >    Hi,
> >      >      >
> >      >      >> dpy_gfx_switch and dpy_gfx_update need to be called to
> >     finish the
> >      >      >> initialization or switching of the non-OpenGL display.
> >     However,
> >      >     the proposed
> >      >      >> patch only calls dpy_gfx_switch.
> >      >      >>
> >      >      >> vnc actually does not need dpy_gfx_update because the vn=
c
> >      >     implementation of
> >      >      >> dpy_gfx_switch implicitly does the work for
> >     dpy_gfx_update, but
> >      >     the model of
> >      >      >> ui/console expects the two of dpy_gfx_switch and
> >     dpy_gfx_update
> >      >     is separated
> >      >      >> and only calling dpy_gfx_switch violates the model.
> >      >     dpy_gfx_update used to
> >      >      >> be called even in such a case before and it is a
> regression.
> >      >      >
> >      >      > Well, no, the ->dpy_gfx_switch() callback is supposed to =
do
> >      >     everything
> >      >      > needed to bring the new surface to the screen.  vnc isn't
> >     alone here,
> >      >      > gtk for example does the same (see gd_switch()).
> >      >      >
> >      >
> >      >
> >      > If dpy_gfx_switch() implies a full dpy_gfx_update(), then we
> >     would need
> >      > another callback to just set the new surface. This would avoid
> >      > intermediary and useless switches to 2d/surface when the scanout
> >     is GL.
> >      >
> >      > For consistency, we should also declare that gl_scanout_texture
> and
> >      > gl_scanout_dmabuf imply full update as well.
> >      >
> >      >      > Yes, typically this is roughly the same an explicit
> >      >     dpy_gfx_update call
> >      >      > would do.  So this could be changed if it helps making th=
e
> >     opengl
> >      >     code
> >      >      > paths less confusing, but that should be a separate patch
> >     series and
> >      >      > separate discussion.
> >      >      >
> >      >      > take care,
> >      >      >    Gerd
> >      >      >
> >      >
> >      >     Then ui/cocoa is probably wrong. I don't think it does the
> >     update when
> >      >     dpy_gfx_switch is called.
> >      >
> >      >     Please tell me if you think dpy_gfx_switch shouldn't do the
> >     implicit
> >      >     update in the future. I'll write a patch to do the update in
> >     cocoa's
> >      >     dpy_gfx_switch implementation otherwise.
> >      >
> >      >
> >      > Can we ack this series first and iterate on top? It solves a
> >     number of
> >      > issues already and is a better starting point.
> >      >
> >      > thanks
> >      >
> >      > --
> >      > Marc-Andr=C3=A9 Lureau
> >
> >     The call of dpy_gfx_update in displaychangelistener_display_console
> >     should be removed. It would simplify the patch.
> >
> >     Also it is still not shown that the series is a better alternative
> to:
> >
> https://patchew.org/QEMU/20220213024222.3548-1-akihiko.odaki@gmail.com/
> >     <
> https://patchew.org/QEMU/20220213024222.3548-1-akihiko.odaki@gmail.com/>
> >
> >     The series "ui/dbus: Share one listener for a console" has
> >     significantly
> >     less code than this series and therefore needs some reasoning for
> that.
> >
> >
> > At this point, your change is much larger than the proposed fixes.
>
> My change does not touch the common code except reverting and minimizes
> the risk of regression. It also results in the less code when applied to
> the tree.
>

The risk of regressions is proportional to the amount of code change. Your
change is larger (and may be even larger when updated and reviewed
properly). At this point in Qemu schedule, this is a greater risk.


> >
> > I already discussed the rationale for the current design. To summarize:
> > - dispatching DCL in the common code allows for greater reuse if an
> > alternative to dbus emerges, and should help making the code more dynam=
ic
> > - the GL context split also is a separation of concerns and should help
> > for alternatives to EGL
> > - dbus code only handles dbus specifics
>
> Let me summarize my counterargument:
> - The suggested reuse case is not emerged yet.
>

It doesn't mean the design isn't superior and wanted.


> - The GL context split is not aligned with the reality where the display
> knows the graphics accelerator where the window resides and the context
> should be created. The alternative to EGL can be introduced in a similar
>

A GL context is not necessarily associated with a window.


> manner with ui/egl-context.c and ui/egl-helpers.c. If several context
> providers need to be supported, the selection should be passed as a
> parameter, just as the current code does for EGL rendernode.
>

It's not just about where the code resides, but also about the type design.
It's cleaner to separate DisplayGLCtxt from DisplayChangeListener.


> - implementing the dispatching would allow dbus to share more things
> like e.g. textures converted from DisplaySurface and GunixFDList for
> DMA-BUF. They are not present in all displays and some are completely
> specific to dbus.
>

And the dbus specific code is within dbus modules.

>
> >
> > My understanding of your proposal is that you would rather see all this
> > done within the dbus code. I disagree for the reasons above. I may be
> > proven wrong, but so far, this works as expected minor the left-over an=
d
> > regressions you pointed out that should be fixed. Going back to a
> > different design should be done in a next release if sufficiently
> motivated.
>
> Reverting the dbus change is the safest option if it does not settle.


We have a different sense of safety.

--000000000000ebd03205d9c68de0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 9, 2022 at 2:20 PM Akih=
iko Odaki &lt;<a href=3D"mailto:akihiko.odaki@gmail.com">akihiko.odaki@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On 2022/03/09 19:07, Marc-Andr=C3=A9 Lureau wrote:<br>
&gt; Hi<br>
&gt; <br>
&gt; On Wed, Mar 9, 2022 at 2:01 PM Akihiko Odaki &lt;<a href=3D"mailto:aki=
hiko.odaki@gmail.com" target=3D"_blank">akihiko.odaki@gmail.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:akihiko.odaki@gmail.com" target=3D"_blank=
">akihiko.odaki@gmail.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 2022/03/09 18:53, Marc-Andr=C3=A9 Lureau wrote:<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Hi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; On Wed, Mar 9, 2022 at 1:32 PM Akihiko Odaki<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:akihiko.odaki@gmail.com" targ=
et=3D"_blank">akihiko.odaki@gmail.com</a> &lt;mailto:<a href=3D"mailto:akih=
iko.odaki@gmail.com" target=3D"_blank">akihiko.odaki@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &lt;mailto:<a href=3D"mailto:akihiko.odaki@gm=
ail.com" target=3D"_blank">akihiko.odaki@gmail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:akihiko.odaki@gmail.co=
m" target=3D"_blank">akihiko.odaki@gmail.com</a>&gt;&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0On 2022/03/09 18:26, Gerd =
Hoffmann wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 Hi,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; dpy_gfx_switch a=
nd dpy_gfx_update need to be called to<br>
&gt;=C2=A0 =C2=A0 =C2=A0finish the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; initialization o=
r switching of the non-OpenGL display.<br>
&gt;=C2=A0 =C2=A0 =C2=A0However,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0the proposed<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; patch only calls=
 dpy_gfx_switch.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; vnc actually doe=
s not need dpy_gfx_update because the vnc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0implementation of<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; dpy_gfx_switch i=
mplicitly does the work for<br>
&gt;=C2=A0 =C2=A0 =C2=A0dpy_gfx_update, but<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0the model of<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; ui/console expec=
ts the two of dpy_gfx_switch and<br>
&gt;=C2=A0 =C2=A0 =C2=A0dpy_gfx_update<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0is separated<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; and only calling=
 dpy_gfx_switch violates the model.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0dpy_gfx_update used to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; be called even i=
n such a case before and it is a regression.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Well, no, the -&gt;d=
py_gfx_switch() callback is supposed to do<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0everything<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; needed to bring the =
new surface to the screen.=C2=A0 vnc isn&#39;t<br>
&gt;=C2=A0 =C2=A0 =C2=A0alone here,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; gtk for example does=
 the same (see gd_switch()).<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; If dpy_gfx_switch() implies a full dpy_gfx_up=
date(), then we<br>
&gt;=C2=A0 =C2=A0 =C2=A0would need<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; another callback to just set the new surface.=
 This would avoid<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; intermediary and useless switches to 2d/surfa=
ce when the scanout<br>
&gt;=C2=A0 =C2=A0 =C2=A0is GL.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; For consistency, we should also declare that =
gl_scanout_texture and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; gl_scanout_dmabuf imply full update as well.<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Yes, typically this =
is roughly the same an explicit<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0dpy_gfx_update call<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; would do.=C2=A0 So t=
his could be changed if it helps making the<br>
&gt;=C2=A0 =C2=A0 =C2=A0opengl<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0code<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; paths less confusing=
, but that should be a separate patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0series and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; separate discussion.=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; take care,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 Gerd<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Then ui/cocoa is probably =
wrong. I don&#39;t think it does the<br>
&gt;=C2=A0 =C2=A0 =C2=A0update when<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0dpy_gfx_switch is called.<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Please tell me if you thin=
k dpy_gfx_switch shouldn&#39;t do the<br>
&gt;=C2=A0 =C2=A0 =C2=A0implicit<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0update in the future. I&#3=
9;ll write a patch to do the update in<br>
&gt;=C2=A0 =C2=A0 =C2=A0cocoa&#39;s<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0dpy_gfx_switch implementat=
ion otherwise.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Can we ack this series first and iterate on t=
op? It solves a<br>
&gt;=C2=A0 =C2=A0 =C2=A0number of<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; issues already and is a better starting point=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; thanks<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Marc-Andr=C3=A9 Lureau<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0The call of dpy_gfx_update in displaychangelistener=
_display_console<br>
&gt;=C2=A0 =C2=A0 =C2=A0should be removed. It would simplify the patch.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Also it is still not shown that the series is a bet=
ter alternative to:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://patchew.org/QEMU/20220213024222.=
3548-1-akihiko.odaki@gmail.com/" rel=3D"noreferrer" target=3D"_blank">https=
://patchew.org/QEMU/20220213024222.3548-1-akihiko.odaki@gmail.com/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://patchew.org/QEMU/20220213024=
222.3548-1-akihiko.odaki@gmail.com/" rel=3D"noreferrer" target=3D"_blank">h=
ttps://patchew.org/QEMU/20220213024222.3548-1-akihiko.odaki@gmail.com/</a>&=
gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0The series &quot;ui/dbus: Share one listener for a =
console&quot; has<br>
&gt;=C2=A0 =C2=A0 =C2=A0significantly<br>
&gt;=C2=A0 =C2=A0 =C2=A0less code than this series and therefore needs some=
 reasoning for that.<br>
&gt; <br>
&gt; <br>
&gt; At this point, your change is much larger than the proposed fixes.<br>
<br>
My change does not touch the common code except reverting and minimizes <br=
>
the risk of regression. It also results in the less code when applied to <b=
r>
the tree.<br></blockquote><div><br></div><div>The risk of regressions is pr=
oportional to the amount of code change. Your change is larger (and may be =
even larger when updated and reviewed properly). At this point in Qemu sche=
dule, this is a greater risk.<br></div><div><br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
<br>
&gt; <br>
&gt; I already discussed the rationale for the current design. To summarize=
:<br>
&gt; - dispatching DCL in the common code allows for greater reuse if an <b=
r>
&gt; alternative to dbus emerges, and should help making the code more dyna=
mic<br>
&gt; - the GL context split also is a separation of concerns and should hel=
p <br>
&gt; for alternatives to EGL<br>
&gt; - dbus code only handles dbus specifics<br>
<br>
Let me summarize my counterargument:<br>
- The suggested reuse case is not emerged yet.<br></blockquote><div><br></d=
iv><div>It doesn&#39;t mean the design isn&#39;t superior and wanted.</div>=
<div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
- The GL context split is not aligned with the reality where the display <b=
r>
knows the graphics accelerator where the window resides and the context <br=
>
should be created. The alternative to EGL can be introduced in a similar <b=
r></blockquote><div><br></div><div>A GL context is not necessarily associat=
ed with a window.<br></div><div>=C2=A0<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
manner with ui/egl-context.c and ui/egl-helpers.c. If several context <br>
providers need to be supported, the selection should be passed as a <br>
parameter, just as the current code does for EGL rendernode.<br></blockquot=
e><div><br></div><div>It&#39;s not just about where the code resides, but a=
lso about the type design. It&#39;s cleaner to separate DisplayGLCtxt from =
DisplayChangeListener.<br></div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
- implementing the dispatching would allow dbus to share more things <br>
like e.g. textures converted from DisplaySurface and GunixFDList for <br>
DMA-BUF. They are not present in all displays and some are completely <br>
specific to dbus.<br></blockquote><div><br></div><div>And the dbus specific=
 code is within dbus modules. <br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
<br>
&gt; <br>
&gt; My understanding of your proposal is that you would rather see all thi=
s <br>
&gt; done within the dbus code. I disagree for the reasons above. I may be =
<br>
&gt; proven wrong, but so far, this works as expected minor the left-over a=
nd <br>
&gt; regressions you pointed out that should be fixed. Going back to a <br>
&gt; different design should be done in a next release if sufficiently moti=
vated.<br>
<br>
Reverting the dbus change is the safest option if it does not settle.</bloc=
kquote><div><br></div><div>We have a different sense of safety. <br></div><=
/div></div>

--000000000000ebd03205d9c68de0--


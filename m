Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEC458FA83
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 12:11:44 +0200 (CEST)
Received: from localhost ([::1]:36724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM5AF-0008Ei-RI
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 06:11:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oM58H-0006aD-De; Thu, 11 Aug 2022 06:09:41 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:42648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oM58E-0004Qj-Pb; Thu, 11 Aug 2022 06:09:41 -0400
Received: by mail-lf1-x133.google.com with SMTP id z6so17445839lfu.9;
 Thu, 11 Aug 2022 03:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=+hvIvzMc8QUmhHV3UYAMntHl0A0babCUQeGZ9y6aRTg=;
 b=FkUrJLFs8OSPYSNa2r2Rt9XR/vfd9J6FKGFkJMAcHzMKutMY03g2912TkATL7PkY01
 YxEliA+Ca4utxFPId17bm726N1ig4z/uTQTBajbeoTlBCydmbBzzCZTZkETqbhpHtZbK
 HYKl/3aV6Z3NyUxgN6Fhg0qqmPZkh0E3F7UnmFyxQBvUCf7y8smXS/R1LXXSxlfYw5eB
 WE4A8ZyR6dk69Tt6nQk8fzBqO6ga/w0GuoLsZOxttYimuOgwCDcn8kPvBocmfD0r08K9
 wiJwDvsblj8+1TkmIGtv7QkDTuGq1ZqQyNdENyL/Irk5L7ybO0F5pHL6bBmHwG+gLnjt
 C2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=+hvIvzMc8QUmhHV3UYAMntHl0A0babCUQeGZ9y6aRTg=;
 b=p3LwH2rIp1gZ82QEDbxGDAZJT0NcucFfD1lJ8L84nv46kzTZ6Un0OynQ0ENgYmyOfJ
 s91eCmSGGrfpTYXC5aMA4qtNwtKA/6Fmo3kt9DbadAkPTCMJzvGBtIqfMwnrX4FvxW45
 tv/hd+VHbiFvm5NaKJxile3Q9v0ii2TVgdgAYBOA5CzyH9IS7GZuXxw45bgVu4eJQwJ3
 QEh5SkVaY1rUlK36Z3pBr0eorreMAVsZH2QrDsa5/ha9lDvWHWJZwhzaspILvvm+Xnty
 6WyhwEo1vcx5UplvWUwRqi0QEEA2nA+nZr/sEr1Dg03oNgUJgTz5Wnrf90X5sTwC7i5R
 YNUQ==
X-Gm-Message-State: ACgBeo2NLcN0zT3HaEeTQOsGDMGbzcRD4SKy4A8wfe5Rt219LvuJ5e8z
 vEl0V8sp6oJgdENOorKzci6fs7NB86g39VMamH4=
X-Google-Smtp-Source: AA6agR7ZK4egGsDlwKJcHqDW+yEu/pFwo8GJhJTcPg4VZb2Zu6M68Tq8qpCAzy9TaNTBgWdM2dvMkqsDjx1SJDVaZQ0=
X-Received: by 2002:ac2:55af:0:b0:48d:3b2c:dd4f with SMTP id
 y15-20020ac255af000000b0048d3b2cdd4fmr2207351lfg.329.1660212576470; Thu, 11
 Aug 2022 03:09:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220712093528.4144184-1-marcandre.lureau@redhat.com>
 <20220712093528.4144184-12-marcandre.lureau@redhat.com>
 <87pmhf86ew.fsf@pond.sub.org>
 <CAJ+F1C+=TbU+dW23MM8Vyaxti73xySMkuK4+wRDjgdM32qMCAA@mail.gmail.com>
 <8735e38e6t.fsf@pond.sub.org>
 <CAJ+F1CKH5y8SWULvgXWh7PPDTXOMGusYHE6RwZDZWVJoC=m8hQ@mail.gmail.com>
 <87o7wr5ew9.fsf@pond.sub.org>
In-Reply-To: <87o7wr5ew9.fsf@pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 11 Aug 2022 14:09:24 +0400
Message-ID: <CAJ+F1CKbkTOX7Fh9RvkBvuW_gZqZjYSta=7nEKbzm-OefPE_GQ@mail.gmail.com>
Subject: Re: [PATCH v2 11/15] qemu-common: move scripts/qapi
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>, 
 Cleber Rosa <crosa@redhat.com>, qemu-block@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Xie Yongji <xieyongji@bytedance.com>, 
 Kyle Evans <kevans@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>, 
 John Snow <jsnow@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Warner Losh <imp@bsdimp.com>, 
 Kevin Wolf <kwolf@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Laurent Vivier <laurent@vivier.eu>, 
 Fam Zheng <fam@euphon.net>, Hanna Reitz <hreitz@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000df4c9a05e5f45cfd"
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x133.google.com
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

--000000000000df4c9a05e5f45cfd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 11, 2022 at 1:05 PM Markus Armbruster <armbru@redhat.com> wrote=
:

> Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:
>
> > Hi
> >
> > On Thu, Aug 11, 2022 at 10:52 AM Markus Armbruster <armbru@redhat.com>
> > wrote:
> >
> >> Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:
> >>
> >> > Hi
> >> >
> >> > On Fri, Aug 5, 2022 at 12:12 PM Markus Armbruster <armbru@redhat.com=
>
> >> wrote:
> >> >
> >> >> marcandre.lureau@redhat.com writes:
> >> >>
> >> >> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >> >> >
> >> >> > This is just moving qapi-gen.py and related subdir to qemu-common=
,
> to
> >> >> > ease review and proceed step by step. The following patches will
> move
> >> >> > related necessary code, tests etc.
> >> >> >
> >> >> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.co=
m>
> >> >>
> >> >> As moved files tend to become low-level annoyances for a long time,
> I'd
> >> >> like to understand why you want to move them.  The commit message
> says
> >> >> "to ease review", which I suspect isn't the real reason.  Perhaps y=
ou
> >> >> explained all that elsewhere already, but I missed it.
> >> >>
> >> >>
> >> >>
> >> > The end goal is to split some projects, such as qemu-ga, to standalo=
ne
> >> > meson projects/subprojects. We will be able to build them
> independently
> >> > from the rest of QEMU, and later on perhaps handle them outside of
> QEMU
> >> > main repository. To achieve this, I first introduce a qemu-common
> >> > subproject, where qapi and common units are provided. You can check
> >> > https://gitlab.com/marcandre.lureau/qemu/-/commits/qga for a sneak
> peek at
> >> > current end result.
> >>
> >> I worry this move of the QAPI generator code into
> >> subjprojects/common/scripts/qapi/ will be followed by a move into its
> >> own subproject.
> >>
> >
> > Do you mean: it could be moved again to another smaller subproject? not
> > really, see below
> >
> >
> >> Ignorant question: could we turn the QAPI generator into a subproject =
in
> >> place?
> >>
> >
> > If it's just the generator, probably the target would then be a python
> > project (not meson), similar to python-qemu-qmp.
> >
> > But I don't see much point, since it's not really a standalone python
> > module, it generates code, and that code needs most of what is in
> > qemu-common (see
> >
> https://gitlab.com/marcandre.lureau/qemu/-/tree/qga/subprojects/qemu-comm=
on
> ).
> > It's best to have it together imho. Maybe we can consider a different
> > naming or to be more careful not to add stuff that is not strictly need=
ed
> > by qapi?
>
> I had a look at subjprojects/qemu-common in your qga branch.  Contents:
>
> * Subproject machinery
>
> * Some common headers (glib-compat.h), but not others (qemu/osdep.h).  I
>   guess it's whatever subjproject code needs.
>
>   Is subprojects/qemu-common/include/block/nvme.h there by accident?
>

It's a header shared with qemu-ga (the commit message explains)


>
> * Most of the QObject subsystem
>
>   qobject/block-qdict.c is left behind.
>

It's qemu block specific. Not needed to move at this point, it drags other
stuff iirc.


> * Most of the QAPI subsystem
>
>   Some visitors left behind: opts, forward, string input / output.  Hmm,
>   only the .c, the .h are in the subjproject.  Accident?
>

If they are not shared with qemu-ga, I didn't move them yet. They can stay
specific to qemu or specific subprojects, or we can decide to move them (if
that doesn't drag too much stuff along).


>
>   A bit of HMP support left behind.
>

Can you be more specific?


>
> * Parts of util/ and include/qemu/
>
>   Error reporting, key-value CLI, some C utilities, but not others
>   (e.g. qemu/atomic.h, but not qemu/atomic128.h).  I guess it's again
>   whatever subjproject code needs.
>
>
* Parts of the QAPI Schema subsystem
>
> Aside: MAINTAINERS mostly not updated.
>
>
That needs fixing.


> Your moves tear closely related code apart.  This is going to be a drag
> for developers in general and maintainers in particular.
>
> Ergonomics suffer when related code is in multiple places.  Having to
> switch between directories and remember where is what will a constant
> low-level pain.  Things that used to be simple & quick, like git-grep
> qapi/*.c, become more involved.
>
>
It's inevitable when a project grows. QEMU is already a very large project.
Over the years, we have structured the project, by moving things and
splitting in subdirectories. Imho, this is actually helpful in many ways,
and we got used to it easily hopefully.

Do you see fundamental reasons why qemu-ga or (qemu-img, qemu-nbd,
storage-daemon, virtiofsd, vhost-user-*, *helper, ivshmem* etc) need to be
tight to qemu code, release and management process? I am not saying it's
time to move them out of qemu project, but I believe it's helpful to have
code that is structured and can be compiled indepently.

And by having "standalone" subprojects, we can more easily evolve in new
directions, without touching the rest of the projects.

Hurts even when merely consuming the subsystem: when I see #include
> "qemu/foo.h", the straightforward include/qemu/foo.h may or may not do.
> When it doesn't, I need to know where to look instead.
>
> subprojects/qemu-common/include/ is a lot to type.  Sufficiently
> powerful editors mitigate, but not completely.
>
> When changes need to be applied to every instance of an abstraction,
> it's easy to miss instances "elsewhere".  There's a reason the QAPI
> visitors are all in one place.
>

I understand it's nice to have all the code in one place. At the same time,
this goes against modularity and composability..

>
> The actual split seems somewhat arbitrary in places.  I suspect more
> code will move over time.  Invalidating "what is where" knowledge.
>

Are you insinuating that this is obvious today? :) By having smaller
standalone projects, we have better defined scope, test range, reusability
etc. And we avoid creating a jam of dependencies, making code review &
change a bit easier..


> I believe a serious think about other ways to accomplish your goals is
> called for.
>

I don't claim to have the perfect solution. It's evolution, hopefully a
step in a better direction.

thanks


--=20
Marc-Andr=C3=A9 Lureau

--000000000000df4c9a05e5f45cfd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 11, 2022 at 1:05 PM Marku=
s Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Marc=
-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@gmail.com" target=
=3D"_blank">marcandre.lureau@gmail.com</a>&gt; writes:<br>
<br>
&gt; Hi<br>
&gt;<br>
&gt; On Thu, Aug 11, 2022 at 10:52 AM Markus Armbruster &lt;<a href=3D"mail=
to:armbru@redhat.com" target=3D"_blank">armbru@redhat.com</a>&gt;<br>
&gt; wrote:<br>
&gt;<br>
&gt;&gt; Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@gmai=
l.com" target=3D"_blank">marcandre.lureau@gmail.com</a>&gt; writes:<br>
&gt;&gt;<br>
&gt;&gt; &gt; Hi<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Fri, Aug 5, 2022 at 12:12 PM Markus Armbruster &lt;<a href=
=3D"mailto:armbru@redhat.com" target=3D"_blank">armbru@redhat.com</a>&gt;<b=
r>
&gt;&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; <a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"=
_blank">marcandre.lureau@redhat.com</a> writes:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:m=
arcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</=
a>&gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; This is just moving qapi-gen.py and related subdir t=
o qemu-common, to<br>
&gt;&gt; &gt;&gt; &gt; ease review and proceed step by step. The following =
patches will move<br>
&gt;&gt; &gt;&gt; &gt; related necessary code, tests etc.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D=
"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@red=
hat.com</a>&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; As moved files tend to become low-level annoyances for a =
long time, I&#39;d<br>
&gt;&gt; &gt;&gt; like to understand why you want to move them.=C2=A0 The c=
ommit message says<br>
&gt;&gt; &gt;&gt; &quot;to ease review&quot;, which I suspect isn&#39;t the=
 real reason.=C2=A0 Perhaps you<br>
&gt;&gt; &gt;&gt; explained all that elsewhere already, but I missed it.<br=
>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt; The end goal is to split some projects, such as qemu-ga, to s=
tandalone<br>
&gt;&gt; &gt; meson projects/subprojects. We will be able to build them ind=
ependently<br>
&gt;&gt; &gt; from the rest of QEMU, and later on perhaps handle them outsi=
de of QEMU<br>
&gt;&gt; &gt; main repository. To achieve this, I first introduce a qemu-co=
mmon<br>
&gt;&gt; &gt; subproject, where qapi and common units are provided. You can=
 check<br>
&gt;&gt; &gt; <a href=3D"https://gitlab.com/marcandre.lureau/qemu/-/commits=
/qga" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/marcandre.lur=
eau/qemu/-/commits/qga</a> for a sneak peek at<br>
&gt;&gt; &gt; current end result.<br>
&gt;&gt;<br>
&gt;&gt; I worry this move of the QAPI generator code into<br>
&gt;&gt; subjprojects/common/scripts/qapi/ will be followed by a move into =
its<br>
&gt;&gt; own subproject.<br>
&gt;&gt;<br>
&gt;<br>
&gt; Do you mean: it could be moved again to another smaller subproject? no=
t<br>
&gt; really, see below<br>
&gt;<br>
&gt;<br>
&gt;&gt; Ignorant question: could we turn the QAPI generator into a subproj=
ect in<br>
&gt;&gt; place?<br>
&gt;&gt;<br>
&gt;<br>
&gt; If it&#39;s just the generator, probably the target would then be a py=
thon<br>
&gt; project (not meson), similar to python-qemu-qmp.<br>
&gt;<br>
&gt; But I don&#39;t see much point, since it&#39;s not really a standalone=
 python<br>
&gt; module, it generates code, and that code needs most of what is in<br>
&gt; qemu-common (see<br>
&gt; <a href=3D"https://gitlab.com/marcandre.lureau/qemu/-/tree/qga/subproj=
ects/qemu-common" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/m=
arcandre.lureau/qemu/-/tree/qga/subprojects/qemu-common</a>).<br>
&gt; It&#39;s best to have it together imho. Maybe we can consider a differ=
ent<br>
&gt; naming or to be more careful not to add stuff that is not strictly nee=
ded<br>
&gt; by qapi?<br>
<br>
I had a look at subjprojects/qemu-common in your qga branch.=C2=A0 Contents=
:<br>
<br>
* Subproject machinery<br>
<br>
* Some common headers (glib-compat.h), but not others (qemu/osdep.h).=C2=A0=
 I<br>
=C2=A0 guess it&#39;s whatever subjproject code needs.<br>
<br>
=C2=A0 Is subprojects/qemu-common/include/block/nvme.h there by accident?<b=
r></blockquote><div><br></div><div>It&#39;s a header shared with qemu-ga (t=
he commit message explains)</div><div>=C2=A0 <br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
<br>
* Most of the QObject subsystem<br>
<br>
=C2=A0 qobject/block-qdict.c is left behind.<br></blockquote><div><br></div=
><div>It&#39;s qemu block specific. Not needed to move at this point, it dr=
ags other stuff iirc.</div><div><br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
<br>
* Most of the QAPI subsystem<br>
<br>
=C2=A0 Some visitors left behind: opts, forward, string input / output.=C2=
=A0 Hmm,<br>
=C2=A0 only the .c, the .h are in the subjproject.=C2=A0 Accident?<br></blo=
ckquote><div><br></div><div>If they are not shared with qemu-ga, I didn&#39=
;t move them yet. They can stay specific to qemu or specific subprojects, o=
r we can decide to move them (if that doesn&#39;t drag too much stuff along=
).<br></div><div>=C2=A0 <br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
=C2=A0 A bit of HMP support left behind.<br></blockquote><div><br></div><di=
v>Can you be more specific?</div><div>=C2=A0<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
<br>
* Parts of util/ and include/qemu/<br>
<br>
=C2=A0 Error reporting, key-value CLI, some C utilities, but not others<br>
=C2=A0 (e.g. qemu/atomic.h, but not qemu/atomic128.h).=C2=A0 I guess it&#39=
;s again<br>
=C2=A0 whatever subjproject code needs.<br>=C2=A0 <br></blockquote><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
* Parts of the QAPI Schema subsystem<br>
<br>
Aside: MAINTAINERS mostly not updated.<br>
<br></blockquote><div><br></div><div>That needs fixing.<br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Your moves tear closely related code apart.=C2=A0 This is going to be a dra=
g<br>
for developers in general and maintainers in particular.<br>
<br>
Ergonomics suffer when related code is in multiple places.=C2=A0 Having to<=
br>
switch between directories and remember where is what will a constant<br>
low-level pain.=C2=A0 Things that used to be simple &amp; quick, like git-g=
rep<br>
qapi/*.c, become more involved.<br>
<br></blockquote><div><br></div><div>It&#39;s inevitable when a project gro=
ws. QEMU is already a very large project. Over the years, we have structure=
d the project, by moving things and splitting in subdirectories. Imho, this=
 is actually helpful in many ways, and we got used to it easily hopefully.<=
/div><div><br></div><div>Do you see fundamental reasons why qemu-ga or (qem=
u-img, qemu-nbd, storage-daemon, virtiofsd, vhost-user-*, *helper, ivshmem*=
 etc) need to be tight to qemu code, release and management process? I am n=
ot saying it&#39;s time to move them out of qemu project, but I believe it&=
#39;s helpful to have code that is structured and can be compiled indepentl=
y.</div><div><br></div><div>And by having &quot;standalone&quot; subproject=
s, we can more easily evolve in new directions, without touching the rest o=
f the projects.</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
Hurts even when merely consuming the subsystem: when I see #include<br>
&quot;qemu/foo.h&quot;, the straightforward include/qemu/foo.h may or may n=
ot do.<br>
When it doesn&#39;t, I need to know where to look instead.<br>
<br>
subprojects/qemu-common/include/ is a lot to type.=C2=A0 Sufficiently<br>
powerful editors mitigate, but not completely.<br>
<br>
When changes need to be applied to every instance of an abstraction,<br>
it&#39;s easy to miss instances &quot;elsewhere&quot;.=C2=A0 There&#39;s a =
reason the QAPI<br>
visitors are all in one place.<br></blockquote><div><br></div>I understand =
it&#39;s nice to have all the code in one place. At the same time, this goe=
s against modularity and composability..<br></div><div class=3D"gmail_quote=
">=C2=A0<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
The actual split seems somewhat arbitrary in places.=C2=A0 I suspect more<b=
r>
code will move over time.=C2=A0 Invalidating &quot;what is where&quot; know=
ledge.<br></blockquote><div><br></div><div>Are you insinuating that this is=
 obvious today? :) By having smaller standalone projects, we have better de=
fined scope, test range, reusability etc. And we avoid creating a jam of de=
pendencies, making code review &amp; change a bit easier..<br></div><div><b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I believe a serious think about other ways to accomplish your goals is<br>
called for.<br></blockquote><div><br></div><div>I don&#39;t claim to have t=
he perfect solution. It&#39;s evolution, hopefully a step in a better direc=
tion.=C2=A0</div><div><br></div><div>thanks<br></div></div><br clear=3D"all=
"><br>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lur=
eau<br></div></div>

--000000000000df4c9a05e5f45cfd--


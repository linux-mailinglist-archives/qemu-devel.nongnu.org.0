Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6BC34503D
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 20:51:02 +0100 (CET)
Received: from localhost ([::1]:45462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOQZp-000067-ES
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 15:51:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lOQXF-0007n1-HM
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 15:48:21 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:42878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lOQXD-0000Yy-3w
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 15:48:21 -0400
Received: by mail-ej1-x636.google.com with SMTP id hq27so23268360ejc.9
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 12:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SIv5Or7AsgDnog2H3SvVd9N9RdOHn7iGHNFWQXxGWns=;
 b=NHh27IT2eOF/Io1ctp9gAXq8jedHspDdSjKrJ6z1a64AM33OSylt7EbE7TsL3oUo59
 cL1QR1GRJgSYUdoeJSBh98/05r0fgDlV1avKGd2/aXHk4o9PJ/h+7BhYxxrdL5uthVP4
 J9bvMj6pjHgamvmgiD94ppi+yKYQso67JNFVOMpoXLP+VeWNIVAEQA+MRkV1fv4ep5bZ
 U8hLcdD0kF8kxhRZ6WHbSi4DOz0GKbBxX9iAsTbFKRBWmh9+BOjdnNX+WBKdiU4GRu8B
 ZH8l5ocU2eT7ItfXL+A5BhBJMqfchItKkfL5fVOahTCM5vY1wamo+BLbIxT+VpXdVXlO
 8PAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SIv5Or7AsgDnog2H3SvVd9N9RdOHn7iGHNFWQXxGWns=;
 b=DXcO8k61pon+76R4WmU2urXGuf2X601skflBmJt0SteoCSNUCxXXaH8mYuDTuGUO/e
 ewisJz+2GpSd3mdI+tftbXXymr592xa/FIIUk2odjqkyklJ+VCeyemLDoRkCqQIpavFq
 PdQQugegZffaBkeOKzPVW33uj9pnnZvvrj/H3dK+pSkXu+wwFGFGF1dTu2pJJxGpezJg
 22XrAuoF/nMv915bdQqNlcuAqVMNMCQ6wCBclB5PXOD377CFA2SHnlrmrXrSDlRfqNIP
 pmTw5c+FGm/9TwvPrEtDz4nyqgfARVI3LNHTWBpCkYVygwQwgTJfqS3+EGDkyJr0KiOZ
 1XOw==
X-Gm-Message-State: AOAM530jdMjcfTIGlJUtcMdlPI/+jXceGldxlIHJ2irVzQSJKf8iM+Y1
 eRkp9AZ9eKSc/PQoBQ6BGEfrLwC2aessarC8xfY=
X-Google-Smtp-Source: ABdhPJyBxi8R5tgS8wd4BQuGB/JTx6maR4FlSneQz29yl3LhIdbWkGgk4cFlt3LW1cVT3LL5jn9BKCcWCOUcGzt7ZD8=
X-Received: by 2002:a17:906:3643:: with SMTP id
 r3mr1317860ejb.527.1616442497423; 
 Mon, 22 Mar 2021 12:48:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210322155040.4009256-1-marcandre.lureau@redhat.com>
 <CAFEAcA95saRMvwkst1tr5wpihtKOK3GX-KSgUNe+J2T8aAcbSw@mail.gmail.com>
 <2671f94e-b0a2-61e7-d4e9-f5163df3e442@redhat.com>
In-Reply-To: <2671f94e-b0a2-61e7-d4e9-f5163df3e442@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 22 Mar 2021 23:48:05 +0400
Message-ID: <CAJ+F1CJTbnZNEmVa1j1xggJbSZs191Lkuu7je8r5W3Zx62dFyA@mail.gmail.com>
Subject: Re: [PATCH] docs: simplify each section title
To: John Snow <jsnow@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000dbdc1e05be255888"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x636.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000dbdc1e05be255888
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Mar 22, 2021 at 10:23 PM John Snow <jsnow@redhat.com> wrote:

> On 3/22/21 12:36 PM, Peter Maydell wrote:
> > On Mon, 22 Mar 2021 at 16:03, <marcandre.lureau@redhat.com> wrote:
> >>
> >> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >>
> >> Now that we merged into one doc, it makes the nav looks nicer.
> >>
> >> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >> ---
> >>   docs/devel/index.rst   | 4 ++--
> >>   docs/interop/index.rst | 4 ++--
> >>   docs/specs/index.rst   | 4 ++--
> >>   docs/system/index.rst  | 4 ++--
> >>   docs/tools/index.rst   | 4 ++--
> >>   docs/user/index.rst    | 4 ++--
> >>   6 files changed, 12 insertions(+), 12 deletions(-)
> >>
> >> diff --git a/docs/devel/index.rst b/docs/devel/index.rst
> >> index 7c424ea6d7..09d21d3514 100644
> >> --- a/docs/devel/index.rst
> >> +++ b/docs/devel/index.rst
> >> @@ -1,8 +1,8 @@
> >>   .. This is the top level page for the 'devel' manual.
> >>
> >>
> >> -QEMU Developer's Guide
> >> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +Developers
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > I think this should be "Developer's Guide" or "Developer Information"
> > or something. Just "Developers" doesn't really read right to me:
> > it is not "documentation of developers" in the way that the "Tools"
> > section is "documentation of tools", etc.
> >
> > thanks
> > -- PMM
> >
>
> Changing it to a verb - "Development" - might fit the intent, by analogy
> with "System Emulation Management and Interoperability", "System
> Emulation", and "User Mode Emulation".
>
> Keeping it as a noun with "Developer Information" or "Information for
> Developers" also reads fine to me.
>
>
It's a collection of developer's documents regrouped in a section. Maybe we
should consider a title like "Internals" instead? Tbh, I think "Developers"
was about right too.. "Guide" does not uphold its promise.

Ok, last call for "Developer Information" ?

--=20
Marc-Andr=C3=A9 Lureau

--000000000000dbdc1e05be255888
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 22, 2021 at 10:23 PM Jo=
hn Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"_blank">jsnow@red=
hat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On 3/22/21 12:36 PM, Peter Maydell wrote:<br>
&gt; On Mon, 22 Mar 2021 at 16:03, &lt;<a href=3D"mailto:marcandre.lureau@r=
edhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Now that we merged into one doc, it makes the nav looks nicer.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcan=
dre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt=
;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0docs/devel/index.rst=C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;=C2=A0 =C2=A0docs/interop/index.rst | 4 ++--<br>
&gt;&gt;=C2=A0 =C2=A0docs/specs/index.rst=C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;=C2=A0 =C2=A0docs/system/index.rst=C2=A0 | 4 ++--<br>
&gt;&gt;=C2=A0 =C2=A0docs/tools/index.rst=C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;=C2=A0 =C2=A0docs/user/index.rst=C2=A0 =C2=A0 | 4 ++--<br>
&gt;&gt;=C2=A0 =C2=A06 files changed, 12 insertions(+), 12 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/docs/devel/index.rst b/docs/devel/index.rst<br>
&gt;&gt; index 7c424ea6d7..09d21d3514 100644<br>
&gt;&gt; --- a/docs/devel/index.rst<br>
&gt;&gt; +++ b/docs/devel/index.rst<br>
&gt;&gt; @@ -1,8 +1,8 @@<br>
&gt;&gt;=C2=A0 =C2=A0.. This is the top level page for the &#39;devel&#39; =
manual.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -QEMU Developer&#39;s Guide<br>
&gt;&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<br>
&gt;&gt; +Developers<br>
&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; <br>
&gt; I think this should be &quot;Developer&#39;s Guide&quot; or &quot;Deve=
loper Information&quot;<br>
&gt; or something. Just &quot;Developers&quot; doesn&#39;t really read righ=
t to me:<br>
&gt; it is not &quot;documentation of developers&quot; in the way that the =
&quot;Tools&quot;<br>
&gt; section is &quot;documentation of tools&quot;, etc.<br>
&gt; <br>
&gt; thanks<br>
&gt; -- PMM<br>
&gt; <br>
<br>
Changing it to a verb - &quot;Development&quot; - might fit the intent, by =
analogy <br>
with &quot;System Emulation Management and Interoperability&quot;, &quot;Sy=
stem <br>
Emulation&quot;, and &quot;User Mode Emulation&quot;.<br>
<br>
Keeping it as a noun with &quot;Developer Information&quot; or &quot;Inform=
ation for <br>
Developers&quot; also reads fine to me.<br clear=3D"all"><br></blockquote><=
div><br></div><div>It&#39;s a collection of developer&#39;s documents regro=
uped in a section. Maybe we should consider a title like &quot;Internals&qu=
ot; instead? Tbh, I think &quot;Developers&quot; was about right too.. &quo=
t;Guide&quot; does not uphold its promise.</div><div><br></div><div>Ok, las=
t call for &quot;Developer Information&quot; ?<br></div></div><br>-- <br><d=
iv dir=3D"ltr">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000dbdc1e05be255888--


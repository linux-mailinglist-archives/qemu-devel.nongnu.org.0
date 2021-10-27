Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D37443CE42
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 18:07:38 +0200 (CEST)
Received: from localhost ([::1]:47832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mflSj-0003x1-BA
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 12:07:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mfkwy-0007PL-LK
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:34:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mfkww-00079m-43
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:34:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635348885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Oj8W84b2WRfivyP+KAXpOMRHvOc5m3dX3LFly7jyV+Y=;
 b=Pk1UuZrlbBNCbPgdHF7Y/dX7qxlSzav/cS8sBen4rN+s/igqEAkO5NbBSIEmOjUKvZgHSW
 5l6g47eVJFAqptMfE6xMhDn5/OE2PvPxiRHZJRPcfouXpNlDOR0EFlp866c6l3JB+5MVDK
 rnBPOBxmy85W0QRCK4CUgxuQYHFEQOY=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-rcuFy86LNnmrM1j5gP7yKA-1; Wed, 27 Oct 2021 11:34:41 -0400
X-MC-Unique: rcuFy86LNnmrM1j5gP7yKA-1
Received: by mail-ua1-f70.google.com with SMTP id
 m2-20020a9f3fc2000000b002cb74488fdaso1685495uaj.18
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 08:34:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Oj8W84b2WRfivyP+KAXpOMRHvOc5m3dX3LFly7jyV+Y=;
 b=StK9Tsd+EtDCCiUYdrhhzcXl+5KIarKK5HFYbAbYi4Ybl4xfiL+lmGGojpWsBwAvbo
 62/RAlnNCw/Jk/hYk2IG6kjMvotPH0Z9+Mf1mvqMN/Mv5yJ4q+RBR7sM8SnyXpZCNwUA
 3zpB/yoS3qLLAgp+DJAz4rVebjp4N5sHZ6K07jmnPnjLgb19DNEase8m7mdNa+d0uD0x
 /dnGaH3UkoYK9scMVTjImfc8IBHH2d+f9xKWUic7yyLaGe30mzvPH0ZWB6PpGdaqps2o
 AmfMhXTq+1VauaIxm/EC68MpQggI64L2XMk74HUcsFTgJ+GrsjkkIkzVJiFcB10w/jP8
 2ANg==
X-Gm-Message-State: AOAM531V3MeEYsR0a/+wClraX4SksOCG7JnuaDFxvGSTQ41HGc6+ZbyC
 RMmASYRQGMBv6Q1dej6gEcAVj+mvTtC2NcgyyFzD5QLpDiBctd9rIGIyEivrqIV8DYuflGfEaB6
 jocul9G6mC033vcpI07+6ZEEtPOLvFQU=
X-Received: by 2002:a05:6102:390b:: with SMTP id
 e11mr15179444vsu.27.1635348881286; 
 Wed, 27 Oct 2021 08:34:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsZQx4mtK6BhGaAsEQr7Bm/xhB9yUApAasWWMNMgk7X2joZOhExjaG8q05NsC6+vMt1YKWYGjvEJgYUUkWuaA=
X-Received: by 2002:a05:6102:390b:: with SMTP id
 e11mr15179409vsu.27.1635348881070; 
 Wed, 27 Oct 2021 08:34:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210917161320.201086-1-kwolf@redhat.com>
 <CAFn=p-ahKc+EjkUAPnSODQNY808z-qyc-DQUsseAobmB8A8NwA@mail.gmail.com>
 <YXkqf37UWHnmUNUa@redhat.com>
In-Reply-To: <YXkqf37UWHnmUNUa@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 27 Oct 2021 11:34:30 -0400
Message-ID: <CAFn=p-ZTGcN9fw2uXr88wpfh17cDtEK642rg-i4ZKD8JGbOSTQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] qapi: Add support for aliases
To: Kevin Wolf <kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000002413ef05cf57558e"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002413ef05cf57558e
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 27, 2021 at 6:31 AM Kevin Wolf <kwolf@redhat.com> wrote:

> Am 26.10.2021 um 23:23 hat John Snow geschrieben:
> > On Fri, Sep 17, 2021 at 12:13 PM Kevin Wolf <kwolf@redhat.com> wrote:
> >
> > > This series introduces alias definitions for QAPI object types (structs
> > > and unions).
> > >
> > > This allows using the same QAPI type and visitor even when the syntax
> > > has some variations between different external interfaces such as QMP
> > > and the command line.
> > >
> > >
> > I'm absurdly late to the party here, and I'm afraid my involvement may
> only
> > stall your progress even further, but ...
>
> I'm not sure if it's worth investing much of your time in this. After a
>

ACK, understood. Still, I had this on my review pile for a while and I want
to know what problem we're trying to solve, and why Markus wasn't
enthralled by it.


> year of discussing implementation details, Markus decided that he
> doesn't like the whole approach, so the series is probably dead in this
> shape. Maybe parts of it (possibly even large parts) can be saved and
> used in a modified approach, depending on how radically different the
> new approach is.
>
> Markus promised that he'll think of alternative approaches to solve the
> problem. I'm waiting for that before I waste more time implementing
> something else that is also dead from the start.
>
> > can you fill me in on the slightly-less-higher-level details here?
> >
> > I'm curious as to the nature of "has some variations" and how the aliases
> > help alleviate them. Do you accomplish that compatibility by using
> > different names for different fields of the struct?
>
> > so e.g. x.foo can be used as an alias for x.bar, but both map ultimately
> > onto 'x.foo'? Or does this series provide for some more fundamental
> > mechanical changes to map one type onto another?
>
> I would recommend reading the changes to docs/devel/qapi-code-gen.rst in
> patch 7, which explain the implemented mechanism.
>
> For -chardev, most of "some varations" are different names for the same
> member of a struct, or nesting in QMP that you don't want to have on the
> command line. I went through all cases in one of the last messages in
> the v3 thread, but I think these are the two important categories of
> cases.
>
> The C types stay the same as they have always been, aliases just provide
> an alternative way to specify the same thing in the input.
>
>
Thanks very much for the pointers!


> > > It also provides a new tool for evolving the schema while maintaining
> > > backwards compatibility (possibly during a deprecation period).
> > >
> > > The first user is intended to be a QAPIfied -chardev command line
> > > option, for which I'll send a separate series. A git tag is available
> > > that contains both this series and the chardev changes that make use of
> > > it:
> > >
> > >     https://repo.or.cz/qemu/kevin.git qapi-alias-chardev-v4
>
> You may also want to have a look at this, and specifically
> qapi/char.json, to see how I used aliases in practice.
>
> Kevin
>
>

--0000000000002413ef05cf57558e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 27, 2021 at 6:31 AM Kevin Wol=
f &lt;<a href=3D"mailto:kwolf@redhat.com">kwolf@redhat.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Am 26.10.2021 um =
23:23 hat John Snow geschrieben:<br>
&gt; On Fri, Sep 17, 2021 at 12:13 PM Kevin Wolf &lt;<a href=3D"mailto:kwol=
f@redhat.com" target=3D"_blank">kwolf@redhat.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; This series introduces alias definitions for QAPI object types (s=
tructs<br>
&gt; &gt; and unions).<br>
&gt; &gt;<br>
&gt; &gt; This allows using the same QAPI type and visitor even when the sy=
ntax<br>
&gt; &gt; has some variations between different external interfaces such as=
 QMP<br>
&gt; &gt; and the command line.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; I&#39;m absurdly late to the party here, and I&#39;m afraid my involve=
ment may only<br>
&gt; stall your progress even further, but ...<br>
<br>
I&#39;m not sure if it&#39;s worth investing much of your time in this. Aft=
er a<br></blockquote><div><br></div><div>ACK, understood. Still, I had this=
 on my review pile for a while and I want to know what problem we&#39;re tr=
ying to solve, and why Markus wasn&#39;t enthralled by it.<br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
year of discussing implementation details, Markus decided that he<br>
doesn&#39;t like the whole approach, so the series is probably dead in this=
<br>
shape. Maybe parts of it (possibly even large parts) can be saved and<br>
used in a modified approach, depending on how radically different the<br>
new approach is.<br>
<br>
Markus promised that he&#39;ll think of alternative approaches to solve the=
<br>
problem. I&#39;m waiting for that before I waste more time implementing<br>
something else that is also dead from the start.<br>
<br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; can you fill me in on the slightly-less-higher-level details here?<br>
&gt; <br>
&gt; I&#39;m curious as to the nature of &quot;has some variations&quot; an=
d how the aliases<br>
&gt; help alleviate them. Do you accomplish that compatibility by using<br>
&gt; different names for different fields of the struct?<br>
<br>
&gt; so e.g. x.foo can be used as an alias for x.bar, but both map ultimate=
ly<br>
&gt; onto &#39;x.foo&#39;? Or does this series provide for some more fundam=
ental<br>
&gt; mechanical changes to map one type onto another?<br>
<br>
I would recommend reading the changes to docs/devel/qapi-code-gen.rst in<br=
>
patch 7, which explain the implemented mechanism.<br>
<br>
For -chardev, most of &quot;some varations&quot; are different names for th=
e same<br>
member of a struct, or nesting in QMP that you don&#39;t want to have on th=
e<br>
command line. I went through all cases in one of the last messages in<br>
the v3 thread, but I think these are the two important categories of<br>
cases.<br>
<br>
The C types stay the same as they have always been, aliases just provide<br=
>
an alternative way to specify the same thing in the input.<br>
<br></blockquote><div><br></div><div>Thanks very much for the pointers!<br>=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; &gt; It also provides a new tool for evolving the schema while maintai=
ning<br>
&gt; &gt; backwards compatibility (possibly during a deprecation period).<b=
r>
&gt; &gt;<br>
&gt; &gt; The first user is intended to be a QAPIfied -chardev command line=
<br>
&gt; &gt; option, for which I&#39;ll send a separate series. A git tag is a=
vailable<br>
&gt; &gt; that contains both this series and the chardev changes that make =
use of<br>
&gt; &gt; it:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://repo.or.cz/qemu/kevin.git" =
rel=3D"noreferrer" target=3D"_blank">https://repo.or.cz/qemu/kevin.git</a> =
qapi-alias-chardev-v4<br>
<br>
You may also want to have a look at this, and specifically<br>
qapi/char.json, to see how I used aliases in practice.<br>
<br>
Kevin<br>
<br>
</blockquote></div></div>

--0000000000002413ef05cf57558e--



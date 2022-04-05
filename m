Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A576A4F3C54
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 17:30:52 +0200 (CEST)
Received: from localhost ([::1]:40140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbl8t-0006wd-1g
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 11:30:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nbl72-0006Ae-Sa
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 11:28:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nbl6y-00033d-QE
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 11:28:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649172531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DygfpW2EKR+XgoToVtWYXhElgiMi4e+QVVMpbE8Bh0I=;
 b=bh1W5BM5hIo+nbKenKpY07ZzHalWM1JP+4lUcZvpiKIfldgvlSsFFL96TY83RX7t5HL4aO
 7k7rib6JsYzEsjF7/d3b8aBS6CrLfh7ObaTQP6GAGha/Jr10ZMD2R3NrUYhLp1LASd+7Gh
 RXvaEYY2vzIa48bHk7sgdpHeCq+L09g=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-jiCeZSCuM6ePdyrrKr0XNA-1; Tue, 05 Apr 2022 11:28:50 -0400
X-MC-Unique: jiCeZSCuM6ePdyrrKr0XNA-1
Received: by mail-ua1-f70.google.com with SMTP id
 k19-20020ab07553000000b0035cd39f4b56so2343002uaq.7
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 08:28:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DygfpW2EKR+XgoToVtWYXhElgiMi4e+QVVMpbE8Bh0I=;
 b=61P5L0kK3R51q+O0iLzZ9DRc4YKFVrA6HHjLunf4zWqgeskI//F78XG6tQguMkPwfL
 gBOmt97jg6EfHCHF0j9GWTj9ny3PS4zehy9bb/Ths6vwzPMC/aoIekmTqsT/XDvkOuGp
 w2GAktKXcQ7Np7iTHeb68Rvn/Hwkm4cwLbTQNCqyj2Zy2q8RTQ2lZjiNOFzxvYjzvD78
 4mLEf+lig15TB2fZQQGpGP+ugdIJVnV+WzhRiErKr+8AEy0DTCTZFjM4WHxWJGkosPjj
 Zmq33VGaC2dfx8KvVTx6BoCzFJPT8ay6SSiC7HqiDAMJXHX6CdBX6vfnku+6y+xBPsJm
 yhVA==
X-Gm-Message-State: AOAM533bEeFF/N1I2080PS2HGy2T/EeiDyc5PDbJRS1U59qhleXwjcoz
 a/H7Zax2pdsE+VjLJg3QPFEhn8IuzBRzM3WkABVRJRWMTO6yNjUAw/tgwdvThsfAegbMochUAA2
 D4pvPhW196N3PiXht8jydaFQffMOQDl4=
X-Received: by 2002:a67:4c3:0:b0:324:ddd7:70d3 with SMTP id
 186-20020a6704c3000000b00324ddd770d3mr1332189vse.61.1649172529756; 
 Tue, 05 Apr 2022 08:28:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGnBf+epXWok8GMbaEMjViTbK6+6AVgSwJ5mJOw653xM/yGfn3IZ36pwLK7Rlhs3BkcXZNoarug+Y4xFXjHVU=
X-Received: by 2002:a67:4c3:0:b0:324:ddd7:70d3 with SMTP id
 186-20020a6704c3000000b00324ddd770d3mr1332180vse.61.1649172529571; Tue, 05
 Apr 2022 08:28:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220330182424.3438872-1-jsnow@redhat.com>
 <20220330182424.3438872-3-jsnow@redhat.com>
 <YkcwzP2lu8B8dYNu@paraplu>
 <CAFn=p-ZZxDNhvYuOqO4XZ1H72ED4R3te2fikoV+mF6UZ7+pqRA@mail.gmail.com>
 <CAFn=p-ZQvyyStRPo_6mgTKm7X1w9fu0KqfhmUHK7cYTCC_mmyw@mail.gmail.com>
 <YkwC8Hg6bs+PVpQk@paraplu>
In-Reply-To: <YkwC8Hg6bs+PVpQk@paraplu>
From: John Snow <jsnow@redhat.com>
Date: Tue, 5 Apr 2022 11:28:39 -0400
Message-ID: <CAFn=p-b6MNiKWc7cnH82djEvXMOQ7uchNuqNNj6b3jCdM02-pg@mail.gmail.com>
Subject: Re: [qemu.qmp PATCH 02/13] fork qemu.qmp from qemu.git
To: Kashyap Chamarthy <kchamart@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000cc7b7405dbe9e658"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000cc7b7405dbe9e658
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 5, 2022, 4:51 AM Kashyap Chamarthy <kchamart@redhat.com> wrote:

> On Mon, Apr 04, 2022 at 02:56:10PM -0400, John Snow wrote:
> > On Mon, Apr 4, 2022 at 2:54 PM John Snow <jsnow@redhat.com> wrote:
>
> [...]
>
> > > > >  .gitignore |  2 +-
> > > > >  Makefile   | 16 ++++++++--------
> > > > >  setup.cfg  | 24 +-----------------------
> > > > >  setup.py   |  2 +-
> > > > >  4 files changed, 11 insertions(+), 33 deletions(-)
> > > >
> > > > The changes here look fine to me (and thanks for making it a "micro
> > > > change").  I'll let sharper eyes than mine to give a closer look at
> the
> > > > `git filter-repo` surgery.  Although, that looks fine to me too.
> > > >
> > > > [...]
> > > >
> > > > >  .PHONY: distclean
> > > > >  distclean: clean
> > > > > -     rm -rf qemu.egg-info/ .venv/ .tox/ $(QEMU_VENV_DIR) dist/
> > > > > +     rm -rf qemu.qmp.egg-info/ .venv/ .tox/ $(QEMU_VENV_DIR) dis=
t/
> > > > >       rm -f .coverage .coverage.*
> > > > >       rm -rf htmlcov/
> > > > > diff --git a/setup.cfg b/setup.cfg
> > > > > index e877ea5..4ffab73 100644
> > > > > --- a/setup.cfg
> > > > > +++ b/setup.cfg
> > > > > @@ -1,5 +1,5 @@
> > > > >  [metadata]
> > > > > -name =3D qemu
> > > > > +name =3D qemu.qmp
> > > > >  version =3D file:VERSION
> > > > >  maintainer =3D QEMU Developer Team
> > > >
> > > > In the spirit of patch 04 ("update maintainer metadata"), do you al=
so
> > > > want to update here too? s/QEMU Developer Team/QEMU Project?
> > > >
> > >
> > > Good spot.
> >
> > ...Or, uh. That's exactly what I update in patch 04. Are you asking me
> > to fold in that change earlier? I'm confused now.
>
> Oops, perils of reviewing late in the day.  I missed to notice it's the
> same file.  You're right; please ignore my remark.  Sorry for the noise.
>

I made the same mistake upon reading the feedback, so we're both guilty =F0=
=9F=98=85

Thanks Kashyap, I appreciate the review.

There's three more series here to apply to the new forked package (not yet
re-sent to the ML):

(2) Adding GitLab CI configuration. Not relevant for you, probably.

(3) Adding Sphinx documentation. This builds jsnow.gitlab.io/qemu.qmp/ -
I'd be appreciative of your feedback on this. I'm interested both in
proofreading and in design feedback here. All comments welcome.

[Though more rigorous changes to the design might be a "later" thing, but
the feedback is welcomed all the same.]

(4) Adding automatic package builds and git-based versioning to GitLab.
Maybe also not too relevant for you. =F0=9F=99=82


>
>
> --
> /kashyap
>

Thanks for your time!

--000000000000cc7b7405dbe9e658
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Apr 5, 2022, 4:51 AM Kashyap Chamarthy &lt;<a =
href=3D"mailto:kchamart@redhat.com">kchamart@redhat.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">On Mon, Apr 04, 2022 at 02:56:10PM -040=
0, John Snow wrote:<br>
&gt; On Mon, Apr 4, 2022 at 2:54 PM John Snow &lt;<a href=3D"mailto:jsnow@r=
edhat.com" target=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt; wr=
ote:<br>
<br>
[...]<br>
<br>
&gt; &gt; &gt; &gt;=C2=A0 .gitignore |=C2=A0 2 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 Makefile=C2=A0 =C2=A0| 16 ++++++++--------<br>
&gt; &gt; &gt; &gt;=C2=A0 setup.cfg=C2=A0 | 24 +-----------------------<br>
&gt; &gt; &gt; &gt;=C2=A0 setup.py=C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 4 files changed, 11 insertions(+), 33 deletions(-=
)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The changes here look fine to me (and thanks for making it a=
 &quot;micro<br>
&gt; &gt; &gt; change&quot;).=C2=A0 I&#39;ll let sharper eyes than mine to =
give a closer look at the<br>
&gt; &gt; &gt; `git filter-repo` surgery.=C2=A0 Although, that looks fine t=
o me too.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; [...]<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 .PHONY: distclean<br>
&gt; &gt; &gt; &gt;=C2=A0 distclean: clean<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0rm -rf qemu.egg-info/ .venv/ .tox/=
 $(QEMU_VENV_DIR) dist/<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0rm -rf qemu.qmp.egg-info/ .venv/ .=
tox/ $(QEMU_VENV_DIR) dist/<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f .coverage .coverage.*<b=
r>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf htmlcov/<br>
&gt; &gt; &gt; &gt; diff --git a/setup.cfg b/setup.cfg<br>
&gt; &gt; &gt; &gt; index e877ea5..4ffab73 100644<br>
&gt; &gt; &gt; &gt; --- a/setup.cfg<br>
&gt; &gt; &gt; &gt; +++ b/setup.cfg<br>
&gt; &gt; &gt; &gt; @@ -1,5 +1,5 @@<br>
&gt; &gt; &gt; &gt;=C2=A0 [metadata]<br>
&gt; &gt; &gt; &gt; -name =3D qemu<br>
&gt; &gt; &gt; &gt; +name =3D qemu.qmp<br>
&gt; &gt; &gt; &gt;=C2=A0 version =3D file:VERSION<br>
&gt; &gt; &gt; &gt;=C2=A0 maintainer =3D QEMU Developer Team<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; In the spirit of patch 04 (&quot;update maintainer metadata&=
quot;), do you also<br>
&gt; &gt; &gt; want to update here too? s/QEMU Developer Team/QEMU Project?=
<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Good spot.<br>
&gt; <br>
&gt; ...Or, uh. That&#39;s exactly what I update in patch 04. Are you askin=
g me<br>
&gt; to fold in that change earlier? I&#39;m confused now.<br>
<br>
Oops, perils of reviewing late in the day.=C2=A0 I missed to notice it&#39;=
s the<br>
same file.=C2=A0 You&#39;re right; please ignore my remark.=C2=A0 Sorry for=
 the noise.<br></blockquote></div></div><div dir=3D"auto"><br></div><div di=
r=3D"auto">I made the same mistake upon reading the feedback, so we&#39;re =
both guilty =F0=9F=98=85</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Thanks Kashyap, I appreciate the review.</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">There&#39;s three more series here to apply to the new fo=
rked package (not yet re-sent to the ML):</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">(2) Adding GitLab CI configuration. Not relevant for you,=
 probably.</div><div dir=3D"auto"><br></div><div dir=3D"auto">(3) Adding Sp=
hinx documentation. This builds <a href=3D"http://jsnow.gitlab.io/qemu.qmp/=
">jsnow.gitlab.io/qemu.qmp/</a> - I&#39;d be appreciative of your feedback =
on this. I&#39;m interested both in proofreading and in design feedback her=
e. All comments welcome.</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>[Though more rigorous changes to the design might be a &quot;later&quot; t=
hing, but the feedback is welcomed all the same.]</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">(4) Adding automatic package builds and git-based=
 versioning to GitLab. Maybe also not too relevant for you. =F0=9F=99=82</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">
<br><br>
<br>
-- <br>
/kashyap<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Thanks for your time!</div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"></block=
quote></div></div></div>

--000000000000cc7b7405dbe9e658--



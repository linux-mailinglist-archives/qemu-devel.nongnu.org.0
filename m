Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 700CA398BE8
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 16:09:42 +0200 (CEST)
Received: from localhost ([::1]:44624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loRYz-0000Cj-2j
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 10:09:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1loRXx-0007xT-Cm
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 10:08:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1loRXr-0004eS-CN
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 10:08:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622642910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VjTk9WoGdf9CLTc6t0vj+bLDJGSeeGFLkSneW9fCce4=;
 b=GlBs3oy0TyxHV8nQ9Jfz7Zfx17OnZ63WOzOl1DheJ3y1DWcVymz3mtf+Sr9X6qWBt+Dre7
 HfLwYclRyIGimgygvUXeaKmY/VUaQ4JIGNc3zwYR1spKlQNT0IM6oP6oP5bBTvahwHxxMp
 K4sNg7SQ8xQWt/SvwEDNgD4IPboTC1U=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-rCq-avn-Ora0fi7Zwn8YEw-1; Wed, 02 Jun 2021 10:08:24 -0400
X-MC-Unique: rCq-avn-Ora0fi7Zwn8YEw-1
Received: by mail-ed1-f71.google.com with SMTP id
 x8-20020aa7d3880000b029038fe468f5f4so1474256edq.10
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 07:08:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VjTk9WoGdf9CLTc6t0vj+bLDJGSeeGFLkSneW9fCce4=;
 b=nqHZYW0LxpwS7g3xH4HT5SCE3yow/D63naseJnhzudtR+oivEZxdyRf6B32pDmKAN4
 i79k5U8yJYjeHQrMgkBXH1Ye3KigWZDK5tiwrwsXptk9z1deGJ35qOFJu10XVIf6uJo2
 BK6PEcK62V6/6/dlAMzKVK0jSt5A1ZOCjccke3Qdk2h0xQT/jsrFM9eAXFVWFUHbP2Lf
 lWGpdY6ezf2AAVGE7OREZyBKvwcx5RypsKOi83SEqtCZFvNNixlnQaNtw6vrjB7s2CzA
 5qmvvSpfvJvXcJHfHxFEMVa3hEKjmlItFMJKHyldtKQrWq9ds5oBuRwsT7ljTSSU54Hx
 m9Rg==
X-Gm-Message-State: AOAM533A0z5xyMgIWNBqr4q/uSDMnzpH3jC2a+xhLoJVEa58ZDhnSbGj
 NNd51tMl6I7I0RwnypCGzQ8YUHiz3EAd1S6gjOQNIw1IB5ALflUNbQ/+fHItPQz6viMuG3604bW
 U2kBkf84btkG2s+AUEJ1SSqSXc+H8az8=
X-Received: by 2002:a17:907:4cd:: with SMTP id
 vz13mr21092128ejb.109.1622642903481; 
 Wed, 02 Jun 2021 07:08:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXMjfMarYH6XCZS7sUy54juBiFOj7SMieCFHJcn2ofy02iUbvtqpREBUJ6hO0vjygo+PxBm8tftyHSN1mRvf4=
X-Received: by 2002:a17:907:4cd:: with SMTP id
 vz13mr21092092ejb.109.1622642903166; 
 Wed, 02 Jun 2021 07:08:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210526205601.263444-1-willianr@redhat.com>
 <20210526205601.263444-2-willianr@redhat.com>
 <20210526234123.GA1727861@amachine.somewhere>
 <CAKJDGDbfD8dvDSRJHOs1H9gUnEeijAzWagbTMJzJcHj27ep_wQ@mail.gmail.com>
In-Reply-To: <CAKJDGDbfD8dvDSRJHOs1H9gUnEeijAzWagbTMJzJcHj27ep_wQ@mail.gmail.com>
From: Cleber Rosa Junior <crosa@redhat.com>
Date: Wed, 2 Jun 2021 10:08:12 -0400
Message-ID: <CA+bd_6KVZ+66sPWhiOvG6C+emgGUx25y5FJ8gO8o4X=h=jd6Bg@mail.gmail.com>
Subject: Re: [PATCH 1/1] tests/acceptance: change armbian archive to a faster
 host
To: Willian Rampazzo <wrampazz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000d7471305c3c8fd25"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d7471305c3c8fd25
Content-Type: text/plain; charset="UTF-8"

On Thu, May 27, 2021 at 9:45 AM Willian Rampazzo <wrampazz@redhat.com>
wrote:

> On Wed, May 26, 2021 at 8:41 PM Cleber Rosa <crosa@redhat.com> wrote:
> >
> > On Wed, May 26, 2021 at 05:56:01PM -0300, Willian Rampazzo wrote:
> > > The current host for the image
> > > Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz
> > > (archive.armbian.com) is extremely slow in the last couple of weeks,
> > > making the job running the test
> > >
> tests/system/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_bionic_20_08
> > > for the first time when the image is not yet on GitLab cache, time out
> > > while the image is being downloaded.
> > >
> > > This changes the host to one faster, so new users with an empty cache
> > > are not impacted.
> > >
> > > Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> > > ---
> > >  tests/acceptance/boot_linux_console.py | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/tests/acceptance/boot_linux_console.py
> b/tests/acceptance/boot_linux_console.py
> > > index 276a53f146..51c23b822c 100644
> > > --- a/tests/acceptance/boot_linux_console.py
> > > +++ b/tests/acceptance/boot_linux_console.py
> > > @@ -804,7 +804,8 @@ def test_arm_orangepi_bionic_20_08(self):
> > >          # to 1036 MiB, but the underlying filesystem is 1552 MiB...
> > >          # As we expand it to 2 GiB we are safe.
> > >
> > > -        image_url = ('https://archive.armbian.com/orangepipc/archive/
> '
> > > +        image_url = ('https://armbian.systemonachip.net/'
> > > +                     'archive/orangepipc/archive/'
> >
> > Hi Willian,
> >
> > I was pretty annoyed by my pipeline failures, that I came up with:
> >
> >
> https://gitlab.com/cleber.gnu/qemu/-/commit/917b3e376e682e9c35c6f7f597ffca110c719e13
> >
> > To prove that it was a GitLab <-> archive.arbian.com issue.
>
> When I tried both links, the slow link, and this new link, on my
> machine, I could see the slow link is also slow locally. Not as slow
> as on GitLab, but 10 times slower than this new link. I was thinking
> about open an issue on GitLab. In the worst case, they will say it is
> not their fault, but a problem on the other end.
>
> > But I wonder:
> >
> >  1. how susceptible to the same situation is this other mirror?
>
> Unfortunately, having tests depending on external artifacts will bring
> this kind of situation. Unless GitLab is doing traffic shaping, we
> will never know how susceptible an external server is to any kind of
> instability.
>
> >  2. how trustworthy is this mirror, say, stability wise? Maybe
> >     people in the armbian community would have some info?
>
> This new link is the same link that
> https://www.armbian.com/orange-pi-pc/ "Archived versions" is pointing,
> so I consider it an official mirror from Armbian. That's why I have
> not thought much about changing it.
>
> Now, stability wise, we never know :) I don't think we have this
> answer for any of the links related to external artifacts QEMU
> acceptance tests use.
>
> >
> > Depending on the feedback we get about, this can be a very valid
> > hotfix/workaround indeed.  But the core issues we need to look into
> > are:
> >
> >  a. applying a timeout when fetching assets.  If the asset fails to be
> >     fetched within the timeout, the test simply gets canceled.
>
> But this is failing during the download before the test starts, or in
> the pre-phase. The test suite was not created and Avocado don't have a
> mapping asset <=> test yet.
>
>
Right. But my point is that if it times out, then this "best effort"
attempt would fail (but not abort the job).  Then, during the test itself,
considering `cancel_on_missing=True`, the test would also cancel when it
fails to access the asset.

A canceled test is what we want here, and not a stuck job.  That's why I
still think the timeout may be a solution.

Thanks,
- Cleber.

--000000000000d7471305c3c8fd25
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 27, 2021 at 9:45 AM Willi=
an Rampazzo &lt;<a href=3D"mailto:wrampazz@redhat.com">wrampazz@redhat.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">O=
n Wed, May 26, 2021 at 8:41 PM Cleber Rosa &lt;<a href=3D"mailto:crosa@redh=
at.com" target=3D"_blank">crosa@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Wed, May 26, 2021 at 05:56:01PM -0300, Willian Rampazzo wrote:<br>
&gt; &gt; The current host for the image<br>
&gt; &gt; Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz<br>
&gt; &gt; (<a href=3D"http://archive.armbian.com" rel=3D"noreferrer" target=
=3D"_blank">archive.armbian.com</a>) is extremely slow in the last couple o=
f weeks,<br>
&gt; &gt; making the job running the test<br>
&gt; &gt; tests/system/boot_linux_console.py:BootLinuxConsole.test_arm_oran=
gepi_bionic_20_08<br>
&gt; &gt; for the first time when the image is not yet on GitLab cache, tim=
e out<br>
&gt; &gt; while the image is being downloaded.<br>
&gt; &gt;<br>
&gt; &gt; This changes the host to one faster, so new users with an empty c=
ache<br>
&gt; &gt; are not impacted.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Willian Rampazzo &lt;<a href=3D"mailto:willianr@re=
dhat.com" target=3D"_blank">willianr@redhat.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 tests/acceptance/boot_linux_console.py | 3 ++-<br>
&gt; &gt;=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/tests/acceptance/boot_linux_console.py b/tests/accep=
tance/boot_linux_console.py<br>
&gt; &gt; index 276a53f146..51c23b822c 100644<br>
&gt; &gt; --- a/tests/acceptance/boot_linux_console.py<br>
&gt; &gt; +++ b/tests/acceptance/boot_linux_console.py<br>
&gt; &gt; @@ -804,7 +804,8 @@ def test_arm_orangepi_bionic_20_08(self):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # to 1036 MiB, but the underlyi=
ng filesystem is 1552 MiB...<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # As we expand it to 2 GiB we a=
re safe.<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 image_url =3D (&#39;<a href=3D"https=
://archive.armbian.com/orangepipc/archive/" rel=3D"noreferrer" target=3D"_b=
lank">https://archive.armbian.com/orangepipc/archive/</a>&#39;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 image_url =3D (&#39;<a href=3D"https=
://armbian.systemonachip.net/" rel=3D"noreferrer" target=3D"_blank">https:/=
/armbian.systemonachip.net/</a>&#39;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&#39;archive/orangepipc/archive/&#39;<br>
&gt;<br>
&gt; Hi Willian,<br>
&gt;<br>
&gt; I was pretty annoyed by my pipeline failures, that I came up with:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 <a href=3D"https://gitlab.com/cleber.gnu/qemu/-/commit/91=
7b3e376e682e9c35c6f7f597ffca110c719e13" rel=3D"noreferrer" target=3D"_blank=
">https://gitlab.com/cleber.gnu/qemu/-/commit/917b3e376e682e9c35c6f7f597ffc=
a110c719e13</a><br>
&gt;<br>
&gt; To prove that it was a GitLab &lt;-&gt; <a href=3D"http://archive.arbi=
an.com" rel=3D"noreferrer" target=3D"_blank">archive.arbian.com</a> issue.<=
br>
<br>
When I tried both links, the slow link, and this new link, on my<br>
machine, I could see the slow link is also slow locally. Not as slow<br>
as on GitLab, but 10 times slower than this new link. I was thinking<br>
about open an issue on GitLab. In the worst case, they will say it is<br>
not their fault, but a problem on the other end.<br>
<br>
&gt; But I wonder:<br>
&gt;<br>
&gt;=C2=A0 1. how susceptible to the same situation is this other mirror?<b=
r>
<br>
Unfortunately, having tests depending on external artifacts will bring<br>
this kind of situation. Unless GitLab is doing traffic shaping, we<br>
will never know how susceptible an external server is to any kind of<br>
instability.<br>
<br>
&gt;=C2=A0 2. how trustworthy is this mirror, say, stability wise? Maybe<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0people in the armbian community would have some inf=
o?<br>
<br>
This new link is the same link that<br>
<a href=3D"https://www.armbian.com/orange-pi-pc/" rel=3D"noreferrer" target=
=3D"_blank">https://www.armbian.com/orange-pi-pc/</a> &quot;Archived versio=
ns&quot; is pointing,<br>
so I consider it an official mirror from Armbian. That&#39;s why I have<br>
not thought much about changing it.<br>
<br>
Now, stability wise, we never know :) I don&#39;t think we have this<br>
answer for any of the links related to external artifacts QEMU<br>
acceptance tests use.<br>
<br>
&gt;<br>
&gt; Depending on the feedback we get about, this can be a very valid<br>
&gt; hotfix/workaround indeed.=C2=A0 But the core issues we need to look in=
to<br>
&gt; are:<br>
&gt;<br>
&gt;=C2=A0 a. applying a timeout when fetching assets.=C2=A0 If the asset f=
ails to be<br>
&gt;=C2=A0 =C2=A0 =C2=A0fetched within the timeout, the test simply gets ca=
nceled.<br>
<br>
But this is failing during the download before the test starts, or in<br>
the pre-phase. The test suite was not created and Avocado don&#39;t have a<=
br>
mapping asset &lt;=3D&gt; test yet.<br>
<br></blockquote><div><br></div><div>Right. But my point is that if it time=
s out, then this &quot;best effort&quot; attempt would fail (but not abort =
the job).=C2=A0 Then, during the test itself, considering `cancel_on_missin=
g=3DTrue`, the test would also cancel when it fails to access the asset.</d=
iv><div><br></div><div>A canceled test is what we want here, and not a stuc=
k job.=C2=A0 That&#39;s why I still think the timeout may be a solution.</d=
iv><div><br></div><div>Thanks,</div><div>- Cleber.</div><div>=C2=A0</div></=
div></div>

--000000000000d7471305c3c8fd25--



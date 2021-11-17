Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F32D7454CCD
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 19:07:51 +0100 (CET)
Received: from localhost ([::1]:50832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnPLb-0001mO-54
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 13:07:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mnPKS-0000xA-Sj
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 13:06:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mnPKP-0004ml-ES
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 13:06:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637172396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9pTvEVhW/ph4i/Ec+WNpOlfSLT5da52Bvz/1atBmK+w=;
 b=LDjf8ejqnOJCPoP+nLu4/X1qBF5kqhE0l5hjY2fTVaeilY17/OUfWBea/eexsBoHcqU0IB
 s0Y8UaXnkDuE4v04DG3hCLX4/xrIGik7YzcmQdC/p5iPwwKxpP83ZP1iGypWjc77JiPGjG
 rm2I9lI06P73debZyRUOG/SwZmHlxFc=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81-OtNyCopnNjSHJRp7_90sjA-1; Wed, 17 Nov 2021 13:06:33 -0500
X-MC-Unique: OtNyCopnNjSHJRp7_90sjA-1
Received: by mail-vk1-f198.google.com with SMTP id
 k127-20020a1fa185000000b002fef61a92f3so1724365vke.2
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 10:06:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9pTvEVhW/ph4i/Ec+WNpOlfSLT5da52Bvz/1atBmK+w=;
 b=L4Wzfwuc3x/Bypj7A8V/vT2HnK2ux/CpOIX7fvVf4IA5+1JTeafG9EnPPdPf74Rcd7
 0xNV1AVEidTYuEq87SdHKbz97/NPM7jBX9UqBUrL2F5RemzJRIai+27D1HCNlGrZWL9y
 enHQ8hYggoSv9cWOP3LxCf05C6czcCZuIR2fnXlUPADeFceJEvpdPv5F8lzqbMFNgj0L
 jubWn9yiKhRfXI3xHGb6tY2V/5PYB4QUdNgvMX1pvzBSKbcGfj39kX+tIM27VnefKtwI
 NT7jM0fb1/oOOz92BzM6sXoqdWCwmj2PF6PvZFXOdQXAH2Q7e/Tag4gRyTNbkAtS3Aqj
 nDKQ==
X-Gm-Message-State: AOAM5333AlbYQft24OfjvWhvy4S1DJ47dL8sDkCEn0bRxrexcnTDfdTG
 aourAKCK6nGNO4H21lxleQ1U4nn2l5oef2Z5WBbOO/2fANG1z5RPu8GB4WjU3khmhlZOSty+6mG
 hA791f2f6tjaWaan400+mLAYJ69oBsn8=
X-Received: by 2002:a9f:2c4a:: with SMTP id s10mr26408323uaj.50.1637172393340; 
 Wed, 17 Nov 2021 10:06:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxV7BoPf90q2QizTt4PJ88kmXmZOmvmtzOI8WiqbZosPwO5hkuAtHqLUmsqn9dxMkvZdqo/9Ij2xJK5MNlZgWA=
X-Received: by 2002:a9f:2c4a:: with SMTP id s10mr26408283uaj.50.1637172393107; 
 Wed, 17 Nov 2021 10:06:33 -0800 (PST)
MIME-Version: 1.0
References: <a3273a3c-c294-6340-7ea7-73e5696c7b2e@redhat.com>
 <fabb0f91-48d4-47f7-562e-395f0acf4b81@redhat.com>
 <fc5a6743-8d0b-58a0-00d1-169bb87691f7@redhat.com>
In-Reply-To: <fc5a6743-8d0b-58a0-00d1-169bb87691f7@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 17 Nov 2021 13:06:22 -0500
Message-ID: <CAFn=p-YGdGOJSeg5TyU59M8evcG8Fmfybg307YTCVE5fm5SG6A@mail.gmail.com>
Subject: Re: Failing QEMU iotests
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000ed759b05d0ffe643"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ed759b05d0ffe643
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 17, 2021 at 7:50 AM Thomas Huth <thuth@redhat.com> wrote:

> On 17/11/2021 11.59, Hanna Reitz wrote:
> > On 17.11.21 11:07, Thomas Huth wrote:
>
> >> +++ 297.out.bad
> >> @@ -1,2 +1,21 @@
> >>  === pylint ===
> >> +************* Module image-fleecing
> >> +tests/image-fleecing:34:24: C0326: Exactly one space required after
> comma
> >> +patterns = [('0x5d', '0',         '64k'),
> >> +                        ^ (bad-whitespace)
> >> +tests/image-fleecing:35:25: C0326: Exactly one space required after
> comma
> >> +            ('0xd5', '1M',        '64k'),
> >> +                         ^ (bad-whitespace)
> >> +tests/image-fleecing:36:26: C0326: Exactly one space required after
> comma
> >> +            ('0xdc', '32M',       '64k'),
> >> +                          ^ (bad-whitespace)
> >> +tests/image-fleecing:39:25: C0326: Exactly one space required after
> comma
> >> +overwrite = [('0xab', '0',         '64k'), # Full overwrite
> >> +                         ^ (bad-whitespace)
> >> +tests/image-fleecing:48:32: C0326: Exactly one space required after
> comma
> >> +remainder = [('0xd5', '0x108000',  '32k'), # Right-end of partial-left
> [1]
> >> +                                ^ (bad-whitespace)
> >> +tests/image-fleecing:49:27: C0326: Exactly one space required after
> comma
> >> +             ('0xdc', '32M',       '32k'), # Left-end of partial-right
> [2]
> >> +                           ^ (bad-whitespace)
> >
> > This could be because your pylint is too old.  At least for the python/
> > tests we at least require 2.8.0
> > (https://lists.nongnu.org/archive/html/qemu-block/2021-10/msg00768.html)
> and
> > bad-whitespace was removed in 2.6.
>
> Thanks, updating pylint fixed this problem, indeed!
>
> But maybe the iotests should check the pylint version before using it?
>
>
Ideally, yes ...  sorry, it's been a lot of work to try and get the python
testing for this stuff in order.

FWIW, the GitLab CI jobs for check-python-pipenv and check-python-tox now
basically run "iotest 297", and those jobs will use virtual environments to
force a supportable version of pylint/mypy/etc. These targets are the ones
I put the most effort into, and those are the ones that "just work".

It's on my list to, one way or another, drop 297 and use the python testing
infra to cover this instead, but I have some ground to cover for
usability/convenience before I can pitch it.

(At the risk of sounding like I am task offloading, if you send a patch to
add version checking to 297, I can review it.)

--js

--000000000000ed759b05d0ffe643
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 17, 2021 at 7:50 AM Thoma=
s Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 17/11/202=
1 11.59, Hanna Reitz wrote:<br>
&gt; On 17.11.21 11:07, Thomas Huth wrote:<br>
<br>
&gt;&gt; +++ 297.out.bad<br>
&gt;&gt; @@ -1,2 +1,21 @@<br>
&gt;&gt; =C2=A0=3D=3D=3D pylint =3D=3D=3D<br>
&gt;&gt; +************* Module image-fleecing<br>
&gt;&gt; +tests/image-fleecing:34:24: C0326: Exactly one space required aft=
er comma<br>
&gt;&gt; +patterns =3D [(&#39;0x5d&#39;, &#39;0&#39;,=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 &#39;64k&#39;),<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ^ (bad-whitespace)<br>
&gt;&gt; +tests/image-fleecing:35:25: C0326: Exactly one space required aft=
er comma<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (&#39;0xd5&#39;, &#39;1M&#39;,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 &#39;64k&#39;),<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ^ (bad-whitespace)<br>
&gt;&gt; +tests/image-fleecing:36:26: C0326: Exactly one space required aft=
er comma<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (&#39;0xdc&#39;, &#39;32M&#39;,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &#3=
9;64k&#39;),<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ^ (bad-whitespace)<br>
&gt;&gt; +tests/image-fleecing:39:25: C0326: Exactly one space required aft=
er comma<br>
&gt;&gt; +overwrite =3D [(&#39;0xab&#39;, &#39;0&#39;,=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 &#39;64k&#39;), # Full overwrite<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ^ (bad-whitespace)<br>
&gt;&gt; +tests/image-fleecing:48:32: C0326: Exactly one space required aft=
er comma<br>
&gt;&gt; +remainder =3D [(&#39;0xd5&#39;, &#39;0x108000&#39;,=C2=A0 &#39;32=
k&#39;), # Right-end of partial-left [1]<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^ (bad-whitespace)<br>
&gt;&gt; +tests/image-fleecing:49:27: C0326: Exactly one space required aft=
er comma<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 (&#39;0xdc&#39;, &#39;32M&#39;,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 &#39;32k&#39;), # Left-end of partial-right [2]<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ^ (bad-whitespace)<br>
&gt; <br>
&gt; This could be because your pylint is too old.=C2=A0 At least for the p=
ython/ <br>
&gt; tests we at least require 2.8.0 <br>
&gt; (<a href=3D"https://lists.nongnu.org/archive/html/qemu-block/2021-10/m=
sg00768.html" rel=3D"noreferrer" target=3D"_blank">https://lists.nongnu.org=
/archive/html/qemu-block/2021-10/msg00768.html</a>) and <br>
&gt; bad-whitespace was removed in 2.6.<br>
<br>
Thanks, updating pylint fixed this problem, indeed!<br>
<br>
But maybe the iotests should check the pylint version before using it?<br>
<br></blockquote><div><br></div><div>Ideally, yes ...=C2=A0 sorry, it&#39;s=
 been a lot of work to try and get the python testing for this stuff in ord=
er.</div><div><br></div><div>FWIW, the GitLab CI jobs for check-python-pipe=
nv and check-python-tox now basically run &quot;iotest 297&quot;, and those=
 jobs will use virtual environments to force a supportable version of pylin=
t/mypy/etc. These targets are the ones I put the most effort into, and thos=
e are the ones that &quot;just work&quot;.<br></div><div><br></div><div>It&=
#39;s on my list to, one way or another, drop 297 and use the python testin=
g infra to cover this instead, but I have some ground to cover for usabilit=
y/convenience before I can pitch it.</div><div><br></div><div>(At the risk =
of sounding like I am task offloading, if you send a patch to add version c=
hecking to 297, I can review it.)<br></div><br></div><div class=3D"gmail_qu=
ote">--js<br></div></div>

--000000000000ed759b05d0ffe643--



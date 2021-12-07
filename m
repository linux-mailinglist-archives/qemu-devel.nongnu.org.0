Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 862DB46C29D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 19:22:17 +0100 (CET)
Received: from localhost ([::1]:33496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muf6W-0000it-C9
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 13:22:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1muf5B-0008Fp-DK
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 13:20:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1muf58-00021g-HH
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 13:20:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638901248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=az1+ZHFDj+n5RXoVd2UhWVdyBb6RrbQeLe8EMR/i4RQ=;
 b=YGtb5TOcrcl+pYO5cDXwRWsB1VnCZXcd//9TxeAjJvX7VZX/Q5HadK8wrX6rSzo3xtnNUl
 TrztQpIQ4g/AcmO7Vh8Ry3DJPy3kDvIorCNSk+lPUZc6T2WqP12WCWryBGDiQcnelbZN3s
 qAPQRJl/BR8Ng0A18ISs7jgkApZXdS4=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-178-w0laNO8xM8yaGFO-HPaFxg-1; Tue, 07 Dec 2021 13:20:47 -0500
X-MC-Unique: w0laNO8xM8yaGFO-HPaFxg-1
Received: by mail-ua1-f70.google.com with SMTP id
 b6-20020ab026c6000000b002e56ca72e19so16749uap.7
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 10:20:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=az1+ZHFDj+n5RXoVd2UhWVdyBb6RrbQeLe8EMR/i4RQ=;
 b=hcDSWOD7h047FwrVjUnjmayouzeRppcWurIVrceNoZeJxYtFu/qpulI9fiC6r+Z4rq
 TEUjpIfMvNyu4n8K9g0BqOBxhR5sNtPV1Q51qOhAOMdhcpgd7fwL9SZbdZnZj+H7Gbu2
 PtJ3PyKMV096PVpQuSNeRZYAeGaA2FlgCtgZcTJ2x11AOh5Zi4VqC90h9AJXjGB+q69/
 rcdJkmhWEvBrszCS7mqt0YlB17VWahOBuArwiOGJKlm7P8p+stvLyAq0NNe+1y9SCrOX
 gSbxQUyP3i2BtvTiuHLi4tL8y+FUdS1xgJy8bsvAmhCk32AWcCTsy48fHZBMGVlLW7eH
 rxRg==
X-Gm-Message-State: AOAM533OSiDKM/VhN4TuK6wa99HEGuIsDR1o++aDSBntP+U+wNeARVYq
 40zuuFyjQw6GypttmQJPxz1jr62eXL7Jr/xB1sIYk4pvYf9etkLK62TEZHzim7RPkekXQKDgjB1
 AoRK+ghdamh8KBc3VFOS0fDTWhvzxVTk=
X-Received: by 2002:a05:6122:2158:: with SMTP id
 m24mr54674420vkd.1.1638901247090; 
 Tue, 07 Dec 2021 10:20:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxw2LFoGo8T7t6FQWII3Q6NWVmhwqCALyjVKyYiK1KRrcdPsbe+dxelZNkBc9TFAl+Y1hxIOQL2UcLG2Yjw2W0=
X-Received: by 2002:a05:6122:2158:: with SMTP id
 m24mr54674390vkd.1.1638901246907; 
 Tue, 07 Dec 2021 10:20:46 -0800 (PST)
MIME-Version: 1.0
References: <20211203122223.2780098-1-vsementsov@virtuozzo.com>
 <CAFn=p-bsY_QWNoRWp928_dwmNyXXcDQ7Bi+0P9ObAsxGTYyiBA@mail.gmail.com>
 <68d4742a-bcc4-df26-41d0-ece75eea58e0@virtuozzo.com>
In-Reply-To: <68d4742a-bcc4-df26-41d0-ece75eea58e0@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 7 Dec 2021 13:20:36 -0500
Message-ID: <CAFn=p-anMonsQDThd4xzp9292dTp7hLXc3N8YSwP9L0t4NeHiQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] iotests: multiprocessing!!
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000a4e9ac05d2926ef5"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, den@openvz.org,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a4e9ac05d2926ef5
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 6, 2021 at 3:26 PM Vladimir Sementsov-Ogievskiy <
vsementsov@virtuozzo.com> wrote:

> 06.12.2021 21:37, John Snow wrote:
> >
> >
> > On Fri, Dec 3, 2021 at 7:22 AM Vladimir Sementsov-Ogievskiy <
> vsementsov@virtuozzo.com <mailto:vsementsov@virtuozzo.com>> wrote:
> >
> >     Hi all!
> >
> >     Finally, I can not stand it any longer. So, I'm happy to present
> >     multiprocessing support for iotests test runner.
> >
> >     testing on tmpfs:
> >
> >     Before:
> >
> >     time check -qcow2
> >     ...
> >     real    12m28.095s
> >     user    9m53.398s
> >     sys     2m55.548s
> >
> >     After:
> >
> >     time check -qcow2 -j 12
> >     ...
> >     real    2m12.136s
> >     user    12m40.948s
> >     sys     4m7.449s
> >
> >
> > VERY excellent. And this will probably flush a lot more bugs loose, too.
> (Which I consider a good thing!)
>
> Thanks!)
>
> > We could look into utilizing it for 'make check', but we'll have to be
> prepared for a greater risk of race conditions on the CI if we do. But...
> it's seriously hard to argue with this kind of optimization, very well done!
>
> I thought about this too. I think, we can at least passthrought -j flag of
> "make -j9 check" to ./check
>
> I think, CIs mostly call make check without -j flag. But I always call
> make -j9 check. And it always upset me that all tests run in parallel
> except for iotests. So if it possible to detect that we are called through
> "make -j9 check" and use "-j 9" for iotests/check in this case, it would be
> good.
>
> >
> >
> >     Hmm, seems -j 6 should be enough. I have 6 cores, 2 threads per core.
> >     Anyway, that's so fast!
> >
> >     Vladimir Sementsov-Ogievskiy (3):
> >        iotests/testrunner.py: add doc string for run_test()
> >        iotests/testrunner.py: move updating last_elapsed to run_tests
> >        iotests: check: multiprocessing support
> >
> >       tests/qemu-iotests/check         |  4 +-
> >       tests/qemu-iotests/testrunner.py | 86
> ++++++++++++++++++++++++++++----
> >       2 files changed, 80 insertions(+), 10 deletions(-)
> >
> >     --
> >     2.31.1
> >
>
>
>
I'll also now add:

Tested-by: John Snow <jsnow@redhat.com>

I tried to find a different workaround in just a few minutes, but that just
made it clear that your solution was right. While I had it checked out, I
ran it a few times and it looks good to me!
(And no new problems from the Python CI stuff, so it looks good to me.)

--000000000000a4e9ac05d2926ef5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 6, 2021 at 3:26 PM Vladim=
ir Sementsov-Ogievskiy &lt;<a href=3D"mailto:vsementsov@virtuozzo.com" targ=
et=3D"_blank">vsementsov@virtuozzo.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">06.12.2021 21:37, John Snow wrote:<br=
>
&gt; <br>
&gt; <br>
&gt; On Fri, Dec 3, 2021 at 7:22 AM Vladimir Sementsov-Ogievskiy &lt;<a hre=
f=3D"mailto:vsementsov@virtuozzo.com" target=3D"_blank">vsementsov@virtuozz=
o.com</a> &lt;mailto:<a href=3D"mailto:vsementsov@virtuozzo.com" target=3D"=
_blank">vsementsov@virtuozzo.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi all!<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Finally, I can not stand it any longer. So, I&#39;m=
 happy to present<br>
&gt;=C2=A0 =C2=A0 =C2=A0multiprocessing support for iotests test runner.<br=
>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0testing on tmpfs:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Before:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0time check -qcow2<br>
&gt;=C2=A0 =C2=A0 =C2=A0...<br>
&gt;=C2=A0 =C2=A0 =C2=A0real=C2=A0 =C2=A0 12m28.095s<br>
&gt;=C2=A0 =C2=A0 =C2=A0user=C2=A0 =C2=A0 9m53.398s<br>
&gt;=C2=A0 =C2=A0 =C2=A0sys=C2=A0 =C2=A0 =C2=A02m55.548s<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0After:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0time check -qcow2 -j 12<br>
&gt;=C2=A0 =C2=A0 =C2=A0...<br>
&gt;=C2=A0 =C2=A0 =C2=A0real=C2=A0 =C2=A0 2m12.136s<br>
&gt;=C2=A0 =C2=A0 =C2=A0user=C2=A0 =C2=A0 12m40.948s<br>
&gt;=C2=A0 =C2=A0 =C2=A0sys=C2=A0 =C2=A0 =C2=A04m7.449s<br>
&gt; <br>
&gt; <br>
&gt; VERY excellent. And this will probably flush a lot more bugs loose, to=
o. (Which I consider a good thing!)<br>
<br>
Thanks!)<br>
<br>
&gt; We could look into utilizing it for &#39;make check&#39;, but we&#39;l=
l have to be prepared for a greater risk of race conditions on the CI if we=
 do. But... it&#39;s seriously hard to argue with this kind of optimization=
, very well done!<br>
<br>
I thought about this too. I think, we can at least passthrought -j flag of =
&quot;make -j9 check&quot; to ./check<br>
<br>
I think, CIs mostly call make check without -j flag. But I always call make=
 -j9 check. And it always upset me that all tests run in parallel except fo=
r iotests. So if it possible to detect that we are called through &quot;mak=
e -j9 check&quot; and use &quot;-j 9&quot; for iotests/check in this case, =
it would be good.<br>
<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hmm, seems -j 6 should be enough. I have 6 cores, 2=
 threads per core.<br>
&gt;=C2=A0 =C2=A0 =C2=A0Anyway, that&#39;s so fast!<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Vladimir Sementsov-Ogievskiy (3):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 iotests/testrunner.py: add doc string for r=
un_test()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 iotests/testrunner.py: move updating last_e=
lapsed to run_tests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 iotests: check: multiprocessing support<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tests/qemu-iotests/check=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 4 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tests/qemu-iotests/testrunner.py | 86 ++++++=
++++++++++++++++++++++----<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A02 files changed, 80 insertions(+), 10 deleti=
ons(-)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A02.31.1<br>
&gt; <br>
<br>
<br></blockquote><div><br></div><div>I&#39;ll also now add:<br><br></div><d=
iv>Tested-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"_=
blank">jsnow@redhat.com</a>&gt;</div><div><br></div><div>I tried to find a =
different workaround in just a few minutes, but that just made it clear tha=
t your solution was right. While I had it checked out, I ran it a few times=
 and it looks good to me!<br></div><div>(And no new problems from the Pytho=
n CI stuff, so it looks good to me.)</div><div><br></div></div></div>

--000000000000a4e9ac05d2926ef5--



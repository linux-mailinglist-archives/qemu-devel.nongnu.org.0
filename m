Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BCC2FF1BF
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 18:24:58 +0100 (CET)
Received: from localhost ([::1]:60950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2dhZ-0002Et-DF
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 12:24:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1l2dUk-0006Z7-Ib
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 12:11:44 -0500
Received: from mail-io1-f45.google.com ([209.85.166.45]:43925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1l2dUi-000425-Gq
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 12:11:42 -0500
Received: by mail-io1-f45.google.com with SMTP id x21so5410495iog.10
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 09:11:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=TBpDLSJUW51U5az44fDjbdzwHStj9j7C/gRUrFfdYzM=;
 b=aBw8crNc7QbBw7g/KaajuA/vgxqZK/Kbt7o9UVzatCb731WKSk9InxfiU9koNYq7Nr
 pXOY4biJGRwUx9f2YJH8rO5UKvlKCeMWjovEStuKhTEgWLG+aWHKpL+t2iW9zf+0vpNR
 RLGbZ92V4ay+vUeIqGzGeAc+/wuCgLl58K9ptFB6O7Nc1+nvaUVk1O8HIDsV7r831q4g
 KbZwfvGeStPDHlOIuEDwKbMTOfeBTtzpYEBmgQb/DAW5NZ3FvVvb2FsbShTOx/D/Yqu2
 79kmcM0ZpUr8PaC8Mgr4W79AUuy6XIyDY8SRyrzfifGJnnAJx51JRGy5bMjk7PYer5jS
 gBwg==
X-Gm-Message-State: AOAM532t8HUpRwWdj0AI6MwqJE2othAydBXvMP3WmkJcxuJAGopGD33M
 nUQfuaTd0gOobumQCrZhz2/Gd80/bg4=
X-Google-Smtp-Source: ABdhPJz93bbrmgz2BDkjoR0oSdb9ssQ9kW0kTiRRpHswTAy802iWbj9hA4J6Y9IIGJETp/NSmGB2KA==
X-Received: by 2002:a6b:7e05:: with SMTP id i5mr381665iom.60.1611249098862;
 Thu, 21 Jan 2021 09:11:38 -0800 (PST)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com.
 [209.85.166.41])
 by smtp.gmail.com with ESMTPSA id r9sm3309953ill.72.2021.01.21.09.11.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 09:11:38 -0800 (PST)
Received: by mail-io1-f41.google.com with SMTP id u17so5512155iow.1
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 09:11:38 -0800 (PST)
X-Received: by 2002:a92:d244:: with SMTP id v4mr589977ilg.191.1611249098288;
 Thu, 21 Jan 2021 09:11:38 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a02:6543:0:0:0:0:0 with HTTP; Thu, 21 Jan 2021 09:11:37
 -0800 (PST)
In-Reply-To: <20210121161703.GQ3125227@redhat.com>
References: <20210105022055.12113-1-j@getutm.app>
 <20210105022055.12113-5-j@getutm.app>
 <20210121161703.GQ3125227@redhat.com>
From: Joelle van Dyne <j@getutm.app>
Date: Thu, 21 Jan 2021 09:11:37 -0800
X-Gmail-Original-Message-ID: <CA+E+eSCEdSPAxkNwQ3Yb7WMPLk0LGqa6uGQ6=gUV8GHE3o8nTg@mail.gmail.com>
Message-ID: <CA+E+eSCEdSPAxkNwQ3Yb7WMPLk0LGqa6uGQ6=gUV8GHE3o8nTg@mail.gmail.com>
Subject: Re: [PATCH v6 4/7] coroutine: add libucontext as external library
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000025fa0f05b96c2af7"
Received-SPF: pass client-ip=209.85.166.45; envelope-from=osy86dev@gmail.com;
 helo=mail-io1-f45.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Joelle van Dyne <j@getutm.app>, Stefan Hajnoczi <stefanha@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000025fa0f05b96c2af7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes since the submission of this patch, we have been working with the
original authors to merge all the changes upstream. The next patch should
point to the original repo.

-j

On Thursday, January 21, 2021, Daniel P. Berrang=C3=A9 <berrange@redhat.com=
>
wrote:

> On Mon, Jan 04, 2021 at 06:20:52PM -0800, Joelle van Dyne wrote:
> > iOS does not support ucontext natively for aarch64 and the sigaltstack =
is
> > also unsupported (even worse, it fails silently, see:
> > https://openradar.appspot.com/13002712 )
> >
> > As a workaround we include a library implementation of ucontext and add
> it
> > as a build option.
> >
> > Signed-off-by: Joelle van Dyne <j@getutm.app>
> > ---
> >  configure                 | 23 ++++++++++++++++++++---
> >  meson.build               | 11 ++++++++++-
> >  util/coroutine-ucontext.c |  9 +++++++++
> >  .gitmodules               |  3 +++
> >  meson_options.txt         |  2 ++
> >  subprojects/libucontext   |  1 +
> >  6 files changed, 45 insertions(+), 4 deletions(-)
> >  create mode 160000 subprojects/libucontext
>
> > diff --git a/.gitmodules b/.gitmodules
> > index 2bdeeacef8..4f02eed79a 100644
> > --- a/.gitmodules
> > +++ b/.gitmodules
> > @@ -64,3 +64,6 @@
> >  [submodule "roms/vbootrom"]
> >       path =3D roms/vbootrom
> >       url =3D https://git.qemu.org/git/vbootrom.git
> > +[submodule "libucontext"]
> > +     path =3D subprojects/libucontext
> > +     url =3D https://github.com/utmapp/libucontext.git
>
> Using libucontext looks like a good idea to me, but I noticed that
> this is a pointing to a fork of the main libucontext project at
>
>    https://github.com/kaniini/libucontext
>
> The main project appears 100's of commits ahead of the utmapp fork
>
> What is in the utmapp fork that isn't present in the primary libucontext
> repo ?  I think if we're going to use libucontext we will want to point
> to the primary project, and this means anything custom in the fork will
> need to get submitted upstream. Maybe you've already started doing that
> making this a non-issue ?
>
> Regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/
> dberrange :|
> |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/
> dberrange :|
>
>

--00000000000025fa0f05b96c2af7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes since the submission of this patch, we have been working with the origi=
nal authors to merge all the changes upstream. The next patch should point =
to the original repo.<div><br></div><div>-j<br><br>On Thursday, January 21,=
 2021, Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">b=
errange@redhat.com</a>&gt; wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Mon,=
 Jan 04, 2021 at 06:20:52PM -0800, Joelle van Dyne wrote:<br>
&gt; iOS does not support ucontext natively for aarch64 and the sigaltstack=
 is<br>
&gt; also unsupported (even worse, it fails silently, see:<br>
&gt; <a href=3D"https://openradar.appspot.com/13002712" target=3D"_blank">h=
ttps://openradar.appspot.com/<wbr>13002712</a> )<br>
&gt; <br>
&gt; As a workaround we include a library implementation of ucontext and ad=
d it<br>
&gt; as a build option.<br>
&gt; <br>
&gt; Signed-off-by: Joelle van Dyne &lt;j@getutm.app&gt;<br>
&gt; ---<br>
&gt;=C2=A0 configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 23 ++++++++++++++++++++---<br>
&gt;=C2=A0 meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 11 ++++++++++-<br>
&gt;=C2=A0 util/coroutine-ucontext.c |=C2=A0 9 +++++++++<br>
&gt;=C2=A0 .gitmodules=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 3 +++<br>
&gt;=C2=A0 meson_options.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 ++<=
br>
&gt;=C2=A0 subprojects/libucontext=C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 6 files changed, 45 insertions(+), 4 deletions(-)<br>
&gt;=C2=A0 create mode 160000 subprojects/libucontext<br>
<br>
&gt; diff --git a/.gitmodules b/.gitmodules<br>
&gt; index 2bdeeacef8..4f02eed79a 100644<br>
&gt; --- a/.gitmodules<br>
&gt; +++ b/.gitmodules<br>
&gt; @@ -64,3 +64,6 @@<br>
&gt;=C2=A0 [submodule &quot;roms/vbootrom&quot;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0path =3D roms/vbootrom<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0url =3D <a href=3D"https://git.qemu.org/git/=
vbootrom.git" target=3D"_blank">https://git.qemu.org/git/<wbr>vbootrom.git<=
/a><br>
&gt; +[submodule &quot;libucontext&quot;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0path =3D subprojects/libucontext<br>
&gt; +=C2=A0 =C2=A0 =C2=A0url =3D <a href=3D"https://github.com/utmapp/libu=
context.git" target=3D"_blank">https://github.com/utmapp/<wbr>libucontext.g=
it</a><br>
<br>
Using libucontext looks like a good idea to me, but I noticed that<br>
this is a pointing to a fork of the main libucontext project at<br>
<br>
=C2=A0 =C2=A0<a href=3D"https://github.com/kaniini/libucontext" target=3D"_=
blank">https://github.com/kaniini/<wbr>libucontext</a><br>
<br>
The main project appears 100&#39;s of commits ahead of the utmapp fork<br>
<br>
What is in the utmapp fork that isn&#39;t present in the primary libucontex=
t<br>
repo ?=C2=A0 I think if we&#39;re going to use libucontext we will want to =
point<br>
to the primary project, and this means anything custom in the fork will<br>
need to get submitted upstream. Maybe you&#39;ve already started doing that=
<br>
making this a non-issue ?<br>
<br>
Regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" target=3D"_blank">https://berrange.com<=
/a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D"https://www.flickr.com/=
photos/dberrange" target=3D"_blank">https://www.flickr.com/photos/<wbr>dber=
range</a> :|<br>
|: <a href=3D"https://libvirt.org" target=3D"_blank">https://libvirt.org</a=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 <a href=3D"https://fstop138.berrange.com" target=3D"_blank">https://=
fstop138.berrange.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" target=3D"_blank">https://entangl=
e-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D"https://www.instag=
ram.com/dberrange" target=3D"_blank">https://www.instagram.com/<wbr>dberran=
ge</a> :|<br>
<br>
</blockquote></div>

--00000000000025fa0f05b96c2af7--


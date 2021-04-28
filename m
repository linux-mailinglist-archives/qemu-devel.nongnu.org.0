Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C8036D962
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 16:16:23 +0200 (CEST)
Received: from localhost ([::1]:32868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbkzH-0004hr-1c
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 10:16:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lbkx8-0003y8-3r
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 10:14:10 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:41477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lbkx5-0001WT-LB
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 10:14:09 -0400
Received: by mail-oi1-x234.google.com with SMTP id i11so1217892oig.8
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 07:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F8ybRihlhnqpXPq/drYaFZM3GjCUe//7wvvdZcU5R3M=;
 b=NnsZ+t4zHbliz1EaEBVJIjMbgyKE21RFcID7x9ec32L8J0naCrBPrVznxXUYwDSbH+
 vDyx8JDKH4snNmHVy7wy46EvjqsFBOoLRPRV3zOCzNITHuj45uouePBe90BEdIUYSb1E
 TifzW3MC4gzxIg4+QkZQSk2m2dd98iqn9HxGR/oItId8W3CsmMOpEyZDbmYn/UHW1EmH
 fxfi55aebx9vVYZaw59mGS6rLh5/3ACRo6JhftRXWBvPbvHDwTm9Gl0KZczxq7EMuFy5
 mX2WDQHF5rAx45JeczoaATyIRh8U6gds+JdD35Q+SCHoUNBVYFvPgpcejHtk+Jxa3wHX
 KNbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F8ybRihlhnqpXPq/drYaFZM3GjCUe//7wvvdZcU5R3M=;
 b=a1hmWpZmI9N20s+LhwycYOaYI+/n9ZZHC1Qg0kGPAYZdqSZl8QvpRHz2LpcxtVBl6u
 35DnWXJMPm8zb7VWUV1p4qCWG6ehzswkBixWw/Vs04Y3FzUQHP2C/7jgFcejfjOyFhry
 4XC9Ox7iyVDLkh4zNxfFvPU3WdFdmhqRNGNxNuhu3Bf8Ud6BAzKoUrt6q02B39Xl/FfJ
 zkqMQi50yXbrNV7ikcfpU7VJBnq5noNsDpkzLZAxB2flCQ8Hy7OcnOhF31BTYcrv9bXH
 XSvPd174cJ9OhMJDBR4rWh9fSqU5qV3V3lIHM9w5Jbhubgn2UeqhuQnXIedP17pfRaGJ
 Dt0A==
X-Gm-Message-State: AOAM531EKFW4UZ37t9BzkK6CxmpnP2yVD/to0kgUHlWoO+FkoVlamIAp
 bu0AgtHhBu8Ih8x/+2nLMaKtbyTGLIBzMINuKjE=
X-Google-Smtp-Source: ABdhPJwM41RJ2c3g1pv6sgMTHGLqwzYe1u20Sg0YaVi/w2w234cTd35LXaq/HC8rwal51H0WD6AL9DnL3urJFVeUtPU=
X-Received: by 2002:a05:6808:1d7:: with SMTP id
 x23mr14775211oic.76.1619619246091; 
 Wed, 28 Apr 2021 07:14:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210428133507.52066-1-ma.mandourr@gmail.com>
 <e1059890-79ab-eae6-1db1-5c4033f7b584@redhat.com>
In-Reply-To: <e1059890-79ab-eae6-1db1-5c4033f7b584@redhat.com>
From: Mahmoud Mandour <ma.mandourr@gmail.com>
Date: Wed, 28 Apr 2021 16:13:54 +0200
Message-ID: <CAD-LL6iLpZSAUHquK=gJyXGS3rqOCJZqt0smV29ifeE5ZgZNQA@mail.gmail.com>
Subject: Re: [PATCH] tools/meson.build: Error on enabling virtiofsd and
 have_system is false
To: Connor Kuehl <ckuehl@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000d5b32e05c108fda2"
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=ma.mandourr@gmail.com; helo=mail-oi1-x234.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d5b32e05c108fda2
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 28, 2021 at 3:56 PM Connor Kuehl <ckuehl@redhat.com> wrote:

> On 4/28/21 8:35 AM, Mahmoud Mandour wrote:
> > Previously, on configuring with --enable-virtiofsd and specifying
> > a target list that does not contain a full-system emulation target,
> > a spurious error message is emitted. This patch introduces a
> > meaningful error message for such case.
> >
> > Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> > ---
> >  tools/meson.build | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/tools/meson.build b/tools/meson.build
> > index 3e5a0abfa2..f6a4ced2f4 100644
> > --- a/tools/meson.build
> > +++ b/tools/meson.build
> > @@ -5,7 +5,9 @@ have_virtiofsd = (targetos == 'linux' and
> >      'CONFIG_VHOST_USER' in config_host)
> >
> >  if get_option('virtiofsd').enabled()
> > -  if not have_virtiofsd
> > +  if not have_system
> > +    error('virtiofsd requires full-system emulation target(s)')
>
> I am not entirely sure if this is true. The error message before this
> patch is applied is:
>
>         ../tools/meson.build:12:6: ERROR: Problem encountered: virtiofsd
>         requires libcap-ng-devel and seccomp-devel
>
> From what I know about virtiofsd, I know it definitely depends on those
> two things.
>
> Is it possible that the error here is that the top-level meson.build is
> not properly collecting the seccomp and libcap-ng dependencies if the
> configure invocation doesn't require a system emulation target?
>
> Thanks,
>
> Connor
>
> > +  elif not have_virtiofsd
> >      if targetos != 'linux'
> >        error('virtiofsd requires Linux')
> >      elif not seccomp.found() or not libcap_ng.found()
> >
>
>
I also thought that this is the case since I also specifically get this
error message
if I enable virtiofsd and specify a target list with only Linux-user
targets while nothing
in tools/meson.build specifies so. But I think that even if it correctly
managed the
dependencies it would include and build virtiofsd unnecessarily and that's
not what we want(?)

Thanks,
Mahmoud

--000000000000d5b32e05c108fda2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br></d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Wed, Apr 28, 2021 at 3:56 PM Connor Kuehl &lt;<a href=3D"mailto:ckueh=
l@redhat.com">ckuehl@redhat.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On 4/28/21 8:35 AM, Mahmoud Mandour wrote:=
<br>
&gt; Previously, on configuring with --enable-virtiofsd and specifying<br>
&gt; a target list that does not contain a full-system emulation target,<br=
>
&gt; a spurious error message is emitted. This patch introduces a<br>
&gt; meaningful error message for such case.<br>
&gt; <br>
&gt; Signed-off-by: Mahmoud Mandour &lt;<a href=3D"mailto:ma.mandourr@gmail=
.com" target=3D"_blank">ma.mandourr@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 tools/meson.build | 4 +++-<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/tools/meson.build b/tools/meson.build<br>
&gt; index 3e5a0abfa2..f6a4ced2f4 100644<br>
&gt; --- a/tools/meson.build<br>
&gt; +++ b/tools/meson.build<br>
&gt; @@ -5,7 +5,9 @@ have_virtiofsd =3D (targetos =3D=3D &#39;linux&#39; an=
d<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &#39;CONFIG_VHOST_USER&#39; in config_host)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 if get_option(&#39;virtiofsd&#39;).enabled()<br>
&gt; -=C2=A0 if not have_virtiofsd<br>
&gt; +=C2=A0 if not have_system<br>
&gt; +=C2=A0 =C2=A0 error(&#39;virtiofsd requires full-system emulation tar=
get(s)&#39;)<br>
<br>
I am not entirely sure if this is true. The error message before this<br>
patch is applied is:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ../tools/meson.build:12:6: ERROR: Problem encou=
ntered: virtiofsd<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 requires libcap-ng-devel and seccomp-devel<br>
<br>
From what I know about virtiofsd, I know it definitely depends on those<br>
two things.<br>
<br>
Is it possible that the error here is that the top-level meson.build is<br>
not properly collecting the seccomp and libcap-ng dependencies if the<br>
configure invocation doesn&#39;t require a system emulation target?<br>
<br>
Thanks,<br>
<br>
Connor<br>
<br>
&gt; +=C2=A0 elif not have_virtiofsd<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if targetos !=3D &#39;linux&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 error(&#39;virtiofsd requires Linux&#39;)<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 elif not seccomp.found() or not libcap_ng.found()<=
br>
&gt; <br>
<br></blockquote><div>=C2=A0</div><div dir=3D"ltr">I also thought that this=
 is the case since I also specifically get this error message=C2=A0</div><d=
iv dir=3D"ltr">if I enable virtiofsd and specify a target list with only Li=
nux-user targets while nothing</div><div>in tools/meson.build specifies so.=
 But I think that even if it correctly managed the=C2=A0</div><div>dependen=
cies it would include and build virtiofsd unnecessarily and that&#39;s not =
what we want(?)=C2=A0</div><div><br></div><div>Thanks,</div><div>Mahmoud</d=
iv></div></div></div>

--000000000000d5b32e05c108fda2--


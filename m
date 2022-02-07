Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2DD4AC2E3
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 16:22:30 +0100 (CET)
Received: from localhost ([::1]:41328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH5qX-0004Ay-Eo
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 10:22:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nH58m-0001Wz-WB
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 09:37:17 -0500
Received: from [2a00:1450:4864:20::12b] (port=39702
 helo=mail-lf1-x12b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nH58k-0008A2-Hk
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 09:37:16 -0500
Received: by mail-lf1-x12b.google.com with SMTP id b9so27234285lfq.6
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 06:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5ZmOQd+63WfT5nAFA5gEZDBi3bKRsHVequ/qh/kIhMc=;
 b=cyUPGJdPG43IZfCNpgRJYhaKolAlfg5ojlfXZ0zE/65L6/1PMBTWa3qofvJgrtNmKI
 kVZhszmBwwb2uPhUa1rk5MfDHn9GfMiLMnR6sut8qlagk6RwBMKS7IRc2XRwUhiTOUXv
 k+SGUlZ7l+XPM5vhLHxeajZzOVl5l0Z7300Do++6OIs+QNYU1OQIm9mUegPb4qtmUqY1
 I5yk9Ij7CQus7bLA0LYql0rZzhD71u35cBz9rnZFOOEoJlRXu+N/FECnS01yU7IX2WJT
 ijcxJWl2avH8O+CVssqlHEDE4YPrj4M6TOskgNL3LqXNc/L1Gp8lIQRrEceGe7ebduQY
 Ntug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5ZmOQd+63WfT5nAFA5gEZDBi3bKRsHVequ/qh/kIhMc=;
 b=Bw0vEGaUjdSHP0FMq5FGyiZ6tBS4Gg1sW0WE0NnqUF5oYyuG6bNEKg40rbn4gssjOL
 X+jQJN1F93KAYlX2MfbcD0QH7sLBHZiGFfGqta1vn7VMHkNtQyuwQqNTa8NNtD5KvutH
 dyUHQA3oqpyFmGcP0qlxJCfDjFlL3K1F2MZRMpdjfSlaIGSzFGb+JJoB6X9yqAKsZblY
 NhSMZm/h4feUaOuoQKImTXLIai1jSz9aMPHsq7JOnacqBxUSd2jo0/1+nFQSA4zFWGkh
 oQdwi90afpBESD0XynHG9Vv4Jrn4UWDXaYD92glY3aoTn1p7IlekKekfI62ICR/g+X4R
 mkXA==
X-Gm-Message-State: AOAM5320uasYTYtOHrvUTGX+98wXpn38afOgyeSbPhj4CU6M0k7kIgje
 OopCzpnOZ6EkGtwbZm6hRqhLNxNLiPsYahkJoyU=
X-Google-Smtp-Source: ABdhPJx8T9p9ROs2MTtTX/wiwA3Nf2KwlGBzjXzcelH08+j4MVXH8cskDgkymaHibW97qSpsUUVeUySQZJVAcF6WWUQ=
X-Received: by 2002:a05:6512:2243:: with SMTP id
 i3mr8855332lfu.598.1644244632181; 
 Mon, 07 Feb 2022 06:37:12 -0800 (PST)
MIME-Version: 1.0
References: <20220206200719.74464-1-wwcohen@gmail.com>
 <20220206200719.74464-11-wwcohen@gmail.com>
 <1906604.JvqJJlWBnf@silver>
In-Reply-To: <1906604.JvqJJlWBnf@silver>
From: Will Cohen <wwcohen@gmail.com>
Date: Mon, 7 Feb 2022 09:37:00 -0500
Message-ID: <CAB26zV2hBsWzTYSTm07Ck20Awyy2at0-uCBmvqrsK7BjxSrfuw@mail.gmail.com>
Subject: Re: [PATCH v4 10/11] 9p: darwin: meson: Allow VirtFS on Darwin
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: multipart/alternative; boundary="00000000000039a81805d76e89dd"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=wwcohen@gmail.com; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000039a81805d76e89dd
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 7, 2022 at 9:27 AM Christian Schoenebeck <qemu_oss@crudebyte.com>
wrote:

> On Sonntag, 6. Februar 2022 21:07:18 CET Will Cohen wrote:
> > From: Keno Fischer <keno@juliacomputing.com>
> >
> > Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> > [Michael Roitzsch: - Rebase for NixOS]
> > Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> > [Will Cohen: - Rebase to master]
> > Signed-off-by: Will Cohen <wwcohen@gmail.com>
> > Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> > [Will Cohen: - Add check for pthread_fchdir_np to virtfs]
> > Signed-off-by: Will Cohen <wwcohen@gmail.com>
> > ---
> >  fsdev/meson.build |  1 +
> >  meson.build       | 14 ++++++++++----
> >  2 files changed, 11 insertions(+), 4 deletions(-)
> >
> > diff --git a/fsdev/meson.build b/fsdev/meson.build
> > index adf57cc43e..b632b66348 100644
> > --- a/fsdev/meson.build
> > +++ b/fsdev/meson.build
> > @@ -7,6 +7,7 @@ fsdev_ss.add(when: ['CONFIG_FSDEV_9P'], if_true: files(
> >    'qemu-fsdev.c',
> >  ), if_false: files('qemu-fsdev-dummy.c'))
> >  softmmu_ss.add_all(when: 'CONFIG_LINUX', if_true: fsdev_ss)
> > +softmmu_ss.add_all(when: 'CONFIG_DARWIN', if_true: fsdev_ss)
> >
> >  if have_virtfs_proxy_helper
> >    executable('virtfs-proxy-helper',
> > diff --git a/meson.build b/meson.build
> > index 5f43355071..6b4adf7e15 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -1421,17 +1421,23 @@ if not get_option('dbus_display').disabled()
> >    endif
> >  endif
> >
> > -have_virtfs = (targetos == 'linux' and
> > +if targetos == 'darwin' and cc.has_function('pthread_fchdir_np')
> > +  have_virtfs = have_system
>
> As you are going for a v5 anyway: I would add an error message here if
> pthread_fchdir_np() is not available. Because it is a bit frustrating for
> users if their options silently got ignored without any indication why.
>
> > +else
> > +  have_virtfs = (targetos == 'linux' and
> >      have_system and
> >      libattr.found() and
> >      libcap_ng.found())
> > +endif
> >
> > -have_virtfs_proxy_helper = have_virtfs and have_tools
> > +have_virtfs_proxy_helper = targetos == 'linux' and have_virtfs and
> > have_tools
> >
> >  if get_option('virtfs').enabled()
> >    if not have_virtfs
> > -    if targetos != 'linux'
> > -      error('virtio-9p (virtfs) requires Linux')
> > +    if targetos != 'linux' and targetos != 'darwin'
> > +      error('virtio-9p (virtfs) requires Linux or Darwin')
> > +    elif targetos == 'darwin' and not
> cc.has_function('pthread_fchdir_np')
> > +      error('virtio-9p (virtfs) on Darwin requires the presence of
> > pthread_fchdir_np')


Does the error message here suffice for that need? Right now if they're
running a system without pthread_fchdir_np and don't specify the option, I
think it'll just quietly disable, but if they --enable-virtfs and the
function isn't there, they should get a note. I assume this is better, so
that the ability to compile isn't contingent on having the latest OS, even
if full support for older OSes isn't provided.


> elif not libcap_ng.found() or not libattr.found()
> >        error('virtio-9p (virtfs) requires libcap-ng-devel and
> > libattr-devel') elif not have_system
>
>
>

--00000000000039a81805d76e89dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 7, 2022 at 9:27 AM Christ=
ian Schoenebeck &lt;<a href=3D"mailto:qemu_oss@crudebyte.com">qemu_oss@crud=
ebyte.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Sonntag, 6. Februar 2022 21:07:18 CET Will Cohen wrote:<br>
&gt; From: Keno Fischer &lt;<a href=3D"mailto:keno@juliacomputing.com" targ=
et=3D"_blank">keno@juliacomputing.com</a>&gt;<br>
&gt; <br>
&gt; Signed-off-by: Keno Fischer &lt;<a href=3D"mailto:keno@juliacomputing.=
com" target=3D"_blank">keno@juliacomputing.com</a>&gt;<br>
&gt; [Michael Roitzsch: - Rebase for NixOS]<br>
&gt; Signed-off-by: Michael Roitzsch &lt;<a href=3D"mailto:reactorcontrol@i=
cloud.com" target=3D"_blank">reactorcontrol@icloud.com</a>&gt;<br>
&gt; [Will Cohen: - Rebase to master]<br>
&gt; Signed-off-by: Will Cohen &lt;<a href=3D"mailto:wwcohen@gmail.com" tar=
get=3D"_blank">wwcohen@gmail.com</a>&gt;<br>
&gt; Reviewed-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" =
target=3D"_blank">pbonzini@redhat.com</a>&gt;<br>
&gt; [Will Cohen: - Add check for pthread_fchdir_np to virtfs]<br>
&gt; Signed-off-by: Will Cohen &lt;<a href=3D"mailto:wwcohen@gmail.com" tar=
get=3D"_blank">wwcohen@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 fsdev/meson.build |=C2=A0 1 +<br>
&gt;=C2=A0 meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0| 14 ++++++++++----<br>
&gt;=C2=A0 2 files changed, 11 insertions(+), 4 deletions(-)<br>
&gt; <br>
&gt; diff --git a/fsdev/meson.build b/fsdev/meson.build<br>
&gt; index adf57cc43e..b632b66348 100644<br>
&gt; --- a/fsdev/meson.build<br>
&gt; +++ b/fsdev/meson.build<br>
&gt; @@ -7,6 +7,7 @@ fsdev_ss.add(when: [&#39;CONFIG_FSDEV_9P&#39;], if_tru=
e: files(<br>
&gt;=C2=A0 =C2=A0 &#39;qemu-fsdev.c&#39;,<br>
&gt;=C2=A0 ), if_false: files(&#39;qemu-fsdev-dummy.c&#39;))<br>
&gt;=C2=A0 softmmu_ss.add_all(when: &#39;CONFIG_LINUX&#39;, if_true: fsdev_=
ss)<br>
&gt; +softmmu_ss.add_all(when: &#39;CONFIG_DARWIN&#39;, if_true: fsdev_ss)<=
br>
&gt; <br>
&gt;=C2=A0 if have_virtfs_proxy_helper<br>
&gt;=C2=A0 =C2=A0 executable(&#39;virtfs-proxy-helper&#39;,<br>
&gt; diff --git a/meson.build b/meson.build<br>
&gt; index 5f43355071..6b4adf7e15 100644<br>
&gt; --- a/meson.build<br>
&gt; +++ b/meson.build<br>
&gt; @@ -1421,17 +1421,23 @@ if not get_option(&#39;dbus_display&#39;).disa=
bled()<br>
&gt;=C2=A0 =C2=A0 endif<br>
&gt;=C2=A0 endif<br>
&gt; <br>
&gt; -have_virtfs =3D (targetos =3D=3D &#39;linux&#39; and<br>
&gt; +if targetos =3D=3D &#39;darwin&#39; and cc.has_function(&#39;pthread_=
fchdir_np&#39;)<br>
&gt; +=C2=A0 have_virtfs =3D have_system<br>
<br>
As you are going for a v5 anyway: I would add an error message here if <br>
pthread_fchdir_np() is not available. Because it is a bit frustrating for <=
br>
users if their options silently got ignored without any indication why.<br>
<br>
&gt; +else<br>
&gt; +=C2=A0 have_virtfs =3D (targetos =3D=3D &#39;linux&#39; and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 have_system and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 libattr.found() and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 libcap_ng.found())<br>
&gt; +endif<br>
&gt; <br>
&gt; -have_virtfs_proxy_helper =3D have_virtfs and have_tools<br>
&gt; +have_virtfs_proxy_helper =3D targetos =3D=3D &#39;linux&#39; and have=
_virtfs and<br>
&gt; have_tools<br>
&gt; <br>
&gt;=C2=A0 if get_option(&#39;virtfs&#39;).enabled()<br>
&gt;=C2=A0 =C2=A0 if not have_virtfs<br>
&gt; -=C2=A0 =C2=A0 if targetos !=3D &#39;linux&#39;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 error(&#39;virtio-9p (virtfs) requires Linux&#39=
;)<br>
&gt; +=C2=A0 =C2=A0 if targetos !=3D &#39;linux&#39; and targetos !=3D &#39=
;darwin&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 error(&#39;virtio-9p (virtfs) requires Linux or =
Darwin&#39;)<br>
&gt; +=C2=A0 =C2=A0 elif targetos =3D=3D &#39;darwin&#39; and not cc.has_fu=
nction(&#39;pthread_fchdir_np&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 error(&#39;virtio-9p (virtfs) on Darwin requires=
 the presence of<br>
&gt; pthread_fchdir_np&#39;) </blockquote><div><br></div><div>Does the erro=
r message here suffice for that need? Right now if they&#39;re running a sy=
stem without pthread_fchdir_np and don&#39;t specify the option, I think it=
&#39;ll just quietly disable, but if they --enable-virtfs and the function =
isn&#39;t there, they should get a note. I assume this is better, so that t=
he ability to compile isn&#39;t contingent on having the latest OS, even if=
 full support for older OSes isn&#39;t provided.<br></div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">elif not libcap_ng.found(=
) or not libattr.found()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 error(&#39;virtio-9p (virtfs) requires libc=
ap-ng-devel and<br>
&gt; libattr-devel&#39;) elif not have_system<br>
<br>
<br>
</blockquote></div></div>

--00000000000039a81805d76e89dd--


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B11D42DA1F3
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 21:51:37 +0100 (CET)
Received: from localhost ([::1]:43386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kouoi-0005aO-Oc
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 15:51:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1koulr-00041J-NK
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 15:48:39 -0500
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:35520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1koulp-0001OI-FQ
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 15:48:39 -0500
Received: by mail-ed1-x542.google.com with SMTP id u19so18679158edx.2
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 12:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1xi18+yo6tkDOfq25qrugMyHUHZLS9OPSu3i8Gx97Hk=;
 b=HN9FQ7N0L8VF+zt8Ve5uQQ4c/ri/4ApK1sqIjCfHjVM6he0qtzNaUS/Lt2cuJmV/ZV
 hPmK7noy4KZ7+Gd3ZZMMiutkaJyz7zJsG6WZP3VwePn+UOIBADc9qfq1si9wWfBl6sE4
 iwAyuo2lEjAy35vNvaLi6ZSzUks1BkJOUlBj23v2khxQ9XiABri4BvHZpJdWdCGgH6EC
 FLpYhqsdvyBdA21DZxn8Kg7eFmKMERGLmmkGPvdEQ4cQN5vHweaEu/+EL48PsP5JrPGV
 xPGPkrAM6l4iRza1tUFWk2+IWofmciaYdvOLOBzLWenpDgFaDrkTslh8ROAIT9ZTDwfP
 9BOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1xi18+yo6tkDOfq25qrugMyHUHZLS9OPSu3i8Gx97Hk=;
 b=r6cY/xQHDUknJOju6ByOPYS/ACt8QNic7zB9QVnCWSj8CzAfJ6G83Z+P/SReB0M8KD
 gDQerrVUpm9TF0xkdF6v5JFdYXKLOdtnAEKPo29ezcrTW6LXboGkK6kFqCagN49Wicr3
 9afj7KtnlmegQ+3QXtcsSv8ucN+zUt7VRO1yfRRLvnEJrhR4vvWgwCfRqp78z5c5dOP/
 VVGu7/j93jjBwZLvptQoj05o30ZszOmk03YECyeWleI28wqfprRx1d9haAJQp5kG/NmK
 n5ZoACIh50wpKXAdHArQHc2mq/lXK+UhnabNDUBc4yKZd6HuWrfu2joyPMPyFp/4dztJ
 gn/A==
X-Gm-Message-State: AOAM532T6PIEmPjYz0s/7vL7g/EARR/37eQ+7GJ0Hd9q7jsaVGChk/0+
 zFK4FS6rULSrV8olTBbsOxjjPuJ+VNADM5vtPyo=
X-Google-Smtp-Source: ABdhPJw4vjDXhHjr++5zRwipd/TTuC+yWUiht0K4+1fP2/LepedYUH8AQ9mJOQN2Um9tdpZUrK9nt3EWjyQ6bJ8ctd4=
X-Received: by 2002:a05:6402:44b:: with SMTP id
 p11mr26674074edw.164.1607978915810; 
 Mon, 14 Dec 2020 12:48:35 -0800 (PST)
MIME-Version: 1.0
References: <20201212090834.1126274-1-marcandre.lureau@redhat.com>
 <c222007a-63af-2cc1-cae4-c2ca7fb58ccd@redhat.com>
 <CAJ+F1C+rDQDPNN5e4EVG4h1ovoGYDqRVSAShPeFSis0RfEE2hA@mail.gmail.com>
In-Reply-To: <CAJ+F1C+rDQDPNN5e4EVG4h1ovoGYDqRVSAShPeFSis0RfEE2hA@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 15 Dec 2020 00:48:23 +0400
Message-ID: <CAJ+F1CJq3oqB8uqSw6FDBB3zNfzw6G_xsp44UnrTquvbeivUPQ@mail.gmail.com>
Subject: Re: [PATCH] libvhost-user: add a link-static option
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000015506c05b672c4b9"
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x542.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, QEMU <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000015506c05b672c4b9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 14, 2020 at 9:07 PM Marc-Andr=C3=A9 Lureau <
marcandre.lureau@gmail.com> wrote:

>
>
> On Mon, Dec 14, 2020 at 8:23 PM Paolo Bonzini <pbonzini@redhat.com> wrote=
:
>
>> On 12/12/20 10:08, marcandre.lureau@redhat.com wrote:
>> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> >
>> > Fix linking vhost-user binaries with with ./configure -static.
>> >
>> > Fixes: 0df750e9d3a5fea5e1 ("libvhost-user: make it a meson subproject"=
)
>> > Reported-by: Peter Maydell <peter.maydell@linaro.org>
>> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> > ---
>> >   configure                                   | 1 +
>> >   subprojects/libvhost-user/meson.build       | 3 ++-
>> >   subprojects/libvhost-user/meson_options.txt | 5 +++++
>> >   3 files changed, 8 insertions(+), 1 deletion(-)
>> >   create mode 100644 subprojects/libvhost-user/meson_options.txt
>> >
>> > diff --git a/configure b/configure
>> > index 18c26e0389..465f7bb150 100755
>> > --- a/configure
>> > +++ b/configure
>> > @@ -7014,6 +7014,7 @@ NINJA=3D$ninja $meson setup \
>> >           -Diconv=3D$iconv -Dcurses=3D$curses -Dlibudev=3D$libudev\
>> >           -Ddocs=3D$docs -Dsphinx_build=3D$sphinx_build
>> -Dinstall_blobs=3D$blobs \
>> >           -Dvhost_user_blk_server=3D$vhost_user_blk_server \
>> > +        -Dlibvhost-user:link-static=3D$(if test "$static" =3D yes; th=
en
>> echo true; else echo false; fi) \
>> >           $cross_arg \
>> >           "$PWD" "$source_path"
>> >
>> > diff --git a/subprojects/libvhost-user/meson.build
>> b/subprojects/libvhost-user/meson.build
>> > index c5d85c11d7..5a9cc8675e 100644
>> > --- a/subprojects/libvhost-user/meson.build
>> > +++ b/subprojects/libvhost-user/meson.build
>> > @@ -2,7 +2,8 @@ project('libvhost-user', 'c',
>> >           license: 'GPL-2.0-or-later',
>> >           default_options: ['c_std=3Dgnu99'])
>> >
>> > -glib =3D dependency('glib-2.0')
>> > +link_static =3D get_option('link-static')
>> > +glib =3D dependency('glib-2.0', static: link_static)
>> >   inc =3D include_directories('../../include', '../../linux-headers')
>> >
>> >   vhost_user =3D static_library('vhost-user',
>> > diff --git a/subprojects/libvhost-user/meson_options.txt
>> b/subprojects/libvhost-user/meson_options.txt
>> > new file mode 100644
>> > index 0000000000..03fe088e36
>> > --- /dev/null
>> > +++ b/subprojects/libvhost-user/meson_options.txt
>> > @@ -0,0 +1,5 @@
>> > +option('link-static',
>> > +  type: 'boolean',
>> > +  value: false,
>> > +)
>> > +
>>
>> No, this is wrong.  We need to use the results of the configure test
>> uniformly until we can move it to meson.build.
>>
>> Ask yourself if you'd like to have this option in a standalone project,
>>
>
> I took the option from a meson test case:
>
> https://github.com/mesonbuild/meson/blob/master/test%20cases/frameworks/1=
5%20llvm/meson.build
>
> the answer most likely is no...  Can you use override_dependency from
>> the toplevel meson.build instead?  It's usually meant for
>> sub->superproject, but we can use it in this case as well I think.
>>
>>
> ok I'll try
>
>
Adding:
 meson.override_dependency('glib-2.0', dependency('glib-2.0', static:
enable_static))

just before the "vhost_user =3D not_found..." works. Is that what you had i=
n
mind?


> --
> Marc-Andr=C3=A9 Lureau
>


--=20
Marc-Andr=C3=A9 Lureau

--00000000000015506c05b672c4b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 14, 2020 at 9:07 PM Marc-=
Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@gmail.com">marcand=
re.lureau@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 14, 20=
20 at 8:23 PM Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" targ=
et=3D"_blank">pbonzini@redhat.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On 12/12/20 10:08, <a href=3D"mailto:marca=
ndre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a> w=
rote:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; Fix linking vhost-user binaries with with ./configure -static.<br>
&gt; <br>
&gt; Fixes: 0df750e9d3a5fea5e1 (&quot;libvhost-user: make it a meson subpro=
ject&quot;)<br>
&gt; Reported-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.=
org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 =C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 1 +<br>
&gt;=C2=A0 =C2=A0subprojects/libvhost-user/meson.build=C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 3 ++-<br>
&gt;=C2=A0 =C2=A0subprojects/libvhost-user/meson_options.txt | 5 +++++<br>
&gt;=C2=A0 =C2=A03 files changed, 8 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 subprojects/libvhost-user/meson_options=
.txt<br>
&gt; <br>
&gt; diff --git a/configure b/configure<br>
&gt; index 18c26e0389..465f7bb150 100755<br>
&gt; --- a/configure<br>
&gt; +++ b/configure<br>
&gt; @@ -7014,6 +7014,7 @@ NINJA=3D$ninja $meson setup \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Diconv=3D$iconv -Dcurses=3D$c=
urses -Dlibudev=3D$libudev\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Ddocs=3D$docs -Dsphinx_build=
=3D$sphinx_build -Dinstall_blobs=3D$blobs \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dvhost_user_blk_server=3D$vho=
st_user_blk_server \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dlibvhost-user:link-static=3D$(if test &=
quot;$static&quot; =3D yes; then echo true; else echo false; fi) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$cross_arg \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;$PWD&quot; &quot;$source=
_path&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; diff --git a/subprojects/libvhost-user/meson.build b/subprojects/libvh=
ost-user/meson.build<br>
&gt; index c5d85c11d7..5a9cc8675e 100644<br>
&gt; --- a/subprojects/libvhost-user/meson.build<br>
&gt; +++ b/subprojects/libvhost-user/meson.build<br>
&gt; @@ -2,7 +2,8 @@ project(&#39;libvhost-user&#39;, &#39;c&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0license: &#39;GPL-2.0-or-later=
&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default_options: [&#39;c_std=
=3Dgnu99&#39;])<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -glib =3D dependency(&#39;glib-2.0&#39;)<br>
&gt; +link_static =3D get_option(&#39;link-static&#39;)<br>
&gt; +glib =3D dependency(&#39;glib-2.0&#39;, static: link_static)<br>
&gt;=C2=A0 =C2=A0inc =3D include_directories(&#39;../../include&#39;, &#39;=
../../linux-headers&#39;)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0vhost_user =3D static_library(&#39;vhost-user&#39;,<br>
&gt; diff --git a/subprojects/libvhost-user/meson_options.txt b/subprojects=
/libvhost-user/meson_options.txt<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..03fe088e36<br>
&gt; --- /dev/null<br>
&gt; +++ b/subprojects/libvhost-user/meson_options.txt<br>
&gt; @@ -0,0 +1,5 @@<br>
&gt; +option(&#39;link-static&#39;,<br>
&gt; +=C2=A0 type: &#39;boolean&#39;,<br>
&gt; +=C2=A0 value: false,<br>
&gt; +)<br>
&gt; +<br>
<br>
No, this is wrong.=C2=A0 We need to use the results of the configure test <=
br>
uniformly until we can move it to meson.build.<br>
<br>
Ask yourself if you&#39;d like to have this option in a standalone project,=
 <br></blockquote><div><br></div><div>I took the option from a meson test c=
ase:<br></div><div><a href=3D"https://github.com/mesonbuild/meson/blob/mast=
er/test%20cases/frameworks/15%20llvm/meson.build" target=3D"_blank">https:/=
/github.com/mesonbuild/meson/blob/master/test%20cases/frameworks/15%20llvm/=
meson.build</a></div><div> <br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
the answer most likely is no...=C2=A0 Can you use override_dependency from =
<br>
the toplevel meson.build instead?=C2=A0 It&#39;s usually meant for <br>
sub-&gt;superproject, but we can use it in this case as well I think.<br>
<br></blockquote><div><br></div><div>ok I&#39;ll try <br></div></div><br cl=
ear=3D"all"></div></blockquote><div><br></div><div>Adding:<br></div><div>=
=C2=A0meson.override_dependency(&#39;glib-2.0&#39;, dependency(&#39;glib-2.=
0&#39;, static: enable_static))</div><div><br></div><div>just before the &q=
uot;vhost_user =3D not_found...&quot; works. Is that what you had in mind?<=
/div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div =
dir=3D"ltr"><br>-- <br><div dir=3D"ltr">Marc-Andr=C3=A9 Lureau<br></div></d=
iv>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000015506c05b672c4b9--


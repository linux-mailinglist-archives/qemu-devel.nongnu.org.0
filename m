Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF47C452B47
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 08:06:53 +0100 (CET)
Received: from localhost ([::1]:60016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmsYO-0004EO-Cr
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 02:06:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mmsXN-0003UK-KX
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 02:05:49 -0500
Received: from [2a00:1450:4864:20::42b] (port=38571
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mmsXH-0003co-67
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 02:05:49 -0500
Received: by mail-wr1-x42b.google.com with SMTP id u18so35529797wrg.5
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 23:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GKl44/ax78xL1PZnFbchetHh1Axn7qTE2C7Tw5tDG88=;
 b=ApxUmUZ5j+1+2cs+H/x+IPZiOMJlYLSP1/RiC6uiANjvWZubwkAkBMgcq71Zi/sI+g
 1uK9SF6mnltoEGgaKdgF8YZU3FJtKfG9OstEXy7aqJ0KIp4diVm+ZsTqec8dW6YguwHs
 sDiQSUxP+Ljxe6lj781UXkjYIEWIiRHt1C91kyaW8+PNtxADKJdX+MQBH9CJ8EyXHL+r
 lt00lWq67vfzSPQThAzHlwhCX0SQ1CwcwUYvHmm/H5VqwP/DtQz5Na1gFlckfm4Rutzv
 KKncvRcP6iF9I14wMTCco6F+dXe0z6HUvUOj2THTVZjgYpp3pFpBzB/QOyQgntppFFRe
 PhgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GKl44/ax78xL1PZnFbchetHh1Axn7qTE2C7Tw5tDG88=;
 b=vbmGcbYk5i9BmrrXbypEE/EmG4R3qpdrKi+Kz5MY+f8zTx1ZBbbd5FpaCHP3Oju3CW
 VmmMATGzBH1BUzUxEhQBRZxlvnIfMZf4zQvPk7fZQ8iDGciIMY9n9nyP14SwB0dNspB6
 Mho1rGh6I4nlC9ByBfHX3YBb1bJDDiocz6pMLb75mwPj+0bQI569/c9MrzJeXdVc0vbq
 /9GcoMbVZm8nFURDz0dToTVb+c1JZcwZFbAtAVjgw3pfJuISyeok3KEi1QSp+uAoHRc9
 AFyvU0TpNR40BLIrzrsQUNFoj1130S8W6j3xCjMWulSCaTNhlPoKaewxGoDy4K9Lx15J
 hbGg==
X-Gm-Message-State: AOAM5320b8qyr9p1RxDvaky7QpceBurFQ7+UWaKMP75RiYoIsTh9jmef
 nAY7YAR1trm6nw05LJ6INvF3vDMOe14goACt0iE=
X-Google-Smtp-Source: ABdhPJyD05T1HAyUxq3AXN9ZMH1Q52Rd0O/VZ86VohTXlxyNC5oCIrBMtcA0i+WRppJi9yVJqDSAyy8lVxpzCfwxkLo=
X-Received: by 2002:a05:6000:128b:: with SMTP id
 f11mr6423379wrx.70.1637046340155; 
 Mon, 15 Nov 2021 23:05:40 -0800 (PST)
MIME-Version: 1.0
References: <20211115140623.104116-1-thuth@redhat.com>
 <cba3524e-00d2-08b1-582f-1f31163fecf0@amsat.org>
In-Reply-To: <cba3524e-00d2-08b1-582f-1f31163fecf0@amsat.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 16 Nov 2021 11:05:27 +0400
Message-ID: <CAJ+F1C+kTL_thUHtaQ1pxPN360E39aYA81m=8efaYrKhzXyaFw@mail.gmail.com>
Subject: Re: [PATCH] gitlab-ci: Test compilation on Windows with MSYS2
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="00000000000095fd0305d0e28d15"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Yonggang Luo <luoyonggang@gmail.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000095fd0305d0e28d15
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Nov 15, 2021 at 6:31 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
wrote:

> On 11/15/21 15:06, Thomas Huth wrote:
> > Gitlab also provides runners with Windows, we can use them to
> > test compilation with MSYS2, in both, 64-bit and 32-bit.
> >
> > However, it takes quite a long time to set up the VM, so to
> > stay in the 1h time frame, we can only compile and check one
> > target here.
>

I wonder why gitlab does not offer the docker executor. On the freedesktop
gitlab instance, they have windows docker executor, which speeds up the
build time. Maybe we could also have our own Windows runner for qemu?

>
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > ---
> >  "make check" recently broke on MSYS2, and nobody noticed since
> apparently
> >  hardly anybody looks at the cirrus-CI output ... so here's another try
> >  to get some more test coverage in this area in the gitlab-CI instead.
> >  Patch needs to be applied after the "tests/unit/test-smp-parse:
> >  Make an unified name for the tested machine" patch to get "make check"
> >  fixed first.
> >
> >  RFC -> v1:
> >  - Use cache to speed up installation a little bit
> >  - Add a 32-bit builder, too
> >
> >  .gitlab-ci.d/qemu-project.yml |  1 +
> >  .gitlab-ci.d/windows.yml      | 98 +++++++++++++++++++++++++++++++++++
> >  2 files changed, 99 insertions(+)
> >  create mode 100644 .gitlab-ci.d/windows.yml
> >
> > diff --git a/.gitlab-ci.d/qemu-project.yml
> b/.gitlab-ci.d/qemu-project.yml
> > index b3d79bc429..871262fe0e 100644
> > --- a/.gitlab-ci.d/qemu-project.yml
> > +++ b/.gitlab-ci.d/qemu-project.yml
> > @@ -11,3 +11,4 @@ include:
> >    - local: '/.gitlab-ci.d/static_checks.yml'
> >    - local: '/.gitlab-ci.d/custom-runners.yml'
> >    - local: '/.gitlab-ci.d/cirrus.yml'
> > +  - local: '/.gitlab-ci.d/windows.yml'
> > diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
> > new file mode 100644
> > index 0000000000..309f7e7fb8
> > --- /dev/null
> > +++ b/.gitlab-ci.d/windows.yml
> > @@ -0,0 +1,98 @@
> > +.shared_msys2_builder:
> > +  tags:
> > +  - shared-windows
> > +  - windows
> > +  - windows-1809
> > +  cache:
> > +    key: "${CI_JOB_NAME}-cache"
>
> It would be nice to cache the shared 'before_script' part,
> but it doesn't seems trivial; meanwhile this patch works and
> is KISS, so:
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> > +    paths:
> > +      - ${CI_PROJECT_DIR}/msys64/var/cache
> > +  needs: []
> > +  stage: build
> > +  timeout: 70m
> > +  before_script:
> > +  - If ( !(Test-Path -Path msys64\var\cache ) ) {
> > +      mkdir msys64\var\cache
> > +    }
> > +  - If ( !(Test-Path -Path msys64\var\cache\msys2.exe ) ) {
> > +      Invoke-WebRequest
> > +      "
> https://github.com/msys2/msys2-installer/releases/download/2021-07-25/msy=
s2-base-x86_64-20210725.sfx.exe
> "
> > +      -outfile "msys64\var\cache\msys2.exe"
> > +    }
> > +  - msys64\var\cache\msys2.exe -y
> > +  - ((Get-Content -path .\msys64\etc\\post-install\\07-pacman-key.post
> -Raw)
> > +      -replace '--refresh-keys', '--version') |
> > +     Set-Content -Path ${CI_PROJECT_DIR}\msys64\etc\\post-install\\
> 07-pacman-key.post
> > +  - .\msys64\usr\bin\bash -lc "sed -i 's/^CheckSpace/#CheckSpace/g'
> /etc/pacman.conf"
> > +  - .\msys64\usr\bin\bash -lc 'pacman --noconfirm -Syuu'  # Core updat=
e
> > +  - .\msys64\usr\bin\bash -lc 'pacman --noconfirm -Syuu'  # Normal
> update
> > +  - taskkill /F /FI "MODULES eq msys-2.0.dll"
> > +
> > +msys2-64bit:
> > +  extends: .shared_msys2_builder
> > +  script:
> > +  - .\msys64\usr\bin\bash -lc "pacman -Sy --noconfirm --needed
> > +      diffutils git grep make sed
> > +      mingw-w64-x86_64-capstone
> [...]
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000095fd0305d0e28d15
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 15, 2021 at 6:31 PM Phi=
lippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat=
.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On 11/15/21 15:06, Thomas Huth wrote:<br>
&gt; Gitlab also provides runners with Windows, we can use them to<br>
&gt; test compilation with MSYS2, in both, 64-bit and 32-bit.<br>
&gt; <br>
&gt; However, it takes quite a long time to set up the VM, so to<br>
&gt; stay in the 1h time frame, we can only compile and check one<br>
&gt; target here.<br></blockquote><div><br></div><div>I wonder why gitlab d=
oes not offer the docker executor. On the freedesktop gitlab instance, they=
 have windows docker executor, which speeds up the build time. Maybe we cou=
ld also have our own Windows runner for qemu?<br></div><div> <br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
&gt; <br>
&gt; Signed-off-by: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" tar=
get=3D"_blank">thuth@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 &quot;make check&quot; recently broke on MSYS2, and nobody notic=
ed since apparently<br>
&gt;=C2=A0 hardly anybody looks at the cirrus-CI output ... so here&#39;s a=
nother try<br>
&gt;=C2=A0 to get some more test coverage in this area in the gitlab-CI ins=
tead.<br>
&gt;=C2=A0 Patch needs to be applied after the &quot;tests/unit/test-smp-pa=
rse:<br>
&gt;=C2=A0 Make an unified name for the tested machine&quot; patch to get &=
quot;make check&quot;<br>
&gt;=C2=A0 fixed first.<br>
&gt; <br>
&gt;=C2=A0 RFC -&gt; v1:<br>
&gt;=C2=A0 - Use cache to speed up installation a little bit<br>
&gt;=C2=A0 - Add a 32-bit builder, too<br>
&gt; <br>
&gt;=C2=A0 .gitlab-ci.d/qemu-project.yml |=C2=A0 1 +<br>
&gt;=C2=A0 .gitlab-ci.d/windows.yml=C2=A0 =C2=A0 =C2=A0 | 98 ++++++++++++++=
+++++++++++++++++++++<br>
&gt;=C2=A0 2 files changed, 99 insertions(+)<br>
&gt;=C2=A0 create mode 100644 .gitlab-ci.d/windows.yml<br>
&gt; <br>
&gt; diff --git a/.gitlab-ci.d/qemu-project.yml b/.gitlab-ci.d/qemu-project=
.yml<br>
&gt; index b3d79bc429..871262fe0e 100644<br>
&gt; --- a/.gitlab-ci.d/qemu-project.yml<br>
&gt; +++ b/.gitlab-ci.d/qemu-project.yml<br>
&gt; @@ -11,3 +11,4 @@ include:<br>
&gt;=C2=A0 =C2=A0 - local: &#39;/.gitlab-ci.d/static_checks.yml&#39;<br>
&gt;=C2=A0 =C2=A0 - local: &#39;/.gitlab-ci.d/custom-runners.yml&#39;<br>
&gt;=C2=A0 =C2=A0 - local: &#39;/.gitlab-ci.d/cirrus.yml&#39;<br>
&gt; +=C2=A0 - local: &#39;/.gitlab-ci.d/windows.yml&#39;<br>
&gt; diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..309f7e7fb8<br>
&gt; --- /dev/null<br>
&gt; +++ b/.gitlab-ci.d/windows.yml<br>
&gt; @@ -0,0 +1,98 @@<br>
&gt; +.shared_msys2_builder:<br>
&gt; +=C2=A0 tags:<br>
&gt; +=C2=A0 - shared-windows<br>
&gt; +=C2=A0 - windows<br>
&gt; +=C2=A0 - windows-1809<br>
&gt; +=C2=A0 cache:<br>
&gt; +=C2=A0 =C2=A0 key: &quot;${CI_JOB_NAME}-cache&quot;<br>
<br>
It would be nice to cache the shared &#39;before_script&#39; part,<br>
but it doesn&#39;t seems trivial; meanwhile this patch works and<br>
is KISS, so:<br>
<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.=
org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
<br>
&gt; +=C2=A0 =C2=A0 paths:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - ${CI_PROJECT_DIR}/msys64/var/cache<br>
&gt; +=C2=A0 needs: []<br>
&gt; +=C2=A0 stage: build<br>
&gt; +=C2=A0 timeout: 70m<br>
&gt; +=C2=A0 before_script:<br>
&gt; +=C2=A0 - If ( !(Test-Path -Path msys64\var\cache ) ) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 mkdir msys64\var\cache<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 - If ( !(Test-Path -Path msys64\var\cache\msys2.exe ) ) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 Invoke-WebRequest<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 &quot;<a href=3D"https://github.com/msys2/msys2-=
installer/releases/download/2021-07-25/msys2-base-x86_64-20210725.sfx.exe" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/msys2/msys2-install=
er/releases/download/2021-07-25/msys2-base-x86_64-20210725.sfx.exe</a>&quot=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 -outfile &quot;msys64\var\cache\msys2.exe&quot;<=
br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 - msys64\var\cache\msys2.exe -y<br>
&gt; +=C2=A0 - ((Get-Content -path .\msys64\etc\\post-install\\<a href=3D"h=
ttp://07-pacman-key.post" rel=3D"noreferrer" target=3D"_blank">07-pacman-ke=
y.post</a> -Raw)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 -replace &#39;--refresh-keys&#39;, &#39;--versio=
n&#39;) |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0Set-Content -Path ${CI_PROJECT_DIR}\msys64\etc\\p=
ost-install\\<a href=3D"http://07-pacman-key.post" rel=3D"noreferrer" targe=
t=3D"_blank">07-pacman-key.post</a><br>
&gt; +=C2=A0 - .\msys64\usr\bin\bash -lc &quot;sed -i &#39;s/^CheckSpace/#C=
heckSpace/g&#39; /etc/pacman.conf&quot;<br>
&gt; +=C2=A0 - .\msys64\usr\bin\bash -lc &#39;pacman --noconfirm -Syuu&#39;=
=C2=A0 # Core update<br>
&gt; +=C2=A0 - .\msys64\usr\bin\bash -lc &#39;pacman --noconfirm -Syuu&#39;=
=C2=A0 # Normal update<br>
&gt; +=C2=A0 - taskkill /F /FI &quot;MODULES eq msys-2.0.dll&quot;<br>
&gt; +<br>
&gt; +msys2-64bit:<br>
&gt; +=C2=A0 extends: .shared_msys2_builder<br>
&gt; +=C2=A0 script:<br>
&gt; +=C2=A0 - .\msys64\usr\bin\bash -lc &quot;pacman -Sy --noconfirm --nee=
ded<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 diffutils git grep make sed<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 mingw-w64-x86_64-capstone<br>
[...]<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000095fd0305d0e28d15--


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FD7484B36
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 00:33:22 +0100 (CET)
Received: from localhost ([::1]:46564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4tIv-0006SP-3g
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 18:33:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n4tEQ-0001un-55
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 18:28:42 -0500
Received: from [2607:f8b0:4864:20::933] (port=37562
 helo=mail-ua1-x933.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n4tEO-0005HE-6H
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 18:28:41 -0500
Received: by mail-ua1-x933.google.com with SMTP id o1so65981198uap.4
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 15:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v8GI7Zh+WcbDzGgsyoXBASQS4G97hd4oUIxFzCWFq6A=;
 b=erpYVuWP17bJZbI4PDrgfne3lj+tuGl+eDztPuqR8kBrrJRhsArZDF9ynF5827pJd1
 RAiNPZRJyX1hw4mPkcVFnrmoLEA8yLUJk5UyxBSuR+n7ZdVVcvZBTLj2b6fKytVe51Ef
 AsGPXE+uEWW4MAmTAnR6qQUB46kBFSr6DFjbkySP5oUnwlU2DPpwEyCggu253CCWcI02
 0v+hxaMhHbpruUJ73lyLRJSSoKeCpclMrB99oJFjN6An4A/jzY6KXDYXBjuoPZq4xgN8
 SAD2LXyFctr0gEQOOMfCql8slSbjQyDK2fbnNMgKldxoeUvQ6bKwdSp/23vmrIrGAu5j
 dxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v8GI7Zh+WcbDzGgsyoXBASQS4G97hd4oUIxFzCWFq6A=;
 b=oVTyePOXmGAhjTeFZCtwo3KVhw2C387FOvyDs3KSA833WnsfredOfKdwESPElJCc/j
 sWq05IPHXlFn+jEGHPZDGDNLhg0QIaGQBdNVEM62aOeT6irku4yIbf8ZW2zgf1Xw3dMN
 Vl9xwzM1sa3g6eYyQjpsOTXlOfEQ01OLBM400xoTxNbLSYn4IfepISY580Qal/rgvwUx
 GqsIbFEF/T1df66I2YmARQexoaN/Ku+611ni+dA/z7SEh7KTQWyBklGPikhThZcnvvsn
 ajpgLsCffVYxBpSbVbyKNkzJBWYyfbM2IASCsGUMQEWxHsPR8OQ035Y9mhl0Cp9tnab1
 Vttw==
X-Gm-Message-State: AOAM530liiOveG7AQcWDRGvwqJrCBPPHDoNSsLMLSYKy3rvxmRmEHVrJ
 6nP4yNSXRRFn/6bBoFkE0P1j4BT8ZLoZvL3cvhv6cZ96O70=
X-Google-Smtp-Source: ABdhPJwuJ/Okztbm3n7x1HTdCJoDV0lMNn64zM4UH2V8whGW7hRmqm8gp5HKCEZD4tveAFjzcYhMCf+6QEY8XhxiSDM=
X-Received: by 2002:a67:f8cb:: with SMTP id c11mr16187475vsp.13.1641338917501; 
 Tue, 04 Jan 2022 15:28:37 -0800 (PST)
MIME-Version: 1.0
References: <20211127201846.64187-1-imp@bsdimp.com>
 <20211127201846.64187-6-imp@bsdimp.com>
 <2c5b2200-372b-000b-e7c8-95cc7c12b552@amsat.org>
In-Reply-To: <2c5b2200-372b-000b-e7c8-95cc7c12b552@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 4 Jan 2022 16:28:26 -0700
Message-ID: <CANCZdfpKZfhNcou8KkjWPdTvDDveCA6auFhUuuL-XLLrq6tCGg@mail.gmail.com>
Subject: Re: [PATCH for 7.0 5/5] bsd-user-smoke: Add to build
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="00000000000022512505d4c9fff7"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::933
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::933;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x933.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Gleb Popov <arrowd@freebsd.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Konrad Witaszczyk <def@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000022512505d4c9fff7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 4, 2022 at 4:25 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:

> +Paolo for meson
>
> On 11/27/21 21:18, Warner Losh wrote:
> > Add a simple bsd-user smoke test for ensuring bsd-user is minimally
> > functional. This runs only when bsd-user has been configured. It adds a
> > simple execution of 'hello world' type binaries for bsd-user. At the
> > present these are tiny, hand-crafted binaries that are statically linke=
d
> > and do not depend on any host libraries being present (they also take
> > advantage of the fact that on FreeBSD all system call numbers are
> > uniform on all architectures). This was done both for building and
> > testing simplicity, as well as recognizing the current state of bsd-use=
r
> > in qemu upstream is extremely basic.
> >
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >  tests/bsd-user-smoke/meson.build | 31 +++++++++++++++++++++++++++++++
> >  tests/meson.build                |  1 +
> >  2 files changed, 32 insertions(+)
> >  create mode 100644 tests/bsd-user-smoke/meson.build
> >
> > diff --git a/tests/bsd-user-smoke/meson.build
> b/tests/bsd-user-smoke/meson.build
> > new file mode 100644
> > index 00000000000..586697ab3b6
> > --- /dev/null
> > +++ b/tests/bsd-user-smoke/meson.build
> > @@ -0,0 +1,31 @@
> > +if not have_bsd_user
> > +   subdir_done()
> > +endif
> > +
> > +smoke_bsd_user =3D find_program('smoke-bsd-user')
> > +
> > +bsd_user_archs =3D [ 'armv7', 'amd64', 'i386' ]
> > +targs =3D []
> > +foreach i : bsd_user_archs
> > +    h =3D 'h.' + i
> > +    targs +=3D custom_target('bsd-user h.' + i,
> > +        output : h,
> > +     input : h + '.S',
> > +     command : ['clang',
>
> Do we want a find_program(clang) somewhere?
>

I am new and naive in the ways of meson... :) I am willing, however, to
learn...
Is it just s/'clang'/find_program(clang)/ here or something more complex...=
.


> > +         '-target',
> > +         i + '-unknown-freebsd14.0',
>
> Also, I wonder if this trailer shouldn=C2=B4t be populated by meson.
>

I like that idea. See above :)

Warner


> > +         '-o',
> > +         '@OUTPUT@',
> > +         '@INPUT@',
> > +         '-nostdlib',
> > +         '-Wl,-e',
> > +         '-Wl,qemu_start',
> > +         '-static'],
> > +     install : false)
> > +endforeach
> > +
> > +test('bsd-user-smoke', smoke_bsd_user,
> > +    args: [meson.project_build_root(), meson.current_build_dir()],
> > +    suite: 'smoke',
> > +    depends: targs
> > +)
> > diff --git a/tests/meson.build b/tests/meson.build
> > index 3f3882748ae..3b95efe8896 100644
> > --- a/tests/meson.build
> > +++ b/tests/meson.build
> > @@ -1,6 +1,7 @@
> >  py3 =3D import('python').find_installation()
> >
> >  subdir('bench')
> > +subdir('bsd-user-smoke')
> >
> >  test_qapi_outputs =3D [
> >    'qapi-builtin-types.c',
>

--00000000000022512505d4c9fff7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 4, 2022 at 4:25 PM Philip=
pe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>+Paolo for meson<br>
<br>
On 11/27/21 21:18, Warner Losh wrote:<br>
&gt; Add a simple bsd-user smoke test for ensuring bsd-user is minimally<br=
>
&gt; functional. This runs only when bsd-user has been configured. It adds =
a<br>
&gt; simple execution of &#39;hello world&#39; type binaries for bsd-user. =
At the<br>
&gt; present these are tiny, hand-crafted binaries that are statically link=
ed<br>
&gt; and do not depend on any host libraries being present (they also take<=
br>
&gt; advantage of the fact that on FreeBSD all system call numbers are<br>
&gt; uniform on all architectures). This was done both for building and<br>
&gt; testing simplicity, as well as recognizing the current state of bsd-us=
er<br>
&gt; in qemu upstream is extremely basic.<br>
&gt; <br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 tests/bsd-user-smoke/meson.build | 31 ++++++++++++++++++++++++++=
+++++<br>
&gt;=C2=A0 tests/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 2 files changed, 32 insertions(+)<br>
&gt;=C2=A0 create mode 100644 tests/bsd-user-smoke/meson.build<br>
&gt; <br>
&gt; diff --git a/tests/bsd-user-smoke/meson.build b/tests/bsd-user-smoke/m=
eson.build<br>
&gt; new file mode 100644<br>
&gt; index 00000000000..586697ab3b6<br>
&gt; --- /dev/null<br>
&gt; +++ b/tests/bsd-user-smoke/meson.build<br>
&gt; @@ -0,0 +1,31 @@<br>
&gt; +if not have_bsd_user<br>
&gt; +=C2=A0 =C2=A0subdir_done()<br>
&gt; +endif<br>
&gt; +<br>
&gt; +smoke_bsd_user =3D find_program(&#39;smoke-bsd-user&#39;)<br>
&gt; +<br>
&gt; +bsd_user_archs =3D [ &#39;armv7&#39;, &#39;amd64&#39;, &#39;i386&#39;=
 ]<br>
&gt; +targs =3D []<br>
&gt; +foreach i : bsd_user_archs<br>
&gt; +=C2=A0 =C2=A0 h =3D &#39;h.&#39; + i<br>
&gt; +=C2=A0 =C2=A0 targs +=3D custom_target(&#39;bsd-user h.&#39; + i,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 output : h,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0input : h + &#39;.S&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0command : [&#39;clang&#39;,<br>
<br>
Do we want a find_program(clang) somewhere?<br></blockquote><div><br></div>=
<div>I am new and naive in the ways of meson... :) I am willing, however, t=
o learn...</div><div>Is it just s/&#39;clang&#39;/find_program(clang)/ here=
 or something more complex....</div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-target&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i + &#39;-unknown-freebsd14.0&#39;,=
<br>
<br>
Also, I wonder if this trailer shouldn=C2=B4t be populated by meson.<br></b=
lockquote><div><br></div><div>I like that idea. See above :)</div><div><br>=
</div><div>Warner</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-o&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;@OUTPUT@&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;@INPUT@&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-nostdlib&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-Wl,-e&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-Wl,qemu_start&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-static&#39;],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0install : false)<br>
&gt; +endforeach<br>
&gt; +<br>
&gt; +test(&#39;bsd-user-smoke&#39;, smoke_bsd_user,<br>
&gt; +=C2=A0 =C2=A0 args: [meson.project_build_root(), meson.current_build_=
dir()],<br>
&gt; +=C2=A0 =C2=A0 suite: &#39;smoke&#39;,<br>
&gt; +=C2=A0 =C2=A0 depends: targs<br>
&gt; +)<br>
&gt; diff --git a/tests/meson.build b/tests/meson.build<br>
&gt; index 3f3882748ae..3b95efe8896 100644<br>
&gt; --- a/tests/meson.build<br>
&gt; +++ b/tests/meson.build<br>
&gt; @@ -1,6 +1,7 @@<br>
&gt;=C2=A0 py3 =3D import(&#39;python&#39;).find_installation()<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 subdir(&#39;bench&#39;)<br>
&gt; +subdir(&#39;bsd-user-smoke&#39;)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 test_qapi_outputs =3D [<br>
&gt;=C2=A0 =C2=A0 &#39;qapi-builtin-types.c&#39;,<br>
</blockquote></div></div>

--00000000000022512505d4c9fff7--


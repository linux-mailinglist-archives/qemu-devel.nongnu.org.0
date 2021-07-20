Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 076333CF97C
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 14:22:16 +0200 (CEST)
Received: from localhost ([::1]:48722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5olL-0001IS-2x
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 08:22:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m5ojf-0000VI-08
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 08:20:31 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:33374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m5ojc-00033c-MV
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 08:20:30 -0400
Received: by mail-ed1-x52d.google.com with SMTP id dj21so28296634edb.0
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 05:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BJm6V/aucfl5uK5HsKViO2HGzjABBk3kTTqaZAhR1Fw=;
 b=tgltD24rFs0yzt686+dHl/vOB2b6dHN+gXJ+vYuAp05ODNn1yBwLcWAcdfLp5yDZnT
 OUx7kgEjinGeUJxPwOlvh5SQkI0T6ZtzMl/7tyHA1u+FpdOUJdJvf/4KgmWaxZvTSkcp
 nXOXGCLtWdJzuQHycO4WVwcz/TfWkId9S7EBZeshc3Bqb0DqLt97rBsLlo8SAJdWb6pL
 3UuS07HRqk7ysi0TW+gIDTDR6W8CNmW5qmNCPayeg5ZlyPu7cIRabmKjpvRRuXEg6gL6
 D4GLG4TFbDDSss6jjiMjVpFZicdzKe2dSl7zoRAmv3NYG5h9kJvFm+TBJg+GHL+wWq8b
 3jiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BJm6V/aucfl5uK5HsKViO2HGzjABBk3kTTqaZAhR1Fw=;
 b=VrBjDxK4rU9jtsP4f7tOAvtKb55DSRx5YPKlUNXnywsjeDwEON9J9kcqY+zf0c0HGb
 eiGsRpJLhrQQMSDRrT2ulwqn6nSI2b30fjeDD/FeOxxzbF3e9+5Ra8QmaS6Yhz4Dg8kf
 ypCfzFQYEiDGjci2bCnvhDm2zNpwuCccB+P44TthpW7+t828YZ9AHTMOmsdcrGdPHR11
 vbnpsawlKmHP5evmGk3H1GifK/oeG/lebB4YV8RL0/oH0Cq34wvsbdixx9SEWxkm7W39
 xIK9NgoulgqV7bLna637G5UcYLUgpu53rbCeWUR6nFq1wyUtwCFKuQbFojWMBUjys9EU
 xo9g==
X-Gm-Message-State: AOAM530GrFIQG6TKDPZEF+x7DEBW901TDBZM1OLjD9EwTD2yQdBoFQEP
 DhqwvKaIyMEMlww3laSxlO9m55CezXLMIkhtH0k=
X-Google-Smtp-Source: ABdhPJy0Oo251Cral5IudABrP09b3eICq6nS3RJp1zD/G8lvB+yrXYxUT+Xf1BhUoh4KfHIlIwcS+kpY3iiy1ZY9hXU=
X-Received: by 2002:a50:fe95:: with SMTP id d21mr40434778edt.257.1626783625612; 
 Tue, 20 Jul 2021 05:20:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1626675354.git.elena.ufimtseva@oracle.com>
 <cover.1626722742.git.jag.raman@oracle.com>
 <5002d6a67cb6c429b2e3d21e106b468176e82a1f.1626722742.git.jag.raman@oracle.com>
 <20210719202409.GB1443636@movementarian.org>
 <0268673C-D5FD-4288-B7E6-B4B6D3CCCD23@oracle.com>
In-Reply-To: <0268673C-D5FD-4288-B7E6-B4B6D3CCCD23@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 20 Jul 2021 16:20:13 +0400
Message-ID: <CAJ+F1CKkPV7GtR0NobyXm3SuR7ohde5Z8HdDGeogeqYSAj+-mw@mail.gmail.com>
Subject: Re: [PATCH RFC server 01/11] vfio-user: build library
To: Jag Raman <jag.raman@oracle.com>
Content-Type: multipart/alternative; boundary="00000000000021903305c78d149d"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x52d.google.com
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>, John Levon <john.levon@nutanix.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "f4bug@amsat.org" <f4bug@amsat.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000021903305c78d149d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Jul 20, 2021 at 4:12 PM Jag Raman <jag.raman@oracle.com> wrote:

>
>
> > On Jul 19, 2021, at 4:24 PM, John Levon <john.levon@nutanix.com> wrote:
> >
> > On Mon, Jul 19, 2021 at 04:00:03PM -0400, Jagannathan Raman wrote:
> >
> >> add the libvfio-user library as a submodule. build it as part of QEMU
> >>
> >> diff --git a/meson.build b/meson.build
> >> index 6e4d2d8..f2f9f86 100644
> >> --- a/meson.build
> >> +++ b/meson.build
> >> @@ -1894,6 +1894,41 @@ if get_option('cfi') and slirp_opt =3D=3D 'syst=
em'
> >>          + ' Please configure with --enable-slirp=3Dgit')
> >> endif
> >>
> >> +vfiouser =3D not_found
> >> +if have_system and multiprocess_allowed
> >> +  have_internal =3D fs.exists(meson.current_source_dir() /
> 'libvfio-user/Makefile')
> >> +
> >> +  if not have_internal
> >> +    error('libvfio-user source not found - please pull git submodule'=
)
> >> +  endif
> >> +
> >> +  vfiouser_files =3D [
> >> +    'libvfio-user/lib/dma.c',
> >> +    'libvfio-user/lib/irq.c',
> >> +    'libvfio-user/lib/libvfio-user.c',
> >> +    'libvfio-user/lib/migration.c',
> >> +    'libvfio-user/lib/pci.c',
> >> +    'libvfio-user/lib/pci_caps.c',
> >> +    'libvfio-user/lib/tran_sock.c',
> >> +  ]
> >> +
> >> +  vfiouser_inc =3D include_directories('libvfio-user/include',
> 'libvfio-user/lib')
> >> +
> >> +  json_c =3D dependency('json-c', required: false)
> >> +  if not json_c.found()
> >> +    json_c =3D dependency('libjson-c')
> >> +  endif
> >> +
> >> +  libvfiouser =3D static_library('vfiouser',
> >> +                               build_by_default: false,
> >> +                               sources: vfiouser_files,
> >> +                               dependencies: json_c,
> >> +                               include_directories: vfiouser_inc)
> >> +
> >> +  vfiouser =3D declare_dependency(link_with: libvfiouser,
> >> +                                include_directories: vfiouser_inc)
> >> +endif
> >
> > Why this way, rather than recursing into the submodule? Seems a bit
> fragile to
> > encode details of the library here.
>
> +maintainers of meson.build. I apologize for not adding them when I sent
> the
> patches out initially. I copied the email list from Elena, but Elena did
> not make
> any changes to meson.build - stupid me.
>
> John,
>
>     This way appears to be present convention with QEMU - I=E2=80=99m als=
o not
> very clear
> on the reason for it.
>
> For example submodules such as slirp (libslirp), capstone (libcapstone),
> dtc (libfdt) are built this way.
>

For slirp and dtc, we are eventually going to use meson subproject(). No
idea about capstone.

>
> I=E2=80=99m guessing it=E2=80=99s because QEMU doesn=E2=80=99t build all =
parts of a submodule. For
> example, QEMU only builds libfdt in the doc submodule. Similarly,
> libvfio-user only builds the core library without building the tests and
> samples.
>
>
You can give subproject options to build limited parts.

Fwiw, since libvfio-user uses cmake, we may be able to use meson
cmake.subproject() (https://mesonbuild.com/CMake-module.html).

--=20
Marc-Andr=C3=A9 Lureau

--00000000000021903305c78d149d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 20, 2021 at 4:12 PM Jag=
 Raman &lt;<a href=3D"mailto:jag.raman@oracle.com">jag.raman@oracle.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
&gt; On Jul 19, 2021, at 4:24 PM, John Levon &lt;<a href=3D"mailto:john.lev=
on@nutanix.com" target=3D"_blank">john.levon@nutanix.com</a>&gt; wrote:<br>
&gt; <br>
&gt; On Mon, Jul 19, 2021 at 04:00:03PM -0400, Jagannathan Raman wrote:<br>
&gt; <br>
&gt;&gt; add the libvfio-user library as a submodule. build it as part of Q=
EMU<br>
&gt;&gt; <br>
&gt;&gt; diff --git a/meson.build b/meson.build<br>
&gt;&gt; index 6e4d2d8..f2f9f86 100644<br>
&gt;&gt; --- a/meson.build<br>
&gt;&gt; +++ b/meson.build<br>
&gt;&gt; @@ -1894,6 +1894,41 @@ if get_option(&#39;cfi&#39;) and slirp_opt =
=3D=3D &#39;system&#39;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 + &#39; Please configure with --=
enable-slirp=3Dgit&#39;)<br>
&gt;&gt; endif<br>
&gt;&gt; <br>
&gt;&gt; +vfiouser =3D not_found<br>
&gt;&gt; +if have_system and multiprocess_allowed<br>
&gt;&gt; +=C2=A0 have_internal =3D fs.exists(meson.current_source_dir() / &=
#39;libvfio-user/Makefile&#39;)<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 if not have_internal<br>
&gt;&gt; +=C2=A0 =C2=A0 error(&#39;libvfio-user source not found - please p=
ull git submodule&#39;)<br>
&gt;&gt; +=C2=A0 endif<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 vfiouser_files =3D [<br>
&gt;&gt; +=C2=A0 =C2=A0 &#39;libvfio-user/lib/dma.c&#39;,<br>
&gt;&gt; +=C2=A0 =C2=A0 &#39;libvfio-user/lib/irq.c&#39;,<br>
&gt;&gt; +=C2=A0 =C2=A0 &#39;libvfio-user/lib/libvfio-user.c&#39;,<br>
&gt;&gt; +=C2=A0 =C2=A0 &#39;libvfio-user/lib/migration.c&#39;,<br>
&gt;&gt; +=C2=A0 =C2=A0 &#39;libvfio-user/lib/pci.c&#39;,<br>
&gt;&gt; +=C2=A0 =C2=A0 &#39;libvfio-user/lib/pci_caps.c&#39;,<br>
&gt;&gt; +=C2=A0 =C2=A0 &#39;libvfio-user/lib/tran_sock.c&#39;,<br>
&gt;&gt; +=C2=A0 ]<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 vfiouser_inc =3D include_directories(&#39;libvfio-user/inc=
lude&#39;, &#39;libvfio-user/lib&#39;)<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 json_c =3D dependency(&#39;json-c&#39;, required: false)<b=
r>
&gt;&gt; +=C2=A0 if not json_c.found()<br>
&gt;&gt; +=C2=A0 =C2=A0 json_c =3D dependency(&#39;libjson-c&#39;)<br>
&gt;&gt; +=C2=A0 endif<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 libvfiouser =3D static_library(&#39;vfiouser&#39;,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0build_by_default: false,<br=
>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sources: vfiouser_files,<br=
>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dependencies: json_c,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0include_directories: vfious=
er_inc)<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 vfiouser =3D declare_dependency(link_with: libvfiouser,<br=
>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 include_directories: vfiou=
ser_inc)<br>
&gt;&gt; +endif<br>
&gt; <br>
&gt; Why this way, rather than recursing into the submodule? Seems a bit fr=
agile to<br>
&gt; encode details of the library here.<br>
<br>
+maintainers of meson.build. I apologize for not adding them when I sent th=
e<br>
patches out initially. I copied the email list from Elena, but Elena did no=
t make<br>
any changes to meson.build - stupid me.<br>
<br>
John, <br>
<br>
=C2=A0 =C2=A0 This way appears to be present convention with QEMU - I=E2=80=
=99m also not very clear<br>
on the reason for it.<br>
<br>
For example submodules such as slirp (libslirp), capstone (libcapstone),<br=
>
dtc (libfdt) are built this way.<br></blockquote><div><br></div><div>For sl=
irp and dtc, we are eventually going to use meson subproject(). No idea abo=
ut capstone.<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I=E2=80=99m guessing it=E2=80=99s because QEMU doesn=E2=80=99t build all pa=
rts of a submodule. For<br>
example, QEMU only builds libfdt in the doc submodule. Similarly,<br>
libvfio-user only builds the core library without building the tests and sa=
mples.<br>
<br></blockquote><div>=C2=A0</div><div>You can give subproject options to b=
uild limited parts.<br></div><div>=C2=A0</div><div>Fwiw, since libvfio-user=
 uses cmake, we may be able to use meson cmake.subproject() (<a href=3D"htt=
ps://mesonbuild.com/CMake-module.html">https://mesonbuild.com/CMake-module.=
html</a>).<br></div></div><br>-- <br><div dir=3D"ltr" class=3D"gmail_signat=
ure">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000021903305c78d149d--


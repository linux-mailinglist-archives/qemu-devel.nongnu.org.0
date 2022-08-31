Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A775A7EC8
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 15:31:22 +0200 (CEST)
Received: from localhost ([::1]:55790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTNoP-0003Gj-Ao
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 09:31:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTNlF-0006eh-MM
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 09:28:05 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c]:36642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTNlA-0007Hi-4l
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 09:28:05 -0400
Received: by mail-lj1-x22c.google.com with SMTP id z20so14647318ljq.3
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 06:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=a1HG1rkKL6QS15Wbm4Aa12brKS2v91mMxjp25x2RXeU=;
 b=J7cqmgtVtG+aXWM3tJ3hpOmop2d2E8joPjd6Lnm8hwYPReCxsPKLyMCVdZTtvUCRvz
 iFiJEjBwXtQZA3Yip5ROJ6Z3hpshe7vmZ+9HykdLdCRsVsI3Cv+svpPbNMs6tVTGeqri
 0fw0gwRjUHAjnwrCL3N2zef5B6Jpu1aWV37uzND5WFZMVY1Uhgf9lKOTAwx/f0IDu3Dq
 5qLZvzychKYg0AQui/boiU4tzUjdkVdk/81WYOiZXtzlzmKeopOWpPZp6UBOffivAMQQ
 +TQ0vNxSsh8QA/DaLyYrpaebD3jVDW21S5QGQxv6GrpkEHhDzPN9+elzmU9/j7yo0kMy
 gC9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=a1HG1rkKL6QS15Wbm4Aa12brKS2v91mMxjp25x2RXeU=;
 b=cLcgx+VuRvGcOxdpE7hiHCT3MB8Eii7SKQwbKG7cy+L6ZxYYiJInVVT+XLE+smKfCe
 eShqHJ5Jb9yDylZksU3nc+t3esvp548FXOa81u83HL6ykaLg9x8ApYlrinfTZri/5BJA
 KJDpQ6mQrkjxZk9SgBYYfG/5niVlXxyGnazlXPrktQToAsw1f+tXMHIrsTnjKzpI6BfO
 jvYi6AqfkKCRDT2wpTNp/d3ctpZy3gJ+SMO153/0rVOfCrn1hh5HEl473PqxZgPDp8St
 Ji3oS3xqzjYic53W+ikV7gVsSmgUY8JM0KhtNMc9e7livovS5JgXvAbECNwYTA6wvW3X
 Mk+Q==
X-Gm-Message-State: ACgBeo3Js+jbTGZU+gdWG1N38IX5+dVoK0yQ9XsObJZpuHkn4drHAeAe
 s1HiPzcCAO48BJcSrSZYmn9x/J4mYwaDNChfMjxMkn9x1TU=
X-Google-Smtp-Source: AA6agR4h6EtXnY3izSO8rn6bW2Bk+a21Y7JH6mLzovXJpO9deAC/mh4Ldt6qHRCaFThENKinPI1WdsDSF+i4O6aFmJQ=
X-Received: by 2002:a05:651c:a04:b0:25e:753b:db42 with SMTP id
 k4-20020a05651c0a0400b0025e753bdb42mr8431410ljq.529.1661952475919; Wed, 31
 Aug 2022 06:27:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-20-bmeng.cn@gmail.com>
In-Reply-To: <20220824094029.1634519-20-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 31 Aug 2022 17:27:44 +0400
Message-ID: <CAJ+F1C+Q8Gxc3zCvyH9H3=kbwbqU=ipN=YFatA7Ns_j5EBVDkg@mail.gmail.com>
Subject: Re: [PATCH 19/51] tests/qtest: Build test-filter-{mirror, redirector}
 cases for posix only
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f5fbb505e789764b"
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f5fbb505e789764b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 24, 2022 at 2:10 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> The test-filter-{mirror,redirector} cases use socketpair() API that
> is only available on POSIX and should only be built for POSIX.
>

It is possible to implement a pretty good alternative, like I did for glib =
(
https://gitlab.gnome.org/GNOME/glib/-/blob/main/gio/tests/socket.c#L2193)

I intend to add that in another series (based on yours), we can enable more
tests later.



>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>
>  tests/qtest/meson.build | 28 ++++++++++++++++++----------
>  1 file changed, 18 insertions(+), 10 deletions(-)
>
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 9e484e60ba..c97da5a062 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -42,6 +42,7 @@ qtests_cxl =3D \
>  qtests_i386 =3D \
>    (slirp.found() ? ['pxe-test', 'test-netfilter'] : []) +             \
>    (config_host.has_key('CONFIG_POSIX') ? ['test-filter-mirror'] : []) +
>                    \
> +  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-redirector'] : []=
)
> +                 \
>    (have_tools ? ['ahci-test'] : []) +
>                    \
>    (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'=
]
> : []) +           \
>    (config_all_devices.has_key('CONFIG_SGA') ? ['boot-serial-test'] : [])
> +                  \
> @@ -95,8 +96,7 @@ qtests_i386 =3D \
>     'vmgenid-test',
>     'migration-test',
>     'test-x86-cpuid-compat',
> -   'numa-test',
> -   'test-filter-redirector'
> +   'numa-test'
>    ]
>
>  if dbus_display
> @@ -120,29 +120,34 @@ endif
>  qtests_x86_64 =3D qtests_i386
>
>  qtests_alpha =3D ['boot-serial-test'] + \
> -  ['test-filter-mirror', 'test-filter-redirector'] + \
> +  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-mirror'] : []) +
>    \
> +  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-redirector'] : []=
)
> + \
>    (slirp.found() ? ['test-netfilter'] : []) + \
>    (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : [])
>
>  qtests_avr =3D [ 'boot-serial-test' ]
>
>  qtests_hppa =3D ['boot-serial-test'] + \
> -  ['test-filter-mirror', 'test-filter-redirector'] + \
> +  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-mirror'] : []) +
>    \
> +  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-redirector'] : []=
)
> + \
>    (slirp.found() ? ['test-netfilter'] : []) + \
>    (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : [])
>
>  qtests_m68k =3D ['boot-serial-test'] + \
> -  ['test-filter-mirror', 'test-filter-redirector'] + \
> +  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-mirror'] : []) +
>    \
> +  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-redirector'] : []=
)
> + \
>    (slirp.found() ? ['test-netfilter'] : [])
>
>  qtests_microblaze =3D ['boot-serial-test'] + \
> -  ['test-filter-mirror', 'test-filter-redirector'] + \
> +  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-mirror'] : []) +
>    \
> +  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-redirector'] : []=
)
> + \
>    (slirp.found() ? ['test-netfilter'] : [])
>
>  qtests_microblazeel =3D qtests_microblaze
>
>  qtests_mips =3D \
> -  ['test-filter-mirror', 'test-filter-redirector'] + \
> +  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-mirror'] : []) +
>    \
> +  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-redirector'] : []=
)
> + \
>    (slirp.found() ? ['test-netfilter'] : []) + \
>    (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'=
]
> : []) +            \
>    (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : [])
> @@ -152,7 +157,8 @@ qtests_mips64 =3D qtests_mips
>  qtests_mips64el =3D qtests_mips
>
>  qtests_ppc =3D \
> -  ['test-filter-mirror', 'test-filter-redirector'] + \
> +  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-mirror'] : []) +
>    \
> +  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-redirector'] : []=
)
> + \
>    (slirp.found() ? ['test-netfilter'] : []) + \
>    (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'=
]
> : []) +            \
>    (config_all_devices.has_key('CONFIG_M48T59') ? ['m48t59-test'] : []) +
>                    \
> @@ -174,13 +180,15 @@ qtests_sh4 =3D
> (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-te
>  qtests_sh4eb =3D (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ?
> ['endianness-test'] : [])
>
>  qtests_sparc =3D ['prom-env-test', 'm48t59-test', 'boot-serial-test'] + =
\
> -  ['test-filter-mirror', 'test-filter-redirector'] + \
> +  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-mirror'] : []) +
>    \
> +  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-redirector'] : []=
)
> + \
>    (slirp.found() ? ['test-netfilter'] : [])
>
>  qtests_sparc64 =3D \
>    (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'=
]
> : []) +            \
>    (slirp.found() ? ['test-netfilter'] : []) + \
> -  ['test-filter-mirror', 'test-filter-redirector'] + \
> +  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-mirror'] : []) +
>    \
> +  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-redirector'] : []=
)
> + \
>    ['prom-env-test', 'boot-serial-test']
>
>  qtests_npcm7xx =3D \
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000f5fbb505e789764b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 24, 2022 at 2:10 PM Bin M=
eng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin M=
eng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.men=
g@windriver.com</a>&gt;<br>
<br>
The test-filter-{mirror,redirector} cases use socketpair() API that<br>
is only available on POSIX and should only be built for POSIX.<br></blockqu=
ote><div><br></div><div><div>It is possible to implement a pretty good alte=
rnative, like I did for glib (<a href=3D"https://gitlab.gnome.org/GNOME/gli=
b/-/blob/main/gio/tests/socket.c#L2193" target=3D"_blank">https://gitlab.gn=
ome.org/GNOME/glib/-/blob/main/gio/tests/socket.c#L2193</a>)</div><div><br>=
</div><div>I intend to add that in another series (based on yours), we can =
enable more tests later.</div><div><br></div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br></blockquote><div><br></div>=
<div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lu=
reau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=C2=A0<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
<br>
=C2=A0tests/qtest/meson.build | 28 ++++++++++++++++++----------<br>
=C2=A01 file changed, 18 insertions(+), 10 deletions(-)<br>
<br>
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build<br>
index 9e484e60ba..c97da5a062 100644<br>
--- a/tests/qtest/meson.build<br>
+++ b/tests/qtest/meson.build<br>
@@ -42,6 +42,7 @@ qtests_cxl =3D \<br>
=C2=A0qtests_i386 =3D \<br>
=C2=A0 =C2=A0(slirp.found() ? [&#39;pxe-test&#39;, &#39;test-netfilter&#39;=
] : []) +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0(config_host.has_key(&#39;CONFIG_POSIX&#39;) ? [&#39;test-filt=
er-mirror&#39;] : []) +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 (config_host.has_key(&#39;CONFIG_POSIX&#39;) ? [&#39;test-filter-re=
director&#39;] : []) +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0\<br>
=C2=A0 =C2=A0(have_tools ? [&#39;ahci-test&#39;] : []) +=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0(config_all_devices.has_key(&#39;CONFIG_ISA_TESTDEV&#39;) ? [&=
#39;endianness-test&#39;] : []) +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\=
<br>
=C2=A0 =C2=A0(config_all_devices.has_key(&#39;CONFIG_SGA&#39;) ? [&#39;boot=
-serial-test&#39;] : []) +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 \<br>
@@ -95,8 +96,7 @@ qtests_i386 =3D \<br>
=C2=A0 =C2=A0 &#39;vmgenid-test&#39;,<br>
=C2=A0 =C2=A0 &#39;migration-test&#39;,<br>
=C2=A0 =C2=A0 &#39;test-x86-cpuid-compat&#39;,<br>
-=C2=A0 =C2=A0&#39;numa-test&#39;,<br>
-=C2=A0 =C2=A0&#39;test-filter-redirector&#39;<br>
+=C2=A0 =C2=A0&#39;numa-test&#39;<br>
=C2=A0 =C2=A0]<br>
<br>
=C2=A0if dbus_display<br>
@@ -120,29 +120,34 @@ endif<br>
=C2=A0qtests_x86_64 =3D qtests_i386<br>
<br>
=C2=A0qtests_alpha =3D [&#39;boot-serial-test&#39;] + \<br>
-=C2=A0 [&#39;test-filter-mirror&#39;, &#39;test-filter-redirector&#39;] + =
\<br>
+=C2=A0 (config_host.has_key(&#39;CONFIG_POSIX&#39;) ? [&#39;test-filter-mi=
rror&#39;] : []) +=C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 (config_host.has_key(&#39;CONFIG_POSIX&#39;) ? [&#39;test-filter-re=
director&#39;] : []) + \<br>
=C2=A0 =C2=A0(slirp.found() ? [&#39;test-netfilter&#39;] : []) + \<br>
=C2=A0 =C2=A0(config_all_devices.has_key(&#39;CONFIG_VGA&#39;) ? [&#39;disp=
lay-vga-test&#39;] : [])<br>
<br>
=C2=A0qtests_avr =3D [ &#39;boot-serial-test&#39; ]<br>
<br>
=C2=A0qtests_hppa =3D [&#39;boot-serial-test&#39;] + \<br>
-=C2=A0 [&#39;test-filter-mirror&#39;, &#39;test-filter-redirector&#39;] + =
\<br>
+=C2=A0 (config_host.has_key(&#39;CONFIG_POSIX&#39;) ? [&#39;test-filter-mi=
rror&#39;] : []) +=C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 (config_host.has_key(&#39;CONFIG_POSIX&#39;) ? [&#39;test-filter-re=
director&#39;] : []) + \<br>
=C2=A0 =C2=A0(slirp.found() ? [&#39;test-netfilter&#39;] : []) + \<br>
=C2=A0 =C2=A0(config_all_devices.has_key(&#39;CONFIG_VGA&#39;) ? [&#39;disp=
lay-vga-test&#39;] : [])<br>
<br>
=C2=A0qtests_m68k =3D [&#39;boot-serial-test&#39;] + \<br>
-=C2=A0 [&#39;test-filter-mirror&#39;, &#39;test-filter-redirector&#39;] + =
\<br>
+=C2=A0 (config_host.has_key(&#39;CONFIG_POSIX&#39;) ? [&#39;test-filter-mi=
rror&#39;] : []) +=C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 (config_host.has_key(&#39;CONFIG_POSIX&#39;) ? [&#39;test-filter-re=
director&#39;] : []) + \<br>
=C2=A0 =C2=A0(slirp.found() ? [&#39;test-netfilter&#39;] : [])<br>
<br>
=C2=A0qtests_microblaze =3D [&#39;boot-serial-test&#39;] + \<br>
-=C2=A0 [&#39;test-filter-mirror&#39;, &#39;test-filter-redirector&#39;] + =
\<br>
+=C2=A0 (config_host.has_key(&#39;CONFIG_POSIX&#39;) ? [&#39;test-filter-mi=
rror&#39;] : []) +=C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 (config_host.has_key(&#39;CONFIG_POSIX&#39;) ? [&#39;test-filter-re=
director&#39;] : []) + \<br>
=C2=A0 =C2=A0(slirp.found() ? [&#39;test-netfilter&#39;] : [])<br>
<br>
=C2=A0qtests_microblazeel =3D qtests_microblaze<br>
<br>
=C2=A0qtests_mips =3D \<br>
-=C2=A0 [&#39;test-filter-mirror&#39;, &#39;test-filter-redirector&#39;] + =
\<br>
+=C2=A0 (config_host.has_key(&#39;CONFIG_POSIX&#39;) ? [&#39;test-filter-mi=
rror&#39;] : []) +=C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 (config_host.has_key(&#39;CONFIG_POSIX&#39;) ? [&#39;test-filter-re=
director&#39;] : []) + \<br>
=C2=A0 =C2=A0(slirp.found() ? [&#39;test-netfilter&#39;] : []) + \<br>
=C2=A0 =C2=A0(config_all_devices.has_key(&#39;CONFIG_ISA_TESTDEV&#39;) ? [&=
#39;endianness-test&#39;] : []) +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
\<br>
=C2=A0 =C2=A0(config_all_devices.has_key(&#39;CONFIG_VGA&#39;) ? [&#39;disp=
lay-vga-test&#39;] : [])<br>
@@ -152,7 +157,8 @@ qtests_mips64 =3D qtests_mips<br>
=C2=A0qtests_mips64el =3D qtests_mips<br>
<br>
=C2=A0qtests_ppc =3D \<br>
-=C2=A0 [&#39;test-filter-mirror&#39;, &#39;test-filter-redirector&#39;] + =
\<br>
+=C2=A0 (config_host.has_key(&#39;CONFIG_POSIX&#39;) ? [&#39;test-filter-mi=
rror&#39;] : []) +=C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 (config_host.has_key(&#39;CONFIG_POSIX&#39;) ? [&#39;test-filter-re=
director&#39;] : []) + \<br>
=C2=A0 =C2=A0(slirp.found() ? [&#39;test-netfilter&#39;] : []) + \<br>
=C2=A0 =C2=A0(config_all_devices.has_key(&#39;CONFIG_ISA_TESTDEV&#39;) ? [&=
#39;endianness-test&#39;] : []) +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
\<br>
=C2=A0 =C2=A0(config_all_devices.has_key(&#39;CONFIG_M48T59&#39;) ? [&#39;m=
48t59-test&#39;] : []) +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
@@ -174,13 +180,15 @@ qtests_sh4 =3D (config_all_devices.has_key(&#39;CONFI=
G_ISA_TESTDEV&#39;) ? [&#39;endianness-te<br>
=C2=A0qtests_sh4eb =3D (config_all_devices.has_key(&#39;CONFIG_ISA_TESTDEV&=
#39;) ? [&#39;endianness-test&#39;] : [])<br>
<br>
=C2=A0qtests_sparc =3D [&#39;prom-env-test&#39;, &#39;m48t59-test&#39;, &#3=
9;boot-serial-test&#39;] + \<br>
-=C2=A0 [&#39;test-filter-mirror&#39;, &#39;test-filter-redirector&#39;] + =
\<br>
+=C2=A0 (config_host.has_key(&#39;CONFIG_POSIX&#39;) ? [&#39;test-filter-mi=
rror&#39;] : []) +=C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 (config_host.has_key(&#39;CONFIG_POSIX&#39;) ? [&#39;test-filter-re=
director&#39;] : []) + \<br>
=C2=A0 =C2=A0(slirp.found() ? [&#39;test-netfilter&#39;] : [])<br>
<br>
=C2=A0qtests_sparc64 =3D \<br>
=C2=A0 =C2=A0(config_all_devices.has_key(&#39;CONFIG_ISA_TESTDEV&#39;) ? [&=
#39;endianness-test&#39;] : []) +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
\<br>
=C2=A0 =C2=A0(slirp.found() ? [&#39;test-netfilter&#39;] : []) + \<br>
-=C2=A0 [&#39;test-filter-mirror&#39;, &#39;test-filter-redirector&#39;] + =
\<br>
+=C2=A0 (config_host.has_key(&#39;CONFIG_POSIX&#39;) ? [&#39;test-filter-mi=
rror&#39;] : []) +=C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 (config_host.has_key(&#39;CONFIG_POSIX&#39;) ? [&#39;test-filter-re=
director&#39;] : []) + \<br>
=C2=A0 =C2=A0[&#39;prom-env-test&#39;, &#39;boot-serial-test&#39;]<br>
<br>
=C2=A0qtests_npcm7xx =3D \<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000f5fbb505e789764b--


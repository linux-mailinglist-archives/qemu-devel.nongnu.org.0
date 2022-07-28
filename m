Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB76583FBB
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 15:16:01 +0200 (CEST)
Received: from localhost ([::1]:60298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH3Mt-0002G3-Sn
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 09:15:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oH3Ix-0007qI-4V
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:11:55 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c]:41681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oH3Iu-0002Jx-Rk
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:11:54 -0400
Received: by mail-lf1-x12c.google.com with SMTP id t1so2772016lft.8
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 06:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sLR/SGuXZGUmaa+QudRhT1pVuDm3JHX44Dzuf3FIXVE=;
 b=HHDSEzQme8N6Od41T1UQh0rTQ83RtI7CA4Bz606VSy0lmsooCm4/1YrPyuSXvE6YTy
 Y3hPG/wMw0F1MyrRkuAf9mOIIajfRgnttAKIyU0zjk+x+HDNq3sfKYYaEP8D6exVCzwf
 oiPCfGbQM+JA8k8SFv8TIw+gTNaxwBL9d/X8kNB5t8ubOYMdeVeKPmGEU6BO0in5scDa
 mdWDVmN1BzHdd2ASaurvt1BKvpebKBnsSSxYqx9sfEL7Mi8L/ZptkI75Skc/ksCS32K6
 ib1U9lL++PUkGOIvgcO7KL0FDFdRFXKfxN+iKXswRZoyluuzLuOBVkK4kE9OrVsygqmR
 RVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sLR/SGuXZGUmaa+QudRhT1pVuDm3JHX44Dzuf3FIXVE=;
 b=PgWHItp87+fe/P5CCaWKM5UGGONWn3gthfLvhHMp1LIq7tZK3hN4b7qCgJUa6mYjTs
 jPg80DlRcRHuhixvf/dsAPQHBBBQjepLy+00G26MrhHzC4ibK+qfv83KKznWkgc9QxZx
 PtWEJ98WM20mgW3Dbz8HuEYqdW0PNKUOyU4qnvcA16E0TlgI2QBFRbayxYmqH7MuOSMY
 4naifvQIIjhZ+XHrjzrHH8W5vqX/p6aEJPYM1tIDFN7rvz5GI+2mdEVX2DN4C+S5TllG
 Tzy18E75J4GG0SaVveQZfOpoNVeNgARFnuWFwa3Zi/CAmfqHRxKboo6HG5INo0RIUeUf
 aAiA==
X-Gm-Message-State: AJIora9dxQFgwZfA6YWTP7B3ll1E5Gdijo4GyMpPpARELdDIldEI/MlY
 vQ5meQFLNMBMFw7zHg+qHs/zCDAgVgZEtVfqVTs=
X-Google-Smtp-Source: AGRyM1s46907GdNnBmepS71unpB1Ncw3e1PHsKkbnEGFHe7g/9ISY7I+AgaSmu82NaNWNh9j3tC458gyGeMUtdQKqrk=
X-Received: by 2002:a05:6512:158e:b0:48a:848a:27f6 with SMTP id
 bp14-20020a056512158e00b0048a848a27f6mr8214845lfb.520.1659013910781; Thu, 28
 Jul 2022 06:11:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220727073542.811420-1-bmeng.cn@gmail.com>
 <20220727073542.811420-5-bmeng.cn@gmail.com>
 <CAPMcbCo81iCA7ZnvWY7=OqA7vrAuhx7jA5EPiqJLnq4LzpKstA@mail.gmail.com>
 <CAEUhbmWXhXYSYtBUy1vnaa7uaZ10Z9ybjh3ZZmaJAW7K7fV08w@mail.gmail.com>
In-Reply-To: <CAEUhbmWXhXYSYtBUy1vnaa7uaZ10Z9ybjh3ZZmaJAW7K7fV08w@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 28 Jul 2022 17:11:39 +0400
Message-ID: <CAJ+F1C+5r2_qwsynRc4V2qiaZYEs8HhvJ9TGZUkGa0g6hTHAhg@mail.gmail.com>
Subject: Re: [PATCH 4/5] util/qemu-sockets: Enable unix socket support on
 Windows
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Konstantin Kostiuk <kkostiuk@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 QEMU <qemu-devel@nongnu.org>, Bin Meng <bin.meng@windriver.com>, 
 Xuzhou Cheng <xuzhou.cheng@windriver.com>
Content-Type: multipart/alternative; boundary="000000000000d4653605e4dd4626"
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12c.google.com
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

--000000000000d4653605e4dd4626
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Jul 27, 2022 at 2:05 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> On Wed, Jul 27, 2022 at 4:53 PM Konstantin Kostiuk <kkostiuk@redhat.com>
> wrote:
> >
> >
> >
> >
> >
> > On Wed, Jul 27, 2022 at 10:47 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >>
> >> From: Bin Meng <bin.meng@windriver.com>
> >>
> >> Support for the unix socket has existed both in BSD and Linux for the
> >> longest time, but not on Windows. Since Windows 10 build 17063 [1],
> >> the native support for the unix socket has came to Windows. Starting
> >> this build, two Win32 processes can use the AF_UNIX address family
> >> over Winsock API to communicate with each other.
> >>
> >> Introduce a new build time config option CONFIG_AF_UNIX when the build
> >> host has such a capability, and a run-time check afunix_available() fo=
r
> >> Windows host in the QEMU sockets util codes.
> >>
> >> [1]
> https://devblogs.microsoft.com/commandline/af_unix-comes-to-windows/
> >>
> >> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> >> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >> ---
> >>
> >>  meson.build         |  6 ++++++
> >>  util/qemu-sockets.c | 48 ++++++++++++++++++++++++++++++++++++++------=
-
> >>  2 files changed, 47 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/meson.build b/meson.build
> >> index 75aaca8462..73e5de5957 100644
> >> --- a/meson.build
> >> +++ b/meson.build
> >> @@ -2327,6 +2327,12 @@ have_afalg =3D get_option('crypto_afalg') \
> >>    '''), error_message: 'AF_ALG requested but could not be
> detected').allowed()
> >>  config_host_data.set('CONFIG_AF_ALG', have_afalg)
> >>
> >> +if targetos !=3D 'windows'
> >> +  config_host_data.set('CONFIG_AF_UNIX', true)
> >> +else
> >> +  config_host_data.set('CONFIG_AF_UNIX', cc.has_header('afunix.h'))
> >> +endif
> >> +
> >>  config_host_data.set('CONFIG_AF_VSOCK', cc.has_header_symbol(
> >>    'linux/vm_sockets.h', 'AF_VSOCK',
> >>    prefix: '#include <sys/socket.h>',
> >> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> >> index 0e2298278f..d85f3ea3ee 100644
> >> --- a/util/qemu-sockets.c
> >> +++ b/util/qemu-sockets.c
> >> @@ -17,6 +17,15 @@
> >>   */
> >>  #include "qemu/osdep.h"
> >>
> >> +#if defined(CONFIG_WIN32) && defined(CONFIG_AF_UNIX)
> >> +# include <afunix.h>
> >> +/*
> >> + * AF_UNIX support is available since Windows 10 build 17063
> >> + * See
> https://devblogs.microsoft.com/commandline/af_unix-comes-to-windows/
> >> + */
> >> +# define WIN_BUILD_AF_UNIX 17063
> >> +#endif /* CONFIG_WIN32 && CONFIG_AF_UNIX */
> >> +
> >>  #ifdef CONFIG_AF_VSOCK
> >>  #include <linux/vm_sockets.h>
> >>  #endif /* CONFIG_AF_VSOCK */
> >> @@ -880,7 +889,7 @@ static int vsock_parse(VsockSocketAddress *addr,
> const char *str,
> >>  }
> >>  #endif /* CONFIG_AF_VSOCK */
> >>
> >> -#ifndef _WIN32
> >> +#ifdef CONFIG_AF_UNIX
> >>
> >>  static bool saddr_is_abstract(UnixSocketAddress *saddr)
> >>  {
> >> @@ -900,6 +909,17 @@ static bool saddr_is_tight(UnixSocketAddress
> *saddr)
> >>  #endif
> >>  }
> >>
> >> +#ifdef CONFIG_WIN32
> >> +static bool afunix_available(void)
> >> +{
> >> +    OSVERSIONINFOEXW os_version =3D { 0 };
> >> +
> >> +    os_get_win_version(&os_version);
> >> +
> >> +    return os_version.dwBuildNumber >=3D WIN_BUILD_AF_UNIX;
> >
> >
> > I think this is a bad variant to check feature support by checking
> > Windows build. From my point, you should try to create an AF_UNIX
> > socket and if it fails then fall back to the old behavior.
> >
>
> The caller intends to create an AF_UNIX socket, and if Windows does
> not have the capability, it fails, and we return -1 to the caller.
> I am not sure what old behavior we should fall back to.
>
>
I agree with Konstantin, we shouldn't check the Windows version, but assume
the socket creation can work, and just report a regular error if not.

(you can drop some of the preliminary patch then)

--=20
Marc-Andr=C3=A9 Lureau

--000000000000d4653605e4dd4626
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 27, 2022 at 2:05 PM Bin=
 Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, J=
ul 27, 2022 at 4:53 PM Konstantin Kostiuk &lt;<a href=3D"mailto:kkostiuk@re=
dhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Wed, Jul 27, 2022 at 10:47 AM Bin Meng &lt;<a href=3D"mailto:bmeng.=
cn@gmail.com" target=3D"_blank">bmeng.cn@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; From: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Support for the unix socket has existed both in BSD and Linux for =
the<br>
&gt;&gt; longest time, but not on Windows. Since Windows 10 build 17063 [1]=
,<br>
&gt;&gt; the native support for the unix socket has came to Windows. Starti=
ng<br>
&gt;&gt; this build, two Win32 processes can use the AF_UNIX address family=
<br>
&gt;&gt; over Winsock API to communicate with each other.<br>
&gt;&gt;<br>
&gt;&gt; Introduce a new build time config option CONFIG_AF_UNIX when the b=
uild<br>
&gt;&gt; host has such a capability, and a run-time check afunix_available(=
) for<br>
&gt;&gt; Windows host in the QEMU sockets util codes.<br>
&gt;&gt;<br>
&gt;&gt; [1] <a href=3D"https://devblogs.microsoft.com/commandline/af_unix-=
comes-to-windows/" rel=3D"noreferrer" target=3D"_blank">https://devblogs.mi=
crosoft.com/commandline/af_unix-comes-to-windows/</a><br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Xuzhou Cheng &lt;<a href=3D"mailto:xuzhou.cheng@win=
driver.com" target=3D"_blank">xuzhou.cheng@windriver.com</a>&gt;<br>
&gt;&gt; Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.c=
om" target=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +++++=
+<br>
&gt;&gt;=C2=A0 util/qemu-sockets.c | 48 +++++++++++++++++++++++++++++++++++=
+++-------<br>
&gt;&gt;=C2=A0 2 files changed, 47 insertions(+), 7 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meson.build b/meson.build<br>
&gt;&gt; index 75aaca8462..73e5de5957 100644<br>
&gt;&gt; --- a/meson.build<br>
&gt;&gt; +++ b/meson.build<br>
&gt;&gt; @@ -2327,6 +2327,12 @@ have_afalg =3D get_option(&#39;crypto_afalg=
&#39;) \<br>
&gt;&gt;=C2=A0 =C2=A0 &#39;&#39;&#39;), error_message: &#39;AF_ALG requeste=
d but could not be detected&#39;).allowed()<br>
&gt;&gt;=C2=A0 config_host_data.set(&#39;CONFIG_AF_ALG&#39;, have_afalg)<br=
>
&gt;&gt;<br>
&gt;&gt; +if targetos !=3D &#39;windows&#39;<br>
&gt;&gt; +=C2=A0 config_host_data.set(&#39;CONFIG_AF_UNIX&#39;, true)<br>
&gt;&gt; +else<br>
&gt;&gt; +=C2=A0 config_host_data.set(&#39;CONFIG_AF_UNIX&#39;, cc.has_head=
er(&#39;afunix.h&#39;))<br>
&gt;&gt; +endif<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 config_host_data.set(&#39;CONFIG_AF_VSOCK&#39;, cc.has_heade=
r_symbol(<br>
&gt;&gt;=C2=A0 =C2=A0 &#39;linux/vm_sockets.h&#39;, &#39;AF_VSOCK&#39;,<br>
&gt;&gt;=C2=A0 =C2=A0 prefix: &#39;#include &lt;sys/socket.h&gt;&#39;,<br>
&gt;&gt; diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c<br>
&gt;&gt; index 0e2298278f..d85f3ea3ee 100644<br>
&gt;&gt; --- a/util/qemu-sockets.c<br>
&gt;&gt; +++ b/util/qemu-sockets.c<br>
&gt;&gt; @@ -17,6 +17,15 @@<br>
&gt;&gt;=C2=A0 =C2=A0*/<br>
&gt;&gt;=C2=A0 #include &quot;qemu/osdep.h&quot;<br>
&gt;&gt;<br>
&gt;&gt; +#if defined(CONFIG_WIN32) &amp;&amp; defined(CONFIG_AF_UNIX)<br>
&gt;&gt; +# include &lt;afunix.h&gt;<br>
&gt;&gt; +/*<br>
&gt;&gt; + * AF_UNIX support is available since Windows 10 build 17063<br>
&gt;&gt; + * See <a href=3D"https://devblogs.microsoft.com/commandline/af_u=
nix-comes-to-windows/" rel=3D"noreferrer" target=3D"_blank">https://devblog=
s.microsoft.com/commandline/af_unix-comes-to-windows/</a><br>
&gt;&gt; + */<br>
&gt;&gt; +# define WIN_BUILD_AF_UNIX 17063<br>
&gt;&gt; +#endif /* CONFIG_WIN32 &amp;&amp; CONFIG_AF_UNIX */<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 #ifdef CONFIG_AF_VSOCK<br>
&gt;&gt;=C2=A0 #include &lt;linux/vm_sockets.h&gt;<br>
&gt;&gt;=C2=A0 #endif /* CONFIG_AF_VSOCK */<br>
&gt;&gt; @@ -880,7 +889,7 @@ static int vsock_parse(VsockSocketAddress *add=
r, const char *str,<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;=C2=A0 #endif /* CONFIG_AF_VSOCK */<br>
&gt;&gt;<br>
&gt;&gt; -#ifndef _WIN32<br>
&gt;&gt; +#ifdef CONFIG_AF_UNIX<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 static bool saddr_is_abstract(UnixSocketAddress *saddr)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt; @@ -900,6 +909,17 @@ static bool saddr_is_tight(UnixSocketAddress =
*saddr)<br>
&gt;&gt;=C2=A0 #endif<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt; +#ifdef CONFIG_WIN32<br>
&gt;&gt; +static bool afunix_available(void)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 OSVERSIONINFOEXW os_version =3D { 0 };<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 os_get_win_version(&amp;os_version);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 return os_version.dwBuildNumber &gt;=3D WIN_BUILD_A=
F_UNIX;<br>
&gt;<br>
&gt;<br>
&gt; I think this is a bad variant to check feature support by checking<br>
&gt; Windows build. From my point, you should try to create an AF_UNIX<br>
&gt; socket and if it fails then fall back to the old behavior.<br>
&gt;<br>
<br>
The caller intends to create an AF_UNIX socket, and if Windows does<br>
not have the capability, it fails, and we return -1 to the caller.<br>
I am not sure what old behavior we should fall back to.<br><br></blockquote=
><div><br></div><div>I agree with Konstantin, we shouldn&#39;t check the Wi=
ndows version, but assume the socket creation can work, and just report a r=
egular error if not.<br></div><div><br></div><div>(you can drop some of the=
 preliminary patch then)</div><div><br></div></div>-- <br><div dir=3D"ltr" =
class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000d4653605e4dd4626--


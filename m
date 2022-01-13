Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DC548DAC0
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 16:39:47 +0100 (CET)
Received: from localhost ([::1]:53690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n82CY-0003dr-Hz
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 10:39:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n829O-0002SU-F6
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 10:36:30 -0500
Received: from [2607:f8b0:4864:20::534] (port=47015
 helo=mail-pg1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n829M-0001bi-78
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 10:36:30 -0500
Received: by mail-pg1-x534.google.com with SMTP id i8so191147pgt.13
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 07:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UetDPFtN10A5uaFJxA+gmPr5ncPTeMx1MNS7cS3MuJQ=;
 b=Sp9wtp6SCxFl/9mY/Ckp7cQvwqEeC3H7HeYrmGItmWSoBe6zzjuevdKYINMg/hNiWZ
 kJ+hWN6smxjabSbxvlS53wkgjWVbBi4fIYVDwJCxP1s8F/Dy31N0jpNTjrVbISUcNW5z
 MJfpZqoQC9Pt3EzJHIy7hu2IvqttWxSQLYU+Gbnydz03Dp9IIVBXN3keFO0Q+BSSwtdp
 dNcQ5g6/Tzo98g0Up1gRnmS/RE7s+oUoyNEuFBuduxan8zLUnoa5D855A9c9zpVORCwr
 r+RZABzxQ0b7bI1uJzxqExTO0aRUa/aHn5peLTwNUu45b164dkuHqXK+v+rUmqEPM/FC
 OjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UetDPFtN10A5uaFJxA+gmPr5ncPTeMx1MNS7cS3MuJQ=;
 b=13RvK1jVsGXe8wVSvtTUBUkiKOrgKQhLaQ7002KStLFV5ksOMa7w4R84OjqZO6FOLx
 MDgM62GvJw9G935rLa4xgFAnuoVpna34otaRbqNYcLHj0VbVl0iMEx9LNEKpmRHPGCCq
 xeHfj1p7Zn+hQhCPV2zelN5kH9arJvPNTD78XGQMokCXqkYP0P/s7F1er+T99iubAwEw
 bHc9nNr9vI4DrB70Y9njoVG5NtgOn1hqtU09mvs5kicYXIQUM+XXmD+iH224r7hdVeBn
 B86RxoOOVJpvcvNXgS0qkEzjgkPRXSMbWmi0AO3biaq8hsTV6eezLNoREZl7BSlc53Al
 3SXw==
X-Gm-Message-State: AOAM532frcU6zw0yz7v9e6/c+nZtGJD8C2+c8OtsS6NujbgUHNhcYGZW
 Ielzi3dQuCQtoc63Bxrcvi1wkQqo9QxyLzZvpsY=
X-Google-Smtp-Source: ABdhPJwaCEqVv1Ai7TwLt+IjpJKgVYseGe6JKv/ABhNnuw+uLSwAu1jQMRV23Ur6uMd1l/INZbJM7/FcRw0VJLU6vO0=
X-Received: by 2002:a63:7407:: with SMTP id p7mr4383872pgc.14.1642088186702;
 Thu, 13 Jan 2022 07:36:26 -0800 (PST)
MIME-Version: 1.0
References: <20220112122150.37049-1-yaroshchuk2000@gmail.com>
 <20220112122150.37049-2-yaroshchuk2000@gmail.com>
 <Yd8HcSVcuJB7C7Hg@roolebo.dev>
In-Reply-To: <Yd8HcSVcuJB7C7Hg@roolebo.dev>
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Date: Thu, 13 Jan 2022 18:36:15 +0300
Message-ID: <CADO9X9RJVU114a2UoFkPT+djtKxaeWT2uokFx0rSq2itkKzL2w@mail.gmail.com>
Subject: Re: [PATCH v11 1/7] net/vmnet: add vmnet dependency and customizable
 option
To: Roman Bolshakov <roman@roolebo.dev>
Content-Type: multipart/alternative; boundary="0000000000000ef0f505d57873d6"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::534
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, phillip.ennen@gmail.com,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Phillip Tennen <phillip@axleos.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Howard Spoelstra <hsp.cat7@gmail.com>,
 Alessio Dionisi <hello@adns.io>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000ef0f505d57873d6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fixed in v12. Thank you!

=D1=81=D1=80, 12 =D1=8F=D0=BD=D0=B2. 2022 =D0=B3. =D0=B2 19:53, Roman Bolsh=
akov <roman@roolebo.dev>:

> On Wed, Jan 12, 2022 at 03:21:44PM +0300, Vladislav Yaroshchuk wrote:
> > vmnet.framework dependency is added with 'vmnet' option
> > to enable or disable it. Default value is 'auto'.
> >
> > vmnet features to be used are available since macOS 11.0,
> > corresponding probe is created into meson.build.
> >
> > Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> > ---
> >  meson.build                   | 23 ++++++++++++++++++++++-
> >  meson_options.txt             |  2 ++
> >  scripts/meson-buildoptions.sh |  3 +++
> >  3 files changed, 27 insertions(+), 1 deletion(-)
> >
> > diff --git a/meson.build b/meson.build
> > index c1b1db1e28..b912c9cb91 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -496,6 +496,24 @@ if cocoa.found() and get_option('gtk').enabled()
> >    error('Cocoa and GTK+ cannot be enabled at the same time')
> >  endif
> >
> > +vmnet =3D dependency('appleframeworks', modules: 'vmnet', required:
> get_option('vmnet'))
> > +vmnet_11_0_api =3D false
> > +if vmnet.found() and not cc.has_header_symbol('vmnet/vmnet.h',
> > +                                              'VMNET_BRIDGED_MODE',
> > +                                              dependencies: vmnet)
> > +  vmnet =3D not_found
> > +  if get_option('vmnet').enabled()
> > +    error('vmnet.framework API is outdated')
> > +  else
> > +    warning('vmnet.framework API is outdated, disabling')
> > +  endif
> > +endif
> > +if vmnet.found() and cc.has_header_symbol('vmnet/vmnet.h',
> > +                                          'VMNET_SHARING_SERVICE_BUSY'=
,
> > +                                          dependencies: vmnet)
> > +  vmnet_11_0_api =3D true
> > +endif
> > +
> >  seccomp =3D not_found
> >  if not get_option('seccomp').auto() or have_system or have_tools
> >    seccomp =3D dependency('libseccomp', version: '>=3D2.3.0',
> > @@ -1492,6 +1510,8 @@ config_host_data.set('CONFIG_SECCOMP',
> seccomp.found())
> >  config_host_data.set('CONFIG_SNAPPY', snappy.found())
> >  config_host_data.set('CONFIG_USB_LIBUSB', libusb.found())
> >  config_host_data.set('CONFIG_VDE', vde.found())
> > +config_host_data.set('CONFIG_VMNET', vmnet.found())
> > +config_host_data.set('CONFIG_VMNET_11_0_API', vmnet_11_0_api)
>
> Hi Vladislav,
>
> There might be more functionality coming in the next macOS versions but
> we likely don't want to add them as extra CONFIG defines. Instead we
> wrap new symbols/functions/code that are avaialble above Big Sur in the
> code as:
>
> #if defined(MAC_OS_VERSION_11_0) && \
>     MAC_OS_X_VERSION_MAX_ALLOWED >=3D MAC_OS_VERSION_11_0
>
>     xpc_dictionary_set_bool(
>         if_desc,
>         vmnet_enable_isolation_key,
>         options->isolated
>     );
>
> #endif
>
> Please see similar thread here:
> https://lists.gnu.org/archive/html/qemu-devel/2022-01/msg01915.html
>
> Thanks,
> Roman
>
> >  config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER',
> have_vhost_user_blk_server)
> >  config_host_data.set('CONFIG_VNC', vnc.found())
> >  config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
> > @@ -3406,7 +3426,8 @@ summary(summary_info, bool_yn: true, section:
> 'Crypto')
> >  # Libraries
> >  summary_info =3D {}
> >  if targetos =3D=3D 'darwin'
> > -  summary_info +=3D {'Cocoa support':   cocoa}
> > +  summary_info +=3D {'Cocoa support':           cocoa}
> > +  summary_info +=3D {'vmnet.framework support': vmnet}
> >  endif
> >  summary_info +=3D {'SDL support':       sdl}
> >  summary_info +=3D {'SDL image support': sdl_image}
> > diff --git a/meson_options.txt b/meson_options.txt
> > index 921967eddb..701e1381f9 100644
> > --- a/meson_options.txt
> > +++ b/meson_options.txt
> > @@ -151,6 +151,8 @@ option('netmap', type : 'feature', value : 'auto',
> >         description: 'netmap network backend support')
> >  option('vde', type : 'feature', value : 'auto',
> >         description: 'vde network backend support')
> > +option('vmnet', type : 'feature', value : 'auto',
> > +       description: 'vmnet.framework network backend support')
> >  option('virglrenderer', type : 'feature', value : 'auto',
> >         description: 'virgl rendering support')
> >  option('vnc', type : 'feature', value : 'auto',
> > diff --git a/scripts/meson-buildoptions.sh
> b/scripts/meson-buildoptions.sh
> > index 50bd7bed4d..cdcece4b05 100644
> > --- a/scripts/meson-buildoptions.sh
> > +++ b/scripts/meson-buildoptions.sh
> > @@ -84,6 +84,7 @@ meson_options_help() {
> >    printf "%s\n" '  u2f             U2F emulation support'
> >    printf "%s\n" '  usb-redir       libusbredir support'
> >    printf "%s\n" '  vde             vde network backend support'
> > +  printf "%s\n" '  vmnet           vmnet.framework network backend
> support'
> >    printf "%s\n" '  vhost-user-blk-server'
> >    printf "%s\n" '                  build vhost-user-blk server'
> >    printf "%s\n" '  virglrenderer   virgl rendering support'
> > @@ -248,6 +249,8 @@ _meson_option_parse() {
> >      --disable-usb-redir) printf "%s" -Dusb_redir=3Ddisabled ;;
> >      --enable-vde) printf "%s" -Dvde=3Denabled ;;
> >      --disable-vde) printf "%s" -Dvde=3Ddisabled ;;
> > +    --enable-vmnet) printf "%s" -Dvmnet=3Denabled ;;
> > +    --disable-vmnet) printf "%s" -Dvmnet=3Ddisabled ;;
> >      --enable-vhost-user-blk-server) printf "%s"
> -Dvhost_user_blk_server=3Denabled ;;
> >      --disable-vhost-user-blk-server) printf "%s"
> -Dvhost_user_blk_server=3Ddisabled ;;
> >      --enable-virglrenderer) printf "%s" -Dvirglrenderer=3Denabled ;;
> > --
> > 2.23.0
> >
> >
>


--=20
Best Regards,

Vladislav Yaroshchuk

--0000000000000ef0f505d57873d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Fixed in v12. Thank you!</div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=D1=81=D1=80, 12 =
=D1=8F=D0=BD=D0=B2. 2022 =D0=B3. =D0=B2 19:53, Roman Bolshakov &lt;<a href=
=3D"mailto:roman@roolebo.dev" target=3D"_blank">roman@roolebo.dev</a>&gt;:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Jan 12, =
2022 at 03:21:44PM +0300, Vladislav Yaroshchuk wrote:<br>
&gt; vmnet.framework dependency is added with &#39;vmnet&#39; option<br>
&gt; to enable or disable it. Default value is &#39;auto&#39;.<br>
&gt; <br>
&gt; vmnet features to be used are available since macOS 11.0,<br>
&gt; corresponding probe is created into meson.build.<br>
&gt; <br>
&gt; Signed-off-by: Vladislav Yaroshchuk &lt;<a href=3D"mailto:yaroshchuk20=
00@gmail.com" target=3D"_blank">yaroshchuk2000@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 23 ++++++++++++++++++++++-<br>
&gt;=C2=A0 meson_options.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 2 ++<br>
&gt;=C2=A0 scripts/meson-buildoptions.sh |=C2=A0 3 +++<br>
&gt;=C2=A0 3 files changed, 27 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meson.build b/meson.build<br>
&gt; index c1b1db1e28..b912c9cb91 100644<br>
&gt; --- a/meson.build<br>
&gt; +++ b/meson.build<br>
&gt; @@ -496,6 +496,24 @@ if cocoa.found() and get_option(&#39;gtk&#39;).en=
abled()<br>
&gt;=C2=A0 =C2=A0 error(&#39;Cocoa and GTK+ cannot be enabled at the same t=
ime&#39;)<br>
&gt;=C2=A0 endif<br>
&gt;=C2=A0 <br>
&gt; +vmnet =3D dependency(&#39;appleframeworks&#39;, modules: &#39;vmnet&#=
39;, required: get_option(&#39;vmnet&#39;))<br>
&gt; +vmnet_11_0_api =3D false<br>
&gt; +if vmnet.found() and not cc.has_header_symbol(&#39;vmnet/vmnet.h&#39;=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &#39;VMNET_BRIDGED_MODE&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 dependencies: vmnet)<br>
&gt; +=C2=A0 vmnet =3D not_found<br>
&gt; +=C2=A0 if get_option(&#39;vmnet&#39;).enabled()<br>
&gt; +=C2=A0 =C2=A0 error(&#39;vmnet.framework API is outdated&#39;)<br>
&gt; +=C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 warning(&#39;vmnet.framework API is outdated, disabling=
&#39;)<br>
&gt; +=C2=A0 endif<br>
&gt; +endif<br>
&gt; +if vmnet.found() and cc.has_header_symbol(&#39;vmnet/vmnet.h&#39;,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &#39;VMNET_SHARING_SERVICE_BUSY&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 dependencies: vmnet)<br>
&gt; +=C2=A0 vmnet_11_0_api =3D true<br>
&gt; +endif<br>
&gt; +<br>
&gt;=C2=A0 seccomp =3D not_found<br>
&gt;=C2=A0 if not get_option(&#39;seccomp&#39;).auto() or have_system or ha=
ve_tools<br>
&gt;=C2=A0 =C2=A0 seccomp =3D dependency(&#39;libseccomp&#39;, version: &#3=
9;&gt;=3D2.3.0&#39;,<br>
&gt; @@ -1492,6 +1510,8 @@ config_host_data.set(&#39;CONFIG_SECCOMP&#39;, s=
eccomp.found())<br>
&gt;=C2=A0 config_host_data.set(&#39;CONFIG_SNAPPY&#39;, snappy.found())<br=
>
&gt;=C2=A0 config_host_data.set(&#39;CONFIG_USB_LIBUSB&#39;, libusb.found()=
)<br>
&gt;=C2=A0 config_host_data.set(&#39;CONFIG_VDE&#39;, vde.found())<br>
&gt; +config_host_data.set(&#39;CONFIG_VMNET&#39;, vmnet.found())<br>
&gt; +config_host_data.set(&#39;CONFIG_VMNET_11_0_API&#39;, vmnet_11_0_api)=
<br>
<br>
Hi Vladislav,<br>
<br>
There might be more functionality coming in the next macOS versions but<br>
we likely don&#39;t want to add them as extra CONFIG defines. Instead we<br=
>
wrap new symbols/functions/code that are avaialble above Big Sur in the<br>
code as:<br>
<br>
#if defined(MAC_OS_VERSION_11_0) &amp;&amp; \<br>
=C2=A0 =C2=A0 MAC_OS_X_VERSION_MAX_ALLOWED &gt;=3D MAC_OS_VERSION_11_0<br>
<br>
=C2=A0 =C2=A0 xpc_dictionary_set_bool(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if_desc,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_enable_isolation_key,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 options-&gt;isolated<br>
=C2=A0 =C2=A0 );<br>
<br>
#endif<br>
<br>
Please see similar thread here:<br>
<a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2022-01/msg01915.h=
tml" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/archive/htm=
l/qemu-devel/2022-01/msg01915.html</a><br>
<br>
Thanks,<br>
Roman<br>
<br>
&gt;=C2=A0 config_host_data.set(&#39;CONFIG_VHOST_USER_BLK_SERVER&#39;, hav=
e_vhost_user_blk_server)<br>
&gt;=C2=A0 config_host_data.set(&#39;CONFIG_VNC&#39;, vnc.found())<br>
&gt;=C2=A0 config_host_data.set(&#39;CONFIG_VNC_JPEG&#39;, jpeg.found())<br=
>
&gt; @@ -3406,7 +3426,8 @@ summary(summary_info, bool_yn: true, section: &#=
39;Crypto&#39;)<br>
&gt;=C2=A0 # Libraries<br>
&gt;=C2=A0 summary_info =3D {}<br>
&gt;=C2=A0 if targetos =3D=3D &#39;darwin&#39;<br>
&gt; -=C2=A0 summary_info +=3D {&#39;Cocoa support&#39;:=C2=A0 =C2=A0cocoa}=
<br>
&gt; +=C2=A0 summary_info +=3D {&#39;Cocoa support&#39;:=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0cocoa}<br>
&gt; +=C2=A0 summary_info +=3D {&#39;vmnet.framework support&#39;: vmnet}<b=
r>
&gt;=C2=A0 endif<br>
&gt;=C2=A0 summary_info +=3D {&#39;SDL support&#39;:=C2=A0 =C2=A0 =C2=A0 =
=C2=A0sdl}<br>
&gt;=C2=A0 summary_info +=3D {&#39;SDL image support&#39;: sdl_image}<br>
&gt; diff --git a/meson_options.txt b/meson_options.txt<br>
&gt; index 921967eddb..701e1381f9 100644<br>
&gt; --- a/meson_options.txt<br>
&gt; +++ b/meson_options.txt<br>
&gt; @@ -151,6 +151,8 @@ option(&#39;netmap&#39;, type : &#39;feature&#39;,=
 value : &#39;auto&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;netmap network back=
end support&#39;)<br>
&gt;=C2=A0 option(&#39;vde&#39;, type : &#39;feature&#39;, value : &#39;aut=
o&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;vde network backend=
 support&#39;)<br>
&gt; +option(&#39;vmnet&#39;, type : &#39;feature&#39;, value : &#39;auto&#=
39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;vmnet.framework network =
backend support&#39;)<br>
&gt;=C2=A0 option(&#39;virglrenderer&#39;, type : &#39;feature&#39;, value =
: &#39;auto&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;virgl rendering sup=
port&#39;)<br>
&gt;=C2=A0 option(&#39;vnc&#39;, type : &#39;feature&#39;, value : &#39;aut=
o&#39;,<br>
&gt; diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoption=
s.sh<br>
&gt; index 50bd7bed4d..cdcece4b05 100644<br>
&gt; --- a/scripts/meson-buildoptions.sh<br>
&gt; +++ b/scripts/meson-buildoptions.sh<br>
&gt; @@ -84,6 +84,7 @@ meson_options_help() {<br>
&gt;=C2=A0 =C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 u2f=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0U2F emulation support&#39;<br>
&gt;=C2=A0 =C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 usb-redir=C2=A0 =C2=
=A0 =C2=A0 =C2=A0libusbredir support&#39;<br>
&gt;=C2=A0 =C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 vde=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vde network backend support&#39;<br>
&gt; +=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 vmnet=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0vmnet.framework network backend support&#39;<br>
&gt;=C2=A0 =C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 vhost-user-blk-server=
&#39;<br>
&gt;=C2=A0 =C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 build vhost-user-blk server&#39;<br>
&gt;=C2=A0 =C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 virglrenderer=C2=A0 =
=C2=A0virgl rendering support&#39;<br>
&gt; @@ -248,6 +249,8 @@ _meson_option_parse() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --disable-usb-redir) printf &quot;%s&quot; -Dusb_r=
edir=3Ddisabled ;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --enable-vde) printf &quot;%s&quot; -Dvde=3Denable=
d ;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --disable-vde) printf &quot;%s&quot; -Dvde=3Ddisab=
led ;;<br>
&gt; +=C2=A0 =C2=A0 --enable-vmnet) printf &quot;%s&quot; -Dvmnet=3Denabled=
 ;;<br>
&gt; +=C2=A0 =C2=A0 --disable-vmnet) printf &quot;%s&quot; -Dvmnet=3Ddisabl=
ed ;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --enable-vhost-user-blk-server) printf &quot;%s&qu=
ot; -Dvhost_user_blk_server=3Denabled ;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --disable-vhost-user-blk-server) printf &quot;%s&q=
uot; -Dvhost_user_blk_server=3Ddisabled ;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --enable-virglrenderer) printf &quot;%s&quot; -Dvi=
rglrenderer=3Denabled ;;<br>
&gt; -- <br>
&gt; 2.23.0<br>
&gt; <br>
&gt; <br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr">Best Regards,<div><br><div>Vladislav Yaroshchuk</div></di=
v></div></div></div>

--0000000000000ef0f505d57873d6--


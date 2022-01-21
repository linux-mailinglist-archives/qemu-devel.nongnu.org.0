Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA63495ED5
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 13:06:00 +0100 (CET)
Received: from localhost ([::1]:57560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAsg2-0001mg-Nd
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 07:05:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1nAsZ0-0007MP-JX
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 06:58:43 -0500
Received: from [2607:f8b0:4864:20::631] (port=37804
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1nAsYx-0004qW-EJ
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 06:58:41 -0500
Received: by mail-pl1-x631.google.com with SMTP id n11so8152091plf.4
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 03:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WAl6e/wfbJLGxbA2EjaRdqn9lZMCM/24okYGsify6KQ=;
 b=H06p9aUMjOQG8TX4BtrCOB5EQl+3iVyQ591t64DqwtNyUoHObQuzdF5J530Vvi1GtS
 mcGqn5B6U2gdIM2ybKM93XkOxeUEqz6/vQNHkQ9sPHw6Yy5rrImPowJw1cXrqM5Sf1hj
 qkMlJhyvuD+3giG1hcjdbWjZy+u4IiTEAyGRcbO2TS9JkbYOtVFNwqTvno9lIAnKMrGt
 aJL56yl2r8n7CdzYBs5Wm/b7wMs3mwdvES6t4QBOC9MqUPxrNSX+J8si12nF2CmER2cg
 7CNf6OmZh2hJQmaFxy6fmt1zS56EjZ0rlTil/jHLOh44CxcILKufKaqrIrVHM06qbxoz
 TUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WAl6e/wfbJLGxbA2EjaRdqn9lZMCM/24okYGsify6KQ=;
 b=lzfTb0Fh/RZYj82CO1Rs4Tak1j1zC4U+hBBmMkqTOVICHlKLzmU96dpvRRjIstd1iW
 4z+waUTvCZcShV/ritlk1lHCzanFByaPzAnzY+BLEGPOlPn0n6SRN3Kr6VsVuoisz+ov
 HZNenXof5aqg84gtosJYCnF3piaW8DJcR09NRuMz90ge2bX4WGH3fsUN1PR9QRXRIgFq
 d57d9hXHC+VXjHES6BGPGNV7TY7ZbvzucNYS6wnJxDTOdAtfALMqxkr2ZS8r+1p+V7OZ
 L8eb1srMrjqdnqqGc5LycLEV5dxZpqjiTFj44ywcqrD7DnnE2UyOKA/OKfcJN/SZh6d5
 M9xA==
X-Gm-Message-State: AOAM5306inTFUjDXEUk3ZSfRK8n//+mXgw/OMtI7WxlatIp9/CSKG6xj
 wAuMhwwUgqL5EJZL2/MJa/bwKFqNqmgoi1bZIr0=
X-Google-Smtp-Source: ABdhPJzslxR4tcbL5KlhtFCoSnwVKG2h8sOljQfyQxehAxlipmx3lKk5HG7nYwFSIa+gy96JpLF8nCfCdQHlakME2+s=
X-Received: by 2002:a17:902:e8c2:b0:149:fdf8:270 with SMTP id
 v2-20020a170902e8c200b00149fdf80270mr3695245plg.167.1642766315697; Fri, 21
 Jan 2022 03:58:35 -0800 (PST)
MIME-Version: 1.0
References: <20220113172219.66372-1-yaroshchuk2000@gmail.com>
 <20220113172219.66372-2-yaroshchuk2000@gmail.com>
 <YekL2+aM/vpC7LKy@roolebo.dev>
In-Reply-To: <YekL2+aM/vpC7LKy@roolebo.dev>
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Date: Fri, 21 Jan 2022 14:58:24 +0300
Message-ID: <CADO9X9RKAsQYdeTa7UCoBgY9bzpTk-rgxDuUFR-X9KWw4tFfLg@mail.gmail.com>
Subject: Re: [PATCH v13 1/7] net/vmnet: add vmnet dependency and customizable
 option
To: Roman Bolshakov <roman@roolebo.dev>
Content-Type: multipart/alternative; boundary="000000000000b23b8505d61656f8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>, phillip.ennen@gmail.com,
 qemu-devel <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Markus Armbruster <armbru@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Phillip Tennen <phillip@axleos.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Howard Spoelstra <hsp.cat7@gmail.com>,
 Alessio Dionisi <hello@adns.io>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b23b8505d61656f8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Roman,

=D1=87=D1=82, 20 =D1=8F=D0=BD=D0=B2. 2022 =D0=B3. =D0=B2 10:14, Roman Bolsh=
akov <roman@roolebo.dev>:

> On Thu, Jan 13, 2022 at 08:22:13PM +0300, Vladislav Yaroshchuk wrote:
> > vmnet.framework dependency is added with 'vmnet' option
> > to enable or disable it. Default value is 'auto'.
> >
> > vmnet features to be used are available since macOS 11.0,
>
> Hi Vladislav,
>
> I'm not sure if the comment belongs here. Perhaps you mean that bridged
> mode is available from 10.15:
>
>         VMNET_BRIDGED_MODE API_AVAILABLE(macos(10.15))  =3D 1002
>
>
Yes, I forgot to update this part of the cover letter, thank you.


> This means vmnet.framework is supported on all macbooks starting from 201=
2.
>
> With this fixed,
> Tested-by: Roman Bolshakov <roman@roolebo.dev>
> Reviewed-by: Roman Bolshakov <roman@roolebo.dev>
>
> The other two modes - shared and host are supported on earlier versions
> of macOS (from 10.10). But port forwarding is only available from macOS
> 10.15.
>
> Theoretically it should possible to support the framework on the earlier
> models from 2010 or 2007 on Yosemite up to High Sierra with less
> features using MacPorts but I don't think it'd be reasonable to ask
> that.
>
>
I'm not sure it's necessary to support such old models. Compatibility with
10.15 on 2012+ macs is enough I think.

Thanks,
> Roman
>
> > corresponding probe is created into meson.build.
> >
> > Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> > ---
> >  meson.build                   | 16 +++++++++++++++-
> >  meson_options.txt             |  2 ++
> >  scripts/meson-buildoptions.sh |  3 +++
> >  3 files changed, 20 insertions(+), 1 deletion(-)
> >
> > diff --git a/meson.build b/meson.build
> > index c1b1db1e28..285fb7bc41 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -496,6 +496,18 @@ if cocoa.found() and get_option('gtk').enabled()
> >    error('Cocoa and GTK+ cannot be enabled at the same time')
> >  endif
> >
> > +vmnet =3D dependency('appleframeworks', modules: 'vmnet', required:
> get_option('vmnet'))
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
> > +
> >  seccomp =3D not_found
> >  if not get_option('seccomp').auto() or have_system or have_tools
> >    seccomp =3D dependency('libseccomp', version: '>=3D2.3.0',
> > @@ -1492,6 +1504,7 @@ config_host_data.set('CONFIG_SECCOMP',
> seccomp.found())
> >  config_host_data.set('CONFIG_SNAPPY', snappy.found())
> >  config_host_data.set('CONFIG_USB_LIBUSB', libusb.found())
> >  config_host_data.set('CONFIG_VDE', vde.found())
> > +config_host_data.set('CONFIG_VMNET', vmnet.found())
> >  config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER',
> have_vhost_user_blk_server)
> >  config_host_data.set('CONFIG_VNC', vnc.found())
> >  config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
> > @@ -3406,7 +3419,8 @@ summary(summary_info, bool_yn: true, section:
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
>


--=20
Best Regards,

Vladislav Yaroshchuk

--000000000000b23b8505d61656f8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Roman,<br><br></div><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">=D1=87=D1=82, 20 =D1=8F=D0=
=BD=D0=B2. 2022 =D0=B3. =D0=B2 10:14, Roman Bolshakov &lt;<a href=3D"mailto=
:roman@roolebo.dev">roman@roolebo.dev</a>&gt;:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Thu, Jan 13, 2022 at 08:22:13PM +0300, =
Vladislav Yaroshchuk wrote:<br>
&gt; vmnet.framework dependency is added with &#39;vmnet&#39; option<br>
&gt; to enable or disable it. Default value is &#39;auto&#39;.<br>
&gt; <br>
&gt; vmnet features to be used are available since macOS 11.0,<br>
<br>
Hi Vladislav,<br>
<br>
I&#39;m not sure if the comment belongs here. Perhaps you mean that bridged=
<br>
mode is available from 10.15:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMNET_BRIDGED_MODE API_AVAILABLE(macos(10.15))=
=C2=A0 =3D 1002<br>
<br></blockquote><div><br>Yes, I forgot to update this part of the cover le=
tter, thank you.<br>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
This means vmnet.framework is supported on all macbooks starting from 2012.=
<br>
<br>
With this fixed,<br>
Tested-by: Roman Bolshakov &lt;<a href=3D"mailto:roman@roolebo.dev" target=
=3D"_blank">roman@roolebo.dev</a>&gt;<br>
Reviewed-by: Roman Bolshakov &lt;<a href=3D"mailto:roman@roolebo.dev" targe=
t=3D"_blank">roman@roolebo.dev</a>&gt;<br>
<br>
The other two modes - shared and host are supported on earlier versions<br>
of macOS (from 10.10). But port forwarding is only available from macOS<br>
10.15.<br>
<br>
Theoretically it should possible to support the framework on the earlier<br=
>
models from 2010 or 2007 on Yosemite up to High Sierra with less<br>
features using MacPorts but I don&#39;t think it&#39;d be reasonable to ask=
<br>
that.<br>
<br></blockquote><div><br></div><div>I&#39;m not sure it&#39;s necessary to=
 support such old models. Compatibility with=C2=A0</div><div>10.15 on 2012+=
 macs is enough I think.=C2=A0</div><div><br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
Thanks,<br>
Roman<br>
<br>
&gt; corresponding probe is created into meson.build.<br>
&gt; <br>
&gt; Signed-off-by: Vladislav Yaroshchuk &lt;<a href=3D"mailto:yaroshchuk20=
00@gmail.com" target=3D"_blank">yaroshchuk2000@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 16 +++++++++++++++-<br>
&gt;=C2=A0 meson_options.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 2 ++<br>
&gt;=C2=A0 scripts/meson-buildoptions.sh |=C2=A0 3 +++<br>
&gt;=C2=A0 3 files changed, 20 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meson.build b/meson.build<br>
&gt; index c1b1db1e28..285fb7bc41 100644<br>
&gt; --- a/meson.build<br>
&gt; +++ b/meson.build<br>
&gt; @@ -496,6 +496,18 @@ if cocoa.found() and get_option(&#39;gtk&#39;).en=
abled()<br>
&gt;=C2=A0 =C2=A0 error(&#39;Cocoa and GTK+ cannot be enabled at the same t=
ime&#39;)<br>
&gt;=C2=A0 endif<br>
&gt;=C2=A0 <br>
&gt; +vmnet =3D dependency(&#39;appleframeworks&#39;, modules: &#39;vmnet&#=
39;, required: get_option(&#39;vmnet&#39;))<br>
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
&gt; +<br>
&gt;=C2=A0 seccomp =3D not_found<br>
&gt;=C2=A0 if not get_option(&#39;seccomp&#39;).auto() or have_system or ha=
ve_tools<br>
&gt;=C2=A0 =C2=A0 seccomp =3D dependency(&#39;libseccomp&#39;, version: &#3=
9;&gt;=3D2.3.0&#39;,<br>
&gt; @@ -1492,6 +1504,7 @@ config_host_data.set(&#39;CONFIG_SECCOMP&#39;, s=
eccomp.found())<br>
&gt;=C2=A0 config_host_data.set(&#39;CONFIG_SNAPPY&#39;, snappy.found())<br=
>
&gt;=C2=A0 config_host_data.set(&#39;CONFIG_USB_LIBUSB&#39;, libusb.found()=
)<br>
&gt;=C2=A0 config_host_data.set(&#39;CONFIG_VDE&#39;, vde.found())<br>
&gt; +config_host_data.set(&#39;CONFIG_VMNET&#39;, vmnet.found())<br>
&gt;=C2=A0 config_host_data.set(&#39;CONFIG_VHOST_USER_BLK_SERVER&#39;, hav=
e_vhost_user_blk_server)<br>
&gt;=C2=A0 config_host_data.set(&#39;CONFIG_VNC&#39;, vnc.found())<br>
&gt;=C2=A0 config_host_data.set(&#39;CONFIG_VNC_JPEG&#39;, jpeg.found())<br=
>
&gt; @@ -3406,7 +3419,8 @@ summary(summary_info, bool_yn: true, section: &#=
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
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"l=
tr">Best Regards,<div><br><div>Vladislav Yaroshchuk</div></div></div></div>=
</div>

--000000000000b23b8505d61656f8--


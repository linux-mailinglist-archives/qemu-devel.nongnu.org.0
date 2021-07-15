Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6763C9AE6
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 10:55:55 +0200 (CEST)
Received: from localhost ([::1]:56870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3x9t-0004s1-UO
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 04:55:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1m3x8a-0004Aw-AR
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 04:54:32 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:36799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1m3x8Y-00062l-Hf
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 04:54:32 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 h24-20020a9d64180000b029036edcf8f9a6so5443086otl.3
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 01:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=so7fZ9vcz5dtRxkyG6SAP+DH0rYMK+e2vHeOc2ltn9o=;
 b=I60PnNvu324dS6hJVOMWs5eSpi2cvw3sFweUYVvzehyfdXZt3KKqpK/cQEhv6IBdQp
 873MEE9Gwj1N7rw7cH8RsQySZgk/up/UTo1IpWYCyahBneJevZr7/3EZo2eqvoiI3ar5
 IPWb5US8PeOJDMsgmBomijc0A1uh9I0CkMPJyzR0OF/SQFE5WS6wtwJURz5Vi3KZlnV5
 YurOrfy5l/RTBhKlq3CwjVeuyyJw6msyfK8kzMEhnvlv+OJxyoJk7h1/5Y3zv/NNtl7g
 NCqXpnGXO139rQ8R7W0GDTxypa+F5LcXCj3mkKm+np0wjjzqJS+bvt5dRhMWviUWJ9CS
 RYxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=so7fZ9vcz5dtRxkyG6SAP+DH0rYMK+e2vHeOc2ltn9o=;
 b=YfhXI7AbY2yu/0X4IZGbA7NjIXLu15f4gGOydWxAwE4HcXKDAMJtcFAClZw7/vvgxl
 VivF0MJLur0vjuT935e2dLnVGOYMtgulEcZW+/0DlhPj0YBepyS+WNv31j5Qa2yrlM8e
 dWXsZ06WChrAXx/1i+NvBEccMn6Gg4/Ejdf7uSwajn9/Fy/YQDRk+zO5iAcJ++0dEYV1
 7LH1tLf1AasSUOEifAhO2+D043SDDRe/NerbhPCN6yI3btdZQuZqorjqH6dOZPaCvfn+
 JVxezdWlQpUgx1jDp68XUKqep7g3zlJ0P5ohyLfVi/89MSRFLZdxL7va8iCUo2exJB7P
 fJEw==
X-Gm-Message-State: AOAM5326lHjudbuihcqZGaQT3s6DGThMsKuMTVu8lKFfdIXJYpLuccrA
 Zvpj6o0kMTlZ+DQ6NDUp9FUzGX91bY/t0c3LtiY=
X-Google-Smtp-Source: ABdhPJxMkTQiCUM3XQ+5zIrL8YWZmnMSu3jmh5OoR0PFyvaO5mhERz3GM7LiwLRWHoJN5mBwIivUB++K4xlTqCUpn/M=
X-Received: by 2002:a9d:ac9:: with SMTP id 67mr2933643otq.190.1626339268851;
 Thu, 15 Jul 2021 01:54:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210713220946.212562-1-mst@redhat.com>
 <CAFEAcA_ykJOv0s_44VKWFa3ti9pVD_u_3_G1MpAFdLRZ9oPH5w@mail.gmail.com>
In-Reply-To: <CAFEAcA_ykJOv0s_44VKWFa3ti9pVD_u_3_G1MpAFdLRZ9oPH5w@mail.gmail.com>
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Date: Thu, 15 Jul 2021 11:54:17 +0300
Message-ID: <CAC_L=vVJ-fLkJeKYnvx9HZivZ5mm79WtQ9OVHnNke+3smdXTYw@mail.gmail.com>
Subject: Re: [PULL 00/23] pc,pci,virtio: lots of new features
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000677b4605c7259eae"
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=marcel.apfelbaum@gmail.com; helo=mail-ot1-x32c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000677b4605c7259eae
Content-Type: text/plain; charset="UTF-8"

Hi,

On Wed, Jul 14, 2021 at 11:33 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Tue, 13 Jul 2021 at 23:10, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > The following changes since commit
> 708f50199b59476ec4b45ebcdf171550086d6292:
> >
> >   Merge remote-tracking branch
> 'remotes/ericb/tags/pull-nbd-2021-07-09-v2' into staging (2021-07-13
> 14:32:20 +0100)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> >
> > for you to fetch changes up to cf171f90d5e41730ad3e0ce23f1990f34b7e63ef:
> >
> >   vhost-vsock: SOCK_SEQPACKET feature bit support (2021-07-13 16:59:12
> -0400)
> >
> > ----------------------------------------------------------------
> > pc,pci,virtio: lots of new features
> >
> > Lots of last minute stuff.
> >
> > vhost-user-rng.
> > vhost-user-i2c.
> > vhost-vsock SOCK_SEQPACKET support.
> > IOMMU bypass.
> > ACPI based pci hotplug.
> >
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>
> This seems to produce a new meson warning:
>
> Configuring 50-qemu-gpu.json using configuration
> Configuring 50-qemu-virtiofsd.json using configuration
> Configuring 50-qemu-rng.json using configuration
> ../../tools/vhost-user-rng/meson.build:7: WARNING: The variable(s)
> 'libexecdir' in the input file
> 'tools/vhost-user-rng/50-qemu-rng.json.in' are not present in the
> given configuration data.
> Configuring 50-edk2-i386-secure.json using configuration
> Configuring 50-edk2-x86_64-secure.json using configuration
> Configuring 60-edk2-aarch64.json using configuration
>
> (the build then seems to go on to complete OK).
>

/cc Mathieu

The below patch solved the warning for me:

diff --git a/tools/vhost-user-rng/meson.build
b/tools/vhost-user-rng/meson.build
index 4dc386daf3..2192a65ca6 100644
--- a/tools/vhost-user-rng/meson.build
+++ b/tools/vhost-user-rng/meson.build
@@ -6,5 +6,5 @@ executable('vhost-user-rng', files(

 configure_file(input: '50-qemu-rng.json.in',
                output: '50-qemu-rng.json',
-               configuration: config_host,
+               configuration: { 'libexecdir' : get_option('prefix') /
get_option('libexecdir') },
                install_dir: qemu_datadir / 'vhost-user')


Thanks,
Marcel



>
> -- PMM
>
>

--000000000000677b4605c7259eae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,=C2=A0</div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 14, 2021 at 11:33 PM=
 Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydel=
l@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Tue, 13 Jul 2021 at 23:10, Michael S. Tsirkin &lt;<a href=3D=
"mailto:mst@redhat.com" target=3D"_blank">mst@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt; The following changes since commit 708f50199b59476ec4b45ebcdf171550086=
d6292:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0Merge remote-tracking branch &#39;remotes/ericb/tags/pull-=
nbd-2021-07-09-v2&#39; into staging (2021-07-13 14:32:20 +0100)<br>
&gt;<br>
&gt; are available in the Git repository at:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0git://<a href=3D"http://git.kernel.org/pub/scm/virt/kvm/ms=
t/qemu.git" rel=3D"noreferrer" target=3D"_blank">git.kernel.org/pub/scm/vir=
t/kvm/mst/qemu.git</a> tags/for_upstream<br>
&gt;<br>
&gt; for you to fetch changes up to cf171f90d5e41730ad3e0ce23f1990f34b7e63e=
f:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0vhost-vsock: SOCK_SEQPACKET feature bit support (2021-07-1=
3 16:59:12 -0400)<br>
&gt;<br>
&gt; ----------------------------------------------------------------<br>
&gt; pc,pci,virtio: lots of new features<br>
&gt;<br>
&gt; Lots of last minute stuff.<br>
&gt;<br>
&gt; vhost-user-rng.<br>
&gt; vhost-user-i2c.<br>
&gt; vhost-vsock SOCK_SEQPACKET support.<br>
&gt; IOMMU bypass.<br>
&gt; ACPI based pci hotplug.<br>
&gt;<br>
&gt; Signed-off-by: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com=
" target=3D"_blank">mst@redhat.com</a>&gt;<br>
<br>
This seems to produce a new meson warning:<br>
<br>
Configuring 50-qemu-gpu.json using configuration<br>
Configuring 50-qemu-virtiofsd.json using configuration<br>
Configuring 50-qemu-rng.json using configuration<br>
../../tools/vhost-user-rng/meson.build:7: WARNING: The variable(s)<br>
&#39;libexecdir&#39; in the input file<br>
&#39;tools/vhost-user-rng/<a href=3D"http://50-qemu-rng.json.in" rel=3D"nor=
eferrer" target=3D"_blank">50-qemu-rng.json.in</a>&#39; are not present in =
the<br>
given configuration data.<br>
Configuring 50-edk2-i386-secure.json using configuration<br>
Configuring 50-edk2-x86_64-secure.json using configuration<br>
Configuring 60-edk2-aarch64.json using configuration<br>
<br>
(the build then seems to go on to complete OK).<br></blockquote><div><br></=
div><div>/cc Mathieu<br></div><div><br></div><div>The below patch solved th=
e warning for me:</div><div><br></div><div>diff --git a/tools/vhost-user-rn=
g/meson.build b/tools/vhost-user-rng/meson.build<br>index 4dc386daf3..2192a=
65ca6 100644<br>--- a/tools/vhost-user-rng/meson.build<br>+++ b/tools/vhost=
-user-rng/meson.build<br>@@ -6,5 +6,5 @@ executable(&#39;vhost-user-rng&#39=
;, files(<br>=C2=A0<br>=C2=A0configure_file(input: &#39;<a href=3D"http://5=
0-qemu-rng.json.in">50-qemu-rng.json.in</a>&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output: &#39;50-qemu-rng.json&#39;,<br>-=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 configuration: config_hos=
t,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 configuration: { &=
#39;libexecdir&#39; : get_option(&#39;prefix&#39;) / get_option(&#39;libexe=
cdir&#39;) },<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 in=
stall_dir: qemu_datadir / &#39;vhost-user&#39;)<br></div><div><br></div><di=
v><br></div><div>Thanks,</div><div>Marcel</div><div><br></div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
-- PMM<br>
<br>
</blockquote></div></div>

--000000000000677b4605c7259eae--


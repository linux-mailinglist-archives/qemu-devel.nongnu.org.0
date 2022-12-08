Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 960596475C4
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 19:47:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3Luk-00072r-OC; Thu, 08 Dec 2022 13:46:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1p3Lug-00072h-NU
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 13:46:30 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1p3Lue-0007kw-Ba
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 13:46:30 -0500
Received: by mail-ej1-x632.google.com with SMTP id gh17so6146986ejb.6
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 10:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RvoBVPtJHvX6x0nSP9fgjNfuhGgHJ5JOWsQB7PZ4hFw=;
 b=7gKVVHE6uFxL+s3HLI61N1Mt91C5C1q+75HeBpDmYYh5OTrtpwIpJ9FnDDEueVkFDk
 9b/dEK7nM+/6qrIEvhfMGWcNkN9hgB2wJe6XKyvhqOQ2Gf2qwIpQyG6hKm7XtE1rV0pF
 ARG0O8IjE7eMEX/t0cqMQ5SpUCfgUh6ixOSih19bZWYNDVR3UZV8qpefjMnP7mK0cuTQ
 FoB5orCZjDb4TXiBPh6kBCTCnjc5qml8zWbKhCPKiH1+PkqdsTfBS5HunDDkhRcIMKTH
 AuvKkBEOu0H9d+ozBSS6PL5z/++43TzXWZNNi6l+cPCCv8bIAnJOZNMvHRWLieOS/0Kk
 JdmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RvoBVPtJHvX6x0nSP9fgjNfuhGgHJ5JOWsQB7PZ4hFw=;
 b=HeHI8TQSq2gi5a7Zvl0g2lHApTt/NOWN8hCNOw8PVsnvs/gqfmD+MnAM8OTODOVYAI
 jmVnrIN80bb/nzAGSOfV/nxvftpws25DPjIEW8GD80OEGcaNgyE/cZmO2i3SuMYvK+FJ
 KUJpSOnVf0ATyXDbzJi+j02oty7FkEeEc+93AITpdEtIa3wCWU5Gprj3OHXQFW7zJZrW
 08l/vHNZALZ4igfqRPExfMj15oJ450jdg7Zr8ffgTjl2DcyffZ/dtoZI+Z8hO2fyscRP
 YXzO17Hsc2D2B+QDZtiH7d7EJYgOD/twij6tLWSMV++HrmCk0kR+1BfRVYjQo4EzacCq
 bkcw==
X-Gm-Message-State: ANoB5pk8aKL1FzSY7Q5l0pMEITLr0YWJ9vrJR1fQg7oXMJHj10Ss8lSD
 qSuAthR7K/xtS0ZLMgmdPHG0AalOEooBIbffDpK/Uw==
X-Google-Smtp-Source: AA0mqf5rxpIKWcxhEXG9B3DB04CiS4/JHoLZm5XJWLGrGl+C0NJQA72gE81HvqdWbk+A7CXGeqxf8u8uBIbEEom5ixI=
X-Received: by 2002:a17:906:c2d3:b0:7c1:535:f2fb with SMTP id
 ch19-20020a170906c2d300b007c10535f2fbmr10354729ejb.252.1670525184690; Thu, 08
 Dec 2022 10:46:24 -0800 (PST)
MIME-Version: 1.0
References: <Y5GJpW/1s+NEah98@humpty.home.comstyle.com>
 <ddd4ff9b-7d9a-6f1d-c725-e6fe649188ab@linaro.org>
In-Reply-To: <ddd4ff9b-7d9a-6f1d-c725-e6fe649188ab@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 8 Dec 2022 11:46:13 -0700
Message-ID: <CANCZdfquMwKWhhn+DOiWiVdhQDiG18eKnkcM_E0ECtzmBUJmhg@mail.gmail.com>
Subject: Re: [PATCH] FreeBSD: Upgrade to 12.4 release
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Brad Smith <brad@comstyle.com>, Alex Benn_e <alex.bennee@linaro.org>, 
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, 
 Ed Maste <emaste@freebsd.org>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Kyle Evans <kevans@freebsd.org>, 
 Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000038dd3e05ef5574b7"
Received-SPF: none client-ip=2a00:1450:4864:20::632;
 envelope-from=wlosh@bsdimp.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--00000000000038dd3e05ef5574b7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 8, 2022 at 12:47 AM Philippe Mathieu-Daud=C3=A9 <philmd@linaro.=
org>
wrote:

> On 8/12/22 07:52, Brad Smith wrote:
> > FreeBSD: Upgrade to 12.4 release
> >
> > Signed-off-by: Brad Smith <brad@comstyle.com>
> > ---
> >   .gitlab-ci.d/cirrus.yml | 2 +-
> >   tests/vm/freebsd        | 4 ++--
> >   2 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
> > index 634a73a742..785b163aa6 100644
> > --- a/.gitlab-ci.d/cirrus.yml
> > +++ b/.gitlab-ci.d/cirrus.yml
> > @@ -50,7 +50,7 @@ x64-freebsd-12-build:
> >       NAME: freebsd-12
> >       CIRRUS_VM_INSTANCE_TYPE: freebsd_instance
> >       CIRRUS_VM_IMAGE_SELECTOR: image_family
> > -    CIRRUS_VM_IMAGE_NAME: freebsd-12-3
> > +    CIRRUS_VM_IMAGE_NAME: freebsd-12-4
> >       CIRRUS_VM_CPUS: 8
> >       CIRRUS_VM_RAM: 8G
> >       UPDATE_COMMAND: pkg update
> > diff --git a/tests/vm/freebsd b/tests/vm/freebsd
> > index d6ff4461ba..ba2ba23d24 100755
> > --- a/tests/vm/freebsd
> > +++ b/tests/vm/freebsd
> > @@ -28,8 +28,8 @@ class FreeBSDVM(basevm.BaseVM):
> >       name =3D "freebsd"
> >       arch =3D "x86_64"
> >
> > -    link =3D "
> https://download.freebsd.org/ftp/releases/ISO-IMAGES/12.3/FreeBSD-12.3-RE=
LEASE-amd64-disc1.iso.xz
> "
> > -    csum =3D
> "36dd0de50f1fe5f0a88e181e94657656de26fb64254412f74e80e128e8b938b4"
> > +    link =3D "
> https://download.freebsd.org/ftp/releases/ISO-IMAGES/12.4/FreeBSD-12.4-RE=
LEASE-amd64-disc1.iso.xz
> "
> > +    csum =3D
> "1dcf6446e31bf3f81b582e9aba3319a258c29a937a2af6138ee4b181ed719a87"
>
> I don't remember and wonder why we don't use the pre-populated image:
>
> https://download.freebsd.org/ftp/releases/VM-IMAGES/12.4-RELEASE/amd64/La=
test/FreeBSD-12.4-RELEASE-amd64.qcow2.xz


QEMU's CI pre-dates the FreeBSD project producing those images. I don't
think there's a big technical reason to not use them, though some of the
scripting would need to change (mostly, I think, to delete things, and
maybe to more-directly change config files to effect some of the settings
done via the installer).


> Anyhow,
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>

Reviewed by: Warner Losh <imp@bsdimp.com>

--00000000000038dd3e05ef5574b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 8, 2022 at 12:47 AM Phili=
ppe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">philmd@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On 8/12/22 07:52, Brad Smith wrote:<br>
&gt; FreeBSD: Upgrade to 12.4 release<br>
&gt; <br>
&gt; Signed-off-by: Brad Smith &lt;<a href=3D"mailto:brad@comstyle.com" tar=
get=3D"_blank">brad@comstyle.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0.gitlab-ci.d/cirrus.yml | 2 +-<br>
&gt;=C2=A0 =C2=A0tests/vm/freebsd=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
&gt;=C2=A0 =C2=A02 files changed, 3 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml<br>
&gt; index 634a73a742..785b163aa6 100644<br>
&gt; --- a/.gitlab-ci.d/cirrus.yml<br>
&gt; +++ b/.gitlab-ci.d/cirrus.yml<br>
&gt; @@ -50,7 +50,7 @@ x64-freebsd-12-build:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0NAME: freebsd-12<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0CIRRUS_VM_INSTANCE_TYPE: freebsd_instance<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0CIRRUS_VM_IMAGE_SELECTOR: image_family<br>
&gt; -=C2=A0 =C2=A0 CIRRUS_VM_IMAGE_NAME: freebsd-12-3<br>
&gt; +=C2=A0 =C2=A0 CIRRUS_VM_IMAGE_NAME: freebsd-12-4<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0CIRRUS_VM_CPUS: 8<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0CIRRUS_VM_RAM: 8G<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0UPDATE_COMMAND: pkg update<br>
&gt; diff --git a/tests/vm/freebsd b/tests/vm/freebsd<br>
&gt; index d6ff4461ba..ba2ba23d24 100755<br>
&gt; --- a/tests/vm/freebsd<br>
&gt; +++ b/tests/vm/freebsd<br>
&gt; @@ -28,8 +28,8 @@ class FreeBSDVM(basevm.BaseVM):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0name =3D &quot;freebsd&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0arch =3D &quot;x86_64&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 link =3D &quot;<a href=3D"https://download.freebsd.org/=
ftp/releases/ISO-IMAGES/12.3/FreeBSD-12.3-RELEASE-amd64-disc1.iso.xz" rel=
=3D"noreferrer" target=3D"_blank">https://download.freebsd.org/ftp/releases=
/ISO-IMAGES/12.3/FreeBSD-12.3-RELEASE-amd64-disc1.iso.xz</a>&quot;<br>
&gt; -=C2=A0 =C2=A0 csum =3D &quot;36dd0de50f1fe5f0a88e181e94657656de26fb64=
254412f74e80e128e8b938b4&quot;<br>
&gt; +=C2=A0 =C2=A0 link =3D &quot;<a href=3D"https://download.freebsd.org/=
ftp/releases/ISO-IMAGES/12.4/FreeBSD-12.4-RELEASE-amd64-disc1.iso.xz" rel=
=3D"noreferrer" target=3D"_blank">https://download.freebsd.org/ftp/releases=
/ISO-IMAGES/12.4/FreeBSD-12.4-RELEASE-amd64-disc1.iso.xz</a>&quot;<br>
&gt; +=C2=A0 =C2=A0 csum =3D &quot;1dcf6446e31bf3f81b582e9aba3319a258c29a93=
7a2af6138ee4b181ed719a87&quot;<br>
<br>
I don&#39;t remember and wonder why we don&#39;t use the pre-populated imag=
e:<br>
<a href=3D"https://download.freebsd.org/ftp/releases/VM-IMAGES/12.4-RELEASE=
/amd64/Latest/FreeBSD-12.4-RELEASE-amd64.qcow2.xz" rel=3D"noreferrer" targe=
t=3D"_blank">https://download.freebsd.org/ftp/releases/VM-IMAGES/12.4-RELEA=
SE/amd64/Latest/FreeBSD-12.4-RELEASE-amd64.qcow2.xz</a></blockquote><div><b=
r></div><div>QEMU&#39;s CI pre-dates the FreeBSD project producing those im=
ages. I don&#39;t think there&#39;s a big technical reason to not use them,=
 though some of the scripting would need to change (mostly, I think, to del=
ete things, and maybe to more-directly change config files to effect some o=
f the settings done via the installer).</div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">Anyhow,<br>
<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linar=
o.org" target=3D"_blank">philmd@linaro.org</a>&gt;<br>
Tested-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.=
org" target=3D"_blank">philmd@linaro.org</a>&gt;<br></blockquote><div><br><=
/div><div>Reviewed by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com">im=
p@bsdimp.com</a>&gt;=C2=A0</div></div></div>

--00000000000038dd3e05ef5574b7--


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AE437B52E
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 06:55:11 +0200 (CEST)
Received: from localhost ([::1]:44912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lggtq-00021x-C4
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 00:55:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1lggsj-0000eT-PJ
 for qemu-devel@nongnu.org; Wed, 12 May 2021 00:54:01 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:34332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1lggsh-0004ST-SR
 for qemu-devel@nongnu.org; Wed, 12 May 2021 00:54:01 -0400
Received: by mail-il1-x129.google.com with SMTP id c16so255024ilo.1
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 21:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=0DVb5p98Z7zqSmchTjUxTwZcZ7tGapgoWSmMAmgvbJ0=;
 b=FTM/fYI8HdwvtAX+dPwwT5cCHkbrCQl2rmrwvRaBdx9jDs+Vq4sAv3LH6dpMeTwpOH
 sDb7SxgTxShZ69S0Lp58cadPxOUz1whygpQsWc7vTT54pT2EHpt4U2p7VJNzrsnc/cTJ
 lwfKyyXdGPjmEFxZi7sQ1Nb+SL8vA6XsAo39lJbKVJ7WlJcTzDSjFZDwojtHMG9iPx7y
 n7iaYLgTtguK/RV41iWTUa73Qwub9cPjMLjkdDPA15X2AyNIza+qeA5GgjABy3gppPLY
 2K4A994T6N+wS5CgojIkLB7wKLmJWybREcjB/D6N+6kaFejAixlZHqUdRJsOdtj+NZ95
 gBOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=0DVb5p98Z7zqSmchTjUxTwZcZ7tGapgoWSmMAmgvbJ0=;
 b=m6inPUK/FehhX/yDdiptkpSNpbFdw1HcHy8kT7kGCiOqsBIapz1ed1OZ7LHuLMdrWL
 pcX6cI88HhgVmWuS8/gYGEylCzd9aNpFVzW60mNHuKpIx4VwVeKBSptPWVipMuNwWFLu
 DmwFTK7Yv+mXEyUyDFnLg5R0ak8KC/MVylVckR4bkVToZffdEfiLrWwBKtpmQInYV/ZR
 6gXyBRl4+e7ySu9qpLS4Z9XRizkzKYfxTtl7prpJke5kYeSLwwwgsvl4FEeantFipOmN
 mj2Y5ahWWJl+Vjuso6IT5zHXZdNHBLMGnNeO1EeszaiOiPYnlIvLzk0g7Cz/LBMYUDyY
 9I2w==
X-Gm-Message-State: AOAM532prUZJ4PMzHJsNnarHcvahiG8/NEq6uums3jChtyMelTgiICUh
 4NRTiU1u4zEedWQo8DX9PhjI0Hb0x2G2RKaJ8xY=
X-Google-Smtp-Source: ABdhPJzjqb93TXHJMXI/ROrO6CvJh4Q1YqVjxH9jsRd7E9qQMAceYJRohnELp0XFlXk5SNQX5qr7guW5O86l5aemHfY=
X-Received: by 2002:a92:510:: with SMTP id q16mr16606776ile.41.1620795238201; 
 Tue, 11 May 2021 21:53:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210504100223.25427-1-alex.bennee@linaro.org>
 <20210504100223.25427-30-alex.bennee@linaro.org>
 <8039feba-b319-aa4a-63a5-db13f011882a@amsat.org>
In-Reply-To: <8039feba-b319-aa4a-63a5-db13f011882a@amsat.org>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Wed, 12 May 2021 12:53:46 +0800
Message-ID: <CAE2XoE9NZ53_dsX7fqKMzFF8g2E9QeD=tZ5X7u1hHYUgKr57yA@mail.gmail.com>
Subject: Re: [PATCH v2 29/30] cirrus.yml: Fix the MSYS2 task
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="0000000000006d3ec105c21acc2c"
Received-SPF: pass client-ip=2607:f8b0:4864:20::129;
 envelope-from=luoyonggang@gmail.com; helo=mail-il1-x129.google.com
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
Reply-To: luoyonggang@gmail.com
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Ed Maste <emaste@freebsd.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006d3ec105c21acc2c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

LGTM, Thanks, forget to update this

On Wed, May 12, 2021 at 12:49 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg>
wrote:

> Hi Yonggang Luo,
>
> Does this look OK to you?
>
> On 5/4/21 12:02 PM, Alex Benn=C3=A9e wrote:
> > From: Thomas Huth <thuth@redhat.com>
> >
> > The MSYS2 task in the Cirrus-CI is currently failing with error message=
s
> > like this:
> >
> >  warning: database file for 'ucrt64' does not exist (use '-Sy' to
> download)
> >  :: Starting core system upgrade...
> >   there is nothing to do
> >  :: Starting full system upgrade...
> >  error: failed to prepare transaction (could not find database)
> >
> > Seems like it can be fixed by switching to a newer release and by
> refreshing
> > the database one more time after changing the /etc/pacman.conf file.
> >
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > Message-Id: <20210427185524.281883-1-thuth@redhat.com>
> > ---
> >  .cirrus.yml | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/.cirrus.yml b/.cirrus.yml
> > index f53c519447..f4bf49b704 100644
> > --- a/.cirrus.yml
> > +++ b/.cirrus.yml
> > @@ -67,7 +67,7 @@ windows_msys2_task:
> >      CIRRUS_SHELL: powershell
> >      MSYS: winsymlinks:nativestrict
> >      MSYSTEM: MINGW64
> > -    MSYS2_URL:
> https://github.com/msys2/msys2-installer/releases/download/2021-01-05/msy=
s2-base-x86_64-20210105.sfx.exe
> > +    MSYS2_URL:
> https://github.com/msys2/msys2-installer/releases/download/2021-04-19/msy=
s2-base-x86_64-20210419.sfx.exe
> >      MSYS2_FINGERPRINT: 0
> >      MSYS2_PACKAGES: "
> >        diffutils git grep make pkg-config sed
> > @@ -130,7 +130,7 @@ windows_msys2_task:
> >          taskkill /F /FI "MODULES eq msys-2.0.dll"
> >          tasklist
> >          C:\tools\msys64\usr\bin\bash.exe -lc "mv -f
> /etc/pacman.conf.pacnew /etc/pacman.conf || true"
> > -        C:\tools\msys64\usr\bin\bash.exe -lc "pacman --noconfirm -Suu
> --overwrite=3D*"
> > +        C:\tools\msys64\usr\bin\bash.exe -lc "pacman --noconfirm -Syuu
> --overwrite=3D*"
> >          Write-Output "Core install time taken:
> $((Get-Date).Subtract($start_time))"
> >          $start_time =3D Get-Date
> >
> >
>


--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--0000000000006d3ec105c21acc2c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">LGTM, Thanks, forget to update this</div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 12, 2021 at=
 12:49 PM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org=
">f4bug@amsat.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Hi Yonggang Luo,<br>
<br>
Does this look OK to you?<br>
<br>
On 5/4/21 12:02 PM, Alex Benn=C3=A9e wrote:<br>
&gt; From: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=3D"_b=
lank">thuth@redhat.com</a>&gt;<br>
&gt; <br>
&gt; The MSYS2 task in the Cirrus-CI is currently failing with error messag=
es<br>
&gt; like this:<br>
&gt; <br>
&gt;=C2=A0 warning: database file for &#39;ucrt64&#39; does not exist (use =
&#39;-Sy&#39; to download)<br>
&gt;=C2=A0 :: Starting core system upgrade...<br>
&gt;=C2=A0 =C2=A0there is nothing to do<br>
&gt;=C2=A0 :: Starting full system upgrade...<br>
&gt;=C2=A0 error: failed to prepare transaction (could not find database)<b=
r>
&gt; <br>
&gt; Seems like it can be fixed by switching to a newer release and by refr=
eshing<br>
&gt; the database one more time after changing the /etc/pacman.conf file.<b=
r>
&gt; <br>
&gt; Signed-off-by: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" tar=
get=3D"_blank">thuth@redhat.com</a>&gt;<br>
&gt; Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@lina=
ro.org" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
&gt; Message-Id: &lt;<a href=3D"mailto:20210427185524.281883-1-thuth@redhat=
.com" target=3D"_blank">20210427185524.281883-1-thuth@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 .cirrus.yml | 4 ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/.cirrus.yml b/.cirrus.yml<br>
&gt; index f53c519447..f4bf49b704 100644<br>
&gt; --- a/.cirrus.yml<br>
&gt; +++ b/.cirrus.yml<br>
&gt; @@ -67,7 +67,7 @@ windows_msys2_task:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 CIRRUS_SHELL: powershell<br>
&gt;=C2=A0 =C2=A0 =C2=A0 MSYS: winsymlinks:nativestrict<br>
&gt;=C2=A0 =C2=A0 =C2=A0 MSYSTEM: MINGW64<br>
&gt; -=C2=A0 =C2=A0 MSYS2_URL: <a href=3D"https://github.com/msys2/msys2-in=
staller/releases/download/2021-01-05/msys2-base-x86_64-20210105.sfx.exe" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/msys2/msys2-installer=
/releases/download/2021-01-05/msys2-base-x86_64-20210105.sfx.exe</a><br>
&gt; +=C2=A0 =C2=A0 MSYS2_URL: <a href=3D"https://github.com/msys2/msys2-in=
staller/releases/download/2021-04-19/msys2-base-x86_64-20210419.sfx.exe" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/msys2/msys2-installer=
/releases/download/2021-04-19/msys2-base-x86_64-20210419.sfx.exe</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 MSYS2_FINGERPRINT: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 MSYS2_PACKAGES: &quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 diffutils git grep make pkg-config sed<br>
&gt; @@ -130,7 +130,7 @@ windows_msys2_task:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 taskkill /F /FI &quot;MODULES eq msy=
s-2.0.dll&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tasklist<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 C:\tools\msys64\usr\bin\bash.exe -lc=
 &quot;mv -f /etc/pacman.conf.pacnew /etc/pacman.conf || true&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 C:\tools\msys64\usr\bin\bash.exe -lc &quo=
t;pacman --noconfirm -Suu --overwrite=3D*&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 C:\tools\msys64\usr\bin\bash.exe -lc &quo=
t;pacman --noconfirm -Syuu --overwrite=3D*&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Write-Output &quot;Core install time=
 taken: $((Get-Date).Subtract($start_time))&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $start_time =3D Get-Date<br>
&gt;=C2=A0 <br>
&gt; <br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =E6=AD=A4=E8=
=87=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=E5=88=9A<br>Yours<br>=C2=A0 =C2=
=A0 sincerely,<br>Yonggang Luo<br></div>

--0000000000006d3ec105c21acc2c--


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 650DE37B532
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 06:59:05 +0200 (CEST)
Received: from localhost ([::1]:47998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lggxc-0004Lb-H2
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 00:59:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1lggvK-0003Aq-O8
 for qemu-devel@nongnu.org; Wed, 12 May 2021 00:56:42 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:40567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1lggvI-0006G1-2B
 for qemu-devel@nongnu.org; Wed, 12 May 2021 00:56:42 -0400
Received: by mail-il1-x130.google.com with SMTP id h6so19141390ila.7
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 21:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=ZATmjx8HyBdx8/yFhjZtMP03GfLmn6C1WAnpXSP1eLo=;
 b=ozYc6NLYuyCQHjB8NEHb2VZTuChnuFyLAnquCxSaWJvVxkjgpMYi0LU/SiElfA04Wy
 6NmqfIrdZMm3Xx4kXy/P9ZtAN5fn+/G5PY37sLA00+X+YssH+7/GA/a1zFgBAIjIA+D2
 mxVz4dZWeaQsc+UnEyMqpmx1zgrxn9Ws7rd/Wj7lbNxAnwtmmH8yCD3CmDMyL1ldYKxs
 JWqag9Mi7QHIWHu51m+Wvyu2jAKdxZwXv4HQ98gLAsmF6uTA3AR1O+ObqRuc5periWAI
 coRL3SfFStIK7e7PRTlADvcCTn1Kq46ym9jcFzf+DDd0UZGhkiN7ArLjUzyC1krRNqJl
 QgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=ZATmjx8HyBdx8/yFhjZtMP03GfLmn6C1WAnpXSP1eLo=;
 b=ozqD+BVcmEresUoXgRpHKANdtxsazE0DwyY66GG7HgptwM8Ne9T5hW+6wm/oLYc/9z
 1YpbzZBELcdWCRpK/nTD2Og7vuw80/hXHsrEBmy0ilxc5sIz29jEiQaZYzDP9emXH34p
 obRU4kYewKcYcfu20AMwVI4+ukL/ieEkQ26PJv/FNGujNtzX+beQ8iSXvu2enSBiS+nz
 RsWlmCnDni4M2/t0sMDnrgwwYOypK3WpzAiSKvFpv87vqb17oVqP/NgCDVuNIRKJbvnq
 qyWLfjL4DtPNtS4nN0KtBR/mmRVQZwsnHQi5KQ4w8a2En93IlZ9cdqn6P4UdE/Grwc4D
 WeYQ==
X-Gm-Message-State: AOAM530F1nK4jcG0EmtCHXomkfpBft1BP26fPBBZJd7FP3irBcZ1o4PO
 p6zWP8oyNChe9L4PtoFq2UO28wsmN2ZL3RfCRmY=
X-Google-Smtp-Source: ABdhPJzrmsvrZbrrvr0iZMqxXOP407kec9DhGW6Yd8msMNdw9AwN9JRtciJW69AU0XW3vAMMkQ2dFTdJPjFJ6NsA2/I=
X-Received: by 2002:a92:c884:: with SMTP id w4mr29264547ilo.186.1620795399074; 
 Tue, 11 May 2021 21:56:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210504100223.25427-1-alex.bennee@linaro.org>
 <20210504100223.25427-30-alex.bennee@linaro.org>
In-Reply-To: <20210504100223.25427-30-alex.bennee@linaro.org>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Wed, 12 May 2021 12:56:27 +0800
Message-ID: <CAE2XoE_vcAE7DnksfCgt8nghwVzSwj9mOg9CPq8_ij70Uj1dhg@mail.gmail.com>
Subject: Re: [PATCH v2 29/30] cirrus.yml: Fix the MSYS2 task
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000003f9d805c21ad6c4"
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=luoyonggang@gmail.com; helo=mail-il1-x130.google.com
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
 qemu-level <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Ed Maste <emaste@freebsd.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000003f9d805c21ad6c4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Yonggang Luo <luoyonggang@gmail.com>

On Tue, May 4, 2021 at 6:09 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
> From: Thomas Huth <thuth@redhat.com>
>
> The MSYS2 task in the Cirrus-CI is currently failing with error messages
> like this:
>
>  warning: database file for 'ucrt64' does not exist (use '-Sy' to
download)
>  :: Starting core system upgrade...
>   there is nothing to do
>  :: Starting full system upgrade...
>  error: failed to prepare transaction (could not find database)
>
> Seems like it can be fixed by switching to a newer release and by
refreshing
> the database one more time after changing the /etc/pacman.conf file.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Message-Id: <20210427185524.281883-1-thuth@redhat.com>
> ---
>  .cirrus.yml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/.cirrus.yml b/.cirrus.yml
> index f53c519447..f4bf49b704 100644
> --- a/.cirrus.yml
> +++ b/.cirrus.yml
> @@ -67,7 +67,7 @@ windows_msys2_task:
>      CIRRUS_SHELL: powershell
>      MSYS: winsymlinks:nativestrict
>      MSYSTEM: MINGW64
> -    MSYS2_URL:
https://github.com/msys2/msys2-installer/releases/download/2021-01-05/msys2=
-base-x86_64-20210105.sfx.exe
> +    MSYS2_URL:
https://github.com/msys2/msys2-installer/releases/download/2021-04-19/msys2=
-base-x86_64-20210419.sfx.exe
>      MSYS2_FINGERPRINT: 0
>      MSYS2_PACKAGES: "
>        diffutils git grep make pkg-config sed
> @@ -130,7 +130,7 @@ windows_msys2_task:
>          taskkill /F /FI "MODULES eq msys-2.0.dll"
>          tasklist
>          C:\tools\msys64\usr\bin\bash.exe -lc "mv -f
/etc/pacman.conf.pacnew /etc/pacman.conf || true"
> -        C:\tools\msys64\usr\bin\bash.exe -lc "pacman --noconfirm -Suu
--overwrite=3D*"
> +        C:\tools\msys64\usr\bin\bash.exe -lc "pacman --noconfirm -Syuu
--overwrite=3D*"
>          Write-Output "Core install time taken:
$((Get-Date).Subtract($start_time))"
>          $start_time =3D Get-Date
>
> --
> 2.20.1
>


--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--00000000000003f9d805c21ad6c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Yonggang Luo &lt;<a href=3D"mailto:luoyonggan=
g@gmail.com">luoyonggang@gmail.com</a>&gt;<br><br>On Tue, May 4, 2021 at 6:=
09 PM Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.b=
ennee@linaro.org</a>&gt; wrote:<br>&gt;<br>&gt; From: Thomas Huth &lt;<a hr=
ef=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt;<br>&gt;<br>&gt; The=
 MSYS2 task in the Cirrus-CI is currently failing with error messages<br>&g=
t; like this:<br>&gt;<br>&gt; =C2=A0warning: database file for &#39;ucrt64&=
#39; does not exist (use &#39;-Sy&#39; to download)<br>&gt; =C2=A0:: Starti=
ng core system upgrade...<br>&gt; =C2=A0 there is nothing to do<br>&gt; =C2=
=A0:: Starting full system upgrade...<br>&gt; =C2=A0error: failed to prepar=
e transaction (could not find database)<br>&gt;<br>&gt; Seems like it can b=
e fixed by switching to a newer release and by refreshing<br>&gt; the datab=
ase one more time after changing the /etc/pacman.conf file.<br>&gt;<br>&gt;=
 Signed-off-by: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@r=
edhat.com</a>&gt;<br>&gt; Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"ma=
ilto:alex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt;<br>&gt; Message=
-Id: &lt;<a href=3D"mailto:20210427185524.281883-1-thuth@redhat.com">202104=
27185524.281883-1-thuth@redhat.com</a>&gt;<br>&gt; ---<br>&gt; =C2=A0.cirru=
s.yml | 4 ++--<br>&gt; =C2=A01 file changed, 2 insertions(+), 2 deletions(-=
)<br>&gt;<br>&gt; diff --git a/.cirrus.yml b/.cirrus.yml<br>&gt; index f53c=
519447..f4bf49b704 100644<br>&gt; --- a/.cirrus.yml<br>&gt; +++ b/.cirrus.y=
ml<br>&gt; @@ -67,7 +67,7 @@ windows_msys2_task:<br>&gt; =C2=A0 =C2=A0 =C2=
=A0CIRRUS_SHELL: powershell<br>&gt; =C2=A0 =C2=A0 =C2=A0MSYS: winsymlinks:n=
ativestrict<br>&gt; =C2=A0 =C2=A0 =C2=A0MSYSTEM: MINGW64<br>&gt; - =C2=A0 =
=C2=A0MSYS2_URL: <a href=3D"https://github.com/msys2/msys2-installer/releas=
es/download/2021-01-05/msys2-base-x86_64-20210105.sfx.exe">https://github.c=
om/msys2/msys2-installer/releases/download/2021-01-05/msys2-base-x86_64-202=
10105.sfx.exe</a><br>&gt; + =C2=A0 =C2=A0MSYS2_URL: <a href=3D"https://gith=
ub.com/msys2/msys2-installer/releases/download/2021-04-19/msys2-base-x86_64=
-20210419.sfx.exe">https://github.com/msys2/msys2-installer/releases/downlo=
ad/2021-04-19/msys2-base-x86_64-20210419.sfx.exe</a><br>&gt; =C2=A0 =C2=A0 =
=C2=A0MSYS2_FINGERPRINT: 0<br>&gt; =C2=A0 =C2=A0 =C2=A0MSYS2_PACKAGES: &quo=
t;<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0diffutils git grep make pkg-config se=
d<br>&gt; @@ -130,7 +130,7 @@ windows_msys2_task:<br>&gt; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0taskkill /F /FI &quot;MODULES eq msys-2.0.dll&quot;<br>&gt=
; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tasklist<br>&gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0C:\tools\msys64\usr\bin\bash.exe -lc &quot;mv -f /etc/pacman.c=
onf.pacnew /etc/pacman.conf || true&quot;<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =
=C2=A0C:\tools\msys64\usr\bin\bash.exe -lc &quot;pacman --noconfirm -Suu --=
overwrite=3D*&quot;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0C:\tools\msys64\us=
r\bin\bash.exe -lc &quot;pacman --noconfirm -Syuu --overwrite=3D*&quot;<br>=
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Write-Output &quot;Core install time=
 taken: $((Get-Date).Subtract($start_time))&quot;<br>&gt; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0$start_time =3D Get-Date<br>&gt;<br>&gt; --<br>&gt; 2.20.1=
<br>&gt;<br><br><br>--<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E6=AD=A4=E8=87=
=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=E5=88=9A<br>Yours<br>=C2=A0 =C2=A0 s=
incerely,<br>Yonggang Luo</div>

--00000000000003f9d805c21ad6c4--


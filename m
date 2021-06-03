Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B42F39A859
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 19:22:15 +0200 (CEST)
Received: from localhost ([::1]:60456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lor2s-0001SG-Cj
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 13:22:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <swethajoshi139@gmail.com>)
 id 1loqyY-0002cK-0F; Thu, 03 Jun 2021 13:17:46 -0400
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34]:40522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <swethajoshi139@gmail.com>)
 id 1loqyQ-000806-9M; Thu, 03 Jun 2021 13:17:45 -0400
Received: by mail-oo1-xc34.google.com with SMTP id
 j17-20020a0568200231b029024900620310so306863oob.7; 
 Thu, 03 Jun 2021 10:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qSmifdAWM+Db1pndhrYbyeas1hm2jHDz4udQE32WrIQ=;
 b=T01PuImhvu68zYXVYO53wv7/6wIToV7RHYRSj68Haii5ex7wxLQbG2q9sSAsBUWOlZ
 r88MapFubgrEDwlbcYDMTnLv5M+0RmYUsClyQhDHYIRpybsYRe1x36yZVEez+jcfAX1Z
 ZV/Q9QnqL1si5060iESqHlKmcuRqoslSZx9IbOlddWfNVGo4M9Y4017Hb6rs/wRJCNDL
 KPdGIzvqBCFZUdvLIHe9aaD2bhi8buRw9Lu/apVfeuW1Xe0n85Aw1f6b8qh5wqeGeyoX
 4fnUOpoDXdNUvb/U4WyVCYQ/Cinp9QZXikyc+SRLWGWNYn3KiZpIJUCkSjJcHbJ4nHMU
 FIUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qSmifdAWM+Db1pndhrYbyeas1hm2jHDz4udQE32WrIQ=;
 b=HsnZeNR0zoDwN1Z6wIFCAcMElppUm+PfoiFWVf14r6dXs3gEl384rRUdMIg8Rx/DU6
 8rbEOli+zAkSrYXsJWmzDddOvv4Dqj4+mpH3r1QPoUULJW90HMsRZAF5i9sEUEVY3qYw
 D/OKke9lXbaCfcwyAMIul+7HsxvbaBrw3rmp1dRtTAL9YlgSpmtYYZLo6aj6ySw3CCq6
 ThP3NZKUlYKoU7F/fLmrZZUrhtJHV+/uPNu55PBqw/mBQK5m8fSmxizZYtRKfKIql+ny
 cfO0yfnI+XSCwDrrTp91NIkkIsS7p3c53gg2rh3K60zedHTM+tFG64kQ3Av4vnP+LtJS
 t9nw==
X-Gm-Message-State: AOAM532V2rBooZE8YNcWlizXeg2FUO2zbqktrlQRuEhj+e8DlSOvTFhb
 jNnfXO6+WwoD6qEDs/EepyPlFx2nSxMlf8CwzRc=
X-Google-Smtp-Source: ABdhPJzc1yeYTsvScbJX3TxPJg4LpBmbsPaJYRR9t4LyH2UXUw+WywUcoNYhSZeBZEh3u4EqTYZUDlS8oUNzjUTfoDo=
X-Received: by 2002:a4a:d442:: with SMTP id p2mr231407oos.89.1622740655711;
 Thu, 03 Jun 2021 10:17:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210525025823.3208218-1-swethajoshi139@gmail.com>
 <331a819e-1745-4d4b-cc4a-82521a58186a@linaro.org>
 <CAFEAcA8RbVafdjn2hkXifAPUF=wxZup20PqPcRpQ1ivtnWCxww@mail.gmail.com>
 <CALf2nm+LFqM2=vDs8=YfyxQSUT-0xxaCiVmcQzrKoOa+zaTtdg@mail.gmail.com>
 <CAFEAcA-oX0JR80UYzYKvczHsfxWG6oH3Pg4pbM6ByDe57XEHHw@mail.gmail.com>
 <CALf2nmKhPaWJa944dR+kFAQ1hCLXF0XPwXaHTqJQ-C6EW7ACKg@mail.gmail.com>
 <CAFEAcA9E4s3dST0GJkdg24DDAn90WU1FEmXwoKD6oQmNSB1vVA@mail.gmail.com>
 <CABSBigR1L9sE36eYA0Mq4smx1E9A4umTOKTe_x97foSMkryRnw@mail.gmail.com>
 <CALf2nmLOqtwacgrQ91TTz9_QRUmFS9ZNii2Kk7-tQ7LNp9vw2Q@mail.gmail.com>
 <CABSBigTga9Xc+RJMN-F=fb_z22Wyh9beoVjRb6o+RA=KDV1ujg@mail.gmail.com>
In-Reply-To: <CABSBigTga9Xc+RJMN-F=fb_z22Wyh9beoVjRb6o+RA=KDV1ujg@mail.gmail.com>
From: Swetha Joshi <swethajoshi139@gmail.com>
Date: Thu, 3 Jun 2021 10:17:25 -0700
Message-ID: <CALf2nmKTPN1aAqfkn7OqjZ_ghE29r1sH8OKSjtW8fHRc6LVR-Q@mail.gmail.com>
Subject: Re: [PATCH_V3] Adding ifdefs to call the respective routines only
 when their configs are enabled
To: Dongjiu Geng <gengdongjiu1@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000058a6c705c3dfc081"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c34;
 envelope-from=swethajoshi139@gmail.com; helo=mail-oo1-xc34.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000058a6c705c3dfc081
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Basically, you need to remove CONFIG_VIRT_ARM=3Dy from arm-soft memu.mak an=
d
then enable KVM, I might have missed some places where you need to enable
kvm.

On Wed, Jun 2, 2021 at 6:44 AM Dongjiu Geng <gengdongjiu1@gmail.com> wrote:

> Swetha Joshi <swethajoshi139@gmail.com> =E4=BA=8E2021=E5=B9=B45=E6=9C=882=
9=E6=97=A5=E5=91=A8=E5=85=AD =E4=B8=8A=E5=8D=883:41=E5=86=99=E9=81=93=EF=BC=
=9A
> >
> > I apologize for the delay, here are the repro steps:
> > 1. Remove CONFIG_ARM_VIRT=3Dy from arm-softmmu.mak
> > 2. In .gitlab-ci.yml, crossbuild.yml and in tests/vm/Makefile.include,
> in all the places where we disable kvm using -disable-kvm, replace this
> with -enable-kvm
> > 3. Build
>
> According to your steps, I can not see such errors=EF=BC=8Calso your chan=
ge is
> odd. I suggested you do not this change until you indeed encounter
> errors
>
> diff --git a/default-configs/devices/arm-softmmu.mak
> b/default-configs/devices/arm-softmmu.mak
> index 0500156a0c..f47ab0f3b1 100644
> --- a/default-configs/devices/arm-softmmu.mak
> +++ b/default-configs/devices/arm-softmmu.mak
> @@ -6,7 +6,6 @@ CONFIG_ARM_V7M=3Dy
>  # CONFIG_PCI_DEVICES=3Dn
>  # CONFIG_TEST_DEVICES=3Dn
>
> -CONFIG_ARM_VIRT=3Dy
>  CONFIG_CUBIEBOARD=3Dy
>  CONFIG_EXYNOS4=3Dy
>  CONFIG_HIGHBANK=3Dy
> diff --git a/tests/vm/Makefile.include b/tests/vm/Makefile.include
> index e94d95ec54..95387c3e5a 100644
> --- a/tests/vm/Makefile.include
> +++ b/tests/vm/Makefile.include
> @@ -110,7 +110,7 @@ vm-build-%: $(IMAGES_DIR)/%.img
>                 "  VM-BUILD $*")
>
>  vm-boot-serial-%: $(IMAGES_DIR)/%.img
> -       qemu-system-x86_64 -enable-kvm -m 4G -smp 2 -nographic \
> +       qemu-system-x86_64 -disable-kvm -m 4G -smp 2 -nographic \
>                 -drive if=3Dnone,id=3Dvblk,cache=3Dwriteback,file=3D"$<" =
\
>                 -netdev user,id=3Dvnet \
>                 -device virtio-blk-pci,drive=3Dvblk \
>
>
> >
> > You should see errors pointing to these routines: virt_is_acpi_enabled,
> acpi_ghes_record_errors
> >
> > Thanks,
> > Swetha.
> >
> > On Fri, May 28, 2021 at 12:08 AM Dongjiu Geng <gengdongjiu1@gmail.com>
> wrote:
> >>
> >> Peter Maydell <peter.maydell@linaro.org> =E4=BA=8E2021=E5=B9=B45=E6=9C=
=8827=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8A=E5=8D=882:19=E5=86=99=E9=81=93=
=EF=BC=9A
> >> >
> >> > On Wed, 26 May 2021 at 18:32, Swetha Joshi <swethajoshi139@gmail.com=
>
> wrote:
> >> > >
> >> > > Hello,
> >> > >
> >> > > One of the qemu machines we use has KVM enabled, but we don't want
> the CONFIG_ARM_VIRT enabled as it pulls in emulation of a variety of
> physical hardware that we don't need. The compilation errors I mentioned
> are not in the qemu mainline per say but we see them in one of the qemu
> derived machines we use.
> >> >
> >> > Sure, but unless you can give me a recipe for reproducing the
> >> > build failure in mainline I can't really help...
> >>
> >> Hi Swetha=EF=BC=8C
> >>      Yes,  Can you give a method that how to reproduce the build
> >> failure issues? Thanks
> >>
> >> >
> >> > thanks
> >> > -- PMM
> >
> >
> >
> > --
> > Regards
> >
> > Swetha Joshi.
>
--=20
Regards

Swetha Joshi.

--00000000000058a6c705c3dfc081
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Basically, you need to remove CONFIG_VIRT_ARM=3Dy from ar=
m-soft memu.mak and then enable KVM, I might have missed some places where =
you need to enable kvm.=C2=A0</div><div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 2, 2021 at 6:44 AM Dongjiu Ge=
ng &lt;<a href=3D"mailto:gengdongjiu1@gmail.com">gengdongjiu1@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1e=
x;border-left-color:rgb(204,204,204)">Swetha Joshi &lt;<a href=3D"mailto:sw=
ethajoshi139@gmail.com" target=3D"_blank">swethajoshi139@gmail.com</a>&gt; =
=E4=BA=8E2021=E5=B9=B45=E6=9C=8829=E6=97=A5=E5=91=A8=E5=85=AD =E4=B8=8A=E5=
=8D=883:41=E5=86=99=E9=81=93=EF=BC=9A<br>
&gt;<br>
&gt; I apologize for the delay, here are the repro steps:<br>
&gt; 1. Remove CONFIG_ARM_VIRT=3Dy from arm-softmmu.mak<br>
&gt; 2. In .gitlab-ci.yml, crossbuild.yml and in tests/vm/Makefile.include,=
 in all the places where we disable kvm using -disable-kvm, replace this wi=
th -enable-kvm<br>
&gt; 3. Build<br>
<br>
According to your steps, I can not see such errors=EF=BC=8Calso your change=
 is<br>
odd. I suggested you do not this change until you indeed encounter<br>
errors<br>
<br>
diff --git a/default-configs/devices/arm-softmmu.mak<br>
b/default-configs/devices/arm-softmmu.mak<br>
index 0500156a0c..f47ab0f3b1 100644<br>
--- a/default-configs/devices/arm-softmmu.mak<br>
+++ b/default-configs/devices/arm-softmmu.mak<br>
@@ -6,7 +6,6 @@ CONFIG_ARM_V7M=3Dy<br>
=C2=A0# CONFIG_PCI_DEVICES=3Dn<br>
=C2=A0# CONFIG_TEST_DEVICES=3Dn<br>
<br>
-CONFIG_ARM_VIRT=3Dy<br>
=C2=A0CONFIG_CUBIEBOARD=3Dy<br>
=C2=A0CONFIG_EXYNOS4=3Dy<br>
=C2=A0CONFIG_HIGHBANK=3Dy<br>
diff --git a/tests/vm/Makefile.include b/tests/vm/Makefile.include<br>
index e94d95ec54..95387c3e5a 100644<br>
--- a/tests/vm/Makefile.include<br>
+++ b/tests/vm/Makefile.include<br>
@@ -110,7 +110,7 @@ vm-build-%: $(IMAGES_DIR)/%.img<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 VM-BUI=
LD $*&quot;)<br>
<br>
=C2=A0vm-boot-serial-%: $(IMAGES_DIR)/%.img<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0qemu-system-x86_64 -enable-kvm -m 4G -smp 2 -no=
graphic \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0qemu-system-x86_64 -disable-kvm -m 4G -smp 2 -n=
ographic \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -drive if=3Dnone,id=
=3Dvblk,cache=3Dwriteback,file=3D&quot;$&lt;&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -netdev user,id=3Dv=
net \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -device virtio-blk-=
pci,drive=3Dvblk \<br>
<br>
<br>
&gt;<br>
&gt; You should see errors pointing to these routines: virt_is_acpi_enabled=
, acpi_ghes_record_errors<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Swetha.<br>
&gt;<br>
&gt; On Fri, May 28, 2021 at 12:08 AM Dongjiu Geng &lt;<a href=3D"mailto:ge=
ngdongjiu1@gmail.com" target=3D"_blank">gengdongjiu1@gmail.com</a>&gt; wrot=
e:<br>
&gt;&gt;<br>
&gt;&gt; Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" targ=
et=3D"_blank">peter.maydell@linaro.org</a>&gt; =E4=BA=8E2021=E5=B9=B45=E6=
=9C=8827=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8A=E5=8D=882:19=E5=86=99=E9=81=
=93=EF=BC=9A<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Wed, 26 May 2021 at 18:32, Swetha Joshi &lt;<a href=3D"mai=
lto:swethajoshi139@gmail.com" target=3D"_blank">swethajoshi139@gmail.com</a=
>&gt; wrote:<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Hello,<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; One of the qemu machines we use has KVM enabled, but we =
don&#39;t want the CONFIG_ARM_VIRT enabled as it pulls in emulation of a va=
riety of physical hardware that we don&#39;t need. The compilation errors I=
 mentioned are not in the qemu mainline per say but we see them in one of t=
he qemu derived machines we use.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Sure, but unless you can give me a recipe for reproducing the=
<br>
&gt;&gt; &gt; build failure in mainline I can&#39;t really help...<br>
&gt;&gt;<br>
&gt;&gt; Hi Swetha=EF=BC=8C<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Yes,=C2=A0 Can you give a method that how to r=
eproduce the build<br>
&gt;&gt; failure issues? Thanks<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; thanks<br>
&gt;&gt; &gt; -- PMM<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Regards<br>
&gt;<br>
&gt; Swetha Joshi.<br>
</blockquote></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" =
data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Regards<div><br></div><=
div>Swetha Joshi.</div></div></div>

--00000000000058a6c705c3dfc081--


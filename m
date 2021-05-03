Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D523716B7
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 16:36:34 +0200 (CEST)
Received: from localhost ([::1]:39886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldZgX-0000ia-Eo
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 10:36:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ldZdQ-000796-Im
 for qemu-devel@nongnu.org; Mon, 03 May 2021 10:33:20 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:39651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ldZdO-0006QP-7Z
 for qemu-devel@nongnu.org; Mon, 03 May 2021 10:33:20 -0400
Received: by mail-ed1-x535.google.com with SMTP id g14so6512370edy.6
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 07:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TtXJTv7MGNqGNcRxQTNAqGT2spvRUZSJyRqasiZNp0o=;
 b=tvvlHisL/eLpLyPrkcbzU+upLW+NwwmklHGesQgt14VslF+wjX7OMwD0faQxWBW5eP
 dT7dTX8D2Q6D++nHqel62AwitKwIorlq4u1Yo4Bj5nHWBe/btMkp2+M65fFhYjXijH0d
 5hdUlh4dPGHIymNVKJvTsnWfliIVKUTh8LxsHCnljAos7OKDO2A5lVwKgmI1Yvj+N5qi
 8aQzfkkBeIJ/Ri2UtRFdj6gP6qhCEyrHiZ7zrYhWeI1SVsUrXKta+hHf0DVtO8pdOoWm
 lNSNUKXxNkUaM3lNOGT2+Dn4AUwAJ5AHOvUPAjax3KtTqUwEdtuAwrolVXftboTLQql9
 A1hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TtXJTv7MGNqGNcRxQTNAqGT2spvRUZSJyRqasiZNp0o=;
 b=b0x2FsX89MEdkQs4p4SKiIAl38AtEV7un3aobhEaZSsTQ6FYOHikE7iJwnoszUB7lJ
 dyEHoDg20v91HjLwl0dUkWI7CL76MPz8PQmzojS0fBLMp3QI/6M+YC5eHZKBFDDMtxY8
 ofb18bpMr30R0RFO8ESq5dos4WIrNHW+ywQIrnyEJsUmTVDy1pR+rmDZxpKor5b2AdrQ
 OUM/VLgL40FvFXOK2H55p9brNVmOxPnco4WWnp+hpBM7BZaW55H6C27hKbkYx1t9G0VE
 fDdLEqxIn3EV9/VQIfA8bFDGFhke1XmEBqkECYBZfepAZgvNQsOHUAiRTuFEqmu576sH
 MucA==
X-Gm-Message-State: AOAM532aJ22BOUDRwaK8VS3sUSTWg2JGtwgF85MpAddD/bwURDLYh6L0
 sS5n4Tcw6mZheJPR9iFTYFAoEiv6MG0TrJX8lkQ=
X-Google-Smtp-Source: ABdhPJxn7ZVxJgoUh1NPV6+Rinfk9CiCLQSnpyJMtuWUHXw+ZJyizM8ywmxG68iZKaJa+ckwJcQbAmH+WyvLFfT6u50=
X-Received: by 2002:a05:6402:31a7:: with SMTP id
 dj7mr6673915edb.314.1620052395943; 
 Mon, 03 May 2021 07:33:15 -0700 (PDT)
MIME-Version: 1.0
References: <162004304487.4348.9374620020070858180.malonedeb@chaenomeles.canonical.com>
 <162004313799.12465.17531572055756650478.malone@soybean.canonical.com>
In-Reply-To: <162004313799.12465.17531572055756650478.malone@soybean.canonical.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 3 May 2021 18:33:04 +0400
Message-ID: <CAJ+F1CLVVCv2HVTUrMynu-A-eEE+A+g8jmxv2xFCAhSMYK=vpQ@mail.gmail.com>
Subject: Re: [Bug 1926952] Re: SPICE support broken with 6.0
To: Bug 1926952 <1926952@bugs.launchpad.net>
Content-Type: multipart/alternative; boundary="00000000000093eb1605c16dd785"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x535.google.com
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
Cc: QEMU <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000093eb1605c16dd785
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, May 3, 2021 at 4:07 PM Firecode95 <1926952@bugs.launchpad.net>
wrote:

> Also just removing spice part makes it bootable:
> -spice port=3D5900,addr=3D127.0.0.1,disable-ticketing=3Don
>
> --
> You received this bug notification because you are a member of qemu-
> devel-ml, which is subscribed to QEMU.
> https://bugs.launchpad.net/bugs/1926952
>
> Title:
>   SPICE support broken with 6.0
>
> Status in QEMU:
>   New
>
> Bug description:
>   Using latest relase 6.0.0 while using Intel GVT-G DMA-BUF and SPICE
>   for usb redirection Qemu won't start:
>
>   qemu-system-x86_64: The console requires display DMABUF support.
>
>   However just patching ui/console.c:
>
>   if (flags & GRAPHIC_FLAGS_DMABUF &&
>           !displaychangelistener_has_dmabuf(dcl)) {
>           error_setg(errp, "The console requires display DMABUF support."=
);
>           return false;
>   }
>
>   to always return true for dmabuf part works just fine:
>
>   if (flags & GRAPHIC_FLAGS_DMABUF &&
>           !displaychangelistener_has_dmabuf(dcl)) {
>           error_setg(errp, "The console requires display DMABUF support."=
);
>           return true;
>   }
>
>   This behavior wasn't in qemu 5.x version.
>
>   To reproduce this bug need to use:
>
>   /usr/bin/qemu-system-x86_64 \
>   -machine q35 \
>   -enable-kvm \
>   -no-user-config \
>   -nodefaults \
>   -no-hpet \
>   -display gtk,gl=3Don \
>   -device
> pcie-root-port,port=3D0x0,chassis=3D1,id=3Dpci.1,bus=3Dpcie.0,multifuncti=
on=3Don,addr=3D0x1
> \
>   -device
> vfio-pci,id=3Dhostdev2,driver=3Dvfio-pci-nohotplug,romfile=3D/sys/devices=
/pci0000:00/0000:00:02.0/gvt_firmware,sysfsdev=3D/sys/bus/mdev/devices/1ae4=
0c36-b180-4af0-8fab-c27de21f597d,x-igd-opregion=3Don,ramfb=3Don,display=3Do=
n,xres=3D1920,yres=3D1080,bus=3Dpcie.0,multifunction=3Don,addr=3D0x2
> \
>   -spice port=3D5900,addr=3D127.0.0.1,disable-ticketing=3Don
>
> To manage notifications about this bug go to:
> https://bugs.launchpad.net/qemu/+bug/1926952/+subscriptions
>
>

Did you actually get the dmabuf update displayed over spice? If not, then
it is not a bug, it's a bug fix :) But I might be missing something.. I
don't see how this could happen without egl-headless though.


--=20
Marc-Andr=C3=A9 Lureau

--00000000000093eb1605c16dd785
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 3, 2021 at 4:07 PM Fire=
code95 &lt;<a href=3D"mailto:1926952@bugs.launchpad.net">1926952@bugs.launc=
hpad.net</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Also just removing spice part makes it bootable:<br>
-spice port=3D5900,addr=3D127.0.0.1,disable-ticketing=3Don<br>
<br>
-- <br>
You received this bug notification because you are a member of qemu-<br>
devel-ml, which is subscribed to QEMU.<br>
<a href=3D"https://bugs.launchpad.net/bugs/1926952" rel=3D"noreferrer" targ=
et=3D"_blank">https://bugs.launchpad.net/bugs/1926952</a><br>
<br>
Title:<br>
=C2=A0 SPICE support broken with 6.0<br>
<br>
Status in QEMU:<br>
=C2=A0 New<br>
<br>
Bug description:<br>
=C2=A0 Using latest relase 6.0.0 while using Intel GVT-G DMA-BUF and SPICE<=
br>
=C2=A0 for usb redirection Qemu won&#39;t start:<br>
<br>
=C2=A0 qemu-system-x86_64: The console requires display DMABUF support.<br>
<br>
=C2=A0 However just patching ui/console.c:<br>
<br>
=C2=A0 if (flags &amp; GRAPHIC_FLAGS_DMABUF &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !displaychangelistener_has_dmabuf(dcl)) =
{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;The console requi=
res display DMABUF support.&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
=C2=A0 }<br>
<br>
=C2=A0 to always return true for dmabuf part works just fine:<br>
<br>
=C2=A0 if (flags &amp; GRAPHIC_FLAGS_DMABUF &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !displaychangelistener_has_dmabuf(dcl)) =
{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;The console requi=
res display DMABUF support.&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
=C2=A0 }<br>
<br>
=C2=A0 This behavior wasn&#39;t in qemu 5.x version.<br>
<br>
=C2=A0 To reproduce this bug need to use:<br>
<br>
=C2=A0 /usr/bin/qemu-system-x86_64 \<br>
=C2=A0 -machine q35 \<br>
=C2=A0 -enable-kvm \<br>
=C2=A0 -no-user-config \<br>
=C2=A0 -nodefaults \<br>
=C2=A0 -no-hpet \<br>
=C2=A0 -display gtk,gl=3Don \<br>
=C2=A0 -device pcie-root-port,port=3D0x0,chassis=3D1,id=3Dpci.1,bus=3Dpcie.=
0,multifunction=3Don,addr=3D0x1 \<br>
=C2=A0 -device vfio-pci,id=3Dhostdev2,driver=3Dvfio-pci-nohotplug,romfile=
=3D/sys/devices/pci0000:00/0000:00:02.0/gvt_firmware,sysfsdev=3D/sys/bus/md=
ev/devices/1ae40c36-b180-4af0-8fab-c27de21f597d,x-igd-opregion=3Don,ramfb=
=3Don,display=3Don,xres=3D1920,yres=3D1080,bus=3Dpcie.0,multifunction=3Don,=
addr=3D0x2 \<br>
=C2=A0 -spice port=3D5900,addr=3D127.0.0.1,disable-ticketing=3Don<br>
<br>
To manage notifications about this bug go to:<br>
<a href=3D"https://bugs.launchpad.net/qemu/+bug/1926952/+subscriptions" rel=
=3D"noreferrer" target=3D"_blank">https://bugs.launchpad.net/qemu/+bug/1926=
952/+subscriptions</a><br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><div>Did you actually g=
et the dmabuf update displayed over spice? If not, then it is not a bug, it=
&#39;s a bug fix :) But I might be missing something.. I don&#39;t see how =
this could happen without egl-headless though.</div><div><br></div><div><br=
></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lu=
reau<br></div></div>

--00000000000093eb1605c16dd785--


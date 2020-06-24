Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 492BD20773F
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 17:21:35 +0200 (CEST)
Received: from localhost ([::1]:59506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo7DS-00036Z-44
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 11:21:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1jo7C1-0002XV-LU
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 11:20:05 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:40204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1jo7Bz-0004Su-M6
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 11:20:05 -0400
Received: by mail-ot1-x344.google.com with SMTP id s13so2241695otd.7
 for <qemu-devel@nongnu.org>; Wed, 24 Jun 2020 08:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A6P+10ehhuHI+NV4NRUjtNn1xDi+8o3ZxUF2YD3J3UM=;
 b=r7l13wNiKLaDhnd8GPRCH0L0ZEJkuIxr616tBvPgUp3w6SBUrDmIUScPgwXpRpqqLB
 4VrbE2Y0QG7yg7bofSpDv4skmVG7BQXr/+VkGVhC4BzqzwEoE6Mdv8G1Hc+GV9YRxWSi
 Ni4svkx0N4X/+cFFQteE3SdeBN2hWvx085JdDQRXT0sv0KjBG+IJbPSr23299vH8oemJ
 7zAehWkFpc4MFvShLGOiYDoI4jcL+mCTyg6HG1HMfPSM9kbqxpEHuNVSSu01vZlesjWR
 KCryMk7sVyYYHYErvIqD9StKJNrNzUqC9fszmuWtsAJSD3JFQk5JRKi1YsKP0t4so8ie
 rhpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A6P+10ehhuHI+NV4NRUjtNn1xDi+8o3ZxUF2YD3J3UM=;
 b=dc1uEoFVBk/5jzOOoAbQkhhnBWuKsWjby2IVYWS2gbhFPcblmHKLgDBFcEv1jcsqNb
 Y3ISNZV15uo+QsErZ5X4OxCmVAHAYkoiJmSOIW3MuTgVzjbnliIrODOP/K3YEi/bCGt0
 w3l9zo2yLhtHoTwnAHrb6el/27WkUufO+Zop8jlsafBQQn8/WhAUtw3kDcs56NMfPQd+
 j7DKVrl2QiLOL7g2RHgnzHOEoDyRRBHE/bCXt5skrMoYWiSWOz7J088Ex4KwRd2QoE1s
 4QNo1EOJ42uDMzXpMXqltT+uKx+m1kr+UJPUAwXjSb9NjI/OFAgmVPRcaAOsaW2xCLCe
 5fFg==
X-Gm-Message-State: AOAM532nCc1ib/WF2MWt/xYMhhfy506/C3tA7AgyaIGMfsngHblnJscG
 bK5PGYuKwV/P7Tib7Lt5e3EFKfK6267V9ncFdYE=
X-Google-Smtp-Source: ABdhPJz5TNAxbI8WOMICVW12mbRLEWVGO1DahStPxG0P6XB8h+JljNwp5Q9Bggac5xWZXPJ6yQFNVdfbqjeonA6wKoc=
X-Received: by 2002:a05:6830:18db:: with SMTP id
 v27mr23578791ote.75.1593012002365; 
 Wed, 24 Jun 2020 08:20:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200624134510.9381-1-kraxel@redhat.com>
In-Reply-To: <20200624134510.9381-1-kraxel@redhat.com>
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Wed, 24 Jun 2020 17:19:51 +0200
Message-ID: <CABLmASFxUtOJOCYk2epuiJwOh0dbxzer0A=AG42O6QqvXbN+EQ@mail.gmail.com>
Subject: Re: [PATCH] usb: fix usb-host build on windows.
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000086246c05a8d60221"
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=hsp.cat7@gmail.com; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-devel qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000086246c05a8d60221
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 24, 2020 at 3:45 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

> Seems the new API is not available on windows.
> Update #ifdefs accordingly.
>
> Fixes: 9f815e83e983 ("usb: add hostdevice property to usb-host")
> Reported-by: Howard Spoelstra <hsp.cat7@gmail.com>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/usb/host-libusb.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c
> index ad7ed8fb0c67..c474551d8456 100644
> --- a/hw/usb/host-libusb.c
> +++ b/hw/usb/host-libusb.c
> @@ -907,7 +907,7 @@ static int usb_host_open(USBHostDevice *s,
> libusb_device *dev, int hostfd)
>              goto fail;
>          }
>      } else {
> -#if LIBUSB_API_VERSION >= 0x01000107
> +#if LIBUSB_API_VERSION >= 0x01000107 && !defined(CONFIG_WIN32)
>          trace_usb_host_open_hostfd(hostfd);
>
>          rc = libusb_wrap_sys_device(ctx, hostfd, &s->dh);
> @@ -1107,7 +1107,7 @@ static void usb_host_realize(USBDevice *udev, Error
> **errp)
>      QTAILQ_INIT(&s->isorings);
>      s->hostfd = -1;
>
> -#if LIBUSB_API_VERSION >= 0x01000107
> +#if LIBUSB_API_VERSION >= 0x01000107 && !defined(CONFIG_WIN32)
>      if (s->hostdevice) {
>          int fd;
>          s->needs_autoscan = false;
> --
> 2.18.4
>
> Thanks for the quick fix, so:

Tested-by: Howard Spoelstra <hsp.cat7@gmail.com>

--00000000000086246c05a8d60221
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Jun 24, 2020 at 3:45 PM Gerd Hoff=
mann &lt;<a href=3D"mailto:kraxel@redhat.com" target=3D"_blank">kraxel@redh=
at.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Seems the new API is not available on wind=
ows.<br>
Update #ifdefs accordingly.<br>
<br>
Fixes: 9f815e83e983 (&quot;usb: add hostdevice property to usb-host&quot;)<=
br>
Reported-by: Howard Spoelstra &lt;<a href=3D"mailto:hsp.cat7@gmail.com" tar=
get=3D"_blank">hsp.cat7@gmail.com</a>&gt;<br>
Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" targe=
t=3D"_blank">kraxel@redhat.com</a>&gt;<br>
---<br>
=C2=A0hw/usb/host-libusb.c | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c<br>
index ad7ed8fb0c67..c474551d8456 100644<br>
--- a/hw/usb/host-libusb.c<br>
+++ b/hw/usb/host-libusb.c<br>
@@ -907,7 +907,7 @@ static int usb_host_open(USBHostDevice *s, libusb_devic=
e *dev, int hostfd)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
-#if LIBUSB_API_VERSION &gt;=3D 0x01000107<br>
+#if LIBUSB_API_VERSION &gt;=3D 0x01000107 &amp;&amp; !defined(CONFIG_WIN32=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trace_usb_host_open_hostfd(hostfd);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D libusb_wrap_sys_device(ctx, hostfd=
, &amp;s-&gt;dh);<br>
@@ -1107,7 +1107,7 @@ static void usb_host_realize(USBDevice *udev, Error *=
*errp)<br>
=C2=A0 =C2=A0 =C2=A0QTAILQ_INIT(&amp;s-&gt;isorings);<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;hostfd =3D -1;<br>
<br>
-#if LIBUSB_API_VERSION &gt;=3D 0x01000107<br>
+#if LIBUSB_API_VERSION &gt;=3D 0x01000107 &amp;&amp; !defined(CONFIG_WIN32=
)<br>
=C2=A0 =C2=A0 =C2=A0if (s-&gt;hostdevice) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int fd;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;needs_autoscan =3D false;<br>
-- <br>
2.18.4<br>
<br></blockquote><div>Thanks for the quick fix, so:</div><div><br></div><di=
v>Tested-by: Howard Spoelstra &lt;<a href=3D"mailto:hsp.cat7@gmail.com">hsp=
.cat7@gmail.com</a>&gt;<br></div></div></div>

--00000000000086246c05a8d60221--


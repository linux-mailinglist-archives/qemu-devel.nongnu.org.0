Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7249E47B327
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 19:48:15 +0100 (CET)
Received: from localhost ([::1]:33910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzNhl-0000Kk-CQ
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 13:48:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pratikp@vayavyalabs.com>)
 id 1mzMEy-0001gT-SE
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 12:14:25 -0500
Received: from [2a00:1450:4864:20::229] (port=35814
 helo=mail-lj1-x229.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pratikp@vayavyalabs.com>)
 id 1mzMEx-00012F-Cx
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 12:14:24 -0500
Received: by mail-lj1-x229.google.com with SMTP id l7so17101131lja.2
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 09:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vayavyalabs.com; s=vayavyalabs;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BkmPnCUBaIgUC3TeQ1Vy00VCb92GnvIJl3Oy+Qbc3L4=;
 b=ZGiweod4/ulV4o8jtKLXOAmrDC6vgNEYuzKnw2qQNAeU8SoJuPY0sRem94zoZk1xDT
 /gShpEqK1nfczCEQ//Al0EIHhA+GtHI5If+sH9pJ+yMInZC1Bl/+woe+nRARVUuclH/d
 Ss7Cxm7S8aOTOPz2GzWJJRYtBBeXdv2W1FVr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BkmPnCUBaIgUC3TeQ1Vy00VCb92GnvIJl3Oy+Qbc3L4=;
 b=cnlA67JWwqGMTsA6hr0FaD1P3dftMKVeGWYk/78brRv/pULE/4/xYyjximh2vz6Pt9
 c98NiTSpyW/HA/NQ0MN0MUp3JVTjFKNigXli8dCqfuHAuHp04v07WKWfCz6bttynl5+2
 o9G4yXemUkoFX1NgIrxJSl97yKUdh5NQc6auKAdEsVfDSK7bEWvY8QwEWD9WzzAE28hi
 jTdKEofoUDyd6EteNpUeVMTcU+hTsR210+SBLeZNNrJFM09uhR2cOZY6Bhv88dGNRHPM
 I2BsKpWjEQos5Xqgqg+N3/jaU0v2GPVLqMWVX7USW2zTEbUY0a/Jze8LJvGjiVpb3dlF
 RRzA==
X-Gm-Message-State: AOAM530QSRFbjYmG1ng/Vq6nF+xGd2Q3oCHhmvkXhnL7PWiuUaQ9rxI+
 ED3zzMxJTUZh4H7VT0IGLrIejqJ7LYA/KUKUEog49w==
X-Google-Smtp-Source: ABdhPJwZ6zXVOoN4L8Y+SB+CZED/GDTk9VTQr8pCh6M9AQ6tAMVZWg1LwzxEsEOjPuwPl0777ywDiHDPWO1bNR8JqmQ=
X-Received: by 2002:a2e:5d7:: with SMTP id 206mr15876974ljf.133.1640020460834; 
 Mon, 20 Dec 2021 09:14:20 -0800 (PST)
MIME-Version: 1.0
References: <CA+aXn+EZQ=S+P=8fyfCxYikEMLLdqAEeQgi580Tqtsuot-r2dw@mail.gmail.com>
 <aedfa17d-6d31-6d5d-b367-cf84e77d27ed@redhat.com>
 <20211220103548.lpgtad57woenpshi@sirius.home.kraxel.org>
 <CA+aXn+F1tPYMahODkE1qi_OM65zJ4ubHqcOi1drJWvC+PopiZQ@mail.gmail.com>
 <20211220121814.rkg7z7rki22qpzhj@sirius.home.kraxel.org>
In-Reply-To: <20211220121814.rkg7z7rki22qpzhj@sirius.home.kraxel.org>
From: Pratik Parvati <pratikp@vayavyalabs.com>
Date: Mon, 20 Dec 2021 22:44:06 +0530
Message-ID: <CA+aXn+HPOK-N9smZsjas6EXaTD6hQjXbgrJcKK9E3u5VrSYCeg@mail.gmail.com>
Subject: Re: Virtio-GPU Xres and Yres seettings
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000fe259b05d39704be"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::229
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=pratikp@vayavyalabs.com; helo=mail-lj1-x229.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000fe259b05d39704be
Content-Type: text/plain; charset="UTF-8"

> EDID is optional, so you can try disable the EDID feature bit and see
> what happens.

Thanks Gerd, after disabling the EDID, I was able to get the required
resolution (basically width and height) from the driver.

Another strange observation - When the device receives the
command VIRTIO_GPU_CMD_RESOURCE_ATTACH_BACKING with the number of
entries having a pixel data in scatter gather format, the device is trying
to store these bytes in contiguous memory. When I read those sg memory, the
device receives all zeros from the driver (for a 1024x768 display,
the device receives 3MB of data from the driver). Is this an expected
behaviour? - If not, what is the driver trying to display on the screen?

This is happening during linux boot on the guest machine.

Thanks & Regards,
Pratik


On Mon, 20 Dec 2021 at 17:48, Gerd Hoffmann <kraxel@redhat.com> wrote:

>   Hi,
>
> > Is it possible that EDID bytes are sent wrong to the driver (as a
> response
> > to VIRTIO_GPU_CMD_GET_EDID command)?? - I am configuring these bytes the
> > same way Qemu does.
>
> EDID is optional, so you can try disable the EDID feature bit and see
> what happens.
>
> You can also check /sys/class/drm/card0-${output}/edid inside the
> guest.
>
> take care,
>   Gerd
>
>

--000000000000fe259b05d39704be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:verdana,=
sans-serif;color:#000000"><span style=3D"color:rgb(34,34,34);font-family:Ar=
ial,Helvetica,sans-serif">&gt; EDID is optional, so you can try disable the=
 EDID feature bit and see</span><br style=3D"color:rgb(34,34,34);font-famil=
y:Arial,Helvetica,sans-serif"><span style=3D"color:rgb(34,34,34);font-famil=
y:Arial,Helvetica,sans-serif">&gt; what happens.</span><br style=3D"color:r=
gb(34,34,34);font-family:Arial,Helvetica,sans-serif"><br clear=3D"all"></di=
v><div class=3D"gmail_default" style=3D"">Thanks Gerd, after disabling=C2=
=A0the EDID, I was able to get the required resolution (basically width and=
 height) from the driver.</div><div class=3D"gmail_default" style=3D""><br>=
</div><div class=3D"gmail_default" style=3D"">Another strange observation -=
 When the device receives the command=C2=A0VIRTIO_GPU_CMD_RESOURCE_ATTACH_B=
ACKING with the number of entries=C2=A0having a pixel data in scatter gathe=
r format, the device is trying to store these bytes in contiguous memory. W=
hen I read those sg memory, the device receives all zeros from the driver (=
for a 1024x768 display, the=C2=A0device receives 3MB of data from the drive=
r). Is this an expected behaviour? - If not, what is the driver trying to d=
isplay on the screen?</div><div class=3D"gmail_default" style=3D""><br></di=
v><div class=3D"gmail_default" style=3D"">This is happening during linux bo=
ot on the guest machine.</div><div class=3D"gmail_default" style=3D""><br><=
/div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmai=
l_signature"><div dir=3D"ltr"><div><font face=3D"verdana, sans-serif"><span=
 class=3D"gmail_default" style=3D"font-family:verdana,sans-serif;color:rgb(=
0,0,0)">Thanks &amp; </span>Regards,<br></font></div><div><font face=3D"ver=
dana, sans-serif">Pratik</font></div></div></div></div><br></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 20 Dec 2=
021 at 17:48, Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel=
@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">=C2=A0 Hi,<br>
<br>
&gt; Is it possible that EDID bytes are sent wrong to the driver (as a resp=
onse<br>
&gt; to VIRTIO_GPU_CMD_GET_EDID command)?? - I am configuring these bytes t=
he<br>
&gt; same way Qemu does.<br>
<br>
EDID is optional, so you can try disable the EDID feature bit and see<br>
what happens.<br>
<br>
You can also check /sys/class/drm/card0-${output}/edid inside the<br>
guest.<br>
<br>
take care,<br>
=C2=A0 Gerd<br>
<br>
</blockquote></div>

--000000000000fe259b05d39704be--


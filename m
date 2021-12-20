Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2AD47B109
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 17:24:04 +0100 (CET)
Received: from localhost ([::1]:40358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzLSD-00079N-GT
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 11:24:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pratikp@vayavyalabs.com>)
 id 1mzJwY-0002RB-Uk
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 09:49:01 -0500
Received: from [2a00:1450:4864:20::536] (port=36764
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pratikp@vayavyalabs.com>)
 id 1mzJvX-0004CC-J7
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 09:46:53 -0500
Received: by mail-ed1-x536.google.com with SMTP id z5so39323390edd.3
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 06:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vayavyalabs.com; s=vayavyalabs;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VkZCr17NOnfFixBB7P5fiAuuGftcaP5b1Yz0p7NnDDM=;
 b=RdUWL54CGDaLHCjg8RtP2Zqb6/xe/J2cknxXCFfMmZlpGURUb0dSJxdzDOu+ho1B8o
 ebfdCQam5Ws3qSFbx0zPtq34Mgs9BhTmRL70ghu47MhwT2SejMvWdqBzUxGmL5gNyo3m
 SGALlYXYA8HdOXnnTJoyMWMiIuzDVVqUTvs40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VkZCr17NOnfFixBB7P5fiAuuGftcaP5b1Yz0p7NnDDM=;
 b=inss10RtouvqbSW/0O8xX49psIy2iBUGqOcQRTlaRKrC33VxCkBWh6lQvrevQHdLgy
 CYV2sAiSj4M0iQgLspXWrLKuSa79kAOscxlSlzgl+/4xth43bLwbpgtvRDAwiIjHVmsH
 sxt2e3VaOTo1sMLYxbZsQdFM9KIuXb1bzJ73W2n9vr/F1TqXwgE5YLAE/trtIYgl+aDs
 eowb3RiNudCX6QKFXCDnKDT+SE0X4XDGBDxqwQekiq5nmERCYndyH9H/cUaZiVCF4X1P
 TljqDK6lJtT4PQ3KGZCRayTHtyM+JH0ZA14ujQbB0zzd/brXHybYZi8XgxdkpEGIG9h1
 MQaA==
X-Gm-Message-State: AOAM533vevVrETrJ9wXJoiVp7VVDCg0L2+puimsbGk+/4xz9btsjFDoq
 GE0EINOvMOHWFgaYPm//EFxGmn9T5E6GQyZu6T5FDFuYm6zk7A==
X-Google-Smtp-Source: ABdhPJwe9xi/ZOXYU23CiDQTSLXPMHERzPIyo7focUH60lAO47jJdL7nzO1ReICQnWBcrcpO1oqhLxddpH++2YlCD6I=
X-Received: by 2002:a2e:890c:: with SMTP id d12mr15015132lji.218.1640001826660; 
 Mon, 20 Dec 2021 04:03:46 -0800 (PST)
MIME-Version: 1.0
References: <CA+aXn+EZQ=S+P=8fyfCxYikEMLLdqAEeQgi580Tqtsuot-r2dw@mail.gmail.com>
 <aedfa17d-6d31-6d5d-b367-cf84e77d27ed@redhat.com>
 <20211220103548.lpgtad57woenpshi@sirius.home.kraxel.org>
In-Reply-To: <20211220103548.lpgtad57woenpshi@sirius.home.kraxel.org>
From: Pratik Parvati <pratikp@vayavyalabs.com>
Date: Mon, 20 Dec 2021 17:33:32 +0530
Message-ID: <CA+aXn+F1tPYMahODkE1qi_OM65zJ4ubHqcOi1drJWvC+PopiZQ@mail.gmail.com>
Subject: Re: Virtio-GPU Xres and Yres seettings
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000004f348505d392ae37"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=pratikp@vayavyalabs.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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

--0000000000004f348505d392ae37
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> > Cc'ing Gerd & Marc-Andr=C3=A9.
> >
> > On 12/20/21 05:26, Pratik Parvati wrote:
> > > Hi Team,
> > >
> > > I am working on a Virtio-GPU device (backend) for one of our customer
> > > projects - we are using the Virtio-GPU driver (frontend) to drive our
> > > device. Our device code has been written using Qemu virtio-gpu device
> > > code as a reference. Our device is setting the resolution to 1024x768
as
> > > a response to the command received from the driver (i.e,
> > > VIRTIO_GPU_CMD_GET_DISPLAY_INFO) - I also verified that driver is
> > > receiving the response bytes properly, but the next
> > > command (i.e, VIRTIO_GPU_CMD_RESOURCE_CREATE_2D) that device receive
has
> > > a width and height as 4096 and 2160 respectively. The driver is
assuming
> > > a 4k display for some reason and I need your help to understand why
this
> > > is happening.
>
> Wild guess: virtio_gpu_resp_display_info.pmodes[0].enabled is false?

virtio_gpu_resp_display_info.pmodes[0].enabled is true, I have verified
this.

> > > Our display is corrupted for the same Xres and Yres misunderstanding
> > > between the device and the driver
>
> Oh, the VIRTIO_GPU_CMD_GET_DISPLAY_INFO reply is just a hint for the
> driver.  The driver is free to choose whatever it wants, your device
> must be prepared for that.
>
> The linux kms driver specifically returns a long list of standard modes
> (including 4k) to userspace, with the resolution returned by
> VIRTIO_GPU_CMD_GET_DISPLAY_INFO tagged as 'preferred'.  Typically
> userspace (aka display server, aka xorg / wayland / ...) uses the
> preferred resolution by default, but userspace can also pick something
> else and the kernel driver will forward the request to the device.
>
> So, it might also be the software running inside the guest which
> picks 4k ...

Is it possible that EDID bytes are sent wrong to the driver (as a response
to VIRTIO_GPU_CMD_GET_EDID command)?? - I am configuring these bytes the
same way Qemu does.

Thanks for Quick response.

Regards,
Pratik
Regards,
Pratik


On Mon, 20 Dec 2021 at 16:06, Gerd Hoffmann <kraxel@redhat.com> wrote:

> On Mon, Dec 20, 2021 at 09:55:00AM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > Cc'ing Gerd & Marc-Andr=C3=A9.
> >
> > On 12/20/21 05:26, Pratik Parvati wrote:
> > > Hi Team,
> > >
> > > I am working on a Virtio-GPU device (backend) for one of our customer
> > > projects - we are using the Virtio-GPU driver (frontend) to drive our
> > > device. Our device code has been written using Qemu virtio-gpu device
> > > code as a reference. Our device is setting the resolution to 1024x768
> as
> > > a response to the command received from the driver (i.e,
> > > VIRTIO_GPU_CMD_GET_DISPLAY_INFO) - I also verified that driver is
> > > receiving the response bytes properly, but the next
> > > command (i.e, VIRTIO_GPU_CMD_RESOURCE_CREATE_2D) that device receive
> has
> > > a width and height as 4096 and 2160 respectively. The driver is
> assuming
> > > a 4k display for some reason and I need your help to understand why
> this
> > > is happening.
>
> Wild guess: virtio_gpu_resp_display_info.pmodes[0].enabled is false?
>
> > > Our display is corrupted for the same Xres and Yres misunderstanding
> > > between the device and the driver
>
> Oh, the VIRTIO_GPU_CMD_GET_DISPLAY_INFO reply is just a hint for the
> driver.  The driver is free to choose whatever it wants, your device
> must be prepared for that.
>
> The linux kms driver specifically returns a long list of standard modes
> (including 4k) to userspace, with the resolution returned by
> VIRTIO_GPU_CMD_GET_DISPLAY_INFO tagged as 'preferred'.  Typically
> userspace (aka display server, aka xorg / wayland / ...) uses the
> preferred resolution by default, but userspace can also pick something
> else and the kernel driver will forward the request to the device.
>
> So, it might also be the software running inside the guest which
> picks 4k ...
>
> HTH & take care,
>   Gerd
>
>

--0000000000004f348505d392ae37
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:verdana,=
sans-serif"><font color=3D"#000000">&gt; &gt; Cc&#39;ing Gerd &amp; Marc-An=
dr=C3=A9.</font><br><font color=3D"#000000">&gt; &gt;</font><br><font color=
=3D"#000000">&gt; &gt; On 12/20/21 05:26, Pratik Parvati wrote:</font><br><=
font color=3D"#000000">&gt; &gt; &gt; Hi Team,</font><br><font color=3D"#00=
0000">&gt; &gt; &gt;</font><br><font color=3D"#000000">&gt; &gt; &gt; I am =
working on a Virtio-GPU device (backend) for one of our customer</font><br>=
<font color=3D"#000000">&gt; &gt; &gt; projects - we are using the Virtio-G=
PU driver (frontend) to drive our</font><br><font color=3D"#000000">&gt; &g=
t; &gt; device. Our device code has been written using Qemu virtio-gpu devi=
ce</font><br><font color=3D"#000000">&gt; &gt; &gt; code as a reference. Ou=
r device is setting the resolution to 1024x768 as</font><br><font color=3D"=
#000000">&gt; &gt; &gt; a response to the command received from the driver =
(i.e,</font><br><font color=3D"#000000">&gt; &gt; &gt; VIRTIO_GPU_CMD_GET_D=
ISPLAY_INFO) - I also verified that driver is</font><br><font color=3D"#000=
000">&gt; &gt; &gt; receiving the response bytes properly, but the next</fo=
nt><br><font color=3D"#000000">&gt; &gt; &gt; command (i.e, VIRTIO_GPU_CMD_=
RESOURCE_CREATE_2D) that device receive has</font><br><font color=3D"#00000=
0">&gt; &gt; &gt; a width and height as 4096 and 2160 respectively. The dri=
ver is assuming</font><br><font color=3D"#000000">&gt; &gt; &gt; a 4k displ=
ay for some reason and I need your help to understand why this</font><br><f=
ont color=3D"#000000">&gt; &gt; &gt; is happening.</font><br><font color=3D=
"#000000">&gt; </font><br><font color=3D"#000000">&gt; Wild guess: virtio_g=
pu_resp_display_info.pmodes[0].enabled is false?</font><br><br><font color=
=3D"#0000ff">virtio_gpu_resp_display_info.pmodes[0].enabled is true, I have=
 verified this.</font><br><br><font color=3D"#000000">&gt; &gt; &gt; Our di=
splay is corrupted for the same Xres and Yres misunderstanding</font><br><f=
ont color=3D"#000000">&gt; &gt; &gt; between the device and the driver</fon=
t><br><font color=3D"#000000">&gt; </font><br><font color=3D"#000000">&gt; =
Oh, the VIRTIO_GPU_CMD_GET_DISPLAY_INFO reply is just a hint for the</font>=
<br><font color=3D"#000000">&gt; driver.=C2=A0 The driver is free to choose=
 whatever it wants, your device</font><br><font color=3D"#000000">&gt; must=
 be prepared for that.</font><br><font color=3D"#000000">&gt; </font><br><f=
ont color=3D"#000000">&gt; The linux kms driver specifically returns a long=
 list of standard modes</font><br><font color=3D"#000000">&gt; (including 4=
k) to userspace, with the resolution returned by</font><br><font color=3D"#=
000000">&gt; VIRTIO_GPU_CMD_GET_DISPLAY_INFO tagged as &#39;preferred&#39;.=
=C2=A0 Typically</font><br><font color=3D"#000000">&gt; userspace (aka disp=
lay server, aka xorg / wayland / ...) uses the</font><br><font color=3D"#00=
0000">&gt; preferred resolution by default, but userspace can also pick som=
ething</font><br><font color=3D"#000000">&gt; else and the kernel driver wi=
ll forward the request to the device.</font><br><font color=3D"#000000">&gt=
; </font><br><font color=3D"#000000">&gt; So, it might also be the software=
 running inside the guest which</font><br><font color=3D"#000000">&gt; pick=
s 4k ...</font><br><br><font color=3D"#0000ff">Is it possible that EDID byt=
es are sent wrong to the driver (as a response to VIRTIO_GPU_CMD_GET_EDID c=
ommand)?? - I am configuring these bytes the same way Qemu does</font><font=
 color=3D"#000000">.</font><br><br><font color=3D"#0000ff">Thanks for Quick=
 response.</font><br><br><font color=3D"#000000">Regards,</font><br><font c=
olor=3D"#000000">Pratik</font><br clear=3D"all"></div><div><div dir=3D"ltr"=
 class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"l=
tr"><div><font face=3D"verdana, sans-serif">Regards,<br></font></div><div><=
font face=3D"verdana, sans-serif">Pratik</font></div></div></div></div><br>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Mon, 20 Dec 2021 at 16:06, Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@re=
dhat.com">kraxel@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">On Mon, Dec 20, 2021 at 09:55:00AM +0100, Philip=
pe Mathieu-Daud=C3=A9 wrote:<br>
&gt; Cc&#39;ing Gerd &amp; Marc-Andr=C3=A9.<br>
&gt; <br>
&gt; On 12/20/21 05:26, Pratik Parvati wrote:<br>
&gt; &gt; Hi Team,<br>
&gt; &gt; <br>
&gt; &gt; I am working on a Virtio-GPU device (backend) for one of our cust=
omer<br>
&gt; &gt; projects - we are using the Virtio-GPU driver (frontend) to drive=
 our<br>
&gt; &gt; device. Our device code has been written using Qemu virtio-gpu de=
vice<br>
&gt; &gt; code as a reference. Our device is setting the resolution=C2=A0to=
 1024x768 as<br>
&gt; &gt; a response to the command received from the driver (i.e,<br>
&gt; &gt; VIRTIO_GPU_CMD_GET_DISPLAY_INFO) - I also verified that driver is=
<br>
&gt; &gt; receiving the response bytes properly, but the next<br>
&gt; &gt; command=C2=A0(i.e,=C2=A0VIRTIO_GPU_CMD_RESOURCE_CREATE_2D) that d=
evice receive has<br>
&gt; &gt; a width and height as 4096 and 2160 respectively. The driver is a=
ssuming<br>
&gt; &gt; a 4k display for some reason and I need your help to understand w=
hy this<br>
&gt; &gt; is happening.<br>
<br>
Wild guess: virtio_gpu_resp_display_info.pmodes[0].enabled is false?<br>
<br>
&gt; &gt; Our display is corrupted for the same Xres and Yres misunderstand=
ing<br>
&gt; &gt; between=C2=A0the device and the driver<br>
<br>
Oh, the VIRTIO_GPU_CMD_GET_DISPLAY_INFO reply is just a hint for the<br>
driver.=C2=A0 The driver is free to choose whatever it wants, your device<b=
r>
must be prepared for that.<br>
<br>
The linux kms driver specifically returns a long list of standard modes<br>
(including 4k) to userspace, with the resolution returned by<br>
VIRTIO_GPU_CMD_GET_DISPLAY_INFO tagged as &#39;preferred&#39;.=C2=A0 Typica=
lly<br>
userspace (aka display server, aka xorg / wayland / ...) uses the<br>
preferred resolution by default, but userspace can also pick something<br>
else and the kernel driver will forward the request to the device.<br>
<br>
So, it might also be the software running inside the guest which<br>
picks 4k ...<br>
<br>
HTH &amp; take care,<br>
=C2=A0 Gerd<br>
<br>
</blockquote></div>

--0000000000004f348505d392ae37--


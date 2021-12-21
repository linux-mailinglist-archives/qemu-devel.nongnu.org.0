Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D03347BEF5
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 12:32:10 +0100 (CET)
Received: from localhost ([::1]:42418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzdNJ-000450-4e
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 06:32:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pratikp@vayavyalabs.com>)
 id 1mzdIm-0008Ky-8Z
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 06:27:28 -0500
Received: from [2a00:1450:4864:20::22a] (port=34493
 helo=mail-lj1-x22a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pratikp@vayavyalabs.com>)
 id 1mzdIk-0008GP-I0
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 06:27:27 -0500
Received: by mail-lj1-x22a.google.com with SMTP id k23so20903806lje.1
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 03:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vayavyalabs.com; s=vayavyalabs;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iKqzzADrk88Almd/oO4mNwZbvhSK3rpjUOnfI7pnOyg=;
 b=Iz84e0iox/yXtmzoH/MBWhvOV1TxRrwi2cRlzw9WdWnlgkwfVU7b2hQN+/ozcIE4VY
 CkbRm6dSbPUqICyhk9DLt6T3FAmMcOAy9aZy3xa6rIu++ABezpMvOfQFi6tKEiknIMQe
 b1kvzlzl7aO4zSdFMEXN/HARo5V4amzrqxHrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iKqzzADrk88Almd/oO4mNwZbvhSK3rpjUOnfI7pnOyg=;
 b=cUy4rrw0meakG4FJ8NnlRdTS+6OtcVfW8y2SVBDalQBN8LKD8gwOQYN4DuAD/xMxHR
 9aqhflcJHIiuN4MzkL9SsahJAjeSqJs8fdRvHPWxmcYaDvnowKefU1JB+EdDGe6du4W6
 kuXLZqjCbRYXgA38J2fdDX2qydy7/YJ+Lli7IulGLMFeCDjApD0QHYd7TqDHxqQqdAiz
 DvKN+DDZ8MezQapIqsGBp3RtDFKnjsi1LhQs+CjVmgxPcNX6szh5E2uwmttucw8hYVvv
 3F5xFcGVSryaTkzGpiC+xxCxAT2wHprDoQFDXQif3Dy10oVQHg3KL+2XjnGQcHPsDi1V
 AbQA==
X-Gm-Message-State: AOAM532dwJg8m4gRqryi4SVoP5luQy/Evrh7f7sO46l/HFZ47DKcLndz
 Q+xWYHGSG1q/fVATbnzLTAR7g9XIkMaUPVGsSyr8Ag==
X-Google-Smtp-Source: ABdhPJy9eruCEYeFPgj+jFCmNGiOkC2AWJukjFbw3JiBGrgczNEUXm1gCSM5uaPopcSGC5ETJR3YH3p7a0RHwDQrJrM=
X-Received: by 2002:a2e:95d2:: with SMTP id y18mr2144312ljh.93.1640086044279; 
 Tue, 21 Dec 2021 03:27:24 -0800 (PST)
MIME-Version: 1.0
References: <CA+aXn+EZQ=S+P=8fyfCxYikEMLLdqAEeQgi580Tqtsuot-r2dw@mail.gmail.com>
 <aedfa17d-6d31-6d5d-b367-cf84e77d27ed@redhat.com>
 <20211220103548.lpgtad57woenpshi@sirius.home.kraxel.org>
 <CA+aXn+F1tPYMahODkE1qi_OM65zJ4ubHqcOi1drJWvC+PopiZQ@mail.gmail.com>
 <20211220121814.rkg7z7rki22qpzhj@sirius.home.kraxel.org>
 <CA+aXn+HPOK-N9smZsjas6EXaTD6hQjXbgrJcKK9E3u5VrSYCeg@mail.gmail.com>
 <20211221111125.lbx6or2wg2d762a7@sirius.home.kraxel.org>
In-Reply-To: <20211221111125.lbx6or2wg2d762a7@sirius.home.kraxel.org>
From: Pratik Parvati <pratikp@vayavyalabs.com>
Date: Tue, 21 Dec 2021 16:57:09 +0530
Message-ID: <CA+aXn+HzLjZVykfsQJHGK6N_K1qLywsES6kJT-RQEEYrKfZ6fA@mail.gmail.com>
Subject: Re: Virtio-GPU Xres and Yres seettings
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000012209d05d3a64a19"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=pratikp@vayavyalabs.com; helo=mail-lj1-x22a.google.com
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

--00000000000012209d05d3a64a19
Content-Type: text/plain; charset="UTF-8"

I apologise for not putting the question properly. I am referring virtio
spec to understand the driver and device operation - I had a few questions
on pixel data, as it was not working as expected.

My display is working fine now; thanks for your help.

Regards,
Pratik


On Tue, 21 Dec 2021 at 16:41, Gerd Hoffmann <kraxel@redhat.com> wrote:

> On Mon, Dec 20, 2021 at 10:44:06PM +0530, Pratik Parvati wrote:
> > > EDID is optional, so you can try disable the EDID feature bit and see
> > > what happens.
> >
> > Thanks Gerd, after disabling the EDID, I was able to get the required
> > resolution (basically width and height) from the driver.
> >
> > Another strange observation - When the device receives the
> > command VIRTIO_GPU_CMD_RESOURCE_ATTACH_BACKING with the number of
> > entries having a pixel data in scatter gather format, the device is
> trying
> > to store these bytes in contiguous memory. When I read those sg memory,
> the
> > device receives all zeros from the driver (for a 1024x768 display,
> > the device receives 3MB of data from the driver). Is this an expected
> > behaviour? - If not, what is the driver trying to display on the screen?
>
> How about reading the virtio spec?
> display updates are handled with transfer and flush commands.
>
> take care,
>   Gerd
>
>

--00000000000012209d05d3a64a19
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:verdana,=
sans-serif;color:#000000">I apologise=C2=A0for not putting the question pro=
perly. I am referring=C2=A0virtio spec to understand the driver and device =
operation - I had a few questions on pixel data, as it was not working as e=
xpected.</div><div class=3D"gmail_default" style=3D"font-family:verdana,san=
s-serif;color:#000000"><br></div><div class=3D"gmail_default" style=3D"font=
-family:verdana,sans-serif;color:#000000">My display is working fine now; t=
hanks=C2=A0for your=C2=A0help.</div><div class=3D"gmail_default" style=3D"f=
ont-family:verdana,sans-serif;color:#000000"><br></div><div><div dir=3D"ltr=
" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"=
ltr"><div><font face=3D"verdana, sans-serif">Regards,<br></font></div><div>=
<font face=3D"verdana, sans-serif">Pratik</font></div></div></div></div><br=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Tue, 21 Dec 2021 at 16:41, Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@r=
edhat.com">kraxel@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">On Mon, Dec 20, 2021 at 10:44:06PM +0530, Prati=
k Parvati wrote:<br>
&gt; &gt; EDID is optional, so you can try disable the EDID feature bit and=
 see<br>
&gt; &gt; what happens.<br>
&gt; <br>
&gt; Thanks Gerd, after disabling the EDID, I was able to get the required<=
br>
&gt; resolution (basically width and height) from the driver.<br>
&gt; <br>
&gt; Another strange observation - When the device receives the<br>
&gt; command VIRTIO_GPU_CMD_RESOURCE_ATTACH_BACKING with the number of<br>
&gt; entries having a pixel data in scatter gather format, the device is tr=
ying<br>
&gt; to store these bytes in contiguous memory. When I read those sg memory=
, the<br>
&gt; device receives all zeros from the driver (for a 1024x768 display,<br>
&gt; the device receives 3MB of data from the driver). Is this an expected<=
br>
&gt; behaviour? - If not, what is the driver trying to display on the scree=
n?<br>
<br>
How about reading the virtio spec?<br>
display updates are handled with transfer and flush commands.<br>
<br>
take care,<br>
=C2=A0 Gerd<br>
<br>
</blockquote></div>

--00000000000012209d05d3a64a19--


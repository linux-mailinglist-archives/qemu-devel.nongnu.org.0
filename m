Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C87943ACBB9
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 15:07:49 +0200 (CEST)
Received: from localhost ([::1]:33730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luEDs-0005tK-MO
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 09:07:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1luECl-0004hU-DB
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 09:06:39 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:42670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1luECj-0000AU-75
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 09:06:39 -0400
Received: by mail-qk1-x72b.google.com with SMTP id q16so10703654qkm.9
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 06:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RY7An0IH402nS2qVBIvW9ei/gUGxICUARxCj10lOLOc=;
 b=EUGRKkQXWy5exqelpvD6bM36HZE+I+EkQl7Q79MRMx87MF6Eq8b0eXYq/cc7Zx9XDg
 endLvaoSDqZnPXNZwNga/I9YOZROBprEWPaByKIHehguMW1yZDUT/U+/rScPx5vpaJCc
 ZoKrJPxDkbklWCrkh+rXOm0NZsIMWkTeE32mLtD1LOX4y/3jIiFGzYiywhfwM2R7KbjC
 ytORjUByxLDEVTn6SxV64N4To4uUE1nEZ/lf8ldnnYsC0cK4tkf7w3vSQ062NxfJW5Nm
 cQSbZpE/sYfi8ziMIxSS+V8DWMBbI1kxHWRdZYuN2fAQr98GI6elkSM0viOGhDqpNtB4
 2lBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RY7An0IH402nS2qVBIvW9ei/gUGxICUARxCj10lOLOc=;
 b=LyykddGFFh5/2A5SI/TftZy11k3cHI2pbciCM9KJKN6BwgffyUHk/3tQYLQp5JNvcy
 18U/2KrjTag2hN8YSwxANlWsHXZcRxr1e6DsInJrK9RT8AN/qF4OWgdf9d0OmeFv05ap
 TBoy2vG0HnKo7e9cBzSRSGYdGVBVmsu7H/XCFX5GsVjdl/5/AsXvB/3fKgKbNsXgsVeD
 sZIayfj0+UNLcgoOz+69hXBVbDxUOwDiKFqLC7vF18Nbeg4yd126V83qA2zllUY1kVtN
 q5SDKZwY6oBfOSuin7lK5nmuWvgWcMwOti7Wxgj1kZ1rOZNUk/uXMt0emxfRjv8v6v/6
 McGQ==
X-Gm-Message-State: AOAM530CGOVM4xnXVEEauSVcuEC2HjDqoKXA+36i18niu3azDvTtDwn0
 rcsvdKfb3cOA+uWlgnbgppt17//Vbs+lAbA9Aks=
X-Google-Smtp-Source: ABdhPJzkRanAD5YhNVcggQtWhEQikg9gVo70+ltHj7PbFlhGbRKxTWwFGbIof5KwG/hAl2dChVBU82QGoRGd5trf7ME=
X-Received: by 2002:a25:b701:: with SMTP id t1mr12556430ybj.517.1624021596199; 
 Fri, 18 Jun 2021 06:06:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAEUhbmWMzo7ZhZLjk_ScBv=AskOY670L62ujqm76tgC5Zjbq4A@mail.gmail.com>
 <20210618114650.mge72lslmr7cakxw@sirius.home.kraxel.org>
In-Reply-To: <20210618114650.mge72lslmr7cakxw@sirius.home.kraxel.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 18 Jun 2021 21:06:25 +0800
Message-ID: <CAEUhbmW0kh9wKtSQJUCgwzmbCehvrWg6L2xn65jPokLwEjO45A@mail.gmail.com>
Subject: Re: Too slow edk2 bios boot?
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000595d0f05c509fe42"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x72b.google.com
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
Cc: Laszlo Ersek <lersek@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000595d0f05c509fe42
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 18, 2021 at 7:46 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

> On Fri, Jun 18, 2021 at 06:46:57PM +0800, Bin Meng wrote:
> > Hi Laszlo,
> >
> > Using the QEMU shipped edk2 bios, for i386, it boots very quickly to
> > the EFI shell.
> >
> > $ qemu-system-i386 -nographic -pflash edk2-i386-code.fd
> >
> > However with x86_64, it takes a very long time to boot to the EFI
> > shell. It seems it got stuck in the PXE boot. Any ideas?
>
> One year ago ia32 efi netboot support was dropped (and you are the first
> who noticed =F0=9F=98=8E ).
>

I guess not many people play with ia32 these days :)


>
> commit 9ed02fbb847277bef88dbe6a677cf3e5f39e5a38
> Author: Gerd Hoffmann <kraxel@redhat.com>
> Date:   Wed Jul 22 12:24:35 2020 +0200
>
>     ipxe: drop ia32 efi roms
>
>     UEFI on ia32 never really took off.  Basically the BIOS -> UEFI shift
>     came too late, x64 was widespread already, so vendors went from BIOS
>     straight to UEFI on x64.
>
>     Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>
>
> > I checked the boot manager, and it seems only 64-bit edk2 bios has
> > built-in PXE boot while 32-bit does not.
>
> It isn't edk2 but the nic boot roms, but yes, lack of pxe support on
> ia32 is the root cause.
>

Got it.


> > Any idea to speed up this whole PXE boot thing?
>
> qemu -nic none ?
>

Yep this works. Thanks a lot!

Regards,
Bin

--000000000000595d0f05c509fe42
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Fri, Jun 18, 2021 at 7:46 PM Gerd Hoffmann &lt;<a href=3D"mailto:=
kraxel@redhat.com">kraxel@redhat.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">On Fri, Jun 18, 2021 at 06:46:57PM +080=
0, Bin Meng wrote:<br>
&gt; Hi Laszlo,<br>
&gt; <br>
&gt; Using the QEMU shipped edk2 bios, for i386, it boots very quickly to<b=
r>
&gt; the EFI shell.<br>
&gt; <br>
&gt; $ qemu-system-i386 -nographic -pflash edk2-i386-code.fd<br>
&gt; <br>
&gt; However with x86_64, it takes a very long time to boot to the EFI<br>
&gt; shell. It seems it got stuck in the PXE boot. Any ideas?<br>
<br>
One year ago ia32 efi netboot support was dropped (and you are the first<br=
>
who noticed =F0=9F=98=8E ).<br></blockquote><div><br></div><div>I guess not=
 many people play with ia32 these days :)<br></div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
<br>
commit 9ed02fbb847277bef88dbe6a677cf3e5f39e5a38<br>
Author: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" target=3D"_b=
lank">kraxel@redhat.com</a>&gt;<br>
Date:=C2=A0 =C2=A0Wed Jul 22 12:24:35 2020 +0200<br>
<br>
=C2=A0 =C2=A0 ipxe: drop ia32 efi roms<br>
<br>
=C2=A0 =C2=A0 UEFI on ia32 never really took off.=C2=A0 Basically the BIOS =
-&gt; UEFI shift<br>
=C2=A0 =C2=A0 came too late, x64 was widespread already, so vendors went fr=
om BIOS<br>
=C2=A0 =C2=A0 straight to UEFI on x64.<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@red=
hat.com" target=3D"_blank">kraxel@redhat.com</a>&gt;<br>
<br>
<br>
&gt; I checked the boot manager, and it seems only 64-bit edk2 bios has<br>
&gt; built-in PXE boot while 32-bit does not.<br>
<br>
It isn&#39;t edk2 but the nic boot roms, but yes, lack of pxe support on<br=
>
ia32 is the root cause.<br></blockquote><div><br></div><div>Got it.<br></di=
v><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; Any idea to speed up this whole PXE boot thing?<br>
<br>
qemu -nic none ?<br></blockquote><div><br></div><div>Yep this works. Thanks=
 a lot! <br></div><div></div><div><br></div><div>Regards,</div><div>Bin<br>=
</div></div></div>

--000000000000595d0f05c509fe42--


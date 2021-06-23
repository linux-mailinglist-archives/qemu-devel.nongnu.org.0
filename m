Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F199F3B135F
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 07:48:47 +0200 (CEST)
Received: from localhost ([::1]:54408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvvkk-00040L-FA
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 01:48:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lvvjd-0003KU-4O
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 01:47:37 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:41865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lvvjR-0004Cw-Rm
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 01:47:36 -0400
Received: by mail-qk1-x736.google.com with SMTP id bl4so2245727qkb.8
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 22:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DpT/VbjAdF8ULSUgXNEX/SHWOW2b9dbtJFFZqMmG4jo=;
 b=V3ZdOHaQgERefcAXrA+mEz55WgM44Ybm63bYmja3q8rHMNLZIc0JcSn93MElkUubjM
 JH27YSDIuq9G9jfI+eE02GJyfMKmKIPYHQgF/NKPzbLts8lHpeWtW0R6xdeAGFcErfNx
 Q/iCXIa/7a/lR+GNG9+nmxHmLSE2agB8mR8yugFzzWkc9mYproVEi307wQQFcCzn3xgh
 Eb9JHhI4uz4WQszV9obmsVW7HjqL9AGYEGyxRpnaVba9bLD21QoQKGBE83kYcc05VvVS
 r+A8YclYDznDLNBmk759YnntZlSWGVBrRJVPpHLOBsaPaa4kGBObcMFEQIQELX57RKkd
 GVJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DpT/VbjAdF8ULSUgXNEX/SHWOW2b9dbtJFFZqMmG4jo=;
 b=uE1kzWmPt3/j49eket27jZkNoTm86ZfqPVBrbGE+LyiVrvzRzw7+deXCgSqr/G8v5X
 ifumWn9fMbDoMduhMv1JaLf9skJigyDOSAMzjT7aWhqxIDgvhc/gQmz2eKQRrblpWVMv
 W/1ztfSJAFa886yxMjE3VUj5bu1Fx+kER8zLehBixZoGONGivb/ELLOSRk4vwImNPwmo
 WuMp27Rkq3Hl/uh++wsVYiukGh59O4RHMDVzr1CexM12ZOEtglzK+Co2X/RL0a6pg5/m
 BDa+jFILK/mHYTXtWWZrxyczWvj9QV2o5nyB6KceSP3XUPWLjwDETkaHPB5HJbw5bzXx
 kzQw==
X-Gm-Message-State: AOAM532Q2IfFOy+tg/r/qfAbOueoWRAQo6tdbpST3S60pzKkogQbnGfL
 OO7DsXanuAQA7cBP59WLr7z20klFWjqiodXrwvOYQ5Ohc7s=
X-Google-Smtp-Source: ABdhPJx3sCb96xm8iDBEVUMii6Lcq6+ybJX0klfzH0QWj28ZtWwVon929RrXG2gBwsNYlgjFBC1X+/I1HFLFRRHJPg0=
X-Received: by 2002:a25:389:: with SMTP id 131mr10017493ybd.306.1624427243048; 
 Tue, 22 Jun 2021 22:47:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAEUhbmWMzo7ZhZLjk_ScBv=AskOY670L62ujqm76tgC5Zjbq4A@mail.gmail.com>
 <20210618114650.mge72lslmr7cakxw@sirius.home.kraxel.org>
 <CAEUhbmW0kh9wKtSQJUCgwzmbCehvrWg6L2xn65jPokLwEjO45A@mail.gmail.com>
 <66fed11e-9b74-0ca0-4922-0d4fe344b962@redhat.com>
In-Reply-To: <66fed11e-9b74-0ca0-4922-0d4fe344b962@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 23 Jun 2021 13:47:11 +0800
Message-ID: <CAEUhbmWP3Wi-vL-ACyMtwTbukdHNQArXAE0gHFaHYHAW4ONuKg@mail.gmail.com>
Subject: Re: Too slow edk2 bios boot?
To: Laszlo Ersek <lersek@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000c9148505c5687010"
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x736.google.com
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
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c9148505c5687010
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laszlo,

On Wed, Jun 23, 2021 at 12:13 AM Laszlo Ersek <lersek@redhat.com> wrote:

> On 06/18/21 15:06, Bin Meng wrote:
> > On Fri, Jun 18, 2021 at 7:46 PM Gerd Hoffmann <kraxel@redhat.com> wrote=
:
> >
> >> On Fri, Jun 18, 2021 at 06:46:57PM +0800, Bin Meng wrote:
> >>> Hi Laszlo,
> >>>
> >>> Using the QEMU shipped edk2 bios, for i386, it boots very quickly to
> >>> the EFI shell.
> >>>
> >>> $ qemu-system-i386 -nographic -pflash edk2-i386-code.fd
>
> Ouch. Don't do this. If you use just one pflash chip, then a unified FD
> file is expected in that chip, containing both varstore and firmware
> executable.
>
> Upstream QEMU does not bundle / install unified FD files however. What it
> provides are separate executables and varstore *templates*.
>
> If you don't want to create a permanent variable store file for your VM,
> from the template called "edk2-i386-vars.fd", then the minimum command li=
ne
> is something like this:
>
> qemu-system-i386 \
>   -drive if=3Dpflash,unit=3D0,format=3Draw,readonly=3Don,file=3Dedk2-i386=
-code.fd \
>   -drive if=3Dpflash,unit=3D1,format=3Draw,snapshot=3Don,file=3Dedk2-i386=
-vars.fd \
>
> (Nowadays I should use the "blockdev" syntax instead of "-drive", but I'v=
e
> not updated my scripts thus far ;))
>

Thank you. I suggest we document this in the QEMU documentation [1]


> >>>
> >>> However with x86_64, it takes a very long time to boot to the EFI
> >>> shell. It seems it got stuck in the PXE boot. Any ideas?
> >>
> >> One year ago ia32 efi netboot support was dropped (and you are the fir=
st
> >> who noticed =F0=9F=98=8E ).
>
> I certainly noticed:
>
> http://mid.mail-archive.com/e6078611-789f-027b-bea5-759e02b10eee@redhat.c=
om
>
>
> >>
> >
> > I guess not many people play with ia32 these days :)
> >
> >
> >>
> >> commit 9ed02fbb847277bef88dbe6a677cf3e5f39e5a38
> >> Author: Gerd Hoffmann <kraxel@redhat.com>
> >> Date:   Wed Jul 22 12:24:35 2020 +0200
> >>
> >>     ipxe: drop ia32 efi roms
> >>
> >>     UEFI on ia32 never really took off.  Basically the BIOS -> UEFI
> shift
> >>     came too late, x64 was widespread already, so vendors went from BI=
OS
> >>     straight to UEFI on x64.
> >>
> >>     Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> >>
> >>
> >>> I checked the boot manager, and it seems only 64-bit edk2 bios has
> >>> built-in PXE boot while 32-bit does not.
> >>
> >> It isn't edk2 but the nic boot roms, but yes, lack of pxe support on
> >> ia32 is the root cause.
> >>
> >
> > Got it.
> >
> >
> >>> Any idea to speed up this whole PXE boot thing?
> >>
> >> qemu -nic none ?
> >>
> >
> > Yep this works. Thanks a lot!
>
> If you need neither NICs nor disks in your guest at all, then "-nic none"
> is indeed the simplest solution.
>

If using NICs in the guest, then we have to adjust the order in the BIOS
boot menu?

[1] https://qemu.readthedocs.io/en/latest/system/target-i386.html

Regards,
Bin

--000000000000c9148505c5687010
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Laszlo,<br></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 23, 2021 at 12:13 AM Laszlo=
 Ersek &lt;<a href=3D"mailto:lersek@redhat.com">lersek@redhat.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 06/18/2=
1 15:06, Bin Meng wrote:<br>
&gt; On Fri, Jun 18, 2021 at 7:46 PM Gerd Hoffmann &lt;<a href=3D"mailto:kr=
axel@redhat.com" target=3D"_blank">kraxel@redhat.com</a>&gt; wrote:<br>
&gt; <br>
&gt;&gt; On Fri, Jun 18, 2021 at 06:46:57PM +0800, Bin Meng wrote:<br>
&gt;&gt;&gt; Hi Laszlo,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Using the QEMU shipped edk2 bios, for i386, it boots very quic=
kly to<br>
&gt;&gt;&gt; the EFI shell.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; $ qemu-system-i386 -nographic -pflash edk2-i386-code.fd<br>
<br>
Ouch. Don&#39;t do this. If you use just one pflash chip, then a unified FD=
 file is expected in that chip, containing both varstore and firmware execu=
table.<br>
<br>
Upstream QEMU does not bundle / install unified FD files however. What it p=
rovides are separate executables and varstore *templates*.<br>
<br>
If you don&#39;t want to create a permanent variable store file for your VM=
, from the template called &quot;edk2-i386-vars.fd&quot;, then the minimum =
command line is something like this:<br>
<br>
qemu-system-i386 \<br>
=C2=A0 -drive if=3Dpflash,unit=3D0,format=3Draw,readonly=3Don,file=3Dedk2-i=
386-code.fd \<br>
=C2=A0 -drive if=3Dpflash,unit=3D1,format=3Draw,snapshot=3Don,file=3Dedk2-i=
386-vars.fd \<br>
<br>
(Nowadays I should use the &quot;blockdev&quot; syntax instead of &quot;-dr=
ive&quot;, but I&#39;ve not updated my scripts thus far ;))<br></blockquote=
><div><br></div><div>Thank you. I suggest we document this in the QEMU docu=
mentation [1]<br></div><div>=C2=A0<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
&gt;&gt;&gt;<br>
&gt;&gt;&gt; However with x86_64, it takes a very long time to boot to the =
EFI<br>
&gt;&gt;&gt; shell. It seems it got stuck in the PXE boot. Any ideas?<br>
&gt;&gt;<br>
&gt;&gt; One year ago ia32 efi netboot support was dropped (and you are the=
 first<br>
&gt;&gt; who noticed =F0=9F=98=8E ).<br>
<br>
I certainly noticed:<br>
<br>
<a href=3D"http://mid.mail-archive.com/e6078611-789f-027b-bea5-759e02b10eee=
@redhat.com" rel=3D"noreferrer" target=3D"_blank">http://mid.mail-archive.c=
om/e6078611-789f-027b-bea5-759e02b10eee@redhat.com</a><br>
<br>
<br>
&gt;&gt;<br>
&gt; <br>
&gt; I guess not many people play with ia32 these days :)<br>
&gt; <br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt; commit 9ed02fbb847277bef88dbe6a677cf3e5f39e5a38<br>
&gt;&gt; Author: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" tar=
get=3D"_blank">kraxel@redhat.com</a>&gt;<br>
&gt;&gt; Date:=C2=A0 =C2=A0Wed Jul 22 12:24:35 2020 +0200<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0ipxe: drop ia32 efi roms<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0UEFI on ia32 never really took off.=C2=A0 Basic=
ally the BIOS -&gt; UEFI shift<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0came too late, x64 was widespread already, so v=
endors went from BIOS<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0straight to UEFI on x64.<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mai=
lto:kraxel@redhat.com" target=3D"_blank">kraxel@redhat.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;&gt; I checked the boot manager, and it seems only 64-bit edk2 bios=
 has<br>
&gt;&gt;&gt; built-in PXE boot while 32-bit does not.<br>
&gt;&gt;<br>
&gt;&gt; It isn&#39;t edk2 but the nic boot roms, but yes, lack of pxe supp=
ort on<br>
&gt;&gt; ia32 is the root cause.<br>
&gt;&gt;<br>
&gt; <br>
&gt; Got it.<br>
&gt; <br>
&gt; <br>
&gt;&gt;&gt; Any idea to speed up this whole PXE boot thing?<br>
&gt;&gt;<br>
&gt;&gt; qemu -nic none ?<br>
&gt;&gt;<br>
&gt; <br>
&gt; Yep this works. Thanks a lot!<br>
<br>
If you need neither NICs nor disks in your guest at all, then &quot;-nic no=
ne&quot; is indeed the simplest solution.<br></blockquote><div><br></div><d=
iv>If using NICs in the guest, then we have to adjust the order in the BIOS=
 boot menu?<br></div><div><br></div><div>[1] <a href=3D"https://qemu.readth=
edocs.io/en/latest/system/target-i386.html">https://qemu.readthedocs.io/en/=
latest/system/target-i386.html</a></div><div><br></div><div>Regards,</div><=
div>Bin<br></div></div></div>

--000000000000c9148505c5687010--


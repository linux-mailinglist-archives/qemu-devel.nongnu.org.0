Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7800A5BB0EF
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 18:14:08 +0200 (CEST)
Received: from localhost ([::1]:57488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZDyf-0007sJ-4a
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 12:14:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oZDtW-0002Sy-3p; Fri, 16 Sep 2022 12:08:46 -0400
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b]:44792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oZDtS-0003ZA-M5; Fri, 16 Sep 2022 12:08:45 -0400
Received: by mail-vk1-xa2b.google.com with SMTP id s12so4195402vkn.11;
 Fri, 16 Sep 2022 09:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=WytHzKg9GRDYhDK73aVGo0kAxrZnP8XT+JaNetJPpPM=;
 b=ok6N7gJeGBlUqT7vV+lFZX+NVVnzTIEx1irr/7xs/8Zn/el0wINOdA454Hg/6Gp8HV
 0nK5WEJnjWFkeipZl4hFSChK48hUTDVDW3Iahct3tmV8RsXe+axgJI0unh2Rfs7ywbVD
 uTKJX8AI/NcosY2AB1+F0VAEHD9AnWGs2AXKXeG/wgHnQTVIaZCzJXAVdQgVlpH0RYeH
 RLLyOYENVyO16I1DGzFWYuDVKEUee9pBSb2C5YBcgsLgneNnqQIJdcgvx6VeiB6sPoyr
 QI7dDp94KMT3t6G919K17mV0AcDelZQ0GKcaBpOQWuBnOrCl4HY/Miv8MM3o4FwL0fep
 Uc8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=WytHzKg9GRDYhDK73aVGo0kAxrZnP8XT+JaNetJPpPM=;
 b=509FlpzisbBKqOooZnVDF47Rj44oYxN/r+lCWXbGlhTQlSwUogbEdBRrNXysnh3zNl
 RdhipbpwGwpq4sDKVU+xrhnkG1wknACKqJEBioP7YD+ZkAY/g5GPcEOWFDX9pISbSda1
 2OLyqkNhelZKUEP2Qvi0KUxFOGNiN5gX9w/sdzaR+2byEZQVrlVjHF33u8k0ETt7RNxH
 iqXMMlUL45WWSp1ovu9LyLWiOqBe7aINpDorfLNmvORdc0UJP1/QbUWxrPciVbodJ22z
 bNRYWdjDHFuMrhByBtIBxAsOfoZm7RDWg5P938NtMhz7ga3YJRHIjK7tXeMjfsXfppop
 ST6A==
X-Gm-Message-State: ACrzQf35tohsGMSH0X+Sv61jMAPnRvobS51CYFj9nT38XRcilH4Vcsit
 CjcbrqJMDUd10k0pV+DdShLElNM7FS43rgfMUzabAOhhtio=
X-Google-Smtp-Source: AMsMyM713sPHHfl3SrFmnhfvOayufPGK6UAQN0fXVwaAluLRT5fg20wMYwEm2zKZt7PcGTkFKYnhg0o/gvobdkfDcsM=
X-Received: by 2002:a1f:3485:0:b0:397:f007:29e with SMTP id
 b127-20020a1f3485000000b00397f007029emr2409720vka.20.1663344520221; Fri, 16
 Sep 2022 09:08:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220915152520.21948-1-shentey@gmail.com>
 <CAEUhbmU-dgBg4bmezEEBiKBVx06Dz-Zykv9JFyna6LyboVt7Hg@mail.gmail.com>
In-Reply-To: <CAEUhbmU-dgBg4bmezEEBiKBVx06Dz-Zykv9JFyna6LyboVt7Hg@mail.gmail.com>
From: Bernhard Beschow <shentey@gmail.com>
Date: Fri, 16 Sep 2022 18:08:26 +0200
Message-ID: <CAG4p6K72E3eWS4VRRd05NZzSY04gMCrncZ9h84FLDSh+mG6=Vg@mail.gmail.com>
Subject: Re: [PATCH 00/11] ppc/e500: Add support for two types of flash,
 cleanup
To: Bin Meng <bmeng.cn@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, qemu-ppc <qemu-ppc@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000004457cc05e8cd939f"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2b;
 envelope-from=shentey@gmail.com; helo=mail-vk1-xa2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004457cc05e8cd939f
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 16, 2022 at 5:27 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> Hi Bernhard,
>

Hi Bin,


> On Thu, Sep 15, 2022 at 11:25 PM Bernhard Beschow <shentey@gmail.com>
> wrote:
> >
> > This series adds support for -pflash and direct SD card access to the
> > PPC e500 boards. The idea is to increase compatibility with "real"
> firmware
> > images where only the bare minimum of drivers is compiled in.
> >
> > The series is structured as follows:
> >
> > Patches 1-3 perform some general cleanup which paves the way for the
> rest of
> > the series.
> >
> > Patches 4-7 add -pflash handling where memory-mapped flash can be added
> on
> > user's behalf. That is, the flash memory region is only added if the
> -pflash
> > argument is supplied. Note that the cfi01 device model becomes stricter
> in
> > checking the size of the emulated flash space.
> >
> > Patches 8-11 add a new device model - the Freescale eSDHC - to the e500
> > boards which was missing so far.
> >
> > User documentation is also added as the new features become available.
> >
> > Tesing done:
> > * `qemu-system-ppc -M ppce500 -cpu e500mc -m 256 -kernel uImage -append
> > "console=ttyS0 rootwait root=/dev/mtdblock0 nokaslr" -drive
> > if=pflash,file=rootfs.ext2,format=raw`
> > * `qemu-system-ppc -M ppce500 -cpu e500mc -m 256 -kernel uImage -append
> > "console=ttyS0 rootwait root=/dev/mmcblk0" -device sd-card,drive=mydrive
> -drive
> > id=mydrive,if=none,file=rootfs.ext2,format=raw`
>
> Thanks for the patches!
>

My obligation!


> Did you get a chance to test the U-Boot image to work with pflash and
> eSDHC?
>

 No, unfortunately not. Testing U-Boot would involve familiarizing myself
with it first which will probably come at some point. Right now, however,
my focus is on running a proprietary firmware flash image.

Best regards,
Bernhard

> >
> > The load was created using latest Buildroot with `make
> > qemu_ppc_e500mc_defconfig` where the rootfs was configured to be of ext2
> type.
> > In both cases it was possible to log in and explore the root file system.
> >
>
> Regards,
> Bin
>

--0000000000004457cc05e8cd939f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 16, 2022 at 5:27 PM Bin M=
eng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Bernhard=
,<br></blockquote><div><br></div><div>Hi Bin,</div><div>=C2=A0<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
On Thu, Sep 15, 2022 at 11:25 PM Bernhard Beschow &lt;<a href=3D"mailto:she=
ntey@gmail.com" target=3D"_blank">shentey@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; This series adds support for -pflash and direct SD card access to the<=
br>
&gt; PPC e500 boards. The idea is to increase compatibility with &quot;real=
&quot; firmware<br>
&gt; images where only the bare minimum of drivers is compiled in.<br>
&gt;<br>
&gt; The series is structured as follows:<br>
&gt;<br>
&gt; Patches 1-3 perform some general cleanup which paves the way for the r=
est of<br>
&gt; the series.<br>
&gt;<br>
&gt; Patches 4-7 add -pflash handling where memory-mapped flash can be adde=
d on<br>
&gt; user&#39;s behalf. That is, the flash memory region is only added if t=
he -pflash<br>
&gt; argument is supplied. Note that the cfi01 device model becomes stricte=
r in<br>
&gt; checking the size of the emulated flash space.<br>
&gt;<br>
&gt; Patches 8-11 add a new device model - the Freescale eSDHC - to the e50=
0<br>
&gt; boards which was missing so far.<br>
&gt;<br>
&gt; User documentation is also added as the new features become available.=
<br>
&gt;<br>
&gt; Tesing done:<br>
&gt; * `qemu-system-ppc -M ppce500 -cpu e500mc -m 256 -kernel uImage -appen=
d<br>
&gt; &quot;console=3DttyS0 rootwait root=3D/dev/mtdblock0 nokaslr&quot; -dr=
ive<br>
&gt; if=3Dpflash,file=3Drootfs.ext2,format=3Draw`<br>
&gt; * `qemu-system-ppc -M ppce500 -cpu e500mc -m 256 -kernel uImage -appen=
d<br>
&gt; &quot;console=3DttyS0 rootwait root=3D/dev/mmcblk0&quot; -device sd-ca=
rd,drive=3Dmydrive -drive<br>
&gt; id=3Dmydrive,if=3Dnone,file=3Drootfs.ext2,format=3Draw`<br>
<br>
Thanks for the patches!<br></blockquote><div><br></div><div>My obligation!<=
/div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
Did you get a chance to test the U-Boot image to work with pflash and eSDHC=
?<br></blockquote><div><br></div><div>=C2=A0No, unfortunately not. Testing =
U-Boot would involve familiarizing myself with it first which will probably=
 come at some point. Right now, however, my  focus is on running a  proprie=
tary firmware flash image.</div><div><br></div><div>Best regards,</div><div=
>Bernhard<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;<br>
&gt; The load was created using latest Buildroot with `make<br>
&gt; qemu_ppc_e500mc_defconfig` where the rootfs was configured to be of ex=
t2 type.<br>
&gt; In both cases it was possible to log in and explore the root file syst=
em.<br>
&gt;<br>
<br>
Regards,<br>
Bin<br>
</blockquote></div></div>

--0000000000004457cc05e8cd939f--


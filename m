Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 945E250BB0A
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 17:01:46 +0200 (CEST)
Received: from localhost ([::1]:43136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhun3-0008FS-FL
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 11:01:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mulyadi.santosa@gmail.com>)
 id 1nhuew-00034U-Du
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 10:53:22 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:43720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mulyadi.santosa@gmail.com>)
 id 1nhueu-00072Z-BS
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 10:53:22 -0400
Received: by mail-io1-xd2f.google.com with SMTP id 125so8820888iov.10
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 07:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=izc0vYocGhM9M3h8ThjKQFtRYSthiG3xia+2Tvx/rAs=;
 b=ZPfaJeHPetytsMksVk4KBNQ8a1xDG0IhvtAvhL2CfI+72O9ojixMWIIu5nkrMeCA++
 VwDuZj43H2hIYHs+ObK7nUonQpeC5+HrI2dnpc0HGi9Bp3salWN6cpojhhIWhlS9UUNX
 K8NpskPWnA9XItsgedmELdKf8kmRiCR7prgrdaOjGqeLBqDwVtGUTHoBRNoICX3u9Nl+
 2JF7drx/qboaCW9i7vK1pMh4oULRMdZzVWGAFepATzYiCeAciU30d3w1sCFylZI8NBqv
 V2+34Zf+gnjki8Y1OxK1n9nckt1HiLhTlexBv7EsES6aDDfZi0VoVReV8DtckMmtYhMW
 EK0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=izc0vYocGhM9M3h8ThjKQFtRYSthiG3xia+2Tvx/rAs=;
 b=nt3Mjb3X4d6P8+nj3SY0cAadkxUsPcinqD6Q0jPcHFXhtVyQsNgkmHVbcMkEQyoYkG
 RgK17D7ZZo880gBLRzrA9dYHg0s+3fx80cUs9TzuEk1DQxc2wPzUEzbqhaxZCvgoOAYj
 PBbqgTKdOAbEjz0HOx0GF5TegwjoySkg023/xrfH76WI8X3nuHHaAZQl+Tj60HP+130r
 JHCl8sc8gt9YwUflaNish7Ow8txjjIbctLJREg+dYizBKxiog6jmJrctLQJjm+Qnmbdr
 MzVKxQmi3rNmkjDLvgGaaptY5Mj58lS+GJ2HsQ5hOTKvwTMa0rn6C0wWMhPfoYV/N1dB
 x5bQ==
X-Gm-Message-State: AOAM5327lPhzWVTv3kvV/Bb7umlEEqBTa3LcqRLccDTZCquVQnC+fCAP
 9ELkdh3K5IO1Ywvl5BjGQfTSMfVW6cFgfZidepjFyfeT
X-Google-Smtp-Source: ABdhPJyQBayQUO5P0mNh5XiPOyhfxtdI5SNpMbuW9Lw3lSgONT5hiztRkuZjbouWkWHCmCnao2gfPjbdZwx4DJYxwf0=
X-Received: by 2002:a02:7781:0:b0:326:5eb2:eee5 with SMTP id
 g123-20020a027781000000b003265eb2eee5mr2487989jac.74.1650639197230; Fri, 22
 Apr 2022 07:53:17 -0700 (PDT)
MIME-Version: 1.0
References: <025301d85642$901587b0$b0409710$@etri.re.kr>
In-Reply-To: <025301d85642$901587b0$b0409710$@etri.re.kr>
From: Mulyadi Santosa <mulyadi.santosa@gmail.com>
Date: Fri, 22 Apr 2022 21:52:41 +0700
Message-ID: <CAGdaadZ-QgACt+K04mxpa64QGQuw4SAWbp4Nmac0hk4HdvnHsQ@mail.gmail.com>
Subject: Re: Backtrace stopped: previous frame identical to this frame
 (corrupt stack?) , even with fresh qemu and linux build
To: Chan Kim <ckim@etri.re.kr>
Content-Type: multipart/alternative; boundary="00000000000000db2f05dd3f6329"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=mulyadi.santosa@gmail.com; helo=mail-io1-xd2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 22 Apr 2022 11:00:23 -0400
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
Cc: qemu-devel <qemu-devel@nongnu.org>,
 kernelnewbies <kernelnewbies@kernelnewbies.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000000db2f05dd3f6329
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 22, 2022 at 7:30 PM Chan Kim <ckim@etri.re.kr> wrote:

> Hello all,
>
> Really strange thing happening here.. I can't see the full stack trace with
> 'bt' command in gdb.
> So I tried with fresh linux-5.10.122 source and qemu-6.2.0 source and it's
> happening too!
> (it's happening when I do combinations with linux 5.10.0 and qemu-5.1.0.
> But
> it's not happening with linux-5.4.21)
>
> I would be grateful if somebody could check if this happens to other people
> or just me.
>
> 1. download linux-5.1.122 tarball from https://www.kernel.org/
> 2. uncompress it and set env variable ARCH=arm64,
> CROSS_COMPILE=aarch64-none-elf- , do "make defconfig" and "make -j`nproc`
> Image"
> 3. download qemu-6.2.0 from https://www.qemu.org/
> 4. uncompress it and do "mkdir build" "cd build" "../configure
> --target-list=aarch64-softmmu --enable-debug"
> 5. run qemu and wait for debugger to attach.
> qemu-6.2.0/build/aarch64-softmmu/qemu-system-aarch64 -machine
> virt,gic-version=max,secure=off,virtualization=true -cpu max -kernel
> linux-5.10.112/arch/arm64/boot/Image -m 2G -nographic -netdev
> user,id=vnet,hostfwd=:127.0.0.1:0-:22,tftp=/srv/tftp -device
> virtio-net-pci,netdev=vnet -machine iommu=smmuv3 --append "root=/dev/ram
> init=/init nokaslr earlycon ip=dhcp hugepages=16" -s -S
> 6. run debugger, do "aarch64-none-elf-gdb linux-6.10.112/vmlinux -x\
>

It has been long time since I compiled linux kernel but I guess, either you
need to compile kernel with enabled frame pointer, and/or you need to
enable debug symbol embedded into final kernel image. cmiiw


> gdb_script"
> (gdb_script content :
> target remote :1234
> layout src
> b start_kernel
> b __driver_attach
> )
>
> Now, in gdb, when you press 'c' twice, it'll stop at the first
> __driver_attach. (first one stops at start_kernel).
> When you are at __attach_driver, type 'bt'. See if you see the full
> function
> stack trace.
> This is what I see.
> (gdb) bt
> #0  __driver_attach (dev=0xffff000002582810, data=0xffff800011dc2358
> <dummy_regulator_driver+40>)
>     at drivers/base/dd.c:1060
> #1  0xffff8000107a3ed0 in bus_for_each_dev (bus=<optimized out>,
> start=<optimized out>,
>     data=0xffff800011dc2358 <dummy_regulator_driver+40>,
> fn=0xffff8000107a6f60 <__driver_attach>)
>     at drivers/base/bus.c:305
> #2  0xd6d78000107a5c58 in ?? ()
> Backtrace stopped: previous frame identical to this frame (corrupt stack?)
>
> I used to see more thatn 20 stacks trace but strangely I see only two.
> I can still see many stacks for linux-5.4.21 that I was working with in the
> past.
> Could anyone check if this happens to anyone?
> I think if I add BLK_DEV_RAM and set initramfs.cpio.gz in the linux build,
> the kernel will boot ok to the shell prompt.
> Only the gdb can't show the stack levels.
>
> My OS : ubuntu-20.04  5.13.0-35-generic
>
> $ aarch64-none-elf-gdb --version
> GNU gdb (GNU Toolchain for the A-profile Architecture 10.2-2020.11
> (arm-10.16)) 10.1.90.20201028-git
> Copyright (C) 2020 Free Software Foundation, Inc.
> License GPLv3+: GNU GPL version 3 or later
> <http://gnu.org/licenses/gpl.html>
> This is free software: you are free to change and redistribute it.
> There is NO WARRANTY, to the extent permitted by law.
>
> Thank you.
> Chan Kim
>
>
>
>
>
> _______________________________________________
> Kernelnewbies mailing list
> Kernelnewbies@kernelnewbies.org
> https://lists.kernelnewbies.org/mailman/listinfo/kernelnewbies
>


-- 
regards,

Mulyadi Santosa
Freelance Linux trainer and consultant

blog: the-hydra.blogspot.com
training: mulyaditraining.blogspot.com

--00000000000000db2f05dd3f6329
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 22, 2022 at 7:30 PM Chan =
Kim &lt;<a href=3D"mailto:ckim@etri.re.kr">ckim@etri.re.kr</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello all,<br>
<br>
Really strange thing happening here.. I can&#39;t see the full stack trace =
with<br>
&#39;bt&#39; command in gdb.<br>
So I tried with fresh linux-5.10.122 source and qemu-6.2.0 source and it&#3=
9;s<br>
happening too!<br>
(it&#39;s happening when I do combinations with linux 5.10.0 and qemu-5.1.0=
. But<br>
it&#39;s not happening with linux-5.4.21)<br>
<br>
I would be grateful if somebody could check if this happens to other people=
<br>
or just me.<br>
<br>
1. download linux-5.1.122 tarball from <a href=3D"https://www.kernel.org/" =
rel=3D"noreferrer" target=3D"_blank">https://www.kernel.org/</a> <br>
2. uncompress it and set env variable ARCH=3Darm64,<br>
CROSS_COMPILE=3Daarch64-none-elf- , do &quot;make defconfig&quot; and &quot=
;make -j`nproc`<br>
Image&quot;<br>
3. download qemu-6.2.0 from <a href=3D"https://www.qemu.org/" rel=3D"norefe=
rrer" target=3D"_blank">https://www.qemu.org/</a><br>
4. uncompress it and do &quot;mkdir build&quot; &quot;cd build&quot; &quot;=
../configure<br>
--target-list=3Daarch64-softmmu --enable-debug&quot;<br>
5. run qemu and wait for debugger to attach.<br>
qemu-6.2.0/build/aarch64-softmmu/qemu-system-aarch64 -machine<br>
virt,gic-version=3Dmax,secure=3Doff,virtualization=3Dtrue -cpu max -kernel<=
br>
linux-5.10.112/arch/arm64/boot/Image -m 2G -nographic -netdev<br>
user,id=3Dvnet,hostfwd=3D:127.0.0.1:0-:22,tftp=3D/srv/tftp -device<br>
virtio-net-pci,netdev=3Dvnet -machine iommu=3Dsmmuv3 --append &quot;root=3D=
/dev/ram<br>
init=3D/init nokaslr earlycon ip=3Ddhcp hugepages=3D16&quot; -s -S<br>
6. run debugger, do &quot;aarch64-none-elf-gdb linux-6.10.112/vmlinux -x\<b=
r></blockquote><div><br></div><div>It has been long time since I compiled l=
inux kernel but I guess, either you need to compile kernel with enabled fra=
me pointer, and/or you need to enable debug symbol embedded into final kern=
el image. cmiiw<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
gdb_script&quot;<br>
(gdb_script content : <br>
target remote :1234<br>
layout src<br>
b start_kernel<br>
b __driver_attach<br>
)<br>
<br>
Now, in gdb, when you press &#39;c&#39; twice, it&#39;ll stop at the first<=
br>
__driver_attach. (first one stops at start_kernel).<br>
When you are at __attach_driver, type &#39;bt&#39;. See if you see the full=
 function<br>
stack trace.<br>
This is what I see. <br>
(gdb) bt<br>
#0=C2=A0 __driver_attach (dev=3D0xffff000002582810, data=3D0xffff800011dc23=
58<br>
&lt;dummy_regulator_driver+40&gt;)<br>
=C2=A0 =C2=A0 at drivers/base/dd.c:1060<br>
#1=C2=A0 0xffff8000107a3ed0 in bus_for_each_dev (bus=3D&lt;optimized out&gt=
;,<br>
start=3D&lt;optimized out&gt;,<br>
=C2=A0 =C2=A0 data=3D0xffff800011dc2358 &lt;dummy_regulator_driver+40&gt;,<=
br>
fn=3D0xffff8000107a6f60 &lt;__driver_attach&gt;)<br>
=C2=A0 =C2=A0 at drivers/base/bus.c:305<br>
#2=C2=A0 0xd6d78000107a5c58 in ?? ()<br>
Backtrace stopped: previous frame identical to this frame (corrupt stack?)<=
br>
<br>
I used to see more thatn 20 stacks trace but strangely I see only two. <br>
I can still see many stacks for linux-5.4.21 that I was working with in the=
<br>
past. <br>
Could anyone check if this happens to anyone?<br>
I think if I add BLK_DEV_RAM and set initramfs.cpio.gz in the linux build,<=
br>
the kernel will boot ok to the shell prompt.<br>
Only the gdb can&#39;t show the stack levels.<br>
<br>
My OS : ubuntu-20.04=C2=A0 5.13.0-35-generic<br>
<br>
$ aarch64-none-elf-gdb --version<br>
GNU gdb (GNU Toolchain for the A-profile Architecture 10.2-2020.11<br>
(arm-10.16)) 10.1.90.20201028-git<br>
Copyright (C) 2020 Free Software Foundation, Inc.<br>
License GPLv3+: GNU GPL version 3 or later<br>
&lt;<a href=3D"http://gnu.org/licenses/gpl.html" rel=3D"noreferrer" target=
=3D"_blank">http://gnu.org/licenses/gpl.html</a>&gt;<br>
This is free software: you are free to change and redistribute it.<br>
There is NO WARRANTY, to the extent permitted by law.<br>
<br>
Thank you.<br>
Chan Kim<br>
<br>
<br>
<br>
<br>
<br>
_______________________________________________<br>
Kernelnewbies mailing list<br>
<a href=3D"mailto:Kernelnewbies@kernelnewbies.org" target=3D"_blank">Kernel=
newbies@kernelnewbies.org</a><br>
<a href=3D"https://lists.kernelnewbies.org/mailman/listinfo/kernelnewbies" =
rel=3D"noreferrer" target=3D"_blank">https://lists.kernelnewbies.org/mailma=
n/listinfo/kernelnewbies</a><br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">regards,<br><br>Mulyadi Santosa<br>Freelance Linux trainer =
and consultant<br><br>blog: <a href=3D"http://the-hydra.blogspot.com" targe=
t=3D"_blank">the-hydra.blogspot.com</a><br>training: <a href=3D"http://muly=
aditraining.blogspot.com" target=3D"_blank">mulyaditraining.blogspot.com</a=
></div></div>

--00000000000000db2f05dd3f6329--


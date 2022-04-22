Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F63650C49C
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Apr 2022 01:39:07 +0200 (CEST)
Received: from localhost ([::1]:57236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ni2rh-00065s-1p
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 19:39:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckim@etri.re.kr>) id 1ni2pk-0005PB-2d
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 19:37:04 -0400
Received: from mscreen.etri.re.kr ([129.254.9.16]:60419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ckim@etri.re.kr>) id 1ni2pg-0006Ns-Ku
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 19:37:03 -0400
Received: from unknown (HELO send002-relay.gov-dooray.com) (211.180.235.153)
 by 129.254.9.16 with ESMTP; 23 Apr 2022 08:36:52 +0900
X-Original-SENDERIP: 211.180.235.153
X-Original-MAILFROM: ckim@etri.re.kr
X-Original-RCPTTO: qemu-devel@nongnu.org
Received: from [10.162.225.112] (HELO smtp002-imp.gov-dooray.com)
 ([10.162.225.112]) by send002-relay.gov-dooray.com with SMTP id
 c593d57d62633c14; Sat, 23 Apr 2022 08:36:52 +0900
DKIM-Signature: a=rsa-sha256;
 b=hw1lULt8HCs6PSkXuOhCu8Vc6v+MgqGowZhVEmT5jj1ILHsqebTnOVmLoZa4lawa4+CqTZtn4c
 +2MdHLzY2wk1FfswO8G89ziRhG0gNueonIU3pk7NL3MkS/JZyWSfykH7EofFznEc+Z5M4ct9cy3c
 HXKjmZyO66QpklIsi2LDAPm9YHTn39l0hR1uqAVeNy+so3hW1JfiZwTckafk2KsK5qUg+aC8Hx0Z
 Un8v0UeKAljk6j9KPymz/xWRA3j2yKrX8GA7Q98iwPZ4Ilv7WjvZK7AViy+lIdVfBdpsHUPe85UA
 B+X9qI16Z3lnPz/fObWNvdFNy6oTTFPoN0s9O0UA==;
 c=relaxed/relaxed; s=selector; d=dooray.com; v=1;
 bh=QWEkRrp2/sya7UFX+vMOpzqHoVaF9MbFh0CoUcPwDZQ=;
 h=From:To:Subject:Message-ID;
Received: from [129.254.132.39] (HELO CHANKIMPC) ([129.254.132.39]) by
 smtp002-imp.gov-dooray.com with SMTP id 0faf70fa62633c14; Sat, 23 Apr 2022
 08:36:52 +0900
From: "Chan Kim" <ckim@etri.re.kr>
To: "'Mulyadi Santosa'" <mulyadi.santosa@gmail.com>
References: <025301d85642$901587b0$b0409710$@etri.re.kr>
 <CAGdaadZ-QgACt+K04mxpa64QGQuw4SAWbp4Nmac0hk4HdvnHsQ@mail.gmail.com>
In-Reply-To: <CAGdaadZ-QgACt+K04mxpa64QGQuw4SAWbp4Nmac0hk4HdvnHsQ@mail.gmail.com>
Subject: RE: Backtrace stopped: previous frame identical to this frame
 (corrupt stack?) , even with fresh qemu and linux build
Date: Sat, 23 Apr 2022 08:36:51 +0900
Message-ID: <029601d856a1$d7f39d60$87dad820$@etri.re.kr>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_000_0297_01D856ED.47DC56D0"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFPLp18aYBONOzwXR7Hstxska+yGwIDRNTbrf7JNVA=
Content-Language: ko
Received-SPF: pass client-ip=129.254.9.16; envelope-from=ckim@etri.re.kr;
 helo=mscreen.etri.re.kr
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: 'qemu-devel' <qemu-devel@nongnu.org>,
 'kernelnewbies' <kernelnewbies@kernelnewbies.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multipart message in MIME format.

------=_NextPart_000_0297_01D856ED.47DC56D0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, Mulyadi

Thank you for replying.

I found CONFIG_DEBUG_FRAME_POINTER, CONFIG_DEBUG_INFO are already set by =
default.

And I tried adding CONFIG_DEBUG_KERNEL, CONFIG_KGDB, CONFIG_GDB_SCRIPTS, =
CONFIG_STACKTRACE all to no avail.

Regards,

Chan

=20

From: Mulyadi Santosa <mulyadi.santosa@gmail.com>=20
Sent: Friday, April 22, 2022 11:53 PM
To: Chan Kim <ckim@etri.re.kr>
Cc: qemu-devel <qemu-devel@nongnu.org>; kernelnewbies =
<kernelnewbies@kernelnewbies.org>
Subject: Re: Backtrace stopped: previous frame identical to this frame =
(corrupt stack?) , even with fresh qemu and linux build

=20

=20

=20

On Fri, Apr 22, 2022 at 7:30 PM Chan Kim <ckim@etri.re.kr =
<mailto:ckim@etri.re.kr> > wrote:

Hello all,

Really strange thing happening here.. I can't see the full stack trace =
with
'bt' command in gdb.
So I tried with fresh linux-5.10.122 source and qemu-6.2.0 source and =
it's
happening too!
(it's happening when I do combinations with linux 5.10.0 and qemu-5.1.0. =
But
it's not happening with linux-5.4.21)

I would be grateful if somebody could check if this happens to other =
people
or just me.

1. download linux-5.1.122 tarball from https://www.kernel.org/=20
2. uncompress it and set env variable ARCH=3Darm64,
CROSS_COMPILE=3Daarch64-none-elf- , do "make defconfig" and "make =
-j`nproc`
Image"
3. download qemu-6.2.0 from https://www.qemu.org/
4. uncompress it and do "mkdir build" "cd build" "../configure
--target-list=3Daarch64-softmmu --enable-debug"
5. run qemu and wait for debugger to attach.
qemu-6.2.0/build/aarch64-softmmu/qemu-system-aarch64 -machine
virt,gic-version=3Dmax,secure=3Doff,virtualization=3Dtrue -cpu max =
-kernel
linux-5.10.112/arch/arm64/boot/Image -m 2G -nographic -netdev
user,id=3Dvnet,hostfwd=3D:127.0.0.1:0-:22,tftp=3D/srv/tftp -device
virtio-net-pci,netdev=3Dvnet -machine iommu=3Dsmmuv3 --append =
"root=3D/dev/ram
init=3D/init nokaslr earlycon ip=3Ddhcp hugepages=3D16" -s -S
6. run debugger, do "aarch64-none-elf-gdb linux-6.10.112/vmlinux -x\

=20

It has been long time since I compiled linux kernel but I guess, either =
you need to compile kernel with enabled frame pointer, and/or you need =
to enable debug symbol embedded into final kernel image. cmiiw

=20

gdb_script"
(gdb_script content :=20
target remote :1234
layout src
b start_kernel
b __driver_attach
)

Now, in gdb, when you press 'c' twice, it'll stop at the first
__driver_attach. (first one stops at start_kernel).
When you are at __attach_driver, type 'bt'. See if you see the full =
function
stack trace.
This is what I see.=20
(gdb) bt
#0  __driver_attach (dev=3D0xffff000002582810, data=3D0xffff800011dc2358
<dummy_regulator_driver+40>)
    at drivers/base/dd.c:1060
#1  0xffff8000107a3ed0 in bus_for_each_dev (bus=3D<optimized out>,
start=3D<optimized out>,
    data=3D0xffff800011dc2358 <dummy_regulator_driver+40>,
fn=3D0xffff8000107a6f60 <__driver_attach>)
    at drivers/base/bus.c:305
#2  0xd6d78000107a5c58 in ?? ()
Backtrace stopped: previous frame identical to this frame (corrupt =
stack?)

I used to see more thatn 20 stacks trace but strangely I see only two.=20
I can still see many stacks for linux-5.4.21 that I was working with in =
the
past.=20
Could anyone check if this happens to anyone?
I think if I add BLK_DEV_RAM and set initramfs.cpio.gz in the linux =
build,
the kernel will boot ok to the shell prompt.
Only the gdb can't show the stack levels.

My OS : ubuntu-20.04  5.13.0-35-generic

$ aarch64-none-elf-gdb --version
GNU gdb (GNU Toolchain for the A-profile Architecture 10.2-2020.11
(arm-10.16)) 10.1.90.20201028-git
Copyright (C) 2020 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later
<http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Thank you.
Chan Kim





_______________________________________________
Kernelnewbies mailing list
Kernelnewbies@kernelnewbies.org <mailto:Kernelnewbies@kernelnewbies.org> =

https://lists.kernelnewbies.org/mailman/listinfo/kernelnewbies



--=20

regards,

Mulyadi Santosa
Freelance Linux trainer and consultant

blog: the-hydra.blogspot.com <http://the-hydra.blogspot.com>=20
training: mulyaditraining.blogspot.com =
<http://mulyaditraining.blogspot.com>=20


------=_NextPart_000_0297_01D856ED.47DC56D0
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; charset=3Dutf-8"><meta =
name=3DGenerator content=3D"Microsoft Word 15 (filtered =
medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:=EA=B5=B4=EB=A6=BC;
	panose-1:2 11 6 0 0 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"=EB=A7=91=EC=9D=80 =EA=B3=A0=EB=94=95";
	panose-1:2 11 5 3 2 0 0 2 0 4;}
@font-face
	{font-family:"\@=EB=A7=91=EC=9D=80 =EA=B3=A0=EB=94=95";
	panose-1:2 11 5 3 2 0 0 2 0 4;}
@font-face
	{font-family:"\@=EA=B5=B4=EB=A6=BC";
	panose-1:2 11 6 0 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:=EA=B5=B4=EB=A6=BC;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:=EA=B5=B4=EB=A6=BC;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"=EB=A7=91=EC=9D=80 =EA=B3=A0=EB=94=95";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"=EB=A7=91=EC=9D=80 =EA=B3=A0=EB=94=95";}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:3.0cm 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DKO link=3Dblue =
vlink=3Dpurple><div class=3DWordSection1><p class=3DMsoNormal =
style=3D'word-break:break-hangul'><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"=EB=A7=91=EC=9D=80 =
=EA=B3=A0=EB=94=95"'>Hi, Mulyadi<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'word-break:break-hangul'><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"=EB=A7=91=EC=9D=80 =
=EA=B3=A0=EB=94=95"'>Thank you for replying.<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'word-break:break-hangul'><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"=EB=A7=91=EC=9D=80 =
=EA=B3=A0=EB=94=95"'>I found CONFIG_DEBUG_FRAME_POINTER, =
CONFIG_DEBUG_INFO are already set by default.<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'word-break:break-hangul'><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"=EB=A7=91=EC=9D=80 =
=EA=B3=A0=EB=94=95"'>And I tried adding CONFIG_DEBUG_KERNEL, =
CONFIG_KGDB, CONFIG_GDB_SCRIPTS, CONFIG_STACKTRACE all to no =
avail.<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'word-break:break-hangul'><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"=EB=A7=91=EC=9D=80 =
=EA=B3=A0=EB=94=95"'>Regards,<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'word-break:break-hangul'><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"=EB=A7=91=EC=9D=80 =
=EA=B3=A0=EB=94=95"'>Chan<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'word-break:break-hangul'><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"=EB=A7=91=EC=9D=80 =
=EA=B3=A0=EB=94=95"'><o:p>&nbsp;</o:p></span></p><div =
style=3D'border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt'><div><div style=3D'border:none;border-top:solid #E1E1E1 =
1.0pt;padding:3.0pt 0cm 0cm 0cm'><p class=3DMsoNormal><b><span =
lang=3DEN-US =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif'>From:</span><=
/b><span lang=3DEN-US =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif'> Mulyadi =
Santosa &lt;mulyadi.santosa@gmail.com&gt; <br><b>Sent:</b> Friday, April =
22, 2022 11:53 PM<br><b>To:</b> Chan Kim =
&lt;ckim@etri.re.kr&gt;<br><b>Cc:</b> qemu-devel =
&lt;qemu-devel@nongnu.org&gt;; kernelnewbies =
&lt;kernelnewbies@kernelnewbies.org&gt;<br><b>Subject:</b> Re: Backtrace =
stopped: previous frame identical to this frame (corrupt stack?) , even =
with fresh qemu and linux build<o:p></o:p></span></p></div></div><p =
class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><div><div><p =
class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p></div><p =
class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><div><div><p =
class=3DMsoNormal><span lang=3DEN-US>On Fri, Apr 22, 2022 at 7:30 PM =
Chan Kim &lt;<a href=3D"mailto:ckim@etri.re.kr">ckim@etri.re.kr</a>&gt; =
wrote:<o:p></o:p></span></p></div><blockquote =
style=3D'border:none;border-left:solid #CCCCCC 1.0pt;padding:0cm 0cm 0cm =
6.0pt;margin-left:4.8pt;margin-right:0cm'><p class=3DMsoNormal><span =
lang=3DEN-US>Hello all,<br><br>Really strange thing happening here.. I =
can't see the full stack trace with<br>'bt' command in gdb.<br>So I =
tried with fresh linux-5.10.122 source and qemu-6.2.0 source and =
it's<br>happening too!<br>(it's happening when I do combinations with =
linux 5.10.0 and qemu-5.1.0. But<br>it's not happening with =
linux-5.4.21)<br><br>I would be grateful if somebody could check if this =
happens to other people<br>or just me.<br><br>1. download linux-5.1.122 =
tarball from <a href=3D"https://www.kernel.org/" =
target=3D"_blank">https://www.kernel.org/</a> <br>2. uncompress it and =
set env variable ARCH=3Darm64,<br>CROSS_COMPILE=3Daarch64-none-elf- , do =
&quot;make defconfig&quot; and &quot;make -j`nproc`<br>Image&quot;<br>3. =
download qemu-6.2.0 from <a href=3D"https://www.qemu.org/" =
target=3D"_blank">https://www.qemu.org/</a><br>4. uncompress it and do =
&quot;mkdir build&quot; &quot;cd build&quot; =
&quot;../configure<br>--target-list=3Daarch64-softmmu =
--enable-debug&quot;<br>5. run qemu and wait for debugger to =
attach.<br>qemu-6.2.0/build/aarch64-softmmu/qemu-system-aarch64 =
-machine<br>virt,gic-version=3Dmax,secure=3Doff,virtualization=3Dtrue =
-cpu max -kernel<br>linux-5.10.112/arch/arm64/boot/Image -m 2G =
-nographic =
-netdev<br>user,id=3Dvnet,hostfwd=3D:127.0.0.1:0-:22,tftp=3D/srv/tftp =
-device<br>virtio-net-pci,netdev=3Dvnet -machine iommu=3Dsmmuv3 --append =
&quot;root=3D/dev/ram<br>init=3D/init nokaslr earlycon ip=3Ddhcp =
hugepages=3D16&quot; -s -S<br>6. run debugger, do =
&quot;aarch64-none-elf-gdb linux-6.10.112/vmlinux =
-x\<o:p></o:p></span></p></blockquote><div><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p></div><div><p =
class=3DMsoNormal><span lang=3DEN-US>It has been long time since I =
compiled linux kernel but I guess, either you need to compile kernel =
with enabled frame pointer, and/or you need to enable debug symbol =
embedded into final kernel image. =
cmiiw<o:p></o:p></span></p></div><div><p class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;<o:p></o:p></span></p></div><blockquote =
style=3D'border:none;border-left:solid #CCCCCC 1.0pt;padding:0cm 0cm 0cm =
6.0pt;margin-left:4.8pt;margin-right:0cm'><p class=3DMsoNormal><span =
lang=3DEN-US>gdb_script&quot;<br>(gdb_script content : <br>target remote =
:1234<br>layout src<br>b start_kernel<br>b =
__driver_attach<br>)<br><br>Now, in gdb, when you press 'c' twice, it'll =
stop at the first<br>__driver_attach. (first one stops at =
start_kernel).<br>When you are at __attach_driver, type 'bt'. See if you =
see the full function<br>stack trace.<br>This is what I see. <br>(gdb) =
bt<br>#0&nbsp; __driver_attach (dev=3D0xffff000002582810, =
data=3D0xffff800011dc2358<br>&lt;dummy_regulator_driver+40&gt;)<br>&nbsp;=
 &nbsp; at drivers/base/dd.c:1060<br>#1&nbsp; 0xffff8000107a3ed0 in =
bus_for_each_dev (bus=3D&lt;optimized out&gt;,<br>start=3D&lt;optimized =
out&gt;,<br>&nbsp; &nbsp; data=3D0xffff800011dc2358 =
&lt;dummy_regulator_driver+40&gt;,<br>fn=3D0xffff8000107a6f60 =
&lt;__driver_attach&gt;)<br>&nbsp; &nbsp; at =
drivers/base/bus.c:305<br>#2&nbsp; 0xd6d78000107a5c58 in ?? =
()<br>Backtrace stopped: previous frame identical to this frame (corrupt =
stack?)<br><br>I used to see more thatn 20 stacks trace but strangely I =
see only two. <br>I can still see many stacks for linux-5.4.21 that I =
was working with in the<br>past. <br>Could anyone check if this happens =
to anyone?<br>I think if I add BLK_DEV_RAM and set initramfs.cpio.gz in =
the linux build,<br>the kernel will boot ok to the shell prompt.<br>Only =
the gdb can't show the stack levels.<br><br>My OS : ubuntu-20.04&nbsp; =
5.13.0-35-generic<br><br>$ aarch64-none-elf-gdb --version<br>GNU gdb =
(GNU Toolchain for the A-profile Architecture =
10.2-2020.11<br>(arm-10.16)) 10.1.90.20201028-git<br>Copyright (C) 2020 =
Free Software Foundation, Inc.<br>License GPLv3+: GNU GPL version 3 or =
later<br>&lt;<a href=3D"http://gnu.org/licenses/gpl.html" =
target=3D"_blank">http://gnu.org/licenses/gpl.html</a>&gt;<br>This is =
free software: you are free to change and redistribute it.<br>There is =
NO WARRANTY, to the extent permitted by law.<br><br>Thank you.<br>Chan =
Kim<br><br><br><br><br><br>______________________________________________=
_<br>Kernelnewbies mailing list<br><a =
href=3D"mailto:Kernelnewbies@kernelnewbies.org" =
target=3D"_blank">Kernelnewbies@kernelnewbies.org</a><br><a =
href=3D"https://lists.kernelnewbies.org/mailman/listinfo/kernelnewbies" =
target=3D"_blank">https://lists.kernelnewbies.org/mailman/listinfo/kernel=
newbies</a><o:p></o:p></span></p></blockquote></div><p =
class=3DMsoNormal><span lang=3DEN-US><br clear=3Dall><br>-- =
<o:p></o:p></span></p><div><p class=3DMsoNormal><span =
lang=3DEN-US>regards,<br><br>Mulyadi Santosa<br>Freelance Linux trainer =
and consultant<br><br>blog: <a href=3D"http://the-hydra.blogspot.com" =
target=3D"_blank">the-hydra.blogspot.com</a><br>training: <a =
href=3D"http://mulyaditraining.blogspot.com" =
target=3D"_blank">mulyaditraining.blogspot.com</a><o:p></o:p></span></p><=
/div></div></div></div></body></html>
------=_NextPart_000_0297_01D856ED.47DC56D0--





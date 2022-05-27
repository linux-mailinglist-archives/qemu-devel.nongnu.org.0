Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4FB535C36
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 11:01:23 +0200 (CEST)
Received: from localhost ([::1]:35810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuVqU-0002SH-FI
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 05:01:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobyliu415@139.com>)
 id 1nuVea-00075E-Nf
 for qemu-devel@nongnu.org; Fri, 27 May 2022 04:49:09 -0400
Received: from n169-110.mail.139.com ([120.232.169.110]:36141)
 by eggs.gnu.org with smtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobyliu415@139.com>)
 id 1nuVeN-0004za-A5
 for qemu-devel@nongnu.org; Fri, 27 May 2022 04:48:59 -0400
X-RM-SPAM-FLAG: 00000000
Received: from tobyliu415@139.com ( [2408:8207:245d:fe80:25be:1f1f:ff75:194d] )
 by ajax-webmail-lg-appmail-02-11056 (Richmail) with HTTP;
 Fri, 27 May 2022 16:39:23 +0800 (CST)
Date: Fri, 27 May 2022 16:39:23 +0800 (CST)
From: =?utf-8?B?5YiY6L6J?= <tobyliu415@139.com>
To: qemu-devel <qemu-devel@nongnu.org>
Message-ID: <2b3062908bf3bc1-00040.Richmail.00025826991472841621@139.com>
Subject: HELP: I can't get whpx working on ryzen / win11
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_37989_713806396.1653640763862"
X-Priority: 3
X-RM-TRANSID: 2b3062908bf3bc1-00040
X-RM-OA-ENC-TYPE: 0
X-CLIENT-INFO: X-TIMING=0&X-MASSSENT=0&X-SENSITIVE=0
X-Mailer: Richmail_Webapp(V2.3.30)
Received-SPF: pass client-ip=120.232.169.110; envelope-from=tobyliu415@139.com;
 helo=n169-110.mail.139.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, HTML_FONT_FACE_BAD=0.001, HTML_MESSAGE=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

------=_Part_37989_713806396.1653640763862
Content-Type: text/plain;charset=UTF-8
Content-Transfer-Encoding: 7bit






CPU: AMD Ryzen 7 5800H


Windows Version: Microsoft Windows [Version 10.0.22621.1]





QEMU Versions




D:\dev\qemu-toby>D:/dev/qemu/qemu-system-x86_64.exe -version


QEMU emulator version 7.0.0 (v7.0.0-11902-g1d935f4a02-dirty)

Copyright (c) 2003-2022 Fabrice Bellard and the QEMU Project developers





D:\dev\qemu-toby>qemu-system-x86_64.exe --version


QEMU emulator version 7.0.50 (v7.0.0-1245-g58b53669e8)

Copyright (c) 2003-2022 Fabrice Bellard and the QEMU Project developers




Tried Command Line *Same error for both version*


COMMAND LINE: D:/dev/qemu-toby/qemu-system-x86_64.exe --name tQEMU --display vnc=:0 --rtc base=utc,clock=host --machine q35 --accel whpx --boot order=dc,menu=off,strict=off --cpu max --m 8G --device virtio-gpu --audiodev none,id=QEMUAudio --device intel-hda --device hda-duplex,audiodev=QEMUAudio --device virtio-net,netdev=QEMUNet --netdev user,id=QEMUNet,smb=D:/install/FPGA --blockdev driver=qcow2,node-name=QEMUDisk0,file.driver=file,file.filename=E:/VM/tqemu/myzynq.qcow2 --device virtio-blk,drive=QEMUDisk0 --cdrom E:/iso/windows7/cn_windows_7_enterprise_with_sp1_x64_dvd_u_677685.iso -drive if=pflash,format=raw,file=d:/dev/qemu/share/edk2-x86_64-code.fd -smp 4 -usb -device usb-tablet




WHPX: setting APIC emulation mode in the hypervisor

Windows Hypervisor Platform accelerator is operational

whpx: injection failed, MSI (0, 0) delivery: 0, dest_mode: 0, trigger mode: 0, vector: 0, lost (c0350005)

qemu-system-x86_64.exe: WHPX: Failed to emulate MMIO access with EmulatorReturnStatus: 2

qemu-system-x86_64.exe: WHPX: Failed to exec a virtual processor



------=_Part_37989_713806396.1653640763862
Content-Type: text/html;charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div style=3D"line-height: 1.5; font-family: =E5=BE=AE=E8=BD=AF=E9=9B=85=E9=
=BB=91; font-size: 16px; color: rgb(0, 0, 0); overflow-wrap: break-word; wo=
rd-break: break-word;"><div style=3D"line-height: 1.5;"><div style=3D"line-=
height: 1.5;"><div style=3D"line-height: 1.5;"><font face=3D"=E5=BE=AE=E8=
=BD=AF=E9=9B=85=E9=BB=91" oldel=3D"1"><div style=3D"line-height: 1.5;font-s=
ize: 16.0px;">CPU:&nbsp;AMD Ryzen 7 5800H</div></font></div><div style=3D"l=
ine-height: 1.5;"><font face=3D"=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91" oldel=
=3D"1">Windows Version: Microsoft Windows [Version 10.0.22621.1]</font><br>=
</div><div style=3D"color: rgb(0,0,0);font-family: =E5=BE=AE=E8=BD=AF=E9=9B=
=85=E9=BB=91;font-size: 16.0px;line-height: 1.5;"><br></div><div style=3D"c=
olor: rgb(0,0,0);font-family: =E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91;font-siz=
e: 16.0px;line-height: 1.5;">QEMU Versions</div><div style=3D"color: rgb(0,=
0,0);font-family: =E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91;font-size: 16.0px;li=
ne-height: 1.5;"><br></div><div style=3D"color: rgb(0,0,0);font-family: =E5=
=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91;font-size: 16.0px;line-height: 1.5;">D:\d=
ev\qemu-toby&gt;D:/dev/qemu/qemu-system-x86_64.exe -version<br></div><div s=
tyle=3D"color: rgb(0,0,0);font-family: =E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91=
;font-size: 16.0px;line-height: 1.5;">QEMU emulator version 7.0.0 (v7.0.0-1=
1902-g1d935f4a02-dirty)</div><div style=3D"color: rgb(0,0,0);font-family: =
=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91;font-size: 16.0px;line-height: 1.5;">C=
opyright (c) 2003-2022 Fabrice Bellard and the QEMU Project developers</div=
></div><div style=3D"color: rgb(0,0,0);font-family: =E5=BE=AE=E8=BD=AF=E9=
=9B=85=E9=BB=91;font-size: 16.0px;line-height: 1.5;"><br></div><div style=
=3D"color: rgb(0,0,0);font-family: =E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91;fon=
t-size: 16.0px;line-height: 1.5;">D:\dev\qemu-toby&gt;qemu-system-x86_64.ex=
e --version<br></div><div style=3D"color: rgb(0,0,0);font-family: =E5=BE=AE=
=E8=BD=AF=E9=9B=85=E9=BB=91;font-size: 16.0px;line-height: 1.5;">QEMU emula=
tor version 7.0.50 (v7.0.0-1245-g58b53669e8)</div><div style=3D"color: rgb(=
0,0,0);font-family: =E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91;font-size: 16.0px;=
line-height: 1.5;">Copyright (c) 2003-2022 Fabrice Bellard and the QEMU Pro=
ject developers</div><div style=3D"color: rgb(0,0,0);font-family: =E5=BE=AE=
=E8=BD=AF=E9=9B=85=E9=BB=91;font-size: 16.0px;line-height: 1.5;"><br></div>=
<div style=3D"color: rgb(0,0,0);font-family: =E5=BE=AE=E8=BD=AF=E9=9B=85=E9=
=BB=91;font-size: 16.0px;line-height: 1.5;">Tried Command Line *Same error =
for both version*</div></div><div style=3D"color: rgb(0,0,0);font-family: =
=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91;font-size: 16.0px;line-height: 1.5;">C=
OMMAND LINE: D:/dev/qemu-toby/qemu-system-x86_64.exe --name tQEMU --display=
 vnc=3D:0 --rtc base=3Dutc,clock=3Dhost --machine q35 --accel whpx --boot o=
rder=3Ddc,menu=3Doff,strict=3Doff --cpu max --m 8G --device virtio-gpu --au=
diodev none,id=3DQEMUAudio --device intel-hda --device hda-duplex,audiodev=
=3DQEMUAudio --device virtio-net,netdev=3DQEMUNet --netdev user,id=3DQEMUNe=
t,smb=3DD:/install/FPGA --blockdev driver=3Dqcow2,node-name=3DQEMUDisk0,fil=
e.driver=3Dfile,file.filename=3DE:/VM/tqemu/myzynq.qcow2 --device virtio-bl=
k,drive=3DQEMUDisk0 --cdrom E:/iso/windows7/cn_windows_7_enterprise_with_sp=
1_x64_dvd_u_677685.iso -drive if=3Dpflash,format=3Draw,file=3Dd:/dev/qemu/s=
hare/edk2-x86_64-code.fd -smp 4 -usb -device usb-tablet</div><div style=3D"=
color: rgb(0,0,0);font-family: =E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91;font-si=
ze: 16.0px;line-height: 1.5;"><br></div><div style=3D"color: rgb(0,0,0);fon=
t-family: =E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91;font-size: 16.0px;line-heigh=
t: 1.5;">WHPX: setting APIC emulation mode in the hypervisor</div><div styl=
e=3D"color: rgb(0,0,0);font-family: =E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91;fo=
nt-size: 16.0px;line-height: 1.5;">Windows Hypervisor Platform accelerator =
is operational</div><div style=3D"color: rgb(0,0,0);font-family: =E5=BE=AE=
=E8=BD=AF=E9=9B=85=E9=BB=91;font-size: 16.0px;line-height: 1.5;">whpx: inje=
ction failed, MSI (0, 0) delivery: 0, dest_mode: 0, trigger mode: 0, vector=
: 0, lost (c0350005)</div><div style=3D"color: rgb(0,0,0);font-family: =E5=
=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91;font-size: 16.0px;line-height: 1.5;">qemu=
-system-x86_64.exe: WHPX: Failed to emulate MMIO access with EmulatorReturn=
Status: 2</div><div style=3D"color: rgb(0,0,0);font-family: =E5=BE=AE=E8=BD=
=AF=E9=9B=85=E9=BB=91;font-size: 16.0px;line-height: 1.5;">qemu-system-x86_=
64.exe: WHPX: Failed to exec a virtual processor</div><br></div>
------=_Part_37989_713806396.1653640763862--



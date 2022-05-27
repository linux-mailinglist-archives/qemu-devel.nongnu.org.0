Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EFD53580A
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 05:26:16 +0200 (CEST)
Received: from localhost ([::1]:34654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuQcB-0007X2-Gf
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 23:26:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <13910382464@139.com>)
 id 1nuP6b-0004Rk-V4
 for qemu-devel@nongnu.org; Thu, 26 May 2022 21:49:33 -0400
Received: from n169-110.mail.139.com ([120.232.169.110]:23529)
 by eggs.gnu.org with smtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <13910382464@139.com>)
 id 1nuP6Y-0005xB-KI
 for qemu-devel@nongnu.org; Thu, 26 May 2022 21:49:33 -0400
X-RM-SPAM-FLAG: 00000000
Received: from 13910382464@139.com ( [2408:8207:245d:fe80:25be:1f1f:ff75:194d]
 ) by ajax-webmail-lg-appmail-01-11055 (Richmail) with HTTP;
 Fri, 27 May 2022 09:40:10 +0800 (CST)
Date: Fri, 27 May 2022 09:40:10 +0800 (CST)
From: =?utf-8?B?5YiY6L6J?= <13910382464@139.com>
To: qemu-devel <qemu-devel@nongnu.org>
Message-ID: <2b2f6290291d2ec-0001b.Richmail.00025886494432542631@139.com>
Subject: HELP: I can't get whpx working on ryzen / win11
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_6944_1465461576.1653615610897"
X-Priority: 3
X-RM-TRANSID: 2b2f6290291d2ec-0001b
X-RM-OA-ENC-TYPE: 0
X-CLIENT-INFO: X-TIMING=0&X-MASSSENT=0&X-SENSITIVE=0
X-Mailer: Richmail_Webapp(V2.3.30)
Received-SPF: pass client-ip=120.232.169.110; envelope-from=13910382464@139.com;
 helo=n169-110.mail.139.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, FROM_LOCAL_DIGITS=0.001, FROM_LOCAL_HEX=0.006,
 HTML_FONT_FACE_BAD=0.001, HTML_MESSAGE=0.001, NUMERIC_HTTP_ADDR=1.242,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 26 May 2022 23:24:43 -0400
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

------=_Part_6944_1465461576.1653615610897
Content-Type: text/plain;charset=UTF-8
Content-Transfer-Encoding: quoted-printable






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


COMMAND LINE: D:/dev/qemu-toby/qemu-system-x86_64.exe --name tQEMU --displa=
y vnc=3D:0 --rtc base=3Dutc,clock=3Dhost --machine q35 --accel whpx --boot =
order=3Ddc,menu=3Doff,strict=3Doff --cpu max --m 8G --device virtio-gpu --a=
udiodev none,id=3DQEMUAudio --device intel-hda --device hda-duplex,audiodev=
=3DQEMUAudio --device virtio-net,netdev=3DQEMUNet --netdev user,id=3DQEMUNe=
t,smb=3DD:/install/FPGA --blockdev driver=3Dqcow2,node-name=3DQEMUDisk0,fil=
e.driver=3Dfile,file.filename=3DE:/VM/tqemu/myzynq.qcow2 --device virtio-bl=
k,drive=3DQEMUDisk0 --cdrom E:/iso/windows7/cn_windows_7_enterprise_with_sp=
1_x64_dvd_u_677685.iso -drive if=3Dpflash,format=3Draw,file=3Dd:/dev/qemu/s=
hare/edk2-x86_64-code.fd -smp 4 -usb -device usb-tablet




WHPX: setting APIC emulation mode in the hypervisor

Windows Hypervisor Platform accelerator is operational

whpx: injection failed, MSI (0, 0) delivery: 0, dest_mode: 0, trigger mode:=
 0, vector: 0, lost (c0350005)

qemu-system-x86_64.exe: WHPX: Failed to emulate MMIO access with EmulatorRe=
turnStatus: 2

qemu-system-x86_64.exe: WHPX: Failed to exec a virtual processor












=E5=88=98=E8=BE=89


13910382464@139.com







=E7=94=B5=E5=AD=90=E5=90=8D=E7=89=87=E6=96=B0=E5=87=BAVIP=E6=A8=A1=E6=9D=BF=
=E5=95=A6=EF=BC=8C=E5=BF=AB=E6=9D=A5=E4=BD=93=E9=AA=8C>>




=E6=89=AB=E4=B8=80=E6=89=AB,


=E5=BF=AB=E9=80=9F=E6=B7=BB=E5=8A=A0=E5=90=8D=E7=89=87=E5=88=B0=E6=89=8B=E6=
=9C=BA




------=_Part_6944_1465461576.1653615610897
Content-Type: text/html;charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div style=3D"line-height: 1.5; overflow-wrap: break-word; word-break: brea=
k-word;"><div style=3D"line-height: 1.5; overflow-wrap: break-word; word-br=
eak: break-word;"><div style=3D"line-height: 1.5; overflow-wrap: break-word=
; word-break: break-word;"><div style=3D"line-height: 1.5; overflow-wrap: b=
reak-word; word-break: break-word;"><font face=3D"=E5=BE=AE=E8=BD=AF=E9=9B=
=85=E9=BB=91" oldel=3D"1"><div style=3D"line-height: 1.5; font-size: 16px; =
overflow-wrap: break-word; word-break: break-word;">CPU:&nbsp;AMD Ryzen 7 5=
800H</div></font></div><div style=3D"line-height: 1.5; overflow-wrap: break=
-word; word-break: break-word;"><font face=3D"=E5=BE=AE=E8=BD=AF=E9=9B=85=
=E9=BB=91" oldel=3D"1">Windows Version: Microsoft Windows [Version 10.0.226=
21.1]</font><br></div><div style=3D"color: rgb(0, 0, 0); font-family: =E5=
=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91; font-size: 16px; line-height: 1.5; overf=
low-wrap: break-word; word-break: break-word;"><br></div><div style=3D"colo=
r: rgb(0, 0, 0); font-family: =E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91; font-si=
ze: 16px; line-height: 1.5; overflow-wrap: break-word; word-break: break-wo=
rd;">QEMU Versions</div><div style=3D"color: rgb(0, 0, 0); font-family: =E5=
=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91; font-size: 16px; line-height: 1.5; overf=
low-wrap: break-word; word-break: break-word;"><br></div><div style=3D"colo=
r: rgb(0, 0, 0); font-family: =E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91; font-si=
ze: 16px; line-height: 1.5; overflow-wrap: break-word; word-break: break-wo=
rd;">D:\dev\qemu-toby&gt;D:/dev/qemu/qemu-system-x86_64.exe -version<br></d=
iv><div style=3D"color: rgb(0, 0, 0); font-family: =E5=BE=AE=E8=BD=AF=E9=9B=
=85=E9=BB=91; font-size: 16px; line-height: 1.5; overflow-wrap: break-word;=
 word-break: break-word;">QEMU emulator version 7.0.0 (v7.0.0-11902-g1d935f=
4a02-dirty)</div><div style=3D"color: rgb(0, 0, 0); font-family: =E5=BE=AE=
=E8=BD=AF=E9=9B=85=E9=BB=91; font-size: 16px; line-height: 1.5; overflow-wr=
ap: break-word; word-break: break-word;">Copyright (c) 2003-2022 Fabrice Be=
llard and the QEMU Project developers</div></div><div style=3D"color: rgb(0=
, 0, 0); font-family: =E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91; font-size: 16px=
; line-height: 1.5; overflow-wrap: break-word; word-break: break-word;"><br=
></div><div style=3D"color: rgb(0, 0, 0); font-family: =E5=BE=AE=E8=BD=AF=
=E9=9B=85=E9=BB=91; font-size: 16px; line-height: 1.5; overflow-wrap: break=
-word; word-break: break-word;">D:\dev\qemu-toby&gt;qemu-system-x86_64.exe =
--version<br></div><div style=3D"color: rgb(0, 0, 0); font-family: =E5=BE=
=AE=E8=BD=AF=E9=9B=85=E9=BB=91; font-size: 16px; line-height: 1.5; overflow=
-wrap: break-word; word-break: break-word;">QEMU emulator version 7.0.50 (v=
7.0.0-1245-g58b53669e8)</div><div style=3D"color: rgb(0, 0, 0); font-family=
: =E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91; font-size: 16px; line-height: 1.5; =
overflow-wrap: break-word; word-break: break-word;">Copyright (c) 2003-2022=
 Fabrice Bellard and the QEMU Project developers</div><div style=3D"color: =
rgb(0, 0, 0); font-family: =E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91; font-size:=
 16px; line-height: 1.5; overflow-wrap: break-word; word-break: break-word;=
"><br></div><div style=3D"color: rgb(0, 0, 0); font-family: =E5=BE=AE=E8=BD=
=AF=E9=9B=85=E9=BB=91; font-size: 16px; line-height: 1.5; overflow-wrap: br=
eak-word; word-break: break-word;">Tried Command Line *Same error for both =
version*</div></div><div style=3D"color: rgb(0, 0, 0); font-family: =E5=BE=
=AE=E8=BD=AF=E9=9B=85=E9=BB=91; font-size: 16px; line-height: 1.5; overflow=
-wrap: break-word; word-break: break-word;">COMMAND LINE: D:/dev/qemu-toby/=
qemu-system-x86_64.exe --name tQEMU --display vnc=3D:0 --rtc base=3Dutc,clo=
ck=3Dhost --machine q35 --accel whpx --boot order=3Ddc,menu=3Doff,strict=3D=
off --cpu max --m 8G --device virtio-gpu --audiodev none,id=3DQEMUAudio --d=
evice intel-hda --device hda-duplex,audiodev=3DQEMUAudio --device virtio-ne=
t,netdev=3DQEMUNet --netdev user,id=3DQEMUNet,smb=3DD:/install/FPGA --block=
dev driver=3Dqcow2,node-name=3DQEMUDisk0,file.driver=3Dfile,file.filename=
=3DE:/VM/tqemu/myzynq.qcow2 --device virtio-blk,drive=3DQEMUDisk0 --cdrom E=
:/iso/windows7/cn_windows_7_enterprise_with_sp1_x64_dvd_u_677685.iso -drive=
 if=3Dpflash,format=3Draw,file=3Dd:/dev/qemu/share/edk2-x86_64-code.fd -smp=
 4 -usb -device usb-tablet</div><div style=3D"color: rgb(0, 0, 0); font-fam=
ily: =E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91; font-size: 16px; line-height: 1.=
5; overflow-wrap: break-word; word-break: break-word;"><br></div><div style=
=3D"color: rgb(0, 0, 0); font-family: =E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91;=
 font-size: 16px; line-height: 1.5; overflow-wrap: break-word; word-break: =
break-word;">WHPX: setting APIC emulation mode in the hypervisor</div><div =
style=3D"color: rgb(0, 0, 0); font-family: =E5=BE=AE=E8=BD=AF=E9=9B=85=E9=
=BB=91; font-size: 16px; line-height: 1.5; overflow-wrap: break-word; word-=
break: break-word;">Windows Hypervisor Platform accelerator is operational<=
/div><div style=3D"color: rgb(0, 0, 0); font-family: =E5=BE=AE=E8=BD=AF=E9=
=9B=85=E9=BB=91; font-size: 16px; line-height: 1.5; overflow-wrap: break-wo=
rd; word-break: break-word;">whpx: injection failed, MSI (0, 0) delivery: 0=
, dest_mode: 0, trigger mode: 0, vector: 0, lost (c0350005)</div><div style=
=3D"color: rgb(0, 0, 0); font-family: =E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91;=
 font-size: 16px; line-height: 1.5; overflow-wrap: break-word; word-break: =
break-word;">qemu-system-x86_64.exe: WHPX: Failed to emulate MMIO access wi=
th EmulatorReturnStatus: 2</div><div style=3D"color: rgb(0, 0, 0); font-fam=
ily: =E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91; font-size: 16px; line-height: 1.=
5; overflow-wrap: break-word; word-break: break-word;">qemu-system-x86_64.e=
xe: WHPX: Failed to exec a virtual processor</div><br><br><br><br></div><di=
v id=3D"signContainer"><table id=3D"signTable" style=3D"width: 100%; white-=
space: initial;"><tbody><tr><td id=3D"dzmp_table" style=3D"width:480px;font=
-family:'Microsoft Yahei',verdana,'Simun';"><div id=3D"signBgContainer" sty=
le=3D"background:#fafafa no-repeat;position:relative;height:168px;width:480=
px;max-width:480px;clear:both;"><div style=3D"position:relative;width:480px=
;max-width: 480px;"><div style=3D"padding:18px 10px 0 10px;float:left"><img=
 name=3D"hideEditorBar" class=3D"avatar-ry avatar-image" src=3D"../../image=
s/global/face.png" style=3D"border-radius:50%;width:80px;height:80px;" oner=
ror=3D"this.onerror=3Dnull;this.src=3D'../../images/global/face.png';" data=
-mark=3D"empty" id=3D"img_0.06074379195280133"></div><div class=3D"addrClas=
s" style=3D"float: left;color:#666;font-size: 12px;width:320px;"><p style=
=3D"text-align:left;margin: 0;padding: 0;line-height:18px;padding-top: 18px=
;padding-bottom: 5px;width:365px;font-family: 'Microsoft Yahei',verdana,'Si=
mun';"><span style=3D"font-size: 16px;padding-right: 23px;display: inline-b=
lock;line-height: 18px;">=E5=88=98=E8=BE=89</span><span style=3D"font-size:=
 12px;"></span></p><p class=3D"otherInfo" style=3D"text-align:left;margin: =
1px;padding: 0;line-height:22px;width:365px;overflow:hidden;"><i style=3D"b=
ackground:url(https://appmail.mail.10086.cn/m2015/images/imgsrc/vcard.png) =
no-repeat 0 0;background-position: -30px 0;display:inline-block;float:left;=
margin-right: 11px;width:15px;height:18px;"></i><span style=3D"font-size:12=
px;margin: 0;padding: 0;line-height:18px;width:91%;display: block;float:lef=
t;font-family: 'Microsoft Yahei',verdana,'Simun';">13910382464@139.com<i cl=
ass=3D""></i></span></p></div><div style=3D"clear:both"></div></div></div><=
div contenteditable=3D"false" class=3D"v-hidden" style=3D"margin:0;padding:=
 0;height:24px;line-height: 24px;" id=3D"openSign"><a href=3D"javascript:;"=
 style=3D"display: none; float: right; font-size: 12px; color: rgb(26, 138,=
 216); text-decoration: none; cursor: pointer;"><span style=3D"color: #666;=
">=E7=94=B5=E5=AD=90=E5=90=8D=E7=89=87=E6=96=B0=E5=87=BAVIP=E6=A8=A1=E6=9D=
=BF=E5=95=A6=EF=BC=8C</span>=E5=BF=AB=E6=9D=A5=E4=BD=93=E9=AA=8C&gt;&gt;</a=
></div></td><td id=3D"signInfoCode" style=3D"width:auto;display:block;paddi=
ng:0px 8px 8px 8px;vertical-align: top;"><div style=3D"vertical-align:top;"=
><img rel=3D"signImg_qcode" name=3D"hideEditorBar" src=3D"https://smsrebuil=
d1.mail.10086.cn/addr_p3_gw/qrcode/ContactsServlet?type=3D3&amp;name2=3DJUU=
1JTg4JTk4JUU4JUJFJTg5&amp;email2=3DMTM5MTAzODI0NjQlNDAxMzkuY29t" alt=3D"=E6=
=89=AB=E6=8F=8F=E4=BA=8C=E7=BB=B4=E7=A0=81=E6=B7=BB=E5=8A=A0=E5=90=8D=E7=89=
=87=E5=88=B0=E6=89=8B=E6=9C=BA" data-mark=3D"empty" id=3D"img_0.09077799284=
119936"></div><div style=3D"margin-top:5px;margin-bottom:5px;"><p style=3D"=
width:146px;font-size:12px;color:#444;text-align:center;line-height: 1.4;ma=
rgin:0;">=E6=89=AB=E4=B8=80=E6=89=AB,</p><p style=3D"width:146px;font-size:=
12px;color:#444;text-align:center;line-height: 1.4;margin:0;">=E5=BF=AB=E9=
=80=9F=E6=B7=BB=E5=8A=A0=E5=90=8D=E7=89=87=E5=88=B0=E6=89=8B=E6=9C=BA</p></=
div></td></tr></tbody></table><style contenteditable=3D"false">#signContain=
er{word-wrap:break-word;word-break:break-all;}#signContainer p{margin:0;}</=
style></div>
------=_Part_6944_1465461576.1653615610897--



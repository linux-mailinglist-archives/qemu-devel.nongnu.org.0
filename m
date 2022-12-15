Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B86C64D76F
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 08:51:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5j0a-0001KD-Ix; Thu, 15 Dec 2022 02:50:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=0348763855=andschlick@freenet.de>)
 id 1p5in5-0004bt-3C
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 02:36:27 -0500
Received: from mout0.freenet.de ([2001:748:100:40::2:2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=0348763855=andschlick@freenet.de>)
 id 1p5in2-000252-Tm
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 02:36:26 -0500
Received: from [195.4.92.119] (helo=sub0.freenet.de)
 by mout0.freenet.de with esmtpa (ID andschlick@freenet.de) (port 25) (Exim
 4.94.2 #2) id 1p5imu-005k6N-O1
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 08:36:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=freenet.de; 
 s=mjaymdexmjqk;
 h=To:Reply-To:From:Subject:Content-Type:Message-Id:Date:
 MIME-Version:Sender:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7sipDtQ22h+qD58c7gTDMMjnlftoktECz5jAX8Krijo=; b=LcAeurOdk5I9eJbq/lWuYeAhd4
 2gKPXnReB2HXhpCgQkScDYx/eJVdqwJA4yijLYznWP5gGsRHnLzBuCb3z6vqcu8rJLprqJa3sYE65
 oDQYK9D6z9AoGDTyoid66A9rZ3Vv+0GbZn+Kj5Z/sCdFPEYmJXkaGnivhX0kZT78azMdFOlKklqln
 d6brYcgxNabhFmxrTcsB3lihKUpCiQQx5BUoStriSh4S8TiEXQYbj9jmegIgGI7bWkEmf2gcpV3tO
 J+UeSCakiKiJuqQyzWq+YJggyPWOwiDMXNj+iL7Wt78vK9jIghpr0U7hhmjD57Fu/LaPnJSVjtNlD
 IgLxUD9A==;
Received: from api07.emo.freenet-rz.de ([194.97.107.172]:46340 helo=api07)
 by sub0.freenet.de with esmtpsa (ID andschlick@freenet.de)
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (port 465) (Exim
 4.94.2 #2) id 1p5imu-000yCE-Er
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 08:36:16 +0100
X-Originated-At: 77.9.32.145!1234
User-Agent: freenet-api2
MIME-Version: 1.0
Date: Thu, 15 Dec 2022 07:36:15 GMT
Message-Id: <1dd17997fa2a5dbb455cb4bcb7436d0d@api.mail.freenet.de>
Content-Type: multipart/alternative;
 boundary="------------060209040704030102010600"
X-Priority: 3
Subject: qemu no sound
From: andschlick@freenet.de
To: qemu-devel@nongnu.org
X-FN-MUUID: 1671089776D858171F8C26O
X-Scan-TS: Thu, 15 Dec 2022 08:36:16 +0100
Received-SPF: pass client-ip=2001:748:100:40::2:2;
 envelope-from=prvs=0348763855=andschlick@freenet.de; helo=mout0.freenet.de
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 15 Dec 2022 02:50:16 -0500
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
Reply-To: andschlick@freenet.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--------------060209040704030102010600
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=utf-8; format=flowed

=0A                        =0A                            .fr-emoticon.fr-e=
moticon-img {=0A                                background-repeat: no-repea=
t !important;=0A                                font-size: inherit;=0A     =
                           height: 1em;=0A                                w=
idth: 1em;=0A                                min-height: 20px;=0A          =
                      min-width: 20px;=0A                                di=
splay: inline-block;=0A                                margin: -0.1em 0.1em=
 0.1em;=0A                                line-height: 1;=0A               =
                 vertical-align: middle;=0A                            }=0A=
                            .fr-emoticon {=0A                              =
  font-weight: normal;=0A                                font-family: "Appl=
e Color Emoji","Segoe UI Emoji","NotoColorEmoji","Segoe UI Symbol","Android=
 Emoji","EmojiSymbols";=0A                                display: inline;=
=0A                                line-height: 0;=0A                      =
      }=0A                        =0AHello dear Qemu community,=0AI install=
ed qemu under Windows 11 home and downloaded the following file. kali-linux=
-2022.4-qemu-amd64.qcow2 and started it with the following command. unfortu=
nately without sound what kind of command do I have to add for sound suppor=
t.=0A C:\Users\andsc\Desktop\qemu\qemu-system-x86_64.exe -accel whpx -smp 4=
 -hda net nic,model=3Dvirtio -net user --vga qxl -boot strict=3Don -usbdevi=
ce tablet Thank you for your support =0AQemu starts Kali Linux quite well a=
nd Kali runs smoothly but I have no sound support. Already had me on the ma=
iling list:=0Aqemu-discuss@nongnu.org asked the question but got no more an=
swers. What is the command to get sound support? =0AGreetings =0AAndreas Sc=
hlick  =0A=0A=0A=0A
--------------060209040704030102010600
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

=0A                        <style>=0A                            .fr-emotic=
on.fr-emoticon-img {=0A                                background-repeat: n=
o-repeat !important;=0A                                font-size: inherit;=
=0A                                height: 1em;=0A                         =
       width: 1em;=0A                                min-height: 20px;=0A  =
                              min-width: 20px;=0A                          =
      display: inline-block;=0A                                margin: -0.1=
em 0.1em 0.1em;=0A                                line-height: 1;=0A       =
                         vertical-align: middle;=0A                        =
    }=0A                            .fr-emoticon {=0A                      =
          font-weight: normal;=0A                                font-famil=
y: "Apple Color Emoji","Segoe UI Emoji","NotoColorEmoji","Segoe UI Symbol",=
"Android Emoji","EmojiSymbols";=0A                                display: =
inline;=0A                                line-height: 0;=0A               =
             }=0A                        </style><div><br></div><div id=3D"=
isPasted"><span lang=3D"en" style=3D"font-family: Arial, Helvetica, sans-se=
rif;">Hello dear Qemu community,</span></div><div><br></div><div><span lang=
=3D"en" style=3D"font-family: Arial, Helvetica, sans-serif;">I installed qe=
mu under Windows 11 home and downloaded the following file. kali-linux-2022=
=2E4-qemu-amd64.qcow2 and started it with the following command. unfortunat=
ely without sound what kind of command do I have to add for sound support.<=
/span></div><div><br></div><div><span lang=3D"en" style=3D"font-family: Ari=
al, Helvetica, sans-serif;">&nbsp;C:\Users\andsc\Desktop\qemu\qemu-system-x=
86_64.exe -accel whpx -smp 4 -hda net nic,model=3Dvirtio -net user --vga qx=
l -boot strict=3Don -usbdevice tablet Thank you for your support&nbsp;</spa=
n></div><div><br></div><div><span lang=3D"en" style=3D"font-family: Arial, =
Helvetica, sans-serif;"><span id=3D"isPasted" lang=3D"en">Qemu starts Kali =
Linux quite well and Kali runs smoothly but I have no sound support. Alread=
y had me on the mailing list:=0Aqemu-discuss@nongnu.org asked the question =
but got no more answers. What is the command to get sound support?</span>&n=
bsp;</span></div><div><br></div><div><span lang=3D"en" style=3D"font-family=
: Arial, Helvetica, sans-serif;">Greetings&nbsp;</span></div><div><br></div=
><div><span lang=3D"en" style=3D"font-family: Arial, Helvetica, sans-serif;=
">Andreas Schlick</span><span style=3D"font-family: Arial, Helvetica, sans-=
serif;">&nbsp;</span></div> <br><br>=0A=0A
--------------060209040704030102010600--



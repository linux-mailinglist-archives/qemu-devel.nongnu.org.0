Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DCE434B86
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 14:46:40 +0200 (CEST)
Received: from localhost ([::1]:60582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdAzN-00019l-Jn
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 08:46:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shekharbarca10@gmail.com>)
 id 1mdAP4-0004YK-OS
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 08:09:06 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:43927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shekharbarca10@gmail.com>)
 id 1mdAP2-0006Cb-N5
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 08:09:06 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id r184so11762654ybc.10
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 05:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=mSyBoHGd3oQVRPfyH59+mRkZtHxQ7lOK8EkfHA+vZXk=;
 b=cqxrko5BGcqqTwgJCeEfL8YYvwG9Q4eIOOth9uxCG21tcKb4KhJGBxrKG7Gr8nU1Xe
 FPWtTHaD438M/W7ICET0w5gQVZLcJKzIMSP5HBwCAwPDdlHRvbUDOpw69vhbx6bqlo1Y
 5HGwZjCWqWzX+aE7/6KvODmpGOY0gwG/CYafUmKODwPzlzqp+BySKSIrMeOrOHTmenSM
 BAf8Q03vowe8p5HyBb2GpkiNLNASQRuBISYagyUrCnzgIWODDaIgQ8rudDEVPT3lpy1a
 2xwhUrzSVmF274Ub4HIMUAtmSN5gJc+2fJJF+3GuhOWjnUybDv70XGRgMZ+A8scrj2Wr
 50BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=mSyBoHGd3oQVRPfyH59+mRkZtHxQ7lOK8EkfHA+vZXk=;
 b=Isq4Kn/atFCUuG9hSnAqE/wCMAU9eL3IMqz6aaz5yLMh5k3clnrVeMwRKLkhx+jypq
 XETzyygJv0qaoC7gn11h64uoxQDvfIUH2XzXd1Qlq0u2xa9+CU4N6w9OTNTbwpt+3rjb
 eSUhAUmDHswl5rdaWVzhiXv6q6ZibdK6qb+d2l/TUYOwY2d1uHuIVNRIJNxpjZMnkEJY
 u5mJYCakQd2WbtuIJxMbBA3PRsHjawc7huZczLAu+z3KOl53Lktt5mVE9CNiUUR4YK1/
 bOJNzUkjE/lEazI0/CTYdjC/fUJu9dFe+1bxtBYWAs0VQBtbjIi6UHAjr4NS3Dmq1Y3j
 FHQQ==
X-Gm-Message-State: AOAM5331pSS/bYomGl1/7vz5j4Un7T7kLJdZT9sizPKnfGsfKRHvwwhU
 ShCrZW5jvpUXBm4k3ppYblFWjczogpuzLL624/nykIKG0BcHjA==
X-Google-Smtp-Source: ABdhPJw1max4MBv5inBx5CS5GBF7kZkirZmGC0LFjkUQAKFrh4Tv9NjULziyANTfM25E0bxP+anmVbhx0BF2wnldOpY=
X-Received: by 2002:a25:6884:: with SMTP id
 d126mr41029762ybc.533.1634731735801; 
 Wed, 20 Oct 2021 05:08:55 -0700 (PDT)
MIME-Version: 1.0
From: "Chauhan, Shekhar" <shekharbarca10@gmail.com>
Date: Wed, 20 Oct 2021 17:38:44 +0530
Message-ID: <CAGJgCTxEZGaYrfRXJueR6yn0c1sp-=Pdd8biSWY+nJVHWcdzCg@mail.gmail.com>
Subject: Query on Internal Working of QEMU
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000006a601105cec7a45a"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=shekharbarca10@gmail.com; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 20 Oct 2021 08:43:39 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006a601105cec7a45a
Content-Type: text/plain; charset="UTF-8"

Hello,



I am working on running an android image through Qemu. But whenever I
restart the image, qemu displays a blank screen.

Can you tell me which area of the code to look into for this.

The image works fine if I run it at the first time but when I do a adb
reboot, a blank screen comes up.

For example, the drm-plane is not getting any property values for alpha,
rotation etc.

Can you tell me where to start looking into the code of qemu, where the
reboot function is invoked ? Or some suggestion for my android source code ?





Thanks,

Shekhar

--0000000000006a601105cec7a45a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:&quot;courier new&quot;,monospace;font-size:large;color:rgb(0,0,0)=
"><p class=3D"MsoNormal" style=3D"color:rgb(211,207,201);font-family:Arial,=
Helvetica,sans-serif;font-size:small">Hello,<u></u><u></u></p><p class=3D"M=
soNormal" style=3D"color:rgb(211,207,201);font-family:Arial,Helvetica,sans-=
serif;font-size:small"><u></u>=C2=A0<u></u></p><p class=3D"MsoNormal" style=
=3D"color:rgb(211,207,201);font-family:Arial,Helvetica,sans-serif;font-size=
:small">I am working on running an android image through Qemu. But whenever=
 I restart the image, qemu displays a blank screen.<u></u><u></u></p><p cla=
ss=3D"MsoNormal" style=3D"color:rgb(211,207,201);font-family:Arial,Helvetic=
a,sans-serif;font-size:small">Can you tell me which area of the code to loo=
k into for this.<u></u><u></u></p><p class=3D"MsoNormal" style=3D"color:rgb=
(211,207,201);font-family:Arial,Helvetica,sans-serif;font-size:small">The i=
mage works fine if I run it at the first time but when I do a adb reboot, a=
 blank screen comes up.<u></u><u></u></p><p class=3D"MsoNormal" style=3D"co=
lor:rgb(211,207,201);font-family:Arial,Helvetica,sans-serif;font-size:small=
">For example, the drm-plane is not getting any property values for alpha, =
rotation etc.<u></u><u></u></p><p class=3D"MsoNormal" style=3D"color:rgb(21=
1,207,201);font-family:Arial,Helvetica,sans-serif;font-size:small">Can you =
tell me where to start looking into the code of qemu, where the reboot func=
tion is invoked ? Or some suggestion for my android source code ?<u></u><u>=
</u></p><p class=3D"MsoNormal" style=3D"color:rgb(211,207,201);font-family:=
Arial,Helvetica,sans-serif;font-size:small"><u></u>=C2=A0<u></u></p><p clas=
s=3D"MsoNormal" style=3D"color:rgb(211,207,201);font-family:Arial,Helvetica=
,sans-serif;font-size:small"><u></u>=C2=A0<u></u></p><p class=3D"MsoNormal"=
 style=3D"color:rgb(211,207,201);font-family:Arial,Helvetica,sans-serif;fon=
t-size:small">Thanks,<u></u><u></u></p><p class=3D"MsoNormal" style=3D"colo=
r:rgb(211,207,201);font-family:Arial,Helvetica,sans-serif;font-size:small">=
Shekhar</p></div></div></div>

--0000000000006a601105cec7a45a--


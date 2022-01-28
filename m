Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F82C49FD19
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 16:49:32 +0100 (CET)
Received: from localhost ([::1]:55912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDTVD-0002IF-5F
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 10:49:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1nDSm5-0000DC-Ey
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:02:55 -0500
Received: from [2607:f8b0:4864:20::429] (port=42639
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1nDSm3-00022c-Ep
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:02:53 -0500
Received: by mail-pf1-x429.google.com with SMTP id i65so6345468pfc.9
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 07:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6gjTriXOOFGWXTHXvPMTlwiDAUzFU/5fpu+57TH8PUM=;
 b=JviHhqiC6uDpJXUvwfteuC4qx0ddR18QVxlQlhI02F6LnaUiLIwq1oi+XzI9hq9FXO
 L29ohB7j5nu9D95Vo5Ww6+dc/s1V7Ue/O8ZsSBuf+kv4oRWJYQjRUfdI6KH/Hq2DUWUc
 Wk8FY5J9zQ2GbCDxEMxO8BKxEA6nfH4a1FLWYFVn5pG55y+VFmmsscd7evWhzY2n5bka
 lxKDsYdCiNK8VsyAP7Eduwipcjf9Br5X1M2f/GYt6+VShZv6fIGrBbEBDasHOWCypXlQ
 hihWLQaSFTpAN5iABV7DdMkC8m80t4F1n3foMZH7fz3ypD4WBdn5+oVhEeuQ6VnmVNgD
 HkGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6gjTriXOOFGWXTHXvPMTlwiDAUzFU/5fpu+57TH8PUM=;
 b=deUhIp6PmD08xCWII0ED0UnUayTsQFquGweBQ3aFRH2vhaUruq2MU+aYRHrEIgEo2c
 Gx9PqXzCN6koE5PT0+0cksMkdfgQOxCnVEN1XtFVK1ii+g2NYbn3SUJBd2U/AJnOD8Z4
 WgmKfe3/k03PmYm1v1c2gxjah2hM3MrWBFi7O6oL2gJrjhwdKWcHIZDOxY+q9pfgBy5l
 sWM9IFXpYyKp59e5C2DPuyoKqiCoSmhyBgKRzb9R9Yfp0If8/HZlEam1A6oYvplx8fAV
 ttK3ZWKJ1k+531LyX4SCxV0uJoV6NuHmbNItc+1h/u4X/3be+sBsj3nYv18p8IZOhH+m
 V97Q==
X-Gm-Message-State: AOAM531YKOCBEXNEd09WdPCxutYpB7xz5pye4HXoOsks/DQmbeESHA4a
 WWand/383a2ESNB57I3162zLVgaUZT0gpI+3tos=
X-Google-Smtp-Source: ABdhPJxAUtQsBNZcR/HLmWmUtCsdo3TplJgKiq2CvasgQE5BxgSHB/yD9/XWT99Kxt6if6reMksnmIgx03ffJgy0/aE=
X-Received: by 2002:a63:ea0b:: with SMTP id c11mr6788150pgi.495.1643382169939; 
 Fri, 28 Jan 2022 07:02:49 -0800 (PST)
MIME-Version: 1.0
References: <0CE826F5-EEF8-4D1A-975A-7BBAB29FAA51@icloud.com>
In-Reply-To: <0CE826F5-EEF8-4D1A-975A-7BBAB29FAA51@icloud.com>
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Date: Fri, 28 Jan 2022 18:02:38 +0300
Message-ID: <CADO9X9SGDvraWUzaF+AQs=9xbAZe5AH07HiS=Xvqe6en491Tyg@mail.gmail.com>
Subject: Re: [PATCH v8 5/7] net/vmnet: implement bridged mode (vmnet-bridged)
To: =?UTF-8?B?5p2O5aOr5p6X?= <lslboyfuture@icloud.com>
Content-Type: multipart/alternative; boundary="00000000000078363d05d6a5ba4d"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Jason Wang <jasowang@redhat.com>, phillip.ennen@gmail.com,
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Phillip Tennen <phillip@axleos.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Howard Spoelstra <hsp.cat7@gmail.com>,
 Alessio Dionisi <hello@adns.io>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000078363d05d6a5ba4d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=81, 23 =D1=8F=D0=BD=D0=B2. 2022 =D0=B3. =D0=B2 07:51, =E6=9D=8E=
=E5=A3=AB=E6=9E=97 <lslboyfuture@icloud.com>:

> Hi:
>     I develop a custom os use qemu and use macos as host, I use the net
> argument '-net nic,model=3Dpcnet -net
> tap,ifname=3Dtap0,script=3Dno,downscript=3Dno=E2=80=99 when run the qemu-=
system-i386,then
> I can get the network device in my custom os:
>
>
Please notice that `-net` is a legacy option
https://wiki.qemu.org/Documentation/Networking#The_legacy_-net_option


>     pci_device_dump: vendor id:      0x1022
>     pci_device_dump: device id:      0x2000
>     pci_device_dump: class code:     0x20000
>     pci_device_dump: revision id:    0x10
>     pci_device_dump: multi function: 0
>     pci_device_dump: card bus CIS pointer: 0
>     pci_device_dump: subsystem vendor id: 0
>     pci_device_dump: subsystem device id: 0
>     pci_device_dump: expansion ROM base address: feb80000
>     pci_device_dump: capability list pointer:  0
>     pci_device_dump: irq line: 11
>     pci_device_dump: irq pin:  1
>     pci_device_dump: min Gnt: 6
>     pci_device_dump: max Lat:  255
>     pci_device_dump: bar 0:
>     pci_device_bar_dump: type: io base address
>     pci_device_bar_dump: base address: c000
>     pci_device_bar_dump: len: 20
>     pci_device_dump: bar 1:
>     pci_device_bar_dump: type: mem base address
>     pci_device_bar_dump: base address: febd1000
>     pci_device_bar_dump: len: 20
>
> I can send a message to the host from my custom os in qemu, but can=E2=80=
=99t
> receive a message from the host.
>
>
This is known issue:
https://gitlab.com/qemu-project/qemu/-/issues/335


> so I rebuild the qemu use this patch, then I use the argument '-netdev
> vmnet-bridged,id=3Dvmnet,ifname=3Den0=E2=80=99 run the qemu-system-i386 a=
gain, this
> time, I can=E2=80=99t get the network device either, I don=E2=80=99t know=
 why, how to use
> vmnet-bridged to send message to host from my custom os and receive a
> message from the host, what should I do? thanks a lot!


It's normal behavior since you've specified a
network backend only. See the corresponding
QEMU documentation section:
https://wiki.qemu.org/Documentation/Networking#Network_Backends

Currently you have:
`-netdev vmnet-bridged,id=3Dvmnet,ifname=3Den0`
You need add a device:
 `-netdev vmnet-bridged,id=3Dvmnet,ifname=3Den0 -device pcnet,netdev=3Dvmne=
t`

Supported devices can be listed with -device help:
`qemu-system-xxx -device help`

--
Best Regards,

Vladislav Yaroshchuk

--00000000000078363d05d6a5ba4d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">=D0=B2=D1=81, 23 =D1=8F=D0=BD=D0=B2. =
2022 =D0=B3. =D0=B2 07:51, =E6=9D=8E=E5=A3=AB=E6=9E=97 &lt;<a href=3D"mailt=
o:lslboyfuture@icloud.com">lslboyfuture@icloud.com</a>&gt;:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Hi:<br>
=C2=A0 =C2=A0 I develop a custom os use qemu and use macos as host, I use t=
he net argument &#39;-net nic,model=3Dpcnet -net tap,ifname=3Dtap0,script=
=3Dno,downscript=3Dno=E2=80=99 when run the qemu-system-i386,then I can get=
 the network device in my custom os:<br>
<br></blockquote><div><br></div><div>Please notice that `-net` is a legacy =
option<br><a href=3D"https://wiki.qemu.org/Documentation/Networking#The_leg=
acy_-net_option">https://wiki.qemu.org/Documentation/Networking#The_legacy_=
-net_option</a><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
=C2=A0 =C2=A0 pci_device_dump: vendor id:=C2=A0 =C2=A0 =C2=A0 0x1022<br>
=C2=A0 =C2=A0 pci_device_dump: device id:=C2=A0 =C2=A0 =C2=A0 0x2000<br>
=C2=A0 =C2=A0 pci_device_dump: class code:=C2=A0 =C2=A0 =C2=A00x20000<br>
=C2=A0 =C2=A0 pci_device_dump: revision id:=C2=A0 =C2=A0 0x10<br>
=C2=A0 =C2=A0 pci_device_dump: multi function: 0<br>
=C2=A0 =C2=A0 pci_device_dump: card bus CIS pointer: 0<br>
=C2=A0 =C2=A0 pci_device_dump: subsystem vendor id: 0<br>
=C2=A0 =C2=A0 pci_device_dump: subsystem device id: 0<br>
=C2=A0 =C2=A0 pci_device_dump: expansion ROM base address: feb80000<br>
=C2=A0 =C2=A0 pci_device_dump: capability list pointer:=C2=A0 0<br>
=C2=A0 =C2=A0 pci_device_dump: irq line: 11<br>
=C2=A0 =C2=A0 pci_device_dump: irq pin:=C2=A0 1<br>
=C2=A0 =C2=A0 pci_device_dump: min Gnt: 6<br>
=C2=A0 =C2=A0 pci_device_dump: max Lat:=C2=A0 255<br>
=C2=A0 =C2=A0 pci_device_dump: bar 0:<br>
=C2=A0 =C2=A0 pci_device_bar_dump: type: io base address<br>
=C2=A0 =C2=A0 pci_device_bar_dump: base address: c000<br>
=C2=A0 =C2=A0 pci_device_bar_dump: len: 20<br>
=C2=A0 =C2=A0 pci_device_dump: bar 1:<br>
=C2=A0 =C2=A0 pci_device_bar_dump: type: mem base address<br>
=C2=A0 =C2=A0 pci_device_bar_dump: base address: febd1000<br>
=C2=A0 =C2=A0 pci_device_bar_dump: len: 20<br>
<br>
I can send a message to the host from my custom os in qemu, but can=E2=80=
=99t receive a message from the host.<br>
<br></blockquote><div><br></div><div>This is known issue:<br><a href=3D"htt=
ps://gitlab.com/qemu-project/qemu/-/issues/335">https://gitlab.com/qemu-pro=
ject/qemu/-/issues/335</a><br></div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
so I rebuild the qemu use this patch, then I use the argument &#39;-netdev =
vmnet-bridged,id=3Dvmnet,ifname=3Den0=E2=80=99 run the qemu-system-i386 aga=
in, this time, I can=E2=80=99t get the network device either, I don=E2=80=
=99t know why, how to use vmnet-bridged to send message to host from my cus=
tom os and receive a message from the host, what should I do? thanks a lot!=
</blockquote><div><br><p dir=3D"auto">It&#39;s normal behavior since you&#3=
9;ve specified a<br>network backend only. See the corresponding <br>QEMU do=
cumentation section:<br><a href=3D"https://wiki.qemu.org/Documentation/Netw=
orking#Network_Backends">https://wiki.qemu.org/Documentation/Networking#Net=
work_Backends</a><br><br>Currently you have:<br>`-netdev vmnet-bridged,id=
=3Dvmnet,ifname=3Den0`<br>You need add a device:<br>=C2=A0`-netdev vmnet-br=
idged,id=3Dvmnet,ifname=3Den0 -device pcnet,netdev=3Dvmnet`<br></p><p dir=
=3D"auto">Supported devices can be listed with -device help:<br>`qemu-syste=
m-xxx <span class=3D"gmail-nt">-device</span> <span class=3D"gmail-nb">help=
`=C2=A0</span></p><p dir=3D"auto">--<br></p></div></div><div dir=3D"ltr" cl=
ass=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"=
>Best Regards,<div><br><div>Vladislav Yaroshchuk</div></div></div></div></d=
iv>

--00000000000078363d05d6a5ba4d--


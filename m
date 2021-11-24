Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 165CC45B5F1
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 08:52:06 +0100 (CET)
Received: from localhost ([::1]:36216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpn4X-0000Mc-6c
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 02:52:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1mpmoP-0002ZV-47
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 02:35:25 -0500
Received: from [2607:f8b0:4864:20::930] (port=35594
 helo=mail-ua1-x930.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1mpmoL-00083I-Oa
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 02:35:24 -0500
Received: by mail-ua1-x930.google.com with SMTP id l24so3230711uak.2
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 23:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=Wq+rSosmNl4J12gPZdqAUHheo525to32vY3OUyX6Cr8=;
 b=Ir6arotudV5XEzojXreDx9M9sQEz5EtL4vHT/+H/Eotitfyko9mGQrTILiXRn8ll9L
 40QBmj3/AMvSkU3PahGF3kC0r/S41Y6EcqHtcY5za70ggZVb2igQA9b2z9kW70zTwZEu
 e4PFA4ytfeF2OFvL61LmJKfPzxZkBVuS9m0OyaW7u3vHHmCpTiT0T3n5f3ogxZi3xVgU
 5b+BtJQYLlV7ZNhlnLwcrBEnG3JtdM5hp7EH/5nCBpC/k6vvfxgN1oZVNGOjlMz4dGcz
 03aSHqrFkhO5GMbO2AVMrRwM6+VWQhSRBXJQSbiyCQSDBjyhIrScEE7xrj1X8/yfJ0CC
 JmJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=Wq+rSosmNl4J12gPZdqAUHheo525to32vY3OUyX6Cr8=;
 b=k5h0mOyGb9mPKZLZ0u/G2oK+BJG1WBJMBquInhcsxuIsye8FNBd9etjGaVqjsPbJ2O
 YvIe7t33NQOje6zQdVbZIEPprpp0r6/Rx7A0BamdT24IYYTcIMqEmviN7L/Z3JQOy95L
 baKizOe+ZTdPG2MnJeIODWmfQoyDEVzgN8o5RMV10u0BkharLQK/WaSxOH6kvCziOsqM
 Q8EL7f+hBfJeLwJkzz/BpapcSeSim7fwH4lpupWlpLD1NEKQiteceqPm1n8cEnFLv48f
 LgpVgKJ2b3bP3GHWI5tNI3tD/mkxebCjPJGrxYNmeJyEK8U0E9V7XViQziZRunUB4Ukf
 tyng==
X-Gm-Message-State: AOAM531HKKM7vYY8GrCcWtpb6x2FI36bSivl3ipCIUaVZUsIiLhfKdxG
 VaERYL7XjXlVq3Q2RaJcPvYIcyNeiIuiUV26jFWhzhizN9jrmw==
X-Google-Smtp-Source: ABdhPJwOiwih51DlMpx2d5Hmk14KB83WW79FGkB8ZISPNG0nniwIxoOg/nSeXY4DwfILpX0imlYx0UW/RuuSMdH++B0=
X-Received: by 2002:ab0:70cd:: with SMTP id r13mr6785566ual.99.1637739317666; 
 Tue, 23 Nov 2021 23:35:17 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Wed, 24 Nov 2021 15:35:07 +0800
Message-ID: <CAE2XoE-RgL3762rVVjCmTajrPea2-5kcOaSj=qWsa3oHiEP+jw@mail.gmail.com>
Subject: How to enable virgl in headless mode?
To: qemu-level <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000043a80f05d183e679"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::930
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=luoyonggang@gmail.com; helo=mail-ua1-x930.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, NUMERIC_HTTP_ADDR=1.242, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, WEIRD_PORT=0.001 autolearn=no autolearn_force=no
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
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000043a80f05d183e679
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Here is my command line
```
qemu-system-arm ^
 -monitor telnet:127.0.0.1:5318,server=3Don,wait=3Doff,nodelay=3Don ^
 -serial telnet:127.0.0.1:5319,server=3Don,wait=3Don,nodelay=3Don ^
 -parallel none ^
 -cpu cortex-a15 -smp 4 -M virt -m 2G ^
 -kernel armhf-installed/vmlinuz ^
 -initrd armhf-installed/initrd.img ^
 -vnc :1,websocket=3D5701 ^
 -nographic ^
 -append "root=3D/dev/vda2 console=3DttyAMA0" ^
 -device virtio-gpu-gl-device ^
 -device virtio-blk-device,drive=3Dhd -drive
file=3Darmhf-installed/debian_11.img,if=3Dnone,id=3Dhd ^
 -device virtio-net-device,netdev=3Dnet0 -netdev
user,hostfwd=3Dtcp::2222-:22,id=3Dnet0
```
--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--00000000000043a80f05d183e679
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Here is my command line<br clear=3D"all"><div>```</div><di=
v>qemu-system-arm ^<br>=C2=A0-monitor telnet:<a href=3D"http://127.0.0.1:53=
18">127.0.0.1:5318</a>,server=3Don,wait=3Doff,nodelay=3Don ^<br>=C2=A0-seri=
al telnet:<a href=3D"http://127.0.0.1:5319">127.0.0.1:5319</a>,server=3Don,=
wait=3Don,nodelay=3Don ^<br>=C2=A0-parallel none ^<br>=C2=A0-cpu cortex-a15=
 -smp 4 -M virt -m 2G ^<br>=C2=A0-kernel armhf-installed/vmlinuz ^<br>=C2=
=A0-initrd armhf-installed/initrd.img ^<br>=C2=A0-vnc :1,websocket=3D5701 ^=
<br>=C2=A0-nographic ^<br>=C2=A0-append &quot;root=3D/dev/vda2 console=3Dtt=
yAMA0&quot; ^<br>=C2=A0-device virtio-gpu-gl-device ^<br>=C2=A0-device virt=
io-blk-device,drive=3Dhd -drive file=3Darmhf-installed/debian_11.img,if=3Dn=
one,id=3Dhd ^<br>=C2=A0-device virtio-net-device,netdev=3Dnet0 -netdev user=
,hostfwd=3Dtcp::2222-:22,id=3Dnet0<br></div><div>```</div>-- <br><div dir=
=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature">=C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =E6=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=97=
=E5=8B=87=E5=88=9A<br>Yours<br>=C2=A0 =C2=A0 sincerely,<br>Yonggang Luo<br>=
</div></div>

--00000000000043a80f05d183e679--


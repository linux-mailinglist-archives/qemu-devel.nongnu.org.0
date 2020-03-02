Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EC0175D46
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Mar 2020 15:35:29 +0100 (CET)
Received: from localhost ([::1]:33506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8mA1-0008JJ-Gy
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 09:35:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42172)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clefrks@gmail.com>) id 1j8d7K-0002Y1-RX
 for qemu-devel@nongnu.org; Sun, 01 Mar 2020 23:55:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clefrks@gmail.com>) id 1j8d7J-0005dt-Pa
 for qemu-devel@nongnu.org; Sun, 01 Mar 2020 23:55:46 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:39824)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <clefrks@gmail.com>) id 1j8d7J-0005df-L9
 for qemu-devel@nongnu.org; Sun, 01 Mar 2020 23:55:45 -0500
Received: by mail-ot1-x344.google.com with SMTP id x97so8427855ota.6
 for <qemu-devel@nongnu.org>; Sun, 01 Mar 2020 20:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=+ps1Grnwu8uJbrmida+AxI/wxKzvLQga5hiLkkKp7kk=;
 b=nFOiK8/gdUm95/Ah2XKiYO9nsayDMq0Tt7Kb6BJphpSbswtn5TadEp3VIyKvnR4AkM
 APCp0HBectj1xh2L4zVAnR7ky2BURpXFihWuCNLXcoAlAbk3pOZ7L5oKV89iJ6bS5PgL
 JtaHyx1TCoOVt5/AbM/vMkJa9bKlor7/cTQKNop842VFBHWAbOtmY5bz4v6ApNcYLHhi
 +zWwavE593TXi4If5KhyEy0eu0+4AHV4OWbq+n/IYg5dPFNSJzAgEWrpx1XPxNVqZLLk
 IaA3E6zpwXjrVCd3Vzn8+7j6M5cMZhJ1W3rP2f/x49Vpc0FOZU6PMjq6ZCwu/q9IlQei
 UXYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=+ps1Grnwu8uJbrmida+AxI/wxKzvLQga5hiLkkKp7kk=;
 b=GYJ5iqNwvdcl/YiDBYL3rZbxkqpI7Xe9wsrPxX6RaXQhKvQVrdgTFYSChSlFyTHsqS
 e0FPCh8WSy1Dpw5OI/fT12r6NAA3iePYvP5kaG3wJosrO6ka0rnkeywjeJXrvVlz+Xxw
 76/4bMce9HDVJ/+XvFLv6PK0tvSCG4XenQz7/v9k585EwkpcqVWeNnA8ZeCnv5U7rZ89
 PLKh7jUFEqksA8C0RNKRmCzwCfB5IamI8/iUPh77M1Lb4j/DrFvr/pk+SAJHPQlfAygw
 3cDYp3z75+BMvSpKppvf+Q447iCBzayO/ZaFXGYCzY2NbmKxe+mLSUm2obzOjj/Q563B
 kGsA==
X-Gm-Message-State: APjAAAUCu+y2yenR5J7PMdmObW5plKGlj1wpy8sONg9a4anYd0/K0Mmv
 pBUrKGJtam38zTZjXs5wSFkscBgnfTxKf5GqDlYUu44Y
X-Google-Smtp-Source: APXvYqwVWpwrQmMBHHJAERej5nRhEXsbAEfWA23y8PMDywrdy03yKYQZRxCJod40K024B5xba8oQjF2qTgjeBQQkJSU=
X-Received: by 2002:a05:6830:18ce:: with SMTP id
 v14mr11567460ote.36.1583124944335; 
 Sun, 01 Mar 2020 20:55:44 -0800 (PST)
MIME-Version: 1.0
From: clement andrew <clefrks@gmail.com>
Date: Mon, 2 Mar 2020 12:55:33 +0800
Message-ID: <CALayR+Rd43eQj2iyww=nDRjyKJ8_iuhBFnfoGD+4t_cakmBfgg@mail.gmail.com>
Subject: USB passthrough using qemu commandline method in libvirt
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000f138a2059fd7ff5c"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
X-Mailman-Approved-At: Mon, 02 Mar 2020 09:32:59 -0500
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
Cc: stefanha@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f138a2059fd7ff5c
Content-Type: text/plain; charset="UTF-8"

Hi

I'm trying to do usb passthrough using qemu commandline method in libvirt
as below by making changes , but VM failed to create the usb passthrough.
<qemu:commandline>
  <qemu:arg value='-device'/>
  <qemu:arg value='usb-host,vendorid=0x0930,productid=0x6545,bus=usb1.0'/>
</qemu:commandline>

While using just normal qemu command, it was passing just fine.
sudo qemu-system-x86_64 -enable-kvm -m 2G -cpu host -smp 2 -vga qxl -drive
file=/var/lib/libvirt/images/os1.qcow2,index=0,media=disk,format=qcow2
-device usb-host,vendorid=0x0930,productid=0x6545

Is there a guide where i can find out information on this ?

Thanks!

--000000000000f138a2059fd7ff5c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0<div><br></div><div>I&#39;m trying to do usb passt=
hrough using qemu commandline method in libvirt as below by making changes =
, but VM failed to create the usb passthrough.</div><div>&lt;qemu:commandli=
ne&gt;</div><div>=C2=A0 &lt;qemu:arg value=3D&#39;-device&#39;/&gt;</div><d=
iv>=C2=A0 &lt;qemu:arg value=3D&#39;usb-host,vendorid=3D0x0930,productid=3D=
0x6545,bus=3Dusb1.0&#39;/&gt;</div><div>&lt;/qemu:commandline&gt;</div><div=
><br></div><div>While using just normal qemu command, it was passing just f=
ine.=C2=A0</div><div><span lang=3D"EN-MY" style=3D"font-size:11pt;font-fami=
ly:Calibri,sans-serif">sudo qemu-system-x86_64 -enable-kvm -m 2G -cpu host
-smp 2 -vga qxl -drive
file=3D/var/lib/libvirt/images/os1.qcow2,index=3D0,media=3Ddisk,format=3Dqc=
ow2=C2=A0 -device
usb-host,vendorid=3D0x0930,productid=3D0x6545</span><br></div><div><span la=
ng=3D"EN-MY" style=3D"font-size:11pt;font-family:Calibri,sans-serif"><br></=
span></div><div><span lang=3D"EN-MY" style=3D"font-size:11pt;font-family:Ca=
libri,sans-serif">Is there a guide where i can find out information on this=
 ?=C2=A0<br><br>Thanks!</span></div></div>

--000000000000f138a2059fd7ff5c--


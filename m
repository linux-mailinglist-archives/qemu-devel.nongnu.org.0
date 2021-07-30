Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E33883DBBCC
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 17:12:07 +0200 (CEST)
Received: from localhost ([::1]:49614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9UBC-0006j3-W9
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 11:12:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkiwi@redhat.com>) id 1m9U8a-0001v4-9A
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 11:09:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkiwi@redhat.com>) id 1m9U8X-0003OR-SY
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 11:09:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627657759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ytupz78JcN4pYEhv7NoqyjRiN+YWE0Ozi2WEusV5z1s=;
 b=eVxzOX1J0yufeTVu8Grh9mMf08z9X3uzbUuhITVOlEXFxVXV3dkxUwEOA/ZZITAoWqPo7l
 bP8nEoZM20XLkZ1Yc2CJ8JwFEdyTdTpC4hcAf+0lozFNdmPghGa6h5YkCw+c/gq0lybCgH
 KtJEtPQoUBNRImiOqOUwqab6QI+5Px4=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-Q83rdikBPgKXTZoN3a83JA-1; Fri, 30 Jul 2021 11:09:15 -0400
X-MC-Unique: Q83rdikBPgKXTZoN3a83JA-1
Received: by mail-vs1-f71.google.com with SMTP id
 a124-20020a677f820000b029025b7f69ef9aso1771865vsd.22
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 08:09:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ytupz78JcN4pYEhv7NoqyjRiN+YWE0Ozi2WEusV5z1s=;
 b=J1mOkLcogfjNvT5o6GSnmD23qCoR7mNgkxE+B1on9umNaSouR2ljn+JoqQA+/LpYhE
 5RHniXF3nc8Mh3kjL3KEVeKf/Oo0vScflwF+86eY5f7xNk3xCuHq/j2L0Ulpyb+Jq4iA
 XCiDLTebNDiSYDPuyoxY88iPholTzWwI1nyL2NGX/2FKYGoe9nBcUW4pb2DNbbaRAcSQ
 HEIEAtlx6+7MPxR8kxsrs0jdwc6BH7xiC0BfbSyVX60LdKN+RGt5bfdwYPEp/GYvyfFE
 HxyDCaO1aWK972GvhziPKz9zlXXEg5gFRDZVsUw1IbQJeER+9xENKB1S68sO7fcEBu/t
 cPNg==
X-Gm-Message-State: AOAM532jmqUXg3VSsysAnrpJjcmyQR4HiWY/egs0ke45JO89QFv8iFeX
 hRsffAKBU2O8T2UmQymKo7maSDsp6TKI5yPg0TY0c6n9d6faFtfQ8aojLbYjlVe//oYiDveePGC
 QBUyUn5iZDuh6siUdRu5p+nVzx3T47+8=
X-Received: by 2002:a67:f854:: with SMTP id b20mr2207795vsp.32.1627657755435; 
 Fri, 30 Jul 2021 08:09:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8KSZD8G1qh/5kVGCzfShIX3y+dQtrtjlASh+JyPY8y6ylZcVMiSN2GdFNqIzEr+RWl1udCYQ2/FyRQmBllA8=
X-Received: by 2002:a67:f854:: with SMTP id b20mr2207766vsp.32.1627657755294; 
 Fri, 30 Jul 2021 08:09:15 -0700 (PDT)
MIME-Version: 1.0
References: <MEYP282MB168775224F9A7690C9F5AEF9F9EC9@MEYP282MB1687.AUSP282.PROD.OUTLOOK.COM>
 <82ae0532-50c2-7a67-af16-04226cb2986b@redhat.com>
In-Reply-To: <82ae0532-50c2-7a67-af16-04226cb2986b@redhat.com>
From: Klaus Kiwi <kkiwi@redhat.com>
Date: Fri, 30 Jul 2021 12:09:03 -0300
Message-ID: <CAELHpAAyLcpisUdxqL_7j=Gh47YM6ZjAQuZmRy_4jZQi2P9TqA@mail.gmail.com>
Subject: Re: need help with my config
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 clg@kaod.org
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kkiwi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000520e9705c8589a2c"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kkiwi@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, NORMAL_HTTP_TO_IP=0.001, NUMERIC_HTTP_ADDR=1.242,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Lindsay Ryan <Ryan.Lindsay@petermac.org>,
 "qemu-discuss@nongnu.org" <qemu-discuss@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000520e9705c8589a2c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Just making sure Cedric is also seeing this...

 -Klaus

On Fri, Jul 30, 2021 at 10:27 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat=
.com>
wrote:

> Cc'ing qemu-ppc@
>
> On 7/30/21 6:25 AM, Lindsay Ryan wrote:
> > Hi
> > I'm trying to emulate some physical IBM Power 9's that we have. There
> > seems to be plenty of examples of using x86_64 qemu, but slightly less
> > for Power. Unless it's specifically for installing AIX
> > Anyway, I'm trying to boot the VM as I guess a bare metal Power 9 box,
> > then install redhat from Iso on a disk and have it on the network.
> >
> > ./qemu-system-ppc64 -cpu POWER9 -smp cpus=3D4 -machine pseries -m 4096 =
-M
> > accel=3Dtcg  -serial stdio -nodefaults -nographic -device
> > megasas,id=3Dscsi0,bus=3Dpci.0,addr=3D0x5 -drive
> >
> file=3D/home/hdisk1.qcow2,if=3Dnone,id=3Ddrive-scsi0-0-0-0,format=3Dqcow2=
,cache=3Dnone
> > -device
> >
> scsi-hd,bus=3Dscsi0.0,channel=3D0,scsi-id=3D0,lun=3D0,drive=3Ddrive-scsi0=
-0-0-0,id=3Dscsi0-0-0-0,bootindex=3D2
> > -cdrom /mnt/images/rhel-8.4-ppc64le-boot.iso -monitor
> > telnet:0.0.0.0:3344,server,nowait -netdev
> > bridge,id=3Dnet0,helper=3Dqemu-bridge-helper,br=3Dbridge0,id=3Dhostnet0
> >
> > So the megasas gets detected as a raid controller. Yay.
> > But my qcow2 disk image doesn't seem to be plugged into it correctly as
> > it's not detected.
> > It sees the cdrom image and I can boot from it.
> > The other thing I can't get working is the network card.
> >
> > On this host system I have some other x86 kvm's running. So Ideally if =
I
> > could plug the nic on this vm into
> > 7: virbr0
> >
> > 6: bridge0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue
> > state UP group default qlen 1000
> >     link/ether 00:25:b5:04:2a:1e brd ff:ff:ff:ff:ff:ff
> >     inet 10.126.24.82/24 brd 10.126.24.255 scope global noprefixroute
> > bridge0
> >        valid_lft forever preferred_lft forever
> >     inet6 fe80::76a8:89ec:fc62:9c94/64 scope link noprefixroute
> >        valid_lft forever preferred_lft forever
> > 7: virbr0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue
> > state UP group default qlen 1000
> >     link/ether 52:54:00:51:db:be brd ff:ff:ff:ff:ff:ff
> >     inet 192.168.122.1/24 brd 192.168.122.255 scope global virbr0
> >        valid_lft forever preferred_lft forever
> >
> > If I can't do that, then I really only need the ppc64 guest to have
> > access out to the internet and I can nat anything incoming
> >
> > Any help, particularly about how to plug virtual disk drives into
> > virtual disk controllers would be helpful
> > regards
> >
> >
> > Ryan Lindsay BEng, MSc.
> > Linux Storage Administrator
> > Research Computing Facility
> >
> >
> > *Disclaimer: *This email (including any attachments or links) may
> > contain confidential and/or legally privileged information and is
> > intended only to be read or used by the addressee. If you are not the
> > intended addressee, any use, distribution, disclosure or copying of thi=
s
> > email is strictly prohibited. Confidentiality and legal privilege
> > attached to this email (including any attachments) are not waived or
> > lost by reason of its mistaken delivery to you. If you have received
> > this email in error, please delete it and notify us immediately by
> > telephone or email. Peter MacCallum Cancer Centre provides no guarantee
> > that this transmission is free of virus or that it has not been
> > intercepted or altered and will not be liable for any delay in its
> receipt.
> >
>
>
>

--=20
Klaus Heinrich Kiwi <kkiwi@redhat.com>
Manager, Software Engineering - Red Hat Virtualization

--000000000000520e9705c8589a2c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Just making sure Cedric is also seeing this...<div><br></d=
iv><div>=C2=A0-Klaus</div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Fri, Jul 30, 2021 at 10:27 AM Philippe Mathieu=
-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Cc&#3=
9;ing qemu-ppc@<br>
<br>
On 7/30/21 6:25 AM, Lindsay Ryan wrote:<br>
&gt; Hi<br>
&gt; I&#39;m trying to emulate some physical IBM Power 9&#39;s that we have=
. There<br>
&gt; seems to be plenty of examples of using x86_64 qemu, but slightly less=
<br>
&gt; for Power. Unless it&#39;s specifically for installing AIX<br>
&gt; Anyway, I&#39;m trying to boot the VM as I guess a bare metal Power 9 =
box,<br>
&gt; then install redhat from Iso on a disk and have it on the network.<br>
&gt; <br>
&gt; ./qemu-system-ppc64 -cpu POWER9 -smp cpus=3D4 -machine pseries -m 4096=
 -M<br>
&gt; accel=3Dtcg =C2=A0-serial stdio -nodefaults -nographic -device<br>
&gt; megasas,id=3Dscsi0,bus=3Dpci.0,addr=3D0x5 -drive<br>
&gt; file=3D/home/hdisk1.qcow2,if=3Dnone,id=3Ddrive-scsi0-0-0-0,format=3Dqc=
ow2,cache=3Dnone<br>
&gt; -device<br>
&gt; scsi-hd,bus=3Dscsi0.0,channel=3D0,scsi-id=3D0,lun=3D0,drive=3Ddrive-sc=
si0-0-0-0,id=3Dscsi0-0-0-0,bootindex=3D2<br>
&gt; -cdrom /mnt/images/rhel-8.4-ppc64le-boot.iso -monitor<br>
&gt; telnet:<a href=3D"http://0.0.0.0:3344" rel=3D"noreferrer" target=3D"_b=
lank">0.0.0.0:3344</a>,server,nowait -netdev<br>
&gt; bridge,id=3Dnet0,helper=3Dqemu-bridge-helper,br=3Dbridge0,id=3Dhostnet=
0<br>
&gt; <br>
&gt; So the megasas gets detected as a raid controller. Yay.=C2=A0<br>
&gt; But my qcow2 disk image doesn&#39;t seem to be plugged into it correct=
ly as<br>
&gt; it&#39;s not detected.=C2=A0<br>
&gt; It sees the cdrom image and I can boot from it.<br>
&gt; The other thing I can&#39;t get working is the network card.=C2=A0<br>
&gt; <br>
&gt; On this host system I have some other x86 kvm&#39;s running. So Ideall=
y if I<br>
&gt; could plug the nic on this vm into=C2=A0<br>
&gt; 7: virbr0<br>
&gt; <br>
&gt; 6: bridge0: &lt;BROADCAST,MULTICAST,UP,LOWER_UP&gt; mtu 1500 qdisc noq=
ueue<br>
&gt; state UP group default qlen 1000<br>
&gt; =C2=A0 =C2=A0 link/ether 00:25:b5:04:2a:1e brd ff:ff:ff:ff:ff:ff<br>
&gt; =C2=A0 =C2=A0 inet <a href=3D"http://10.126.24.82/24" rel=3D"noreferre=
r" target=3D"_blank">10.126.24.82/24</a> brd 10.126.24.255 scope global nop=
refixroute<br>
&gt; bridge0<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0valid_lft forever preferred_lft forever<br>
&gt; =C2=A0 =C2=A0 inet6 fe80::76a8:89ec:fc62:9c94/64 scope link noprefixro=
ute<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0valid_lft forever preferred_lft forever<br>
&gt; 7: virbr0: &lt;BROADCAST,MULTICAST,UP,LOWER_UP&gt; mtu 1500 qdisc noqu=
eue<br>
&gt; state UP group default qlen 1000<br>
&gt; =C2=A0 =C2=A0 link/ether 52:54:00:51:db:be brd ff:ff:ff:ff:ff:ff<br>
&gt; =C2=A0 =C2=A0 inet <a href=3D"http://192.168.122.1/24" rel=3D"noreferr=
er" target=3D"_blank">192.168.122.1/24</a> brd 192.168.122.255 scope global=
 virbr0<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0valid_lft forever preferred_lft forever<br>
&gt; <br>
&gt; If I can&#39;t do that, then I really only need the ppc64 guest to hav=
e<br>
&gt; access out to the internet and I can nat anything incoming<br>
&gt; <br>
&gt; Any help, particularly about how to plug virtual disk drives into<br>
&gt; virtual disk controllers would be helpful<br>
&gt; regards<br>
&gt; <br>
&gt; <br>
&gt; Ryan Lindsay BEng, MSc.<br>
&gt; Linux Storage Administrator<br>
&gt; Research Computing Facility<br>
&gt; <br>
&gt; <br>
&gt; *Disclaimer:=C2=A0*This email (including any attachments or links) may=
<br>
&gt; contain confidential and/or legally privileged information and is<br>
&gt; intended only to be read or used by the addressee. If you are not the<=
br>
&gt; intended addressee, any use, distribution, disclosure or copying of th=
is<br>
&gt; email is strictly prohibited. Confidentiality and legal privilege<br>
&gt; attached to this email (including any attachments) are not waived or<b=
r>
&gt; lost by reason of its mistaken delivery to you. If you have received<b=
r>
&gt; this email in error, please delete it and notify us immediately by<br>
&gt; telephone or email. Peter MacCallum Cancer Centre provides no guarante=
e<br>
&gt; that this transmission is free of virus or that it has not been<br>
&gt; intercepted or altered and will not be liable for any delay in its rec=
eipt.<br>
&gt; <br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Klaus Heinrich Kiwi &lt;<a href=
=3D"mailto:kkiwi@redhat.com" target=3D"_blank">kkiwi@redhat.com</a>&gt;<div=
>Manager, Software Engineering - Red Hat Virtualization</div></div></div>

--000000000000520e9705c8589a2c--



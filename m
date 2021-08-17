Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE783EE93B
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 11:13:00 +0200 (CEST)
Received: from localhost ([::1]:43824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFv9X-0002v5-Hr
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 05:12:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mFv7I-0007VK-Ui
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 05:10:42 -0400
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d]:44815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mFv7F-00086t-Hh
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 05:10:40 -0400
Received: by mail-vs1-xe2d.google.com with SMTP id s19so5184675vsl.11
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 02:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=plZ8n7PhLbnJdM7xt+Or/9DSzxCQIRhtBdl9iongUpY=;
 b=fiCUsDYpPJ/DL/VNFY9lA5iY0gKKkpQ7EouCbeysW1FJn6izdumiaHrKlCP55qMljC
 /mL4TJfnapcDtNZ2ILAtSV2xCFOND+Rt2CMt+S+j4/YYo9KorgAz+Tk4nvAhonT4aifr
 kxBFkxvd0S1f1m4vxlycUeiUFlujCZZ3RluYYqRVlNFCwy0axuuW/OQhiFPjyES6/vsz
 5ce2miy82WSTQwFzTN3MAdAIkoOSOg3olVZ3gU87CXVlAavqfTBIGl0EE1QMkpwGGUWS
 a6lNyP4VMiiKpPqkL3/31y2qelTXVZbIkS+iYVYcWCTeHu1dVT9uDiI2O05SKCe5k4gS
 bY3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=plZ8n7PhLbnJdM7xt+Or/9DSzxCQIRhtBdl9iongUpY=;
 b=bdfKUMY/yYkslfuS+wbxdmvEZaR8iElu0WQ/LYdK42cO199azuS+kMJus+xlDC0ID2
 PEjv6Szqtmsur0IQ6Q4JZbQNgY4I9SV504keK9/tH/iNgtIbdabP2XXwtobG3heD8KTa
 F6pc2rd892CzZUIA5c0fFCyI9vnCbL7sOSM1jNeYMNNBTU/M4rHUmp0VNzFouuzZr+43
 2J/GzRTHnyzS1t0XW9QkWlIbjQF7mUqG3CaYFFRX1WwVe1Q3V1gelzN3Xa8BaDLk3w6V
 naYP/qHs5AZKYgcXxPOk1psKmXUwpZ49kPqGuKmXdilPAHkp2/Z3ELU0XNspNECWKPf3
 Tb6w==
X-Gm-Message-State: AOAM533h2tF9sBBKmKSldWvNs8H57tRAIbVfHrj+ig88AQdJsTugGthw
 aZCw/UNZ4tyX5K63o+6pOAWQHHwPTgwjKQVwc84=
X-Google-Smtp-Source: ABdhPJywnnuoSGXM/E89/RkY9+fcVy7pTzEegQEIbd+hRrZXrBhs7vS42rtzbDX/DSdKduvPhgOYINbtmVsMRpO+VUI=
X-Received: by 2002:a67:341:: with SMTP id 62mr1827425vsd.12.1629191435763;
 Tue, 17 Aug 2021 02:10:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210617143246.55336-1-yaroshchuk2000@gmail.com>
 <YRS5BaIhk0sWhwIQ@SPB-NB-133.local>
In-Reply-To: <YRS5BaIhk0sWhwIQ@SPB-NB-133.local>
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Date: Tue, 17 Aug 2021 12:10:25 +0300
Message-ID: <CADO9X9QemHmNhs=KbDiENHnCujkfCWMDX8TPoX8dPPJy5a_8xA@mail.gmail.com>
Subject: Re: [PATCH 0/7] Add vmnet.framework based network backend
To: Roman Bolshakov <r.bolshakov@yadro.com>
Content-Type: multipart/alternative; boundary="000000000000ccc16405c9bdb004"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-vs1-xe2d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 jasowang@redhat.com, qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Markus Armbruster <armbru@redhat.com>, Phillip Tennen <phillip@axleos.com>,
 Howard Spoelstra <hsp.cat7@gmail.com>, Alessio Dionisi <hello@adns.io>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ccc16405c9bdb004
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Roman,

Sorry for the late reply. In my series of patches I partially reuse Phillip
Tennen's work that you have mentioned
https://mail.gnu.org/archive/html/qemu-devel/2021-02/msg05874.html. The
main idea and provided feature is the same, so please select the series on
your choice. I just can say that I'm ready to update/improve my patches
asap, make them ready to be merged. Can't say anything about Phillip, is he
ready too or not.

Regards,
Vladislav

=D1=87=D1=82, 12 =D0=B0=D0=B2=D0=B3. 2021 =D0=B3. =D0=B2 09:01, Roman Bolsh=
akov <r.bolshakov@yadro.com>:

> On Thu, Jun 17, 2021 at 05:32:39PM +0300, Vladislav Yaroshchuk wrote:
> > macOS provides networking API for VMs called vmnet.framework.
> > I tried to add it as a network backend. All three modes are supported:
> >
> > -shared:
> >   allows the guest to comminicate with other guests in shared mode and
> >   also with external network (Internet) via NAT
> >
> > -host:
> >   allows the guest to communicate with other guests in host mode
> >
> > -bridged:
> >   bridges the guest with a physical network interface
> >
> > Separate netdev for each vmnet mode was created because they use quite
> > different settings, especially since macOS 11.0 when vmnet.framework
> > gets a lot of updates.
> >
> > Not sure that I use qemu_mutex_lock_iothread() and
> > qemu_mutex_unlock_iothread() in correct way while sending packet
> > from vmnet interface to QEMU. I'll be happy to receive
> > recomendations how to make this thing better if I done sth wrong.
> >
> > Also vmnet.framework requires com.apple.vm.networking entitlement to
> > run without root priveledges. Ad-hoc signing does not fit there,
> > so I didn't touch anything related to signing. As a result we should
> > run qemu-system by a priviledged user:
> > `$ sudo qemu-system-x86_64 -nic vmnet-shared`
> > otherwise vmnet fails with 'general failure'.
> >
> > But in any way it seems working now,
> > I tested it within qemu-system-x86-64 on macOS 10.15.7 host, with nic
> > models:
> > - e1000-82545em
> > - virtio-net-pci
> >
> > and having such guests:
> > - macOS 10.15.7
> > - Ubuntu Bionic (server cloudimg)
> >
>
> Hi Vladislav,
>
> I appreciate the efforts and I'm sorry I didn't look into it yet, lack
> of time :(
>
> To all: earlier this year another series was sent by Phillip Tennen to
> add vmnet.framework and some comments were provided:
> https://mail.gnu.org/archive/html/qemu-devel/2021-02/msg05874.html
>
> I'm not sure how to proceed with arbitration which of the series is
> preferred. FIFO or LIFO?
>
> Regards,
> Roman
>
> > Vladislav Yaroshchuk (7):
> >   net/vmnet: dependencies setup, initial preparations
> >   net/vmnet: add new netdevs to qapi/net
> >   net/vmnet: create common netdev state structure
> >   net/vmnet: implement shared mode (vmnet-shared)
> >   net/vmnet: implement host mode (vmnet-host)
> >   net/vmnet: implement bridged mode (vmnet-bridged)
> >   net/vmnet: update qemu-options.hx
> >
> >  configure           |  31 +++++
> >  meson.build         |   5 +
> >  net/clients.h       |  11 ++
> >  net/meson.build     |   7 ++
> >  net/net.c           |  10 ++
> >  net/vmnet-bridged.m | 123 ++++++++++++++++++
> >  net/vmnet-common.m  | 294 ++++++++++++++++++++++++++++++++++++++++++++
> >  net/vmnet-host.c    |  93 ++++++++++++++
> >  net/vmnet-shared.c  |  94 ++++++++++++++
> >  net/vmnet_int.h     |  48 ++++++++
> >  qapi/net.json       |  99 ++++++++++++++-
> >  qemu-options.hx     |  17 +++
> >  12 files changed, 830 insertions(+), 2 deletions(-)
> >  create mode 100644 net/vmnet-bridged.m
> >  create mode 100644 net/vmnet-common.m
> >  create mode 100644 net/vmnet-host.c
> >  create mode 100644 net/vmnet-shared.c
> >  create mode 100644 net/vmnet_int.h
> >
> > --
> > 2.23.0
> >
>

--000000000000ccc16405c9bdb004
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Roman,<div><br></div><div>Sorry for=C2=A0the late reply=
. In my series of patches I partially reuse Phillip Tennen&#39;s=C2=A0work =
that you have mentioned=C2=A0<a href=3D"https://mail.gnu.org/archive/html/q=
emu-devel/2021-02/msg05874.html" rel=3D"noreferrer" target=3D"_blank">https=
://mail.gnu.org/archive/html/qemu-devel/2021-02/msg05874.html</a>. The main=
 idea and provided feature is the same,=C2=A0so please select the series on=
 your choice. I just can=C2=A0say that I&#39;m ready to update/improve my p=
atches asap, make them ready to be merged. Can&#39;t say anything about Phi=
llip,=C2=A0is he ready too or not.</div><div><br></div><div>Regards,</div><=
div>Vladislav</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">=D1=87=D1=82, 12 =D0=B0=D0=B2=D0=B3. 2021 =D0=B3. =D0=B2=
 09:01, Roman Bolshakov &lt;<a href=3D"mailto:r.bolshakov@yadro.com">r.bols=
hakov@yadro.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Thu, Jun 17, 2021 at 05:32:39PM +0300, Vladislav Yaroshchuk w=
rote:<br>
&gt; macOS provides networking API for VMs called vmnet.framework.<br>
&gt; I tried to add it as a network backend. All three modes are supported:=
<br>
&gt; <br>
&gt; -shared:<br>
&gt;=C2=A0 =C2=A0allows the guest to comminicate with other guests in share=
d mode and<br>
&gt;=C2=A0 =C2=A0also with external network (Internet) via NAT<br>
&gt; <br>
&gt; -host:<br>
&gt;=C2=A0 =C2=A0allows the guest to communicate with other guests in host =
mode<br>
&gt; <br>
&gt; -bridged:<br>
&gt;=C2=A0 =C2=A0bridges the guest with a physical network interface<br>
&gt; <br>
&gt; Separate netdev for each vmnet mode was created because they use quite=
<br>
&gt; different settings, especially since macOS 11.0 when vmnet.framework<b=
r>
&gt; gets a lot of updates.<br>
&gt; <br>
&gt; Not sure that I use qemu_mutex_lock_iothread() and<br>
&gt; qemu_mutex_unlock_iothread() in correct way while sending packet<br>
&gt; from vmnet interface to QEMU. I&#39;ll be happy to receive<br>
&gt; recomendations how to make this thing better if I done sth wrong.<br>
&gt; <br>
&gt; Also vmnet.framework requires com.apple.vm.networking entitlement to<b=
r>
&gt; run without root priveledges. Ad-hoc signing does not fit there,<br>
&gt; so I didn&#39;t touch anything related to signing. As a result we shou=
ld<br>
&gt; run qemu-system by a priviledged user:<br>
&gt; `$ sudo qemu-system-x86_64 -nic vmnet-shared`<br>
&gt; otherwise vmnet fails with &#39;general failure&#39;.<br>
&gt; <br>
&gt; But in any way it seems working now,<br>
&gt; I tested it within qemu-system-x86-64 on macOS 10.15.7 host, with nic<=
br>
&gt; models:<br>
&gt; - e1000-82545em<br>
&gt; - virtio-net-pci<br>
&gt; <br>
&gt; and having such guests:<br>
&gt; - macOS 10.15.7<br>
&gt; - Ubuntu Bionic (server cloudimg) <br>
&gt; <br>
<br>
Hi Vladislav,<br>
<br>
I appreciate the efforts and I&#39;m sorry I didn&#39;t look into it yet, l=
ack<br>
of time :(<br>
<br>
To all: earlier this year another series was sent by Phillip Tennen to<br>
add vmnet.framework and some comments were provided:<br>
<a href=3D"https://mail.gnu.org/archive/html/qemu-devel/2021-02/msg05874.ht=
ml" rel=3D"noreferrer" target=3D"_blank">https://mail.gnu.org/archive/html/=
qemu-devel/2021-02/msg05874.html</a><br>
<br>
I&#39;m not sure how to proceed with arbitration which of the series is<br>
preferred. FIFO or LIFO?<br>
<br>
Regards,<br>
Roman<br>
<br>
&gt; Vladislav Yaroshchuk (7):<br>
&gt;=C2=A0 =C2=A0net/vmnet: dependencies setup, initial preparations<br>
&gt;=C2=A0 =C2=A0net/vmnet: add new netdevs to qapi/net<br>
&gt;=C2=A0 =C2=A0net/vmnet: create common netdev state structure<br>
&gt;=C2=A0 =C2=A0net/vmnet: implement shared mode (vmnet-shared)<br>
&gt;=C2=A0 =C2=A0net/vmnet: implement host mode (vmnet-host)<br>
&gt;=C2=A0 =C2=A0net/vmnet: implement bridged mode (vmnet-bridged)<br>
&gt;=C2=A0 =C2=A0net/vmnet: update qemu-options.hx<br>
&gt; <br>
&gt;=C2=A0 configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 31 +++=
++<br>
&gt;=C2=A0 meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 +<b=
r>
&gt;=C2=A0 net/clients.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 11 ++<br>
&gt;=C2=A0 net/meson.build=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A07 ++<br>
&gt;=C2=A0 net/net.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 10 ++<=
br>
&gt;=C2=A0 net/vmnet-bridged.m | 123 ++++++++++++++++++<br>
&gt;=C2=A0 net/vmnet-common.m=C2=A0 | 294 +++++++++++++++++++++++++++++++++=
+++++++++++<br>
&gt;=C2=A0 net/vmnet-host.c=C2=A0 =C2=A0 |=C2=A0 93 ++++++++++++++<br>
&gt;=C2=A0 net/vmnet-shared.c=C2=A0 |=C2=A0 94 ++++++++++++++<br>
&gt;=C2=A0 net/vmnet_int.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 48 ++++++++<br>
&gt;=C2=A0 qapi/net.json=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 99 +++++++++++++=
+-<br>
&gt;=C2=A0 qemu-options.hx=C2=A0 =C2=A0 =C2=A0|=C2=A0 17 +++<br>
&gt;=C2=A0 12 files changed, 830 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 create mode 100644 net/vmnet-bridged.m<br>
&gt;=C2=A0 create mode 100644 net/vmnet-common.m<br>
&gt;=C2=A0 create mode 100644 net/vmnet-host.c<br>
&gt;=C2=A0 create mode 100644 net/vmnet-shared.c<br>
&gt;=C2=A0 create mode 100644 net/vmnet_int.h<br>
&gt; <br>
&gt; -- <br>
&gt; 2.23.0<br>
&gt; <br>
</blockquote></div>

--000000000000ccc16405c9bdb004--


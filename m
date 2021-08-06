Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E06833E2FA6
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 21:04:29 +0200 (CEST)
Received: from localhost ([::1]:34430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC58t-0000M4-Lv
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 15:04:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mC57v-00087M-56
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 15:03:27 -0400
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b]:36739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mC57t-00072E-48
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 15:03:26 -0400
Received: by mail-vs1-xe2b.google.com with SMTP id x144so5859929vsx.3
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 12:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A49d/rdDs5S5ozLvhxfOo2LMyk48GP5D4cLzXUcbAw8=;
 b=cbN6vNZ5ZC7uTEvBsDr9lVEJgPiC2LXbdiNabwgWGhWwtJnPMC6eCKDuZrFnk1ciMo
 cRx2wVzj4ALhJkfa5MQANPoR2ZbB9rjnQYxvnlDiv36OWRWOfa5AxsaUvvOcdV8qxmqG
 xIyT4VfuRbD1mWRgekNyXtdL0N9Uva37/0/PoK0UuDnW7p3hUlK+VOaIeN/xCBvDrt+l
 f3qz/WcOV33ITuzVEp8Y1bVqtg9K5aoaY5B7pIHk3ZFcehAh2lII0htU/oqQ5X+fTVJM
 nv3wgAikaWM2v9Mdd9aBsZoYWLd9+PdfSm0M0YKeVvrhqvXsDaxxM1rtcKeRcomeUkb2
 3slA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A49d/rdDs5S5ozLvhxfOo2LMyk48GP5D4cLzXUcbAw8=;
 b=iVTE35uFVDZYHCsvMgYtHABmuU+iSvG79oqKxP0teZ5Nd8/7qXFIn7lO+95NvIN/hb
 rDdk5iodgz4KgeAZxKATiF0di4C9gINBAciH4qqkMPSRUQ990cvve2iGX4HBE6vQnAQZ
 ulPPFvjzwOMUjmZcsk3b3lLv1l/b6BmhhVlIU7XNlK0sG6xVcZWROCXJzzCbwiEmpNWM
 ximL5KMgwzXr194stev4LOgf5ZDzQ29zwD6soiQicPLfVc+rK1tfaj++ZrkdCvOrYix7
 zSXyUW/gWv0CiRKdKx+tHJrOfrWwKeSUOMLoHxMrSUjvlREQEEMvsYtYzt4H0VQYn2w4
 miOg==
X-Gm-Message-State: AOAM533YCS90g9dZ2wsxX5xX7VGGbOjnrupPJCCSgNNlCk/P8uFZBsAP
 1HldC8I9aeoOxV2yqHy6uNg3vbERgw4rbdf3QKNPNMjJ+ggtYw==
X-Google-Smtp-Source: ABdhPJwgkNjKPoTVtyMI13CCGUB61jWEd7CD8M+gZApM+G0Q3oGHqulhs2VbRXdXP+V+3QmwMErdu5DCRMk6PD+DF7A=
X-Received: by 2002:a05:6102:6cb:: with SMTP id
 m11mr10386898vsg.24.1628276603440; 
 Fri, 06 Aug 2021 12:03:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210617143246.55336-1-yaroshchuk2000@gmail.com>
In-Reply-To: <20210617143246.55336-1-yaroshchuk2000@gmail.com>
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Date: Fri, 6 Aug 2021 22:03:12 +0300
Message-ID: <CADO9X9T9LVMCpJBgnwuSRN=FU5w1cvQXUCbpRvezD9jsyaO3xQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] Add vmnet.framework based network backend
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000008b52db05c8e8b004"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2b;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-vs1-xe2b.google.com
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
Cc: jasowang@redhat.com, Roman Bolshakov <r.bolshakov@yadro.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008b52db05c8e8b004
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ping
https://patchew.org/QEMU/20210617143246.55336-1-yaroshchuk2000@gmail.com/

=D1=87=D1=82, 17 =D0=B8=D1=8E=D0=BD. 2021 =D0=B3. =D0=B2 17:33, Vladislav Y=
aroshchuk <yaroshchuk2000@gmail.com
>:

> macOS provides networking API for VMs called vmnet.framework.
> I tried to add it as a network backend. All three modes are supported:
>
> -shared:
>   allows the guest to comminicate with other guests in shared mode and
>   also with external network (Internet) via NAT
>
> -host:
>   allows the guest to communicate with other guests in host mode
>
> -bridged:
>   bridges the guest with a physical network interface
>
> Separate netdev for each vmnet mode was created because they use quite
> different settings, especially since macOS 11.0 when vmnet.framework
> gets a lot of updates.
>
> Not sure that I use qemu_mutex_lock_iothread() and
> qemu_mutex_unlock_iothread() in correct way while sending packet
> from vmnet interface to QEMU. I'll be happy to receive
> recomendations how to make this thing better if I done sth wrong.
>
> Also vmnet.framework requires com.apple.vm.networking entitlement to
> run without root priveledges. Ad-hoc signing does not fit there,
> so I didn't touch anything related to signing. As a result we should
> run qemu-system by a priviledged user:
> `$ sudo qemu-system-x86_64 -nic vmnet-shared`
> otherwise vmnet fails with 'general failure'.
>
> But in any way it seems working now,
> I tested it within qemu-system-x86-64 on macOS 10.15.7 host, with nic
> models:
> - e1000-82545em
> - virtio-net-pci
>
> and having such guests:
> - macOS 10.15.7
> - Ubuntu Bionic (server cloudimg)
>
> Vladislav Yaroshchuk (7):
>   net/vmnet: dependencies setup, initial preparations
>   net/vmnet: add new netdevs to qapi/net
>   net/vmnet: create common netdev state structure
>   net/vmnet: implement shared mode (vmnet-shared)
>   net/vmnet: implement host mode (vmnet-host)
>   net/vmnet: implement bridged mode (vmnet-bridged)
>   net/vmnet: update qemu-options.hx
>
>  configure           |  31 +++++
>  meson.build         |   5 +
>  net/clients.h       |  11 ++
>  net/meson.build     |   7 ++
>  net/net.c           |  10 ++
>  net/vmnet-bridged.m | 123 ++++++++++++++++++
>  net/vmnet-common.m  | 294 ++++++++++++++++++++++++++++++++++++++++++++
>  net/vmnet-host.c    |  93 ++++++++++++++
>  net/vmnet-shared.c  |  94 ++++++++++++++
>  net/vmnet_int.h     |  48 ++++++++
>  qapi/net.json       |  99 ++++++++++++++-
>  qemu-options.hx     |  17 +++
>  12 files changed, 830 insertions(+), 2 deletions(-)
>  create mode 100644 net/vmnet-bridged.m
>  create mode 100644 net/vmnet-common.m
>  create mode 100644 net/vmnet-host.c
>  create mode 100644 net/vmnet-shared.c
>  create mode 100644 net/vmnet_int.h
>
> --
> 2.23.0
>
>

--0000000000008b52db05c8e8b004
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping<div><a href=3D"https://patchew.org/QEMU/2021061714324=
6.55336-1-yaroshchuk2000@gmail.com/">https://patchew.org/QEMU/2021061714324=
6.55336-1-yaroshchuk2000@gmail.com/</a></div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">=D1=87=D1=82, 17 =D0=B8=D1=8E=
=D0=BD. 2021 =D0=B3. =D0=B2 17:33, Vladislav Yaroshchuk &lt;<a href=3D"mail=
to:yaroshchuk2000@gmail.com">yaroshchuk2000@gmail.com</a>&gt;:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">macOS provides networking AP=
I for VMs called vmnet.framework.<br>
I tried to add it as a network backend. All three modes are supported:<br>
<br>
-shared:<br>
=C2=A0 allows the guest to comminicate with other guests in shared mode and=
<br>
=C2=A0 also with external network (Internet) via NAT<br>
<br>
-host:<br>
=C2=A0 allows the guest to communicate with other guests in host mode<br>
<br>
-bridged:<br>
=C2=A0 bridges the guest with a physical network interface<br>
<br>
Separate netdev for each vmnet mode was created because they use quite<br>
different settings, especially since macOS 11.0 when vmnet.framework<br>
gets a lot of updates.<br>
<br>
Not sure that I use qemu_mutex_lock_iothread() and<br>
qemu_mutex_unlock_iothread() in correct way while sending packet<br>
from vmnet interface to QEMU. I&#39;ll be happy to receive<br>
recomendations how to make this thing better if I done sth wrong.<br>
<br>
Also vmnet.framework requires com.apple.vm.networking entitlement to<br>
run without root priveledges. Ad-hoc signing does not fit there,<br>
so I didn&#39;t touch anything related to signing. As a result we should<br=
>
run qemu-system by a priviledged user:<br>
`$ sudo qemu-system-x86_64 -nic vmnet-shared`<br>
otherwise vmnet fails with &#39;general failure&#39;.<br>
<br>
But in any way it seems working now,<br>
I tested it within qemu-system-x86-64 on macOS 10.15.7 host, with nic<br>
models:<br>
- e1000-82545em<br>
- virtio-net-pci<br>
<br>
and having such guests:<br>
- macOS 10.15.7<br>
- Ubuntu Bionic (server cloudimg) <br>
<br>
Vladislav Yaroshchuk (7):<br>
=C2=A0 net/vmnet: dependencies setup, initial preparations<br>
=C2=A0 net/vmnet: add new netdevs to qapi/net<br>
=C2=A0 net/vmnet: create common netdev state structure<br>
=C2=A0 net/vmnet: implement shared mode (vmnet-shared)<br>
=C2=A0 net/vmnet: implement host mode (vmnet-host)<br>
=C2=A0 net/vmnet: implement bridged mode (vmnet-bridged)<br>
=C2=A0 net/vmnet: update qemu-options.hx<br>
<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 31 +++++<br=
>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 +<br>
=C2=A0net/clients.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 11 ++<br>
=C2=A0net/meson.build=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A07 ++<br>
=C2=A0net/net.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 10 ++<br>
=C2=A0net/vmnet-bridged.m | 123 ++++++++++++++++++<br>
=C2=A0net/vmnet-common.m=C2=A0 | 294 ++++++++++++++++++++++++++++++++++++++=
++++++<br>
=C2=A0net/vmnet-host.c=C2=A0 =C2=A0 |=C2=A0 93 ++++++++++++++<br>
=C2=A0net/vmnet-shared.c=C2=A0 |=C2=A0 94 ++++++++++++++<br>
=C2=A0net/vmnet_int.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 48 ++++++++<br>
=C2=A0qapi/net.json=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 99 ++++++++++++++-<br=
>
=C2=A0qemu-options.hx=C2=A0 =C2=A0 =C2=A0|=C2=A0 17 +++<br>
=C2=A012 files changed, 830 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100644 net/vmnet-bridged.m<br>
=C2=A0create mode 100644 net/vmnet-common.m<br>
=C2=A0create mode 100644 net/vmnet-host.c<br>
=C2=A0create mode 100644 net/vmnet-shared.c<br>
=C2=A0create mode 100644 net/vmnet_int.h<br>
<br>
-- <br>
2.23.0<br>
<br>
</blockquote></div>

--0000000000008b52db05c8e8b004--


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D9841AD0A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 12:34:00 +0200 (CEST)
Received: from localhost ([::1]:36160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVAQx-0008IT-6X
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 06:33:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mVAOY-00064L-Pt
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 06:31:30 -0400
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33]:42783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mVAOU-0002dP-Od
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 06:31:30 -0400
Received: by mail-vs1-xe33.google.com with SMTP id z62so21468710vsz.9
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 03:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VUmquBdqx4QqQ8q+EqdtSVMfoMrmFYlyg8NtZX56vjM=;
 b=OAS24TvD+rMtRX/g20KVU6MVB9jXElpPjrO16HMDYekaH+NyD73EITcLzubVOL6z6s
 Jeo4Rgk9n/0B1KN34zlyhA/Xe3AuUeaVQYWBB0wL0F4Fe5OXD8iqSrtJaPRg+ZPfSQdU
 a+VuIYWki8IPxepisu16U+qPIia1NsKHf9NYf+sCWA4IyuwjJAXVHsBMhLqShURkzxJX
 OukM2JsvaKIjYYy99a3V2FKr6EFR4J7oeTBCjx5vjaZ3cfT9XFl71pjd4NCDVUnowlHU
 OZiTh5oOArBZwg0nhVQSeL7mPAuo0dCkeIsbS1UlmqnJgPDwPsJIcCI8uamdq+ZaqVc+
 wRyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VUmquBdqx4QqQ8q+EqdtSVMfoMrmFYlyg8NtZX56vjM=;
 b=A4VGhiB5c+FmtfysV80lcbCpzunbm2Kh4F10JE8N7lC7j8RJONdx0ZvPXieCR/lnIB
 JprihsaaASsBbGyDbq06LewNfuwPqwRFVnppAJcQPhr3zb5mOB4CV4GSYtaIMP1Ia2LK
 cTWvjbzCaUAU8XGO+gjD4XROvwgK6PHpeXbcWQbcGnxdYNWX316FYWXzoKuFa21NAla2
 5KXGpKmO1UGIbosv9loQbH72MMW5eIsYCnJawKjp+z6p8Mua5LffW/tk5qU2FWZ3gtNV
 5eCjQ8Ts3+cWwDzr1g9P3ot+CGCIB6jRPanXvbuDyJGYzruX+sCSlwCurUG3Pk+NMPji
 WI6g==
X-Gm-Message-State: AOAM531yAS3m9i5lUxZ9KANkc02Gmna4KGfd0S5VEMtbgcCMbe4IJo4V
 t4EHqeiNlDC4dBUBwLhBHzwW+ykXoALNgsMpLsihc6Zi9PI=
X-Google-Smtp-Source: ABdhPJxqPpAsqKeQc0Pwp+TSh6+1IIQKUOWEwxelAOZARIRrFkI7IoenY2ePOSiWDe7lABmnhfu9N3JNbw0UZud09RA=
X-Received: by 2002:a67:f801:: with SMTP id l1mr4216973vso.59.1632825084488;
 Tue, 28 Sep 2021 03:31:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210831192720.33406-1-yaroshchuk2000@gmail.com>
In-Reply-To: <20210831192720.33406-1-yaroshchuk2000@gmail.com>
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Date: Tue, 28 Sep 2021 13:31:13 +0300
Message-ID: <CADO9X9Qo2ZqB1AJJgdBW6D2XZr3obyjqBKmUh0057mAGTetCYw@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] Add vmnet.framework based network backend
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000024316b05cd0bb7ab"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e33;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-vs1-xe33.google.com
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
Cc: jasowang@redhat.com, Eric Blake <eblake@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000024316b05cd0bb7ab
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ping
https://patchew.org/QEMU/20210831192720.33406-1-yaroshchuk2000@gmail.com/

=D0=B2=D1=82, 31 =D0=B0=D0=B2=D0=B3. 2021 =D0=B3. =D0=B2 22:27, Vladislav Y=
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
> v1:
>  Since v1 minor typos were fixed, patches rebased onto latest master,
> redudant
>  changes removed (small commits squashed)
>
> Vladislav Yaroshchuk (6):
>   net/vmnet: dependencies setup, initial preparations
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

--00000000000024316b05cd0bb7ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping<div><a href=3D"https://patchew.org/QEMU/2021083119272=
0.33406-1-yaroshchuk2000@gmail.com/" target=3D"_blank">https://patchew.org/=
QEMU/20210831192720.33406-1-yaroshchuk2000@gmail.com/</a>=C2=A0</div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=D0=B2=D1=82=
, 31 =D0=B0=D0=B2=D0=B3. 2021 =D0=B3. =D0=B2 22:27, Vladislav Yaroshchuk &l=
t;<a href=3D"mailto:yaroshchuk2000@gmail.com" target=3D"_blank">yaroshchuk2=
000@gmail.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">macOS provides networking API for VMs called vmnet.framework.<br>
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
v1: <br>
=C2=A0Since v1 minor typos were fixed, patches rebased onto latest master, =
redudant<br>
=C2=A0changes removed (small commits squashed)<br>
<br>
Vladislav Yaroshchuk (6):<br>
=C2=A0 net/vmnet: dependencies setup, initial preparations<br>
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
</blockquote></div></div>

--00000000000024316b05cd0bb7ab--


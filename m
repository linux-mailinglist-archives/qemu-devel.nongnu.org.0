Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5899F4821E0
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 04:39:00 +0100 (CET)
Received: from localhost ([::1]:50316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n38ks-0001Df-Qh
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 22:38:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n38cb-0002OQ-Ni
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 22:30:25 -0500
Received: from [2607:f8b0:4864:20::532] (port=43631
 helo=mail-pg1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n38cX-00037n-3Q
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 22:30:23 -0500
Received: by mail-pg1-x532.google.com with SMTP id 8so22857553pgc.10
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 19:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BeMNJGAITtrjZ8EuPGGjBv2LCb59G2gQjEaM21mIIf4=;
 b=dyrcxkImAexxdxvgjFYrZiG5G04OEdqRtFNOHmoq/z1DCmyjNqngt1J1PEdL4XS5zq
 CHaflYEjmJq3qaPQkBDRpffCpuFCW2Y5IASkjBwvDLlb1QRixQKxsGXHi2++V28UxIgG
 TDto5flpcdf/dZyzcWlYhxloqA9w0umY/7Plfc77WvzmhQvVsjEviWX0GR+eKVgFLM6q
 FxES4TrZGF6cFaLsDnT3RUYcxqlV9q2rM/JY9HZoVAH732igkhqz6Le1EdYH5hhw6xCv
 2yXE9cO+kl0+/19Ejo96kKwmx5g8dO+bV/tA2lF+F6sSH+6Q+7i+tTs7YTIwOyTUc1DM
 x/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BeMNJGAITtrjZ8EuPGGjBv2LCb59G2gQjEaM21mIIf4=;
 b=pD6RL4MloyOAkmCfXA7rZP05n1KSGY8/9S2x+jRj7oQUACIgdSG1xcWBwza/U0+UYL
 TBG9h+EccjziP8cMHZ8Djbd8hkEu/sJ3hcV8WXkM8+S4dz4oBr3Nk75RF1LBtJtSq0F4
 EOP9NLbgLFsncDELIj0PKuKChAmbT9qTJP4Ex0CzLYaLTz0XjuvVkA6JiOGoDsolTrEk
 VV/ILUAINGNxSb9J2yGOGP+bLIs7cVyYJkbrz4DAIGmUWTuHZeM/MQ8FNt+kdbjysGTA
 J5E5rCEhov8GfTQyun2CDxs7hHPgi5obx6NK1QPSTRrx4ei3U7B7vBprH7IEymN6FvqD
 07FA==
X-Gm-Message-State: AOAM5324AXHqdiqScVOuDgmU50vMjlZWSBr04tDWYdxfslEVe62DcFvp
 V3yQFsu6olWusDyyhjhf/3Lrip+2lsF0gqXycYfjxl/WY00=
X-Google-Smtp-Source: ABdhPJz5BcsD0GJHDZRCEHWXA8yYUSczMUlJ+Na+Nk7SA8t3bixIoKWHgcmuxS2fBO0cekzUZQM4FCrp0oIenVjtzK4=
X-Received: by 2002:aa7:8283:0:b0:49f:a0d0:abcf with SMTP id
 s3-20020aa78283000000b0049fa0d0abcfmr34189458pfm.70.1640921418171; Thu, 30
 Dec 2021 19:30:18 -0800 (PST)
MIME-Version: 1.0
References: <20211211104413.50524-1-yaroshchuk2000@gmail.com>
In-Reply-To: <20211211104413.50524-1-yaroshchuk2000@gmail.com>
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Date: Fri, 31 Dec 2021 06:30:07 +0300
Message-ID: <CADO9X9QGJXz8hT_SLfOqvVYYSQUM6PqS_hsO3NeiFRFVkLmJ_Q@mail.gmail.com>
Subject: Re: [PATCH v8 0/7] Add vmnet.framework based network backend
To: qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000003c0a9a05d468caee"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::532
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Markus Armbruster <armbru@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Phillip Tennen <phillip@axleos.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Howard Spoelstra <hsp.cat7@gmail.com>, Alessio Dionisi <hello@adns.io>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003c0a9a05d468caee
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ping
https://patchew.org/QEMU/20211211104413.50524-1-yaroshchuk2000@gmail.com/


=D1=81=D0=B1, 11 =D0=B4=D0=B5=D0=BA. 2021 =D0=B3. =D0=B2 13:44, Vladislav Y=
aroshchuk <yaroshchuk2000@gmail.com
>:

> macOS provides networking API for VMs called 'vmnet.framework':
> https://developer.apple.com/documentation/vmnet
>
> We can provide its support as the new QEMU network backends which
> represent three different vmnet.framework interface usage modes:
>
>   * `vmnet-shared`:
>     allows the guest to communicate with other guests in shared mode and
>     also with external network (Internet) via NAT. Has (macOS-provided)
>     DHCP server; subnet mask and IP range can be configured;
>
>   * `vmnet-host`:
>     allows the guest to communicate with other guests in host mode.
>     By default has enabled DHCP as `vmnet-shared`, but providing
>     network unique id (uuid) can make `vmnet-host` interfaces isolated
>     from each other and also disables DHCP.
>
>   * `vmnet-bridged`:
>     bridges the guest with a physical network interface.
>
> This backends cannot work on macOS Catalina 10.15 cause we use
> vmnet.framework API provided only with macOS 11 and newer. Seems
> that it is not a problem, because QEMU guarantees to work on two most
> recent versions of macOS which now are Big Sur (11) and Monterey (12).
>
> Also, we have one inconvenient restriction: vmnet.framework interfaces
> can create only privileged user:
> `$ sudo qemu-system-x86_64 -nic vmnet-shared`
>
> Attempt of `vmnet-*` netdev creation being unprivileged user fails with
> vmnet's 'general failure'.
>
> This happens because vmnet.framework requires `com.apple.vm.networking`
> entitlement which is: "restricted to developers of virtualization softwar=
e.
> To request this entitlement, contact your Apple representative." as Apple
> documentation says:
>
> https://developer.apple.com/documentation/bundleresources/entitlements/co=
m_apple_vm_networking
>
> One more note: we still have quite useful but not supported
> 'vmnet.framework' features as creating port forwarding rules, IPv6
> NAT prefix specifying and so on.
>
> Nevertheless, new backends work fine and tested within `qemu-system-x86-6=
4`
> on macOS Bir Sur 11.5.2 host with such nic models:
>   * e1000-82545em
>   * virtio-net-pci
>   * vmxnet3
>
> The guests were:
>   * macOS 10.15.7
>   * Ubuntu Bionic (server cloudimg)
>
>
> This series partially reuses patches by Phillip Tennen:
> https://patchew.org/QEMU/20210218134947.1860-1-phillip.ennen@gmail.com/
> So I included them signed-off line into one of the commit messages and
> also here.
>
> v1 -> v2:
>  Since v1 minor typos were fixed, patches rebased onto latest master,
>  redundant changes removed (small commits squashed)
> v2 -> v3:
>  - QAPI style fixes
>  - Typos fixes in comments
>  - `#include`'s updated to be in sync with recent master
> v3 -> v4:
>  - Support vmnet interfaces isolation feature
>  - Support vmnet-host network uuid setting feature
>  - Refactored sources a bit
> v4 -> v5:
>  - Missed 6.2 boat, now 7.0 candidate
>  - Fix qapi netdev descriptions and styles
>    (@subnetmask -> @subnet-mask)
>  - Support vmnet-shared IPv6 prefix setting feature
> v5 -> v6
>  - provide detailed commit messages for commits of
>    many changes
>  - rename properties @dhcpstart and @dhcpend to
>    @start-address and @end-address
>  - improve qapi documentation about isolation
>    features (@isolated, @net-uuid)
> v6 -> v7:
>  - update MAINTAINERS list
> v7 -> v8
>  - QAPI code style fixes
>
>
> Vladislav Yaroshchuk (7):
>   net/vmnet: add vmnet dependency and customizable option
>   net/vmnet: add vmnet backends to qapi/net
>   net/vmnet: implement shared mode (vmnet-shared)
>   net/vmnet: implement host mode (vmnet-host)
>   net/vmnet: implement bridged mode (vmnet-bridged)
>   net/vmnet: update qemu-options.hx
>   net/vmnet: update MAINTAINERS list
>
>  MAINTAINERS                   |   5 +
>  meson.build                   |   4 +
>  meson_options.txt             |   2 +
>  net/clients.h                 |  11 ++
>  net/meson.build               |   7 +
>  net/net.c                     |  10 ++
>  net/vmnet-bridged.m           | 111 ++++++++++++
>  net/vmnet-common.m            | 330 ++++++++++++++++++++++++++++++++++
>  net/vmnet-host.c              | 105 +++++++++++
>  net/vmnet-shared.c            |  92 ++++++++++
>  net/vmnet_int.h               |  48 +++++
>  qapi/net.json                 | 129 ++++++++++++-
>  qemu-options.hx               |  25 +++
>  scripts/meson-buildoptions.sh |   3 +
>  14 files changed, 880 insertions(+), 2 deletions(-)
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

--0000000000003c0a9a05d468caee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping=C2=A0<a href=3D"https://patchew.org/QEMU/202112111044=
13.50524-1-yaroshchuk2000@gmail.com/">https://patchew.org/QEMU/202112111044=
13.50524-1-yaroshchuk2000@gmail.com/</a><br><br></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">=D1=81=D0=B1, 11 =D0=B4=D0=
=B5=D0=BA. 2021 =D0=B3. =D0=B2 13:44, Vladislav Yaroshchuk &lt;<a href=3D"m=
ailto:yaroshchuk2000@gmail.com">yaroshchuk2000@gmail.com</a>&gt;:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">macOS provides networking=
 API for VMs called &#39;vmnet.framework&#39;:<br>
<a href=3D"https://developer.apple.com/documentation/vmnet" rel=3D"noreferr=
er" target=3D"_blank">https://developer.apple.com/documentation/vmnet</a><b=
r>
<br>
We can provide its support as the new QEMU network backends which<br>
represent three different vmnet.framework interface usage modes:<br>
<br>
=C2=A0 * `vmnet-shared`:<br>
=C2=A0 =C2=A0 allows the guest to communicate with other guests in shared m=
ode and<br>
=C2=A0 =C2=A0 also with external network (Internet) via NAT. Has (macOS-pro=
vided)<br>
=C2=A0 =C2=A0 DHCP server; subnet mask and IP range can be configured;<br>
<br>
=C2=A0 * `vmnet-host`:<br>
=C2=A0 =C2=A0 allows the guest to communicate with other guests in host mod=
e.<br>
=C2=A0 =C2=A0 By default has enabled DHCP as `vmnet-shared`, but providing<=
br>
=C2=A0 =C2=A0 network unique id (uuid) can make `vmnet-host` interfaces iso=
lated<br>
=C2=A0 =C2=A0 from each other and also disables DHCP.<br>
<br>
=C2=A0 * `vmnet-bridged`:<br>
=C2=A0 =C2=A0 bridges the guest with a physical network interface.<br>
<br>
This backends cannot work on macOS Catalina 10.15 cause we use<br>
vmnet.framework API provided only with macOS 11 and newer. Seems<br>
that it is not a problem, because QEMU guarantees to work on two most<br>
recent versions of macOS which now are Big Sur (11) and Monterey (12).<br>
<br>
Also, we have one inconvenient restriction: vmnet.framework interfaces<br>
can create only privileged user:<br>
`$ sudo qemu-system-x86_64 -nic vmnet-shared`<br>
<br>
Attempt of `vmnet-*` netdev creation being unprivileged user fails with<br>
vmnet&#39;s &#39;general failure&#39;.<br>
<br>
This happens because vmnet.framework requires `com.apple.vm.networking`<br>
entitlement which is: &quot;restricted to developers of virtualization soft=
ware.<br>
To request this entitlement, contact your Apple representative.&quot; as Ap=
ple<br>
documentation says:<br>
<a href=3D"https://developer.apple.com/documentation/bundleresources/entitl=
ements/com_apple_vm_networking" rel=3D"noreferrer" target=3D"_blank">https:=
//developer.apple.com/documentation/bundleresources/entitlements/com_apple_=
vm_networking</a><br>
<br>
One more note: we still have quite useful but not supported<br>
&#39;vmnet.framework&#39; features as creating port forwarding rules, IPv6<=
br>
NAT prefix specifying and so on.<br>
<br>
Nevertheless, new backends work fine and tested within `qemu-system-x86-64`=
<br>
on macOS Bir Sur 11.5.2 host with such nic models:<br>
=C2=A0 * e1000-82545em<br>
=C2=A0 * virtio-net-pci<br>
=C2=A0 * vmxnet3<br>
<br>
The guests were:<br>
=C2=A0 * macOS 10.15.7<br>
=C2=A0 * Ubuntu Bionic (server cloudimg)<br>
<br>
<br>
This series partially reuses patches by Phillip Tennen:<br>
<a href=3D"https://patchew.org/QEMU/20210218134947.1860-1-phillip.ennen@gma=
il.com/" rel=3D"noreferrer" target=3D"_blank">https://patchew.org/QEMU/2021=
0218134947.1860-1-phillip.ennen@gmail.com/</a><br>
So I included them signed-off line into one of the commit messages and<br>
also here.<br>
<br>
v1 -&gt; v2:<br>
=C2=A0Since v1 minor typos were fixed, patches rebased onto latest master,<=
br>
=C2=A0redundant changes removed (small commits squashed)<br>
v2 -&gt; v3:<br>
=C2=A0- QAPI style fixes<br>
=C2=A0- Typos fixes in comments<br>
=C2=A0- `#include`&#39;s updated to be in sync with recent master<br>
v3 -&gt; v4:<br>
=C2=A0- Support vmnet interfaces isolation feature<br>
=C2=A0- Support vmnet-host network uuid setting feature<br>
=C2=A0- Refactored sources a bit<br>
v4 -&gt; v5:<br>
=C2=A0- Missed 6.2 boat, now 7.0 candidate<br>
=C2=A0- Fix qapi netdev descriptions and styles<br>
=C2=A0 =C2=A0(@subnetmask -&gt; @subnet-mask)<br>
=C2=A0- Support vmnet-shared IPv6 prefix setting feature<br>
v5 -&gt; v6<br>
=C2=A0- provide detailed commit messages for commits of<br>
=C2=A0 =C2=A0many changes<br>
=C2=A0- rename properties @dhcpstart and @dhcpend to<br>
=C2=A0 =C2=A0@start-address and @end-address<br>
=C2=A0- improve qapi documentation about isolation<br>
=C2=A0 =C2=A0features (@isolated, @net-uuid)<br>
v6 -&gt; v7:<br>
=C2=A0- update MAINTAINERS list<br>
v7 -&gt; v8<br>
=C2=A0- QAPI code style fixes<br>
<br>
<br>
Vladislav Yaroshchuk (7):<br>
=C2=A0 net/vmnet: add vmnet dependency and customizable option<br>
=C2=A0 net/vmnet: add vmnet backends to qapi/net<br>
=C2=A0 net/vmnet: implement shared mode (vmnet-shared)<br>
=C2=A0 net/vmnet: implement host mode (vmnet-host)<br>
=C2=A0 net/vmnet: implement bridged mode (vmnet-bridged)<br>
=C2=A0 net/vmnet: update qemu-options.hx<br>
=C2=A0 net/vmnet: update MAINTAINERS list<br>
<br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A05 +<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A04 +<br>
=C2=A0meson_options.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A02 +<br>
=C2=A0net/clients.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 11 ++<br>
=C2=A0net/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A07 +<br>
=C2=A0net/net.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 10 ++<br>
=C2=A0net/vmnet-bridged.m=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 111 +++=
+++++++++<br>
=C2=A0net/vmnet-common.m=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 330 +++=
+++++++++++++++++++++++++++++++<br>
=C2=A0net/vmnet-host.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10=
5 +++++++++++<br>
=C2=A0net/vmnet-shared.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 9=
2 ++++++++++<br>
=C2=A0net/vmnet_int.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 48 +++++<br>
=C2=A0qapi/net.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 129 ++++++++++++-<br>
=C2=A0qemu-options.hx=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 25 +++<br>
=C2=A0scripts/meson-buildoptions.sh |=C2=A0 =C2=A03 +<br>
=C2=A014 files changed, 880 insertions(+), 2 deletions(-)<br>
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

--0000000000003c0a9a05d468caee--


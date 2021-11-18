Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 135FC4561B6
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 18:44:44 +0100 (CET)
Received: from localhost ([::1]:59776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnlSj-0004A8-W8
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 12:44:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mnlQt-0003V3-EE
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 12:42:47 -0500
Received: from [2607:f8b0:4864:20::92c] (port=33414
 helo=mail-ua1-x92c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mnlQq-0001jO-3s
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 12:42:47 -0500
Received: by mail-ua1-x92c.google.com with SMTP id b17so15549821uas.0
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 09:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4fDDHnex9mDycSF1EZ/UFHCwjSCwUYPWqZsHlwJo1Ug=;
 b=NOXdtlmQZB6TXceSKZAlHD2Ehp9BneXNEK0QznF3bFn5JM38+sK7A6NqRlyR7YFg2h
 +XMG1u1mgfPfYIdUvOQMiL3bj8AngraOiDed6rrSydpxJUmR6kDozGt+qqb1ZWb+6g5+
 f7nKDgCsdNeEuZ5YfIZv35xp1nLrKyEilpNktYg3eRR6kSb0fCiLOtAcf7wsqlW+V5oP
 y6Wd1yhKSPHXkGoTRpV9tel7lG2HBjOr/ggui059ZTPxWrnpQAEtZ3c+1zgAt1ldp9Zp
 tjLM8VfGuC84CdKg7DbNIskJeYRDWy/xzxh71gak+niiaELOL87t9gX5RxVHt+bztoll
 XJqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4fDDHnex9mDycSF1EZ/UFHCwjSCwUYPWqZsHlwJo1Ug=;
 b=wbnkksMZoZcocIKZJrXcBJIC57mYqqAPXBmzOASYAvmfRe+g8g7DSSs4mOj+e+ag7G
 K5FgldZBouRNk4cILt2puI+wrYbTzfgBa7WIuY9qpX0VJ+LA/lx/6mjNcNTPp7LJItZb
 fzJSqqJTBuLkHLGg3qwj5FRjL7fl8kXYVAAqa3FvjAfWnG7D2SrM/iHySCs/GJvQXjaJ
 ofq9qcTYVf0/jVhECQIkIBasErT4Hj77G4sU6u2fQmLSvYxlgmRlHmtEsDMmgDOCLk+Q
 wHcrpIMfn5LtZhzcOl/YhyIuR7P5Z44G348T7zr2zCoEbfXqR2ZQFjuFO0M8kf9Wluab
 zPnA==
X-Gm-Message-State: AOAM531JTaS/7AB9jg1pKvbhNZ0sOSz/XrFBUlhjq01ncn59xSZpV05b
 3b5dFY+CwX0ruvXmmQetiiE4DyzdRW7XinXjivc=
X-Google-Smtp-Source: ABdhPJzDbZmPvRvKFvTiwEtbrZXKjg8EDgG0eyLtsU743J8w9FKk5tFdlm1JgHcFqvQSy4pQxqNlid2BZ0KTX0k4p8Y=
X-Received: by 2002:a05:6102:6c9:: with SMTP id
 m9mr84836984vsg.32.1637257362940; 
 Thu, 18 Nov 2021 09:42:42 -0800 (PST)
MIME-Version: 1.0
References: <20211112091414.34223-1-yaroshchuk2000@gmail.com>
 <CACGkMEuiXy+OhGxq0aR=f0HuvFAbN427m=HL035WuJLsOsGpSg@mail.gmail.com>
 <CADO9X9Rqcn_Bg=pg=14Y=rxXV6AniPAfPTfvHW9=NrXTpjo1oQ@mail.gmail.com>
 <CACGkMEtRg6SmSYm3TH5zc-VWUSKf=n9GKtV9VbVchrE1j-osDA@mail.gmail.com>
 <CADO9X9TXGvPi6DF2gSgaM+=buJCiD-P-4_O8vPfusXG8AGYouA@mail.gmail.com>
 <CACGkMEuSV8d0Hw-SrPGhk+HkwWLhH_x_MF-q5G8quUe_W9a5gw@mail.gmail.com>
In-Reply-To: <CACGkMEuSV8d0Hw-SrPGhk+HkwWLhH_x_MF-q5G8quUe_W9a5gw@mail.gmail.com>
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Date: Thu, 18 Nov 2021 20:42:32 +0300
Message-ID: <CADO9X9Rh1bkaPnJZvmwfpgnWB_goQGYsb+gpg5iTqL85C1dP7Q@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] Add vmnet.framework based network backend
To: Jason Wang <jasowang@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000086267205d113af7e"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-ua1-x92c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: phillip.ennen@gmail.com, qemu-devel <qemu-devel@nongnu.org>, "Armbruster,
 Markus" <armbru@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Phillip Tennen <phillip@axleos.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Howard Spoelstra <hsp.cat7@gmail.com>, Alessio Dionisi <hello@adns.io>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000086267205d113af7e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 17 =D0=BD=D0=BE=D1=8F=D0=B1. 2021 =D0=B3. =D0=B2 09:10, Jason=
 Wang <jasowang@redhat.com>:

> On Tue, Nov 16, 2021 at 11:30 PM Vladislav Yaroshchuk
> <yaroshchuk2000@gmail.com> wrote:
> >
> >
> >
> > =D0=B2=D1=82, 16 =D0=BD=D0=BE=D1=8F=D0=B1. 2021 =D0=B3. =D0=B2 10:23, J=
ason Wang <jasowang@redhat.com>:
> >>
> >> On Mon, Nov 15, 2021 at 6:45 PM Vladislav Yaroshchuk
> >> <yaroshchuk2000@gmail.com> wrote:
> >> >
> >> >
> >> >
> >> > =D0=BF=D0=BD, 15 =D0=BD=D0=BE=D1=8F=D0=B1. 2021 =D0=B3. =D0=B2 07:53=
, Jason Wang <jasowang@redhat.com>:
> >> >>
> >> >> On Fri, Nov 12, 2021 at 5:14 PM Vladislav Yaroshchuk
> >> >> <yaroshchuk2000@gmail.com> wrote:
> >> >> >
> >> >> > macOS provides networking API for VMs called 'vmnet.framework':
> >> >> > https://developer.apple.com/documentation/vmnet
> >> >> >
> >> >> > We can provide its support as the new QEMU network backends which
> >> >> > represent three different vmnet.framework interface usage modes:
> >> >> >
> >> >> >   * `vmnet-shared`:
> >> >> >     allows the guest to communicate with other guests in shared
> mode and
> >> >> >     also with external network (Internet) via NAT. Has
> (macOS-provided)
> >> >> >     DHCP server; subnet mask and IP range can be configured;
> >> >> >
> >> >> >   * `vmnet-host`:
> >> >> >     allows the guest to communicate with other guests in host mod=
e.
> >> >> >     By default has enabled DHCP as `vmnet-shared`, but providing
> >> >> >     network unique id (uuid) can make `vmnet-host` interfaces
> isolated
> >> >> >     from each other and also disables DHCP.
> >> >> >
> >> >> >   * `vmnet-bridged`:
> >> >> >     bridges the guest with a physical network interface.
> >> >> >
> >> >> > This backends cannot work on macOS Catalina 10.15 cause we use
> >> >> > vmnet.framework API provided only with macOS 11 and newer. Seems
> >> >> > that it is not a problem, because QEMU guarantees to work on two
> most
> >> >> > recent versions of macOS which now are Big Sur (11) and Monterey
> (12).
> >> >> >
> >> >> > Also, we have one inconvenient restriction: vmnet.framework
> interfaces
> >> >> > can create only privileged user:
> >> >> > `$ sudo qemu-system-x86_64 -nic vmnet-shared`
> >> >> >
> >> >> > Attempt of `vmnet-*` netdev creation being unprivileged user fail=
s
> with
> >> >> > vmnet's 'general failure'.
> >> >> >
> >> >> > This happens because vmnet.framework requires
> `com.apple.vm.networking`
> >> >> > entitlement which is: "restricted to developers of virtualization
> software.
> >> >> > To request this entitlement, contact your Apple representative."
> as Apple
> >> >> > documentation says:
> >> >> >
> https://developer.apple.com/documentation/bundleresources/entitlements/co=
m_apple_vm_networking
> >> >>
> >> >> Do you know how multipass work? Looks like it uses vmnet without
> privileges.
> >> >>
> >> >
> >> > I've just checked this, and they still need root privileges. They
> have a
> >> > `multipassd` daemon which is launched as root by launchd by default.
> >> >
> >> > ```
> >> > bash-5.1$ ps axo ruser,ruid,comm | grep multipass
> >> > root                 0 /Library/Application
> Support/com.canonical.multipass/bin/multipassd
> >> > root                 0 /Library/Application
> Support/com.canonical.multipass/bin/hyperkit
> >> > ```
> >> >
> >> > That's the reason why it's required to 'enter a password' while
> multipass installation:
> >> > it creates launchd plist (kinda launch rule) and places it to
> /Library/LaunchDaemons/,
> >> > which can be done only with root privileges.
> >> >
> >> > ```
> >> > bash-5.1$ ll /Library/LaunchDaemons | grep multipass
> >> > -rw-r--r--   1 root  wheel   1.1K 15 Nov 12:47
> com.canonical.multipassd.plist
> >> > ```
> >> >
> >> > And after this launchd launches this multipassd daemon as root every
> boot.
> >> >
> >> > So an unprivileged user can launch a multipass VM instance, but
> actually the
> >> > `hyperkit` process which interacts with vmnet is gonna be launched b=
y
> multipassd
> >> > running as root.
> >>
> >> I wonder how it passes the vmnet object to qemu? Nothing obvious from
> >> the qemu command line that multipass launched:
> >>
> >> -nic vmnet-macos,mode=3Dshared,model=3Dvirtio-net-pci,mac=3D52:54:00:5=
2:e8:e4
> >>
> >> (But I haven't had time to check their qemu codes).
> >>
> >
> > It seems they just use QEMU with patch by Phillip Tennen:
> > https://patchew.org/QEMU/20210218134947.1860-1-phillip.ennen@gmail.com/
> >
> > In that patch he does quite the same as we in this series, the
> > difference remains in foreground: he creates one new 'vmnet-macos'
> > netdev, and uses 'mode=3Dshared' property to choose vmnet
> > operating mode. I decided to create three different netdevs instead
> > (vmnet-shared, vmnet-host, vmnet-bridged). Also I've added some
> > features related to isolation and ipv6.
>
> Ok.
>
> >
> > > I wonder how it passes the vmnet object to qemu
> > I hope I clearly described this.
>
> A silly question, how did the 'hyperkit' process pass the vmnet object to
> qemu?
>
> I think I didn't describe it very well in the previous mail.
The 'hyperkit' and QEMU are two multipass 'drivers'.

hyperkit is an independent hypervisor based on xhyve (bhyve):
https://github.com/moby/hyperkit

So there are many ways to launch multipass VMs:
* VM <-> hyperkit <-> host
* VM <-> QEMU <-> host
* VM <-> virtualbox <-> host
* etc.

https://discourse.ubuntu.com/t/announcing-the-first-release-candidate-for-a=
pple-m1-support/24445

So hyperkit doesn't pass anything to QEMU, it's a separate
hypervisor and multipass driver. But it uses vmnet backend
too, the same way as we do:
https://github.com/moby/hyperkit/blob/2f061e447e1435cdf1b9eda364cea6414f2c6=
06b/src/lib/pci_virtio_net_vmnet.c#L250

>
> >> >
> >> > tl;dr sadly, we can't interact with vmnet.framework without having
> our binary correctly
> >> > signed and being an unprivileged user. Root privileges or special
> signature with
> >> > entitlement is required.
> >>
> >> This is something similar to what happens in other OS. E.g for the tap
> >> backend, it can't be created without privileges. So qemu allows to:
> >>
> >> 1) the TAP to be created by privileged program like libvirt, and its
> >> fd could be passed to qemu via SCM_RIGHTS
> >> 2) run a set-uid helper to create and config TAP
> >>
> >> This is something we need to consider now or in the future probably.
> >>
> >
> > Seems we can do nothing with this if we have qemu-bundled &
> > direct vmnet.framework interaction, it always requires privileges
> > or entitlement.
> > The workaround can be moving vmnet-related things to
> > another helper binary running with privileges, and usage of
> > this helper somewhere between qemu and vmnet.
>
> Yes, that's my point.
>
> >
> > I think for now it's applicable to leave it as is, having qemu
> > that requires privileges for vmnet.framework usage.
>
> Right, but we need to consider it for the future.
>
> Btw, if you wish, you can list yourself as the maintainer for this backen=
d.
>
>
Ok, thank you! Let me do this in the next patch version, after
we finish our discussion and I fix all the issues you pointed
in your review.


> Thanks
>
> >
> >>
> >> Thanks
> >>
> >> >
> >> >
> >> >> Thanks
> >> >>
> >> >
> >> > Thank you for your review, I will check it this week and reply as
> soon as possible.
> >> >
> >> >>
> >> >> >
> >> >> > One more note: we still have quite useful but not supported
> >> >> > 'vmnet.framework' features as creating port forwarding rules, IPv=
6
> >> >> > NAT prefix specifying and so on.
> >> >> >
> >> >> > Nevertheless, new backends work fine and tested within
> `qemu-system-x86-64`
> >> >> > on macOS Bir Sur 11.5.2 host with such nic models:
> >> >> >   * e1000-82545em
> >> >> >   * virtio-net-pci
> >> >> >   * vmxnet3
> >> >> >
> >> >> > The guests were:
> >> >> >   * macOS 10.15.7
> >> >> >   * Ubuntu Bionic (server cloudimg)
> >> >> >
> >> >> >
> >> >> > This series partially reuses patches by Phillip Tennen:
> >> >> >
> https://patchew.org/QEMU/20210218134947.1860-1-phillip.ennen@gmail.com/
> >> >> > So I included his signed-off line into one of the commit messages
> and
> >> >> > also here.
> >> >> >
> >> >> > v1 -> v2:
> >> >> >  Since v1 minor typos were fixed, patches rebased onto latest
> master,
> >> >> >  redundant changes removed (small commits squashed)
> >> >> >
> >> >> > v2 -> v3:
> >> >> >  - QAPI style fixes
> >> >> >  - Typos fixes in comments
> >> >> >  - `#include`'s updated to be in sync with recent master
> >> >> > v3 -> v4:
> >> >> >  - Support vmnet interfaces isolation feature
> >> >> >  - Support vmnet-host network uuid setting feature
> >> >> >  - Refactored sources a bit
> >> >> > v4 -> v5:
> >> >> >  - Missed 6.2 boat, now 7.0 candidate
> >> >> >  - Fix qapi netdev descriptions and styles
> >> >> >    (@subnetmask -> @subnet-mask)
> >> >> >  - Support vmnet-shared IPv6 prefix setting feature
> >> >> >
> >> >> > Signed-off-by: Phillip Tennen <phillip@axleos.com>
> >> >> > Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> >> >> >
> >> >> > Vladislav Yaroshchuk (6):
> >> >> >   net/vmnet: add vmnet dependency and customizable option
> >> >> >   net/vmnet: add vmnet backends to qapi/net
> >> >> >   net/vmnet: implement shared mode (vmnet-shared)
> >> >> >   net/vmnet: implement host mode (vmnet-host)
> >> >> >   net/vmnet: implement bridged mode (vmnet-bridged)
> >> >> >   net/vmnet: update qemu-options.hx
> >> >> >
> >> >> >  meson.build                   |   4 +
> >> >> >  meson_options.txt             |   2 +
> >> >> >  net/clients.h                 |  11 ++
> >> >> >  net/meson.build               |   7 +
> >> >> >  net/net.c                     |  10 ++
> >> >> >  net/vmnet-bridged.m           | 111 ++++++++++++
> >> >> >  net/vmnet-common.m            | 325
> ++++++++++++++++++++++++++++++++++
> >> >> >  net/vmnet-host.c              | 111 ++++++++++++
> >> >> >  net/vmnet-shared.c            |  92 ++++++++++
> >> >> >  net/vmnet_int.h               |  48 +++++
> >> >> >  qapi/net.json                 | 127 ++++++++++++-
> >> >> >  qemu-options.hx               |  25 +++
> >> >> >  scripts/meson-buildoptions.sh |   3 +
> >> >> >  13 files changed, 874 insertions(+), 2 deletions(-)
> >> >> >  create mode 100644 net/vmnet-bridged.m
> >> >> >  create mode 100644 net/vmnet-common.m
> >> >> >  create mode 100644 net/vmnet-host.c
> >> >> >  create mode 100644 net/vmnet-shared.c
> >> >> >  create mode 100644 net/vmnet_int.h
> >> >> >
> >> >> > --
> >> >> > 2.23.0
> >> >> >
> >> >>
> >> >
> >> >
> >> > --
> >> > Best Regards,
> >> >
> >> > Vladislav Yaroshchuk
> >>
> >
> >
> > --
> > Best Regards,
> >
> > Vladislav Yaroshchuk
>
>

--00000000000086267205d113af7e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">=D1=81=D1=80, 17 =D0=BD=D0=BE=D1=8F=
=D0=B1. 2021 =D0=B3. =D0=B2 09:10, Jason Wang &lt;<a href=3D"mailto:jasowan=
g@redhat.com" target=3D"_blank">jasowang@redhat.com</a>&gt;:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">On Tue, Nov 16, 2021 at 11:30 =
PM Vladislav Yaroshchuk<br>
&lt;<a href=3D"mailto:yaroshchuk2000@gmail.com" target=3D"_blank">yaroshchu=
k2000@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; =D0=B2=D1=82, 16 =D0=BD=D0=BE=D1=8F=D0=B1. 2021 =D0=B3. =D0=B2 10:23, =
Jason Wang &lt;<a href=3D"mailto:jasowang@redhat.com" target=3D"_blank">jas=
owang@redhat.com</a>&gt;:<br>
&gt;&gt;<br>
&gt;&gt; On Mon, Nov 15, 2021 at 6:45 PM Vladislav Yaroshchuk<br>
&gt;&gt; &lt;<a href=3D"mailto:yaroshchuk2000@gmail.com" target=3D"_blank">=
yaroshchuk2000@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; =D0=BF=D0=BD, 15 =D0=BD=D0=BE=D1=8F=D0=B1. 2021 =D0=B3. =D0=
=B2 07:53, Jason Wang &lt;<a href=3D"mailto:jasowang@redhat.com" target=3D"=
_blank">jasowang@redhat.com</a>&gt;:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; On Fri, Nov 12, 2021 at 5:14 PM Vladislav Yaroshchuk<br>
&gt;&gt; &gt;&gt; &lt;<a href=3D"mailto:yaroshchuk2000@gmail.com" target=3D=
"_blank">yaroshchuk2000@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; macOS provides networking API for VMs called &#39;vm=
net.framework&#39;:<br>
&gt;&gt; &gt;&gt; &gt; <a href=3D"https://developer.apple.com/documentation=
/vmnet" rel=3D"noreferrer" target=3D"_blank">https://developer.apple.com/do=
cumentation/vmnet</a><br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; We can provide its support as the new QEMU network b=
ackends which<br>
&gt;&gt; &gt;&gt; &gt; represent three different vmnet.framework interface =
usage modes:<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0* `vmnet-shared`:<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0allows the guest to communicate w=
ith other guests in shared mode and<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0also with external network (Inter=
net) via NAT. Has (macOS-provided)<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0DHCP server; subnet mask and IP r=
ange can be configured;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0* `vmnet-host`:<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0allows the guest to communicate w=
ith other guests in host mode.<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0By default has enabled DHCP as `v=
mnet-shared`, but providing<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0network unique id (uuid) can make=
 `vmnet-host` interfaces isolated<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0from each other and also disables=
 DHCP.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0* `vmnet-bridged`:<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0bridges the guest with a physical=
 network interface.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; This backends cannot work on macOS Catalina 10.15 ca=
use we use<br>
&gt;&gt; &gt;&gt; &gt; vmnet.framework API provided only with macOS 11 and =
newer. Seems<br>
&gt;&gt; &gt;&gt; &gt; that it is not a problem, because QEMU guarantees to=
 work on two most<br>
&gt;&gt; &gt;&gt; &gt; recent versions of macOS which now are Big Sur (11) =
and Monterey (12).<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Also, we have one inconvenient restriction: vmnet.fr=
amework interfaces<br>
&gt;&gt; &gt;&gt; &gt; can create only privileged user:<br>
&gt;&gt; &gt;&gt; &gt; `$ sudo qemu-system-x86_64 -nic vmnet-shared`<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Attempt of `vmnet-*` netdev creation being unprivile=
ged user fails with<br>
&gt;&gt; &gt;&gt; &gt; vmnet&#39;s &#39;general failure&#39;.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; This happens because vmnet.framework requires `com.a=
pple.vm.networking`<br>
&gt;&gt; &gt;&gt; &gt; entitlement which is: &quot;restricted to developers=
 of virtualization software.<br>
&gt;&gt; &gt;&gt; &gt; To request this entitlement, contact your Apple repr=
esentative.&quot; as Apple<br>
&gt;&gt; &gt;&gt; &gt; documentation says:<br>
&gt;&gt; &gt;&gt; &gt; <a href=3D"https://developer.apple.com/documentation=
/bundleresources/entitlements/com_apple_vm_networking" rel=3D"noreferrer" t=
arget=3D"_blank">https://developer.apple.com/documentation/bundleresources/=
entitlements/com_apple_vm_networking</a><br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Do you know how multipass work? Looks like it uses vmnet =
without privileges.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I&#39;ve just checked this, and they still need root privileg=
es. They have a<br>
&gt;&gt; &gt; `multipassd` daemon which is launched as root by launchd by d=
efault.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; ```<br>
&gt;&gt; &gt; bash-5.1$ ps axo ruser,ruid,comm | grep multipass<br>
&gt;&gt; &gt; root=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00 /Library/Application Support/com.canonical.multipass/bin/multipassd=
<br>
&gt;&gt; &gt; root=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00 /Library/Application Support/com.canonical.multipass/bin/hyperkit<b=
r>
&gt;&gt; &gt; ```<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; That&#39;s the reason why it&#39;s required to &#39;enter a p=
assword&#39; while multipass installation:<br>
&gt;&gt; &gt; it creates launchd plist (kinda launch rule) and places it to=
 /Library/LaunchDaemons/,<br>
&gt;&gt; &gt; which can be done only with root privileges.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; ```<br>
&gt;&gt; &gt; bash-5.1$ ll /Library/LaunchDaemons | grep multipass<br>
&gt;&gt; &gt; -rw-r--r--=C2=A0 =C2=A01 root=C2=A0 wheel=C2=A0 =C2=A01.1K 15=
 Nov 12:47 com.canonical.multipassd.plist<br>
&gt;&gt; &gt; ```<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; And after this launchd launches this multipassd daemon as roo=
t every boot.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; So an unprivileged user can launch a multipass VM instance, b=
ut actually the<br>
&gt;&gt; &gt; `hyperkit` process which interacts with vmnet is gonna be lau=
nched by multipassd<br>
&gt;&gt; &gt; running as root.<br>
&gt;&gt;<br>
&gt;&gt; I wonder how it passes the vmnet object to qemu? Nothing obvious f=
rom<br>
&gt;&gt; the qemu command line that multipass launched:<br>
&gt;&gt;<br>
&gt;&gt; -nic vmnet-macos,mode=3Dshared,model=3Dvirtio-net-pci,mac=3D52:54:=
00:52:e8:e4<br>
&gt;&gt;<br>
&gt;&gt; (But I haven&#39;t had time to check their qemu codes).<br>
&gt;&gt;<br>
&gt;<br>
&gt; It seems they just use QEMU with patch by Phillip Tennen:<br>
&gt; <a href=3D"https://patchew.org/QEMU/20210218134947.1860-1-phillip.enne=
n@gmail.com/" rel=3D"noreferrer" target=3D"_blank">https://patchew.org/QEMU=
/20210218134947.1860-1-phillip.ennen@gmail.com/</a><br>
&gt;<br>
&gt; In that patch he does quite the same as we in this series, the<br>
&gt; difference remains in foreground: he creates one new &#39;vmnet-macos&=
#39;<br>
&gt; netdev, and uses &#39;mode=3Dshared&#39; property to choose vmnet<br>
&gt; operating mode. I decided to create three different netdevs instead<br=
>
&gt; (vmnet-shared, vmnet-host, vmnet-bridged). Also I&#39;ve added some<br=
>
&gt; features related to isolation and ipv6.<br>
<br>
Ok.<br>
<br>
&gt;<br>
&gt; &gt; I wonder how it passes the vmnet object to qemu<br>
&gt; I hope I clearly described this.<br>
<br>
A silly question, how did the &#39;hyperkit&#39; process pass the vmnet obj=
ect to qemu?<br>
<br></blockquote><div>I think I didn&#39;t describe it very well in the pre=
vious mail.=C2=A0</div><div>The &#39;hyperkit&#39; and QEMU are two multipa=
ss &#39;drivers&#39;.</div><div><br></div><div>hyperkit is an independent h=
ypervisor based on xhyve (bhyve):</div><div><a href=3D"https://github.com/m=
oby/hyperkit" target=3D"_blank">https://github.com/moby/hyperkit</a><br></d=
iv><div><br></div><div>So there are many ways to launch multipass VMs:</div=
><div>* VM &lt;-&gt; hyperkit &lt;-&gt; host</div><div>* VM &lt;-&gt; QEMU =
&lt;-&gt; host</div><div>* VM &lt;-&gt; virtualbox &lt;-&gt; host<br></div>=
<div>* etc.</div><div><br></div><div><a href=3D"https://discourse.ubuntu.co=
m/t/announcing-the-first-release-candidate-for-apple-m1-support/24445" targ=
et=3D"_blank">https://discourse.ubuntu.com/t/announcing-the-first-release-c=
andidate-for-apple-m1-support/24445</a></div><div><br></div><div>So hyperki=
t=C2=A0doesn&#39;t pass anything to QEMU, it&#39;s a separate=C2=A0</div><d=
iv>hypervisor and multipass driver. But it uses vmnet backend</div><div>too=
, the same way as we do:</div><div><a href=3D"https://github.com/moby/hyper=
kit/blob/2f061e447e1435cdf1b9eda364cea6414f2c606b/src/lib/pci_virtio_net_vm=
net.c#L250" target=3D"_blank">https://github.com/moby/hyperkit/blob/2f061e4=
47e1435cdf1b9eda364cea6414f2c606b/src/lib/pci_virtio_net_vmnet.c#L250</a><b=
r></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; tl;dr sadly, we can&#39;t interact with vmnet.framework witho=
ut having our binary correctly<br>
&gt;&gt; &gt; signed and being an unprivileged user. Root privileges or spe=
cial signature with<br>
&gt;&gt; &gt; entitlement is required.<br>
&gt;&gt;<br>
&gt;&gt; This is something similar to what happens in other OS. E.g for the=
 tap<br>
&gt;&gt; backend, it can&#39;t be created without privileges. So qemu allow=
s to:<br>
&gt;&gt;<br>
&gt;&gt; 1) the TAP to be created by privileged program like libvirt, and i=
ts<br>
&gt;&gt; fd could be passed to qemu via SCM_RIGHTS<br>
&gt;&gt; 2) run a set-uid helper to create and config TAP<br>
&gt;&gt;<br>
&gt;&gt; This is something we need to consider now or in the future probabl=
y.<br>
&gt;&gt;<br>
&gt;<br>
&gt; Seems we can do nothing with this if we have qemu-bundled &amp;<br>
&gt; direct vmnet.framework interaction, it always requires privileges<br>
&gt; or entitlement.<br>
&gt; The workaround can be moving vmnet-related things to<br>
&gt; another helper binary running with privileges, and usage of<br>
&gt; this helper somewhere between qemu and vmnet.<br>
<br>
Yes, that&#39;s my point.<br>
<br>
&gt;<br>
&gt; I think for now it&#39;s applicable to leave it as is, having qemu<br>
&gt; that requires privileges for vmnet.framework usage.<br>
<br>
Right, but we need to consider it for the future.<br>
<br>
Btw, if you wish, you can list yourself as the maintainer for this backend.=
<br>
<br></blockquote><div><br></div><div>Ok, thank you! Let me do this in the n=
ext patch version, after</div><div>we finish our discussion and I fix all t=
he issues you pointed=C2=A0</div><div>in your review.</div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
Thanks<br>
<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; Thanks<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; Thanks<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Thank you for your review, I will check it this week and repl=
y as soon as possible.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; One more note: we still have quite useful but not su=
pported<br>
&gt;&gt; &gt;&gt; &gt; &#39;vmnet.framework&#39; features as creating port =
forwarding rules, IPv6<br>
&gt;&gt; &gt;&gt; &gt; NAT prefix specifying and so on.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Nevertheless, new backends work fine and tested with=
in `qemu-system-x86-64`<br>
&gt;&gt; &gt;&gt; &gt; on macOS Bir Sur 11.5.2 host with such nic models:<b=
r>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0* e1000-82545em<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0* virtio-net-pci<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0* vmxnet3<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; The guests were:<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0* macOS 10.15.7<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0* Ubuntu Bionic (server cloudimg)<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; This series partially reuses patches by Phillip Tenn=
en:<br>
&gt;&gt; &gt;&gt; &gt; <a href=3D"https://patchew.org/QEMU/20210218134947.1=
860-1-phillip.ennen@gmail.com/" rel=3D"noreferrer" target=3D"_blank">https:=
//patchew.org/QEMU/20210218134947.1860-1-phillip.ennen@gmail.com/</a><br>
&gt;&gt; &gt;&gt; &gt; So I included his signed-off line into one of the co=
mmit messages and<br>
&gt;&gt; &gt;&gt; &gt; also here.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; v1 -&gt; v2:<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 Since v1 minor typos were fixed, patches rebas=
ed onto latest master,<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 redundant changes removed (small commits squas=
hed)<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; v2 -&gt; v3:<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 - QAPI style fixes<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 - Typos fixes in comments<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 - `#include`&#39;s updated to be in sync with =
recent master<br>
&gt;&gt; &gt;&gt; &gt; v3 -&gt; v4:<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 - Support vmnet interfaces isolation feature<b=
r>
&gt;&gt; &gt;&gt; &gt;=C2=A0 - Support vmnet-host network uuid setting feat=
ure<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 - Refactored sources a bit<br>
&gt;&gt; &gt;&gt; &gt; v4 -&gt; v5:<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 - Missed 6.2 boat, now 7.0 candidate<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 - Fix qapi netdev descriptions and styles<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 (@subnetmask -&gt; @subnet-mask)<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 - Support vmnet-shared IPv6 prefix setting fea=
ture<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Signed-off-by: Phillip Tennen &lt;<a href=3D"mailto:=
phillip@axleos.com" target=3D"_blank">phillip@axleos.com</a>&gt;<br>
&gt;&gt; &gt;&gt; &gt; Signed-off-by: Vladislav Yaroshchuk &lt;<a href=3D"m=
ailto:yaroshchuk2000@gmail.com" target=3D"_blank">yaroshchuk2000@gmail.com<=
/a>&gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Vladislav Yaroshchuk (6):<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0net/vmnet: add vmnet dependency and cust=
omizable option<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0net/vmnet: add vmnet backends to qapi/ne=
t<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0net/vmnet: implement shared mode (vmnet-=
shared)<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0net/vmnet: implement host mode (vmnet-ho=
st)<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0net/vmnet: implement bridged mode (vmnet=
-bridged)<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0net/vmnet: update qemu-options.hx<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 meson_options.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 net/clients.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 11 ++<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 net/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A07 +<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 net/net.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 10 ++<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 net/vmnet-bridged.m=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| 111 ++++++++++++<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 net/vmnet-common.m=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 325 ++++++++++++++++++++++++++++++++++<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 net/vmnet-host.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 111 ++++++++++++<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 net/vmnet-shared.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 92 ++++++++++<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 net/vmnet_int.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 48 +++++<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 qapi/net.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 127 ++++++++++++-<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 qemu-options.hx=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 25 +++<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 scripts/meson-buildoptions.sh |=C2=A0 =C2=A03 =
+<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 13 files changed, 874 insertions(+), 2 deletio=
ns(-)<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 create mode 100644 net/vmnet-bridged.m<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 create mode 100644 net/vmnet-common.m<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 create mode 100644 net/vmnet-host.c<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 create mode 100644 net/vmnet-shared.c<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 create mode 100644 net/vmnet_int.h<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; --<br>
&gt;&gt; &gt;&gt; &gt; 2.23.0<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; Best Regards,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Vladislav Yaroshchuk<br>
&gt;&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Best Regards,<br>
&gt;<br>
&gt; Vladislav Yaroshchuk<br>
<br>
</blockquote></div></div>

--00000000000086267205d113af7e--


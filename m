Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E474535D3
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 16:32:50 +0100 (CET)
Received: from localhost ([::1]:52018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn0S2-0004Vi-0V
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 10:32:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mn0Pd-0002ZL-Tt
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 10:30:23 -0500
Received: from [2607:f8b0:4864:20::a30] (port=45978
 helo=mail-vk1-xa30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mn0PU-0004Mp-Pn
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 10:30:21 -0500
Received: by mail-vk1-xa30.google.com with SMTP id m19so6677703vko.12
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 07:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=pSvoSODZ/B5KHETzU4C+FuASPBfoi/jo3l5SYx9ueOo=;
 b=k7ydIQtXS2o+jFST+0eWDgW35rD+imLEdHDXKwBzG2IFdj78V6DMo88j9rz+EbzefJ
 m4C1tlXnRjvClkA+Lif4vH985MgNUscUtgLoX6iWPu/ICftqs87Xl4wnFIzbz8AV9nju
 1aMIL53mYTxCYGFQ7uTNhXpRpA3rI1PqXeWaK0/bFjE09OATzdfp8kH6G1F55pJBYVtz
 O1eLYeyr4fSWF4T5mMH7PtuAJUEG7wx6GkoFekiX+fTIrFU8cbXOSBn6FEnpJiwVjiul
 AXYbcn4N5nLWDi7DlpmP8t+qzVOB1WomaRmPn3RtO4j99OhByW0GkCsH1QgLlD8cTXg5
 OXIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=pSvoSODZ/B5KHETzU4C+FuASPBfoi/jo3l5SYx9ueOo=;
 b=IxyNRfgwX/LfpLa6t/OUkHsKyjexQ/K0QBx3w0X7McCeCV+bOH6Q3PjYZbRC9ybY3x
 4Gfsas3sB5xm43UKBfTC45k5Yxq4DSGI+XcF01jr3qLyjBw7Xf9mbKK9IrzUz2osPp3b
 y3clN+Ji31XJJ3Zkt0+/rgqGI1M7dGRUCm+IliSm8Jc5eOMuFzBp/6jNfrZHO9oCqA/F
 rabOZ04nq/Z4bo2axW87S7CPKcutCRgW5uuQRAUvusc7jdr5nX4489QH2vfpFCQDCQYu
 9gUOi5wwNuv01ANwcS+gTx7QQ8xtCS6gQa48YSkfR3bCiEyvYtYBbxa9a8wS5xVKPT4y
 8aRg==
X-Gm-Message-State: AOAM532E7kOOxWrK2pt2rMRlthl8kspbz2Ttr/JY4hgWRWx+Brv1oGg6
 b0ImkAJTGONXy06SYRbGEHjGiL/TCcRl25RmiGg=
X-Google-Smtp-Source: ABdhPJxvA6y5k0+1FwWpAM1bR8dnMEakCSR/a96eENWBZH7+PwvuIMxYxCCqUeqE4gNDgP9yZzW2djBPGLC57ZuG1y4=
X-Received: by 2002:a05:6122:da1:: with SMTP id
 bc33mr44597780vkb.19.1637076610961; 
 Tue, 16 Nov 2021 07:30:10 -0800 (PST)
MIME-Version: 1.0
References: <20211112091414.34223-1-yaroshchuk2000@gmail.com>
 <CACGkMEuiXy+OhGxq0aR=f0HuvFAbN427m=HL035WuJLsOsGpSg@mail.gmail.com>
 <CADO9X9Rqcn_Bg=pg=14Y=rxXV6AniPAfPTfvHW9=NrXTpjo1oQ@mail.gmail.com>
 <CACGkMEtRg6SmSYm3TH5zc-VWUSKf=n9GKtV9VbVchrE1j-osDA@mail.gmail.com>
In-Reply-To: <CACGkMEtRg6SmSYm3TH5zc-VWUSKf=n9GKtV9VbVchrE1j-osDA@mail.gmail.com>
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Date: Tue, 16 Nov 2021 18:29:59 +0300
Message-ID: <CADO9X9TXGvPi6DF2gSgaM+=buJCiD-P-4_O8vPfusXG8AGYouA@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] Add vmnet.framework based network backend
To: Jason Wang <jasowang@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
 Roman Bolshakov <r.bolshakov@yadro.com>, Eric Blake <eblake@redhat.com>,
 phillip.ennen@gmail.com, 
 Phillip Tennen <phillip@axleos.com>, Akihiko Odaki <akihiko.odaki@gmail.com>, 
 "Armbruster, Markus" <armbru@redhat.com>, Howard Spoelstra <hsp.cat7@gmail.com>,
 Alessio Dionisi <hello@adns.io>
Content-Type: multipart/alternative; boundary="000000000000ddd6fc05d0e99966"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a30;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-vk1-xa30.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ddd6fc05d0e99966
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 16 =D0=BD=D0=BE=D1=8F=D0=B1. 2021 =D0=B3. =D0=B2 10:23, Jason=
 Wang <jasowang@redhat.com>:

> On Mon, Nov 15, 2021 at 6:45 PM Vladislav Yaroshchuk
> <yaroshchuk2000@gmail.com> wrote:
> >
> >
> >
> > =D0=BF=D0=BD, 15 =D0=BD=D0=BE=D1=8F=D0=B1. 2021 =D0=B3. =D0=B2 07:53, J=
ason Wang <jasowang@redhat.com>:
> >>
> >> On Fri, Nov 12, 2021 at 5:14 PM Vladislav Yaroshchuk
> >> <yaroshchuk2000@gmail.com> wrote:
> >> >
> >> > macOS provides networking API for VMs called 'vmnet.framework':
> >> > https://developer.apple.com/documentation/vmnet
> >> >
> >> > We can provide its support as the new QEMU network backends which
> >> > represent three different vmnet.framework interface usage modes:
> >> >
> >> >   * `vmnet-shared`:
> >> >     allows the guest to communicate with other guests in shared mode
> and
> >> >     also with external network (Internet) via NAT. Has
> (macOS-provided)
> >> >     DHCP server; subnet mask and IP range can be configured;
> >> >
> >> >   * `vmnet-host`:
> >> >     allows the guest to communicate with other guests in host mode.
> >> >     By default has enabled DHCP as `vmnet-shared`, but providing
> >> >     network unique id (uuid) can make `vmnet-host` interfaces isolat=
ed
> >> >     from each other and also disables DHCP.
> >> >
> >> >   * `vmnet-bridged`:
> >> >     bridges the guest with a physical network interface.
> >> >
> >> > This backends cannot work on macOS Catalina 10.15 cause we use
> >> > vmnet.framework API provided only with macOS 11 and newer. Seems
> >> > that it is not a problem, because QEMU guarantees to work on two mos=
t
> >> > recent versions of macOS which now are Big Sur (11) and Monterey (12=
).
> >> >
> >> > Also, we have one inconvenient restriction: vmnet.framework interfac=
es
> >> > can create only privileged user:
> >> > `$ sudo qemu-system-x86_64 -nic vmnet-shared`
> >> >
> >> > Attempt of `vmnet-*` netdev creation being unprivileged user fails
> with
> >> > vmnet's 'general failure'.
> >> >
> >> > This happens because vmnet.framework requires
> `com.apple.vm.networking`
> >> > entitlement which is: "restricted to developers of virtualization
> software.
> >> > To request this entitlement, contact your Apple representative." as
> Apple
> >> > documentation says:
> >> >
> https://developer.apple.com/documentation/bundleresources/entitlements/co=
m_apple_vm_networking
> >>
> >> Do you know how multipass work? Looks like it uses vmnet without
> privileges.
> >>
> >
> > I've just checked this, and they still need root privileges. They have =
a
> > `multipassd` daemon which is launched as root by launchd by default.
> >
> > ```
> > bash-5.1$ ps axo ruser,ruid,comm | grep multipass
> > root                 0 /Library/Application
> Support/com.canonical.multipass/bin/multipassd
> > root                 0 /Library/Application
> Support/com.canonical.multipass/bin/hyperkit
> > ```
> >
> > That's the reason why it's required to 'enter a password' while
> multipass installation:
> > it creates launchd plist (kinda launch rule) and places it to
> /Library/LaunchDaemons/,
> > which can be done only with root privileges.
> >
> > ```
> > bash-5.1$ ll /Library/LaunchDaemons | grep multipass
> > -rw-r--r--   1 root  wheel   1.1K 15 Nov 12:47
> com.canonical.multipassd.plist
> > ```
> >
> > And after this launchd launches this multipassd daemon as root every
> boot.
> >
> > So an unprivileged user can launch a multipass VM instance, but actuall=
y
> the
> > `hyperkit` process which interacts with vmnet is gonna be launched by
> multipassd
> > running as root.
>
> I wonder how it passes the vmnet object to qemu? Nothing obvious from
> the qemu command line that multipass launched:
>
> -nic vmnet-macos,mode=3Dshared,model=3Dvirtio-net-pci,mac=3D52:54:00:52:e=
8:e4
>
> (But I haven't had time to check their qemu codes).
>
>
It seems they just use QEMU with patch by Phillip Tennen:
https://patchew.org/QEMU/20210218134947.1860-1-phillip.ennen@gmail.com/

In that patch he does quite the same as we in this series, the
difference remains in foreground: he creates one new 'vmnet-macos'
netdev, and uses 'mode=3Dshared' property to choose vmnet
operating mode. I decided to create three different netdevs instead
(vmnet-shared, vmnet-host, vmnet-bridged). Also I've added some
features related to isolation and ipv6.

> I wonder how it passes the vmnet object to qemu
I hope I clearly described this.

>
> > tl;dr sadly, we can't interact with vmnet.framework without having our
> binary correctly
> > signed and being an unprivileged user. Root privileges or special
> signature with
> > entitlement is required.
>
> This is something similar to what happens in other OS. E.g for the tap
> backend, it can't be created without privileges. So qemu allows to:
>
> 1) the TAP to be created by privileged program like libvirt, and its
> fd could be passed to qemu via SCM_RIGHTS
> 2) run a set-uid helper to create and config TAP
>
> This is something we need to consider now or in the future probably.
>
>
Seems we can do nothing with this if we have qemu-bundled &
direct vmnet.framework interaction, it always requires privileges
or entitlement.
The workaround can be moving vmnet-related things to
another helper binary running with privileges, and usage of
this helper somewhere between qemu and vmnet.

I think for now it's applicable to leave it as is, having qemu
that requires privileges for vmnet.framework usage.


> Thanks
>
>
> >
> >> Thanks
> >>
> >
> > Thank you for your review, I will check it this week and reply as soon
> as possible.
> >
> >>
> >> >
> >> > One more note: we still have quite useful but not supported
> >> > 'vmnet.framework' features as creating port forwarding rules, IPv6
> >> > NAT prefix specifying and so on.
> >> >
> >> > Nevertheless, new backends work fine and tested within
> `qemu-system-x86-64`
> >> > on macOS Bir Sur 11.5.2 host with such nic models:
> >> >   * e1000-82545em
> >> >   * virtio-net-pci
> >> >   * vmxnet3
> >> >
> >> > The guests were:
> >> >   * macOS 10.15.7
> >> >   * Ubuntu Bionic (server cloudimg)
> >> >
> >> >
> >> > This series partially reuses patches by Phillip Tennen:
> >> >
> https://patchew.org/QEMU/20210218134947.1860-1-phillip.ennen@gmail.com/
> >> > So I included his signed-off line into one of the commit messages an=
d
> >> > also here.
> >> >
> >> > v1 -> v2:
> >> >  Since v1 minor typos were fixed, patches rebased onto latest master=
,
> >> >  redundant changes removed (small commits squashed)
> >> >
> >> > v2 -> v3:
> >> >  - QAPI style fixes
> >> >  - Typos fixes in comments
> >> >  - `#include`'s updated to be in sync with recent master
> >> > v3 -> v4:
> >> >  - Support vmnet interfaces isolation feature
> >> >  - Support vmnet-host network uuid setting feature
> >> >  - Refactored sources a bit
> >> > v4 -> v5:
> >> >  - Missed 6.2 boat, now 7.0 candidate
> >> >  - Fix qapi netdev descriptions and styles
> >> >    (@subnetmask -> @subnet-mask)
> >> >  - Support vmnet-shared IPv6 prefix setting feature
> >> >
> >> > Signed-off-by: Phillip Tennen <phillip@axleos.com>
> >> > Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> >> >
> >> > Vladislav Yaroshchuk (6):
> >> >   net/vmnet: add vmnet dependency and customizable option
> >> >   net/vmnet: add vmnet backends to qapi/net
> >> >   net/vmnet: implement shared mode (vmnet-shared)
> >> >   net/vmnet: implement host mode (vmnet-host)
> >> >   net/vmnet: implement bridged mode (vmnet-bridged)
> >> >   net/vmnet: update qemu-options.hx
> >> >
> >> >  meson.build                   |   4 +
> >> >  meson_options.txt             |   2 +
> >> >  net/clients.h                 |  11 ++
> >> >  net/meson.build               |   7 +
> >> >  net/net.c                     |  10 ++
> >> >  net/vmnet-bridged.m           | 111 ++++++++++++
> >> >  net/vmnet-common.m            | 325
> ++++++++++++++++++++++++++++++++++
> >> >  net/vmnet-host.c              | 111 ++++++++++++
> >> >  net/vmnet-shared.c            |  92 ++++++++++
> >> >  net/vmnet_int.h               |  48 +++++
> >> >  qapi/net.json                 | 127 ++++++++++++-
> >> >  qemu-options.hx               |  25 +++
> >> >  scripts/meson-buildoptions.sh |   3 +
> >> >  13 files changed, 874 insertions(+), 2 deletions(-)
> >> >  create mode 100644 net/vmnet-bridged.m
> >> >  create mode 100644 net/vmnet-common.m
> >> >  create mode 100644 net/vmnet-host.c
> >> >  create mode 100644 net/vmnet-shared.c
> >> >  create mode 100644 net/vmnet_int.h
> >> >
> >> > --
> >> > 2.23.0
> >> >
> >>
> >
> >
> > --
> > Best Regards,
> >
> > Vladislav Yaroshchuk
>
>

--=20
Best Regards,

Vladislav Yaroshchuk

--000000000000ddd6fc05d0e99966
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">=D0=B2=D1=82, 16 =D0=BD=D0=BE=D1=8F=
=D0=B1. 2021 =D0=B3. =D0=B2 10:23, Jason Wang &lt;<a href=3D"mailto:jasowan=
g@redhat.com">jasowang@redhat.com</a>&gt;:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">On Mon, Nov 15, 2021 at 6:45 PM Vladislav Yarosh=
chuk<br>
&lt;<a href=3D"mailto:yaroshchuk2000@gmail.com" target=3D"_blank">yaroshchu=
k2000@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; =D0=BF=D0=BD, 15 =D0=BD=D0=BE=D1=8F=D0=B1. 2021 =D0=B3. =D0=B2 07:53, =
Jason Wang &lt;<a href=3D"mailto:jasowang@redhat.com" target=3D"_blank">jas=
owang@redhat.com</a>&gt;:<br>
&gt;&gt;<br>
&gt;&gt; On Fri, Nov 12, 2021 at 5:14 PM Vladislav Yaroshchuk<br>
&gt;&gt; &lt;<a href=3D"mailto:yaroshchuk2000@gmail.com" target=3D"_blank">=
yaroshchuk2000@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; macOS provides networking API for VMs called &#39;vmnet.frame=
work&#39;:<br>
&gt;&gt; &gt; <a href=3D"https://developer.apple.com/documentation/vmnet" r=
el=3D"noreferrer" target=3D"_blank">https://developer.apple.com/documentati=
on/vmnet</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; We can provide its support as the new QEMU network backends w=
hich<br>
&gt;&gt; &gt; represent three different vmnet.framework interface usage mod=
es:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0* `vmnet-shared`:<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0allows the guest to communicate with other=
 guests in shared mode and<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0also with external network (Internet) via =
NAT. Has (macOS-provided)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0DHCP server; subnet mask and IP range can =
be configured;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0* `vmnet-host`:<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0allows the guest to communicate with other=
 guests in host mode.<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0By default has enabled DHCP as `vmnet-shar=
ed`, but providing<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0network unique id (uuid) can make `vmnet-h=
ost` interfaces isolated<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0from each other and also disables DHCP.<br=
>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0* `vmnet-bridged`:<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0bridges the guest with a physical network =
interface.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; This backends cannot work on macOS Catalina 10.15 cause we us=
e<br>
&gt;&gt; &gt; vmnet.framework API provided only with macOS 11 and newer. Se=
ems<br>
&gt;&gt; &gt; that it is not a problem, because QEMU guarantees to work on =
two most<br>
&gt;&gt; &gt; recent versions of macOS which now are Big Sur (11) and Monte=
rey (12).<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Also, we have one inconvenient restriction: vmnet.framework i=
nterfaces<br>
&gt;&gt; &gt; can create only privileged user:<br>
&gt;&gt; &gt; `$ sudo qemu-system-x86_64 -nic vmnet-shared`<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Attempt of `vmnet-*` netdev creation being unprivileged user =
fails with<br>
&gt;&gt; &gt; vmnet&#39;s &#39;general failure&#39;.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; This happens because vmnet.framework requires `com.apple.vm.n=
etworking`<br>
&gt;&gt; &gt; entitlement which is: &quot;restricted to developers of virtu=
alization software.<br>
&gt;&gt; &gt; To request this entitlement, contact your Apple representativ=
e.&quot; as Apple<br>
&gt;&gt; &gt; documentation says:<br>
&gt;&gt; &gt; <a href=3D"https://developer.apple.com/documentation/bundlere=
sources/entitlements/com_apple_vm_networking" rel=3D"noreferrer" target=3D"=
_blank">https://developer.apple.com/documentation/bundleresources/entitleme=
nts/com_apple_vm_networking</a><br>
&gt;&gt;<br>
&gt;&gt; Do you know how multipass work? Looks like it uses vmnet without p=
rivileges.<br>
&gt;&gt;<br>
&gt;<br>
&gt; I&#39;ve just checked this, and they still need root privileges. They =
have a<br>
&gt; `multipassd` daemon which is launched as root by launchd by default.<b=
r>
&gt;<br>
&gt; ```<br>
&gt; bash-5.1$ ps axo ruser,ruid,comm | grep multipass<br>
&gt; root=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 /L=
ibrary/Application Support/com.canonical.multipass/bin/multipassd<br>
&gt; root=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 /L=
ibrary/Application Support/com.canonical.multipass/bin/hyperkit<br>
&gt; ```<br>
&gt;<br>
&gt; That&#39;s the reason why it&#39;s required to &#39;enter a password&#=
39; while multipass installation:<br>
&gt; it creates launchd plist (kinda launch rule) and places it to /Library=
/LaunchDaemons/,<br>
&gt; which can be done only with root privileges.<br>
&gt;<br>
&gt; ```<br>
&gt; bash-5.1$ ll /Library/LaunchDaemons | grep multipass<br>
&gt; -rw-r--r--=C2=A0 =C2=A01 root=C2=A0 wheel=C2=A0 =C2=A01.1K 15 Nov 12:4=
7 com.canonical.multipassd.plist<br>
&gt; ```<br>
&gt;<br>
&gt; And after this launchd launches this multipassd daemon as root every b=
oot.<br>
&gt;<br>
&gt; So an unprivileged user can launch a multipass VM instance, but actual=
ly the<br>
&gt; `hyperkit` process which interacts with vmnet is gonna be launched by =
multipassd<br>
&gt; running as root.<br>
<br>
I wonder how it passes the vmnet object to qemu? Nothing obvious from<br>
the qemu command line that multipass launched:<br>
<br>
-nic vmnet-macos,mode=3Dshared,model=3Dvirtio-net-pci,mac=3D52:54:00:52:e8:=
e4<br>
<br>
(But I haven&#39;t had time to check their qemu codes).<br>
<br></blockquote><div><br></div><div>It seems they just use QEMU with patch=
 by Phillip Tennen:</div><div><a href=3D"https://patchew.org/QEMU/202102181=
34947.1860-1-phillip.ennen@gmail.com/">https://patchew.org/QEMU/20210218134=
947.1860-1-phillip.ennen@gmail.com/</a><br></div><div><br></div><div>In tha=
t patch he does quite the same as we in this series, the</div><div>differen=
ce remains in foreground: he creates one new &#39;vmnet-macos&#39;=C2=A0</d=
iv><div>netdev, and uses &#39;mode=3Dshared&#39; property to choose vmnet=
=C2=A0</div><div>operating mode. I decided to create three different netdev=
s instead</div><div>(vmnet-shared, vmnet-host, vmnet-bridged). Also I&#39;v=
e added some=C2=A0</div><div>features related to isolation and ipv6.</div><=
div><br></div><div>&gt; I wonder how it passes the vmnet object to qemu<br>=
</div><div>I hope I clearly described this.</div><div><br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
&gt;<br>
&gt; tl;dr sadly, we can&#39;t interact with vmnet.framework without having=
 our binary correctly<br>
&gt; signed and being an unprivileged user. Root privileges or special sign=
ature with<br>
&gt; entitlement is required.<br>
<br>
This is something similar to what happens in other OS. E.g for the tap<br>
backend, it can&#39;t be created without privileges. So qemu allows to:<br>
<br>
1) the TAP to be created by privileged program like libvirt, and its<br>
fd could be passed to qemu via SCM_RIGHTS<br>
2) run a set-uid helper to create and config TAP<br>
<br>
This is something we need to consider now or in the future probably.<br>
<br></blockquote><div><br></div><div>Seems we can do nothing with this if w=
e have qemu-bundled &amp;</div><div>direct vmnet.framework interaction, it=
=C2=A0always requires privileges=C2=A0</div><div>or entitlement.</div><div>=
The workaround can be moving vmnet-related things to=C2=A0</div><div>anothe=
r helper binary running with privileges, and usage of=C2=A0</div><div>this =
helper somewhere between qemu and vmnet.</div><div><br></div><div>I think f=
or now it&#39;s applicable to leave it as is,=C2=A0having qemu=C2=A0</div><=
div>that requires privileges for vmnet.framework usage.</div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
Thanks<br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;<br>
&gt;<br>
&gt;&gt; Thanks<br>
&gt;&gt;<br>
&gt;<br>
&gt; Thank you for your review, I will check it this week and reply as soon=
 as possible.<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; One more note: we still have quite useful but not supported<b=
r>
&gt;&gt; &gt; &#39;vmnet.framework&#39; features as creating port forwardin=
g rules, IPv6<br>
&gt;&gt; &gt; NAT prefix specifying and so on.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Nevertheless, new backends work fine and tested within `qemu-=
system-x86-64`<br>
&gt;&gt; &gt; on macOS Bir Sur 11.5.2 host with such nic models:<br>
&gt;&gt; &gt;=C2=A0 =C2=A0* e1000-82545em<br>
&gt;&gt; &gt;=C2=A0 =C2=A0* virtio-net-pci<br>
&gt;&gt; &gt;=C2=A0 =C2=A0* vmxnet3<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; The guests were:<br>
&gt;&gt; &gt;=C2=A0 =C2=A0* macOS 10.15.7<br>
&gt;&gt; &gt;=C2=A0 =C2=A0* Ubuntu Bionic (server cloudimg)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; This series partially reuses patches by Phillip Tennen:<br>
&gt;&gt; &gt; <a href=3D"https://patchew.org/QEMU/20210218134947.1860-1-phi=
llip.ennen@gmail.com/" rel=3D"noreferrer" target=3D"_blank">https://patchew=
.org/QEMU/20210218134947.1860-1-phillip.ennen@gmail.com/</a><br>
&gt;&gt; &gt; So I included his signed-off line into one of the commit mess=
ages and<br>
&gt;&gt; &gt; also here.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; v1 -&gt; v2:<br>
&gt;&gt; &gt;=C2=A0 Since v1 minor typos were fixed, patches rebased onto l=
atest master,<br>
&gt;&gt; &gt;=C2=A0 redundant changes removed (small commits squashed)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; v2 -&gt; v3:<br>
&gt;&gt; &gt;=C2=A0 - QAPI style fixes<br>
&gt;&gt; &gt;=C2=A0 - Typos fixes in comments<br>
&gt;&gt; &gt;=C2=A0 - `#include`&#39;s updated to be in sync with recent ma=
ster<br>
&gt;&gt; &gt; v3 -&gt; v4:<br>
&gt;&gt; &gt;=C2=A0 - Support vmnet interfaces isolation feature<br>
&gt;&gt; &gt;=C2=A0 - Support vmnet-host network uuid setting feature<br>
&gt;&gt; &gt;=C2=A0 - Refactored sources a bit<br>
&gt;&gt; &gt; v4 -&gt; v5:<br>
&gt;&gt; &gt;=C2=A0 - Missed 6.2 boat, now 7.0 candidate<br>
&gt;&gt; &gt;=C2=A0 - Fix qapi netdev descriptions and styles<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 (@subnetmask -&gt; @subnet-mask)<br>
&gt;&gt; &gt;=C2=A0 - Support vmnet-shared IPv6 prefix setting feature<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Phillip Tennen &lt;<a href=3D"mailto:phillip@a=
xleos.com" target=3D"_blank">phillip@axleos.com</a>&gt;<br>
&gt;&gt; &gt; Signed-off-by: Vladislav Yaroshchuk &lt;<a href=3D"mailto:yar=
oshchuk2000@gmail.com" target=3D"_blank">yaroshchuk2000@gmail.com</a>&gt;<b=
r>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Vladislav Yaroshchuk (6):<br>
&gt;&gt; &gt;=C2=A0 =C2=A0net/vmnet: add vmnet dependency and customizable =
option<br>
&gt;&gt; &gt;=C2=A0 =C2=A0net/vmnet: add vmnet backends to qapi/net<br>
&gt;&gt; &gt;=C2=A0 =C2=A0net/vmnet: implement shared mode (vmnet-shared)<b=
r>
&gt;&gt; &gt;=C2=A0 =C2=A0net/vmnet: implement host mode (vmnet-host)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0net/vmnet: implement bridged mode (vmnet-bridged)=
<br>
&gt;&gt; &gt;=C2=A0 =C2=A0net/vmnet: update qemu-options.hx<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +<br>
&gt;&gt; &gt;=C2=A0 meson_options.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
&gt;&gt; &gt;=C2=A0 net/clients.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 11 ++<br>
&gt;&gt; &gt;=C2=A0 net/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A07 +<br>
&gt;&gt; &gt;=C2=A0 net/net.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 10 ++<br>
&gt;&gt; &gt;=C2=A0 net/vmnet-bridged.m=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 111 ++++++++++++<br>
&gt;&gt; &gt;=C2=A0 net/vmnet-common.m=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 325 ++++++++++++++++++++++++++++++++++<br>
&gt;&gt; &gt;=C2=A0 net/vmnet-host.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 111 ++++++++++++<br>
&gt;&gt; &gt;=C2=A0 net/vmnet-shared.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 92 ++++++++++<br>
&gt;&gt; &gt;=C2=A0 net/vmnet_int.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 48 +++++<br>
&gt;&gt; &gt;=C2=A0 qapi/net.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 127 ++++++++++++-<br>
&gt;&gt; &gt;=C2=A0 qemu-options.hx=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 25 +++<br>
&gt;&gt; &gt;=C2=A0 scripts/meson-buildoptions.sh |=C2=A0 =C2=A03 +<br>
&gt;&gt; &gt;=C2=A0 13 files changed, 874 insertions(+), 2 deletions(-)<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 net/vmnet-bridged.m<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 net/vmnet-common.m<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 net/vmnet-host.c<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 net/vmnet-shared.c<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 net/vmnet_int.h<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; 2.23.0<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Best Regards,<br>
&gt;<br>
&gt; Vladislav Yaroshchuk<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"l=
tr">Best Regards,<div><br><div>Vladislav Yaroshchuk</div></div></div></div>=
</div>

--000000000000ddd6fc05d0e99966--


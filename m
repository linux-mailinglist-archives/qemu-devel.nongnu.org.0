Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F05648C5E7
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 15:24:38 +0100 (CET)
Received: from localhost ([::1]:37196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7eYH-0006dm-EN
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 09:24:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n7dbO-0002dA-Av
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 08:23:46 -0500
Received: from [2607:f8b0:4864:20::102e] (port=41573
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n7dbK-0004qU-Ur
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 08:23:44 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 b1-20020a17090a990100b001b14bd47532so4788909pjp.0
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 05:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=77Bq+vV9ubzhZF2uo4Ya2FlcyF7IlXGfdjn6AH8UfvA=;
 b=jpTz3pQ6ZWi85r2Ga4c+auKBQAP2dHUT+l/Vp3Hhwect7TntYvrrQnhi2SHzsUITCh
 Mtz2cY+xOeXjEeO+PWcU6OJvrUeKSv9DGoM9s/SoglF8EBKUZLUZsdoo4M54VuUY6yX1
 K9h2hxu3Ukhq/T2+GycCrBUbh0WpgmzfDtz7iWv4PIcItFf3Qd5eb8N82vm7cyOlhbcn
 qsfF0bIzStLqjdf3BeCBChGvGkzlpn70c76PCueeQ8atFDOuJ7u80SGxtdlesZTaCWif
 j8JShZUeECMcZz3VZM/EAYsLbPRjD8Me+yLKNlzttu9LxPmfKe5nIrpI5/DOp+uOGBqD
 v9rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=77Bq+vV9ubzhZF2uo4Ya2FlcyF7IlXGfdjn6AH8UfvA=;
 b=D0HPbNAVr+Ln5GznV30d+ie+VspyWegayO9Y+/wAGOyU0wcmundn8/l7craq8lwYSA
 BxOdfTF+hyVVnd3iC30n5ke9kDs8qoesOfupoQj5+X31OuGYR6lI3WcqokayQUTMMc6f
 GWXDiLjATT54mUNfl56rBq3U0efbFDafRboiqojjXcLUaXKpLVO3NO/A2vUY81K/WuE2
 YkmOMJuKSJT0RcaOzb3Tn84/nTJ/1lpdWRQ6Ayl5/qvqFIqRuyodwP7MSARrE0eyxutk
 rs6fFp0uYeCpejfvbxvbhC4mypkmfBqd/XX2YXhr1rCY9rBNY2CyfxtEspVwPEwyFlLF
 gxMg==
X-Gm-Message-State: AOAM531emNGfSR4tb7ERKIG/q14MQ73dLPa7nYo6KPVGChUpO+nTAfHb
 Bdiqxec57lzag2EUOsQC7JTLdCr9LfnLfwF8U8XBd9EwWK68e4mS
X-Google-Smtp-Source: ABdhPJwpA598wYmDFZCx5c1prHD7xG8w/4wqebLf2PHWNfMXSFNraI+fuK6zMFapReNfzt6vx9VcEY5IIyPn6zYMzbI=
X-Received: by 2002:a63:8c49:: with SMTP id q9mr8336294pgn.425.1641993821537; 
 Wed, 12 Jan 2022 05:23:41 -0800 (PST)
MIME-Version: 1.0
References: <20220111211422.21789-1-yaroshchuk2000@gmail.com>
 <Yd6ILKV75g4jll46@roolebo.dev> <Yd6PzI05p7y7PkGy@roolebo.dev>
In-Reply-To: <Yd6PzI05p7y7PkGy@roolebo.dev>
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Date: Wed, 12 Jan 2022 16:23:30 +0300
Message-ID: <CADO9X9Snf8GBkBkwkCQ7Ks2cpRKpCM5Y557FssyS5LctZdBu2Q@mail.gmail.com>
Subject: Re: [PATCH v10 0/7] Add vmnet.framework based network backend
To: Roman Bolshakov <roman@roolebo.dev>
Content-Type: multipart/alternative; boundary="00000000000074cb3a05d5627a2c"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Phillip Tennen <phillip@axleos.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Howard Spoelstra <hsp.cat7@gmail.com>,
 Alessio Dionisi <hello@adns.io>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000074cb3a05d5627a2c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 12 =D1=8F=D0=BD=D0=B2. 2022 =D0=B3. =D0=B2 11:22, Roman Bolsh=
akov <roman@roolebo.dev>:

> On Wed, Jan 12, 2022 at 10:50:04AM +0300, Roman Bolshakov wrote:
> > On Wed, Jan 12, 2022 at 12:14:15AM +0300, Vladislav Yaroshchuk wrote:
> > > macOS provides networking API for VMs called 'vmnet.framework':
> > > https://developer.apple.com/documentation/vmnet
> > >
> > > We can provide its support as the new QEMU network backends which
> > > represent three different vmnet.framework interface usage modes:
> > >
> > >   * `vmnet-shared`:
> > >     allows the guest to communicate with other guests in shared mode
> and
> > >     also with external network (Internet) via NAT. Has (macOS-provide=
d)
> > >     DHCP server; subnet mask and IP range can be configured;
> > >
> > >   * `vmnet-host`:
> > >     allows the guest to communicate with other guests in host mode.
> > >     By default has enabled DHCP as `vmnet-shared`, but providing
> > >     network unique id (uuid) can make `vmnet-host` interfaces isolate=
d
> > >     from each other and also disables DHCP.
> > >
> > >   * `vmnet-bridged`:
> > >     bridges the guest with a physical network interface.
> > >
> > > This backends cannot work on macOS Catalina 10.15 cause we use
> > > vmnet.framework API provided only with macOS 11 and newer. Seems
> > > that it is not a problem, because QEMU guarantees to work on two most
> > > recent versions of macOS which now are Big Sur (11) and Monterey (12)=
.
> > >
> > > Also, we have one inconvenient restriction: vmnet.framework interface=
s
> > > can create only privileged user:
> > > `$ sudo qemu-system-x86_64 -nic vmnet-shared`
> > >
> > > Attempt of `vmnet-*` netdev creation being unprivileged user fails wi=
th
> > > vmnet's 'general failure'.
> > >
> > > This happens because vmnet.framework requires `com.apple.vm.networkin=
g`
> > > entitlement which is: "restricted to developers of virtualization
> software.
> > > To request this entitlement, contact your Apple representative." as
> Apple
> > > documentation says:
> > >
> https://developer.apple.com/documentation/bundleresources/entitlements/co=
m_apple_vm_networking
> > >
> > > One more note: we still have quite useful but not supported
> > > 'vmnet.framework' features as creating port forwarding rules, IPv6
> > > NAT prefix specifying and so on.
> > >
> > > Nevertheless, new backends work fine and tested within
> `qemu-system-x86-64`
> > > on macOS Bir Sur 11.5.2 host with such nic models:
> > >   * e1000-82545em
> > >   * virtio-net-pci
> > >   * vmxnet3
> > >
> > > The guests were:
> > >   * macOS 10.15.7
> > >   * Ubuntu Bionic (server cloudimg)
> > >
> > >
> > > This series partially reuses patches by Phillip Tennen:
> > >
> https://patchew.org/QEMU/20210218134947.1860-1-phillip.ennen@gmail.com/
> > > So I included them signed-off line into one of the commit messages an=
d
> > > also here.
> > >
> > > v1 -> v2:
> > >  Since v1 minor typos were fixed, patches rebased onto latest master,
> > >  redundant changes removed (small commits squashed)
> > > v2 -> v3:
> > >  - QAPI style fixes
> > >  - Typos fixes in comments
> > >  - `#include`'s updated to be in sync with recent master
> > > v3 -> v4:
> > >  - Support vmnet interfaces isolation feature
> > >  - Support vmnet-host network uuid setting feature
> > >  - Refactored sources a bit
> > > v4 -> v5:
> > >  - Missed 6.2 boat, now 7.0 candidate
> > >  - Fix qapi netdev descriptions and styles
> > >    (@subnetmask -> @subnet-mask)
> > >  - Support vmnet-shared IPv6 prefix setting feature
> > > v5 -> v6
> > >  - provide detailed commit messages for commits of
> > >    many changes
> > >  - rename properties @dhcpstart and @dhcpend to
> > >    @start-address and @end-address
> > >  - improve qapi documentation about isolation
> > >    features (@isolated, @net-uuid)
> > > v6 -> v7:
> > >  - update MAINTAINERS list
> > > v7 -> v8
> > >  - QAPI code style fixes
> > > v8 -> v9
> > >  - Fix building on Linux: add missing qapi
> > >    `'if': 'CONFIG_VMNET'` statement to Netdev union
> > > v9 -> v10
> > >  - Disable vmnet feature for macOS < 11.0: add
> > >    vmnet.framework API probe into meson.build.
> > >    This fixes QEMU building on macOS < 11.0:
> > >
> https://patchew.org/QEMU/20220110034000.20221-1-jasowang@redhat.com/
> > >
> >
> > Hi Vladislav,
> >
> > What symbols are missing on Catalina except VMNET_SHARING_BUSY?
> >
> > It'd be great to get the feature working there.
> >
> > Thanks,
> > Roman
> >
>
> Ok it turned out not that many symbols are needed for successfull
> compilation on Catalina:
>
> vmnet_enable_isolation_key
> vmnet_network_identifier_key
> VMNET_SHARING_SERVICE_BUSY
>
> The compilation suceeds if they're wrappeed by ifdefs. I haven't tested
> it yet though.
>
>
New version with Catalina 10.15 support submitted as v11.


> Regards,
> Roman
>
> > > Vladislav Yaroshchuk (7):
> > >   net/vmnet: add vmnet dependency and customizable option
> > >   net/vmnet: add vmnet backends to qapi/net
> > >   net/vmnet: implement shared mode (vmnet-shared)
> > >   net/vmnet: implement host mode (vmnet-host)
> > >   net/vmnet: implement bridged mode (vmnet-bridged)
> > >   net/vmnet: update qemu-options.hx
> > >   net/vmnet: update MAINTAINERS list
> > >
> > >  MAINTAINERS                   |   5 +
> > >  meson.build                   |  16 +-
> > >  meson_options.txt             |   2 +
> > >  net/clients.h                 |  11 ++
> > >  net/meson.build               |   7 +
> > >  net/net.c                     |  10 ++
> > >  net/vmnet-bridged.m           | 111 ++++++++++++
> > >  net/vmnet-common.m            | 330 ++++++++++++++++++++++++++++++++=
++
> > >  net/vmnet-host.c              | 105 +++++++++++
> > >  net/vmnet-shared.c            |  92 ++++++++++
> > >  net/vmnet_int.h               |  48 +++++
> > >  qapi/net.json                 | 132 +++++++++++++-
> > >  qemu-options.hx               |  25 +++
> > >  scripts/meson-buildoptions.sh |   3 +
> > >  14 files changed, 894 insertions(+), 3 deletions(-)
> > >  create mode 100644 net/vmnet-bridged.m
> > >  create mode 100644 net/vmnet-common.m
> > >  create mode 100644 net/vmnet-host.c
> > >  create mode 100644 net/vmnet-shared.c
> > >  create mode 100644 net/vmnet_int.h
> > >
> > > --
> > > 2.23.0
> > >
> > >
>


--=20
Best Regards,

Vladislav Yaroshchuk

--00000000000074cb3a05d5627a2c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">=D1=81=D1=80, 12 =D1=8F=D0=BD=D0=B2. 2022=
 =D0=B3. =D0=B2 11:22, Roman Bolshakov &lt;<a href=3D"mailto:roman@roolebo.=
dev">roman@roolebo.dev</a>&gt;:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">On Wed, Jan 12, 2022 at 10:50:04AM +0300, Roman Bolshakov w=
rote:<br>
&gt; On Wed, Jan 12, 2022 at 12:14:15AM +0300, Vladislav Yaroshchuk wrote:<=
br>
&gt; &gt; macOS provides networking API for VMs called &#39;vmnet.framework=
&#39;:<br>
&gt; &gt; <a href=3D"https://developer.apple.com/documentation/vmnet" rel=
=3D"noreferrer" target=3D"_blank">https://developer.apple.com/documentation=
/vmnet</a><br>
&gt; &gt; <br>
&gt; &gt; We can provide its support as the new QEMU network backends which=
<br>
&gt; &gt; represent three different vmnet.framework interface usage modes:<=
br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0* `vmnet-shared`:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0allows the guest to communicate with other gue=
sts in shared mode and<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0also with external network (Internet) via NAT.=
 Has (macOS-provided)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0DHCP server; subnet mask and IP range can be c=
onfigured;<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0* `vmnet-host`:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0allows the guest to communicate with other gue=
sts in host mode.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0By default has enabled DHCP as `vmnet-shared`,=
 but providing<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0network unique id (uuid) can make `vmnet-host`=
 interfaces isolated<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0from each other and also disables DHCP.<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0* `vmnet-bridged`:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0bridges the guest with a physical network inte=
rface.<br>
&gt; &gt; <br>
&gt; &gt; This backends cannot work on macOS Catalina 10.15 cause we use<br=
>
&gt; &gt; vmnet.framework API provided only with macOS 11 and newer. Seems<=
br>
&gt; &gt; that it is not a problem, because QEMU guarantees to work on two =
most<br>
&gt; &gt; recent versions of macOS which now are Big Sur (11) and Monterey =
(12).<br>
&gt; &gt; <br>
&gt; &gt; Also, we have one inconvenient restriction: vmnet.framework inter=
faces<br>
&gt; &gt; can create only privileged user:<br>
&gt; &gt; `$ sudo qemu-system-x86_64 -nic vmnet-shared`<br>
&gt; &gt; <br>
&gt; &gt; Attempt of `vmnet-*` netdev creation being unprivileged user fail=
s with<br>
&gt; &gt; vmnet&#39;s &#39;general failure&#39;.<br>
&gt; &gt; <br>
&gt; &gt; This happens because vmnet.framework requires `com.apple.vm.netwo=
rking`<br>
&gt; &gt; entitlement which is: &quot;restricted to developers of virtualiz=
ation software.<br>
&gt; &gt; To request this entitlement, contact your Apple representative.&q=
uot; as Apple<br>
&gt; &gt; documentation says:<br>
&gt; &gt; <a href=3D"https://developer.apple.com/documentation/bundleresour=
ces/entitlements/com_apple_vm_networking" rel=3D"noreferrer" target=3D"_bla=
nk">https://developer.apple.com/documentation/bundleresources/entitlements/=
com_apple_vm_networking</a><br>
&gt; &gt; <br>
&gt; &gt; One more note: we still have quite useful but not supported<br>
&gt; &gt; &#39;vmnet.framework&#39; features as creating port forwarding ru=
les, IPv6<br>
&gt; &gt; NAT prefix specifying and so on.<br>
&gt; &gt; <br>
&gt; &gt; Nevertheless, new backends work fine and tested within `qemu-syst=
em-x86-64`<br>
&gt; &gt; on macOS Bir Sur 11.5.2 host with such nic models:<br>
&gt; &gt;=C2=A0 =C2=A0* e1000-82545em<br>
&gt; &gt;=C2=A0 =C2=A0* virtio-net-pci<br>
&gt; &gt;=C2=A0 =C2=A0* vmxnet3<br>
&gt; &gt; <br>
&gt; &gt; The guests were:<br>
&gt; &gt;=C2=A0 =C2=A0* macOS 10.15.7<br>
&gt; &gt;=C2=A0 =C2=A0* Ubuntu Bionic (server cloudimg)<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; This series partially reuses patches by Phillip Tennen:<br>
&gt; &gt; <a href=3D"https://patchew.org/QEMU/20210218134947.1860-1-phillip=
.ennen@gmail.com/" rel=3D"noreferrer" target=3D"_blank">https://patchew.org=
/QEMU/20210218134947.1860-1-phillip.ennen@gmail.com/</a><br>
&gt; &gt; So I included them signed-off line into one of the commit message=
s and<br>
&gt; &gt; also here.<br>
&gt; &gt; <br>
&gt; &gt; v1 -&gt; v2:<br>
&gt; &gt;=C2=A0 Since v1 minor typos were fixed, patches rebased onto lates=
t master,<br>
&gt; &gt;=C2=A0 redundant changes removed (small commits squashed)<br>
&gt; &gt; v2 -&gt; v3:<br>
&gt; &gt;=C2=A0 - QAPI style fixes<br>
&gt; &gt;=C2=A0 - Typos fixes in comments<br>
&gt; &gt;=C2=A0 - `#include`&#39;s updated to be in sync with recent master=
<br>
&gt; &gt; v3 -&gt; v4:<br>
&gt; &gt;=C2=A0 - Support vmnet interfaces isolation feature<br>
&gt; &gt;=C2=A0 - Support vmnet-host network uuid setting feature<br>
&gt; &gt;=C2=A0 - Refactored sources a bit<br>
&gt; &gt; v4 -&gt; v5:<br>
&gt; &gt;=C2=A0 - Missed 6.2 boat, now 7.0 candidate<br>
&gt; &gt;=C2=A0 - Fix qapi netdev descriptions and styles<br>
&gt; &gt;=C2=A0 =C2=A0 (@subnetmask -&gt; @subnet-mask)<br>
&gt; &gt;=C2=A0 - Support vmnet-shared IPv6 prefix setting feature<br>
&gt; &gt; v5 -&gt; v6<br>
&gt; &gt;=C2=A0 - provide detailed commit messages for commits of<br>
&gt; &gt;=C2=A0 =C2=A0 many changes<br>
&gt; &gt;=C2=A0 - rename properties @dhcpstart and @dhcpend to<br>
&gt; &gt;=C2=A0 =C2=A0 @start-address and @end-address<br>
&gt; &gt;=C2=A0 - improve qapi documentation about isolation<br>
&gt; &gt;=C2=A0 =C2=A0 features (@isolated, @net-uuid)<br>
&gt; &gt; v6 -&gt; v7:<br>
&gt; &gt;=C2=A0 - update MAINTAINERS list<br>
&gt; &gt; v7 -&gt; v8<br>
&gt; &gt;=C2=A0 - QAPI code style fixes<br>
&gt; &gt; v8 -&gt; v9<br>
&gt; &gt;=C2=A0 - Fix building on Linux: add missing qapi<br>
&gt; &gt;=C2=A0 =C2=A0 `&#39;if&#39;: &#39;CONFIG_VMNET&#39;` statement to =
Netdev union<br>
&gt; &gt; v9 -&gt; v10<br>
&gt; &gt;=C2=A0 - Disable vmnet feature for macOS &lt; 11.0: add<br>
&gt; &gt;=C2=A0 =C2=A0 vmnet.framework API probe into meson.build.<br>
&gt; &gt;=C2=A0 =C2=A0 This fixes QEMU building on macOS &lt; 11.0:<br>
&gt; &gt;=C2=A0 =C2=A0 <a href=3D"https://patchew.org/QEMU/20220110034000.2=
0221-1-jasowang@redhat.com/" rel=3D"noreferrer" target=3D"_blank">https://p=
atchew.org/QEMU/20220110034000.20221-1-jasowang@redhat.com/</a><br>
&gt; &gt; <br>
&gt; <br>
&gt; Hi Vladislav,<br>
&gt; <br>
&gt; What symbols are missing on Catalina except VMNET_SHARING_BUSY?<br>
&gt; <br>
&gt; It&#39;d be great to get the feature working there.<br>
&gt; <br>
&gt; Thanks,<br>
&gt; Roman<br>
&gt; <br>
<br>
Ok it turned out not that many symbols are needed for successfull<br>
compilation on Catalina:<br>
<br>
vmnet_enable_isolation_key<br>
vmnet_network_identifier_key<br>
VMNET_SHARING_SERVICE_BUSY<br>
<br>
The compilation suceeds if they&#39;re wrappeed by ifdefs. I haven&#39;t te=
sted<br>
it yet though.<br>
<br></blockquote><div><br></div><div>New version with Catalina 10.15 suppor=
t submitted as v11.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
Regards,<br>
Roman<br>
<br>
&gt; &gt; Vladislav Yaroshchuk (7):<br>
&gt; &gt;=C2=A0 =C2=A0net/vmnet: add vmnet dependency and customizable opti=
on<br>
&gt; &gt;=C2=A0 =C2=A0net/vmnet: add vmnet backends to qapi/net<br>
&gt; &gt;=C2=A0 =C2=A0net/vmnet: implement shared mode (vmnet-shared)<br>
&gt; &gt;=C2=A0 =C2=A0net/vmnet: implement host mode (vmnet-host)<br>
&gt; &gt;=C2=A0 =C2=A0net/vmnet: implement bridged mode (vmnet-bridged)<br>
&gt; &gt;=C2=A0 =C2=A0net/vmnet: update qemu-options.hx<br>
&gt; &gt;=C2=A0 =C2=A0net/vmnet: update MAINTAINERS list<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 +<br>
&gt; &gt;=C2=A0 meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 16 +-<br>
&gt; &gt;=C2=A0 meson_options.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A02 +<br>
&gt; &gt;=C2=A0 net/clients.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 11 ++<br>
&gt; &gt;=C2=A0 net/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A07 +<br>
&gt; &gt;=C2=A0 net/net.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 10 ++<br>
&gt; &gt;=C2=A0 net/vmnet-bridged.m=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 111 ++++++++++++<br>
&gt; &gt;=C2=A0 net/vmnet-common.m=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | 330 ++++++++++++++++++++++++++++++++++<br>
&gt; &gt;=C2=A0 net/vmnet-host.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 105 +++++++++++<br>
&gt; &gt;=C2=A0 net/vmnet-shared.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 92 ++++++++++<br>
&gt; &gt;=C2=A0 net/vmnet_int.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 48 +++++<br>
&gt; &gt;=C2=A0 qapi/net.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 132 +++++++++++++-<br>
&gt; &gt;=C2=A0 qemu-options.hx=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 25 +++<br>
&gt; &gt;=C2=A0 scripts/meson-buildoptions.sh |=C2=A0 =C2=A03 +<br>
&gt; &gt;=C2=A0 14 files changed, 894 insertions(+), 3 deletions(-)<br>
&gt; &gt;=C2=A0 create mode 100644 net/vmnet-bridged.m<br>
&gt; &gt;=C2=A0 create mode 100644 net/vmnet-common.m<br>
&gt; &gt;=C2=A0 create mode 100644 net/vmnet-host.c<br>
&gt; &gt;=C2=A0 create mode 100644 net/vmnet-shared.c<br>
&gt; &gt;=C2=A0 create mode 100644 net/vmnet_int.h<br>
&gt; &gt; <br>
&gt; &gt; -- <br>
&gt; &gt; 2.23.0<br>
&gt; &gt; <br>
&gt; &gt; <br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best Regards,<div><br><div>Vlad=
islav Yaroshchuk</div></div></div></div></div>

--00000000000074cb3a05d5627a2c--


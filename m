Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD634502C1
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 11:47:49 +0100 (CET)
Received: from localhost ([::1]:56310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmZWd-00036c-Pg
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 05:47:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mmZUD-0001Zm-MC
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 05:45:20 -0500
Received: from [2607:f8b0:4864:20::92a] (port=33313
 helo=mail-ua1-x92a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mmZUB-0002v5-Bk
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 05:45:17 -0500
Received: by mail-ua1-x92a.google.com with SMTP id b17so33950037uas.0
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 02:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8cHgGC9QRJ76DCnxxKUESeBEA67X0CQzHRzcIiyoO8M=;
 b=RppjI0WMEYeGuFYig0HkoUOIShxrfbFBUZ8pb2516X7Z7SO9FMbXzd1jZzbANeWoXz
 tlCekISEDbMf2lU+Muud1i713zoaKCJXlSxQghKp6j+O71yFVIARX6IATiVcfL4e/m/Q
 nRFf2PP71jdtPqLUNwgTENnbT6K+Eo6fhZYRu8FYNdE/0f8zKPdabzm2KFnL3/ndHKjq
 QAq7rUVrVqSrGnUJuSsO3eahgZIBk6XY0bwnTYs8ObWVkm7dKTzwuJgjjGWq07wJZH8q
 VqsSunoqBh+al2YsGXcfXtAcVoqxDgrfxjQP/bZi1ocmVddYLyLnAdDmdTwmBFZLceif
 B90w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8cHgGC9QRJ76DCnxxKUESeBEA67X0CQzHRzcIiyoO8M=;
 b=eN8bx8hPfBS6C3Qgn3yGfe24jGQqQqsBQ/wR/bbBf7pFAjdzRqSpvKQ81HzUd3fG7U
 Iwx9vgfHrMl4+VV8DmSfDH2UH7ybB1BOeLAJmXIDTav4Dz00W/0UUmup9T1WCnIwlk4+
 cg8bb61BEw81ZePPA3Cobh+RoeqnDjhN6EkJd7kVdLwAmyIn3CuatmpphQBeqFAXHfmc
 efWXNrs69a+DCIaUCekbjHLTNJH3VDLIzEP0vnz4uPbL5uGRK6Wh9/p07mwIURg5myXY
 ZRd8ZOQBwLfeTrP44lEt1bscvAfh5J9Rj0kQtRUvOkjpJwQSjCCOCPUOx/qwhFkN05BV
 uh3A==
X-Gm-Message-State: AOAM532YDGCIphNPu4fVZPfQxPINCOjaj2z/s9up90UF1R3jF35f7nE1
 JLZlP9ZyDH7vvRMxsuPYNq3I2JAkBwL7DyRCS90=
X-Google-Smtp-Source: ABdhPJxFWRRAygw2QNTJ3A8/A4EyJs4Uc0geCQQf8TTYIsec+p0Dle4dPgY8vosU2t8FPLBbTn5MfeBfEdhMQjyEifY=
X-Received: by 2002:a67:db0b:: with SMTP id z11mr41344760vsj.59.1636973114027; 
 Mon, 15 Nov 2021 02:45:14 -0800 (PST)
MIME-Version: 1.0
References: <20211112091414.34223-1-yaroshchuk2000@gmail.com>
 <CACGkMEuiXy+OhGxq0aR=f0HuvFAbN427m=HL035WuJLsOsGpSg@mail.gmail.com>
In-Reply-To: <CACGkMEuiXy+OhGxq0aR=f0HuvFAbN427m=HL035WuJLsOsGpSg@mail.gmail.com>
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Date: Mon, 15 Nov 2021 13:45:03 +0300
Message-ID: <CADO9X9Rqcn_Bg=pg=14Y=rxXV6AniPAfPTfvHW9=NrXTpjo1oQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] Add vmnet.framework based network backend
To: Jason Wang <jasowang@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f7f44a05d0d1800b"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92a;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-ua1-x92a.google.com
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

--000000000000f7f44a05d0d1800b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 15 =D0=BD=D0=BE=D1=8F=D0=B1. 2021 =D0=B3. =D0=B2 07:53, Jason=
 Wang <jasowang@redhat.com>:

> On Fri, Nov 12, 2021 at 5:14 PM Vladislav Yaroshchuk
> <yaroshchuk2000@gmail.com> wrote:
> >
> > macOS provides networking API for VMs called 'vmnet.framework':
> > https://developer.apple.com/documentation/vmnet
> >
> > We can provide its support as the new QEMU network backends which
> > represent three different vmnet.framework interface usage modes:
> >
> >   * `vmnet-shared`:
> >     allows the guest to communicate with other guests in shared mode an=
d
> >     also with external network (Internet) via NAT. Has (macOS-provided)
> >     DHCP server; subnet mask and IP range can be configured;
> >
> >   * `vmnet-host`:
> >     allows the guest to communicate with other guests in host mode.
> >     By default has enabled DHCP as `vmnet-shared`, but providing
> >     network unique id (uuid) can make `vmnet-host` interfaces isolated
> >     from each other and also disables DHCP.
> >
> >   * `vmnet-bridged`:
> >     bridges the guest with a physical network interface.
> >
> > This backends cannot work on macOS Catalina 10.15 cause we use
> > vmnet.framework API provided only with macOS 11 and newer. Seems
> > that it is not a problem, because QEMU guarantees to work on two most
> > recent versions of macOS which now are Big Sur (11) and Monterey (12).
> >
> > Also, we have one inconvenient restriction: vmnet.framework interfaces
> > can create only privileged user:
> > `$ sudo qemu-system-x86_64 -nic vmnet-shared`
> >
> > Attempt of `vmnet-*` netdev creation being unprivileged user fails with
> > vmnet's 'general failure'.
> >
> > This happens because vmnet.framework requires `com.apple.vm.networking`
> > entitlement which is: "restricted to developers of virtualization
> software.
> > To request this entitlement, contact your Apple representative." as App=
le
> > documentation says:
> >
> https://developer.apple.com/documentation/bundleresources/entitlements/co=
m_apple_vm_networking
>
> Do you know how multipass work? Looks like it uses vmnet without
> privileges.
>
>
I've just checked this, and they still need root privileges. They have a
`multipassd` daemon which is launched as root by launchd by default.

```
bash-5.1$ ps axo ruser,ruid,comm | grep multipass
root                 0 /Library/Application
Support/com.canonical.multipass/bin/multipassd
root                 0 /Library/Application
Support/com.canonical.multipass/bin/hyperkit
```

That's the reason why it's required to 'enter a password' while multipass
installation:
it creates launchd plist (kinda launch rule) and places it to
/Library/LaunchDaemons/,
which can be done only with root privileges.

```
bash-5.1$ ll /Library/LaunchDaemons | grep multipass
-rw-r--r--   1 root  wheel   1.1K 15 Nov 12:47
com.canonical.multipassd.plist
```

And after this launchd launches this multipassd daemon as root every boot.

So an unprivileged user can launch a multipass VM instance, but actually
the
`hyperkit` process which interacts with vmnet is gonna be launched by
multipassd
running as root.

tl;dr sadly, we can't interact with vmnet.framework without having our
binary correctly
signed and being an unprivileged user. Root privileges or special signature
with
entitlement is required.


Thanks
>
>
Thank you for your review, I will check it this week and reply as soon as
possible.


> >
> > One more note: we still have quite useful but not supported
> > 'vmnet.framework' features as creating port forwarding rules, IPv6
> > NAT prefix specifying and so on.
> >
> > Nevertheless, new backends work fine and tested within
> `qemu-system-x86-64`
> > on macOS Bir Sur 11.5.2 host with such nic models:
> >   * e1000-82545em
> >   * virtio-net-pci
> >   * vmxnet3
> >
> > The guests were:
> >   * macOS 10.15.7
> >   * Ubuntu Bionic (server cloudimg)
> >
> >
> > This series partially reuses patches by Phillip Tennen:
> > https://patchew.org/QEMU/20210218134947.1860-1-phillip.ennen@gmail.com/
> > So I included his signed-off line into one of the commit messages and
> > also here.
> >
> > v1 -> v2:
> >  Since v1 minor typos were fixed, patches rebased onto latest master,
> >  redundant changes removed (small commits squashed)
> >
> > v2 -> v3:
> >  - QAPI style fixes
> >  - Typos fixes in comments
> >  - `#include`'s updated to be in sync with recent master
> > v3 -> v4:
> >  - Support vmnet interfaces isolation feature
> >  - Support vmnet-host network uuid setting feature
> >  - Refactored sources a bit
> > v4 -> v5:
> >  - Missed 6.2 boat, now 7.0 candidate
> >  - Fix qapi netdev descriptions and styles
> >    (@subnetmask -> @subnet-mask)
> >  - Support vmnet-shared IPv6 prefix setting feature
> >
> > Signed-off-by: Phillip Tennen <phillip@axleos.com>
> > Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> >
> > Vladislav Yaroshchuk (6):
> >   net/vmnet: add vmnet dependency and customizable option
> >   net/vmnet: add vmnet backends to qapi/net
> >   net/vmnet: implement shared mode (vmnet-shared)
> >   net/vmnet: implement host mode (vmnet-host)
> >   net/vmnet: implement bridged mode (vmnet-bridged)
> >   net/vmnet: update qemu-options.hx
> >
> >  meson.build                   |   4 +
> >  meson_options.txt             |   2 +
> >  net/clients.h                 |  11 ++
> >  net/meson.build               |   7 +
> >  net/net.c                     |  10 ++
> >  net/vmnet-bridged.m           | 111 ++++++++++++
> >  net/vmnet-common.m            | 325 ++++++++++++++++++++++++++++++++++
> >  net/vmnet-host.c              | 111 ++++++++++++
> >  net/vmnet-shared.c            |  92 ++++++++++
> >  net/vmnet_int.h               |  48 +++++
> >  qapi/net.json                 | 127 ++++++++++++-
> >  qemu-options.hx               |  25 +++
> >  scripts/meson-buildoptions.sh |   3 +
> >  13 files changed, 874 insertions(+), 2 deletions(-)
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
>

--=20
Best Regards,

Vladislav Yaroshchuk

--000000000000f7f44a05d0d1800b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">=D0=BF=D0=BD, 15 =D0=BD=D0=BE=D1=8F=
=D0=B1. 2021 =D0=B3. =D0=B2 07:53, Jason Wang &lt;<a href=3D"mailto:jasowan=
g@redhat.com">jasowang@redhat.com</a>&gt;:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">On Fri, Nov 12, 2021 at 5:14 PM Vladislav Yarosh=
chuk<br>
&lt;<a href=3D"mailto:yaroshchuk2000@gmail.com" target=3D"_blank">yaroshchu=
k2000@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; macOS provides networking API for VMs called &#39;vmnet.framework&#39;=
:<br>
&gt; <a href=3D"https://developer.apple.com/documentation/vmnet" rel=3D"nor=
eferrer" target=3D"_blank">https://developer.apple.com/documentation/vmnet<=
/a><br>
&gt;<br>
&gt; We can provide its support as the new QEMU network backends which<br>
&gt; represent three different vmnet.framework interface usage modes:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0* `vmnet-shared`:<br>
&gt;=C2=A0 =C2=A0 =C2=A0allows the guest to communicate with other guests i=
n shared mode and<br>
&gt;=C2=A0 =C2=A0 =C2=A0also with external network (Internet) via NAT. Has =
(macOS-provided)<br>
&gt;=C2=A0 =C2=A0 =C2=A0DHCP server; subnet mask and IP range can be config=
ured;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0* `vmnet-host`:<br>
&gt;=C2=A0 =C2=A0 =C2=A0allows the guest to communicate with other guests i=
n host mode.<br>
&gt;=C2=A0 =C2=A0 =C2=A0By default has enabled DHCP as `vmnet-shared`, but =
providing<br>
&gt;=C2=A0 =C2=A0 =C2=A0network unique id (uuid) can make `vmnet-host` inte=
rfaces isolated<br>
&gt;=C2=A0 =C2=A0 =C2=A0from each other and also disables DHCP.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0* `vmnet-bridged`:<br>
&gt;=C2=A0 =C2=A0 =C2=A0bridges the guest with a physical network interface=
.<br>
&gt;<br>
&gt; This backends cannot work on macOS Catalina 10.15 cause we use<br>
&gt; vmnet.framework API provided only with macOS 11 and newer. Seems<br>
&gt; that it is not a problem, because QEMU guarantees to work on two most<=
br>
&gt; recent versions of macOS which now are Big Sur (11) and Monterey (12).=
<br>
&gt;<br>
&gt; Also, we have one inconvenient restriction: vmnet.framework interfaces=
<br>
&gt; can create only privileged user:<br>
&gt; `$ sudo qemu-system-x86_64 -nic vmnet-shared`<br>
&gt;<br>
&gt; Attempt of `vmnet-*` netdev creation being unprivileged user fails wit=
h<br>
&gt; vmnet&#39;s &#39;general failure&#39;.<br>
&gt;<br>
&gt; This happens because vmnet.framework requires `com.apple.vm.networking=
`<br>
&gt; entitlement which is: &quot;restricted to developers of virtualization=
 software.<br>
&gt; To request this entitlement, contact your Apple representative.&quot; =
as Apple<br>
&gt; documentation says:<br>
&gt; <a href=3D"https://developer.apple.com/documentation/bundleresources/e=
ntitlements/com_apple_vm_networking" rel=3D"noreferrer" target=3D"_blank">h=
ttps://developer.apple.com/documentation/bundleresources/entitlements/com_a=
pple_vm_networking</a><br>
<br>
Do you know how multipass work? Looks like it uses vmnet without privileges=
.<br>
<br></blockquote><div><br></div><div>I&#39;ve=C2=A0just checked this, and t=
hey still need root privileges. They have a=C2=A0</div><div>`multipassd` da=
emon which is launched as root by launchd by default.=C2=A0</div><div><br><=
/div><div>```</div><div>bash-5.1$ ps axo ruser,ruid,comm | grep multipass<b=
r>root =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 /Library/A=
pplication Support/com.canonical.multipass/bin/multipassd<br>root =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 /Library/Application Sup=
port/com.canonical.multipass/bin/hyperkit<br></div><div>```</div><div><br><=
/div><div>That&#39;s the reason why it&#39;s required to &#39;enter a passw=
ord&#39; while multipass installation:=C2=A0</div><div>it creates launchd p=
list (kinda launch rule) and places it to /Library/LaunchDaemons/,</div><di=
v>which can be done only with root privileges.=C2=A0</div><div><br></div><d=
iv>```</div><div>bash-5.1$ ll /Library/LaunchDaemons | grep multipass<br>-r=
w-r--r-- =C2=A0 1 root =C2=A0wheel =C2=A0 1.1K 15 Nov 12:47 com.canonical.m=
ultipassd.plist<br></div><div>```</div><div><br></div><div>And after this l=
aunchd launches this multipassd daemon as root every boot.</div><div><br></=
div><div>So an unprivileged user can launch a multipass VM instance, but ac=
tually the=C2=A0</div><div>`hyperkit` process which interacts with vmnet is=
 gonna be launched by multipassd=C2=A0</div><div>running as root.</div><div=
><br></div><div>tl;dr sadly, we can&#39;t interact with vmnet.framework wit=
hout having our binary correctly=C2=A0</div><div>signed and being an unpriv=
ileged user. Root privileges or special signature with=C2=A0</div><div>enti=
tlement is required. </div><div><br></div><div><br class=3D"gmail-Apple-int=
erchange-newline"></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Thanks<br>
<br></blockquote><div><br></div><div>Thank you for your review, I will chec=
k it this week and reply as soon as possible.=C2=A0</div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
&gt;<br>
&gt; One more note: we still have quite useful but not supported<br>
&gt; &#39;vmnet.framework&#39; features as creating port forwarding rules, =
IPv6<br>
&gt; NAT prefix specifying and so on.<br>
&gt;<br>
&gt; Nevertheless, new backends work fine and tested within `qemu-system-x8=
6-64`<br>
&gt; on macOS Bir Sur 11.5.2 host with such nic models:<br>
&gt;=C2=A0 =C2=A0* e1000-82545em<br>
&gt;=C2=A0 =C2=A0* virtio-net-pci<br>
&gt;=C2=A0 =C2=A0* vmxnet3<br>
&gt;<br>
&gt; The guests were:<br>
&gt;=C2=A0 =C2=A0* macOS 10.15.7<br>
&gt;=C2=A0 =C2=A0* Ubuntu Bionic (server cloudimg)<br>
&gt;<br>
&gt;<br>
&gt; This series partially reuses patches by Phillip Tennen:<br>
&gt; <a href=3D"https://patchew.org/QEMU/20210218134947.1860-1-phillip.enne=
n@gmail.com/" rel=3D"noreferrer" target=3D"_blank">https://patchew.org/QEMU=
/20210218134947.1860-1-phillip.ennen@gmail.com/</a><br>
&gt; So I included his signed-off line into one of the commit messages and<=
br>
&gt; also here.<br>
&gt;<br>
&gt; v1 -&gt; v2:<br>
&gt;=C2=A0 Since v1 minor typos were fixed, patches rebased onto latest mas=
ter,<br>
&gt;=C2=A0 redundant changes removed (small commits squashed)<br>
&gt;<br>
&gt; v2 -&gt; v3:<br>
&gt;=C2=A0 - QAPI style fixes<br>
&gt;=C2=A0 - Typos fixes in comments<br>
&gt;=C2=A0 - `#include`&#39;s updated to be in sync with recent master<br>
&gt; v3 -&gt; v4:<br>
&gt;=C2=A0 - Support vmnet interfaces isolation feature<br>
&gt;=C2=A0 - Support vmnet-host network uuid setting feature<br>
&gt;=C2=A0 - Refactored sources a bit<br>
&gt; v4 -&gt; v5:<br>
&gt;=C2=A0 - Missed 6.2 boat, now 7.0 candidate<br>
&gt;=C2=A0 - Fix qapi netdev descriptions and styles<br>
&gt;=C2=A0 =C2=A0 (@subnetmask -&gt; @subnet-mask)<br>
&gt;=C2=A0 - Support vmnet-shared IPv6 prefix setting feature<br>
&gt;<br>
&gt; Signed-off-by: Phillip Tennen &lt;<a href=3D"mailto:phillip@axleos.com=
" target=3D"_blank">phillip@axleos.com</a>&gt;<br>
&gt; Signed-off-by: Vladislav Yaroshchuk &lt;<a href=3D"mailto:yaroshchuk20=
00@gmail.com" target=3D"_blank">yaroshchuk2000@gmail.com</a>&gt;<br>
&gt;<br>
&gt; Vladislav Yaroshchuk (6):<br>
&gt;=C2=A0 =C2=A0net/vmnet: add vmnet dependency and customizable option<br=
>
&gt;=C2=A0 =C2=A0net/vmnet: add vmnet backends to qapi/net<br>
&gt;=C2=A0 =C2=A0net/vmnet: implement shared mode (vmnet-shared)<br>
&gt;=C2=A0 =C2=A0net/vmnet: implement host mode (vmnet-host)<br>
&gt;=C2=A0 =C2=A0net/vmnet: implement bridged mode (vmnet-bridged)<br>
&gt;=C2=A0 =C2=A0net/vmnet: update qemu-options.hx<br>
&gt;<br>
&gt;=C2=A0 meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +<br>
&gt;=C2=A0 meson_options.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 net/clients.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 11 ++<br>
&gt;=C2=A0 net/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A07 +<br>
&gt;=C2=A0 net/net.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 10 ++<br>
&gt;=C2=A0 net/vmnet-bridged.m=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 11=
1 ++++++++++++<br>
&gt;=C2=A0 net/vmnet-common.m=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 32=
5 ++++++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 net/vmnet-host.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | 111 ++++++++++++<br>
&gt;=C2=A0 net/vmnet-shared.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 92 ++++++++++<br>
&gt;=C2=A0 net/vmnet_int.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 48 +++++<br>
&gt;=C2=A0 qapi/net.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 127 ++++++++++++-<br>
&gt;=C2=A0 qemu-options.hx=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 25 +++<br>
&gt;=C2=A0 scripts/meson-buildoptions.sh |=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 13 files changed, 874 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 create mode 100644 net/vmnet-bridged.m<br>
&gt;=C2=A0 create mode 100644 net/vmnet-common.m<br>
&gt;=C2=A0 create mode 100644 net/vmnet-host.c<br>
&gt;=C2=A0 create mode 100644 net/vmnet-shared.c<br>
&gt;=C2=A0 create mode 100644 net/vmnet_int.h<br>
&gt;<br>
&gt; --<br>
&gt; 2.23.0<br>
&gt;<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"l=
tr">Best Regards,<div><br><div>Vladislav Yaroshchuk</div></div></div></div>=
</div>

--000000000000f7f44a05d0d1800b--


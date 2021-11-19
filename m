Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C50B945686B
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 03:57:19 +0100 (CET)
Received: from localhost ([::1]:37110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnu5W-0000mV-GX
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 21:57:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mnu3R-0008RP-GP
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 21:55:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mnu3N-0000Vb-1Q
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 21:55:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637290503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ZsQfMHUS35yAOErKVmWnS/n+rmWtfHRwB64Xghtan8=;
 b=S7Mee03lx4zCsBnsWYC7W6pHjkixuvB6U+OeRvsv507cYLe2pnH1PNPhyHWGHREcz/s/lq
 9OdsNc2mkKPrPUvRb2lTTJZHkErhYQi6TpTeh9gjFetqoE5hlmxXruvu/N8+GGz5nChjCl
 JsgoeoP1EJc4dz1hZZFr7cO7GUtUcAs=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-69-sCuw-oGGPpiwu2EEpFISCw-1; Thu, 18 Nov 2021 21:55:00 -0500
X-MC-Unique: sCuw-oGGPpiwu2EEpFISCw-1
Received: by mail-lf1-f69.google.com with SMTP id
 m2-20020a056512014200b0041042b64791so5560509lfo.6
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 18:54:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+ZsQfMHUS35yAOErKVmWnS/n+rmWtfHRwB64Xghtan8=;
 b=XrVZm3sKfp5Lw4ARIBB6JXh2B7VCaLUoEYVcU62hJjaGRdIkMrl2gdu4MKupZ1bddq
 U64IixOfskCoux8IvQFLiW2CnM4p8FpvQJOgaKAKcIvDt2WdjjbgGmrebV71PlQwMAMp
 PEJT5NZ2r4alEzqedQ4/Y8amQGx/797gkcpxJunNAeUBhg+BsTBAY2/Lm7vW3n84jNQt
 CbJyhyLBz/lmZ7kb5Wqz6FtIJNTv/d2ymL8PsJOTRUeTc5K0PyAp0fUvYwnvzWghS5Rh
 Y4JnSab1B0DsOhIvclP32ZqeVqAPUE1kSpza6Zqp0TE3CgayDNCq+fzLZusgVBOYqJyy
 M8Kw==
X-Gm-Message-State: AOAM533Me7Oha2t9YOu31fXM2DlVNYsk10zGsX8ds83MFGxlQBgtzthz
 eJV8RiScPd0ILCaYJrRHRnCaCjkCCBVGGDytJaf1Ihi8+h4fTBADBymTILZhv43QK3Nc4MS3Fdz
 QH6GF+1MgHPwr7PQxuXzXQFtNd+aQwOc=
X-Received: by 2002:a05:6512:685:: with SMTP id
 t5mr30013835lfe.84.1637290498584; 
 Thu, 18 Nov 2021 18:54:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxBjUrBY3LAq4wiFbxz1T1YRgBa6VKvDJlwlZ+PsWRy3BUxCYr8xtjlFv/UNkeVJvXoGQjWgSW2s1/c+tnlGyQ=
X-Received: by 2002:a05:6512:685:: with SMTP id
 t5mr30013795lfe.84.1637290498196; 
 Thu, 18 Nov 2021 18:54:58 -0800 (PST)
MIME-Version: 1.0
References: <20211112091414.34223-1-yaroshchuk2000@gmail.com>
 <CACGkMEuiXy+OhGxq0aR=f0HuvFAbN427m=HL035WuJLsOsGpSg@mail.gmail.com>
 <CADO9X9Rqcn_Bg=pg=14Y=rxXV6AniPAfPTfvHW9=NrXTpjo1oQ@mail.gmail.com>
 <CACGkMEtRg6SmSYm3TH5zc-VWUSKf=n9GKtV9VbVchrE1j-osDA@mail.gmail.com>
 <CADO9X9TXGvPi6DF2gSgaM+=buJCiD-P-4_O8vPfusXG8AGYouA@mail.gmail.com>
 <CACGkMEuSV8d0Hw-SrPGhk+HkwWLhH_x_MF-q5G8quUe_W9a5gw@mail.gmail.com>
 <CADO9X9Rh1bkaPnJZvmwfpgnWB_goQGYsb+gpg5iTqL85C1dP7Q@mail.gmail.com>
In-Reply-To: <CADO9X9Rh1bkaPnJZvmwfpgnWB_goQGYsb+gpg5iTqL85C1dP7Q@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 19 Nov 2021 10:54:47 +0800
Message-ID: <CACGkMEuLxpjPLON5X08dZfxc2NvresJiR52JjW419M81FhAZvA@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] Add vmnet.framework based network backend
To: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, Nov 19, 2021 at 1:42 AM Vladislav Yaroshchuk
<yaroshchuk2000@gmail.com> wrote:
>
>
>
> =D1=81=D1=80, 17 =D0=BD=D0=BE=D1=8F=D0=B1. 2021 =D0=B3. =D0=B2 09:10, Jas=
on Wang <jasowang@redhat.com>:
>>
>> On Tue, Nov 16, 2021 at 11:30 PM Vladislav Yaroshchuk
>> <yaroshchuk2000@gmail.com> wrote:
>> >
>> >
>> >
>> > =D0=B2=D1=82, 16 =D0=BD=D0=BE=D1=8F=D0=B1. 2021 =D0=B3. =D0=B2 10:23, =
Jason Wang <jasowang@redhat.com>:
>> >>
>> >> On Mon, Nov 15, 2021 at 6:45 PM Vladislav Yaroshchuk
>> >> <yaroshchuk2000@gmail.com> wrote:
>> >> >
>> >> >
>> >> >
>> >> > =D0=BF=D0=BD, 15 =D0=BD=D0=BE=D1=8F=D0=B1. 2021 =D0=B3. =D0=B2 07:5=
3, Jason Wang <jasowang@redhat.com>:
>> >> >>
>> >> >> On Fri, Nov 12, 2021 at 5:14 PM Vladislav Yaroshchuk
>> >> >> <yaroshchuk2000@gmail.com> wrote:
>> >> >> >
>> >> >> > macOS provides networking API for VMs called 'vmnet.framework':
>> >> >> > https://developer.apple.com/documentation/vmnet
>> >> >> >
>> >> >> > We can provide its support as the new QEMU network backends whic=
h
>> >> >> > represent three different vmnet.framework interface usage modes:
>> >> >> >
>> >> >> >   * `vmnet-shared`:
>> >> >> >     allows the guest to communicate with other guests in shared =
mode and
>> >> >> >     also with external network (Internet) via NAT. Has (macOS-pr=
ovided)
>> >> >> >     DHCP server; subnet mask and IP range can be configured;
>> >> >> >
>> >> >> >   * `vmnet-host`:
>> >> >> >     allows the guest to communicate with other guests in host mo=
de.
>> >> >> >     By default has enabled DHCP as `vmnet-shared`, but providing
>> >> >> >     network unique id (uuid) can make `vmnet-host` interfaces is=
olated
>> >> >> >     from each other and also disables DHCP.
>> >> >> >
>> >> >> >   * `vmnet-bridged`:
>> >> >> >     bridges the guest with a physical network interface.
>> >> >> >
>> >> >> > This backends cannot work on macOS Catalina 10.15 cause we use
>> >> >> > vmnet.framework API provided only with macOS 11 and newer. Seems
>> >> >> > that it is not a problem, because QEMU guarantees to work on two=
 most
>> >> >> > recent versions of macOS which now are Big Sur (11) and Monterey=
 (12).
>> >> >> >
>> >> >> > Also, we have one inconvenient restriction: vmnet.framework inte=
rfaces
>> >> >> > can create only privileged user:
>> >> >> > `$ sudo qemu-system-x86_64 -nic vmnet-shared`
>> >> >> >
>> >> >> > Attempt of `vmnet-*` netdev creation being unprivileged user fai=
ls with
>> >> >> > vmnet's 'general failure'.
>> >> >> >
>> >> >> > This happens because vmnet.framework requires `com.apple.vm.netw=
orking`
>> >> >> > entitlement which is: "restricted to developers of virtualizatio=
n software.
>> >> >> > To request this entitlement, contact your Apple representative."=
 as Apple
>> >> >> > documentation says:
>> >> >> > https://developer.apple.com/documentation/bundleresources/entitl=
ements/com_apple_vm_networking
>> >> >>
>> >> >> Do you know how multipass work? Looks like it uses vmnet without p=
rivileges.
>> >> >>
>> >> >
>> >> > I've just checked this, and they still need root privileges. They h=
ave a
>> >> > `multipassd` daemon which is launched as root by launchd by default=
.
>> >> >
>> >> > ```
>> >> > bash-5.1$ ps axo ruser,ruid,comm | grep multipass
>> >> > root                 0 /Library/Application Support/com.canonical.m=
ultipass/bin/multipassd
>> >> > root                 0 /Library/Application Support/com.canonical.m=
ultipass/bin/hyperkit
>> >> > ```
>> >> >
>> >> > That's the reason why it's required to 'enter a password' while mul=
tipass installation:
>> >> > it creates launchd plist (kinda launch rule) and places it to /Libr=
ary/LaunchDaemons/,
>> >> > which can be done only with root privileges.
>> >> >
>> >> > ```
>> >> > bash-5.1$ ll /Library/LaunchDaemons | grep multipass
>> >> > -rw-r--r--   1 root  wheel   1.1K 15 Nov 12:47 com.canonical.multip=
assd.plist
>> >> > ```
>> >> >
>> >> > And after this launchd launches this multipassd daemon as root ever=
y boot.
>> >> >
>> >> > So an unprivileged user can launch a multipass VM instance, but act=
ually the
>> >> > `hyperkit` process which interacts with vmnet is gonna be launched =
by multipassd
>> >> > running as root.
>> >>
>> >> I wonder how it passes the vmnet object to qemu? Nothing obvious from
>> >> the qemu command line that multipass launched:
>> >>
>> >> -nic vmnet-macos,mode=3Dshared,model=3Dvirtio-net-pci,mac=3D52:54:00:=
52:e8:e4
>> >>
>> >> (But I haven't had time to check their qemu codes).
>> >>
>> >
>> > It seems they just use QEMU with patch by Phillip Tennen:
>> > https://patchew.org/QEMU/20210218134947.1860-1-phillip.ennen@gmail.com=
/
>> >
>> > In that patch he does quite the same as we in this series, the
>> > difference remains in foreground: he creates one new 'vmnet-macos'
>> > netdev, and uses 'mode=3Dshared' property to choose vmnet
>> > operating mode. I decided to create three different netdevs instead
>> > (vmnet-shared, vmnet-host, vmnet-bridged). Also I've added some
>> > features related to isolation and ipv6.
>>
>> Ok.
>>
>> >
>> > > I wonder how it passes the vmnet object to qemu
>> > I hope I clearly described this.
>>
>> A silly question, how did the 'hyperkit' process pass the vmnet object t=
o qemu?
>>
> I think I didn't describe it very well in the previous mail.
> The 'hyperkit' and QEMU are two multipass 'drivers'.
>
> hyperkit is an independent hypervisor based on xhyve (bhyve):
> https://github.com/moby/hyperkit
>
> So there are many ways to launch multipass VMs:
> * VM <-> hyperkit <-> host
> * VM <-> QEMU <-> host
> * VM <-> virtualbox <-> host
> * etc.
>
> https://discourse.ubuntu.com/t/announcing-the-first-release-candidate-for=
-apple-m1-support/24445
>
> So hyperkit doesn't pass anything to QEMU, it's a separate
> hypervisor and multipass driver. But it uses vmnet backend
> too, the same way as we do:
> https://github.com/moby/hyperkit/blob/2f061e447e1435cdf1b9eda364cea6414f2=
c606b/src/lib/pci_virtio_net_vmnet.c#L250

Ok, I think I get it.

>
>> >
>> >> >
>> >> > tl;dr sadly, we can't interact with vmnet.framework without having =
our binary correctly
>> >> > signed and being an unprivileged user. Root privileges or special s=
ignature with
>> >> > entitlement is required.
>> >>
>> >> This is something similar to what happens in other OS. E.g for the ta=
p
>> >> backend, it can't be created without privileges. So qemu allows to:
>> >>
>> >> 1) the TAP to be created by privileged program like libvirt, and its
>> >> fd could be passed to qemu via SCM_RIGHTS
>> >> 2) run a set-uid helper to create and config TAP
>> >>
>> >> This is something we need to consider now or in the future probably.
>> >>
>> >
>> > Seems we can do nothing with this if we have qemu-bundled &
>> > direct vmnet.framework interaction, it always requires privileges
>> > or entitlement.
>> > The workaround can be moving vmnet-related things to
>> > another helper binary running with privileges, and usage of
>> > this helper somewhere between qemu and vmnet.
>>
>> Yes, that's my point.
>>
>> >
>> > I think for now it's applicable to leave it as is, having qemu
>> > that requires privileges for vmnet.framework usage.
>>
>> Right, but we need to consider it for the future.
>>
>> Btw, if you wish, you can list yourself as the maintainer for this backe=
nd.
>>
>
> Ok, thank you! Let me do this in the next patch version, after
> we finish our discussion and I fix all the issues you pointed
> in your review.

Sure.

Thanks

>
>>
>> Thanks
>>
>> >
>> >>
>> >> Thanks
>> >>
>> >> >
>> >> >
>> >> >> Thanks
>> >> >>
>> >> >
>> >> > Thank you for your review, I will check it this week and reply as s=
oon as possible.
>> >> >
>> >> >>
>> >> >> >
>> >> >> > One more note: we still have quite useful but not supported
>> >> >> > 'vmnet.framework' features as creating port forwarding rules, IP=
v6
>> >> >> > NAT prefix specifying and so on.
>> >> >> >
>> >> >> > Nevertheless, new backends work fine and tested within `qemu-sys=
tem-x86-64`
>> >> >> > on macOS Bir Sur 11.5.2 host with such nic models:
>> >> >> >   * e1000-82545em
>> >> >> >   * virtio-net-pci
>> >> >> >   * vmxnet3
>> >> >> >
>> >> >> > The guests were:
>> >> >> >   * macOS 10.15.7
>> >> >> >   * Ubuntu Bionic (server cloudimg)
>> >> >> >
>> >> >> >
>> >> >> > This series partially reuses patches by Phillip Tennen:
>> >> >> > https://patchew.org/QEMU/20210218134947.1860-1-phillip.ennen@gma=
il.com/
>> >> >> > So I included his signed-off line into one of the commit message=
s and
>> >> >> > also here.
>> >> >> >
>> >> >> > v1 -> v2:
>> >> >> >  Since v1 minor typos were fixed, patches rebased onto latest ma=
ster,
>> >> >> >  redundant changes removed (small commits squashed)
>> >> >> >
>> >> >> > v2 -> v3:
>> >> >> >  - QAPI style fixes
>> >> >> >  - Typos fixes in comments
>> >> >> >  - `#include`'s updated to be in sync with recent master
>> >> >> > v3 -> v4:
>> >> >> >  - Support vmnet interfaces isolation feature
>> >> >> >  - Support vmnet-host network uuid setting feature
>> >> >> >  - Refactored sources a bit
>> >> >> > v4 -> v5:
>> >> >> >  - Missed 6.2 boat, now 7.0 candidate
>> >> >> >  - Fix qapi netdev descriptions and styles
>> >> >> >    (@subnetmask -> @subnet-mask)
>> >> >> >  - Support vmnet-shared IPv6 prefix setting feature
>> >> >> >
>> >> >> > Signed-off-by: Phillip Tennen <phillip@axleos.com>
>> >> >> > Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
>> >> >> >
>> >> >> > Vladislav Yaroshchuk (6):
>> >> >> >   net/vmnet: add vmnet dependency and customizable option
>> >> >> >   net/vmnet: add vmnet backends to qapi/net
>> >> >> >   net/vmnet: implement shared mode (vmnet-shared)
>> >> >> >   net/vmnet: implement host mode (vmnet-host)
>> >> >> >   net/vmnet: implement bridged mode (vmnet-bridged)
>> >> >> >   net/vmnet: update qemu-options.hx
>> >> >> >
>> >> >> >  meson.build                   |   4 +
>> >> >> >  meson_options.txt             |   2 +
>> >> >> >  net/clients.h                 |  11 ++
>> >> >> >  net/meson.build               |   7 +
>> >> >> >  net/net.c                     |  10 ++
>> >> >> >  net/vmnet-bridged.m           | 111 ++++++++++++
>> >> >> >  net/vmnet-common.m            | 325 +++++++++++++++++++++++++++=
+++++++
>> >> >> >  net/vmnet-host.c              | 111 ++++++++++++
>> >> >> >  net/vmnet-shared.c            |  92 ++++++++++
>> >> >> >  net/vmnet_int.h               |  48 +++++
>> >> >> >  qapi/net.json                 | 127 ++++++++++++-
>> >> >> >  qemu-options.hx               |  25 +++
>> >> >> >  scripts/meson-buildoptions.sh |   3 +
>> >> >> >  13 files changed, 874 insertions(+), 2 deletions(-)
>> >> >> >  create mode 100644 net/vmnet-bridged.m
>> >> >> >  create mode 100644 net/vmnet-common.m
>> >> >> >  create mode 100644 net/vmnet-host.c
>> >> >> >  create mode 100644 net/vmnet-shared.c
>> >> >> >  create mode 100644 net/vmnet_int.h
>> >> >> >
>> >> >> > --
>> >> >> > 2.23.0
>> >> >> >
>> >> >>
>> >> >
>> >> >
>> >> > --
>> >> > Best Regards,
>> >> >
>> >> > Vladislav Yaroshchuk
>> >>
>> >
>> >
>> > --
>> > Best Regards,
>> >
>> > Vladislav Yaroshchuk
>>



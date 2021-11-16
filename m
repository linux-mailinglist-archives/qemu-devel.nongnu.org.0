Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A12A7452B8A
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 08:25:27 +0100 (CET)
Received: from localhost ([::1]:39440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmsqM-0001lt-QC
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 02:25:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mmsoX-000157-Hg
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 02:23:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mmsoT-0005l6-VL
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 02:23:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637047408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wHtUAKv/k0CGswozJRCe8+He8r5xgpcUq7ms09l2TVI=;
 b=RsRrMo8WiVGNsDsRg7IWXlimm3+nQlvy9TnED9dykJ+ncSSlhumpqASSXSJccshax5B7lS
 yaupW8cpEygL/BjfXTEs0STEwD/unye+N1VdgLAuWmK7UCPQFmS3ZLgmdLz1aNlKmemf0a
 qYTPjX6ZvAH/Z4aGJaetaQloowCctT0=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-TNDxNfiOPJSj5lv1o3jQfg-1; Tue, 16 Nov 2021 02:23:24 -0500
X-MC-Unique: TNDxNfiOPJSj5lv1o3jQfg-1
Received: by mail-lj1-f199.google.com with SMTP id
 y23-20020a2e3217000000b00218c6ede162so5878022ljy.23
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 23:23:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wHtUAKv/k0CGswozJRCe8+He8r5xgpcUq7ms09l2TVI=;
 b=QCZeKfZLHDfyQrCc4EqZCfsuGMcWDwy+ZRt0KswUrBwByIfYJoTuderPzL42dpZ4gz
 o2qj1qzPeYFR+s1rHhEjDLmQToUutU/5qKQXK1AcCne7D5S8DU398ooRtUtHd/xiIMr+
 H/fiew0uIUr/2rKuyYRfvisA+B1HM1pcoxn3v+6hZTUSr6JDeK7A3ug9yhKbW7xF+Cf4
 XCjOE7a3RoynC7Z1hW8d7HKpKYEAZT4R4yKVALdyIG2GkbzHCKfIMao4BS29ZDceZhOB
 +teg+yWT3cAtya02LzQQ1SOvc30bapr7tDbbbFzEPtjHT+DqUy7q88OVRDBBXaq8K/3A
 WY8w==
X-Gm-Message-State: AOAM532W3B6slEOHvhIQQ5L4TfM5eeViXNPcpA60LeEJuHcI5OQT2yYZ
 YSc2HPQ4PShJcYYDEQdrzxDvs2oNIfo2nzPR1k9cOCynMSwR0G2pdgE4lgXIrnniabaIQqtPGyK
 djIbTzZhnUwAxmOHC2/k78dnPYoUujpU=
X-Received: by 2002:a05:6512:2081:: with SMTP id
 t1mr4716871lfr.348.1637047403132; 
 Mon, 15 Nov 2021 23:23:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyQsnwIE8JQqEzBNOKqOPczzJi5bjEw+F9YT9geb0WdUsxESJzDvtN9QQBSqtFfInn7E7U0BmW+EpQTSk2nkgM=
X-Received: by 2002:a05:6512:2081:: with SMTP id
 t1mr4716826lfr.348.1637047402787; 
 Mon, 15 Nov 2021 23:23:22 -0800 (PST)
MIME-Version: 1.0
References: <20211112091414.34223-1-yaroshchuk2000@gmail.com>
 <CACGkMEuiXy+OhGxq0aR=f0HuvFAbN427m=HL035WuJLsOsGpSg@mail.gmail.com>
 <CADO9X9Rqcn_Bg=pg=14Y=rxXV6AniPAfPTfvHW9=NrXTpjo1oQ@mail.gmail.com>
In-Reply-To: <CADO9X9Rqcn_Bg=pg=14Y=rxXV6AniPAfPTfvHW9=NrXTpjo1oQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 16 Nov 2021 15:23:11 +0800
Message-ID: <CACGkMEtRg6SmSYm3TH5zc-VWUSKf=n9GKtV9VbVchrE1j-osDA@mail.gmail.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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

On Mon, Nov 15, 2021 at 6:45 PM Vladislav Yaroshchuk
<yaroshchuk2000@gmail.com> wrote:
>
>
>
> =D0=BF=D0=BD, 15 =D0=BD=D0=BE=D1=8F=D0=B1. 2021 =D0=B3. =D0=B2 07:53, Jas=
on Wang <jasowang@redhat.com>:
>>
>> On Fri, Nov 12, 2021 at 5:14 PM Vladislav Yaroshchuk
>> <yaroshchuk2000@gmail.com> wrote:
>> >
>> > macOS provides networking API for VMs called 'vmnet.framework':
>> > https://developer.apple.com/documentation/vmnet
>> >
>> > We can provide its support as the new QEMU network backends which
>> > represent three different vmnet.framework interface usage modes:
>> >
>> >   * `vmnet-shared`:
>> >     allows the guest to communicate with other guests in shared mode a=
nd
>> >     also with external network (Internet) via NAT. Has (macOS-provided=
)
>> >     DHCP server; subnet mask and IP range can be configured;
>> >
>> >   * `vmnet-host`:
>> >     allows the guest to communicate with other guests in host mode.
>> >     By default has enabled DHCP as `vmnet-shared`, but providing
>> >     network unique id (uuid) can make `vmnet-host` interfaces isolated
>> >     from each other and also disables DHCP.
>> >
>> >   * `vmnet-bridged`:
>> >     bridges the guest with a physical network interface.
>> >
>> > This backends cannot work on macOS Catalina 10.15 cause we use
>> > vmnet.framework API provided only with macOS 11 and newer. Seems
>> > that it is not a problem, because QEMU guarantees to work on two most
>> > recent versions of macOS which now are Big Sur (11) and Monterey (12).
>> >
>> > Also, we have one inconvenient restriction: vmnet.framework interfaces
>> > can create only privileged user:
>> > `$ sudo qemu-system-x86_64 -nic vmnet-shared`
>> >
>> > Attempt of `vmnet-*` netdev creation being unprivileged user fails wit=
h
>> > vmnet's 'general failure'.
>> >
>> > This happens because vmnet.framework requires `com.apple.vm.networking=
`
>> > entitlement which is: "restricted to developers of virtualization soft=
ware.
>> > To request this entitlement, contact your Apple representative." as Ap=
ple
>> > documentation says:
>> > https://developer.apple.com/documentation/bundleresources/entitlements=
/com_apple_vm_networking
>>
>> Do you know how multipass work? Looks like it uses vmnet without privile=
ges.
>>
>
> I've just checked this, and they still need root privileges. They have a
> `multipassd` daemon which is launched as root by launchd by default.
>
> ```
> bash-5.1$ ps axo ruser,ruid,comm | grep multipass
> root                 0 /Library/Application Support/com.canonical.multipa=
ss/bin/multipassd
> root                 0 /Library/Application Support/com.canonical.multipa=
ss/bin/hyperkit
> ```
>
> That's the reason why it's required to 'enter a password' while multipass=
 installation:
> it creates launchd plist (kinda launch rule) and places it to /Library/La=
unchDaemons/,
> which can be done only with root privileges.
>
> ```
> bash-5.1$ ll /Library/LaunchDaemons | grep multipass
> -rw-r--r--   1 root  wheel   1.1K 15 Nov 12:47 com.canonical.multipassd.p=
list
> ```
>
> And after this launchd launches this multipassd daemon as root every boot=
.
>
> So an unprivileged user can launch a multipass VM instance, but actually =
the
> `hyperkit` process which interacts with vmnet is gonna be launched by mul=
tipassd
> running as root.

I wonder how it passes the vmnet object to qemu? Nothing obvious from
the qemu command line that multipass launched:

-nic vmnet-macos,mode=3Dshared,model=3Dvirtio-net-pci,mac=3D52:54:00:52:e8:=
e4

(But I haven't had time to check their qemu codes).

>
> tl;dr sadly, we can't interact with vmnet.framework without having our bi=
nary correctly
> signed and being an unprivileged user. Root privileges or special signatu=
re with
> entitlement is required.

This is something similar to what happens in other OS. E.g for the tap
backend, it can't be created without privileges. So qemu allows to:

1) the TAP to be created by privileged program like libvirt, and its
fd could be passed to qemu via SCM_RIGHTS
2) run a set-uid helper to create and config TAP

This is something we need to consider now or in the future probably.

Thanks

>
>
>> Thanks
>>
>
> Thank you for your review, I will check it this week and reply as soon as=
 possible.
>
>>
>> >
>> > One more note: we still have quite useful but not supported
>> > 'vmnet.framework' features as creating port forwarding rules, IPv6
>> > NAT prefix specifying and so on.
>> >
>> > Nevertheless, new backends work fine and tested within `qemu-system-x8=
6-64`
>> > on macOS Bir Sur 11.5.2 host with such nic models:
>> >   * e1000-82545em
>> >   * virtio-net-pci
>> >   * vmxnet3
>> >
>> > The guests were:
>> >   * macOS 10.15.7
>> >   * Ubuntu Bionic (server cloudimg)
>> >
>> >
>> > This series partially reuses patches by Phillip Tennen:
>> > https://patchew.org/QEMU/20210218134947.1860-1-phillip.ennen@gmail.com=
/
>> > So I included his signed-off line into one of the commit messages and
>> > also here.
>> >
>> > v1 -> v2:
>> >  Since v1 minor typos were fixed, patches rebased onto latest master,
>> >  redundant changes removed (small commits squashed)
>> >
>> > v2 -> v3:
>> >  - QAPI style fixes
>> >  - Typos fixes in comments
>> >  - `#include`'s updated to be in sync with recent master
>> > v3 -> v4:
>> >  - Support vmnet interfaces isolation feature
>> >  - Support vmnet-host network uuid setting feature
>> >  - Refactored sources a bit
>> > v4 -> v5:
>> >  - Missed 6.2 boat, now 7.0 candidate
>> >  - Fix qapi netdev descriptions and styles
>> >    (@subnetmask -> @subnet-mask)
>> >  - Support vmnet-shared IPv6 prefix setting feature
>> >
>> > Signed-off-by: Phillip Tennen <phillip@axleos.com>
>> > Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
>> >
>> > Vladislav Yaroshchuk (6):
>> >   net/vmnet: add vmnet dependency and customizable option
>> >   net/vmnet: add vmnet backends to qapi/net
>> >   net/vmnet: implement shared mode (vmnet-shared)
>> >   net/vmnet: implement host mode (vmnet-host)
>> >   net/vmnet: implement bridged mode (vmnet-bridged)
>> >   net/vmnet: update qemu-options.hx
>> >
>> >  meson.build                   |   4 +
>> >  meson_options.txt             |   2 +
>> >  net/clients.h                 |  11 ++
>> >  net/meson.build               |   7 +
>> >  net/net.c                     |  10 ++
>> >  net/vmnet-bridged.m           | 111 ++++++++++++
>> >  net/vmnet-common.m            | 325 +++++++++++++++++++++++++++++++++=
+
>> >  net/vmnet-host.c              | 111 ++++++++++++
>> >  net/vmnet-shared.c            |  92 ++++++++++
>> >  net/vmnet_int.h               |  48 +++++
>> >  qapi/net.json                 | 127 ++++++++++++-
>> >  qemu-options.hx               |  25 +++
>> >  scripts/meson-buildoptions.sh |   3 +
>> >  13 files changed, 874 insertions(+), 2 deletions(-)
>> >  create mode 100644 net/vmnet-bridged.m
>> >  create mode 100644 net/vmnet-common.m
>> >  create mode 100644 net/vmnet-host.c
>> >  create mode 100644 net/vmnet-shared.c
>> >  create mode 100644 net/vmnet_int.h
>> >
>> > --
>> > 2.23.0
>> >
>>
>
>
> --
> Best Regards,
>
> Vladislav Yaroshchuk



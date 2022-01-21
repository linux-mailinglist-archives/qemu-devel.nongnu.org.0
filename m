Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0327B496088
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 15:13:35 +0100 (CET)
Received: from localhost ([::1]:47132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAufT-0004Yt-Qb
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 09:13:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nAtZY-0008RM-NR
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 08:03:28 -0500
Received: from [2607:f8b0:4864:20::22c] (port=33750
 helo=mail-oi1-x22c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nAtZV-0001YQ-LK
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 08:03:20 -0500
Received: by mail-oi1-x22c.google.com with SMTP id x193so13509746oix.0
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 05:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mglp5MOT+O7sN3V6pcPEMy7qnlYsZPo/bDJsOShcYKU=;
 b=l9OEyhJbVx7KJTq4BXfStgPHxvQ5OjnYrwYA7Px21+xOhkx510dJh5wSc265i4UT/5
 twUMSxJVNW3A7apB8x/rSMUIg5JlXayJsuUljc98iAlBNUB5iOfxvHXb24i5Ly/iT9k8
 J8MbjYH6dIBXXPhqbhnZnUI92yHSqxD+ueZoCD4cyIH34QOWSK4UbfY/lg8HTgWbX0PX
 ymxTFlhhkpR3acGb34Qr82cAyWNusetvM0K+PiAjYy4vX/b+rrtIjbgMPpjy+UAi276F
 Szya8mwrc2yv3CnXxaDFtw368viEpA+gLxXttMjKTdbTV3jcZImugr7wZETwSO5V7lAx
 ZbPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mglp5MOT+O7sN3V6pcPEMy7qnlYsZPo/bDJsOShcYKU=;
 b=LUELtbyeXXDmknkIeJQceMgxtRqDMu7hHchcxWdMXvOOY6qGqto2JyJwkqAVsEfChH
 ArfclD5v39Kf92M05u+PzlgKwC5UhuspWSdOY69UBs9IylWV82O18Lcn/lHQxftCOalR
 /awAgGNewACje4LVhtSA+yn3eTQBHJMmhffNaLFlVsRxjtEE4q2fuH686OTvb9NQTx5+
 D4NMYs83CX8DoSvA+AmVceiDfi8w9QdeCdUolFUgYpSJORnzq/Cf7urXPuEkkSSSwGet
 nwlqhpVzMVhGL/kZUKCbt+0ajBEiNMjxgTuev9T47TY5XelMA10o1oxhy5UtxlwE/cYT
 eUxA==
X-Gm-Message-State: AOAM533IQwL8OAXN0RjjNY+lC4tV8rJh72CKiDoeYCmT31MZ8Z55ZT+F
 cLtmGlFn6HsfGbNVlTlsfo/dH3SEFnN/Whv6EVE=
X-Google-Smtp-Source: ABdhPJyZkLNzOGoRtcV9misWUAM2pq/zytE4y83/CVLoyb4jowghyqmJORmHpBTO94PgkXf7aqsByy7Ncq2JMM42QTM=
X-Received: by 2002:a54:478b:: with SMTP id o11mr419263oic.11.1642770195430;
 Fri, 21 Jan 2022 05:03:15 -0800 (PST)
MIME-Version: 1.0
References: <20220113172219.66372-1-yaroshchuk2000@gmail.com>
 <20220113172219.66372-3-yaroshchuk2000@gmail.com>
 <YekeHW1GdrIZk3dO@roolebo.dev>
 <CADO9X9QZj+Vgtm6xC1sgjm8w0Szpeph7esVx9G44uq4nfaezWA@mail.gmail.com>
In-Reply-To: <CADO9X9QZj+Vgtm6xC1sgjm8w0Szpeph7esVx9G44uq4nfaezWA@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Fri, 21 Jan 2022 22:03:04 +0900
Message-ID: <CAMVc7JWTOp7apYcz_EeZ-cDcUuFqhF7ChnDamDiAL+aqQDjSUw@mail.gmail.com>
Subject: Re: [PATCH v13 2/7] net/vmnet: add vmnet backends to qapi/net
To: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, phillip.ennen@gmail.com,
 qemu-devel <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Markus Armbruster <armbru@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Phillip Tennen <phillip@axleos.com>,
 Howard Spoelstra <hsp.cat7@gmail.com>, Roman Bolshakov <roman@roolebo.dev>,
 Alessio Dionisi <hello@adns.io>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 21, 2022 at 9:19 PM Vladislav Yaroshchuk
<yaroshchuk2000@gmail.com> wrote:
>
>
> =D1=87=D1=82, 20 =D1=8F=D0=BD=D0=B2. 2022 =D0=B3. =D0=B2 11:32, Roman Bol=
shakov <roman@roolebo.dev>:
>>
>> On Thu, Jan 13, 2022 at 08:22:14PM +0300, Vladislav Yaroshchuk wrote:
>> > Create separate netdevs for each vmnet operating mode:
>> > - vmnet-host
>> > - vmnet-shared
>> > - vmnet-bridged
>> >
>>
>> Sure I'm late to the party but what if we add only one backend - vmnet
>> with default mode set to shared and all parameters are added there?
>>
>> The CLI would look more reasonable for the most typical use case:
>>  -netdev vmnet,id=3Dif1 -device virtio-net,netdev=3Dif1
>>
>> That would remove duplication of options in QAPI schema (e.g. isolated
>> is available in all backends now, altough I'm not sure if it makes sense
>> for bridged mode):
>>
>>  -netdev vmnet,id=3Dif1,isolated=3Dyes
>>
>> start-address, end-address and subnet-mask are also used by both shared
>> and host modes.
>>
>> Bridged netdev would lool like:
>>
>>  -netdev vmnet,id=3Dif1,mode=3Dbridged,ifname=3Den1
>>
>> Checksum offloading also seems to be available for all backends from
>> Monterey.
>>
>> The approach might simplify integration of the changes to libvirt and
>> discovery of upcoming vmnet features via qapi.
>>
>
> I can rewrite this if it sounds more suitable to use
> single `vmnet` netdev instead of three different ones.
> We can discuss this with Markus as a QAPI reviewer.
> Markus, what is your opinion about single netdev?
>
> P.S. Seems we have enough time for discussion:
> I started fixing memory leaks found by Akihiko and
> met a strange deadlock on QEMU shutdown on
> `qemu_mutex_lock_iothread()` during careful
> interface destruction with added semaphore.
> Need to go deeper to understand what's the
> problem, it will take some time.
>
> Mentioned part of Akihiko's review:
> https://patchew.org/QEMU/20220113172219.66372-1-yaroshchuk2000@gmail.com/=
20220113172219.66372-4-yaroshchuk2000@gmail.com/

Actually I thought it would be tricky to implement. A deadlock will
occur in a simple implementation if vmnet_send is already queued but
not executed yet when destructing:
- vmnet_send tries to lock the iothread and waits for the destructor to unl=
ock.
- vmnet_stop_interface waits for vmnet_send finishing.

Though I doubt it is the cause of your deadlock. This deadlock would
not happen frequently since vmnet_send will not be queued if the
device is not used.

Regards,
Akihiko Odaki

>
>
>> Thanks,
>> Roman
>>
>> > Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
>> > ---
>> >  net/clients.h       |  11 ++++
>> >  net/meson.build     |   7 +++
>> >  net/net.c           |  10 ++++
>> >  net/vmnet-bridged.m |  25 +++++++++
>> >  net/vmnet-common.m  |  20 +++++++
>> >  net/vmnet-host.c    |  24 ++++++++
>> >  net/vmnet-shared.c  |  25 +++++++++
>> >  net/vmnet_int.h     |  25 +++++++++
>> >  qapi/net.json       | 133 +++++++++++++++++++++++++++++++++++++++++++=
-
>> >  9 files changed, 278 insertions(+), 2 deletions(-)
>> >  create mode 100644 net/vmnet-bridged.m
>> >  create mode 100644 net/vmnet-common.m
>> >  create mode 100644 net/vmnet-host.c
>> >  create mode 100644 net/vmnet-shared.c
>> >  create mode 100644 net/vmnet_int.h
>> >
>> > diff --git a/net/net.c b/net/net.c
>> > index f0d14dbfc1..1dbb64b935 100644
>> > --- a/net/net.c
>> > +++ b/net/net.c
>> > @@ -1021,6 +1021,11 @@ static int (* const net_client_init_fun[NET_CLI=
ENT_DRIVER__MAX])(
>> >  #ifdef CONFIG_L2TPV3
>> >          [NET_CLIENT_DRIVER_L2TPV3]    =3D net_init_l2tpv3,
>> >  #endif
>> > +#ifdef CONFIG_VMNET
>> > +        [NET_CLIENT_DRIVER_VMNET_HOST] =3D net_init_vmnet_host,
>> > +        [NET_CLIENT_DRIVER_VMNET_SHARED] =3D net_init_vmnet_shared,
>> > +        [NET_CLIENT_DRIVER_VMNET_BRIDGED] =3D net_init_vmnet_bridged,
>> > +#endif /* CONFIG_VMNET */
>> >  };
>> >
>> >
>> > @@ -1106,6 +1111,11 @@ void show_netdevs(void)
>> >  #endif
>> >  #ifdef CONFIG_VHOST_VDPA
>> >          "vhost-vdpa",
>> > +#endif
>> > +#ifdef CONFIG_VMNET
>> > +        "vmnet-host",
>> > +        "vmnet-shared",
>> > +        "vmnet-bridged",
>> >  #endif
>> >      };
>> >
>> > diff --git a/net/vmnet-bridged.m b/net/vmnet-bridged.m
>> > new file mode 100644
>> > index 0000000000..4e42a90391
>> > --- /dev/null
>> > +++ b/net/vmnet-bridged.m
>> > @@ -0,0 +1,25 @@
>> > +/*
>> > + * vmnet-bridged.m
>> > + *
>> > + * Copyright(c) 2021 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
>> > + *
>> > + * This work is licensed under the terms of the GNU GPL, version 2 or=
 later.
>> > + * See the COPYING file in the top-level directory.
>> > + *
>> > + */
>> > +
>> > +#include "qemu/osdep.h"
>> > +#include "qapi/qapi-types-net.h"
>> > +#include "vmnet_int.h"
>> > +#include "clients.h"
>> > +#include "qemu/error-report.h"
>> > +#include "qapi/error.h"
>> > +
>> > +#include <vmnet/vmnet.h>
>> > +
>> > +int net_init_vmnet_bridged(const Netdev *netdev, const char *name,
>> > +                           NetClientState *peer, Error **errp)
>> > +{
>> > +  error_setg(errp, "vmnet-bridged is not implemented yet");
>> > +  return -1;
>> > +}
>> > diff --git a/net/vmnet-common.m b/net/vmnet-common.m
>> > new file mode 100644
>> > index 0000000000..532d152840
>> > --- /dev/null
>> > +++ b/net/vmnet-common.m
>> > @@ -0,0 +1,20 @@
>> > +/*
>> > + * vmnet-common.m - network client wrapper for Apple vmnet.framework
>> > + *
>> > + * Copyright(c) 2021 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
>> > + * Copyright(c) 2021 Phillip Tennen <phillip@axleos.com>
>> > + *
>> > + * This work is licensed under the terms of the GNU GPL, version 2 or=
 later.
>> > + * See the COPYING file in the top-level directory.
>> > + *
>> > + */
>> > +
>> > +#include "qemu/osdep.h"
>> > +#include "qapi/qapi-types-net.h"
>> > +#include "vmnet_int.h"
>> > +#include "clients.h"
>> > +#include "qemu/error-report.h"
>> > +#include "qapi/error.h"
>> > +
>> > +#include <vmnet/vmnet.h>
>> > +
>> > diff --git a/net/vmnet-host.c b/net/vmnet-host.c
>> > new file mode 100644
>> > index 0000000000..4a5ef99dc7
>> > --- /dev/null
>> > +++ b/net/vmnet-host.c
>> > @@ -0,0 +1,24 @@
>> > +/*
>> > + * vmnet-host.c
>> > + *
>> > + * Copyright(c) 2021 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
>> > + *
>> > + * This work is licensed under the terms of the GNU GPL, version 2 or=
 later.
>> > + * See the COPYING file in the top-level directory.
>> > + *
>> > + */
>> > +
>> > +#include "qemu/osdep.h"
>> > +#include "qapi/qapi-types-net.h"
>> > +#include "vmnet_int.h"
>> > +#include "clients.h"
>> > +#include "qemu/error-report.h"
>> > +#include "qapi/error.h"
>> > +
>> > +#include <vmnet/vmnet.h>
>> > +
>> > +int net_init_vmnet_host(const Netdev *netdev, const char *name,
>> > +                        NetClientState *peer, Error **errp) {
>> > +  error_setg(errp, "vmnet-host is not implemented yet");
>> > +  return -1;
>> > +}
>> > diff --git a/net/vmnet-shared.c b/net/vmnet-shared.c
>> > new file mode 100644
>> > index 0000000000..f8c4a4f3b8
>> > --- /dev/null
>> > +++ b/net/vmnet-shared.c
>> > @@ -0,0 +1,25 @@
>> > +/*
>> > + * vmnet-shared.c
>> > + *
>> > + * Copyright(c) 2021 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
>> > + *
>> > + * This work is licensed under the terms of the GNU GPL, version 2 or=
 later.
>> > + * See the COPYING file in the top-level directory.
>> > + *
>> > + */
>> > +
>> > +#include "qemu/osdep.h"
>> > +#include "qapi/qapi-types-net.h"
>> > +#include "vmnet_int.h"
>> > +#include "clients.h"
>> > +#include "qemu/error-report.h"
>> > +#include "qapi/error.h"
>> > +
>> > +#include <vmnet/vmnet.h>
>> > +
>> > +int net_init_vmnet_shared(const Netdev *netdev, const char *name,
>> > +                          NetClientState *peer, Error **errp)
>> > +{
>> > +  error_setg(errp, "vmnet-shared is not implemented yet");
>> > +  return -1;
>> > +}
>> > diff --git a/net/vmnet_int.h b/net/vmnet_int.h
>> > new file mode 100644
>> > index 0000000000..c5982259a4
>> > --- /dev/null
>> > +++ b/net/vmnet_int.h
>> > @@ -0,0 +1,25 @@
>> > +/*
>> > + * vmnet_int.h
>> > + *
>> > + * Copyright(c) 2021 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
>> > + *
>> > + * This work is licensed under the terms of the GNU GPL, version 2 or=
 later.
>> > + * See the COPYING file in the top-level directory.
>> > + *
>> > + */
>> > +#ifndef VMNET_INT_H
>> > +#define VMNET_INT_H
>> > +
>> > +#include "qemu/osdep.h"
>> > +#include "vmnet_int.h"
>> > +#include "clients.h"
>> > +
>> > +#include <vmnet/vmnet.h>
>> > +
>> > +typedef struct VmnetCommonState {
>> > +  NetClientState nc;
>> > +
>> > +} VmnetCommonState;
>> > +
>> > +
>> > +#endif /* VMNET_INT_H */
>> > diff --git a/qapi/net.json b/qapi/net.json
>> > index 7fab2e7cd8..b922e2e34f 100644
>> > --- a/qapi/net.json
>> > +++ b/qapi/net.json
>> > @@ -452,6 +452,120 @@
>> >      '*vhostdev':     'str',
>> >      '*queues':       'int' } }
>> >
>> > +##
>> > +# @NetdevVmnetHostOptions:
>> > +#
>> > +# vmnet (host mode) network backend.
>> > +#
>> > +# Allows the vmnet interface to communicate with other vmnet
>> > +# interfaces that are in host mode and also with the host.
>> > +#
>> > +# @start-address: The starting IPv4 address to use for the interface.
>> > +#                 Must be in the private IP range (RFC 1918). Must be
>> > +#                 specified along with @end-address and @subnet-mask.
>> > +#                 This address is used as the gateway address. The
>> > +#                 subsequent address up to and including end-address =
are
>> > +#                 placed in the DHCP pool.
>> > +#
>> > +# @end-address: The DHCP IPv4 range end address to use for the
>> > +#               interface. Must be in the private IP range (RFC 1918)=
.
>> > +#               Must be specified along with @start-address and
>> > +#               @subnet-mask.
>> > +#
>> > +# @subnet-mask: The IPv4 subnet mask to use on the interface. Must
>> > +#               be specified along with @start-address and @subnet-ma=
sk.
>> > +#
>> > +# @isolated: Enable isolation for this interface. Interface isolation
>> > +#            ensures that vmnet interface is not able to communicate
>> > +#            with any other vmnet interfaces. Only communication with
>> > +#            host is allowed. Available since macOS Big Sur 11.0.
>> > +#
>> > +# @net-uuid: The identifier (UUID) to uniquely identify the isolated
>> > +#            network vmnet interface should be added to. If
>> > +#            set, no DHCP service is provided for this interface and
>> > +#            network communication is allowed only with other interfa=
ces
>> > +#            added to this network identified by the UUID. Available
>> > +#            since macOS Big Sur 11.0.
>> > +#
>> > +# Since: 7.0
>> > +##
>> > +{ 'struct': 'NetdevVmnetHostOptions',
>> > +  'data': {
>> > +    '*start-address': 'str',
>> > +    '*end-address':   'str',
>> > +    '*subnet-mask':   'str',
>> > +    '*isolated':      'bool',
>> > +    '*net-uuid':      'str' },
>> > +  'if': 'CONFIG_VMNET' }
>> > +
>> > +##
>> > +# @NetdevVmnetSharedOptions:
>> > +#
>> > +# vmnet (shared mode) network backend.
>> > +#
>> > +# Allows traffic originating from the vmnet interface to reach the
>> > +# Internet through a network address translator (NAT).
>> > +# The vmnet interface can communicate with the host and with
>> > +# other shared mode interfaces on the same subnet. If no DHCP
>> > +# settings, subnet mask and IPv6 prefix specified, the interface can
>> > +# communicate with any of other interfaces in shared mode.
>> > +#
>> > +# @start-address: The starting IPv4 address to use for the interface.
>> > +#                 Must be in the private IP range (RFC 1918). Must be
>> > +#                 specified along with @end-address and @subnet-mask.
>> > +#                 This address is used as the gateway address. The
>> > +#                 subsequent address up to and including end-address =
are
>> > +#                 placed in the DHCP pool.
>> > +#
>> > +# @end-address: The DHCP IPv4 range end address to use for the
>> > +#               interface. Must be in the private IP range (RFC 1918)=
.
>> > +#               Must be specified along with @start-address and @subn=
et-mask.
>> > +#
>> > +# @subnet-mask: The IPv4 subnet mask to use on the interface. Must
>> > +#                be specified along with @start-address and @subnet-m=
ask.
>> > +#
>> > +# @isolated: Enable isolation for this interface. Interface isolation
>> > +#            ensures that vmnet interface is not able to communicate
>> > +#            with any other vmnet interfaces. Only communication with
>> > +#            host is allowed. Available since macOS Big Sur 11.0.
>> > +#
>> > +# @nat66-prefix: The IPv6 prefix to use into guest network. Must be a
>> > +#                unique local address i.e. start with fd00::/8 and ha=
ve
>> > +#                length of 64.
>> > +#
>> > +# Since: 7.0
>> > +##
>> > +{ 'struct': 'NetdevVmnetSharedOptions',
>> > +  'data': {
>> > +    '*start-address': 'str',
>> > +    '*end-address':   'str',
>> > +    '*subnet-mask':   'str',
>> > +    '*isolated':      'bool',
>> > +    '*nat66-prefix':  'str' },
>> > +  'if': 'CONFIG_VMNET' }
>> > +
>> > +##
>> > +# @NetdevVmnetBridgedOptions:
>> > +#
>> > +# vmnet (bridged mode) network backend.
>> > +#
>> > +# Bridges the vmnet interface with a physical network interface.
>> > +#
>> > +# @ifname: The name of the physical interface to be bridged.
>> > +#
>> > +# @isolated: Enable isolation for this interface. Interface isolation
>> > +#            ensures that vmnet interface is not able to communicate
>> > +#            with any other vmnet interfaces. Only communication with
>> > +#            host is allowed. Available since macOS Big Sur 11.0.
>> > +#
>> > +# Since: 7.0
>> > +##
>> > +{ 'struct': 'NetdevVmnetBridgedOptions',
>> > +  'data': {
>> > +    'ifname':     'str',
>> > +    '*isolated':  'bool' },
>> > +  'if': 'CONFIG_VMNET' }
>> > +
>> >  ##
>> >  # @NetClientDriver:
>> >  #
>> > @@ -460,10 +574,16 @@
>> >  # Since: 2.7
>> >  #
>> >  #        @vhost-vdpa since 5.1
>> > +#        @vmnet-host since 7.0
>> > +#        @vmnet-shared since 7.0
>> > +#        @vmnet-bridged since 7.0
>> >  ##
>> >  { 'enum': 'NetClientDriver',
>> >    'data': [ 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socket', 'vde',
>> > -            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa'=
 ] }
>> > +            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa'=
,
>> > +            { 'name': 'vmnet-host', 'if': 'CONFIG_VMNET' },
>> > +            { 'name': 'vmnet-shared', 'if': 'CONFIG_VMNET' },
>> > +            { 'name': 'vmnet-bridged', 'if': 'CONFIG_VMNET' }] }
>> >
>> >  ##
>> >  # @Netdev:
>> > @@ -477,6 +597,9 @@
>> >  # Since: 1.2
>> >  #
>> >  #        'l2tpv3' - since 2.1
>> > +#        'vmnet-host' - since 7.0
>> > +#        'vmnet-shared' - since 7.0
>> > +#        'vmnet-bridged' - since 7.0
>> >  ##
>> >  { 'union': 'Netdev',
>> >    'base': { 'id': 'str', 'type': 'NetClientDriver' },
>> > @@ -492,7 +615,13 @@
>> >      'hubport':  'NetdevHubPortOptions',
>> >      'netmap':   'NetdevNetmapOptions',
>> >      'vhost-user': 'NetdevVhostUserOptions',
>> > -    'vhost-vdpa': 'NetdevVhostVDPAOptions' } }
>> > +    'vhost-vdpa': 'NetdevVhostVDPAOptions',
>> > +    'vmnet-host': { 'type': 'NetdevVmnetHostOptions',
>> > +                    'if': 'CONFIG_VMNET' },
>> > +    'vmnet-shared': { 'type': 'NetdevVmnetSharedOptions',
>> > +                      'if': 'CONFIG_VMNET' },
>> > +    'vmnet-bridged': { 'type': 'NetdevVmnetBridgedOptions',
>> > +                       'if': 'CONFIG_VMNET' } } }
>> >
>> >  ##
>> >  # @RxState:
>> > --
>> > 2.23.0
>> >
>
>
>
> --
> Best Regards,
>
> Vladislav Yaroshchuk


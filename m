Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35968495F2B
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 13:42:27 +0100 (CET)
Received: from localhost ([::1]:34350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAtFH-0001la-7N
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 07:42:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1nAstg-0007Xu-Ke
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 07:20:05 -0500
Received: from [2607:f8b0:4864:20::430] (port=41712
 helo=mail-pf1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1nAstd-0000e5-4s
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 07:20:04 -0500
Received: by mail-pf1-x430.google.com with SMTP id x37so4746224pfh.8
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 04:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bXhKrTnLRx4GmWxnGC4YThz6GZGI/QThpsxaG0KP7F4=;
 b=qdwpRQ5+4RYX6UTtgTwcK4GU1eCyOxjckywxol8wPIBYwJi1P2ua1YsUegA14KrxjV
 Jgw28t4+oMuoXYrI15ZLl52a6XeoHgGtxu9oAKJdO1qh/7NXeZj3VbagZ0R2eVJgv8Ym
 hFxNoPp8z9C061JAT+uUE7Ii4+FxF0yo2A7msoWJXZCZDnMmSQHS9DpKqa18ZbT8eSlK
 wqH6rm/nAc/Oe67Moic+8vFq8YlXlTcj9IoMTTqeFlA7sQ5b6SJP2H79xhimG8tQMrf/
 fQHvkfxhS+Oxwv9mpkcF8S8AnjYqQo3MmAH5KcNE8GPuiYQqFyd2EJbLR1PC4zOY1B18
 qkCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bXhKrTnLRx4GmWxnGC4YThz6GZGI/QThpsxaG0KP7F4=;
 b=jaWo6CFw8KO7CaxQbUFqIEYK908iP47UcJMw4pq3jQn0YfFy+KC+DNDkxIq8UbiFkg
 ARNgsLeRRMh5kmV8fRyWzHzoB7Hg4KAXz9qAYiydztiLsdx1p5xFcjfZ7Na6uyGHvaxU
 ph2D7yxa0v9GfPt8e6H/scjHw8dW3q+BbaOVqZlN1UANnIM5651xF2Sy0AwK4o1w58RA
 63/KELMlzUSWvoLToDjzuKNS7BJqsyDbQqw33Dy+d129/76AVqbAZQ8w4rT7GxEHW0ay
 fGQvdnFnM1u/f1Oi3XRpT4cPz83Yl3PhzivP4yCq8gtLfiB3zGU8ZYE6AR2KTP/YJhG5
 ENsg==
X-Gm-Message-State: AOAM5319SHy7EU//TndtRFWbn8QNdHs9W/RiAmjoDq7o2kq29z3M37ND
 wzp0ouj01tHOYBho5mA1iVWibe0my4NTMB+aSxI=
X-Google-Smtp-Source: ABdhPJyvTDcT6WHbVUAlEmmRG9/hmjdww/SCWEpmslxlb0NNxP0vYaSLVfOTODTLAeZ/VF/reSVBJNhc+TXy4YxLd4M=
X-Received: by 2002:a65:4685:: with SMTP id h5mr2780072pgr.14.1642767594821;
 Fri, 21 Jan 2022 04:19:54 -0800 (PST)
MIME-Version: 1.0
References: <20220113172219.66372-1-yaroshchuk2000@gmail.com>
 <20220113172219.66372-3-yaroshchuk2000@gmail.com>
 <YekeHW1GdrIZk3dO@roolebo.dev>
In-Reply-To: <YekeHW1GdrIZk3dO@roolebo.dev>
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Date: Fri, 21 Jan 2022 15:19:43 +0300
Message-ID: <CADO9X9QZj+Vgtm6xC1sgjm8w0Szpeph7esVx9G44uq4nfaezWA@mail.gmail.com>
Subject: Re: [PATCH v13 2/7] net/vmnet: add vmnet backends to qapi/net
To: Roman Bolshakov <roman@roolebo.dev>
Content-Type: multipart/alternative; boundary="000000000000f01c1005d616a229"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::430
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-pf1-x430.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>, phillip.ennen@gmail.com,
 qemu-devel <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Markus Armbruster <armbru@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Phillip Tennen <phillip@axleos.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Howard Spoelstra <hsp.cat7@gmail.com>,
 Alessio Dionisi <hello@adns.io>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f01c1005d616a229
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 20 =D1=8F=D0=BD=D0=B2. 2022 =D0=B3. =D0=B2 11:32, Roman Bolsh=
akov <roman@roolebo.dev>:

> On Thu, Jan 13, 2022 at 08:22:14PM +0300, Vladislav Yaroshchuk wrote:
> > Create separate netdevs for each vmnet operating mode:
> > - vmnet-host
> > - vmnet-shared
> > - vmnet-bridged
> >
>
> Sure I'm late to the party but what if we add only one backend - vmnet
> with default mode set to shared and all parameters are added there?
>
> The CLI would look more reasonable for the most typical use case:
>  -netdev vmnet,id=3Dif1 -device virtio-net,netdev=3Dif1
>
> That would remove duplication of options in QAPI schema (e.g. isolated
> is available in all backends now, altough I'm not sure if it makes sense
> for bridged mode):
>
>  -netdev vmnet,id=3Dif1,isolated=3Dyes
>
> start-address, end-address and subnet-mask are also used by both shared
> and host modes.
>
> Bridged netdev would lool like:
>
>  -netdev vmnet,id=3Dif1,mode=3Dbridged,ifname=3Den1
>
> Checksum offloading also seems to be available for all backends from
> Monterey.
>
> The approach might simplify integration of the changes to libvirt and
> discovery of upcoming vmnet features via qapi.
>
>
I can rewrite this if it sounds more suitable to use
single `vmnet` netdev instead of three different ones.
We can discuss this with Markus as a QAPI reviewer.
Markus, what is your opinion about single netdev?

P.S. Seems we have enough time for discussion:
I started fixing memory leaks found by Akihiko and
met a strange deadlock on QEMU shutdown on
`qemu_mutex_lock_iothread()` during careful
interface destruction with added semaphore.
Need to go deeper to understand what's the
problem, it will take some time.

Mentioned part of Akihiko's review:
https://patchew.org/QEMU/20220113172219.66372-1-yaroshchuk2000@gmail.com/20=
220113172219.66372-4-yaroshchuk2000@gmail.com/


Thanks,
> Roman
>
> > Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> > ---
> >  net/clients.h       |  11 ++++
> >  net/meson.build     |   7 +++
> >  net/net.c           |  10 ++++
> >  net/vmnet-bridged.m |  25 +++++++++
> >  net/vmnet-common.m  |  20 +++++++
> >  net/vmnet-host.c    |  24 ++++++++
> >  net/vmnet-shared.c  |  25 +++++++++
> >  net/vmnet_int.h     |  25 +++++++++
> >  qapi/net.json       | 133 +++++++++++++++++++++++++++++++++++++++++++-
> >  9 files changed, 278 insertions(+), 2 deletions(-)
> >  create mode 100644 net/vmnet-bridged.m
> >  create mode 100644 net/vmnet-common.m
> >  create mode 100644 net/vmnet-host.c
> >  create mode 100644 net/vmnet-shared.c
> >  create mode 100644 net/vmnet_int.h
> >
> > diff --git a/net/net.c b/net/net.c
> > index f0d14dbfc1..1dbb64b935 100644
> > --- a/net/net.c
> > +++ b/net/net.c
> > @@ -1021,6 +1021,11 @@ static int (* const
> net_client_init_fun[NET_CLIENT_DRIVER__MAX])(
> >  #ifdef CONFIG_L2TPV3
> >          [NET_CLIENT_DRIVER_L2TPV3]    =3D net_init_l2tpv3,
> >  #endif
> > +#ifdef CONFIG_VMNET
> > +        [NET_CLIENT_DRIVER_VMNET_HOST] =3D net_init_vmnet_host,
> > +        [NET_CLIENT_DRIVER_VMNET_SHARED] =3D net_init_vmnet_shared,
> > +        [NET_CLIENT_DRIVER_VMNET_BRIDGED] =3D net_init_vmnet_bridged,
> > +#endif /* CONFIG_VMNET */
> >  };
> >
> >
> > @@ -1106,6 +1111,11 @@ void show_netdevs(void)
> >  #endif
> >  #ifdef CONFIG_VHOST_VDPA
> >          "vhost-vdpa",
> > +#endif
> > +#ifdef CONFIG_VMNET
> > +        "vmnet-host",
> > +        "vmnet-shared",
> > +        "vmnet-bridged",
> >  #endif
> >      };
> >
> > diff --git a/net/vmnet-bridged.m b/net/vmnet-bridged.m
> > new file mode 100644
> > index 0000000000..4e42a90391
> > --- /dev/null
> > +++ b/net/vmnet-bridged.m
> > @@ -0,0 +1,25 @@
> > +/*
> > + * vmnet-bridged.m
> > + *
> > + * Copyright(c) 2021 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> > + * See the COPYING file in the top-level directory.
> > + *
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qapi/qapi-types-net.h"
> > +#include "vmnet_int.h"
> > +#include "clients.h"
> > +#include "qemu/error-report.h"
> > +#include "qapi/error.h"
> > +
> > +#include <vmnet/vmnet.h>
> > +
> > +int net_init_vmnet_bridged(const Netdev *netdev, const char *name,
> > +                           NetClientState *peer, Error **errp)
> > +{
> > +  error_setg(errp, "vmnet-bridged is not implemented yet");
> > +  return -1;
> > +}
> > diff --git a/net/vmnet-common.m b/net/vmnet-common.m
> > new file mode 100644
> > index 0000000000..532d152840
> > --- /dev/null
> > +++ b/net/vmnet-common.m
> > @@ -0,0 +1,20 @@
> > +/*
> > + * vmnet-common.m - network client wrapper for Apple vmnet.framework
> > + *
> > + * Copyright(c) 2021 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> > + * Copyright(c) 2021 Phillip Tennen <phillip@axleos.com>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> > + * See the COPYING file in the top-level directory.
> > + *
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qapi/qapi-types-net.h"
> > +#include "vmnet_int.h"
> > +#include "clients.h"
> > +#include "qemu/error-report.h"
> > +#include "qapi/error.h"
> > +
> > +#include <vmnet/vmnet.h>
> > +
> > diff --git a/net/vmnet-host.c b/net/vmnet-host.c
> > new file mode 100644
> > index 0000000000..4a5ef99dc7
> > --- /dev/null
> > +++ b/net/vmnet-host.c
> > @@ -0,0 +1,24 @@
> > +/*
> > + * vmnet-host.c
> > + *
> > + * Copyright(c) 2021 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> > + * See the COPYING file in the top-level directory.
> > + *
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qapi/qapi-types-net.h"
> > +#include "vmnet_int.h"
> > +#include "clients.h"
> > +#include "qemu/error-report.h"
> > +#include "qapi/error.h"
> > +
> > +#include <vmnet/vmnet.h>
> > +
> > +int net_init_vmnet_host(const Netdev *netdev, const char *name,
> > +                        NetClientState *peer, Error **errp) {
> > +  error_setg(errp, "vmnet-host is not implemented yet");
> > +  return -1;
> > +}
> > diff --git a/net/vmnet-shared.c b/net/vmnet-shared.c
> > new file mode 100644
> > index 0000000000..f8c4a4f3b8
> > --- /dev/null
> > +++ b/net/vmnet-shared.c
> > @@ -0,0 +1,25 @@
> > +/*
> > + * vmnet-shared.c
> > + *
> > + * Copyright(c) 2021 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> > + * See the COPYING file in the top-level directory.
> > + *
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qapi/qapi-types-net.h"
> > +#include "vmnet_int.h"
> > +#include "clients.h"
> > +#include "qemu/error-report.h"
> > +#include "qapi/error.h"
> > +
> > +#include <vmnet/vmnet.h>
> > +
> > +int net_init_vmnet_shared(const Netdev *netdev, const char *name,
> > +                          NetClientState *peer, Error **errp)
> > +{
> > +  error_setg(errp, "vmnet-shared is not implemented yet");
> > +  return -1;
> > +}
> > diff --git a/net/vmnet_int.h b/net/vmnet_int.h
> > new file mode 100644
> > index 0000000000..c5982259a4
> > --- /dev/null
> > +++ b/net/vmnet_int.h
> > @@ -0,0 +1,25 @@
> > +/*
> > + * vmnet_int.h
> > + *
> > + * Copyright(c) 2021 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> > + * See the COPYING file in the top-level directory.
> > + *
> > + */
> > +#ifndef VMNET_INT_H
> > +#define VMNET_INT_H
> > +
> > +#include "qemu/osdep.h"
> > +#include "vmnet_int.h"
> > +#include "clients.h"
> > +
> > +#include <vmnet/vmnet.h>
> > +
> > +typedef struct VmnetCommonState {
> > +  NetClientState nc;
> > +
> > +} VmnetCommonState;
> > +
> > +
> > +#endif /* VMNET_INT_H */
> > diff --git a/qapi/net.json b/qapi/net.json
> > index 7fab2e7cd8..b922e2e34f 100644
> > --- a/qapi/net.json
> > +++ b/qapi/net.json
> > @@ -452,6 +452,120 @@
> >      '*vhostdev':     'str',
> >      '*queues':       'int' } }
> >
> > +##
> > +# @NetdevVmnetHostOptions:
> > +#
> > +# vmnet (host mode) network backend.
> > +#
> > +# Allows the vmnet interface to communicate with other vmnet
> > +# interfaces that are in host mode and also with the host.
> > +#
> > +# @start-address: The starting IPv4 address to use for the interface.
> > +#                 Must be in the private IP range (RFC 1918). Must be
> > +#                 specified along with @end-address and @subnet-mask.
> > +#                 This address is used as the gateway address. The
> > +#                 subsequent address up to and including end-address a=
re
> > +#                 placed in the DHCP pool.
> > +#
> > +# @end-address: The DHCP IPv4 range end address to use for the
> > +#               interface. Must be in the private IP range (RFC 1918).
> > +#               Must be specified along with @start-address and
> > +#               @subnet-mask.
> > +#
> > +# @subnet-mask: The IPv4 subnet mask to use on the interface. Must
> > +#               be specified along with @start-address and @subnet-mas=
k.
> > +#
> > +# @isolated: Enable isolation for this interface. Interface isolation
> > +#            ensures that vmnet interface is not able to communicate
> > +#            with any other vmnet interfaces. Only communication with
> > +#            host is allowed. Available since macOS Big Sur 11.0.
> > +#
> > +# @net-uuid: The identifier (UUID) to uniquely identify the isolated
> > +#            network vmnet interface should be added to. If
> > +#            set, no DHCP service is provided for this interface and
> > +#            network communication is allowed only with other interfac=
es
> > +#            added to this network identified by the UUID. Available
> > +#            since macOS Big Sur 11.0.
> > +#
> > +# Since: 7.0
> > +##
> > +{ 'struct': 'NetdevVmnetHostOptions',
> > +  'data': {
> > +    '*start-address': 'str',
> > +    '*end-address':   'str',
> > +    '*subnet-mask':   'str',
> > +    '*isolated':      'bool',
> > +    '*net-uuid':      'str' },
> > +  'if': 'CONFIG_VMNET' }
> > +
> > +##
> > +# @NetdevVmnetSharedOptions:
> > +#
> > +# vmnet (shared mode) network backend.
> > +#
> > +# Allows traffic originating from the vmnet interface to reach the
> > +# Internet through a network address translator (NAT).
> > +# The vmnet interface can communicate with the host and with
> > +# other shared mode interfaces on the same subnet. If no DHCP
> > +# settings, subnet mask and IPv6 prefix specified, the interface can
> > +# communicate with any of other interfaces in shared mode.
> > +#
> > +# @start-address: The starting IPv4 address to use for the interface.
> > +#                 Must be in the private IP range (RFC 1918). Must be
> > +#                 specified along with @end-address and @subnet-mask.
> > +#                 This address is used as the gateway address. The
> > +#                 subsequent address up to and including end-address a=
re
> > +#                 placed in the DHCP pool.
> > +#
> > +# @end-address: The DHCP IPv4 range end address to use for the
> > +#               interface. Must be in the private IP range (RFC 1918).
> > +#               Must be specified along with @start-address and
> @subnet-mask.
> > +#
> > +# @subnet-mask: The IPv4 subnet mask to use on the interface. Must
> > +#                be specified along with @start-address and
> @subnet-mask.
> > +#
> > +# @isolated: Enable isolation for this interface. Interface isolation
> > +#            ensures that vmnet interface is not able to communicate
> > +#            with any other vmnet interfaces. Only communication with
> > +#            host is allowed. Available since macOS Big Sur 11.0.
> > +#
> > +# @nat66-prefix: The IPv6 prefix to use into guest network. Must be a
> > +#                unique local address i.e. start with fd00::/8 and hav=
e
> > +#                length of 64.
> > +#
> > +# Since: 7.0
> > +##
> > +{ 'struct': 'NetdevVmnetSharedOptions',
> > +  'data': {
> > +    '*start-address': 'str',
> > +    '*end-address':   'str',
> > +    '*subnet-mask':   'str',
> > +    '*isolated':      'bool',
> > +    '*nat66-prefix':  'str' },
> > +  'if': 'CONFIG_VMNET' }
> > +
> > +##
> > +# @NetdevVmnetBridgedOptions:
> > +#
> > +# vmnet (bridged mode) network backend.
> > +#
> > +# Bridges the vmnet interface with a physical network interface.
> > +#
> > +# @ifname: The name of the physical interface to be bridged.
> > +#
> > +# @isolated: Enable isolation for this interface. Interface isolation
> > +#            ensures that vmnet interface is not able to communicate
> > +#            with any other vmnet interfaces. Only communication with
> > +#            host is allowed. Available since macOS Big Sur 11.0.
> > +#
> > +# Since: 7.0
> > +##
> > +{ 'struct': 'NetdevVmnetBridgedOptions',
> > +  'data': {
> > +    'ifname':     'str',
> > +    '*isolated':  'bool' },
> > +  'if': 'CONFIG_VMNET' }
> > +
> >  ##
> >  # @NetClientDriver:
> >  #
> > @@ -460,10 +574,16 @@
> >  # Since: 2.7
> >  #
> >  #        @vhost-vdpa since 5.1
> > +#        @vmnet-host since 7.0
> > +#        @vmnet-shared since 7.0
> > +#        @vmnet-bridged since 7.0
> >  ##
> >  { 'enum': 'NetClientDriver',
> >    'data': [ 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socket', 'vde',
> > -            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa' =
]
> }
> > +            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa',
> > +            { 'name': 'vmnet-host', 'if': 'CONFIG_VMNET' },
> > +            { 'name': 'vmnet-shared', 'if': 'CONFIG_VMNET' },
> > +            { 'name': 'vmnet-bridged', 'if': 'CONFIG_VMNET' }] }
> >
> >  ##
> >  # @Netdev:
> > @@ -477,6 +597,9 @@
> >  # Since: 1.2
> >  #
> >  #        'l2tpv3' - since 2.1
> > +#        'vmnet-host' - since 7.0
> > +#        'vmnet-shared' - since 7.0
> > +#        'vmnet-bridged' - since 7.0
> >  ##
> >  { 'union': 'Netdev',
> >    'base': { 'id': 'str', 'type': 'NetClientDriver' },
> > @@ -492,7 +615,13 @@
> >      'hubport':  'NetdevHubPortOptions',
> >      'netmap':   'NetdevNetmapOptions',
> >      'vhost-user': 'NetdevVhostUserOptions',
> > -    'vhost-vdpa': 'NetdevVhostVDPAOptions' } }
> > +    'vhost-vdpa': 'NetdevVhostVDPAOptions',
> > +    'vmnet-host': { 'type': 'NetdevVmnetHostOptions',
> > +                    'if': 'CONFIG_VMNET' },
> > +    'vmnet-shared': { 'type': 'NetdevVmnetSharedOptions',
> > +                      'if': 'CONFIG_VMNET' },
> > +    'vmnet-bridged': { 'type': 'NetdevVmnetBridgedOptions',
> > +                       'if': 'CONFIG_VMNET' } } }
> >
> >  ##
> >  # @RxState:
> > --
> > 2.23.0
> >
>


--=20
Best Regards,

Vladislav Yaroshchuk

--000000000000f01c1005d616a229
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">=D1=87=D1=82, 20 =D1=8F=D0=BD=D0=B2. 2022=
 =D0=B3. =D0=B2 11:32, Roman Bolshakov &lt;<a href=3D"mailto:roman@roolebo.=
dev" target=3D"_blank">roman@roolebo.dev</a>&gt;:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On Thu, Jan 13, 2022 at 08:22:14PM +0300,=
 Vladislav Yaroshchuk wrote:<br>
&gt; Create separate netdevs for each vmnet operating mode:<br>
&gt; - vmnet-host<br>
&gt; - vmnet-shared<br>
&gt; - vmnet-bridged<br>
&gt; <br>
<br>
Sure I&#39;m late to the party but what if we add only one backend - vmnet<=
br>
with default mode set to shared and all parameters are added there?<br>
<br>
The CLI would look more reasonable for the most typical use case:<br>
=C2=A0-netdev vmnet,id=3Dif1 -device virtio-net,netdev=3Dif1<br>
<br>
That would remove duplication of options in QAPI schema (e.g. isolated<br>
is available in all backends now, altough I&#39;m not sure if it makes sens=
e<br>
for bridged mode):<br>
<br>
=C2=A0-netdev vmnet,id=3Dif1,isolated=3Dyes<br>
<br>
start-address, end-address and subnet-mask are also used by both shared<br>
and host modes.<br>
<br>
Bridged netdev would lool like:<br>
<br>
=C2=A0-netdev vmnet,id=3Dif1,mode=3Dbridged,ifname=3Den1<br>
<br>
Checksum offloading also seems to be available for all backends from<br>
Monterey.<br>
<br>
The approach might simplify integration of the changes to libvirt and<br>
discovery of upcoming vmnet features via qapi.<br>
<br></blockquote><div><br></div><div>I can rewrite this if it sounds more s=
uitable to use</div><div>single `vmnet` netdev instead of three different=
=C2=A0ones.=C2=A0</div><div>We can discuss this with Markus as a QAPI revie=
wer.</div><div>Markus, what is your opinion about single netdev?<br></div><=
div><br></div><div>P.S. Seems we have enough time for discussion:</div><div=
>I started fixing memory leaks found by=C2=A0Akihiko and=C2=A0</div><div>me=
t a strange deadlock on QEMU shutdown on=C2=A0</div><div>`qemu_mutex_lock_i=
othread()` during careful=C2=A0</div><div>interface destruction with added =
semaphore.=C2=A0</div><div>Need to go deeper to understand what&#39;s the=
=C2=A0</div><div>problem, it will take some time.</div><div><br></div><div>=
Mentioned part of Akihiko&#39;s review:</div><div><a href=3D"https://patche=
w.org/QEMU/20220113172219.66372-1-yaroshchuk2000@gmail.com/20220113172219.6=
6372-4-yaroshchuk2000@gmail.com/" target=3D"_blank">https://patchew.org/QEM=
U/20220113172219.66372-1-yaroshchuk2000@gmail.com/20220113172219.66372-4-ya=
roshchuk2000@gmail.com/</a></div><div><br></div><div><br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
Thanks,<br>
Roman<br>
<br>
&gt; Signed-off-by: Vladislav Yaroshchuk &lt;<a href=3D"mailto:yaroshchuk20=
00@gmail.com" target=3D"_blank">yaroshchuk2000@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 net/clients.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 11 ++++<br>
&gt;=C2=A0 net/meson.build=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A07 +++<br>
&gt;=C2=A0 net/net.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 10 +++=
+<br>
&gt;=C2=A0 net/vmnet-bridged.m |=C2=A0 25 +++++++++<br>
&gt;=C2=A0 net/vmnet-common.m=C2=A0 |=C2=A0 20 +++++++<br>
&gt;=C2=A0 net/vmnet-host.c=C2=A0 =C2=A0 |=C2=A0 24 ++++++++<br>
&gt;=C2=A0 net/vmnet-shared.c=C2=A0 |=C2=A0 25 +++++++++<br>
&gt;=C2=A0 net/vmnet_int.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 25 +++++++++<br>
&gt;=C2=A0 qapi/net.json=C2=A0 =C2=A0 =C2=A0 =C2=A0| 133 ++++++++++++++++++=
+++++++++++++++++++++++++-<br>
&gt;=C2=A0 9 files changed, 278 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 create mode 100644 net/vmnet-bridged.m<br>
&gt;=C2=A0 create mode 100644 net/vmnet-common.m<br>
&gt;=C2=A0 create mode 100644 net/vmnet-host.c<br>
&gt;=C2=A0 create mode 100644 net/vmnet-shared.c<br>
&gt;=C2=A0 create mode 100644 net/vmnet_int.h<br>
&gt; <br>
&gt; diff --git a/net/net.c b/net/net.c<br>
&gt; index f0d14dbfc1..1dbb64b935 100644<br>
&gt; --- a/net/net.c<br>
&gt; +++ b/net/net.c<br>
&gt; @@ -1021,6 +1021,11 @@ static int (* const net_client_init_fun[NET_CLI=
ENT_DRIVER__MAX])(<br>
&gt;=C2=A0 #ifdef CONFIG_L2TPV3<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [NET_CLIENT_DRIVER_L2TPV3]=C2=A0 =C2=
=A0 =3D net_init_l2tpv3,<br>
&gt;=C2=A0 #endif<br>
&gt; +#ifdef CONFIG_VMNET<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [NET_CLIENT_DRIVER_VMNET_HOST] =3D net_in=
it_vmnet_host,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [NET_CLIENT_DRIVER_VMNET_SHARED] =3D net_=
init_vmnet_shared,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [NET_CLIENT_DRIVER_VMNET_BRIDGED] =3D net=
_init_vmnet_bridged,<br>
&gt; +#endif /* CONFIG_VMNET */<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt; @@ -1106,6 +1111,11 @@ void show_netdevs(void)<br>
&gt;=C2=A0 #endif<br>
&gt;=C2=A0 #ifdef CONFIG_VHOST_VDPA<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;vhost-vdpa&quot;,<br>
&gt; +#endif<br>
&gt; +#ifdef CONFIG_VMNET<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;vmnet-host&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;vmnet-shared&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;vmnet-bridged&quot;,<br>
&gt;=C2=A0 #endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; diff --git a/net/vmnet-bridged.m b/net/vmnet-bridged.m<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..4e42a90391<br>
&gt; --- /dev/null<br>
&gt; +++ b/net/vmnet-bridged.m<br>
&gt; @@ -0,0 +1,25 @@<br>
&gt; +/*<br>
&gt; + * vmnet-bridged.m<br>
&gt; + *<br>
&gt; + * Copyright(c) 2021 Vladislav Yaroshchuk &lt;<a href=3D"mailto:yaros=
hchuk2000@gmail.com" target=3D"_blank">yaroshchuk2000@gmail.com</a>&gt;<br>
&gt; + *<br>
&gt; + * This work is licensed under the terms of the GNU GPL, version 2 or=
 later.<br>
&gt; + * See the COPYING file in the top-level directory.<br>
&gt; + *<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt; +#include &quot;qapi/qapi-types-net.h&quot;<br>
&gt; +#include &quot;vmnet_int.h&quot;<br>
&gt; +#include &quot;clients.h&quot;<br>
&gt; +#include &quot;qemu/error-report.h&quot;<br>
&gt; +#include &quot;qapi/error.h&quot;<br>
&gt; +<br>
&gt; +#include &lt;vmnet/vmnet.h&gt;<br>
&gt; +<br>
&gt; +int net_init_vmnet_bridged(const Netdev *netdev, const char *name,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0NetClientState *peer, Error **errp)<br>
&gt; +{<br>
&gt; +=C2=A0 error_setg(errp, &quot;vmnet-bridged is not implemented yet&qu=
ot;);<br>
&gt; +=C2=A0 return -1;<br>
&gt; +}<br>
&gt; diff --git a/net/vmnet-common.m b/net/vmnet-common.m<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..532d152840<br>
&gt; --- /dev/null<br>
&gt; +++ b/net/vmnet-common.m<br>
&gt; @@ -0,0 +1,20 @@<br>
&gt; +/*<br>
&gt; + * vmnet-common.m - network client wrapper for Apple vmnet.framework<=
br>
&gt; + *<br>
&gt; + * Copyright(c) 2021 Vladislav Yaroshchuk &lt;<a href=3D"mailto:yaros=
hchuk2000@gmail.com" target=3D"_blank">yaroshchuk2000@gmail.com</a>&gt;<br>
&gt; + * Copyright(c) 2021 Phillip Tennen &lt;<a href=3D"mailto:phillip@axl=
eos.com" target=3D"_blank">phillip@axleos.com</a>&gt;<br>
&gt; + *<br>
&gt; + * This work is licensed under the terms of the GNU GPL, version 2 or=
 later.<br>
&gt; + * See the COPYING file in the top-level directory.<br>
&gt; + *<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt; +#include &quot;qapi/qapi-types-net.h&quot;<br>
&gt; +#include &quot;vmnet_int.h&quot;<br>
&gt; +#include &quot;clients.h&quot;<br>
&gt; +#include &quot;qemu/error-report.h&quot;<br>
&gt; +#include &quot;qapi/error.h&quot;<br>
&gt; +<br>
&gt; +#include &lt;vmnet/vmnet.h&gt;<br>
&gt; +<br>
&gt; diff --git a/net/vmnet-host.c b/net/vmnet-host.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..4a5ef99dc7<br>
&gt; --- /dev/null<br>
&gt; +++ b/net/vmnet-host.c<br>
&gt; @@ -0,0 +1,24 @@<br>
&gt; +/*<br>
&gt; + * vmnet-host.c<br>
&gt; + *<br>
&gt; + * Copyright(c) 2021 Vladislav Yaroshchuk &lt;<a href=3D"mailto:yaros=
hchuk2000@gmail.com" target=3D"_blank">yaroshchuk2000@gmail.com</a>&gt;<br>
&gt; + *<br>
&gt; + * This work is licensed under the terms of the GNU GPL, version 2 or=
 later.<br>
&gt; + * See the COPYING file in the top-level directory.<br>
&gt; + *<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt; +#include &quot;qapi/qapi-types-net.h&quot;<br>
&gt; +#include &quot;vmnet_int.h&quot;<br>
&gt; +#include &quot;clients.h&quot;<br>
&gt; +#include &quot;qemu/error-report.h&quot;<br>
&gt; +#include &quot;qapi/error.h&quot;<br>
&gt; +<br>
&gt; +#include &lt;vmnet/vmnet.h&gt;<br>
&gt; +<br>
&gt; +int net_init_vmnet_host(const Netdev *netdev, const char *name,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 NetClientState *peer, Error **errp) {<br>
&gt; +=C2=A0 error_setg(errp, &quot;vmnet-host is not implemented yet&quot;=
);<br>
&gt; +=C2=A0 return -1;<br>
&gt; +}<br>
&gt; diff --git a/net/vmnet-shared.c b/net/vmnet-shared.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..f8c4a4f3b8<br>
&gt; --- /dev/null<br>
&gt; +++ b/net/vmnet-shared.c<br>
&gt; @@ -0,0 +1,25 @@<br>
&gt; +/*<br>
&gt; + * vmnet-shared.c<br>
&gt; + *<br>
&gt; + * Copyright(c) 2021 Vladislav Yaroshchuk &lt;<a href=3D"mailto:yaros=
hchuk2000@gmail.com" target=3D"_blank">yaroshchuk2000@gmail.com</a>&gt;<br>
&gt; + *<br>
&gt; + * This work is licensed under the terms of the GNU GPL, version 2 or=
 later.<br>
&gt; + * See the COPYING file in the top-level directory.<br>
&gt; + *<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt; +#include &quot;qapi/qapi-types-net.h&quot;<br>
&gt; +#include &quot;vmnet_int.h&quot;<br>
&gt; +#include &quot;clients.h&quot;<br>
&gt; +#include &quot;qemu/error-report.h&quot;<br>
&gt; +#include &quot;qapi/error.h&quot;<br>
&gt; +<br>
&gt; +#include &lt;vmnet/vmnet.h&gt;<br>
&gt; +<br>
&gt; +int net_init_vmnet_shared(const Netdev *netdev, const char *name,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 NetClientState *peer, Error **errp)<br>
&gt; +{<br>
&gt; +=C2=A0 error_setg(errp, &quot;vmnet-shared is not implemented yet&quo=
t;);<br>
&gt; +=C2=A0 return -1;<br>
&gt; +}<br>
&gt; diff --git a/net/vmnet_int.h b/net/vmnet_int.h<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..c5982259a4<br>
&gt; --- /dev/null<br>
&gt; +++ b/net/vmnet_int.h<br>
&gt; @@ -0,0 +1,25 @@<br>
&gt; +/*<br>
&gt; + * vmnet_int.h<br>
&gt; + *<br>
&gt; + * Copyright(c) 2021 Vladislav Yaroshchuk &lt;<a href=3D"mailto:yaros=
hchuk2000@gmail.com" target=3D"_blank">yaroshchuk2000@gmail.com</a>&gt;<br>
&gt; + *<br>
&gt; + * This work is licensed under the terms of the GNU GPL, version 2 or=
 later.<br>
&gt; + * See the COPYING file in the top-level directory.<br>
&gt; + *<br>
&gt; + */<br>
&gt; +#ifndef VMNET_INT_H<br>
&gt; +#define VMNET_INT_H<br>
&gt; +<br>
&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt; +#include &quot;vmnet_int.h&quot;<br>
&gt; +#include &quot;clients.h&quot;<br>
&gt; +<br>
&gt; +#include &lt;vmnet/vmnet.h&gt;<br>
&gt; +<br>
&gt; +typedef struct VmnetCommonState {<br>
&gt; +=C2=A0 NetClientState nc;<br>
&gt; +<br>
&gt; +} VmnetCommonState;<br>
&gt; +<br>
&gt; +<br>
&gt; +#endif /* VMNET_INT_H */<br>
&gt; diff --git a/qapi/net.json b/qapi/net.json<br>
&gt; index 7fab2e7cd8..b922e2e34f 100644<br>
&gt; --- a/qapi/net.json<br>
&gt; +++ b/qapi/net.json<br>
&gt; @@ -452,6 +452,120 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &#39;*vhostdev&#39;:=C2=A0 =C2=A0 =C2=A0&#39;str&#=
39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &#39;*queues&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;=
int&#39; } }<br>
&gt;=C2=A0 <br>
&gt; +##<br>
&gt; +# @NetdevVmnetHostOptions:<br>
&gt; +#<br>
&gt; +# vmnet (host mode) network backend.<br>
&gt; +#<br>
&gt; +# Allows the vmnet interface to communicate with other vmnet<br>
&gt; +# interfaces that are in host mode and also with the host.<br>
&gt; +#<br>
&gt; +# @start-address: The starting IPv4 address to use for the interface.=
<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Must b=
e in the private IP range (RFC 1918). Must be<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0specif=
ied along with @end-address and @subnet-mask.<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This a=
ddress is used as the gateway address. The<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subseq=
uent address up to and including end-address are<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0placed=
 in the DHCP pool.<br>
&gt; +#<br>
&gt; +# @end-address: The DHCP IPv4 range end address to use for the<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interface. Mu=
st be in the private IP range (RFC 1918).<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Must be speci=
fied along with @start-address and<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@subnet-mask.=
<br>
&gt; +#<br>
&gt; +# @subnet-mask: The IPv4 subnet mask to use on the interface. Must<br=
>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0be specified =
along with @start-address and @subnet-mask.<br>
&gt; +#<br>
&gt; +# @isolated: Enable isolation for this interface. Interface isolation=
<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ensures that vmnet interfa=
ce is not able to communicate<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with any other vmnet inter=
faces. Only communication with<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host is allowed. Available=
 since macOS Big Sur 11.0.<br>
&gt; +#<br>
&gt; +# @net-uuid: The identifier (UUID) to uniquely identify the isolated<=
br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 network vmnet interface sh=
ould be added to. If<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set, no DHCP service is pr=
ovided for this interface and<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 network communication is a=
llowed only with other interfaces<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 added to this network iden=
tified by the UUID. Available<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 since macOS Big Sur 11.0.<=
br>
&gt; +#<br>
&gt; +# Since: 7.0<br>
&gt; +##<br>
&gt; +{ &#39;struct&#39;: &#39;NetdevVmnetHostOptions&#39;,<br>
&gt; +=C2=A0 &#39;data&#39;: {<br>
&gt; +=C2=A0 =C2=A0 &#39;*start-address&#39;: &#39;str&#39;,<br>
&gt; +=C2=A0 =C2=A0 &#39;*end-address&#39;:=C2=A0 =C2=A0&#39;str&#39;,<br>
&gt; +=C2=A0 =C2=A0 &#39;*subnet-mask&#39;:=C2=A0 =C2=A0&#39;str&#39;,<br>
&gt; +=C2=A0 =C2=A0 &#39;*isolated&#39;:=C2=A0 =C2=A0 =C2=A0 &#39;bool&#39;=
,<br>
&gt; +=C2=A0 =C2=A0 &#39;*net-uuid&#39;:=C2=A0 =C2=A0 =C2=A0 &#39;str&#39; =
},<br>
&gt; +=C2=A0 &#39;if&#39;: &#39;CONFIG_VMNET&#39; }<br>
&gt; +<br>
&gt; +##<br>
&gt; +# @NetdevVmnetSharedOptions:<br>
&gt; +#<br>
&gt; +# vmnet (shared mode) network backend.<br>
&gt; +#<br>
&gt; +# Allows traffic originating from the vmnet interface to reach the<br=
>
&gt; +# Internet through a network address translator (NAT).<br>
&gt; +# The vmnet interface can communicate with the host and with<br>
&gt; +# other shared mode interfaces on the same subnet. If no DHCP<br>
&gt; +# settings, subnet mask and IPv6 prefix specified, the interface can<=
br>
&gt; +# communicate with any of other interfaces in shared mode.<br>
&gt; +#<br>
&gt; +# @start-address: The starting IPv4 address to use for the interface.=
<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Must b=
e in the private IP range (RFC 1918). Must be<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0specif=
ied along with @end-address and @subnet-mask.<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This a=
ddress is used as the gateway address. The<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subseq=
uent address up to and including end-address are<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0placed=
 in the DHCP pool.<br>
&gt; +#<br>
&gt; +# @end-address: The DHCP IPv4 range end address to use for the<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interface. Mu=
st be in the private IP range (RFC 1918).<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Must be speci=
fied along with @start-address and @subnet-mask.<br>
&gt; +#<br>
&gt; +# @subnet-mask: The IPv4 subnet mask to use on the interface. Must<br=
>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 be specified=
 along with @start-address and @subnet-mask.<br>
&gt; +#<br>
&gt; +# @isolated: Enable isolation for this interface. Interface isolation=
<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ensures that vmnet interfa=
ce is not able to communicate<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with any other vmnet inter=
faces. Only communication with<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host is allowed. Available=
 since macOS Big Sur 11.0.<br>
&gt; +#<br>
&gt; +# @nat66-prefix: The IPv6 prefix to use into guest network. Must be a=
<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unique local=
 address i.e. start with fd00::/8 and have<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 length of 64=
.<br>
&gt; +#<br>
&gt; +# Since: 7.0<br>
&gt; +##<br>
&gt; +{ &#39;struct&#39;: &#39;NetdevVmnetSharedOptions&#39;,<br>
&gt; +=C2=A0 &#39;data&#39;: {<br>
&gt; +=C2=A0 =C2=A0 &#39;*start-address&#39;: &#39;str&#39;,<br>
&gt; +=C2=A0 =C2=A0 &#39;*end-address&#39;:=C2=A0 =C2=A0&#39;str&#39;,<br>
&gt; +=C2=A0 =C2=A0 &#39;*subnet-mask&#39;:=C2=A0 =C2=A0&#39;str&#39;,<br>
&gt; +=C2=A0 =C2=A0 &#39;*isolated&#39;:=C2=A0 =C2=A0 =C2=A0 &#39;bool&#39;=
,<br>
&gt; +=C2=A0 =C2=A0 &#39;*nat66-prefix&#39;:=C2=A0 &#39;str&#39; },<br>
&gt; +=C2=A0 &#39;if&#39;: &#39;CONFIG_VMNET&#39; }<br>
&gt; +<br>
&gt; +##<br>
&gt; +# @NetdevVmnetBridgedOptions:<br>
&gt; +#<br>
&gt; +# vmnet (bridged mode) network backend.<br>
&gt; +#<br>
&gt; +# Bridges the vmnet interface with a physical network interface.<br>
&gt; +#<br>
&gt; +# @ifname: The name of the physical interface to be bridged.<br>
&gt; +#<br>
&gt; +# @isolated: Enable isolation for this interface. Interface isolation=
<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ensures that vmnet interfa=
ce is not able to communicate<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with any other vmnet inter=
faces. Only communication with<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host is allowed. Available=
 since macOS Big Sur 11.0.<br>
&gt; +#<br>
&gt; +# Since: 7.0<br>
&gt; +##<br>
&gt; +{ &#39;struct&#39;: &#39;NetdevVmnetBridgedOptions&#39;,<br>
&gt; +=C2=A0 &#39;data&#39;: {<br>
&gt; +=C2=A0 =C2=A0 &#39;ifname&#39;:=C2=A0 =C2=A0 =C2=A0&#39;str&#39;,<br>
&gt; +=C2=A0 =C2=A0 &#39;*isolated&#39;:=C2=A0 &#39;bool&#39; },<br>
&gt; +=C2=A0 &#39;if&#39;: &#39;CONFIG_VMNET&#39; }<br>
&gt; +<br>
&gt;=C2=A0 ##<br>
&gt;=C2=A0 # @NetClientDriver:<br>
&gt;=C2=A0 #<br>
&gt; @@ -460,10 +574,16 @@<br>
&gt;=C2=A0 # Since: 2.7<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 @vhost-vdpa since 5.1<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 @vmnet-host since 7.0<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 @vmnet-shared since 7.0<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 @vmnet-bridged since 7.0<br>
&gt;=C2=A0 ##<br>
&gt;=C2=A0 { &#39;enum&#39;: &#39;NetClientDriver&#39;,<br>
&gt;=C2=A0 =C2=A0 &#39;data&#39;: [ &#39;none&#39;, &#39;nic&#39;, &#39;use=
r&#39;, &#39;tap&#39;, &#39;l2tpv3&#39;, &#39;socket&#39;, &#39;vde&#39;,<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;bridge&#39;, &#39;hubp=
ort&#39;, &#39;netmap&#39;, &#39;vhost-user&#39;, &#39;vhost-vdpa&#39; ] }<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;bridge&#39;, &#39;hubp=
ort&#39;, &#39;netmap&#39;, &#39;vhost-user&#39;, &#39;vhost-vdpa&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &#39;name&#39;: &#39;vmne=
t-host&#39;, &#39;if&#39;: &#39;CONFIG_VMNET&#39; },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &#39;name&#39;: &#39;vmne=
t-shared&#39;, &#39;if&#39;: &#39;CONFIG_VMNET&#39; },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &#39;name&#39;: &#39;vmne=
t-bridged&#39;, &#39;if&#39;: &#39;CONFIG_VMNET&#39; }] }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 ##<br>
&gt;=C2=A0 # @Netdev:<br>
&gt; @@ -477,6 +597,9 @@<br>
&gt;=C2=A0 # Since: 1.2<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;l2tpv3&#39; - since 2.1<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;vmnet-host&#39; - since 7.0<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;vmnet-shared&#39; - since 7.0<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;vmnet-bridged&#39; - since 7.0<br>
&gt;=C2=A0 ##<br>
&gt;=C2=A0 { &#39;union&#39;: &#39;Netdev&#39;,<br>
&gt;=C2=A0 =C2=A0 &#39;base&#39;: { &#39;id&#39;: &#39;str&#39;, &#39;type&=
#39;: &#39;NetClientDriver&#39; },<br>
&gt; @@ -492,7 +615,13 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &#39;hubport&#39;:=C2=A0 &#39;NetdevHubPortOptions=
&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &#39;netmap&#39;:=C2=A0 =C2=A0&#39;NetdevNetmapOpt=
ions&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &#39;vhost-user&#39;: &#39;NetdevVhostUserOptions&=
#39;,<br>
&gt; -=C2=A0 =C2=A0 &#39;vhost-vdpa&#39;: &#39;NetdevVhostVDPAOptions&#39; =
} }<br>
&gt; +=C2=A0 =C2=A0 &#39;vhost-vdpa&#39;: &#39;NetdevVhostVDPAOptions&#39;,=
<br>
&gt; +=C2=A0 =C2=A0 &#39;vmnet-host&#39;: { &#39;type&#39;: &#39;NetdevVmne=
tHostOptions&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &#39;if&#39;: &#39;CONFIG_VMNET&#39; },<br>
&gt; +=C2=A0 =C2=A0 &#39;vmnet-shared&#39;: { &#39;type&#39;: &#39;NetdevVm=
netSharedOptions&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 &#39;if&#39;: &#39;CONFIG_VMNET&#39; },<br>
&gt; +=C2=A0 =C2=A0 &#39;vmnet-bridged&#39;: { &#39;type&#39;: &#39;NetdevV=
mnetBridgedOptions&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&#39;if&#39;: &#39;CONFIG_VMNET&#39; } } }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 ##<br>
&gt;=C2=A0 # @RxState:<br>
&gt; -- <br>
&gt; 2.23.0<br>
&gt; <br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Best Regards,<div><br>=
<div>Vladislav Yaroshchuk</div></div></div></div></div>

--000000000000f01c1005d616a229--


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DDB497C8C
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 10:59:55 +0100 (CET)
Received: from localhost ([::1]:58146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBw8g-0003gR-UU
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 04:59:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <roman@roolebo.dev>) id 1nBw54-0000XU-Io
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 04:56:11 -0500
Received: from [2a00:1450:4864:20::232] (port=41595
 helo=mail-lj1-x232.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <roman@roolebo.dev>) id 1nBw50-00034h-DC
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 04:56:10 -0500
Received: by mail-lj1-x232.google.com with SMTP id t14so10268228ljh.8
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 01:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=roolebo.dev; s=mail;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=w+nd6SJnW/5GtbcBLCU7qeeZRTtsMc/JSoCrblEuPUs=;
 b=K/MVzjIVvhSJYk1V9s4ctSS+F0zYqxNp0u0+Vibu2YFKuViGmga5hqylTquL0vs69D
 8vZLxG9Cuu8B90tKi8vOWeNwYvXWadKC0e1pWRxCzt/wCFoYAWTyEZIqmAPJcRVjKpiU
 dDNMQeYHeFK2ApukT9Ya4MzR4KWpwnXzVkmqpC3hARblBXuYiMZrjrfXSQ7Laq9Opjl9
 vUMmDXksXsMhB/Zxc+xmSgMspzO2lP/7cAm7fIZgYZZvWOv6hugV6wRyYaxUz/onAsQ6
 lFnyvqr2CFxVjv37VRh2BFBubHoMCEiHRxdbzJF8e9d94MApG9KRzEEkTVAsa4GHqbcu
 XHrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=w+nd6SJnW/5GtbcBLCU7qeeZRTtsMc/JSoCrblEuPUs=;
 b=qBSSfK4JuNur2bprTf2Ot9T9yE1+808kCm1GqsPgd7zv002KTdxTz4Qjgp4k6Y/ZIo
 flK/kuavdl6zsdxESTC4i2LZI/XsGB30LmFPlStwtj2pCUVOU+KP5pPO6Qr02471L6Qu
 mKkEnyLl41E7kZZQYnbOSbpTgeQKIJypdQUD997wsKeeSA0BIR/N4sgSVOhR0U3owYz6
 vtjpgvCEVezJtGGmA7X6oyJOmuqE1cTtmjcMobFOW+PMQjYcLsitrtrcXwWozTiguv2U
 nuucj05nTqh3ogsX5qW5dcBVDbVmeXmplQ0X7/nbugad3qYME+MgP3vXQLZiZ/rGFrmL
 skfg==
X-Gm-Message-State: AOAM531n0mgEOESuNiZg4iqJc0KiSjfIc8LiBlimdDALpNPVzIUIEAU1
 U41PwoM05Cb96q3OsZJsJeDB0w==
X-Google-Smtp-Source: ABdhPJxmgDWd/pDgW2L4iqnO+lQLlmvKT+qtSsp+kb7wzsqlpP96Zl9NU/t9LVNKnJL3Aq+gSv8mZw==
X-Received: by 2002:a2e:3a02:: with SMTP id h2mr10980402lja.240.1643018163516; 
 Mon, 24 Jan 2022 01:56:03 -0800 (PST)
Received: from localhost (ip-185-108-208-32.ip.asarta.ru. [185.108.208.32])
 by smtp.gmail.com with ESMTPSA id f22sm311513lfe.167.2022.01.24.01.56.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 01:56:03 -0800 (PST)
Date: Mon, 24 Jan 2022 12:56:00 +0300
From: Roman Bolshakov <roman@roolebo.dev>
To: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Subject: Re: [PATCH v13 2/7] net/vmnet: add vmnet backends to qapi/net
Message-ID: <Ye53sOJekvKrM8iT@roolebo.dev>
References: <20220113172219.66372-1-yaroshchuk2000@gmail.com>
 <20220113172219.66372-3-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220113172219.66372-3-yaroshchuk2000@gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::232
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::232;
 envelope-from=roman@roolebo.dev; helo=mail-lj1-x232.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, kraxel@redhat.com, alex.bennee@linaro.org,
 jasowang@redhat.com, phillip.ennen@gmail.com, qemu-devel@nongnu.org,
 dirty@apple.com, armbru@redhat.com, r.bolshakov@yadro.com, agraf@csgraf.de,
 phillip@axleos.com, akihiko.odaki@gmail.com, hsp.cat7@gmail.com, hello@adns.io,
 qemu_oss@crudebyte.com, eblake@redhat.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 13, 2022 at 08:22:14PM +0300, Vladislav Yaroshchuk wrote:
> Create separate netdevs for each vmnet operating mode:
> - vmnet-host
> - vmnet-shared
> - vmnet-bridged
> 
> Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> ---
>  net/clients.h       |  11 ++++
>  net/meson.build     |   7 +++
>  net/net.c           |  10 ++++
>  net/vmnet-bridged.m |  25 +++++++++
>  net/vmnet-common.m  |  20 +++++++

Hi Vladislav,

It seems the last two files should have .c extension rather than .m.

Unlike Cocoa UI code, the files do not contain Objective-C classes. They are
just C code with blocks (which is supported by compilers shipped with Xcode
SDK), e.g this program can be compiled without extra compiler flags:

$ cat block.c
int main() {
        int (^x)(void) = ^{
                return 0;
        };

        return x();
}
$ cc block.c && ./a.out
$

Regards,
Roman

>  net/vmnet-host.c    |  24 ++++++++
>  net/vmnet-shared.c  |  25 +++++++++
>  net/vmnet_int.h     |  25 +++++++++
>  qapi/net.json       | 133 +++++++++++++++++++++++++++++++++++++++++++-
>  9 files changed, 278 insertions(+), 2 deletions(-)
>  create mode 100644 net/vmnet-bridged.m
>  create mode 100644 net/vmnet-common.m
>  create mode 100644 net/vmnet-host.c
>  create mode 100644 net/vmnet-shared.c
>  create mode 100644 net/vmnet_int.h
> 
> diff --git a/net/clients.h b/net/clients.h
> index 92f9b59aed..c9157789f2 100644
> --- a/net/clients.h
> +++ b/net/clients.h
> @@ -63,4 +63,15 @@ int net_init_vhost_user(const Netdev *netdev, const char *name,
>  
>  int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>                          NetClientState *peer, Error **errp);
> +#ifdef CONFIG_VMNET
> +int net_init_vmnet_host(const Netdev *netdev, const char *name,
> +                          NetClientState *peer, Error **errp);
> +
> +int net_init_vmnet_shared(const Netdev *netdev, const char *name,
> +                          NetClientState *peer, Error **errp);
> +
> +int net_init_vmnet_bridged(const Netdev *netdev, const char *name,
> +                          NetClientState *peer, Error **errp);
> +#endif /* CONFIG_VMNET */
> +
>  #endif /* QEMU_NET_CLIENTS_H */
> diff --git a/net/meson.build b/net/meson.build
> index 847bc2ac85..00a88c4951 100644
> --- a/net/meson.build
> +++ b/net/meson.build
> @@ -42,4 +42,11 @@ softmmu_ss.add(when: 'CONFIG_POSIX', if_true: files(tap_posix))
>  softmmu_ss.add(when: 'CONFIG_WIN32', if_true: files('tap-win32.c'))
>  softmmu_ss.add(when: 'CONFIG_VHOST_NET_VDPA', if_true: files('vhost-vdpa.c'))
>  
> +vmnet_files = files(
> +  'vmnet-common.m',
> +  'vmnet-bridged.m',
> +  'vmnet-host.c',
> +  'vmnet-shared.c'
> +)
> +softmmu_ss.add(when: vmnet, if_true: vmnet_files)
>  subdir('can')
> diff --git a/net/net.c b/net/net.c
> index f0d14dbfc1..1dbb64b935 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -1021,6 +1021,11 @@ static int (* const net_client_init_fun[NET_CLIENT_DRIVER__MAX])(
>  #ifdef CONFIG_L2TPV3
>          [NET_CLIENT_DRIVER_L2TPV3]    = net_init_l2tpv3,
>  #endif
> +#ifdef CONFIG_VMNET
> +        [NET_CLIENT_DRIVER_VMNET_HOST] = net_init_vmnet_host,
> +        [NET_CLIENT_DRIVER_VMNET_SHARED] = net_init_vmnet_shared,
> +        [NET_CLIENT_DRIVER_VMNET_BRIDGED] = net_init_vmnet_bridged,
> +#endif /* CONFIG_VMNET */
>  };
>  
>  
> @@ -1106,6 +1111,11 @@ void show_netdevs(void)
>  #endif
>  #ifdef CONFIG_VHOST_VDPA
>          "vhost-vdpa",
> +#endif
> +#ifdef CONFIG_VMNET
> +        "vmnet-host",
> +        "vmnet-shared",
> +        "vmnet-bridged",
>  #endif
>      };
>  
> diff --git a/net/vmnet-bridged.m b/net/vmnet-bridged.m
> new file mode 100644
> index 0000000000..4e42a90391
> --- /dev/null
> +++ b/net/vmnet-bridged.m
> @@ -0,0 +1,25 @@
> +/*
> + * vmnet-bridged.m
> + *
> + * Copyright(c) 2021 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/qapi-types-net.h"
> +#include "vmnet_int.h"
> +#include "clients.h"
> +#include "qemu/error-report.h"
> +#include "qapi/error.h"
> +
> +#include <vmnet/vmnet.h>
> +
> +int net_init_vmnet_bridged(const Netdev *netdev, const char *name,
> +                           NetClientState *peer, Error **errp)
> +{
> +  error_setg(errp, "vmnet-bridged is not implemented yet");
> +  return -1;
> +}
> diff --git a/net/vmnet-common.m b/net/vmnet-common.m
> new file mode 100644
> index 0000000000..532d152840
> --- /dev/null
> +++ b/net/vmnet-common.m
> @@ -0,0 +1,20 @@
> +/*
> + * vmnet-common.m - network client wrapper for Apple vmnet.framework
> + *
> + * Copyright(c) 2021 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> + * Copyright(c) 2021 Phillip Tennen <phillip@axleos.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/qapi-types-net.h"
> +#include "vmnet_int.h"
> +#include "clients.h"
> +#include "qemu/error-report.h"
> +#include "qapi/error.h"
> +
> +#include <vmnet/vmnet.h>
> +
> diff --git a/net/vmnet-host.c b/net/vmnet-host.c
> new file mode 100644
> index 0000000000..4a5ef99dc7
> --- /dev/null
> +++ b/net/vmnet-host.c
> @@ -0,0 +1,24 @@
> +/*
> + * vmnet-host.c
> + *
> + * Copyright(c) 2021 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/qapi-types-net.h"
> +#include "vmnet_int.h"
> +#include "clients.h"
> +#include "qemu/error-report.h"
> +#include "qapi/error.h"
> +
> +#include <vmnet/vmnet.h>
> +
> +int net_init_vmnet_host(const Netdev *netdev, const char *name,
> +                        NetClientState *peer, Error **errp) {
> +  error_setg(errp, "vmnet-host is not implemented yet");
> +  return -1;
> +}
> diff --git a/net/vmnet-shared.c b/net/vmnet-shared.c
> new file mode 100644
> index 0000000000..f8c4a4f3b8
> --- /dev/null
> +++ b/net/vmnet-shared.c
> @@ -0,0 +1,25 @@
> +/*
> + * vmnet-shared.c
> + *
> + * Copyright(c) 2021 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/qapi-types-net.h"
> +#include "vmnet_int.h"
> +#include "clients.h"
> +#include "qemu/error-report.h"
> +#include "qapi/error.h"
> +
> +#include <vmnet/vmnet.h>
> +
> +int net_init_vmnet_shared(const Netdev *netdev, const char *name,
> +                          NetClientState *peer, Error **errp)
> +{
> +  error_setg(errp, "vmnet-shared is not implemented yet");
> +  return -1;
> +}
> diff --git a/net/vmnet_int.h b/net/vmnet_int.h
> new file mode 100644
> index 0000000000..c5982259a4
> --- /dev/null
> +++ b/net/vmnet_int.h
> @@ -0,0 +1,25 @@
> +/*
> + * vmnet_int.h
> + *
> + * Copyright(c) 2021 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +#ifndef VMNET_INT_H
> +#define VMNET_INT_H
> +
> +#include "qemu/osdep.h"
> +#include "vmnet_int.h"
> +#include "clients.h"
> +
> +#include <vmnet/vmnet.h>
> +
> +typedef struct VmnetCommonState {
> +  NetClientState nc;
> +
> +} VmnetCommonState;
> +
> +
> +#endif /* VMNET_INT_H */
> diff --git a/qapi/net.json b/qapi/net.json
> index 7fab2e7cd8..b922e2e34f 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -452,6 +452,120 @@
>      '*vhostdev':     'str',
>      '*queues':       'int' } }
>  
> +##
> +# @NetdevVmnetHostOptions:
> +#
> +# vmnet (host mode) network backend.
> +#
> +# Allows the vmnet interface to communicate with other vmnet
> +# interfaces that are in host mode and also with the host.
> +#
> +# @start-address: The starting IPv4 address to use for the interface.
> +#                 Must be in the private IP range (RFC 1918). Must be
> +#                 specified along with @end-address and @subnet-mask.
> +#                 This address is used as the gateway address. The
> +#                 subsequent address up to and including end-address are
> +#                 placed in the DHCP pool.
> +#
> +# @end-address: The DHCP IPv4 range end address to use for the
> +#               interface. Must be in the private IP range (RFC 1918).
> +#               Must be specified along with @start-address and
> +#               @subnet-mask.
> +#
> +# @subnet-mask: The IPv4 subnet mask to use on the interface. Must
> +#               be specified along with @start-address and @subnet-mask.
> +#
> +# @isolated: Enable isolation for this interface. Interface isolation
> +#            ensures that vmnet interface is not able to communicate
> +#            with any other vmnet interfaces. Only communication with
> +#            host is allowed. Available since macOS Big Sur 11.0.
> +#
> +# @net-uuid: The identifier (UUID) to uniquely identify the isolated
> +#            network vmnet interface should be added to. If
> +#            set, no DHCP service is provided for this interface and
> +#            network communication is allowed only with other interfaces
> +#            added to this network identified by the UUID. Available
> +#            since macOS Big Sur 11.0.
> +#
> +# Since: 7.0
> +##
> +{ 'struct': 'NetdevVmnetHostOptions',
> +  'data': {
> +    '*start-address': 'str',
> +    '*end-address':   'str',
> +    '*subnet-mask':   'str',
> +    '*isolated':      'bool',
> +    '*net-uuid':      'str' },
> +  'if': 'CONFIG_VMNET' }
> +
> +##
> +# @NetdevVmnetSharedOptions:
> +#
> +# vmnet (shared mode) network backend.
> +#
> +# Allows traffic originating from the vmnet interface to reach the
> +# Internet through a network address translator (NAT).
> +# The vmnet interface can communicate with the host and with
> +# other shared mode interfaces on the same subnet. If no DHCP
> +# settings, subnet mask and IPv6 prefix specified, the interface can
> +# communicate with any of other interfaces in shared mode.
> +#
> +# @start-address: The starting IPv4 address to use for the interface.
> +#                 Must be in the private IP range (RFC 1918). Must be
> +#                 specified along with @end-address and @subnet-mask.
> +#                 This address is used as the gateway address. The
> +#                 subsequent address up to and including end-address are
> +#                 placed in the DHCP pool.
> +#
> +# @end-address: The DHCP IPv4 range end address to use for the
> +#               interface. Must be in the private IP range (RFC 1918).
> +#               Must be specified along with @start-address and @subnet-mask.
> +#
> +# @subnet-mask: The IPv4 subnet mask to use on the interface. Must
> +#                be specified along with @start-address and @subnet-mask.
> +#
> +# @isolated: Enable isolation for this interface. Interface isolation
> +#            ensures that vmnet interface is not able to communicate
> +#            with any other vmnet interfaces. Only communication with
> +#            host is allowed. Available since macOS Big Sur 11.0.
> +#
> +# @nat66-prefix: The IPv6 prefix to use into guest network. Must be a
> +#                unique local address i.e. start with fd00::/8 and have
> +#                length of 64.
> +#
> +# Since: 7.0
> +##
> +{ 'struct': 'NetdevVmnetSharedOptions',
> +  'data': {
> +    '*start-address': 'str',
> +    '*end-address':   'str',
> +    '*subnet-mask':   'str',
> +    '*isolated':      'bool',
> +    '*nat66-prefix':  'str' },
> +  'if': 'CONFIG_VMNET' }
> +
> +##
> +# @NetdevVmnetBridgedOptions:
> +#
> +# vmnet (bridged mode) network backend.
> +#
> +# Bridges the vmnet interface with a physical network interface.
> +#
> +# @ifname: The name of the physical interface to be bridged.
> +#
> +# @isolated: Enable isolation for this interface. Interface isolation
> +#            ensures that vmnet interface is not able to communicate
> +#            with any other vmnet interfaces. Only communication with
> +#            host is allowed. Available since macOS Big Sur 11.0.
> +#
> +# Since: 7.0
> +##
> +{ 'struct': 'NetdevVmnetBridgedOptions',
> +  'data': {
> +    'ifname':     'str',
> +    '*isolated':  'bool' },
> +  'if': 'CONFIG_VMNET' }
> +
>  ##
>  # @NetClientDriver:
>  #
> @@ -460,10 +574,16 @@
>  # Since: 2.7
>  #
>  #        @vhost-vdpa since 5.1
> +#        @vmnet-host since 7.0
> +#        @vmnet-shared since 7.0
> +#        @vmnet-bridged since 7.0
>  ##
>  { 'enum': 'NetClientDriver',
>    'data': [ 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socket', 'vde',
> -            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa' ] }
> +            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa',
> +            { 'name': 'vmnet-host', 'if': 'CONFIG_VMNET' },
> +            { 'name': 'vmnet-shared', 'if': 'CONFIG_VMNET' },
> +            { 'name': 'vmnet-bridged', 'if': 'CONFIG_VMNET' }] }
>  
>  ##
>  # @Netdev:
> @@ -477,6 +597,9 @@
>  # Since: 1.2
>  #
>  #        'l2tpv3' - since 2.1
> +#        'vmnet-host' - since 7.0
> +#        'vmnet-shared' - since 7.0
> +#        'vmnet-bridged' - since 7.0
>  ##
>  { 'union': 'Netdev',
>    'base': { 'id': 'str', 'type': 'NetClientDriver' },
> @@ -492,7 +615,13 @@
>      'hubport':  'NetdevHubPortOptions',
>      'netmap':   'NetdevNetmapOptions',
>      'vhost-user': 'NetdevVhostUserOptions',
> -    'vhost-vdpa': 'NetdevVhostVDPAOptions' } }
> +    'vhost-vdpa': 'NetdevVhostVDPAOptions',
> +    'vmnet-host': { 'type': 'NetdevVmnetHostOptions',
> +                    'if': 'CONFIG_VMNET' },
> +    'vmnet-shared': { 'type': 'NetdevVmnetSharedOptions',
> +                      'if': 'CONFIG_VMNET' },
> +    'vmnet-bridged': { 'type': 'NetdevVmnetBridgedOptions',
> +                       'if': 'CONFIG_VMNET' } } }
>  
>  ##
>  # @RxState:
> -- 
> 2.23.0
> 


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DDC48E6E0
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 09:50:55 +0100 (CET)
Received: from localhost ([::1]:47954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8IIQ-0001p0-3e
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 03:50:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1n8IBA-0007LG-W5
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 03:43:25 -0500
Received: from [2607:f8b0:4864:20::42e] (port=33482
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1n8IB8-00077V-FU
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 03:43:24 -0500
Received: by mail-pf1-x42e.google.com with SMTP id x83so2171109pfc.0
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 00:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:from:subject:to:cc
 :references:content-language:in-reply-to:content-transfer-encoding;
 bh=O1q5ki0hH0kqtEzUPrN/8LZ7sf+Mqo8q7Zx7Bm7GCE0=;
 b=fAQHOvPqHgbePAt7tL+WqG7kvbCuGfnrnU4P9PrTMRoLDxzJbFf4+d2yOa5sV0KEXm
 3ATn5evr5xfh4xee8NietALqHf8Y62YScRGgsaMik8IqvZkaI1h6MRf8atXsz/oGhB4a
 wBKHaQqjStgGxIdInjQWrMLlj2UCyU5UVJGYG9x0yDeFQaaW+AntQvfZOW/WOql45w/q
 BmibgXCTmyQs8jeyn8KPdsddDwzs0sv0L9k8yMVmxVBegegQZZu1TEJ/isKYNGu1tHJU
 vDr250T43OqJRTsMjENwMMd0kWyZH3Qj9fP7hVJE4ydoDUZsZi81geiqVhBliDZ8mT3r
 O7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:from
 :subject:to:cc:references:content-language:in-reply-to
 :content-transfer-encoding;
 bh=O1q5ki0hH0kqtEzUPrN/8LZ7sf+Mqo8q7Zx7Bm7GCE0=;
 b=UVJPphvVj7HV9xjDD+Gr7+RekN3Tbpl6hZTkmfH/8M9QsWJKVBmiHmvnCx4wfG26Y+
 cRPexwq7owEnAfIP7BGMdDgzDrKDqqP1dnJsbzSkQaKJTpK5EOwTUUp7tL4nc0SJ48Pp
 ZvCtze16h4CU4oK3XbVoSTjJBNvQOTOyIm4snAJCT8/43zbZ69aqUjCh7an2smHOldLE
 SHcMjL7Pc96LKRSIOrRNKV/ts9WddVmh9/hCJXkUzuADWk8ubJnPc7wQPMqz6NB0rjoW
 FOMSHiAccjleBGLQaXd+Vohy4/6XigfbSbhuaS91kq9TRnuaDbigW37w+wrInPC+otg/
 Ddtg==
X-Gm-Message-State: AOAM530LF9GQfHVuarI99mwlmssD3klyqOmGvgmbC6AidjBY3tKn0r5C
 I1hCiQ2GBAQk4bgcvcchQQA=
X-Google-Smtp-Source: ABdhPJytZoQjS4sl5RFIpZPkcBrtKCfHi+d29zZvhRcsmX96x2f71fUXsYgjXRlt8sEB9rtZr4+Cgw==
X-Received: by 2002:a63:780a:: with SMTP id t10mr7197783pgc.177.1642149800899; 
 Fri, 14 Jan 2022 00:43:20 -0800 (PST)
Received: from [192.168.64.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 h124sm1834957pfe.34.2022.01.14.00.43.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 00:43:20 -0800 (PST)
Message-ID: <d8da9df4-404f-92f3-9dce-e82a39e23802@gmail.com>
Date: Fri, 14 Jan 2022 17:43:14 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v13 2/7] net/vmnet: add vmnet backends to qapi/net
To: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>, qemu-devel@nongnu.org
References: <20220113172219.66372-1-yaroshchuk2000@gmail.com>
 <20220113172219.66372-3-yaroshchuk2000@gmail.com>
Content-Language: en-US
In-Reply-To: <20220113172219.66372-3-yaroshchuk2000@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, jasowang@redhat.com,
 phillip.ennen@gmail.com, armbru@redhat.com, dirty@apple.com, f4bug@amsat.org,
 r.bolshakov@yadro.com, agraf@csgraf.de, phillip@axleos.com, roman@roolebo.dev,
 hsp.cat7@gmail.com, hello@adns.io, qemu_oss@crudebyte.com, eblake@redhat.com,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Thank you for fixing the feature availability check.

I decided to just check the series thoroughly before adding Reviewed-By, 
and unfortunately ended up finding minor memory leaks and style 
problems. I'm sorry for adding comments so late.

Particulalry, his patch has several 2-space indents. They should be 
4-space. Reviews for other patch will shortly follow.

Regards,
Akihiko Odaki

On 2022/01/14 2:22, Vladislav Yaroshchuk wrote:
> Create separate netdevs for each vmnet operating mode:
> - vmnet-host
> - vmnet-shared
> - vmnet-bridged
> 
> Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> ---
>   net/clients.h       |  11 ++++
>   net/meson.build     |   7 +++
>   net/net.c           |  10 ++++
>   net/vmnet-bridged.m |  25 +++++++++
>   net/vmnet-common.m  |  20 +++++++
>   net/vmnet-host.c    |  24 ++++++++
>   net/vmnet-shared.c  |  25 +++++++++
>   net/vmnet_int.h     |  25 +++++++++
>   qapi/net.json       | 133 +++++++++++++++++++++++++++++++++++++++++++-
>   9 files changed, 278 insertions(+), 2 deletions(-)
>   create mode 100644 net/vmnet-bridged.m
>   create mode 100644 net/vmnet-common.m
>   create mode 100644 net/vmnet-host.c
>   create mode 100644 net/vmnet-shared.c
>   create mode 100644 net/vmnet_int.h
> 
> diff --git a/net/clients.h b/net/clients.h
> index 92f9b59aed..c9157789f2 100644
> --- a/net/clients.h
> +++ b/net/clients.h
> @@ -63,4 +63,15 @@ int net_init_vhost_user(const Netdev *netdev, const char *name,
>   
>   int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>                           NetClientState *peer, Error **errp);
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
>   #endif /* QEMU_NET_CLIENTS_H */
> diff --git a/net/meson.build b/net/meson.build
> index 847bc2ac85..00a88c4951 100644
> --- a/net/meson.build
> +++ b/net/meson.build
> @@ -42,4 +42,11 @@ softmmu_ss.add(when: 'CONFIG_POSIX', if_true: files(tap_posix))
>   softmmu_ss.add(when: 'CONFIG_WIN32', if_true: files('tap-win32.c'))
>   softmmu_ss.add(when: 'CONFIG_VHOST_NET_VDPA', if_true: files('vhost-vdpa.c'))
>   
> +vmnet_files = files(
> +  'vmnet-common.m',
> +  'vmnet-bridged.m',
> +  'vmnet-host.c',
> +  'vmnet-shared.c'
> +)
> +softmmu_ss.add(when: vmnet, if_true: vmnet_files)
>   subdir('can')
> diff --git a/net/net.c b/net/net.c
> index f0d14dbfc1..1dbb64b935 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -1021,6 +1021,11 @@ static int (* const net_client_init_fun[NET_CLIENT_DRIVER__MAX])(
>   #ifdef CONFIG_L2TPV3
>           [NET_CLIENT_DRIVER_L2TPV3]    = net_init_l2tpv3,
>   #endif
> +#ifdef CONFIG_VMNET
> +        [NET_CLIENT_DRIVER_VMNET_HOST] = net_init_vmnet_host,
> +        [NET_CLIENT_DRIVER_VMNET_SHARED] = net_init_vmnet_shared,
> +        [NET_CLIENT_DRIVER_VMNET_BRIDGED] = net_init_vmnet_bridged,
> +#endif /* CONFIG_VMNET */
>   };
>   
>   
> @@ -1106,6 +1111,11 @@ void show_netdevs(void)
>   #endif
>   #ifdef CONFIG_VHOST_VDPA
>           "vhost-vdpa",
> +#endif
> +#ifdef CONFIG_VMNET
> +        "vmnet-host",
> +        "vmnet-shared",
> +        "vmnet-bridged",
>   #endif
>       };
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
>       '*vhostdev':     'str',
>       '*queues':       'int' } }
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
>   ##
>   # @NetClientDriver:
>   #
> @@ -460,10 +574,16 @@
>   # Since: 2.7
>   #
>   #        @vhost-vdpa since 5.1
> +#        @vmnet-host since 7.0
> +#        @vmnet-shared since 7.0
> +#        @vmnet-bridged since 7.0
>   ##
>   { 'enum': 'NetClientDriver',
>     'data': [ 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socket', 'vde',
> -            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa' ] }
> +            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa',
> +            { 'name': 'vmnet-host', 'if': 'CONFIG_VMNET' },
> +            { 'name': 'vmnet-shared', 'if': 'CONFIG_VMNET' },
> +            { 'name': 'vmnet-bridged', 'if': 'CONFIG_VMNET' }] }
>   
>   ##
>   # @Netdev:
> @@ -477,6 +597,9 @@
>   # Since: 1.2
>   #
>   #        'l2tpv3' - since 2.1
> +#        'vmnet-host' - since 7.0
> +#        'vmnet-shared' - since 7.0
> +#        'vmnet-bridged' - since 7.0
>   ##
>   { 'union': 'Netdev',
>     'base': { 'id': 'str', 'type': 'NetClientDriver' },
> @@ -492,7 +615,13 @@
>       'hubport':  'NetdevHubPortOptions',
>       'netmap':   'NetdevNetmapOptions',
>       'vhost-user': 'NetdevVhostUserOptions',
> -    'vhost-vdpa': 'NetdevVhostVDPAOptions' } }
> +    'vhost-vdpa': 'NetdevVhostVDPAOptions',
> +    'vmnet-host': { 'type': 'NetdevVmnetHostOptions',
> +                    'if': 'CONFIG_VMNET' },
> +    'vmnet-shared': { 'type': 'NetdevVmnetSharedOptions',
> +                      'if': 'CONFIG_VMNET' },
> +    'vmnet-bridged': { 'type': 'NetdevVmnetBridgedOptions',
> +                       'if': 'CONFIG_VMNET' } } }
>   
>   ##
>   # @RxState:


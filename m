Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB200429715
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 20:47:01 +0200 (CEST)
Received: from localhost ([::1]:50776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ma0KC-0000gW-TF
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 14:47:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ma0IK-0008Kr-KH
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 14:45:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ma0II-0005MK-1l
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 14:45:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633977900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C/MwrKU8SG4luihh3jvCWIFSEK6cxU57ULMzsI8OjB8=;
 b=NEjYqc8xs6buYl8nQeuq+y2dlBSjLcDtMiJE8MhYT5O55ZM9+KsA0caBNSeVEAGMq5iOWk
 He6F27msnQqiU83noIEnHt8szzk+TVqtC52rzkXkjO52IDWAWcp3+pbbIyY8E9wbzfht5a
 dRcXMkQgaDOdocc/xL/L2aTmd+P8b3c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-Od8cDSbYNlyW9tyggrmoGg-1; Mon, 11 Oct 2021 14:44:59 -0400
X-MC-Unique: Od8cDSbYNlyW9tyggrmoGg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9263783DB2A;
 Mon, 11 Oct 2021 18:44:58 +0000 (UTC)
Received: from redhat.com (ovpn-113-152.phx2.redhat.com [10.3.113.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D3AB5BAEC;
 Mon, 11 Oct 2021 18:44:58 +0000 (UTC)
Date: Mon, 11 Oct 2021 13:44:56 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Subject: Re: [PATCH v2 1/6] net/vmnet: dependencies setup, initial preparations
Message-ID: <20211011184456.rohhk5b3umslmmdz@redhat.com>
References: <20210831192720.33406-1-yaroshchuk2000@gmail.com>
 <20210831192720.33406-2-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210831192720.33406-2-yaroshchuk2000@gmail.com>
User-Agent: NeoMutt/20210205-852-339c0c
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: jasowang@redhat.com, r.bolshakov@yadro.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 31, 2021 at 10:27:15PM +0300, Vladislav Yaroshchuk wrote:
> Add 'vmnet' customizable option and 'vmnet.framework' probe into
> configure;
> 
> Create separate netdev per each vmnet operating mode
> because they use quite different settings. Especially since
> macOS 11.0 (vmnet.framework API gets lots of updates)
> Create source files for network client driver, update meson.build;
> 
> Three new netdevs are added:
> - vmnet-host
> - vmnet-shared
> - vmnet-bridged
> 
> Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> ---

While I'm not the best for reviewing the overall series, I can at
least comment on the proposed QAPI changes:

> +++ b/qapi/net.json
> @@ -452,6 +452,89 @@
>      '*vhostdev':     'str',
>      '*queues':       'int' } }
>  
> +##
> +# @NetdevVmnetHostOptions:
> +#
> +# vmnet (host mode) network backend.
> +#
> +# Allows the vmnet interface to communicate with
> +# other vmnet interfaces that are in host mode and also with the native host.
> +#
> +# @dhcpstart: The starting IPv4 address to use for the interface. Must be in the
> +#             private IP range (RFC 1918). Must be specified along
> +#             with @dhcpend and @subnetmask.
> +#             This address is used as the gateway address. The subsequent address
> +#             up to and including dhcpend are placed in the DHCP pool.

Long lines.  Most of the qapi docs wrap around 70 or so columns rather
than pushing right up to the 80 column limit.

> +#
> +# @dhcpend: The DHCP IPv4 range end address to use for the interface. Must be in
> +#           the private IP range (RFC 1918). Must be specified along
> +#           with @dhcpstart and @subnetmask.
> +#
> +# @subnetmask: The IPv4 subnet mask to use on the interface. Must be specified
> +#              along with @dhcpstart and @subnetmask.
> +#
> +#
> +# Since: 6.2,

Drop the trailing comma

> +##
> +{ 'struct': 'NetdevVmnetHostOptions',
> +  'data': {
> +    '*dhcpstart':   'str',
> +    '*dhcpend':     'str',
> +    '*subnetmask':  'str'
> +  },
> +  'if': 'CONFIG_VMNET' }
> +
> +##
> +# @NetdevVmnetSharedOptions:
> +#
> +# vmnet (shared mode) network backend.
> +#
> +# Allows traffic originating from the vmnet interface to reach the
> +# Internet through a network address translator (NAT). The vmnet interface
> +# can also communicate with the native host. By default, the vmnet interface
> +# is able to communicate with other shared mode interfaces. If a subnet range
> +# is specified, the vmnet interface can communicate with other shared mode
> +# interfaces on the same subnet.
> +#
> +# @dhcpstart: The starting IPv4 address to use for the interface. Must be in the
> +#             private IP range (RFC 1918). Must be specified along
> +#             with @dhcpend and @subnetmask.
> +#             This address is used as the gateway address. The subsequent address
> +#             up to and including dhcpend are  placed in the DHCP pool.

extra space

> +#
> +# @dhcpend: The DHCP IPv4 range end address to use for the interface. Must be in
> +#           the private IP range (RFC 1918). Must be specified along
> +#           with @dhcpstart and @subnetmask.
> +#
> +# @subnetmask: The IPv4 subnet mask to use on the interface. Must be specified
> +#              along with @dhcpstart and @subnetmask.
> +#
> +#
> +# Since: 6.2,

Another odd comma

> +##
> +{ 'struct': 'NetdevVmnetSharedOptions',
> +  'data': {
> +    '*dhcpstart':    'str',
> +    '*dhcpend':      'str',
> +    '*subnetmask':   'str'
> +  },
> +  'if': 'CONFIG_VMNET' }

The NetdevVmnetHostOptions and NetdevVmnetSharedOptions types are
identical; why do you need two types?

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
> +# Since: 6.2
> +##
> +{ 'struct': 'NetdevVmnetBridgedOptions',
> +  'data': { 'ifname': 'str' },
> +  'if': 'CONFIG_VMNET' }
> +
>  ##
>  # @NetClientDriver:
>  #
> @@ -460,10 +543,16 @@
>  # Since: 2.7
>  #
>  #        @vhost-vdpa since 5.1
> +#        @vmnet-host since 6.2
> +#        @vmnet-shared since 6.2
> +#        @vmnet-bridged since 6.2
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
> @@ -477,6 +566,9 @@
>  # Since: 1.2
>  #
>  #        'l2tpv3' - since 2.1
> +#        'vmnet-host' - since 6.2
> +#        'vmnet-shared' - since 6.2
> +#        'vmnet-bridged' - since 6.2
>  ##
>  { 'union': 'Netdev',
>    'base': { 'id': 'str', 'type': 'NetClientDriver' },
> @@ -492,7 +584,10 @@
>      'hubport':  'NetdevHubPortOptions',
>      'netmap':   'NetdevNetmapOptions',
>      'vhost-user': 'NetdevVhostUserOptions',
> -    'vhost-vdpa': 'NetdevVhostVDPAOptions' } }
> +    'vhost-vdpa': 'NetdevVhostVDPAOptions',
> +    'vmnet-host': 'NetdevVmnetHostOptions',
> +    'vmnet-shared': 'NetdevVmnetSharedOptions',

If you only declare one type instead of two above, then both these
branches can use that same type.

> +    'vmnet-bridged': 'NetdevVmnetBridgedOptions' } }
>  
>  ##
>  # @RxState:
> -- 
> 2.23.0
> 
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A17F63E30EC
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 23:21:10 +0200 (CEST)
Received: from localhost ([::1]:33268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC7HB-0004oI-O5
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 17:21:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mC7Fg-00022z-Hz
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 17:19:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mC7Fe-0000hW-Nb
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 17:19:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628284774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PGYgUoE80BzRpCI9195mDYQv6izVDMVZcK79Z9DVZDo=;
 b=DwEB0YD85JctRPmNB0YFAjRQV7/O3olMqU9mpO5iKatCMmdOK9rciXLdKmxHTqD3GFqxDU
 pQLGQOq20zPCDheg8lfRKDktXZL4p9EKaOaLgFb6xJXTEf8aem0ZUbDL5OYshsLV6tx2kb
 eHoHwKBxADR/Xxa+l48xS7LFSEdYYDY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-xSN_i7BvNnCBUIghIxnhpQ-1; Fri, 06 Aug 2021 17:19:31 -0400
X-MC-Unique: xSN_i7BvNnCBUIghIxnhpQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D0DB190B2A0;
 Fri,  6 Aug 2021 21:19:30 +0000 (UTC)
Received: from redhat.com (ovpn-112-138.phx2.redhat.com [10.3.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E59019CBA;
 Fri,  6 Aug 2021 21:19:29 +0000 (UTC)
Date: Fri, 6 Aug 2021 16:19:27 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Subject: Re: [PATCH 2/7] net/vmnet: add new netdevs to qapi/net
Message-ID: <20210806211927.dvsn7xvy2ghmonip@redhat.com>
References: <20210617143246.55336-1-yaroshchuk2000@gmail.com>
 <20210617143246.55336-3-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210617143246.55336-3-yaroshchuk2000@gmail.com>
User-Agent: NeoMutt/20210205-687-0ed190
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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

On Thu, Jun 17, 2021 at 05:32:41PM +0300, Vladislav Yaroshchuk wrote:
> Created separate netdev per each vmnet operating mode
> because they use quite different settings. Especially since
> macOS 11.0 (vmnet.framework API gets lots of updates)
> 
> Three new netdevs are added:
> - vmnet-host
> - vmnet-shared
> - vmnet-bridged
> 
> Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> ---

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
> +#             up to and including dhcpend are  placed in the DHCP pool.
> +#
> +# @dhcpend: The DHCP IPv4 range end address to use for the interface. Must be in
> +#           the private IP range (RFC 1918). Must be specified along
> +#           with @dhcpstart and @subnetmask.
> +#
> +# @subnetmask: The IPv4 subnet mask to use on the interface. Must be specified
> +#              along with @dhcpstart and @subnetmask.
> +#
> +#
> +# Since: 6.1,
> +##

Same comments about 6.1 vs. 6.2 as before (I'll quit pointing it out).
Spurious trailing comma.

> +{ 'struct': 'NetdevVmnetHostOptions',
> +  'data': {
> +    '*dhcpstart':   'str',
> +    '*dhcpend':     'str',
> +    '*subnetmask':  'str'

Hmm. You listed all three as optional, but document that they must all
be specified together.  Why not just make them all required, and
simplify the documentation?

> +  },
> +  'if': 'defined(CONFIG_VMNET)' }
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

Spurious double space.

> +#
> +# @dhcpend: The DHCP IPv4 range end address to use for the interface. Must be in
> +#           the private IP range (RFC 1918). Must be specified along
> +#           with @dhcpstart and @subnetmask.
> +#
> +# @subnetmask: The IPv4 subnet mask to use on the interface. Must be specified
> +#              along with @dhcpstart and @subnetmask.
> +#
> +#
> +# Since: 6.1,
> +##
> +{ 'struct': 'NetdevVmnetSharedOptions',
> +  'data': {
> +    '*dhcpstart':    'str',
> +    '*dhcpend':      'str',
> +    '*subnetmask':   'str'
> +  },
> +  'if': 'defined(CONFIG_VMNET)' }
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
> +# Since: 6.1
> +##
> +{ 'struct': 'NetdevVmnetBridgedOptions',
> +  'data': { 'ifname': 'str' },
> +  'if': 'defined(CONFIG_VMNET)' }
> +
>  ##
>  # @NetClientDriver:
>  #
> @@ -460,11 +543,16 @@
>  # Since: 2.7
>  #
>  #        @vhost-vdpa since 5.1
> -#        @vmnet since 6.1

Why are you dropping vmnet?  Especially since you just added it in the
previous patch?  That feels like needless churn.

> +#        @vmnet-host since 6.1
> +#        @vmnet-shared since 6.1
> +#        @vmnet-bridged since 6.1
>  ##
>  { 'enum': 'NetClientDriver',
>    'data': [ 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socket', 'vde',
> -            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa', 'vmnet' ] }
> +            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa',
> +            { 'name': 'vmnet-host', 'if': 'defined(CONFIG_VMNET)' },
> +            { 'name': 'vmnet-shared', 'if': 'defined(CONFIG_VMNET)' },
> +            { 'name': 'vmnet-bridged', 'if': 'defined(CONFIG_VMNET)' }] }

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org



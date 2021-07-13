Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF7B3C7665
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 20:22:16 +0200 (CEST)
Received: from localhost ([::1]:56224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3N2t-0006ry-0d
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 14:22:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m3N20-0006Aw-WC
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 14:21:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m3N1x-0000q2-1T
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 14:21:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626200474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sXLLnSfjK/B1eKz6pEdghvizamnJJTYdmIrNmxq0yoo=;
 b=ZVJLw/Oq0S8nvgzjXoabYMYPDTU88V6LceVh6l1W4VEC3lC1KSWKF7SGN0tTqQxTypJdFR
 gRiZT1x7J0XLdf8QvzLNZNeeMWKHVgM6SW3RB/uYZW3HO8oL/pTSyCDs25Z8GQGBLRx3Xs
 v9YAxtARVOyx2/2z6we2tNQw0bjz92E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-BLKCnpVWO5mrv8Rp6zRKGQ-1; Tue, 13 Jul 2021 14:21:13 -0400
X-MC-Unique: BLKCnpVWO5mrv8Rp6zRKGQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 132AE192D785;
 Tue, 13 Jul 2021 18:21:12 +0000 (UTC)
Received: from redhat.com (ovpn-113-49.phx2.redhat.com [10.3.113.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 24A135C225;
 Tue, 13 Jul 2021 18:21:06 +0000 (UTC)
Date: Tue, 13 Jul 2021 13:21:04 -0500
From: Eric Blake <eblake@redhat.com>
To: Brijesh Singh <brijesh.singh@amd.com>
Subject: Re: [RFC PATCH 2/6] i386/sev: extend sev-guest property to include
 SEV-SNP
Message-ID: <20210713182104.t7fi62q7kovnyxfq@redhat.com>
References: <20210709215550.32496-1-brijesh.singh@amd.com>
 <20210709215550.32496-3-brijesh.singh@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210709215550.32496-3-brijesh.singh@amd.com>
User-Agent: NeoMutt/20210205-569-37ed14
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Michael Roth <michael.roth@amd.com>, James Bottomley <jejb@linux.ibm.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 09, 2021 at 04:55:46PM -0500, Brijesh Singh wrote:
> To launch the SEV-SNP guest, a user can specify up to 8 parameters.
> Passing all parameters through command line can be difficult. To simplify
> the launch parameter passing, introduce a .ini-like config file that can be
> used for passing the parameters to the launch flow.

I agree with Markus' assessment that we are probably going to be
better off reusing what we already have for other complex options
rather than inventing yet another ini file.

Additional things I noted:

> +++ b/qapi/qom.json
> @@ -749,6 +749,10 @@
>  # @reduced-phys-bits: number of bits in physical addresses that become
>  #                     unavailable when SEV is enabled
>  #
> +# @snp: SEV-SNP is enabled (default: 0)

Here you list 0...

> +#
> +# @launch-config: launch config file to use

Both additions (if we keep the launch-config addition) are missing
'(since 6.1)' notations.

> +#
>  # Since: 2.12
>  ##
>  { 'struct': 'SevGuestProperties',
> @@ -758,6 +762,8 @@
>              '*policy': 'uint32',
>              '*handle': 'uint32',
>              '*cbitpos': 'uint32',
> +            '*snp': 'bool',

...but here you state snp is bool. That means the default is 'false', not '0'.

> +            '*launch-config': 'str',
>              'reduced-phys-bits': 'uint32' } }
>  

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org



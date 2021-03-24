Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F287348091
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 19:35:31 +0100 (CET)
Received: from localhost ([::1]:57862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP8Lp-0002gL-Jr
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 14:35:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lP8Iw-0001Ky-8w
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:32:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lP8Is-0002PX-88
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:32:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616610744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZyXl4I4E1JBG/GsOnX96jlvRZFu2h7UsCNkrqpOV/5E=;
 b=AAOZZv54yIYXQYwi9P1aREKDJ3HSWMYydi+mTHrg5Ua4Xdx/PuDCKZP5qmTvexAnjsJc2j
 ueufqdE/VCK69oSR8rEkpJ6IJ9L6L0Z8S+CoiJ7XCeCHlAoGbZu1s9ktA7HVbZWLT1yNKz
 C/TJfm7Jx6EJrB4ZSKERhs0AUnU/egw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-dJEGYw98MlSfOw1crCHo0w-1; Wed, 24 Mar 2021 14:32:22 -0400
X-MC-Unique: dJEGYw98MlSfOw1crCHo0w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D0F18B5D7B;
 Wed, 24 Mar 2021 18:31:58 +0000 (UTC)
Received: from work-vm (ovpn-115-64.ams2.redhat.com [10.36.115.64])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 006F55C257;
 Wed, 24 Mar 2021 18:31:53 +0000 (UTC)
Date: Wed, 24 Mar 2021 18:31:51 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Jonah Palmer <jonah.palmer@oracle.com>
Subject: Re: [RFC v5 1/6] qmp: add QMP command x-debug-query-virtio
Message-ID: <YFuFl933UxoBKQ1C@work-vm>
References: <1616084984-11263-1-git-send-email-jonah.palmer@oracle.com>
 <1616084984-11263-2-git-send-email-jonah.palmer@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1616084984-11263-2-git-send-email-jonah.palmer@oracle.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, thuth@redhat.com, qemu-block@nongnu.org,
 amit@kernel.org, michael.roth@amd.com, jasowang@redhat.com, mst@redhat.com,
 david@redhat.com, qemu-devel@nongnu.org, laurent@vivier.eu,
 eric.auger@redhat.com, dmitrii.stepanov@cloud.ionos.com, kraxel@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com, si-wei.liu@oracle.com,
 marcandre.lureau@redhat.com, joao.m.martins@oracle.com, mreitz@redhat.com,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Jonah Palmer (jonah.palmer@oracle.com) wrote:
> From: Laurent Vivier <lvivier@redhat.com>
> 

<snip>

> --- /dev/null
> +++ b/qapi/virtio.json
> @@ -0,0 +1,68 @@
> +##
> +# = Virtio devices
> +##
> +
> +##
> +# @VirtioType:
> +#
> +# An enumeration of Virtio device types.
> +#
> +# Since: 6.0
> +##
> +{ 'enum': 'VirtioType',
> +  'data': [ 'unknown', 'virtio-9p', 'virtio-blk', 'virtio-serial',
> +            'virtio-gpu', 'virtio-input', 'virtio-net', 'virtio-scsi',
> +            'vhost-user-fs', 'vhost-vsock', 'virtio-balloon', 'virtio-crypto',
> +            'virtio-iommu', 'virtio-pmem', 'virtio-rng' ]

Can we make this be a complete list that's in the same order as include/standard-headers/linux/virtio_ids.h
then if we add a few asserts somewhere to make sure we don't screwup, we
don't need to do any translation.

Dave

> +}
> +
> +##
> +# @VirtioInfo:
> +#
> +# Information about a given VirtIODevice
> +#
> +# @path: VirtIO device canonical path.
> +#
> +# @type: VirtIO device type.
> +#
> +# Since: 6.0
> +#
> +##
> +{ 'struct': 'VirtioInfo',
> +  'data': {
> +    'path': 'str',
> +    'type': 'VirtioType'
> +  }
> +}
> +
> +##
> +# @x-debug-query-virtio:
> +#
> +# Return the list of all VirtIO devices
> +#
> +# Returns: list of @VirtioInfo
> +#
> +# Since: 6.0
> +#
> +# Example:
> +#
> +# -> { "execute": "x-debug-query-virtio" }
> +# <- { "return": [
> +#        {
> +#            "path": "/machine/peripheral-anon/device[3]/virtio-backend",
> +#            "type": "virtio-net"
> +#        },
> +#        {
> +#            "path": "/machine/peripheral-anon/device[1]/virtio-backend",
> +#            "type": "virtio-serial"
> +#        },
> +#        {
> +#            "path": "/machine/peripheral-anon/device[0]/virtio-backend",
> +#            "type": "virtio-blk"
> +#        }
> +#      ]
> +#    }
> +#
> +##
> +
> +{ 'command': 'x-debug-query-virtio', 'returns': ['VirtioInfo'] }
> diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
> index 1c7186e..8f0ae20 100644
> --- a/tests/qtest/qmp-cmd-test.c
> +++ b/tests/qtest/qmp-cmd-test.c
> @@ -95,6 +95,7 @@ static bool query_is_ignored(const char *cmd)
>          "query-gic-capabilities", /* arm */
>          /* Success depends on target-specific build configuration: */
>          "query-pci",              /* CONFIG_PCI */
> +        "x-debug-query-virtio",   /* CONFIG_VIRTIO */
>          /* Success depends on launching SEV guest */
>          "query-sev-launch-measure",
>          /* Success depends on Host or Hypervisor SEV support */
> -- 
> 1.8.3.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK



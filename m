Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D791D39886A
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 13:31:43 +0200 (CEST)
Received: from localhost ([::1]:51112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loP66-0002oY-2Q
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 07:31:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1loP4l-0001j0-19
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 07:30:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1loP4h-0007Bx-Ln
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 07:30:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622633414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3lrVU0gP3N3BJXaj0dRUAGd6KE633AQCeohxbuKxFws=;
 b=c69+eUsgGQEmw959GSC4CDwXSXh0C0T0U5sZLZ+I/FwxfKK+HzyTZ2EXvvBwZDs0zdmerk
 OsEFqGkFLwHyMSKXfMnihvnYnLwJEQOGU8jk1ni/ZhjmbKqKkk2pz/7eMUeKLbrMpJZV3z
 kEsTcidQsBoTOHTDwwzGEFBPe6qCKKg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-oxc2dAd9P4mwasZ86PmFSg-1; Wed, 02 Jun 2021 07:30:12 -0400
X-MC-Unique: oxc2dAd9P4mwasZ86PmFSg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB72380ED9B;
 Wed,  2 Jun 2021 11:29:54 +0000 (UTC)
Received: from work-vm (ovpn-113-195.ams2.redhat.com [10.36.113.195])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F09E469108;
 Wed,  2 Jun 2021 11:29:00 +0000 (UTC)
Date: Wed, 2 Jun 2021 12:28:58 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Jonah Palmer <jonah.palmer@oracle.com>
Subject: Re: [RFC v5 1/6] qmp: add QMP command x-debug-query-virtio
Message-ID: <YLdreonU8qzB216I@work-vm>
References: <1616084984-11263-1-git-send-email-jonah.palmer@oracle.com>
 <1616084984-11263-2-git-send-email-jonah.palmer@oracle.com>
 <YFuFl933UxoBKQ1C@work-vm>
 <93c20860-a9bb-0565-a5cc-88525c6ee71e@oracle.com>
MIME-Version: 1.0
In-Reply-To: <93c20860-a9bb-0565-a5cc-88525c6ee71e@oracle.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
> 
> On 3/24/21 2:31 PM, Dr. David Alan Gilbert wrote:
> > * Jonah Palmer (jonah.palmer@oracle.com) wrote:
> > > From: Laurent Vivier <lvivier@redhat.com>
> > > 
> > <snip>
> > 
> > > --- /dev/null
> > > +++ b/qapi/virtio.json
> > > @@ -0,0 +1,68 @@
> > > +##
> > > +# = Virtio devices
> > > +##
> > > +
> > > +##
> > > +# @VirtioType:
> > > +#
> > > +# An enumeration of Virtio device types.
> > > +#
> > > +# Since: 6.0
> > > +##
> > > +{ 'enum': 'VirtioType',
> > > +  'data': [ 'unknown', 'virtio-9p', 'virtio-blk', 'virtio-serial',
> > > +            'virtio-gpu', 'virtio-input', 'virtio-net', 'virtio-scsi',
> > > +            'vhost-user-fs', 'vhost-vsock', 'virtio-balloon', 'virtio-crypto',
> > > +            'virtio-iommu', 'virtio-pmem', 'virtio-rng' ]
> > Can we make this be a complete list that's in the same order as include/standard-headers/linux/virtio_ids.h
> > then if we add a few asserts somewhere to make sure we don't screwup, we
> > don't need to do any translation.
> > 
> > Dave
> 
> Hi Dave. Just so I understand correctly, you would like me to add all of the entries in the given order?
> E.g. including 'virtio-rpmsg', ..., 'virtio-mac80211-wlan', etc.? Or just the supported virtio types in
> the order as it's shown in virtio_ids.h?
>
> Many of these devices may not be supported for introspection.

Make that list all of the types, and keep it in the same order as the
header with the same gaps (including one at the start); so that that the QAPI generated enum values
for 'VirtioType' match the virtio_ids constants; that way you never have
to convert between the qapi number and the header number.
(Whenever we do a convert, sooner or later we screwup the convert and
end up with numbers that don't match!)

As you say, only some have support for introspection; so you just need
to check for support rather than doing a mapping.

Dave

> Jonah
> 
> > 
> > > +}
> > > +
> > > +##
> > > +# @VirtioInfo:
> > > +#
> > > +# Information about a given VirtIODevice
> > > +#
> > > +# @path: VirtIO device canonical path.
> > > +#
> > > +# @type: VirtIO device type.
> > > +#
> > > +# Since: 6.0
> > > +#
> > > +##
> > > +{ 'struct': 'VirtioInfo',
> > > +  'data': {
> > > +    'path': 'str',
> > > +    'type': 'VirtioType'
> > > +  }
> > > +}
> > > +
> > > +##
> > > +# @x-debug-query-virtio:
> > > +#
> > > +# Return the list of all VirtIO devices
> > > +#
> > > +# Returns: list of @VirtioInfo
> > > +#
> > > +# Since: 6.0
> > > +#
> > > +# Example:
> > > +#
> > > +# -> { "execute": "x-debug-query-virtio" }
> > > +# <- { "return": [
> > > +#        {
> > > +#            "path": "/machine/peripheral-anon/device[3]/virtio-backend",
> > > +#            "type": "virtio-net"
> > > +#        },
> > > +#        {
> > > +#            "path": "/machine/peripheral-anon/device[1]/virtio-backend",
> > > +#            "type": "virtio-serial"
> > > +#        },
> > > +#        {
> > > +#            "path": "/machine/peripheral-anon/device[0]/virtio-backend",
> > > +#            "type": "virtio-blk"
> > > +#        }
> > > +#      ]
> > > +#    }
> > > +#
> > > +##
> > > +
> > > +{ 'command': 'x-debug-query-virtio', 'returns': ['VirtioInfo'] }
> > > diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
> > > index 1c7186e..8f0ae20 100644
> > > --- a/tests/qtest/qmp-cmd-test.c
> > > +++ b/tests/qtest/qmp-cmd-test.c
> > > @@ -95,6 +95,7 @@ static bool query_is_ignored(const char *cmd)
> > >           "query-gic-capabilities", /* arm */
> > >           /* Success depends on target-specific build configuration: */
> > >           "query-pci",              /* CONFIG_PCI */
> > > +        "x-debug-query-virtio",   /* CONFIG_VIRTIO */
> > >           /* Success depends on launching SEV guest */
> > >           "query-sev-launch-measure",
> > >           /* Success depends on Host or Hypervisor SEV support */
> > > -- 
> > > 1.8.3.1
> > > 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB343469AC
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 21:17:11 +0100 (CET)
Received: from localhost ([::1]:54818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOnSh-0006IP-17
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 16:17:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lOnQW-000540-BS
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 16:14:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lOnQQ-0007cc-3N
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 16:14:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616530487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Cf6bsfMjgcJYDnNymPgKKPSzcTWWTmWjK6sbiYypXtQ=;
 b=iH+R5nqgBbZqBXqyUjbMIljI+v6cHWvGYUT//HLHtZTdpS9ctiY3O6Bfp1EtLmEOvE9QaZ
 U4vxE/j86eCKI190ytCUuDd6FF/NfnAXAAPzDvF8Mtnx6hjEoNMZ61XjFLe2ojA9YZdT2U
 MtjBr71XwOrwH5JwE3fr0++TFk6BvrI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-yGaJ2GxJN6-YrKDgErt-MQ-1; Tue, 23 Mar 2021 16:14:45 -0400
X-MC-Unique: yGaJ2GxJN6-YrKDgErt-MQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C01491922021;
 Tue, 23 Mar 2021 20:14:43 +0000 (UTC)
Received: from work-vm (ovpn-115-35.ams2.redhat.com [10.36.115.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C7D01F7;
 Tue, 23 Mar 2021 20:14:42 +0000 (UTC)
Date: Tue, 23 Mar 2021 20:14:39 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH V4 2/7] qapi/net.json: Add L4_Connection definition
Message-ID: <YFpML7sdeUiciL3B@work-vm>
References: <20210319035508.113741-1-chen.zhang@intel.com>
 <20210319035508.113741-3-chen.zhang@intel.com>
 <877dm3i1qk.fsf@dusky.pond.sub.org>
 <5b75057ecc784296aa271f5f6692906a@intel.com>
 <87k0pz4bg8.fsf@dusky.pond.sub.org>
 <4ffb0d8b135b40caba777a830b70ae18@intel.com>
 <871rc6urdc.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <871rc6urdc.fsf@dusky.pond.sub.org>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Lukas Straub <lukasstraub2@web.de>, Li Zhijian <lizhijian@cn.fujitsu.com>,
 Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>, "Zhang,
 Chen" <chen.zhang@intel.com>, Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Markus Armbruster (armbru@redhat.com) wrote:
> "Zhang, Chen" <chen.zhang@intel.com> writes:
> 
> >> -----Original Message-----
> >> From: Markus Armbruster <armbru@redhat.com>
> [...]
> >> Naming the argument type L4_Connection is misleading.
> >> 
> >> Even naming the match arguments L4_Connection would be misleading.
> >> "Connection" has a specific meaning in networking.  There are TCP
> >> connections.  There is no such thing as an UDP connection.
> >> 
> >> A TCP connection is uniquely identified by a pair of endpoints, i.e. by source
> >> address, source port, destination address, destination port.
> >> Same for other connection-oriented protocols.  The protocol is not part of
> >> the connection.  Thus, L4_Connection would be misleading even for the
> >> connection-oriented case.
> >> 
> >> You need a named type for colo-passthrough-add's argument because you
> >> share it with colo-passthrough-del.  I'm not sure that's what we want (I'm
> >> going to write more on that in a moment).  If it is what we want, then please
> >> pick a another, descriptive name.
> >
> > What do you think the "L4BypassRule" or "NetworkRule" ?
> 
> NetworkRule is too generic.
> 
> What about ColoPassthroughRule?

Which is a bit specific; there's not actually anything Colo specific in
there; can I suggest 'L4FlowSpec';  I think there should also be
a separate type that represents an IP address+port, so that what you end
up with is:

  IPFlowSpec
     ID
     Protocol
     Source
     Dest

Dave

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK



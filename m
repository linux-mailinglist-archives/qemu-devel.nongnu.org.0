Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 933B15F4B28
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 23:50:06 +0200 (CEST)
Received: from localhost ([::1]:40776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofpnh-0008QC-Ei
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 17:50:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ofpMX-0007EK-PR
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 17:22:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ofpMQ-0002vs-G5
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 17:21:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664918513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BQpOJsBfjImNyrlgmVEcpVUvmE8TGlz/ipyCLFVfnZg=;
 b=c5A7GPiLTZJ8pmhFjMJ2SCZ3iwX9Sc9eOOrrZM34WdsONwNO9z4BmhcJYyKw2EBm5mI1KV
 m+c+9/yhlGZcoJe3plCxfOsd053N88Vi06rDeZSGHTvYBFoNitravvF5ADVHod1iUbQHtf
 AHaUUH14U09jjCI11m6B4jJy9gan2Kk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-264-ytMDyMdON9G8qPc6aXiRkg-1; Tue, 04 Oct 2022 17:21:50 -0400
X-MC-Unique: ytMDyMdON9G8qPc6aXiRkg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A14B6185A7A8;
 Tue,  4 Oct 2022 21:21:49 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DCDA41121315;
 Tue,  4 Oct 2022 21:21:48 +0000 (UTC)
Date: Tue, 4 Oct 2022 16:21:46 -0500
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, libguestfs@redhat.com,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: Re: [PATCH] spec: Add NBD_OPT_EXTENDED_HEADERS
Message-ID: <20221004212146.ufycpumvmptijwcy@redhat.com>
References: <20211203231307.wmtbw7r72tyzkkax@redhat.com>
 <20211203231434.3900824-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211203231434.3900824-1-eblake@redhat.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 03, 2021 at 05:14:34PM -0600, Eric Blake wrote:
> Add a new negotiation feature where the client and server agree to use
> larger packet headers on every packet sent during transmission phase.
> This has two purposes: first, it makes it possible to perform
> operations like trim, write zeroes, and block status on more than 2^32
> bytes in a single command; this in turn requires that some structured
> replies from the server also be extended to match.  The wording chosen
> here is careful to permit a server to use either flavor in its reply
> (that is, a request less than 32-bits can trigger an extended reply,
> and conversely a request larger than 32-bits can trigger a compact
> reply).

Following up on this original proposal with something that came out of
KVM Forum this year.

> +* `NBD_REPLY_TYPE_BLOCK_STATUS_EXT` (6)
> +
> +  This chunk type is in the status chunk category.  *length* MUST be
> +  4 + (a positive multiple of 16).  The semantics of this chunk mirror
> +  those of `NBD_REPLY_TYPE_BLOCK_STATUS`, other than the use of a
> +  larger *extent length* field, as well as added padding to ease
> +  alignment.  This chunk type MUST NOT be used unless extended headers
> +  were negotiated with `NBD_OPT_EXTENDED_HEADERS`.
> +
> +  The payload starts with:
> +
> +  32 bits, metadata context ID  
> +
> +  and is followed by a list of one or more descriptors, each with this
> +  layout:
> +
> +  64 bits, length of the extent to which the status below
> +     applies (unsigned, MUST be nonzero)  
> +  32 bits, status flags  
> +  32 bits, padding (MUST be zero)

During KVM Forum, I had several conversations about Zoned Block
Devices (https://zonedstorage.io/docs/linux/zbd-api), and what it
would take to expose ZBD information over NBD.  In particular,
NBD_CMD_BLOCK_STATUS sounds like a great way for advertising
information about zones (by adding several metadata contexts that can
be negotiated during NBD_OPT_SET_META_CONTEXT), except for the fact
that a zone might be larger than 32 bits in size.  So Rich Jones asked
me the question of whether my work on 64-bit extensions to the NBD
protocol could also allow for a server to advertise a metadata context
only to clients that support 64-bit extensions, at which point it can
report 64-bit offsets or lengths as needed, rather than being limited
to 32-bit status flags.

The idea definitely has merit, so I'm working on incorporating that
into my next revision for 64-bit extensions in NBD.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org



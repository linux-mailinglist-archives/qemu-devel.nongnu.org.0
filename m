Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 653D74D885E
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 16:41:28 +0100 (CET)
Received: from localhost ([::1]:60448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTmp5-0000Yq-0F
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 11:41:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nTlyn-0008Rn-VV
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 10:47:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nTlym-0006Ht-8y
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 10:47:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647269243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZBxHJVRC8B/RhvrB2P/f4x9a4292dGQZnq9n/VzAkSk=;
 b=En52hWF2NV9l7Jv84ZcGb9EsvHDfkx9EkUJlo9PEUxpi6lMo/+rutK3NHt97K2mPvESlJp
 /lBhLwSeWbXwRmx/1XEwia2g/6uQi5brrCZHzxqV7hodSvtD4WHA7F8WMKFIvj04V/IdID
 knFQ5B50n0AuOEZU7Eyo0PtI6PBdb9I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-0IiPVWSZMNqInvhZVQTPGA-1; Mon, 14 Mar 2022 10:47:17 -0400
X-MC-Unique: 0IiPVWSZMNqInvhZVQTPGA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 795EA80088A;
 Mon, 14 Mar 2022 14:47:17 +0000 (UTC)
Received: from redhat.com (unknown [10.22.17.185])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DC684050C7D;
 Mon, 14 Mar 2022 14:47:17 +0000 (UTC)
Date: Mon, 14 Mar 2022 09:47:15 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <v.sementsov-og@ya.ru>
Subject: Re: [PATCH] MAINTAINERS: change Vladimir's email address
Message-ID: <20220314144715.piqpqta6chosvpcc@redhat.com>
References: <20220314110415.222496-1-v.sementsov-og@ya.ru>
MIME-Version: 1.0
In-Reply-To: <20220314110415.222496-1-v.sementsov-og@ya.ru>
User-Agent: NeoMutt/20211029-410-d8ee8c
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 14, 2022 at 02:04:15PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> Old vsementsov@virtuozzo.com is not accessible anymore.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@ya.ru>
> ---
> 
> Hi all!
> 
> That's my new address: v.sementsov-og@ya.ru , the old one is not
> available anymore.

I am not envious of your situation when observing the geopolitical
forces at work that are likely behind this sudden change of email
address.  Best wishes to you and your collegues through these trying
times, in dealing with the ripple effects of sanctions for the actions
of others.

> 
> I've also subscribed this new address for qemu-devel mailing list, but
> not yet get any message from it :(

I can queue this through my NBD tree, but I will first wait to see if
you can at least acknowledge this response (so that I feel more
comfortable adding my Reviewed-by).

> 
> The patch is also available as pgp-signed tag at:
> 
>   https://src.openvz.org/scm/~vsementsov/qemu.git tags/change-address
> 
> 
>  MAINTAINERS | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org



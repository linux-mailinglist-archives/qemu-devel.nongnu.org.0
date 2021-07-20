Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B4F3D0364
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 22:52:01 +0200 (CEST)
Received: from localhost ([::1]:46360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5wid-0000AI-VC
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 16:51:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m5whA-00079S-CB
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 16:50:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m5wh6-0002BL-71
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 16:50:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626814223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rKBb7POitP3li4t6cXzPOOvAFpQOQqSfLauf3mDbNiE=;
 b=dsGCBRvdjAe+xFPtQYd6UnQ4QPzyJFBz+M6U2O1Mv5wt8g1biRzyPHtrWY6ZnLWh8ZtobX
 pmZer7TptyLvm05hzKNcemAB9HxVplLU6lFYRI9k/swRJnAy3jAVTtCambF6k1AJVm3Hry
 ej9yXBEqUCXYxNFQzOhltRIm8hbAZYw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-h8yfaCEXNJq6hqCWoes8mQ-1; Tue, 20 Jul 2021 16:50:20 -0400
X-MC-Unique: h8yfaCEXNJq6hqCWoes8mQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26896A40C0;
 Tue, 20 Jul 2021 20:50:19 +0000 (UTC)
Received: from redhat.com (ovpn-112-216.phx2.redhat.com [10.3.112.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FB6360CA1;
 Tue, 20 Jul 2021 20:50:01 +0000 (UTC)
Date: Tue, 20 Jul 2021 15:49:59 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH] block: drop BLK_PERM_GRAPH_MOD
Message-ID: <20210720204959.2yivv6mtqzyvgsr4@redhat.com>
References: <20210720142229.763742-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210720142229.763742-1-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205-619-921509
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: kwolf@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 armbru@redhat.com, qemu-devel@nongnu.org, crosa@redhat.com, mreitz@redhat.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 20, 2021 at 05:22:29PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> First, this permission never protected node from being changed, as

a node

> generic child-replacing functions don't check it.
> 
> Second, it's a strange thing: it presents a permission of parent node
> to change its child. But generally, children are replaced by different
> mechanisms, like jobs or qmp commands, not by nodes.
> 
> Graph-mod permission is hard to understand. All other permissions
> describe operations which done by parent node on it child: read, write,

its child

> resize. Graph modification operations are something completely
> different.
> 
> The only place, where BLK_PERM_GRAPH_MOD is used as "perm" (not shared

s/place,/place/

> perm) is mirror_start_job, for s->target. Still modern code should use
> bdrv_freeze_backing_chain() to protect from graph modification, if we
> don't do it somewhere it may be considered as a bug. So, it's a bit
> risky to drop GRAPH_MOD, and analyzing of possible loss of protection
> is hard. But one day we should do it, let's do it now.
> 
> One more bit of information is that locking corresponding byte in

locking the

> file-posix doesn't make sense at all.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---

> +++ b/include/block/block.h
> @@ -269,12 +269,13 @@ enum {
>      BLK_PERM_RESIZE             = 0x08,
>  
>      /**
> -     * This permission is required to change the node that this BdrvChild
> -     * points to.
> +     * There was a removed now BLK_PERM_GRAPH_MOD, with value of 0x10. QEMU 6.1

There was a now-removed bit BLK_PERM_GRAPH_MOD,

> +     * and earlier still my lock corresponding byte in block/file-posix locking.

s/still my lock/may still lock the/

> +     * So, implementing some new permission should be very careful to not
> +     * interfere with this old unused thing.
>       */
> -    BLK_PERM_GRAPH_MOD          = 0x10,
>  
> -    BLK_PERM_ALL                = 0x1f,
> +    BLK_PERM_ALL                = 0x0f,
>  
>      DEFAULT_PERM_PASSTHROUGH    = BLK_PERM_CONSISTENT_READ
>                                   | BLK_PERM_WRITE

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org



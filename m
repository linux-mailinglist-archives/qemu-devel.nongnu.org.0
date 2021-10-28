Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1644043E405
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 16:42:59 +0200 (CEST)
Received: from localhost ([::1]:46116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg6cL-0005uh-Oq
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 10:42:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mg6XT-0000RV-Ho
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 10:37:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mg6XQ-0007Bj-OT
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 10:37:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635431872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LR8bR/5PqLxevtOszOWV9/PBJ6J1zYRJdfwbVpTe0Ug=;
 b=PlyieB/0lLMJnHaPJ8XKIsR05AXecm9khusgZlRwyYGYpWqGQwyaUxJO7YDI8s06w4vqF1
 r8XORMaNAcOflvtLsYWi5+TUwR4u3WF9Zf6WFeDhRlQBIVhIBzQqYfUZq/tWcgDa5BCdZp
 0ZtR40Mj4rdR4TCcjl13sxozBi0APBE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-V94iq8P7OLiwWxWa54VNrw-1; Thu, 28 Oct 2021 10:37:48 -0400
X-MC-Unique: V94iq8P7OLiwWxWa54VNrw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 908A31922025;
 Thu, 28 Oct 2021 14:37:47 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.202])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F222418428;
 Thu, 28 Oct 2021 14:37:37 +0000 (UTC)
Date: Thu, 28 Oct 2021 16:37:36 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH] nbd/server: Advertise MULTI_CONN for shared writable
 exports
Message-ID: <YXq1sFMjyn3vbzrA@redhat.com>
References: <20210827150916.532260-1-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210827150916.532260-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, rjones@redhat.com, nsoffer@redhat.com,
 Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 27.08.2021 um 17:09 hat Eric Blake geschrieben:
> According to the NBD spec, a server advertising
> NBD_FLAG_CAN_MULTI_CONN promises that multiple client connections will
> not see any cache inconsistencies: when properly separated by a single
> flush, actions performed by one client will be visible to another
> client, regardless of which client did the flush.  We satisfy these
> conditions in qemu because our block layer serializes any overlapping
> operations (see bdrv_find_conflicting_request and friends): no matter
> which client performs a flush, parallel requests coming from distinct
> NBD clients will still be well-ordered by the time they are passed on
> to the underlying device, with no caching in qemu proper to allow
> stale results to leak after a flush.
> 
> We don't want to advertise MULTI_CONN when we know that a second
> client can connect (which is the default for qemu-nbd, but not for QMP
> nbd-server-add),

Do you mean when a second client _can't_ connect?

> so it does require a QAPI addition.  But other than
> that, the actual change to advertise the bit for writable servers is
> fairly small.  The harder part of this patch is setting up an iotest
> to demonstrate behavior of multiple NBD clients to a single server.
> It might be possible with parallel qemu-io processes, but concisely
> managing that in shell is painful.

I think it should be fairly straightforward in a Python test case.

Another option is using a single QEMU or QSD instance that has multiple
-blockdev for the same NBD server. For the server these are multiple
clients, even if all connnection come from a single process.

> I found it easier to do by relying
> on the libnbd project's nbdsh, which means this test will be skipped
> on platforms where that is not available.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>

> diff --git a/docs/interop/nbd.txt b/docs/interop/nbd.txt
> index 10ce098a29bf..d03910f1e9eb 100644
> --- a/docs/interop/nbd.txt
> +++ b/docs/interop/nbd.txt
> @@ -68,3 +68,4 @@ NBD_CMD_BLOCK_STATUS for "qemu:dirty-bitmap:", NBD_CMD_CACHE
>  * 4.2: NBD_FLAG_CAN_MULTI_CONN for shareable read-only exports,
>  NBD_CMD_FLAG_FAST_ZERO
>  * 5.2: NBD_CMD_BLOCK_STATUS for "qemu:allocation-depth"
> +* 6.2: NBD_FLAG_CAN_MULTI_CONN for shareable writable exports
> diff --git a/docs/tools/qemu-nbd.rst b/docs/tools/qemu-nbd.rst
> index 5643da26e982..81be32164a55 100644
> --- a/docs/tools/qemu-nbd.rst
> +++ b/docs/tools/qemu-nbd.rst
> @@ -138,8 +138,7 @@ driver options if ``--image-opts`` is specified.
>  .. option:: -e, --shared=NUM
> 
>    Allow up to *NUM* clients to share the device (default
> -  ``1``), 0 for unlimited. Safe for readers, but for now,
> -  consistency is not guaranteed between multiple writers.
> +  ``1``), 0 for unlimited.
> 
>  .. option:: -t, --persistent

If qemu-nbd supports a maximum number of connections rather than just a
bool...

> diff --git a/qapi/block-export.json b/qapi/block-export.json
> index 0ed63442a819..b2085a9fdd4c 100644
> --- a/qapi/block-export.json
> +++ b/qapi/block-export.json
> @@ -95,11 +95,15 @@
>  #                    the metadata context name "qemu:allocation-depth" to
>  #                    inspect allocation details. (since 5.2)
>  #
> +# @shared: True if the server should advertise that multiple clients may
> +#          connect, default false. (since 6.2)
> +#
>  # Since: 5.2
>  ##
>  { 'struct': 'BlockExportOptionsNbd',
>    'base': 'BlockExportOptionsNbdBase',
> -  'data': { '*bitmaps': ['str'], '*allocation-depth': 'bool' } }
> +  'data': { '*bitmaps': ['str'], '*allocation-depth': 'bool',
> +             '*shared': 'bool' } }

...wouldn't it be better to mirror this in the QAPI interface?

I think eventually we want to add everything missing to the built-in NBD
server and then change qemu-nbd to use it instead of managing the
connections itself. So I'm not sure if diverging here is a good idea.

Kevin



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 784472E0CB2
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 16:27:08 +0100 (CET)
Received: from localhost ([::1]:59712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krjZ5-0001eM-0Q
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 10:27:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1krjWk-00086z-U5
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 10:24:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1krjWi-0001Zn-Jw
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 10:24:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608650679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eWvtSehUhlerpDvX9+4o7zc6d2pPFXNoIW6Cg89XYxA=;
 b=JZbjKH3BBumQNFrx87UltjMGz/+qo7sEFyRMJNHKQvxI3LTtOZd1NvwB/Qy8dIrOBiAbGR
 S2Xx9NNsJ3fKnN4CjBAAtf5+6fseQT8WECbVZ1e5tx4z6jdK7Y+dZUQwoAF5InkM3yD1Mh
 TrusZz25l6iYQjf2xN7CjWpA2eOiFh4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-pFpoO35nNZSlL6OG5LKTpw-1; Tue, 22 Dec 2020 10:24:37 -0500
X-MC-Unique: pFpoO35nNZSlL6OG5LKTpw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F33459;
 Tue, 22 Dec 2020 15:24:35 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-243.ams2.redhat.com
 [10.36.113.243])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D80255D705;
 Tue, 22 Dec 2020 15:24:29 +0000 (UTC)
Subject: Re: [PATCH v15 04/13] qapi: add filter-node-name to block-stream
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201216061703.70908-1-vsementsov@virtuozzo.com>
 <20201216061703.70908-5-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <0460ea79-3fc0-26eb-1491-1f17c6160fe0@redhat.com>
Date: Tue, 22 Dec 2020 16:24:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201216061703.70908-5-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.521, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 stefanha@redhat.com, den@openvz.org, andrey.shinkevich@virtuozzo.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.12.20 07:16, Vladimir Sementsov-Ogievskiy wrote:
> From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
> 
> Provide the possibility to pass the 'filter-node-name' parameter to the
> block-stream job as it is done for the commit block job.
> 
> Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>    [vsementsov: comment indentation, s/Since: 5.2/Since: 6.0/]
> Reviewed-by: Max Reitz <mreitz@redhat.com>
> ---
>   qapi/block-core.json           | 6 ++++++
>   include/block/block_int.h      | 7 ++++++-
>   block/monitor/block-hmp-cmds.c | 4 ++--
>   block/stream.c                 | 4 +++-
>   blockdev.c                     | 4 +++-
>   5 files changed, 20 insertions(+), 5 deletions(-)

[...]

> diff --git a/include/block/block_int.h b/include/block/block_int.h
> index 1eeafc118c..6f778e2517 100644
> --- a/include/block/block_int.h
> +++ b/include/block/block_int.h
> @@ -1142,6 +1142,9 @@ int is_windows_drive(const char *filename);
>    *                  See @BlockJobCreateFlags
>    * @speed: The maximum speed, in bytes per second, or 0 for unlimited.
>    * @on_error: The action to take upon error.
> + * @filter_node_name: The node name that should be assigned to the filter
> + *                    driver that the commit job inserts into the graph above

Only now noticed s/commit/stream/

(I’ll fix it)

Max

> + *                    @bs. NULL means that a node name should be autogenerated.
>    * @errp: Error object.
>    *
>    * Start a streaming operation on @bs.  Clusters that are unallocated



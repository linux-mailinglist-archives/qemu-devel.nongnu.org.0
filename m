Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D74172D6402
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 18:48:47 +0100 (CET)
Received: from localhost ([::1]:35634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knQ3a-0004X0-Qy
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 12:48:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1knPsd-0006Vu-7h
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 12:37:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1knPsT-0005bg-Gg
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 12:37:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607621836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gfOmcXjVZVkYhBjt6lJX8tZu+CcB/v95DHS7bEULRxE=;
 b=JzaVe48mS2Nj49Yn0GrGo7vaqqJkk1rdLRFx+GDXuXXNAdVwnWgKdyg5EmI4cN5Tn9vSHj
 4ocWhwVvL/jwAjB8U/bUNJO7hSrSZ2BjMpaxmsDdahvHzzAycNZ1LHZYQ34n/HNf+anJ0i
 fZXjJGVuc9s2D1bC5V/biNk1SOAaQCU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-Ayn0SnWAMwazMshPuE2jBQ-1; Thu, 10 Dec 2020 12:37:12 -0500
X-MC-Unique: Ayn0SnWAMwazMshPuE2jBQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A96D5147;
 Thu, 10 Dec 2020 17:37:10 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-115-58.ams2.redhat.com
 [10.36.115.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 905C319719;
 Thu, 10 Dec 2020 17:37:04 +0000 (UTC)
Subject: Re: [PATCH v14 04/13] qapi: add filter-node-name to block-stream
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201204220758.2879-1-vsementsov@virtuozzo.com>
 <20201204220758.2879-5-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <2ac9033b-79bc-55e2-dcc2-8965e48448b1@redhat.com>
Date: Thu, 10 Dec 2020 18:37:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201204220758.2879-5-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 stefanha@redhat.com, andrey.shinkevich@virtuozzo.com, den@openvz.org,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.12.20 23:07, Vladimir Sementsov-Ogievskiy wrote:
> From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
> 
> Provide the possibility to pass the 'filter-node-name' parameter to the
> block-stream job as it is done for the commit block job.
> 
> Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   qapi/block-core.json           | 6 ++++++
>   include/block/block_int.h      | 7 ++++++-
>   block/monitor/block-hmp-cmds.c | 4 ++--
>   block/stream.c                 | 4 +++-
>   blockdev.c                     | 4 +++-
>   5 files changed, 20 insertions(+), 5 deletions(-)
> 
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 04ad80bc1e..8ef3df6767 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -2543,6 +2543,11 @@
>   #            'stop' and 'enospc' can only be used if the block device
>   #            supports io-status (see BlockInfo).  Since 1.3.
>   #
> +# @filter-node-name: the node name that should be assigned to the
> +#                    filter driver that the stream job inserts into the graph
> +#                    above @device. If this option is not given, a node name is
> +#                    autogenerated. (Since: 5.2)

*6.0

> +#
>   # @auto-finalize: When false, this job will wait in a PENDING state after it has
>   #                 finished its work, waiting for @block-job-finalize before
>   #                 making any block graph changes.

[...]

> diff --git a/include/block/block_int.h b/include/block/block_int.h
> index 95d9333be1..c05fa1eb6b 100644
> --- a/include/block/block_int.h
> +++ b/include/block/block_int.h
> @@ -1134,6 +1134,9 @@ int is_windows_drive(const char *filename);
>    *                  See @BlockJobCreateFlags
>    * @speed: The maximum speed, in bytes per second, or 0 for unlimited.
>    * @on_error: The action to take upon error.
> + * @filter_node_name: The node name that should be assigned to the filter
> + * driver that the commit job inserts into the graph above @bs. NULL means
> + * that a node name should be autogenerated.

Personally, I find such descriptions to be more easily readable (or 
rather more easily visually separable from other parameters) if they’re 
indented.  I understand that two other parameters’ descriptions aren’t 
indented either (but one is), so in the end it’s your choice.  (But I 
thought a little nudging couldn’t hurt.)

So either way (with *6.0):

Reviewed-by: Max Reitz <mreitz@redhat.com>



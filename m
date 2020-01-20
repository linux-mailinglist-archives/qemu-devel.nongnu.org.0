Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7F9143205
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 20:18:01 +0100 (CET)
Received: from localhost ([::1]:43278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itcYi-0003ra-LJ
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 14:18:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35241)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1itcXb-0003Lq-Ft
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 14:16:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1itcXZ-0004Pj-MP
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 14:16:51 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:25606
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1itcXZ-0004PK-JU
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 14:16:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579547809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qndJVXZc//72XtzUTUAo0KSAzW6L/s0xG8oIGCWXZlQ=;
 b=Uc4v9DAQUea0cwfzTEKRj5kvvWL21K37b/oGe+ouz2D3itRwHP4rfZj/3x1vATNKcV0QcI
 vWiU1ZAk7QC4AWTVojCRl1gamOrVz2c2MsPDcLZ5DxR6O55j6hY3DoYwKm4xEGihCce5la
 i0BZJmfrwz2I0WV447/+57Ihv7kGva4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-69-rEuEGqggNOm7ZQvFRdZd0g-1; Mon, 20 Jan 2020 14:16:45 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8ABA6801E67;
 Mon, 20 Jan 2020 19:16:44 +0000 (UTC)
Received: from [10.3.117.16] (ovpn-117-16.phx2.redhat.com [10.3.117.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D67085C299;
 Mon, 20 Jan 2020 19:16:43 +0000 (UTC)
Subject: Re: [PATCH v2] qapi: Allow getting flat output from
 'query-named-block-nodes'
To: Peter Krempa <pkrempa@redhat.com>, qemu-devel@nongnu.org
References: <4470f8c779abc404dcf65e375db195cd91a80651.1579509782.git.pkrempa@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <67719815-026e-6dba-aea8-0f3273df4fec@redhat.com>
Date: Mon, 20 Jan 2020 13:16:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <4470f8c779abc404dcf65e375db195cd91a80651.1579509782.git.pkrempa@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: rEuEGqggNOm7ZQvFRdZd0g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/20/20 2:50 AM, Peter Krempa wrote:
> When a management application manages node names there's no reason to
> recurse into backing images in the output of query-named-block-nodes.
> 
> Add a parameter to the command which will return just the top level
> structs.
> 
> Signed-off-by: Peter Krempa <pkrempa@redhat.com>
> ---
> 
> Diff to v1:
>   - rewrote setting of 'return_flat' in qmp_query_named_block_nodes
>   - tried to clarify the QMP schema docs for the new field
> 
> This patch does not aim to fix the rather suboptimal original
> documentation of the command as that is going to end up in a bunch of
> bikeshedding.
> 
> While I know that there are plans for a new command that should fix
> this, the plans were already there for quite some time without much
> happening. This is a quick fix to a real problem, because if you have
> (maybe unpractically) deep backing chains, the returned JSON is getting
> huge. (140 nesting levels exceeds 10MiB of JSON)

Yep, O(n^2) output growth based on a depth of N is not ideal.

> +++ b/qapi/block-core.json
> @@ -1752,6 +1752,9 @@
>   #
>   # Get the named block driver list
>   #
> +# @flat: Omit the nested data about backing image ("backing-image" key) if true.
> +#        Default is false (Since 5.0)
> +#
>   # Returns: the list of BlockDeviceInfo
>   #
>   # Since: 2.0
> @@ -1805,7 +1808,9 @@
>   #                    } } ] }
>   #
>   ##
> -{ 'command': 'query-named-block-nodes', 'returns': [ 'BlockDeviceInfo' ] }
> +{ 'command': 'query-named-block-nodes',
> +  'returns': [ 'BlockDeviceInfo' ],
> +  'data': { '*flat': 'bool' } }

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org



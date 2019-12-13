Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E027011E67E
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Dec 2019 16:24:45 +0100 (CET)
Received: from localhost ([::1]:50378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifmo8-0005h6-Cy
	for lists+qemu-devel@lfdr.de; Fri, 13 Dec 2019 10:24:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39446)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1ifmnA-00053G-Pp
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 10:23:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1ifmn6-00072n-Vv
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 10:23:42 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:57099
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1ifmn6-00071H-SA
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 10:23:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576250620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MeK51fxNFq5+BdirxnvGrOlWweZR5gMFavqnBcWMREA=;
 b=I2iH/ONgNC+H8G3KTgbIMdo+/S38Hwugs3d562aBL51Yh2Mz78FLdSHLzKMD+2QAngTa1Z
 hoUbUy9mF4XgL51sKtclMbSQk0L+yQHpU/9pWf6X98iyerh4H2d+PYgoy2MsMCCc+GBdFb
 jJo1MRLQU/msOzb1ZbymoDwQmIewiAc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-6hpohohwOXOslwRvMcvq3A-1; Fri, 13 Dec 2019 10:23:37 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A20B800D48;
 Fri, 13 Dec 2019 15:23:36 +0000 (UTC)
Received: from [10.3.116.171] (ovpn-116-171.phx2.redhat.com [10.3.116.171])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BDB2960BF3;
 Fri, 13 Dec 2019 15:23:35 +0000 (UTC)
Subject: Re: [PATCH RFC] qapi: Allow getting flat output from
 'query-named-block-nodes'
To: Peter Krempa <pkrempa@redhat.com>, qemu-devel@nongnu.org
References: <42dae98e1f6a9f444f48a20192f45195337824f0.1576246045.git.pkrempa@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <836c1a18-b67d-0426-2137-8f464e4e5c9b@redhat.com>
Date: Fri, 13 Dec 2019 09:23:35 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <42dae98e1f6a9f444f48a20192f45195337824f0.1576246045.git.pkrempa@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 6hpohohwOXOslwRvMcvq3A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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

On 12/13/19 8:11 AM, Peter Krempa wrote:
> When a management application manages node names there's no reason to
> recurse into backing images in the output of query-named-block-nodes.
> 
> Add a parameter to the command which will return just the top level
> structs.

At one point, Kevin was working on a saner command that tried to cut out 
on more than just the redundant nesting.  But this is certainly a 
quick-and-easy fix to ease libvirt's use of the existing command, while 
we decide whether to add a saner new command.

> 
> Signed-off-by: Peter Krempa <pkrempa@redhat.com>
> ---
>   block.c               |  5 +++--
>   block/qapi.c          | 10 ++++++++--
>   blockdev.c            | 12 ++++++++++--
>   include/block/block.h |  2 +-
>   include/block/qapi.h  |  4 +++-
>   monitor/hmp-cmds.c    |  2 +-
>   qapi/block-core.json  |  6 +++++-
>   7 files changed, 31 insertions(+), 10 deletions(-)
> 

> +++ b/blockdev.c
> @@ -3707,9 +3707,17 @@ void qmp_drive_backup(DriveBackup *arg, Error **errp)
>       }
>   }
> 
> -BlockDeviceInfoList *qmp_query_named_block_nodes(Error **errp)
> +BlockDeviceInfoList *qmp_query_named_block_nodes(bool has_flat,
> +                                                 bool flat,
> +                                                 Error **errp)
>   {
> -    return bdrv_named_nodes_list(errp);
> +    bool return_flat = false;
> +
> +    if (has_flat) {
> +        return_flat = flat;
> +    }

This could be shortened as 'bool return_flat = has_flat && flat;', but 
that's not essential.

> +
> +    return bdrv_named_nodes_list(return_flat, errp);
>   }
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org



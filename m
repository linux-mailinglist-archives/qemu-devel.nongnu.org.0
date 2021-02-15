Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E4731C458
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 00:23:07 +0100 (CET)
Received: from localhost ([::1]:37042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBnCs-0004gG-V0
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 18:23:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lBnBf-0004F3-1F
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 18:21:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lBnBd-0007U6-7X
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 18:21:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613431308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=++hKPubP14VIX3rbGdZylM1KWM6KtTNRRXr3MHqAwWY=;
 b=MOFLjRHXHQbBZQy4KhBC+Uu/UGZBxCpOcXDEWXzPjGgpA1Juw4sBtbw7A6ohNBLg5RM8Y+
 JV8BsJIgZ5TESTECJ3R2VlovqNie9pVe7KqDlukL6ywRAXQ4pxrWOID18H+U/Au3mdyv9Z
 law7NK6GsRMcg//sVWKGGtHSiUkPQVQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-kSxg0OCMOkewNC2C4p3maQ-1; Mon, 15 Feb 2021 18:21:46 -0500
X-MC-Unique: kSxg0OCMOkewNC2C4p3maQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B96A107ACC7;
 Mon, 15 Feb 2021 23:21:45 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 726A81F0;
 Mon, 15 Feb 2021 23:21:44 +0000 (UTC)
Subject: Re: [PATCH] iotests: Fix up python style in 300
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20210215220518.1745469-1-eblake@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <39d5d446-3271-a8fd-0755-6a0fbfe24c09@redhat.com>
Date: Mon, 15 Feb 2021 18:21:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210215220518.1745469-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 5:05 PM, Eric Blake wrote:
> Break some long lines, and relax our type hints to be more generic to
> any JSON, in order to more easily permit the additional JSON depth now
> possible in migration parameters.  Detected by iotest 297.
> 
> Fixes: ca4bfec41d56
>   (qemu-iotests: 300: Add test case for modifying persistence of bitmap)
> Reported-by: Kevin Wolf <kwolf@redhat.com>
> Signed-off-by: Eric Blake <eblake@redhat.com>

Reviewed-by: John Snow <jsnow@redhat.com>

> ---
>   tests/qemu-iotests/300 | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/qemu-iotests/300 b/tests/qemu-iotests/300
> index 63036f6a6e13..adb927629747 100755
> --- a/tests/qemu-iotests/300
> +++ b/tests/qemu-iotests/300
> @@ -22,7 +22,7 @@
>   import os
>   import random
>   import re
> -from typing import Dict, List, Optional, Union
> +from typing import Dict, List, Optional
> 
>   import iotests
> 
> @@ -30,7 +30,7 @@ import iotests
>   # pylint: disable=wrong-import-order
>   import qemu
> 
> -BlockBitmapMapping = List[Dict[str, Union[str, List[Dict[str, str]]]]]
> +BlockBitmapMapping = List[Dict[str, object]]
> 

Assuming iotest 297 didn't yap about this, I think this has the 
necessary power for this file and we don't have to work any harder.

If in the future you try to treat e.g. bmap['persistent'] as a 
particular kind of value (string? bool? int?) mypy will likely complain 
about that a little, saying it has no insight into the type beyond "object".

If *that* becomes annoying, you can degrade this type to use 'Any' 
instead of 'object' and even those checks will cease.

>   mig_sock = os.path.join(iotests.sock_dir, 'mig_sock')
> 
> @@ -602,7 +602,8 @@ class TestCrossAliasMigration(TestDirtyBitmapMigration):
> 
>   class TestAliasTransformMigration(TestDirtyBitmapMigration):
>       """
> -    Tests the 'transform' option which modifies bitmap persistence on migration.
> +    Tests the 'transform' option which modifies bitmap persistence on
> +    migration.
>       """
> 
>       src_node_name = 'node-a'
> @@ -674,7 +675,8 @@ class TestAliasTransformMigration(TestDirtyBitmapMigration):
>           bitmaps = self.vm_b.query_bitmaps()
> 
>           for node in bitmaps:
> -            bitmaps[node] = sorted(((bmap['name'], bmap['persistent']) for bmap in bitmaps[node]))
> +            bitmaps[node] = sorted(((bmap['name'], bmap['persistent'])
> +                                    for bmap in bitmaps[node]))
> 
>           self.assertEqual(bitmaps,
>                            {'node-a': [('bmap-a', True), ('bmap-b', False)],
> 



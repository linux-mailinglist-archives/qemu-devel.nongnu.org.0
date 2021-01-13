Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7FA2F551D
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 00:11:33 +0100 (CET)
Received: from localhost ([::1]:53264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzpIa-0000aZ-VX
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 18:11:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kzpHh-0008IJ-6Z
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 18:10:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kzpHf-0005gH-JF
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 18:10:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610579434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a7j8lePG/uXxQZqy/20w6Nr3ghvDl6N2mVUn1191NeA=;
 b=Jdl0Vk4TLUMEFd2kOUJ60TbVTYGNd+t5j9WZiHhDJlaFshv/wogzHgtdXbFVAv0BmY8AZf
 6LuZAAaMwFnnOz6dBeuMOmHGGeurEoi/t2F07+1s93jdTy32D4Nsdw2WP/+fgO3PXYrBCB
 4OpF0ADYkXH/y1Y2i8VbBdcOtAbvcc8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-httBKOitPb6Sm3OonO0tBA-1; Wed, 13 Jan 2021 18:10:31 -0500
X-MC-Unique: httBKOitPb6Sm3OonO0tBA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8EEA9180A095;
 Wed, 13 Jan 2021 23:10:30 +0000 (UTC)
Received: from [10.3.113.36] (ovpn-113-36.phx2.redhat.com [10.3.113.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D434310013C1;
 Wed, 13 Jan 2021 23:10:29 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210109122631.167314-1-vsementsov@virtuozzo.com>
 <20210109122631.167314-8-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH v6 07/11] iotests: add findtests.py
Message-ID: <6c036c30-b0b7-dcb8-7161-c5771eff131b@redhat.com>
Date: Wed, 13 Jan 2021 17:10:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210109122631.167314-8-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: kwolf@redhat.com, den@openvz.org, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/9/21 6:26 AM, Vladimir Sementsov-Ogievskiy wrote:
> Add python script with new logic of searching for tests:
> 
> Current ./check behavior:
>  - tests are named [0-9][0-9][0-9]
>  - tests must be registered in group file (even if test doesn't belong
>    to any group, like 142)
> 

> 
> This commit don't update check behavior (which will be don in further

done

> commit), still, the documentation changed like new behavior is already
> here.  Let's live with this small inconsistency for the following few
> commits, until final change.
> 
> The file findtests.py is self-executable and may be used for debugging
> purposes.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  docs/devel/testing.rst          |  50 ++++++-
>  tests/qemu-iotests/findtests.py | 229 ++++++++++++++++++++++++++++++++
>  2 files changed, 278 insertions(+), 1 deletion(-)
>  create mode 100755 tests/qemu-iotests/findtests.py

In addition to Kevin's review,


> +Additional way of defining groups is creating tests/qemu-iotests/group.local
> +file. This should be used only for downstream (this file should never appear
> +in upstream). This file may be used for defining some downstream test groups
> +or for temporary disable tests, like this:

Kevin suggested s/disable/disabling/; I'd go one step further:
/temporary disable/temporarily disabling/


> +
> +- quick : Tests in this group should finish within some few seconds.

s/some/a/

Also, for each group name, the space before ':' looks odd.

> +++ b/tests/qemu-iotests/findtests.py
> @@ -0,0 +1,229 @@
> +#!/usr/bin/env python3
> +#
> +# Parse command line options to define set of tests to run.
> +#
> +# Copyright (c) 2020 Virtuozzo International GmbH

Worth claiming 2021 as well?

Otherwise, my python review is weak, but I didn't spot anything
blatantly wrong.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org



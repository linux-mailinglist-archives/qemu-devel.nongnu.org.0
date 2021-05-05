Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2AD37431D
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 18:53:13 +0200 (CEST)
Received: from localhost ([::1]:44246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leKls-0005lq-Jd
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 12:53:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1leKJJ-0008CA-Iu
 for qemu-devel@nongnu.org; Wed, 05 May 2021 12:23:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1leKJE-000327-5M
 for qemu-devel@nongnu.org; Wed, 05 May 2021 12:23:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620231814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HgfsgaBk2dwpDWCeNDeXXAHRkxPdcoPTyGaaQm87h08=;
 b=fAKL5pxfhyhZyRUkJcxBJP5y1Ss3LxMKybIV8D5vAlOymzopfczakr5k8Np5SPrHNfyAim
 wII/QOJorve3OAN+dqtWsGumvn7ioky8yhadKcySrDB8wjEUejA/AeQUhdxWHhJ4RvZfwY
 x4Jnmmmg9U4Ycg1LIJ3OcmqM/BeEWSc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-Si-fTAy4P1yXTh-FzLlDMw-1; Wed, 05 May 2021 12:23:32 -0400
X-MC-Unique: Si-fTAy4P1yXTh-FzLlDMw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A73AB107ACC7;
 Wed,  5 May 2021 16:23:31 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-115-153.ams2.redhat.com
 [10.36.115.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D8125D6AC;
 Wed,  5 May 2021 16:23:29 +0000 (UTC)
Subject: Re: [PATCH v2 9/9] block/write-threshold: drop extra includes
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210504082553.20377-1-vsementsov@virtuozzo.com>
 <20210504082553.20377-10-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <908586ae-f631-d626-3963-5b96d0c69b05@redhat.com>
Date: Wed, 5 May 2021 18:23:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210504082553.20377-10-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Cc: fam@euphon.net, kwolf@redhat.com, eesposit@redhat.com,
 qemu-devel@nongnu.org, stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.05.21 10:25, Vladimir Sementsov-Ogievskiy wrote:
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   block/write-threshold.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/block/write-threshold.c b/block/write-threshold.c
> index fbf4e6f5c4..db271c5537 100644
> --- a/block/write-threshold.c
> +++ b/block/write-threshold.c
> @@ -12,10 +12,7 @@
>    */
>   
>   #include "qemu/osdep.h"
> -#include "block/block_int.h"

We need this (for bs->write_threshold_offset), but it’s included through 
block/block_int.h.  I’m not sure whether we should drop it from the 
includes.

Perhaps we should instead drop block_int.h from write-threshold.h? 
Shouldn’t including qemu/osdep.h (which includes qemu/typedefs.h, which 
forward-declares BDS) be sufficient there?

> -#include "qemu/coroutine.h"
>   #include "block/write-threshold.h"
> -#include "qemu/notify.h"
>   #include "qapi/error.h"
>   #include "qapi/qapi-commands-block-core.h"
>   #include "qapi/qapi-events-block-core.h"

Btw, where does qemu/atomic.h come in?  Looks like it comes through 
block_int.h.  I think we should include it explicitly.

Max



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A48632DF12
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 02:26:51 +0100 (CET)
Received: from localhost ([::1]:58246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHzEw-00077j-E3
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 20:26:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lHzBR-0005Ie-EE
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 20:23:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lHzBP-0000C5-Rz
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 20:23:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614907391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Ag73K3Sa09PcFynJwy/Ezjgf/LN5Vje7U4B9f+IT4k=;
 b=M4/POg8yaFeKjy8xOGmzPjOfQt3X73493lM3uxZUh0XcmhzIGHsTGMspbNlEgLXcgT4PqN
 StD1R8mCCmO++7Yf376ivmvjdOTh5fSqg1pJuXAjrgsFJmKHrVR3VGLGQijUyEwo/jCU4Z
 LAuCuE7YpTUTijgFhQryZV1L0HbHhRE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-CTp6abgdOtOLSVqRrprjLw-1; Thu, 04 Mar 2021 20:23:09 -0500
X-MC-Unique: CTp6abgdOtOLSVqRrprjLw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F9BB80432E;
 Fri,  5 Mar 2021 01:23:08 +0000 (UTC)
Received: from [10.10.118.103] (ovpn-118-103.rdu2.redhat.com [10.10.118.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F00A5D755;
 Fri,  5 Mar 2021 01:23:06 +0000 (UTC)
Subject: Re: [PATCH v2 2/8] simplebench: bench_one(): support count=1
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210304101738.20248-1-vsementsov@virtuozzo.com>
 <20210304101738.20248-3-vsementsov@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <b2e643b1-540b-586a-0ca7-9caef9eaccdc@redhat.com>
Date: Thu, 4 Mar 2021 20:23:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210304101738.20248-3-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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
Cc: den@openvz.org, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/21 5:17 AM, Vladimir Sementsov-Ogievskiy wrote:
> statistics.stdev raises if sequence length is less than two. Support
> that case by hand.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   scripts/simplebench/simplebench.py | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/simplebench/simplebench.py b/scripts/simplebench/simplebench.py
> index b153cae274..712e1f845b 100644
> --- a/scripts/simplebench/simplebench.py
> +++ b/scripts/simplebench/simplebench.py
> @@ -92,7 +92,10 @@ def bench_one(test_func, test_env, test_case, count=5, initial_run=True,
>               dim = 'seconds'
>           result['dimension'] = dim
>           result['average'] = statistics.mean(r[dim] for r in succeeded)
> -        result['stdev'] = statistics.stdev(r[dim] for r in succeeded)
> +        if len(succeeded) == 1:
> +            result['stdev'] = 0
> +        else:
> +            result['stdev'] = statistics.stdev(r[dim] for r in succeeded)
>   
>       if len(succeeded) < count:
>           result['n-failed'] = count - len(succeeded)
> 

Omitted from patch context is that we have "if succeeded: ..." so we 
know it's at least 1 here.

Reviewed-by: John Snow <jsnow@redhat.com>



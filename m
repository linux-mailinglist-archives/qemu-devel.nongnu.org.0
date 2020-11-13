Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3922B1F7B
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 17:02:53 +0100 (CET)
Received: from localhost ([::1]:48164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdbXI-0001zB-QL
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 11:02:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kdbUP-0000Zw-6Z
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 10:59:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kdbUL-0001m3-PI
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 10:59:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605283188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8NP4LP1XEVhrf/QY8rjpIk/859QT77j3FxlWqxfxpqw=;
 b=E025VU4y5bZYnqGW+m/APrhWaISna7HbZ7kWgUw/TUpPZ9OgkEIO+yeVSoGOGPqgCXFA6k
 baq5+9sKe80Iuzc8yttmkR7P9/TX470t3kR5tH/Ji/AniHlUqUq9OXfJoNoqre1zwLB57C
 10u0H7GWDSo9ndPaMLnQbEWIdCZh/rw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-3qNnyzQHM6m_HtuMrJqzew-1; Fri, 13 Nov 2020 10:59:46 -0500
X-MC-Unique: 3qNnyzQHM6m_HtuMrJqzew-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3C01809DC6;
 Fri, 13 Nov 2020 15:59:44 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-96.ams2.redhat.com
 [10.36.114.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 527075B4B2;
 Fri, 13 Nov 2020 15:59:39 +0000 (UTC)
Subject: Re: [PATCH v7 18/21] simplebench/results_to_text: improve view of the
 table
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201021145859.11201-1-vsementsov@virtuozzo.com>
 <20201021145859.11201-19-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <1ad91d41-1f35-f49a-93b9-ef7f16de78ad@redhat.com>
Date: Fri, 13 Nov 2020 16:59:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201021145859.11201-19-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 16:09:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, den@virtuozzo.com, qemu-devel@nongnu.org,
 armbru@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.10.20 16:58, Vladimir Sementsov-Ogievskiy wrote:
> Move to generic format for floats and percentage for error.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   scripts/simplebench/results_to_text.py | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/simplebench/results_to_text.py b/scripts/simplebench/results_to_text.py
> index 58d909ffd9..479f7ac1d4 100644
> --- a/scripts/simplebench/results_to_text.py
> +++ b/scripts/simplebench/results_to_text.py
> @@ -16,11 +16,22 @@
>   # along with this program.  If not, see <http://www.gnu.org/licenses/>.
>   #
>   
> +import math
> +
> +
> +def format_value(x, stdev):
> +    stdev_pr = stdev / x * 100
> +    if stdev_pr < 1.5:
> +        # don't care too much
> +        return f'{x:.2g}'
> +    else:
> +        return f'{x:.2g} ± {math.ceil(stdev_pr)}%'

OK, so no magnitude-based precision this time (except for the %f -> %g 
change).  Works for me.

Other than that, I personally don’t like the relative standard deviation 
much, because the absolute SD immediately shows the 68 % boundaries (and 
an idea on the 95 % boundaries with 2σ), whereas the RSD just gives an 
impression on how spread out the data is.  (Which I find the absolute SD 
also does, when given together with the average, which is the case here.)

To be completely honest, though, I didn’t even know the term “relative 
SD” existed until a couple of minutes ago, and I didn’t know it was 
something that was used at all.
And if I haven’t seen the RSD used in practice, I can’t confidently say 
that I have good reasons not to like it.

But, well, I can’t have any confidence in liking it either, and because 
the change from ASD to RSD is basically the most important change of 
this patch (which I can’t really agree is an improvement), I can’t 
really give an R-b.

Perhaps this is OK:

Acked-by: Max Reitz <mreitz@redhat.com>

>   
>   def result_to_text(result):
>       """Return text representation of bench_one() returned dict."""
>       if 'average' in result:
> -        s = '{:.2f} +- {:.2f}'.format(result['average'], result['stdev'])
> +        s = format_value(result['average'], result['stdev'])
>           if 'n-failed' in result:
>               s += '\n({} failed)'.format(result['n-failed'])
>           return s
> 



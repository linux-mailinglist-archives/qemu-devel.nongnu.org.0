Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B94500D1B
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 14:21:59 +0200 (CEST)
Received: from localhost ([::1]:52626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neyU2-0001fN-HK
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 08:21:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1neyRZ-0000m2-Rl
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 08:19:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1neyRX-0004It-4I
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 08:19:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649938761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RmsNvDV1HQWVisVKG8PCGNMIpA7PH9SGGExb9qUG6f0=;
 b=C1sQYoAHEc7ciMMc/SeTMswTbQk+Q46KJbIh/Kze16TWTUq93cp1F+iNzXFlW5zrQxOBLS
 zHdYFdzFOkIugWSx2Tl1LQjFHACQ+BOYjmkHEt/zCW/XR0CL88s7cKUYLMurW6rmaQJyzb
 qeskQa8GFz7ahpAAe4g4lFw3tJWBz20=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-aIgqJ6xINKqXmrwT_sl8vA-1; Thu, 14 Apr 2022 08:19:18 -0400
X-MC-Unique: aIgqJ6xINKqXmrwT_sl8vA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3FB441014A66;
 Thu, 14 Apr 2022 12:19:18 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.9.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2DA571121331;
 Thu, 14 Apr 2022 12:19:18 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id F0C54220079; Thu, 14 Apr 2022 08:19:17 -0400 (EDT)
Date: Thu, 14 Apr 2022 08:19:17 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: Re: [PATCH] docs: Correct the default thread-pool-size
Message-ID: <YlgRRcgIbbE+ZKb7@redhat.com>
References: <20220413042054.1484640-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20220413042054.1484640-1-liuyd.fnst@fujitsu.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 13, 2022 at 12:20:54PM +0800, Liu Yiding wrote:
> Refer to 26ec190964 virtiofsd: Do not use a thread pool by default
> 
> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>

Looks good. Our default used to be --thread-pool-size=64. But we changed
it to using no thread pool because on lower end of workloads it performed
better. When multiple threads are doing parallel I/O then, thread pool
helps. So people who want to do lots of parallel I/O should manually
enable thread pool.

Acked-by: Vivek Goyal <vgoyal@redhat.com>

Vivek
> ---
>  docs/tools/virtiofsd.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/tools/virtiofsd.rst b/docs/tools/virtiofsd.rst
> index 0c0560203c..33fed08c6f 100644
> --- a/docs/tools/virtiofsd.rst
> +++ b/docs/tools/virtiofsd.rst
> @@ -127,7 +127,7 @@ Options
>  .. option:: --thread-pool-size=NUM
>  
>    Restrict the number of worker threads per request queue to NUM.  The default
> -  is 64.
> +  is 0.
>  
>  .. option:: --cache=none|auto|always
>  
> -- 
> 2.31.1
> 
> 
> 
> 



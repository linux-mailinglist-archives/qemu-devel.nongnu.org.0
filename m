Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C176EA484
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 09:18:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppl1f-0000AG-8c; Fri, 21 Apr 2023 03:17:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ppl1d-00005a-Go
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 03:17:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ppl1Z-0004e8-ES
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 03:17:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682061460;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=gqjLqOw+Ew3qXbaxPYjCfS9WAzFGHr0bskIBI4LNZZs=;
 b=PEv6Swb4aiXuxCveZZkbbdfOeKYumIBGNon0cH5YmVrknXdhftMmTndskcQGTtkSGQLY+B
 +etGi+PfFUaCPe0uUKVV710J4Gp70bIPB16G+pe4HX5q8fu1RT7qpRCBylw5pbK6kwTUTW
 croGa9+vNgH6eBMSt2R6pggEDbWkGZo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-xR4cSWSeMTuEbR7Jhk2H1w-1; Fri, 21 Apr 2023 03:17:36 -0400
X-MC-Unique: xR4cSWSeMTuEbR7Jhk2H1w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 00A61800B35;
 Fri, 21 Apr 2023 07:17:36 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A4E740C2064;
 Fri, 21 Apr 2023 07:17:35 +0000 (UTC)
Date: Fri, 21 Apr 2023 08:17:33 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Karim Taha <kariem.taha2.7@gmail.com>
Cc: qemu-devel@nongnu.org, imp@bsdimp.com
Subject: Re: [PATCH 01/11] Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
Message-ID: <ZEI4jQvHfU+JGFH9@redhat.com>
References: <20230421052255.5603-1-krm.taha@outlook.com>
 <20230421052255.5603-2-krm.taha@outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230421052255.5603-2-krm.taha@outlook.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Apr 21, 2023 at 07:22:45AM +0200, Karim Taha wrote:
> From: Warner Losh <imp@bsdimp.com>
> 
> Allow guest_base to be initialized on 64-bit hosts, the initial value is used by g2h_untagged function defined in include/exec/cpu_ldst.h

This commit message is all incorrectly structured I'm afraid.

There needs to a short 1 line summary, then a blank line,
then the full commit description text, then a blank line,
then the Signed-off-by tag(s).

Also if you're sending work done by Warner (as the From
tag suggests), then we would expect to see Warner's own
Signed-off-by tag, in addition to your own Signed-off-by.

> ---
>  bsd-user/main.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/bsd-user/main.c b/bsd-user/main.c
> index babc3b009b..afdc1b5f3c 100644
> --- a/bsd-user/main.c
> +++ b/bsd-user/main.c
> @@ -50,8 +50,22 @@
>  #include "target_arch_cpu.h"
>  
>  int singlestep;
> -uintptr_t guest_base;
> +
> +/*
> + * Going hand in hand with the va space needed (see below), we need
> + * to find a host address to map the guest to. Assume that qemu
> + * itself doesn't need memory above 32GB (or that we don't collide
> + * with anything interesting). This is selected rather arbitrarily,
> + * but seems to produce good results in tests to date.
> + */
> +# if HOST_LONG_BITS >= 64
> +uintptr_t guest_base = 0x800000000ul;    /* at 32GB */
> +bool have_guest_base = true;
> +#else
> +uintptr_t guest_base;    /* TODO: use sysctl to find big enough hole */
>  bool have_guest_base;
> +#endif
> +
>  /*
>   * When running 32-on-64 we should make sure we can fit all of the possible
>   * guest address space into a contiguous chunk of virtual host memory.
> -- 
> 2.40.0
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



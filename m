Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E77B36C1401
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 14:51:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peFuj-0000D3-0g; Mon, 20 Mar 2023 09:51:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1peFug-0000Bu-QV
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:51:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1peFuf-0006qZ-9f
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:51:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679320260;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kZu15T6cOb/YejN29+2I7YkNefrgcEHThEcYNk3wON0=;
 b=HGaIIyDGuE+zo7sCJyes0pZFBl/R6kGaPv4mj1L0RFEA9/AhTnqsbBpH+VUuVJ0ClsLPYH
 XwfhW5q06cd4skfzQRtGayxsqbijRDSby7PP8QKy//S3dSQKEBnmraHnfuMwBcv5EzlHux
 ptnAjpH2xojveTdwKgsXMmN0nONASFk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-135-gj-QwdmxNiasJTWFS99vTA-1; Mon, 20 Mar 2023 09:50:57 -0400
X-MC-Unique: gj-QwdmxNiasJTWFS99vTA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06BA9885621;
 Mon, 20 Mar 2023 13:50:57 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C20F8140EBF4;
 Mon, 20 Mar 2023 13:50:55 +0000 (UTC)
Date: Mon, 20 Mar 2023 13:50:53 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH-for-8.1 2/5] block/dmg: Remove duplicated prototype
 declarations
Message-ID: <ZBhkvQ1xt1m9VRJM@redhat.com>
References: <20230320134219.22489-1-philmd@linaro.org>
 <20230320134219.22489-3-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230320134219.22489-3-philmd@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, Mar 20, 2023 at 02:42:16PM +0100, Philippe Mathieu-Daudé wrote:
> Both dmg_uncompress_bz2 / dmg_uncompress_lzfse are declared
> in "dmg.h", included 1 line before.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  block/dmg.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/block/dmg.c b/block/dmg.c
> index e10b9a2ba5..a5d22fb8f9 100644
> --- a/block/dmg.c
> +++ b/block/dmg.c
> @@ -31,12 +31,6 @@
>  #include "qemu/memalign.h"
>  #include "dmg.h"
>  
> -int (*dmg_uncompress_bz2)(char *next_in, unsigned int avail_in,
> -                          char *next_out, unsigned int avail_out);
> -
> -int (*dmg_uncompress_lzfse)(char *next_in, unsigned int avail_in,
> -                            char *next_out, unsigned int avail_out);

These aren't prototypes, they are variables that hold a funtion
pointer. The header has them as 'extern' to avoid the variables
being instantiated more than once if the header is included many
times. This code is correct as-is, and so this change is not
desirable.

> -
>  enum {
>      /* Limit chunk sizes to prevent unreasonable amounts of memory being used
>       * or truncating when converting to 32-bit types
> -- 
> 2.38.1
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



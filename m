Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC524526C9C
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 23:54:13 +0200 (CEST)
Received: from localhost ([::1]:43524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npdEi-0007YD-JS
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 17:54:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1npdCu-0006fD-DP
 for qemu-devel@nongnu.org; Fri, 13 May 2022 17:52:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1npdCr-0006fl-DM
 for qemu-devel@nongnu.org; Fri, 13 May 2022 17:52:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652478735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vA5TDQ9Veuh0ezTIUMw7RcC8Gy2gjGVcZDkVzUpABQA=;
 b=TjMvYdZ+IU2YDYNf8zOlkPt7onFuPFVzuLL5rLsW6rkJdim4u1UDk2Fxvv+6rVyQa5hryi
 Xnc5UKak1AvpjrgjQEaB/8zEc3C8yMGPsFjYvARQJzkhD18X8ry6S32q30LFUUgroD3mlG
 Ew6PqO+61a3vY2KsYqavAcHPir7ViUQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-193-B564qOacPpi3c2I96zwr5Q-1; Fri, 13 May 2022 17:52:14 -0400
X-MC-Unique: B564qOacPpi3c2I96zwr5Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1369085A5A8
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 21:52:14 +0000 (UTC)
Received: from redhat.com (unknown [10.2.17.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BFFFC40CF8FA;
 Fri, 13 May 2022 21:52:13 +0000 (UTC)
Date: Fri, 13 May 2022 16:52:12 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 08/26] file-posix: add missing coroutine_fn annotations
Message-ID: <20220513215212.bqrzkl5lzu5wsov3@redhat.com>
References: <20220509103019.215041-1-pbonzini@redhat.com>
 <20220509103019.215041-9-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220509103019.215041-9-pbonzini@redhat.com>
User-Agent: NeoMutt/20220429-54-2d64b2
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 09, 2022 at 12:30:01PM +0200, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/file-posix.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Sparse commit message.

> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 48cd096624..76eea8d350 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -2158,7 +2158,7 @@ static void raw_aio_unplug(BlockDriverState *bs)
>  #endif
>  }
>  
> -static int raw_co_flush_to_disk(BlockDriverState *bs)
> +static int coroutine_fn raw_co_flush_to_disk(BlockDriverState *bs)

Only reached by:
+ .bdrv_co_flush_to_disk
  + io.c: coroutine_fn bdrv_co_flush

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org



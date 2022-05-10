Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB75521D82
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 17:06:17 +0200 (CEST)
Received: from localhost ([::1]:54250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noRRI-0002TL-5F
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 11:06:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1noRP7-0000Ns-Fj
 for qemu-devel@nongnu.org; Tue, 10 May 2022 11:04:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1noRP4-0001HR-8w
 for qemu-devel@nongnu.org; Tue, 10 May 2022 11:03:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652195035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S8jBK4KvVCRhmG8qhX2ekU++7fXfQl0tiAMWTJGIKSM=;
 b=eT1h3FWvR464THSQM37jAItg1OCsDduI8fZ1WnJFazGIfbbnPu8XwTv3zeQQJ2PUX94ZaL
 4O+/xZFLSw344asJYhd5tkJx6XfW7prcpZZEGxIOCnwfmfBrtqWzenGI3KRLwpbR4Vwr7E
 ak3ISQpGbEoKdKw51MOmYYLhdWSZm8o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-itrvLzyDMuOf1NkWLgWHOQ-1; Tue, 10 May 2022 11:03:53 -0400
X-MC-Unique: itrvLzyDMuOf1NkWLgWHOQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A0B6B180138B
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 15:03:53 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.230])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 548337C58;
 Tue, 10 May 2022 15:03:53 +0000 (UTC)
Date: Tue, 10 May 2022 10:03:51 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 01/26] block: remove incorrect coroutine_fn annotations
Message-ID: <20220510150351.4s2xxdwp4n6fzdun@redhat.com>
References: <20220509103019.215041-1-pbonzini@redhat.com>
 <20220509103019.215041-2-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220509103019.215041-2-pbonzini@redhat.com>
User-Agent: NeoMutt/20220429-35-ca2e7f
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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

On Mon, May 09, 2022 at 12:29:54PM +0200, Paolo Bonzini wrote:
> This is incorrect because blk_pwritev_part() is called by
> blk_pwrite_zeroes() and blk_pwrite(), neither of which has to be called
> from a coroutine.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/block-backend.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
> diff --git a/block/block-backend.c b/block/block-backend.c
> index e0e1aff4b1..fedf2eca83 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -1391,10 +1391,10 @@ int coroutine_fn blk_co_pwritev(BlockBackend *blk, int64_t offset,
>      return blk_co_pwritev_part(blk, offset, bytes, qiov, 0, flags);
>  }
>  
> -static int coroutine_fn blk_pwritev_part(BlockBackend *blk, int64_t offset,
> -                                         int64_t bytes,
> -                                         QEMUIOVector *qiov, size_t qiov_offset,
> -                                         BdrvRequestFlags flags)
> +static int blk_pwritev_part(BlockBackend *blk, int64_t offset,
> +                            int64_t bytes,
> +                            QEMUIOVector *qiov, size_t qiov_offset,
> +                            BdrvRequestFlags flags)
>  {
>      int ret;
>  
> -- 
> 2.35.1
> 
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org



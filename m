Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6C65076F3
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 19:59:29 +0200 (CEST)
Received: from localhost ([::1]:51612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngs8O-00032K-Kb
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 13:59:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ngs7F-00021z-Cb
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 13:58:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ngs7C-0004GJ-6J
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 13:58:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650391093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QRr+A1qUEQetGXB98M8xPGw9Nlwdjnz/hvBS0pJkeaY=;
 b=Gq8sUBD/f+sKH/9eiN8IqSW5xjHVcJQOgX6/PHlJLBo26O7aakP9LRN0MLuiRa63VeasCM
 O2cYEGvAjV2o3kwUz3v42KXdQciHlNNuDDSss0x1CbqCPn3aTMTMTvYHNtT+/XYk2KsxOm
 47sYmFy8IaxHvq0xBx3NZxB/jHwIf+0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-475-5DPCPspoNaCvsykg-gPgLA-1; Tue, 19 Apr 2022 13:58:10 -0400
X-MC-Unique: 5DPCPspoNaCvsykg-gPgLA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC874805F63;
 Tue, 19 Apr 2022 17:58:09 +0000 (UTC)
Received: from redhat.com (unknown [10.2.17.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 47709200BC61;
 Tue, 19 Apr 2022 17:57:56 +0000 (UTC)
Date: Tue, 19 Apr 2022 12:57:54 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 01/26] block: remove incorrect coroutine_fn annotations
Message-ID: <20220419175006.q52jsc3yqodmqlj7@redhat.com>
References: <20220415131900.793161-1-pbonzini@redhat.com>
 <20220415131900.793161-2-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220415131900.793161-2-pbonzini@redhat.com>
User-Agent: NeoMutt/20211029-35-db88c3
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Description: ify-labels-then-hide>-deleted
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, hreitz@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 15, 2022 at 03:18:35PM +0200, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Might be nice to document in the commit message why the annotation was
incorrect, so someone stumbling across this commit in a bisect but
otherwise unfamiliar with the rules of when to annotate doesn't get
lost.  If I understand right, the argument is more-or-less:

This function defers to the generated blk_do_pwritev_part, which is
safe to call outside coroutine context.

But although the commit message is weak, the change itself appears
correct from what I have observed with the annotation in other places.

Reviewed-by: Eric Blake <eblake@redhat.com>

> ---
>  block/block-backend.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
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
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org



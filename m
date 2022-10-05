Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3FF5F52F9
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 12:56:59 +0200 (CEST)
Received: from localhost ([::1]:56490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og258-00013M-21
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 06:56:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1og1tM-0003Ge-FD
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 06:44:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1og1tJ-0001qi-3I
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 06:44:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664966680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vuXqVdj1Don8EAQHt+qpyQwSoMZmNyMHfkXyPa6cLkE=;
 b=VHXtnUic/RjJjn1tDBowfWutpr2/zchf/Uy21qkXxw0yJSIRLwqZSY+fS7Fs43Tvt7GwUq
 EPhGXzuemMrsOllt8JrdWQ8RW4s+HTUs9iLBY9rLVdnUznitYEyst7pvEUwYH1/1eamkTc
 Dv68ulNf5wo/3qwNrUtirVvtUe+LqBI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-b_kGGEUKNvWhKF2nCQxwnQ-1; Wed, 05 Oct 2022 06:44:38 -0400
X-MC-Unique: b_kGGEUKNvWhKF2nCQxwnQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 50A0E1C05153;
 Wed,  5 Oct 2022 10:44:38 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CFCB2166B26;
 Wed,  5 Oct 2022 10:44:37 +0000 (UTC)
Date: Wed, 5 Oct 2022 12:44:36 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, afaria@redhat.com
Subject: Re: [PATCH 13/26] parallels: add missing coroutine_fn annotations
Message-ID: <Yz1gFIjR8jmk04GO@redhat.com>
References: <20220922084924.201610-1-pbonzini@redhat.com>
 <20220922084924.201610-14-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220922084924.201610-14-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 22.09.2022 um 10:49 hat Paolo Bonzini geschrieben:
> Callers of coroutine_fn must be coroutine_fn themselves, or the call
> must be within "if (qemu_in_coroutine())".  Apply coroutine_fn to
> functions where this holds.
> 
> Reviewed-by: Alberto Faria <afaria@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/parallels.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/block/parallels.c b/block/parallels.c
> index a229c06f25..5fc726f446 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -165,8 +165,9 @@ static int64_t block_status(BDRVParallelsState *s, int64_t sector_num,
>      return start_off;
>  }
>  
> -static int64_t allocate_clusters(BlockDriverState *bs, int64_t sector_num,
> -                                 int nb_sectors, int *pnum)
> +static coroutine_fn int64_t allocate_clusters(BlockDriverState *bs,
> +					      int64_t sector_num,
> +					      int nb_sectors, int *pnum)

Indentation with spaces instead of tabs for QEMU, please.

Kevin

>  {
>      int ret = 0;
>      BDRVParallelsState *s = bs->opaque;
> -- 
> 2.37.3
> 



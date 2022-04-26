Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D53A8510A6E
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 22:28:27 +0200 (CEST)
Received: from localhost ([::1]:48416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njRnP-0007Bx-0X
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 16:28:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1njRls-0004zM-GE
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 16:26:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1njRlr-000152-1o
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 16:26:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651004809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eIKDTCsGHMucCmYpVji/4hZO0Yk8P4j+qw+tKzv6eKA=;
 b=CTrOXZHsRdjBN4BM/HJK3LmOfV6R41ORetNURAlcEib5K2x5TxPXNlxZL+p7YQx7W75nTv
 0xVQ88YOzsVQN1jOw1zc3I00SMkVbBHYs+Ufd0GD4YFS3yK35J7nqLr5tz1//gyWLXRgXF
 tasgGGsJdL96CjE3j6Ga1HtEED9ZC9U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-FLjGF3EWOmCeDly3txzqQw-1; Tue, 26 Apr 2022 16:26:46 -0400
X-MC-Unique: FLjGF3EWOmCeDly3txzqQw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D7ED833942;
 Tue, 26 Apr 2022 20:26:46 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AD0959D7A;
 Tue, 26 Apr 2022 20:26:35 +0000 (UTC)
Date: Tue, 26 Apr 2022 15:26:34 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 10/26] nbd: add missing coroutine_fn annotations
Message-ID: <20220426202619.b3gnzsvoajxjskom@redhat.com>
References: <20220415131900.793161-1-pbonzini@redhat.com>
 <20220415131900.793161-11-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220415131900.793161-11-pbonzini@redhat.com>
User-Agent: NeoMutt/20220415-26-c08bba
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Fri, Apr 15, 2022 at 03:18:44PM +0200, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/nbd.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

As elsewhere in this series, a non-empty commit body would be useful.

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
> diff --git a/block/nbd.c b/block/nbd.c
> index 5af4deac3f..a4c8d661ad 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -974,11 +974,11 @@ static void nbd_iter_request_error(NBDReplyChunkIter *iter, int ret)
>   * nbd_reply_chunk_iter_receive
>   * The pointer stored in @payload requires g_free() to free it.
>   */
> -static bool nbd_reply_chunk_iter_receive(BDRVNBDState *s,
> -                                         NBDReplyChunkIter *iter,
> -                                         uint64_t handle,
> -                                         QEMUIOVector *qiov, NBDReply *reply,
> -                                         void **payload)
> +static bool coroutine_fn nbd_reply_chunk_iter_receive(BDRVNBDState *s,
> +                                                      NBDReplyChunkIter *iter,
> +                                                      uint64_t handle,
> +                                                      QEMUIOVector *qiov, NBDReply *reply,

Perhaps worth rewrapping this line.

> +                                                      void **payload)
>  {
>      int ret, request_ret;
>      NBDReply local_reply;
> -- 
> 2.35.1
> 
> 
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org



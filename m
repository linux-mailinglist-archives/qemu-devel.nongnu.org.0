Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B4252BD9A
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 16:52:26 +0200 (CEST)
Received: from localhost ([::1]:57848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrL2H-0006Ek-2n
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 10:52:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nrL0S-0005QP-HK
 for qemu-devel@nongnu.org; Wed, 18 May 2022 10:50:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nrL0Q-0007lD-Pd
 for qemu-devel@nongnu.org; Wed, 18 May 2022 10:50:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652885430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GIVhhEjQWnnvOCENqPe4NEdgO+iMZsQ5czpF0U6GwGw=;
 b=HY3iWosWALHJbXSwp/00JWzCe0pu/ThAiH9WaHl0px2zRIfqZzf/wLQi9U7SYP0an+Z2uX
 3Qqv7l+8hpdhTnb++qN2jPaPI7RrXCa6erQHkffy01akhNb2d3IlC9M29kE9N4lDT5Sa7y
 FLYgBpMedmboPQv0CHOPBYRayUfK5HI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-338-xciqwbIAM3SIlNAQJS47sg-1; Wed, 18 May 2022 10:50:28 -0400
X-MC-Unique: xciqwbIAM3SIlNAQJS47sg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C9A3294EDC2
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 14:50:28 +0000 (UTC)
Received: from redhat.com (unknown [10.2.17.180])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5293140C1438;
 Wed, 18 May 2022 14:50:28 +0000 (UTC)
Date: Wed, 18 May 2022 09:50:26 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 10/26] nbd: add missing coroutine_fn annotations
Message-ID: <20220518145026.ww62xroxrj4czypl@redhat.com>
References: <20220509103019.215041-1-pbonzini@redhat.com>
 <20220509103019.215041-11-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220509103019.215041-11-pbonzini@redhat.com>
User-Agent: NeoMutt/20220429-71-6f7d3e
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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

On Mon, May 09, 2022 at 12:30:03PM +0200, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/nbd.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/block/nbd.c b/block/nbd.c
> index 6085ab1d2c..fe913a6db4 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -983,11 +983,11 @@ static void nbd_iter_request_error(NBDReplyChunkIter *iter, int ret)
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

Might be worth wrapping the now-longer line.

> +                                                      void **payload)

Used only by the macro NBD_FOREACH_REPLY_CHUNK(), which in turn is
used by nbd_co_receive_return_code, nbd_co_receive_cmdread_reply,
nbd_co_receive_blockstatus_reply, which all got recently marked in
0c43c6fc.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org



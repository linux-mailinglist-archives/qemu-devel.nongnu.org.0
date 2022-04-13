Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 471144FF6CA
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 14:28:11 +0200 (CEST)
Received: from localhost ([::1]:52852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nec6T-0003sI-Rn
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 08:28:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nec4A-0002En-7f
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 08:25:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nec3j-0004GD-JC
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 08:25:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649852717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oHxHdj8IMfp9tPX1oug2oaOm9PlDBhdlIj4MN14qc2c=;
 b=QIVun++yX8Rxv+CaFuIUIRgpCo/g3YMuWmUfTRpCxRBXsY1pk9Cop1WArud5hAJEB5oKNz
 91qugWogNqy0kzbF00QWNRzCi0FEwC34wOaZrZhtoDQq/75wgaoyRiipxfi9kgG3im8PIp
 7PCX3lelinLHk4/p6tf+IoEvU3HfPXg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-368-z4pUrnqYPf2D17dYFoivpg-1; Wed, 13 Apr 2022 08:25:15 -0400
X-MC-Unique: z4pUrnqYPf2D17dYFoivpg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A935218E0042
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 12:25:15 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.251])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E35140CF8EA;
 Wed, 13 Apr 2022 12:25:15 +0000 (UTC)
Date: Wed, 13 Apr 2022 07:25:13 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH for-7.1 2/8] nbd: mark more coroutine_fns
Message-ID: <20220413122513.kcc65cmllyc7cl3m@redhat.com>
References: <20220412194204.350889-1-pbonzini@redhat.com>
 <20220412194204.350889-3-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220412194204.350889-3-pbonzini@redhat.com>
User-Agent: NeoMutt/20211029-6-a115bf
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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

On Tue, Apr 12, 2022 at 09:41:58PM +0200, Paolo Bonzini wrote:
> Several coroutine functions in block/nbd.c are not marked as such.  This
> patch adds a few more markers; it is not exhaustive, but it focuses
> especially on:
> 
> - places that wake other coroutines, because aio_co_wake() has very
> different semantics inside a coroutine (queuing after yield vs. entering
> immediately);
> 
> - functions with _co_ in their names, to avoid confusion

Should we add _co_ in the names of the three other functions thus
marked?  As in:

> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/nbd.c | 64 ++++++++++++++++++++++++++---------------------------
>  1 file changed, 32 insertions(+), 32 deletions(-)

> @@ -133,7 +133,7 @@ static bool nbd_client_connected(BDRVNBDState *s)
>      return qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTED;
>  }
> 
> -static bool nbd_recv_coroutine_wake_one(NBDClientRequest *req)
> +static bool coroutine_fn nbd_recv_coroutine_wake_one(NBDClientRequest *req)

This already has _coroutine_ in the name, would it be better as _co_?

>  {
>      if (req->receiving) {
>          req->receiving = false;
> @@ -144,7 +144,7 @@ static bool nbd_recv_coroutine_wake_one(NBDClientRequest *req)
>      return false;
>  }
> 
> -static void nbd_recv_coroutines_wake(BDRVNBDState *s, bool all)
> +static void coroutine_fn nbd_recv_coroutines_wake(BDRVNBDState *s, bool all)

This already has _coroutines_ in the name, would it be better as _co_?

>  {
>      int i;
> 
> @@ -155,7 +155,7 @@ static void nbd_recv_coroutines_wake(BDRVNBDState *s, bool all)
>      }
>  }
> 
> -static void nbd_channel_error(BDRVNBDState *s, int ret)
> +static void coroutine_fn nbd_channel_error(BDRVNBDState *s, int ret)

This has no mention of coroutines, but does call
nbd_recv_coroutines_wake.  Should we add _co_ in the name?

But as written, your change makes sense to me for adding the label to
all functions in this patch.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6093A521DAD
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 17:09:32 +0200 (CEST)
Received: from localhost ([::1]:59258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noRUR-0005yn-8l
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 11:09:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1noRQW-0002Lo-K9
 for qemu-devel@nongnu.org; Tue, 10 May 2022 11:05:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1noRQR-0001kR-8H
 for qemu-devel@nongnu.org; Tue, 10 May 2022 11:05:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652195122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RscqQXRCjA9EBCFY6b8p+DVldkqro1UKOoNDU6nPgdE=;
 b=YVYBy6sbzaHeLtymMe2L0bBlHJihmqny25EE1B9/DvcJ+uhn+vl9vxXG+Tln77iF7MPWRL
 n7ox2JQg1d6lErJ0BC1rTnwzMWPIFM/7a7Uvkw2xFEUEEdIKNahVKwWURdTOPwRMCnzV/f
 V/lqj+Q1CDIXFHrHoivUeB25CQyiUy8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-199-j4bX7d36MQ69HSPEu2Dckg-1; Tue, 10 May 2022 11:05:20 -0400
X-MC-Unique: j4bX7d36MQ69HSPEu2Dckg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C5B638349C8
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 15:05:20 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.230])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 008D6111D78A;
 Tue, 10 May 2022 15:05:19 +0000 (UTC)
Date: Tue, 10 May 2022 10:05:18 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 03/26] nbd: remove incorrect coroutine_fn annotations
Message-ID: <20220510150518.ata27mzhxajp4ix3@redhat.com>
References: <20220509103019.215041-1-pbonzini@redhat.com>
 <20220509103019.215041-4-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220509103019.215041-4-pbonzini@redhat.com>
User-Agent: NeoMutt/20220429-35-ca2e7f
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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

On Mon, May 09, 2022 at 12:29:56PM +0200, Paolo Bonzini wrote:
> nbd_co_establish_connection_cancel() cancels a coroutine but is not called
> from coroutine context itself, for example in nbd_cancel_in_flight()
> and in timer callbacks reconnect_delay_timer_cb() and open_timer_cb().
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  include/block/nbd.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
> diff --git a/include/block/nbd.h b/include/block/nbd.h
> index a98eb665da..5c3710fa52 100644
> --- a/include/block/nbd.h
> +++ b/include/block/nbd.h
> @@ -423,6 +423,6 @@ QIOChannel *coroutine_fn
>  nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
>                              bool blocking, Error **errp);
>  
> -void coroutine_fn nbd_co_establish_connection_cancel(NBDClientConnection *conn);
> +void nbd_co_establish_connection_cancel(NBDClientConnection *conn);
>  
>  #endif
> -- 
> 2.35.1
> 
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org



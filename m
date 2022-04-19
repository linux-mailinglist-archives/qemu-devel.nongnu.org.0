Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8D5507A7B
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 21:46:22 +0200 (CEST)
Received: from localhost ([::1]:34814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngtnp-0008VJ-6y
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 15:46:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ngtlY-0007Vk-JS
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 15:44:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ngtlW-000346-6j
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 15:43:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650397437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HY9CKCpPnaEXCSKER/5Jih1/OHN3lDBpAJgCmRjzTz4=;
 b=RtTiAPM1AkmBd/h5TtsLaEEgWNJeHygSa1VN85esmKFWswQ2/Oct9PxFpRpeOunv8DDibh
 qk67y5RlsybMTxRkrPba2nKAFV1QZpshVjmEumuh5aS9dyLA+6AA9y5nImgEuCX8nC7uJS
 uggX+ZEUaiZ1xW/wzYSXU0PlTxSWXaM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-223-oNOr-gcZO7qUZZE3vw402A-1; Tue, 19 Apr 2022 15:43:55 -0400
X-MC-Unique: oNOr-gcZO7qUZZE3vw402A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 68B00185A7BA;
 Tue, 19 Apr 2022 19:43:55 +0000 (UTC)
Received: from redhat.com (unknown [10.2.17.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FF9A2166BA3;
 Tue, 19 Apr 2022 19:43:32 +0000 (UTC)
Date: Tue, 19 Apr 2022 14:43:30 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 09/26] iscsi: add missing coroutine_fn annotations
Message-ID: <20220419193545.wmqt3ykswgf4swwu@redhat.com>
References: <20220415131900.793161-1-pbonzini@redhat.com>
 <20220415131900.793161-10-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220415131900.793161-10-pbonzini@redhat.com>
User-Agent: NeoMutt/20211029-35-db88c3
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, hreitz@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 15, 2022 at 03:18:43PM +0200, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/iscsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
> diff --git a/block/iscsi.c b/block/iscsi.c
> index d707d0b354..b33eeec794 100644
> --- a/block/iscsi.c
> +++ b/block/iscsi.c
> @@ -290,7 +290,7 @@ iscsi_co_generic_cb(struct iscsi_context *iscsi, int status,
>      }
>  }
>  
> -static void iscsi_co_init_iscsitask(IscsiLun *iscsilun, struct IscsiTask *iTask)
> +static void coroutine_fn iscsi_co_init_iscsitask(IscsiLun *iscsilun, struct IscsiTask *iTask)
>  {
>      *iTask = (struct IscsiTask) {
>          .co         = qemu_coroutine_self(),
> -- 
> 2.35.1
> 
> 
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org



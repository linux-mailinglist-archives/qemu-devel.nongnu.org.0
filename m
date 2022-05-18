Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FBE52BD97
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 16:45:41 +0200 (CEST)
Received: from localhost ([::1]:55478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrKvk-0004Am-8T
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 10:45:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nrKuU-0003Rr-C6
 for qemu-devel@nongnu.org; Wed, 18 May 2022 10:44:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nrKuR-0006qS-K3
 for qemu-devel@nongnu.org; Wed, 18 May 2022 10:44:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652885058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sLtZhI8sXqL4GDYzRf4Q6XbztKsu6dcaXZ5mErooONE=;
 b=NtRBGMxmDkCNWHDKIaEDy+rzIayWMsngeZNniDAqzdKI+O0bkiOSsFye8Z+yuH7D6arjSw
 OP6uP/ajbhKOTOh/lyM8iTFRXEmPEuAfW0wgY/CI66tyn3MC3i2mtZOki8hWL3BpffAEPk
 MgJFSSRMwhBTU9BTQz/Mltr2TiofiJg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-135-i3Pjw-sKNO-pbNBkHVFQlw-1; Wed, 18 May 2022 10:44:16 -0400
X-MC-Unique: i3Pjw-sKNO-pbNBkHVFQlw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7CAB986B8A2
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 14:44:16 +0000 (UTC)
Received: from redhat.com (unknown [10.2.17.180])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 326497C4F;
 Wed, 18 May 2022 14:44:16 +0000 (UTC)
Date: Wed, 18 May 2022 09:44:14 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 09/26] iscsi: add missing coroutine_fn annotations
Message-ID: <20220518144414.lrx3p2cebjuzjz27@redhat.com>
References: <20220509103019.215041-1-pbonzini@redhat.com>
 <20220509103019.215041-10-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220509103019.215041-10-pbonzini@redhat.com>
User-Agent: NeoMutt/20220429-71-6f7d3e
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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

On Mon, May 09, 2022 at 12:30:02PM +0200, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/iscsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
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

Might be worth wrapping the long line.

All callers are already coroutine_fn (iscsi_co_writev,
iscsi_co_block_status, iscsi_co_readv, iscsi_co_flush,
iscsi_co_pdiscard, iscsi_co_pwrite_zeroes, iscsi_co_copy_range_to), so
safe.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org



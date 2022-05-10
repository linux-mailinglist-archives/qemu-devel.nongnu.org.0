Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B7C52208E
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 18:02:33 +0200 (CEST)
Received: from localhost ([::1]:45216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noSJj-000587-M9
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 12:02:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1noSGf-00031f-Bf
 for qemu-devel@nongnu.org; Tue, 10 May 2022 11:59:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1noSGc-0003UY-UD
 for qemu-devel@nongnu.org; Tue, 10 May 2022 11:59:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652198357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vRWGwSKrMBkvzHcRnITzXTmpc3U1cRB5NNCOnj2k0WU=;
 b=YxVwgDDOuiKogxUjKT+oLH7ieNARa9ZVeT//cUiKQZyZdXbhItX2U0QD1T4EyF/5FsHUaD
 TeutBcSk+h+Fp3CJER3GlXL/shS1NhZ/yXhKRFSIyYpME3vzkILUu2qULmXJV9ZPbNDeXg
 RCgAWulhv8PURA5SNEuHukdjp1HgUzQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-412-M1-JrVBtPFmOYFlrx3Pl2A-1; Tue, 10 May 2022 11:59:16 -0400
X-MC-Unique: M1-JrVBtPFmOYFlrx3Pl2A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 109963806658
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 15:59:16 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.230])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BA9182166B2F;
 Tue, 10 May 2022 15:59:15 +0000 (UTC)
Date: Tue, 10 May 2022 10:59:14 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 06/26] blkverify: add missing coroutine_fn annotations
Message-ID: <20220510155914.4idkbbnyrifeeg32@redhat.com>
References: <20220509103019.215041-1-pbonzini@redhat.com>
 <20220509103019.215041-7-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220509103019.215041-7-pbonzini@redhat.com>
User-Agent: NeoMutt/20220429-35-ca2e7f
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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

On Mon, May 09, 2022 at 12:29:59PM +0200, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/blkverify.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/block/blkverify.c b/block/blkverify.c
> index e4a37af3b2..020b1ae7b6 100644
> --- a/block/blkverify.c
> +++ b/block/blkverify.c
> @@ -258,7 +258,7 @@ blkverify_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
>      return blkverify_co_prwv(bs, &r, offset, bytes, qiov, qiov, flags, true);
>  }
>  
> -static int blkverify_co_flush(BlockDriverState *bs)
> +static int coroutine_fn blkverify_co_flush(BlockDriverState *bs)

Called by:
+ .bdrv_co_flush
  + from io.c coroutine_fn bdrv_co_flush

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org



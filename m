Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29771526C52
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 23:27:45 +0200 (CEST)
Received: from localhost ([::1]:32904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npcp5-0007hp-RN
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 17:27:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1npcnn-00071V-Me
 for qemu-devel@nongnu.org; Fri, 13 May 2022 17:26:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1npcni-0002XH-OC
 for qemu-devel@nongnu.org; Fri, 13 May 2022 17:26:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652477177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qFqKUFg1OvIFjr+g1JlEiNpgBq+0fy7wox4BEPhIhcg=;
 b=ZadUlvlJUkIPREReg4khySRMpx2mIvBZ1azN0LgRzhB6KHpZcctcqaAdwnyBjeiYFbASDv
 Xlb5NHwUhNsQcGSt1sD/tpcwL1Myfz3VwgzSO46GACmyN8DJunVt6MuPejICYwTMgMndGb
 CZTcDNHSkr5h/0vhH/TOMNE2bHWH47w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-mHHUWtw1OkKlY1r6ViTZrQ-1; Fri, 13 May 2022 17:26:15 -0400
X-MC-Unique: mHHUWtw1OkKlY1r6ViTZrQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A7A5F101AA4D
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 21:26:15 +0000 (UTC)
Received: from redhat.com (unknown [10.2.17.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FB152027EB4;
 Fri, 13 May 2022 21:26:15 +0000 (UTC)
Date: Fri, 13 May 2022 16:26:13 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 07/26] block: add missing coroutine_fn annotations
Message-ID: <20220513212613.laydrlckh63wett4@redhat.com>
References: <20220509103019.215041-1-pbonzini@redhat.com>
 <20220509103019.215041-8-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220509103019.215041-8-pbonzini@redhat.com>
User-Agent: NeoMutt/20220429-54-2d64b2
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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

On Mon, May 09, 2022 at 12:30:00PM +0200, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Resuming more of my review...

> ---
>  block/block-backend.c | 18 +++++++++---------
>  block/io.c            | 24 ++++++++++++------------
>  2 files changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/block/block-backend.c b/block/block-backend.c
> index fedf2eca83..52009b8949 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -1413,8 +1413,8 @@ typedef struct BlkRwCo {
>      BdrvRequestFlags flags;
>  } BlkRwCo;
>  
> -int blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
> -                      int64_t bytes, BdrvRequestFlags flags)
> +int coroutine_fn blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
> +                                   int64_t bytes, BdrvRequestFlags flags)

Tracking down all callers of blk_pwrite_zeroes is not as trivial as in
the previous patches.  But the very first one I checked:
 block.c: create_file_fallback_zero_first_sector()

is neither marked coroutine_fn, nor does it have the "if
(qemu_in_coroutine())" guard.  And block.c is not touched in this
patch series, per the diffstat in 0/26.  Am I missing something?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org



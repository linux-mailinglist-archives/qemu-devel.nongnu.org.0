Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBFD50797D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 20:57:06 +0200 (CEST)
Received: from localhost ([::1]:46350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngt29-0007y7-7S
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 14:57:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ngsw9-0001Jv-VR
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 14:50:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ngsw7-0003ho-FG
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 14:50:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650394248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xVSjj474/36QrgcFMygaWIOHq5gO+UY7KL/lZeLrhnU=;
 b=V+15E8Ux91A6TZ784rzaqocOXrzvJTG3u/fkWa7UEkj7qaqG0EQ6iEcURX3H+fuGtWGCuH
 GrqaxOKoh3qROWmlMinjmlQK6ehy9XHuLDiIbAYr9ID70iaIxiYPbiTrfEt6PtOvLiwhg/
 WjpViaBMIxWs5vRejyiGygolnm3iLJ8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-45-iNWEV_YGM8K67FrXj3aiHg-1; Tue, 19 Apr 2022 14:50:45 -0400
X-MC-Unique: iNWEV_YGM8K67FrXj3aiHg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DFF5218E5345;
 Tue, 19 Apr 2022 18:50:44 +0000 (UTC)
Received: from redhat.com (unknown [10.2.17.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 45C1840885C5;
 Tue, 19 Apr 2022 18:50:43 +0000 (UTC)
Date: Tue, 19 Apr 2022 13:50:41 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 07/26] block: add missing coroutine_fn annotations
Message-ID: <20220419185041.24syfi4glf4fk7o5@redhat.com>
References: <20220415131900.793161-1-pbonzini@redhat.com>
 <20220415131900.793161-8-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220415131900.793161-8-pbonzini@redhat.com>
User-Agent: NeoMutt/20211029-35-db88c3
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
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

On Fri, Apr 15, 2022 at 03:18:41PM +0200, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/block-backend.c | 18 +++++++++---------
>  block/io.c            | 24 ++++++++++++------------
>  2 files changed, 21 insertions(+), 21 deletions(-)
> 

> @@ -1580,8 +1580,8 @@ int blk_pread(BlockBackend *blk, int64_t offset, void *buf, int bytes)
>      return ret < 0 ? ret : bytes;
>  }
>  
> -int blk_pwrite(BlockBackend *blk, int64_t offset, const void *buf, int bytes,
> -               BdrvRequestFlags flags)
> +int coroutine_fn blk_pwrite(BlockBackend *blk, int64_t offset, const void *buf, int bytes,
> +                            BdrvRequestFlags flags)

Long line, worth rewrapping differently?

The functions with _co_ in the name are obvious, the others might be
worth a comment why it is okay.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org



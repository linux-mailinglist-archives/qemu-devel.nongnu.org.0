Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D427521DE2
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 17:14:12 +0200 (CEST)
Received: from localhost ([::1]:41332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noRYx-0004fL-43
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 11:14:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1noRWw-0001y0-OM
 for qemu-devel@nongnu.org; Tue, 10 May 2022 11:12:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1noRWv-00034K-8L
 for qemu-devel@nongnu.org; Tue, 10 May 2022 11:12:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652195524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PaP3015jzLkon+g3pTLw7CAgOJmestK9Tk3OlHf1ZRY=;
 b=L8cvm/huz//yhxseTz3s9FEyuIG/PMJ2bB+wIgmF9n0glMOE5504MWKZdFcoUFAvWRVqOn
 3vo7jZ2NODNsirlqGkWg6TiK3diLadnJzpE6nTDrGgVmHOwIvse4iqWokCOOJV+tCLX9pG
 6zCUiyv+JvAM0Jzls0CSaattR7qieMU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-206-YlcRV3LvPdGOC6QOnmCbZA-1; Tue, 10 May 2022 11:12:02 -0400
X-MC-Unique: YlcRV3LvPdGOC6QOnmCbZA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B855A18EE0
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 15:12:02 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.230])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 48B8E40E7F06;
 Tue, 10 May 2022 15:12:02 +0000 (UTC)
Date: Tue, 10 May 2022 10:12:00 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 04/26] coroutine: remove incorrect coroutine_fn
 annotations
Message-ID: <20220510151200.26rvjo7h733qi7mt@redhat.com>
References: <20220509103019.215041-1-pbonzini@redhat.com>
 <20220509103019.215041-5-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220509103019.215041-5-pbonzini@redhat.com>
User-Agent: NeoMutt/20220429-35-ca2e7f
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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

On Mon, May 09, 2022 at 12:29:57PM +0200, Paolo Bonzini wrote:
> qemu_coroutine_get_aio_context inspects a coroutine, but it does
> not have to be called from the coroutine itself (or from any
> coroutine).
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  include/qemu/coroutine.h | 2 +-
>  util/qemu-coroutine.c    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org



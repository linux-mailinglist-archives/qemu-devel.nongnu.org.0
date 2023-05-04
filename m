Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B146F714D
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:42:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucom-0007In-AL; Thu, 04 May 2023 13:32:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1puc77-000460-Jx
 for qemu-devel@nongnu.org; Thu, 04 May 2023 12:47:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1puc75-0006cx-TV
 for qemu-devel@nongnu.org; Thu, 04 May 2023 12:47:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683218846;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hi/wwn4xuFeCISw4tnbLy1SeQYoU/Gb4aCAumf09Fbc=;
 b=AJmwyIf8izNJyPNyH/SVDTWtCNTTPJzMNt6V1x6nt17MVdYQCxWCPwLO6pp5fP2ArwUssQ
 yallAGJHH/4YbQfx+hu51gZjmTqAiosDLP1q/xktiDrYR6+VHAMSSH7STJpDxsCm/rdpHv
 0jnXgD1BhJGYq6F3Mjsuhte9twd4Csk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-313-8-9GX0puOOylitoWRnlcTA-1; Thu, 04 May 2023 12:47:25 -0400
X-MC-Unique: 8-9GX0puOOylitoWRnlcTA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 24236884EC0
 for <qemu-devel@nongnu.org>; Thu,  4 May 2023 16:47:25 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5109B492C13;
 Thu,  4 May 2023 16:47:24 +0000 (UTC)
Date: Thu, 4 May 2023 17:47:22 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras <leobras@redhat.com>,
 Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 1/2] migration: Document all migration_stats
Message-ID: <ZFPhmrCnF8Rdkkxq@redhat.com>
References: <20230504103357.22130-1-quintela@redhat.com>
 <20230504103357.22130-2-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230504103357.22130-2-quintela@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, May 04, 2023 at 12:33:56PM +0200, Juan Quintela wrote:
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/migration-stats.h | 43 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/migration/migration-stats.h b/migration/migration-stats.h
> index 149af932d7..0e49c236fa 100644
> --- a/migration/migration-stats.h
> +++ b/migration/migration-stats.h
> @@ -22,17 +22,60 @@
>   * one thread).
>   */
>  typedef struct {
> +    /*
> +     * number of bytes that were dirty last time that we sync with the

 s/sync/synced/

> +     * guest memory.  We use that to calculate the downtime.  As the
> +     * remaining dirty amounts to what we know that is still dirty
> +     * since last iteration, not counting what the guest has dirtied
> +     * sync we synchronize bitmaps.

  s/synchronize/synchronized/

> +     */
>      Stat64 dirty_bytes_last_sync;
> +    /*
> +     * number of pages dirtied by second.

 s/by/per/

> +     */
>      Stat64 dirty_pages_rate;
> +    /*
> +     * number of times we have synchronize guest bitmaps.

  s/synchronize/synchronized/

>      Stat64 postcopy_bytes;
> +    /*
> +     * number of postcopy page faults that we have handled during
> +     * postocpy stage.

s/postocpy/postcopy/


Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



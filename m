Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6E92760BC
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Sep 2020 21:04:28 +0200 (CEST)
Received: from localhost ([::1]:51914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLA43-0006Fg-2C
	for lists+qemu-devel@lfdr.de; Wed, 23 Sep 2020 15:04:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kLA2e-0005YW-TL
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 15:03:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kLA2d-0004w4-4l
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 15:03:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600887778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c+URzDGQGsLMVI+63ZBV89oBGMfo3xltn0zIN8x9xw0=;
 b=Zmh18IV2Tm1h4jPy3HXDWrKBpj6DhbESL9siQHeiFIEeVoleF4ePUCD+cpcPm6BdOH4gDg
 LQuNgpzVUYHW6P/8xCh8ZAAGAG/rTJQxgTbK+z3d6dxhuiYVFzUEs/FNtr/n54Y6qPI2+8
 BAoeBskendm42batQ6ifh+M0pziuBHg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-ZGdz4t2UMtqH6fFem2FqmQ-1; Wed, 23 Sep 2020 15:02:54 -0400
X-MC-Unique: ZGdz4t2UMtqH6fFem2FqmQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B73E1007F1F;
 Wed, 23 Sep 2020 19:02:44 +0000 (UTC)
Received: from work-vm (ovpn-113-46.ams2.redhat.com [10.36.113.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA51528564;
 Wed, 23 Sep 2020 19:02:41 +0000 (UTC)
Date: Wed, 23 Sep 2020 20:02:39 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH] migration: increase max-bandwidth to 128 MiB/s (1 Gib/s)
Message-ID: <20200923190239.GB150308@work-vm>
References: <20200921144957.979989-1-lvivier@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200921144957.979989-1-lvivier@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 23:02:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, Andrea Bolognani <abologna@redhat.com>,
 David Gibson <dgibson@redhat.com>, Frediano Ziglio <fziglio@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Laurent Vivier (lvivier@redhat.com) wrote:
> max-bandwidth is set by default to 32 MiB/s (256 Mib/s)
> since 2008 (5bb7910af031c).
> 
> Most of the CPUs can dirty memory faster than that now,
> and this is clearly a problem with POWER where the page
> size is 64 kiB and not 4 KiB.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Queued

> ---
>  migration/migration.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 58a5452471f9..1c4174947181 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -57,7 +57,7 @@
>  #include "qemu/queue.h"
>  #include "multifd.h"
>  
> -#define MAX_THROTTLE  (32 << 20)      /* Migration transfer speed throttling */
> +#define MAX_THROTTLE  (128 << 20)      /* Migration transfer speed throttling */
>  
>  /* Amount of time to allocate to each "chunk" of bandwidth-throttled
>   * data. */
> -- 
> 2.26.2
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK



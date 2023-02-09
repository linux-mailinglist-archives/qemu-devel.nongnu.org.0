Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC86690883
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 13:17:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ5rw-0002zz-3Y; Thu, 09 Feb 2023 07:17:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pQ5rl-0002z7-OA
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 07:17:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pQ5rk-0003QY-4R
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 07:17:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675945047;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZJxa4ltFHVUPbrBRd3LNdCnbdtHWVRO+siM2B1kJa1w=;
 b=IgNAoCW+lgzoNawaFgZ3Mw9xKkAAsaZGhDNWiHZMa5N5fX13RoMV0fDL+DV1qDZU8COulX
 xbmAoBqRanAMt+y/UQVIaod9Xyk1aq5EnzH2x55Ktk/85a1d08xslEo7sZxhkW5WJ2+DMy
 e4+iacZfcLOIgcZspv8divuJr8Kk9kc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-353-7naD1eJLO0Oy8bf01DJIdw-1; Thu, 09 Feb 2023 07:17:26 -0500
X-MC-Unique: 7naD1eJLO0Oy8bf01DJIdw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A07385A5B1
 for <qemu-devel@nongnu.org>; Thu,  9 Feb 2023 12:17:26 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EA584043840;
 Thu,  9 Feb 2023 12:17:25 +0000 (UTC)
Date: Thu, 9 Feb 2023 12:17:23 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] migration: Remove spurious files
Message-ID: <Y+TkU2e1m8tnoiyQ@redhat.com>
References: <20230209121449.30232-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230209121449.30232-1-quintela@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Feb 09, 2023 at 01:14:49PM +0100, Juan Quintela wrote:
> I introduced spurious files on my tree during a rebase:
> 
> commit ebfc57871506b3fe36cc41f69ee3ad31a34afd63
> Author: Zhenzhong Duan <zhenzhong.duan@intel.com>
> Date:   Mon Oct 17 15:53:51 2022 +0800
> 
>     multifd: Fix flush of zero copy page send request
> 
>     Make IO channel flush call after the inflight request has been drained
>     in multifd thread, or else we may missed to flush the inflight request.
> 
>     Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
>     Reviewed-by: Juan Quintela <quintela@redhat.com>
>     Signed-off-by: Juan Quintela <quintela@redhat.com>
> 
> To make things worse, it appears like Zhenzhong is the one to blame.
> 
> for(int i=0; i < 1000000; i++) {
> 	printf("I will not do rebases when I am tired\n");
> }
> 
> Sorry, Juan.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  .../x86_64-quintela-devices.mak               |    7 -
>  .../x86_64-quintela2-devices.mak              |    6 -
>  migration/multifd.c.orig                      | 1274 -----------------
>  3 files changed, 1287 deletions(-)
>  delete mode 100644 configs/devices/x86_64-softmmu/x86_64-quintela-devices.mak
>  delete mode 100644 configs/devices/x86_64-softmmu/x86_64-quintela2-devices.mak
>  delete mode 100644 migration/multifd.c.orig

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD596D005D
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 11:58:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1php39-0001CF-NN; Thu, 30 Mar 2023 05:58:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dg@treblig.org>) id 1php37-0001C6-KF
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 05:58:29 -0400
Received: from mx.treblig.org ([46.235.229.95])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dg@treblig.org>) id 1php35-0006L3-Bz
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 05:58:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=TijC+CNuVeHT10+1IxAgrEtVufQ4zWNJ4NsSUgYaHJM=; b=BeBJYyf1dUppHgnWSahOzRYWue
 gpPJMM2Am0rftPuT3n5RLwE2uPd75K8B3Va2Qb86BS3j/stQx4tvFFyN3qhSqN752vD+g6NxGVobx
 e1pDrXzIZLtKDyWhnq7Pymc5CsI4O+a/l/uV+ylwJKQlKjko7oJ3xm3F25dOb7ME0iab+RHQamVrT
 qT6trBtwT8zDyXpBYgchLzP+HRnIICiaypsM0ja/wJPm60DwLUEimaqKsy7riXvGfjeLv89apCVh0
 Y1zJ4nDtv7co2YRFhptV8+qU3uKNQPk6rBTz1VVTlOVg+K9nSxbEFHsKvae7i5KgrwxIQKKlyH3RX
 F3VJmRIQ==;
Received: from dg by mx.treblig.org with local (Exim 4.94.2)
 (envelope-from <dg@treblig.org>)
 id 1php2x-001xWh-Ft; Thu, 30 Mar 2023 09:58:19 +0000
Date: Thu, 30 Mar 2023 09:58:19 +0000
From: "Dr. David Alan Gilbert" <dave@treblig.org>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, quintela@redhat.com,
 peter.maydell@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH] MAINTAINERS: Remove and change David Gilbert maintainer
 entries
Message-ID: <ZCVdOxnVCZvUIviq@gallifrey>
References: <20230330095524.37691-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20230330095524.37691-1-dgilbert@redhat.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/5.10.0-21-amd64 (x86_64)
X-Uptime: 09:56:49 up 10 days, 20:31, 1 user, load average: 0.02, 0.02, 0.00
User-Agent: Mutt/2.0.5 (2021-01-21)
Received-SPF: pass client-ip=46.235.229.95; envelope-from=dg@treblig.org;
 helo=mx.treblig.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

* Dr. David Alan Gilbert (git) (dgilbert@redhat.com) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> I'm leaving Red Hat next week, so clean up the maintainer entries.
> 
> 'virtiofs' is just the device code now, so is pretty small, and
> Stefan is still a maintainer there.
> 
> 'migration' still has Juan.
> 
> For 'HMP' I'll swing that over to my personal email.
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Acked-by: Dr. David Alan Gilbert <dave@treblig.org>

> ---
>  MAINTAINERS | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ef45b5e71e..f0f7fb3746 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2119,7 +2119,6 @@ T: git https://github.com/borntraeger/qemu.git s390-next
>  L: qemu-s390x@nongnu.org
>  
>  virtiofs
> -M: Dr. David Alan Gilbert <dgilbert@redhat.com>
>  M: Stefan Hajnoczi <stefanha@redhat.com>
>  S: Supported
>  F: hw/virtio/vhost-user-fs*
> @@ -2863,7 +2862,7 @@ F: tests/unit/test-rcu-*.c
>  F: util/rcu.c
>  
>  Human Monitor (HMP)
> -M: Dr. David Alan Gilbert <dgilbert@redhat.com>
> +M: Dr. David Alan Gilbert <dave@treblig.org>
>  S: Maintained
>  F: monitor/monitor-internal.h
>  F: monitor/misc.c
> @@ -3136,7 +3135,6 @@ F: scripts/checkpatch.pl
>  
>  Migration
>  M: Juan Quintela <quintela@redhat.com>
> -M: Dr. David Alan Gilbert <dgilbert@redhat.com>
>  S: Maintained
>  F: hw/core/vmstate-if.c
>  F: include/hw/vmstate-if.h
> -- 
> 2.39.2
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6956921A1A
	for <lists+qemu-devel@lfdr.de>; Fri, 17 May 2019 16:54:30 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49781 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hReFh-0001do-Ks
	for lists+qemu-devel@lfdr.de; Fri, 17 May 2019 10:54:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47786)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hReDk-0000ok-PR
	for qemu-devel@nongnu.org; Fri, 17 May 2019 10:52:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hReDj-0000l8-Ux
	for qemu-devel@nongnu.org; Fri, 17 May 2019 10:52:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:8712)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>)
	id 1hReDj-0000Ya-Nj; Fri, 17 May 2019 10:52:27 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CA88F3097053;
	Fri, 17 May 2019 14:52:18 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C4ADD600C4;
	Fri, 17 May 2019 14:52:17 +0000 (UTC)
Date: Fri, 17 May 2019 15:52:15 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Greg Kurz <groug@kaod.org>
Message-ID: <20190517145214.GG3596@work-vm>
References: <155800428514.543845.17558475870097990036.stgit@bahia.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <155800428514.543845.17558475870097990036.stgit@bahia.lan>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Fri, 17 May 2019 14:52:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] migration: Fix typo in
 migrate_add_blocker() error message
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Greg Kurz (groug@kaod.org) wrote:
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  migration/migration.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 609e0df5d0c0..c15e75e0eebe 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1714,7 +1714,7 @@ int migrate_add_blocker(Error *reason, Error **errp)
>      if (only_migratable) {
>          error_propagate_prepend(errp, error_copy(reason),
>                                  "disallowing migration blocker "
> -                                "(--only_migratable) for: ");
> +                                "(--only-migratable) for: ");

Thanks.
Trivial: Please take this.


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

>          return -EACCES;
>      }
>  
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


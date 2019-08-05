Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 367AF8158D
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Aug 2019 11:35:04 +0200 (CEST)
Received: from localhost ([::1]:52074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1huZOR-0003CD-8b
	for lists+qemu-devel@lfdr.de; Mon, 05 Aug 2019 05:35:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60863)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1huZNi-0002l4-N0
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 05:34:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1huZNh-00017Z-L6
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 05:34:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58500)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1huZNh-00016z-AM
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 05:34:17 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CE18389AC6;
 Mon,  5 Aug 2019 09:34:14 +0000 (UTC)
Received: from work-vm (ovpn-117-168.ams2.redhat.com [10.36.117.168])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D771D1001B03;
 Mon,  5 Aug 2019 09:34:13 +0000 (UTC)
Date: Mon, 5 Aug 2019 10:34:11 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190805093411.GB13734@work-vm>
References: <20190711080816.6405-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190711080816.6405-1-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Mon, 05 Aug 2019 09:34:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] migration/postcopy: PostcopyState is
 already set in loadvm_postcopy_handle_advise()
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
Cc: qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Wei Yang (richardw.yang@linux.intel.com) wrote:
> PostcopyState is already set to ADVISE at the beginning of
> loadvm_postcopy_handle_advise().
> 
> Remove the redundant set.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/savevm.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 8a2ada529e..2350e219fc 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -1648,8 +1648,6 @@ static int loadvm_postcopy_handle_advise(MigrationIncomingState *mis,
>          return -1;
>      }
>  
> -    postcopy_state_set(POSTCOPY_INCOMING_ADVISE);
> -
>      return 0;
>  }
>  
> -- 
> 2.17.1
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


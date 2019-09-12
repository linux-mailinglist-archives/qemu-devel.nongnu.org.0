Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F647B0CE4
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Sep 2019 12:29:09 +0200 (CEST)
Received: from localhost ([::1]:60446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8MLc-0005xo-E9
	for lists+qemu-devel@lfdr.de; Thu, 12 Sep 2019 06:29:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54636)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1i8MI6-0003cv-0h
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 06:25:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1i8MI4-0001E7-VW
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 06:25:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57570)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1i8MI4-0001Dz-QW
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 06:25:28 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2D523103EF64;
 Thu, 12 Sep 2019 10:25:28 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5068A5C22C;
 Thu, 12 Sep 2019 10:25:27 +0000 (UTC)
Date: Thu, 12 Sep 2019 11:25:24 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190912102524.GH7230@work-vm>
References: <20190912024957.11780-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190912024957.11780-1-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Thu, 12 Sep 2019 10:25:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] migration: fix one typo in comment of
 function migration_total_bytes()
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
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>

Queued

> ---
>  migration/migration.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index fbdabd34d9..cae3e894ad 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -3023,7 +3023,7 @@ static MigThrError migration_detect_error(MigrationState *s)
>      }
>  }
>  
> -/* How many bytes have we transferred since the beggining of the migration */
> +/* How many bytes have we transferred since the beginning of the migration */
>  static uint64_t migration_total_bytes(MigrationState *s)
>  {
>      return qemu_ftell(s->to_dst_file) + ram_counters.multifd_bytes;
> -- 
> 2.17.1
> 
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


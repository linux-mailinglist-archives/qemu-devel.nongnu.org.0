Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D5FB0CB3
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Sep 2019 12:19:17 +0200 (CEST)
Received: from localhost ([::1]:60304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8MC3-0004GF-W0
	for lists+qemu-devel@lfdr.de; Thu, 12 Sep 2019 06:19:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53381)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1i8M9e-00034B-QN
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 06:16:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1i8M9d-0006Zu-T1
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 06:16:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44365)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1i8M9d-0006Zg-O9
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 06:16:45 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1DC1A10C0937
 for <qemu-devel@nongnu.org>; Thu, 12 Sep 2019 10:16:45 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4430E5D9E2;
 Thu, 12 Sep 2019 10:16:44 +0000 (UTC)
Date: Thu, 12 Sep 2019 11:16:41 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, quintela@redhat.com, berrange@redhat.com
Message-ID: <20190912101641.GD7230@work-vm>
References: <20190823103946.7388-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190823103946.7388-1-dgilbert@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.66]); Thu, 12 Sep 2019 10:16:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] qemu-file: Rework old qemu_fflush comment
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Dr. David Alan Gilbert (git) (dgilbert@redhat.com) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Commit 11808bb removed the non-iovec based write support,
> the comment hung on.
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Queued

> ---
>  migration/qemu-file.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> index e33c46764f..075faf03c3 100644
> --- a/migration/qemu-file.c
> +++ b/migration/qemu-file.c
> @@ -201,9 +201,8 @@ static void qemu_iovec_release_ram(QEMUFile *f)
>  /**
>   * Flushes QEMUFile buffer
>   *
> - * If there is writev_buffer QEMUFileOps it uses it otherwise uses
> - * put_buffer ops. This will flush all pending data. If data was
> - * only partially flushed, it will set an error state.
> + * This will flush all pending data. If data was only partially flushed, it
> + * will set an error state.
>   */
>  void qemu_fflush(QEMUFile *f)
>  {
> -- 
> 2.21.0
> 
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


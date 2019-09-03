Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E66A71C6
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Sep 2019 19:36:29 +0200 (CEST)
Received: from localhost ([::1]:49818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5CjE-0006U6-Ld
	for lists+qemu-devel@lfdr.de; Tue, 03 Sep 2019 13:36:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51434)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1i5CiD-0005zg-D2
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 13:35:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1i5CiC-0001Hx-4X
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 13:35:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36404)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1i5CiB-0001GU-VX
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 13:35:24 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 707188AC6FD
 for <qemu-devel@nongnu.org>; Tue,  3 Sep 2019 17:35:23 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 494AD60619;
 Tue,  3 Sep 2019 17:35:14 +0000 (UTC)
Date: Tue, 3 Sep 2019 18:35:11 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20190903173511.GW2744@work-vm>
References: <20190827142340.23811-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190827142340.23811-1-stefanha@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.69]); Tue, 03 Sep 2019 17:35:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [Virtio-fs] [PATCH] virtiofsd: fix "filed" ->
 "failed" typo in error message
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Stefan Hajnoczi (stefanha@redhat.com) wrote:
> Reported-by: Jun Piao <piaojun@huawei.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Thanks, squashed into 'virtiofsd: passthrough_ll: add fallback for racy
ops'

Dave

> ---
> Based-on: <20190823092401.11883-1-stefanha@redhat.com>
>           ("[PATCH 0/2] virtiofsd: use "fuse_log.h" APIs instead of <err.h>")
> 
>  contrib/virtiofsd/passthrough_ll.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/contrib/virtiofsd/passthrough_ll.c b/contrib/virtiofsd/passthrough_ll.c
> index f348b0be9d..ff0c446187 100644
> --- a/contrib/virtiofsd/passthrough_ll.c
> +++ b/contrib/virtiofsd/passthrough_ll.c
> @@ -673,7 +673,7 @@ retry:
>  	}
>  	if (stat.st_dev != inode->key.dev || stat.st_ino != inode->key.ino) {
>  		if (!retries)
> -			fuse_warning("lo_parent_and_name: filed to match last\n");
> +			fuse_warning("lo_parent_and_name: failed to match last\n");
>  		goto fail_unref;
>  	}
>  	*parent = p;
> -- 
> 2.21.0
> 
> _______________________________________________
> Virtio-fs mailing list
> Virtio-fs@redhat.com
> https://www.redhat.com/mailman/listinfo/virtio-fs
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


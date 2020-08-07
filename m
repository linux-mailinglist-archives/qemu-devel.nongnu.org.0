Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A4323EB03
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Aug 2020 11:56:30 +0200 (CEST)
Received: from localhost ([::1]:52372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3z6z-000623-NT
	for lists+qemu-devel@lfdr.de; Fri, 07 Aug 2020 05:56:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1k3z5z-0005b3-J6
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 05:55:27 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:33082
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1k3z5x-0005lC-PI
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 05:55:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596794125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w7uOZihK0+4ikz3MuAvWW0x0fCUiJneojLW+2c0dpT4=;
 b=hf5+N0jEI3aT0chEGl2RhzbH5Snl2Cw8QEh7WbsdiONrMjcULEXPrjr+1FZTbcUcnYEz7g
 39pQHpZEaXvAubMiWd9crTOtoBUZt766rr/7UA64NIg4klnY5Hb01oj0DclPyUNd7I5DKq
 bzy1GJ+1PftX3JFOZeOBQeaYZMLAvOs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-2tZGRxxMNVyOrF4ZIZFlpA-1; Fri, 07 Aug 2020 05:55:21 -0400
X-MC-Unique: 2tZGRxxMNVyOrF4ZIZFlpA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F03F8005B0;
 Fri,  7 Aug 2020 09:55:20 +0000 (UTC)
Received: from work-vm (ovpn-114-9.ams2.redhat.com [10.36.114.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DD70B60BE2;
 Fri,  7 Aug 2020 09:55:16 +0000 (UTC)
Date: Fri, 7 Aug 2020 10:55:14 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
Subject: Re: [Virtio-fs] [PATCH] virtiofsd: Cleanup norace option description
Message-ID: <20200807095514.GD2779@work-vm>
References: <20200806111129.22055-1-misono.tomohiro@jp.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20200806111129.22055-1-misono.tomohiro@jp.fujitsu.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/07 04:00:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Misono Tomohiro (misono.tomohiro@jp.fujitsu.com) wrote:
> Cleanup norace option as the feature was removed by below commit:
> 
> Fixes: 93bb3d8d4cda("virtiofsd: remove symlink fallbacks")
> Signed-off-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>

Sergio Lopez posted an identical post a few weeks back, but only to
qemu-devel.
I'll merge it into my dev world.

Thanks.

Dave

> ---
>  docs/tools/virtiofsd.rst | 3 ---
>  tools/virtiofsd/helper.c | 2 --
>  2 files changed, 5 deletions(-)
> 
> diff --git a/docs/tools/virtiofsd.rst b/docs/tools/virtiofsd.rst
> index 824e713491..58666a4495 100644
> --- a/docs/tools/virtiofsd.rst
> +++ b/docs/tools/virtiofsd.rst
> @@ -63,9 +63,6 @@ Options
>      Print only log messages matching LEVEL or more severe.  LEVEL is one of
>      ``err``, ``warn``, ``info``, or ``debug``.  The default is ``info``.
>  
> -  * norace -
> -    Disable racy fallback.  The default is false.
> -
>    * posix_lock|no_posix_lock -
>      Enable/disable remote POSIX locks.  The default is ``posix_lock``.
>  
> diff --git a/tools/virtiofsd/helper.c b/tools/virtiofsd/helper.c
> index 2e4cdb4f49..4ded1d588a 100644
> --- a/tools/virtiofsd/helper.c
> +++ b/tools/virtiofsd/helper.c
> @@ -159,8 +159,6 @@ void fuse_cmdline_help(void)
>             "    -o max_idle_threads        the maximum number of idle worker "
>             "threads\n"
>             "                               allowed (default: 10)\n"
> -           "    -o norace                  disable racy fallback\n"
> -           "                               default: false\n"
>             "    -o posix_lock|no_posix_lock\n"
>             "                               enable/disable remote posix lock\n"
>             "                               default: posix_lock\n"
> -- 
> 2.21.3
> 
> _______________________________________________
> Virtio-fs mailing list
> Virtio-fs@redhat.com
> https://www.redhat.com/mailman/listinfo/virtio-fs
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK



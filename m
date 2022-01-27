Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BDC49E93B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 18:43:05 +0100 (CET)
Received: from localhost ([::1]:47966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD8nY-0004oi-G9
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 12:43:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nD7EC-0004aM-Ti
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 11:02:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nD7E9-00029A-QR
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 11:02:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643299344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gfl9o//6J9dFJj3NI6QIDLyjxQrxnunDei8MYA57C78=;
 b=LSeu8dFd4T9Jn8gn6mPsUw0k1+QBwKOTlziX3FHdZhBWCXh+B89DE/9cJJEmsWLfmQEo8Y
 r36o1Umz+y4ArmQYX6eR+G4BIc70HHP34JpULr0zQr+3ThVpSwESSVySEX3IRglGxL/iFP
 tCBaz0tSK/8oqvvEoLrs42/z4ErCj5c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-543-OoEYJupvPH-Y5NMWXVEVeA-1; Thu, 27 Jan 2022 11:02:16 -0500
X-MC-Unique: OoEYJupvPH-Y5NMWXVEVeA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1029D85EE64;
 Thu, 27 Jan 2022 16:02:15 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.252])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2365E72FA8;
 Thu, 27 Jan 2022 16:02:13 +0000 (UTC)
Date: Thu, 27 Jan 2022 17:02:12 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH] qsd: Document fuse's allow-other option
Message-ID: <YfLCBDnTibtJnNU3@redhat.com>
References: <20220124170300.20680-1-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220124170300.20680-1-hreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 24.01.2022 um 18:03 hat Hanna Reitz geschrieben:
> We did not add documentation to the storage daemon's man page for fuse's
> allow-other option when it was introduced, so do that now.
> 
> Fixes: 8fc54f9428b9763f800 ("export/fuse: Add allow-other option")
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  docs/tools/qemu-storage-daemon.rst   | 9 +++++++--
>  storage-daemon/qemu-storage-daemon.c | 2 +-
>  2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/tools/qemu-storage-daemon.rst b/docs/tools/qemu-storage-daemon.rst
> index 9b0eaba6e5..f7a300c84e 100644
> --- a/docs/tools/qemu-storage-daemon.rst
> +++ b/docs/tools/qemu-storage-daemon.rst
> @@ -76,7 +76,7 @@ Standard options:
>  .. option:: --export [type=]nbd,id=<id>,node-name=<node-name>[,name=<export-name>][,writable=on|off][,bitmap=<name>]
>    --export [type=]vhost-user-blk,id=<id>,node-name=<node-name>,addr.type=unix,addr.path=<socket-path>[,writable=on|off][,logical-block-size=<block-size>][,num-queues=<num-queues>]
>    --export [type=]vhost-user-blk,id=<id>,node-name=<node-name>,addr.type=fd,addr.str=<fd>[,writable=on|off][,logical-block-size=<block-size>][,num-queues=<num-queues>]
> -  --export [type=]fuse,id=<id>,node-name=<node-name>,mountpoint=<file>[,growable=on|off][,writable=on|off]
> +  --export [type=]fuse,id=<id>,node-name=<node-name>,mountpoint=<file>[,growable=on|off][,writable=on|off][,allow-other=on|off|auto]
>  
>    is a block export definition. ``node-name`` is the block node that should be
>    exported. ``writable`` determines whether or not the export allows write
> @@ -103,7 +103,12 @@ Standard options:
>    mounted). Consequently, applications that have opened the given file before
>    the export became active will continue to see its original content. If
>    ``growable`` is set, writes after the end of the exported file will grow the
> -  block node to fit.
> +  block node to fit.  The ``allow-other`` option controls whether users other
> +  than the QSD user will be allowed to access the export.  Note that enabling
> +  this option as a non-root user requires enabling the user_allow_other option
> +  in the global fuse.conf configuration file.  Setting ``allow-other`` to auto
> +  (the default) will have the QSD try enabling this option, and on error fall
> +  back to disabling it.

"QSD" is not an acronym that is used (or introduced) elsewhere in this
document.

I suggest replacing "QSD user" with "user running the process" and "will
have the QSD try" with simply "will try".

>  .. option:: --monitor MONITORDEF
>  
> diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
> index 9d76d1114d..a1dcc4aa2e 100644
> --- a/storage-daemon/qemu-storage-daemon.c
> +++ b/storage-daemon/qemu-storage-daemon.c
> @@ -100,7 +100,7 @@ static void help(void)
>  "\n"
>  #ifdef CONFIG_FUSE
>  "  --export [type=]fuse,id=<id>,node-name=<node-name>,mountpoint=<file>\n"
> -"           [,growable=on|off][,writable=on|off]\n"
> +"           [,growable=on|off][,writable=on|off][,allow-other=on|off|auto]\n"
>  "                         export the specified block node over FUSE\n"
>  "\n"
>  #endif /* CONFIG_FUSE */

Looks good otherwise.

Kevin



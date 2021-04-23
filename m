Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3BC3692CA
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 15:11:46 +0200 (CEST)
Received: from localhost ([::1]:41240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZvaz-0006YX-M8
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 09:11:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lZvZR-0005DM-0S
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 09:10:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lZvZO-0004vg-A2
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 09:10:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619183404;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=BaHcCGQB9SSkab6Axrld8OO2Rz9G6EStKjMW2LHgyPc=;
 b=OJnfZxM3ouJ5MmpwfuDIWF1cT4ima8l66azXLaX/bLASKsRuObXIfd1kww18JBG65yvL/7
 zTNFR3twYflB+edsuclVbRvRyoJilHWn8THHpfXvdWKHV4SFK6X+ifBfZ00CB3b50iQq/Q
 kbDq3PRF0EzjUEv1dy5GJCCSNNh1VHQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-aRCgpdV8NIe0RzvzuTXgmQ-1; Fri, 23 Apr 2021 09:09:51 -0400
X-MC-Unique: aRCgpdV8NIe0RzvzuTXgmQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42F79839A43;
 Fri, 23 Apr 2021 13:09:49 +0000 (UTC)
Received: from redhat.com (ovpn-115-186.ams2.redhat.com [10.36.115.186])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D133B5C1C2;
 Fri, 23 Apr 2021 13:09:27 +0000 (UTC)
Date: Fri, 23 Apr 2021 14:09:24 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH] qapi: deprecate drive-backup
Message-ID: <YILHBKxVATOq0+w/@redhat.com>
References: <20210423125900.3640-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210423125900.3640-1-vsementsov@virtuozzo.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: kwolf@redhat.com, pkrempa@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 nshirokovskiy@virtuozzo.com, den@openvz.org, jsnow@redhat.com,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 23, 2021 at 03:59:00PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> Modern way is using blockdev-add + blockdev-backup, which provides a
> lot more control on how target is opened.
> 
> As example of drive-backup problems consider the following:
> 
> User of drive-backup expects that target will be opened in the same
> cache and aio mode as source. Corresponding logic is in
> drive_backup_prepare(), where we take bs->open_flags of source.
> 
> It works rather bad if source was added by blockdev-add. Assume source
> is qcow2 image. On blockdev-add we should specify aio and cache options
> for file child of qcow2 node. What happens next:
> 
> drive_backup_prepare() looks at bs->open_flags of qcow2 source node.
> But there no BDRV_O_NOCAHE neither BDRV_O_NATIVE_AIO: BDRV_O_NOCAHE is
> places in bs->file->bs->open_flags, and BDRV_O_NATIVE_AIO is nowhere,
> as file-posix parse options and simply set s->use_linux_aio.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
> 
> Hi all! I remember, I suggested to deprecate drive-backup some time ago,
> and nobody complain.. But that old patch was inside the series with
> other more questionable deprecations and it did not landed.
> 
> Let's finally deprecate what should be deprecated long ago.
> 
> We now faced a problem in our downstream, described in commit message.
> In downstream I've fixed it by simply enabling O_DIRECT and linux_aio
> unconditionally for drive_backup target. But actually this just shows
> that using drive-backup in blockdev era is a bad idea. So let's motivate
> everyone (including Virtuozzo of course) to move to new interfaces and
> avoid problems with all that outdated option inheritance.
> 
>  docs/system/deprecated.rst | 5 +++++
>  qapi/block-core.json       | 5 ++++-
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index 80cae86252..b6f5766e17 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -186,6 +186,11 @@ Use the more generic commands ``block-export-add`` and ``block-export-del``
>  instead.  As part of this deprecation, where ``nbd-server-add`` used a
>  single ``bitmap``, the new ``block-export-add`` uses a list of ``bitmaps``.
>  
> +``drive-backup`` (since 6.0)

NB, it'll need to be 6.1 by time this patch has a chance to merge

> +''''''''''''''''''''''''''''
> +
> +Use ``blockdev-backup`` in pair with ``blockdev-add`` instead.
> +
>  System accelerators
>  -------------------
>  
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 6d227924d0..8e2c6e1622 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -1642,6 +1642,9 @@
>  # The operation can be stopped before it has completed using the
>  # block-job-cancel command.
>  #
> +# Features:
> +# @deprecated: This command is deprecated. Use @blockdev-backup instead.
> +#
>  # Returns: - nothing on success
>  #          - If @device is not a valid block device, GenericError
>  #
> @@ -1657,7 +1660,7 @@
>  #
>  ##
>  { 'command': 'drive-backup', 'boxed': true,
> -  'data': 'DriveBackup' }
> +  'data': 'DriveBackup', 'features': ['deprecated'] }
>  
>  ##
>  # @blockdev-backup:
> -- 
> 2.29.2
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



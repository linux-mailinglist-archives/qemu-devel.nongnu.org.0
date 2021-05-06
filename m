Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 795EA3751DF
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 12:00:20 +0200 (CEST)
Received: from localhost ([::1]:60074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leanr-0003ar-1M
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 06:00:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1lealw-00020n-Js
 for qemu-devel@nongnu.org; Thu, 06 May 2021 05:58:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1lealr-0000Jj-Kc
 for qemu-devel@nongnu.org; Thu, 06 May 2021 05:58:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620295094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bxUJ8BRmSw1MSvQdleFjHTLCYAfvzYnBs6JJFeqHZwk=;
 b=ZOzA2387+h2jFp7cUBTS98kHMgf3IWu9XVk54COQq2s4nPsDB3AeGqEv0juCkENR3FrrA7
 p2mA7CWRAehMhMW7+oFEcDuUeqRfHfRTohpcxwmSsc0nDYBuGmQFCQxOqL7NLd9ocR4Obh
 nYvTfdjuuioLEOZ09XmPB3dOFbOYAvA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-RpHWZJaFPu2JHDaiowKjtg-1; Thu, 06 May 2021 05:58:12 -0400
X-MC-Unique: RpHWZJaFPu2JHDaiowKjtg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 902721006C84;
 Thu,  6 May 2021 09:58:05 +0000 (UTC)
Received: from paraplu.home (ovpn-115-104.ams2.redhat.com [10.36.115.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C5A2C5B826;
 Thu,  6 May 2021 09:57:57 +0000 (UTC)
Date: Thu, 6 May 2021 11:57:55 +0200
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 3/3] qapi: deprecate drive-backup
Message-ID: <YJO9owtr4N+1Ta7k@paraplu.home>
References: <20210505135803.67896-1-vsementsov@virtuozzo.com>
 <20210505135803.67896-4-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210505135803.67896-4-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Cc: pkrempa@redhat.com, berrange@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jsnow@redhat.com, xiechanglong.d@gmail.com,
 qemu-devel@nongnu.org, armbru@redhat.com, yur@virtuozzo.com,
 nshirokovskiy@virtuozzo.com, wencongyang2@huawei.com, den@openvz.org,
 dim@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 05, 2021 at 04:58:03PM +0300, Vladimir Sementsov-Ogievskiy wrote:
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
> The documentation is updated in a minimal way, so that drive-backup is
> noted only as a deprecated command, and blockdev-backup used in most of
> places.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
> 
> TODO: We also need to deprecate drive-backup transaction action..
> But union members in QAPI doesn't support 'deprecated' feature. I tried
> to dig a bit, but failed :/ Markus, could you please help with it? At
> least by advice?
> 
>  docs/interop/live-block-operations.rst | 47 +++++++++++++++++---------
>  docs/system/deprecated.rst             | 11 ++++++
>  qapi/block-core.json                   |  5 ++-

The core changes itself looks good; I have some minor nit-picks below,
hope that's not annoying. :-)

With those addressed:

    Reviewed-by: Kashyap Chamarthy <kchamart@redhat.com>    

>  3 files changed, 46 insertions(+), 17 deletions(-)
> 
> diff --git a/docs/interop/live-block-operations.rst b/docs/interop/live-block-operations.rst
> index 1073b930dc..f71f79ae2a 100644
> --- a/docs/interop/live-block-operations.rst
> +++ b/docs/interop/live-block-operations.rst
> @@ -116,8 +116,8 @@ QEMU block layer supports.
>  (3) ``drive-mirror`` (and ``blockdev-mirror``): Synchronize a running
>      disk to another image.
>  
> -(4) ``drive-backup`` (and ``blockdev-backup``): Point-in-time (live) copy
> -    of a block device to a destination.
> +(4) ``blockdev-backup`` (and deprecated ``drive-backup``): Point-in-time
> +    (live) copy of a block device to a destination.

nit: s/deprecated ``drive-backup``/the deprecated ``drive-backup``/  

>  
>  .. _`Interacting with a QEMU instance`:
> @@ -553,13 +553,14 @@ Currently, there are four different kinds:
>  
>  (3) ``none`` -- Synchronize only the new writes from this point on.
>  
> -    .. note:: In the case of ``drive-backup`` (or ``blockdev-backup``),
> -              the behavior of ``none`` synchronization mode is different.
> -              Normally, a ``backup`` job consists of two parts: Anything
> -              that is overwritten by the guest is first copied out to
> -              the backup, and in the background the whole image is
> -              copied from start to end. With ``sync=none``, it's only
> -              the first part.
> +    .. note:: In the case of ``blockdev-backup`` (or deprecated
> +              ``drive-backup``), the behavior of ``none``
> +              synchronization mode is different.  Normally, a
> +              ``backup`` job consists of two parts: Anything that is
> +              overwritten by the guest is first copied out to the
> +              backup, and in the background the whole image is copied
> +              from start to end. With ``sync=none``, it's only the
> +              first part.
>  
>  (4) ``incremental`` -- Synchronize content that is described by the
>      dirty bitmap
> @@ -924,19 +925,22 @@ Shutdown the guest, by issuing the ``quit`` QMP command::
>      }
>  
>  
> -Live disk backup --- ``drive-backup`` and ``blockdev-backup``
> --------------------------------------------------------------
> +Live disk backup --- ``blockdev-backup`` and deprecated``drive-backup``
> +-----------------------------------------------------------------------

Here too, missing the article "the": "the deprecated".

> -The ``drive-backup`` (and its newer equivalent ``blockdev-backup``) allows
> +The ``blockdev-backup`` (and deprecated ``drive-backup``) allows
>  you to create a point-in-time snapshot.
>  
> -In this case, the point-in-time is when you *start* the ``drive-backup``
> -(or its newer equivalent ``blockdev-backup``) command.
> +In this case, the point-in-time is when you *start* the
> +``blockdev-backup`` (or deprecated ``drive-backup``) command.
>  
>  
>  QMP invocation for ``drive-backup``
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  
> +Note that ``drive-backup`` command is deprecated since Qemu 6.1 and
> +will be removed in future.

nit: Let's consistently spell QEMU in all caps, please: s/Qemu/QEMU/

>  Yet again, starting afresh with our example disk image chain::
>  
>      [A] <-- [B] <-- [C] <-- [D]
> @@ -961,11 +965,22 @@ will be issued, indicating the live block device job operation has
>  completed, and no further action is required.
>  
>  
> +Moving from deprecated ``drive-backup`` to newer ``blockdev-backup``
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

s/from/from the/

> +``blockdev-backup`` differs in a way of specifying backup target.

I might slightly rephrase it this way:

    ``blockdev-backup`` differs from ``drive-backup`` in how you specify
    the backup target.

> +With ``blockdev-backup`` you can't specify filename as a target.
> +Instead you use node-name of existing block node, which you may add

Can use literals also for node-name: s/node-name/``node-name``

> +by ``blockdev-add`` or ``blockdev-create`` commands. Correspondingly,
> +``blockdev-backup`` doesn't have ``mode`` and  ``format`` arguments
> +which don't apply to existing block node. See following sections for

s/to/to an/

> +details and examples.
> +
> +
>  Notes on ``blockdev-backup``
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  
> -The ``blockdev-backup`` command is equivalent in functionality to
> -``drive-backup``, except that it operates at node-level in a Block Driver
> +The ``blockdev-backup`` operates at node-level in a Block Driver
>  State (BDS) graph.

s/``blockdev-backup``/``blockdev-backup`` command/

>  E.g. the sequence of actions to create a point-in-time backup
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index 80cae86252..676d72a1ed 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -186,6 +186,17 @@ Use the more generic commands ``block-export-add`` and ``block-export-del``
>  instead.  As part of this deprecation, where ``nbd-server-add`` used a
>  single ``bitmap``, the new ``block-export-add`` uses a list of ``bitmaps``.
>  
> +``drive-backup`` (since 6.1)
> +''''''''''''''''''''''''''''
> +
> +Use ``blockdev-backup`` in pair with ``blockdev-add`` instead.

nit: s/in pair/in combination/

> +This change primarily separates the creation/opening process of the backup
> +target with explicit, separate steps. ``blockdev-backup`` uses mostly the
> +same arguments as ``drive-backup``, except the ``format`` and ``mode``
> +options are removed in favor of using explicit ``blockdev-create`` and
> +``blockdev-add`` calls. See :doc:`/interop/live-block-operations` for
> +details.

The rest reads good to me.  Thanks for fixing this.  

[...] 

-- 
/kashyap



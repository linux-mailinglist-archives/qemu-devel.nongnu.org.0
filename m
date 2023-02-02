Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDD36878A1
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 10:19:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNVjC-0005Mw-73; Thu, 02 Feb 2023 04:17:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pNViw-0005KD-Q3
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 04:17:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pNViu-0004EG-Ng
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 04:17:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675329460;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=wPGOJ+V0BdxyGLt3CI7w4MFc4T7fXqU3llOo0MnH4S4=;
 b=cGjGtjCY1uHUxJuBx8OqNjbI5k/tZQE8yfsjHg3uKqxDvfgxGdO9KTpxHFp/l4AKoRtIDR
 /9U8FfXbdsLBcDr8YkmlmUisF9c85/iObtCRw8+BYCDApNgS+1GmdUl7PboOq3aWlbgWTC
 zBFNL6iLOTtvRMRC0/4XZHjxELuJLS0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-ngG7xxZiMBeznrrAmhgaMQ-1; Thu, 02 Feb 2023 04:17:37 -0500
X-MC-Unique: ngG7xxZiMBeznrrAmhgaMQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AAAC13C18345;
 Thu,  2 Feb 2023 09:17:36 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B25A9404CD81;
 Thu,  2 Feb 2023 09:17:35 +0000 (UTC)
Date: Thu, 2 Feb 2023 09:17:33 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, mjt@tls.msk.ru
Subject: Re: [PATCH 3/5] docs: flesh out raw format driver description
Message-ID: <Y9t/rY71zs76a/Hh@redhat.com>
References: <20230201211234.301918-1-stefanha@redhat.com>
 <20230201211234.301918-4-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230201211234.301918-4-stefanha@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Feb 01, 2023 at 04:12:32PM -0500, Stefan Hajnoczi wrote:
> Modernize the description and document the size=/offset= runtime
> options.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  docs/system/qemu-block-drivers.rst.inc | 32 ++++++++++++++++++++++----
>  1 file changed, 27 insertions(+), 5 deletions(-)
> 
> diff --git a/docs/system/qemu-block-drivers.rst.inc b/docs/system/qemu-block-drivers.rst.inc
> index be6eec1eb6..ec9ebb2066 100644
> --- a/docs/system/qemu-block-drivers.rst.inc
> +++ b/docs/system/qemu-block-drivers.rst.inc
> @@ -16,11 +16,11 @@ options that are supported for it.
>  .. option:: raw
>  
>    Raw disk image format. This format has the advantage of
> -  being simple and easily exportable to all other emulators. If your
> -  file system supports *holes* (for example in ext2 or ext3 on
> -  Linux or NTFS on Windows), then only the written sectors will reserve
> -  space. Use ``qemu-img info`` to know the real size used by the
> -  image or ``ls -ls`` on Unix/Linux.
> +  being simple and easily exportable to all other emulators. Modern
> +  file systems support *holes* (for example in btrfs/XFS/ext4 on
> +  Linux or NTFS on Windows) where space is allocated on demand as sectors are
> +  written. Use ``qemu-img info`` to know the real size used by the image or
> +  ``ls -ls`` on Unix/Linux.
>  
>    Supported create options:
>  
> @@ -33,6 +33,28 @@ options that are supported for it.
>      for image by writing data to underlying storage. This data may or
>      may not be zero, depending on the storage location.
>  
> +  Supported runtime options:
> +
> +  .. program:: raw
> +  .. option:: offset
> +
> +    The byte position in the underlying file where the virtual disk starts.
> +    This is handy when you want to present just a single partition from a
> +    physical disk as the virtual disk. This option is usually used in
> +    conjunction with the ``size`` option.
> +
> +  .. option:: size
> +
> +    Limit the virtual disk size to the given number of bytes, regardless of how
> +    large the underlying file is. This option is usually used in conjunction
> +    with the ``offset`` option.
> +
> +  Note the raw format can be omitted when no runtime options are being used. In
> +  that case the raw format does nothing besides forwarding I/O requests to the
> +  protocol blockdev. You can improve performance slightly by eliminating
> +  ``--blockdev raw,file=file0,node-name=drive0`` and renaming the "file0"
> +  blockdev to "drive0".

This paragraphs reads a bit softly. I would word this such that we
explicitly and strongly recommend against using the 'raw' format
driver. Almost no one will have a need for this.

All the protocol drivers expose a raw format, which can be consumed
directly. So the 'raw' format driver should NEVER be used unless the
user needs to apply a limited window over the underlying disk capacity,
which is pretty rare.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



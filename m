Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE874B093E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 10:14:08 +0100 (CET)
Received: from localhost ([::1]:36862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI5Wh-0008Hh-JL
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 04:14:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nI5HA-0003dK-Pp
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 03:58:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nI5H7-0007wK-Ku
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 03:58:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644483480;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Dq+bmNDNmVXm/OBCOnxJl0AOM9gl94prQIt1dG/SnJ8=;
 b=ZmImilnnTp/9tDXNu9RdWFemyN8D8PO2U5WYO+gCkAKI0RjuWjULVil4yTzQ3Xst/Z5vCR
 FMZHLladyOlHJuS9i0czsZltuM1/e21aO9NgrI8UvBo4UhihCnRU2q0VOZ3rI9HK3rtaX6
 yhPHacuH9yMDn42VG5AgNIOGAlw3Vq0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-rE2TN-X0PXO6C_3F8maYAQ-1; Thu, 10 Feb 2022 03:57:59 -0500
X-MC-Unique: rE2TN-X0PXO6C_3F8maYAQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A6E01124C41
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 08:57:58 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.239])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E17B27CC1;
 Thu, 10 Feb 2022 08:57:19 +0000 (UTC)
Date: Thu, 10 Feb 2022 08:57:16 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH] Deprecate C virtiofsd
Message-ID: <YgTTbAWj1CGlmv/R@redhat.com>
References: <20220209165040.56062-1-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220209165040.56062-1-dgilbert@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: virtio-fs@redhat.com, slp@redhat.com, qemu-devel@nongnu.org,
 stefanha@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 09, 2022 at 04:50:40PM +0000, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> There's a nice new Rust implementation out there; recommend people
> do new work on that.
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  docs/about/deprecated.rst | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 47a594a3b6..3a0e15f8f5 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -454,3 +454,17 @@ nanoMIPS ISA
>  
>  The ``nanoMIPS`` ISA has never been upstreamed to any compiler toolchain.
>  As it is hard to generate binaries for it, declare it deprecated.
> +
> +Tools
> +-----
> +
> +virtiofsd
> +'''''''''
> +
> +There is a new Rust implementation of ``virtiofs`` at
> +``https://gitlab.com/virtio-fs/virtiofsd``;
> +since this is now marked stable, new development should be done on that
> +rather than the existing C version in the QEMU tree.
> +The C version will still accept fixes and patches that
> +are already in development for the moment.

Just to be clear, 'deprecation' is usually expected to turn into
'deletion' a minimum of 2 releases later.  We are targetting the
C virtiofsd to be deleted, right ?  The last sentance here gives
vibes that we're expecting it to stick around despite deprecation.

Assuming we're deleting it after deprecation, then I think thue
message should be more direct in telling people they shold be
proactively switching to deployment of the rust version. Something
along lines of

  "The C implementation is in maintenance mode only and will
   be deleted once the deprecation period is complete. New
   deployments of virtiofs are strongly recommended to switch
   to use of the Rust implementation of virtiofsd, which is
   a drop in replacement will compatible command line and
   featureset."

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



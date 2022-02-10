Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2844B1736
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 21:47:14 +0100 (CET)
Received: from localhost ([::1]:48554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIGLR-0000QJ-AF
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 15:47:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1nIGIa-0007ue-SO
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 15:44:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1nIGIX-0007tM-42
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 15:44:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644525851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1NebaQJGnMdiEbCsFi9N9t54DNBDadNplG9DLXMtqGY=;
 b=ajwIoV4VcePO/GjwT/Dya7SZo3iX5A3gMzdp5KWe7TZS0sheC+GPiqfJZLP5WJA0yYJiXk
 N2rCQNVCj4nNUYO8yXWISMXt1eu7QgW05iWFbZtln8R0qV79P5/DAYcUW8ioW2MyFUvI2Y
 6kAQJj36VN8K+Zt+d5ORU6yHb0vMAJQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-22-_FQNX303PEmSJ7R4QMifgQ-1; Thu, 10 Feb 2022 15:44:07 -0500
X-MC-Unique: _FQNX303PEmSJ7R4QMifgQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 488001018722
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 20:44:06 +0000 (UTC)
Received: from localhost (unknown [10.39.194.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C261549A7;
 Thu, 10 Feb 2022 20:44:05 +0000 (UTC)
Date: Thu, 10 Feb 2022 20:44:04 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH v2] Deprecate C virtiofsd
Message-ID: <20220210204404.GA22879@redhat.com>
References: <20220210174714.19843-1-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220210174714.19843-1-dgilbert@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=rjones@redhat.com;
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
Cc: berrange@redhat.com, slp@redhat.com, qemu-devel@nongnu.org,
 virtio-fs@redhat.com, stefanha@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 10, 2022 at 05:47:14PM +0000, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> There's a nice new Rust implementation out there; recommend people
> do new work on that.
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  docs/about/deprecated.rst | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 47a594a3b6..3c73d22729 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -454,3 +454,20 @@ nanoMIPS ISA
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
> +There is a new Rust implementation of ``virtiofsd`` at
> +``https://gitlab.com/virtio-fs/virtiofsd``;
> +since this is now marked stable, new development should be done on that
> +rather than the existing C version in the QEMU tree.
> +The C version will still accept fixes and patches that
> +are already in development for the moment, but will eventually
> +be deleted from this tree.
> +New deployments should use the Rust version, and existing systems
> +should consider moving to it.  The command line and feature set
> +is very close and moving should be simple.

I'm not qualified to say if the Rust impl is complete enough
to replace the C version, so I won't add a reviewed tag.

However I want to say that from the point of view of downstream
packagers of qemu -- especially Fedora -- it would be helpful if we
could direct both upstream development effort and downstream packaging
into just the one virtiofsd.  So I agree in principle with this.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-p2v converts physical machines to virtual machines.  Boot with a
live CD or over the network (PXE) and turn machines into KVM guests.
http://libguestfs.org/virt-v2v



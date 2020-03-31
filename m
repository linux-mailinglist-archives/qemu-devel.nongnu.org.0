Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D69901999A7
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Mar 2020 17:29:39 +0200 (CEST)
Received: from localhost ([::1]:40278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJIpe-0002hu-TZ
	for lists+qemu-devel@lfdr.de; Tue, 31 Mar 2020 11:29:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33716)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1jJInj-00019k-5a
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 11:27:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1jJInh-0002Su-Sc
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 11:27:38 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:34699
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1jJInh-0002Rp-Nm
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 11:27:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585668456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9D/c8GHg9viWvyS0tMv+GG72HJUtRNMXWKed9ppsTyI=;
 b=Ns63TWqdbEPyic7hr2KaY/rG+Jr2Ax0jOCWTegn5TD/m2WXbn935aqnrane005q9JiIZPr
 j5voIo0D0wZ0tCmOGnCGXBEQll+ijtrIeXpY0bf6Y3JAv/jKblq2DIfzOU59PHV1vc2CW/
 8AV5/3Efw5vsvM/5BRS6/yal906hTdY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-R8qqXvq9OmeiZgb2ANwYew-1; Tue, 31 Mar 2020 11:27:32 -0400
X-MC-Unique: R8qqXvq9OmeiZgb2ANwYew-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 388928010FC;
 Tue, 31 Mar 2020 15:27:31 +0000 (UTC)
Received: from gondolin (ovpn-112-229.ams2.redhat.com [10.36.112.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3EFFA25273;
 Tue, 31 Mar 2020 15:27:29 +0000 (UTC)
Date: Tue, 31 Mar 2020 17:27:27 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH] qemu-options.hx: 9p: clarify -virtfs vs. -fsdev
Message-ID: <20200331172727.6e844deb.cohuck@redhat.com>
In-Reply-To: <208f1fceffce2feaf7c900b29e326b967dce7762.1585661532.git.qemu_oss@crudebyte.com>
References: <208f1fceffce2feaf7c900b29e326b967dce7762.1585661532.git.qemu_oss@crudebyte.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 31 Mar 2020 15:23:38 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> The docs are ambiguous about the difference (or actually their
> equality) between options '-virtfs' vs. '-fsdev'. So clarify that
> '-virtfs' is actually just a convenience shortcut for its
> generalized form '-fsdev' in conjunction with '-device virtio-9p-pci'.
> 
> And as we're at it, also be a bit more descriptive what 9pfs is
> actually used for.
> 
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  qemu-options.hx | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 962a5ebaa6..fd3830c6cd 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1542,9 +1542,17 @@ SRST
>  ``-virtfs proxy,sock_fd=sock_fd,mount_tag=mount_tag [,writeout=writeout][,readonly]``
>    \
>  ``-virtfs synth,mount_tag=mount_tag``
> -    Define a new filesystem device and expose it to the guest using a
> -    virtio-9p-device. The general form of a Virtual File system
> -    pass-through options are:
> +    Define a new virtual filesystem device and expose it to the guest using
> +    a virtio-9p-device (a.k.a. 9pfs), which essentially means that a certain
> +    directory on host is made directly accessible by guest as a pass-through
> +    file system by using the 9P network protocol for communication between
> +    host and guests, if desired even accessible, shared by several guests
> +    simultaniously.
> +
> +    Note that ``-virtfs`` is actually just a convenience shortcut for its
> +    generalized form ``-fsdev -device virtio-9p-pci``.

Huh. This prompted me to try this on s390, and it actually creates a
virtio-9p-pci device there as well, not a virtio-9p-ccw device. A bit
surprising; but I don't see 9p used much (if at all) on s390 anyway.

> +
> +    The general form of pass-through file system options are:
>  
>      ``local``
>          Accesses to the filesystem are done by QEMU.

Good to see this spelled out:

Acked-by: Cornelia Huck <cohuck@redhat.com>



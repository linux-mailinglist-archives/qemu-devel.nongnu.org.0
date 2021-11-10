Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F20D44C9AE
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 20:52:07 +0100 (CET)
Received: from localhost ([::1]:43956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mktde-0003OK-N9
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 14:52:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mktbb-0002cc-QM
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 14:49:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mktbY-0000Mr-Lm
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 14:49:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636573793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RPJI7/tE0aThrTF9xga+vQtoXPHKam58uByHjccbN4Q=;
 b=ezMb+X0A38vLeCuAEbPTRjdIdw5+3VMoNBv5ny9+LH0IRnB3uf9ldft71XtvMFZsTxG+J2
 nUTG9ED7PCrdJ2XPA20aOY+n34CtNDZSmE4n2McwSSdmv4CY/0VQ/Oh+QhFslRXcoDSGTK
 grv3TOpUT28EiPcut5lw2TTRoaDHYwQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-EPwBxxicMpOK4_2uID9t3A-1; Wed, 10 Nov 2021 14:49:50 -0500
X-MC-Unique: EPwBxxicMpOK4_2uID9t3A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 214BC1023F4E;
 Wed, 10 Nov 2021 19:49:49 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.10.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E9015D6D7;
 Wed, 10 Nov 2021 19:48:41 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id B07AB223DF5; Wed, 10 Nov 2021 14:48:40 -0500 (EST)
Date: Wed, 10 Nov 2021 14:48:40 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [for-6.1 v3 0/3] virtiofsd: Add support for FUSE_SYNCFS request
Message-ID: <YYwiGN7pfdyH9543@redhat.com>
References: <20210510155539.998747-1-groug@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210510155539.998747-1-groug@kaod.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 virtio-fs@redhat.com, Miklos Szeredi <miklos@szeredi.hu>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Greg,

I don't see FUSE_SYNCFS support in virtiofsd. I see that kernel 
patches got merged. Did you post another version of patches?

Will be nice to add syncfs support in virtiofsd/virtiofsd_rs as well. 

Thanks
Vivek

On Mon, May 10, 2021 at 05:55:36PM +0200, Greg Kurz wrote:
> FUSE_SYNCFS allows the client to flush the host page cache.
> This isn't available in upstream linux yet, but the following
> tree can be used to test:
> 
> https://gitlab.com/gkurz/linux/-/tree/virtio-fs-sync
> 
> v3: - track submounts and do per-submount syncfs() (Vivek)
>     - based on new version of FUSE_SYNCFS (still not upstream)
>       https://listman.redhat.com/archives/virtio-fs/2021-May/msg00025.html
> 
> v2: - based on new version of FUSE_SYNCFS
>       https://listman.redhat.com/archives/virtio-fs/2021-April/msg00166.html
>     - propagate syncfs() errors to client (Vivek)
> 
> Greg Kurz (3):
>   Update linux headers to 5.13-rc1 + FUSE_SYNCFS
>   virtiofsd: Track mounts
>   virtiofsd: Add support for FUSE_SYNCFS request
> 
>  .../infiniband/hw/vmw_pvrdma/pvrdma_verbs.h   |  35 -
>  include/standard-headers/drm/drm_fourcc.h     |  23 +-
>  include/standard-headers/linux/ethtool.h      | 109 ++-
>  include/standard-headers/linux/fuse.h         |  27 +-
>  include/standard-headers/linux/input.h        |   2 +-
>  include/standard-headers/linux/virtio_ids.h   |   2 +
>  .../standard-headers/rdma/vmw_pvrdma-abi.h    |   7 +
>  linux-headers/asm-generic/unistd.h            |  13 +-
>  linux-headers/asm-mips/unistd_n32.h           | 752 +++++++--------
>  linux-headers/asm-mips/unistd_n64.h           | 704 +++++++-------
>  linux-headers/asm-mips/unistd_o32.h           | 844 ++++++++---------
>  linux-headers/asm-powerpc/kvm.h               |   2 +
>  linux-headers/asm-powerpc/unistd_32.h         | 857 +++++++++---------
>  linux-headers/asm-powerpc/unistd_64.h         | 801 ++++++++--------
>  linux-headers/asm-s390/unistd_32.h            |   5 +
>  linux-headers/asm-s390/unistd_64.h            |   5 +
>  linux-headers/asm-x86/kvm.h                   |   1 +
>  linux-headers/asm-x86/unistd_32.h             |   5 +
>  linux-headers/asm-x86/unistd_64.h             |   5 +
>  linux-headers/asm-x86/unistd_x32.h            |   5 +
>  linux-headers/linux/kvm.h                     | 134 +++
>  linux-headers/linux/userfaultfd.h             |  36 +-
>  linux-headers/linux/vfio.h                    |  35 +
>  tools/virtiofsd/fuse_lowlevel.c               |  11 +
>  tools/virtiofsd/fuse_lowlevel.h               |  12 +
>  tools/virtiofsd/passthrough_ll.c              |  80 +-
>  tools/virtiofsd/passthrough_seccomp.c         |   1 +
>  27 files changed, 2465 insertions(+), 2048 deletions(-)
> 
> -- 
> 2.26.3
> 
> 



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7485A5FE1B
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Jul 2019 23:25:48 +0200 (CEST)
Received: from localhost ([::1]:48886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hj9Eh-0005rX-33
	for lists+qemu-devel@lfdr.de; Thu, 04 Jul 2019 17:25:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55552)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mst@redhat.com>) id 1hj9Dn-0005Nk-7T
 for qemu-devel@nongnu.org; Thu, 04 Jul 2019 17:24:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1hj9Dm-0008RF-6U
 for qemu-devel@nongnu.org; Thu, 04 Jul 2019 17:24:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34290)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1hj9Dl-0008PF-VI
 for qemu-devel@nongnu.org; Thu, 04 Jul 2019 17:24:50 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9FBE03082131;
 Thu,  4 Jul 2019 21:24:46 +0000 (UTC)
Received: from redhat.com (ovpn-120-165.rdu2.redhat.com [10.10.120.165])
 by smtp.corp.redhat.com (Postfix) with SMTP id 7ECDA1001B14;
 Thu,  4 Jul 2019 21:24:44 +0000 (UTC)
Date: Thu, 4 Jul 2019 17:24:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Pankaj Gupta <pagupta@redhat.com>
Message-ID: <20190704172335-mutt-send-email-mst@kernel.org>
References: <20190702150606.24851-1-mst@redhat.com>
 <CAFEAcA8ZAHK4bMMUqNU++9h3AN3arOLMcZgUStd5OP_JCEzObQ@mail.gmail.com>
 <487366787.39086160.1562238222683.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <487366787.39086160.1562238222683.JavaMail.zimbra@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Thu, 04 Jul 2019 21:24:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PULL 00/22] virtio, pc, pci: features, fixes,
 cleanups
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 04, 2019 at 07:03:42AM -0400, Pankaj Gupta wrote:
> 
> > >
> > > The following changes since commit
> > > 7fec76a02267598a4e437ddfdaeaeb6de09b92f3:
> > >
> > >   Merge remote-tracking branch
> > >   'remotes/maxreitz/tags/pull-block-2019-06-24' into staging (2019-07-01
> > >   11:28:28 +0100)
> > >
> > > are available in the Git repository at:
> > >
> > >   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> > >
> > > for you to fetch changes up to a360cd11de5ae59db55e128fd209290c777eb177:
> > >
> > >   docs: avoid vhost-user-net specifics in multiqueue section (2019-07-01
> > >   10:39:35 -0400)
> > >
> > > ----------------------------------------------------------------
> > > virtio, pc, pci: features, fixes, cleanups
> > >
> > > virtio-pmem support.
> > > libvhost user mq support.
> > > A bunch of fixes all over the place.
> > >
> > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > >
> > 
> > This fails to build on all the non-Linux platforms:
> > 
> > In file included from
> > /Users/pm215/src/qemu-for-merges/hw/virtio/virtio-pmem.c:21:
> > /Users/pm215/src/qemu-for-merges/include/standard-headers/linux/virtio_pmem.h:13:10:
> > fatal error: 'linux/types.h' file not found
> > #include <linux/types.h>
> >          ^~~~~~~~~~~~~~~
> 
> Sorry for this.
> Can we please apply below patch on top. I only tested this in linux
> but I think this will solve the issue. Let me know if you want to resend
> entire series.
> 
> Thank you,
> Pankaj
> 
> ===================
> 
> From: Pankaj Gupta <pagupta@redhat.com>
> Date: Thu, 4 Jul 2019 16:27:08 +0530
> Subject: [PATCH] Sync header and fix non linux build issue
> 
> Signed-off-by: Pankaj Gupta <pagupta@redhat.com>
> ---
>  include/standard-headers/linux/virtio_pmem.h | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/include/standard-headers/linux/virtio_pmem.h b/include/standard-headers/linux/virtio_pmem.h
> index 7a3e2fe524..a60236f63d 100644
> --- a/include/standard-headers/linux/virtio_pmem.h
> +++ b/include/standard-headers/linux/virtio_pmem.h
> @@ -10,14 +10,13 @@
>  #ifndef _UAPI_LINUX_VIRTIO_PMEM_H
>  #define _UAPI_LINUX_VIRTIO_PMEM_H
> 
> -#include <linux/types.h>
> -#include <linux/virtio_types.h>
> -#include <linux/virtio_ids.h>
> -#include <linux/virtio_config.h>
> +#include "standard-headers/linux/virtio_types.h"
> +#include "standard-headers/linux/virtio_ids.h"
> +#include "standard-headers/linux/virtio_config.h"
> 
>  struct virtio_pmem_config {
> -       __le64 start;
> -       __le64 size;
> +       uint64_t start;
> +       uint64_t size;
>  };
> 
>  #define VIRTIO_PMEM_REQ_TYPE_FLUSH      0

You need to get rid of __virtio things too.
I fixed up, hopefully well.
If that's not enough then I will drop pmem for now.

-- 
MST


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0225C5F6FC
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Jul 2019 13:05:41 +0200 (CEST)
Received: from localhost ([::1]:44560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hizYZ-0006tv-5g
	for lists+qemu-devel@lfdr.de; Thu, 04 Jul 2019 07:05:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53658)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pagupta@redhat.com>) id 1hizX4-00067U-UA
 for qemu-devel@nongnu.org; Thu, 04 Jul 2019 07:04:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pagupta@redhat.com>) id 1hizX3-0004Wa-SG
 for qemu-devel@nongnu.org; Thu, 04 Jul 2019 07:04:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57354)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pagupta@redhat.com>) id 1hizX3-0004Qz-H6
 for qemu-devel@nongnu.org; Thu, 04 Jul 2019 07:04:05 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 40BE23082B45;
 Thu,  4 Jul 2019 11:03:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3731A17C3F;
 Thu,  4 Jul 2019 11:03:43 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
 (zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 118EF206D1;
 Thu,  4 Jul 2019 11:03:43 +0000 (UTC)
Date: Thu, 4 Jul 2019 07:03:42 -0400 (EDT)
From: Pankaj Gupta <pagupta@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <487366787.39086160.1562238222683.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAFEAcA8ZAHK4bMMUqNU++9h3AN3arOLMcZgUStd5OP_JCEzObQ@mail.gmail.com>
References: <20190702150606.24851-1-mst@redhat.com>
 <CAFEAcA8ZAHK4bMMUqNU++9h3AN3arOLMcZgUStd5OP_JCEzObQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.116.92, 10.4.195.30]
Thread-Topic: virtio, pc, pci: features, fixes, cleanups
Thread-Index: nIVpKDPNUv/cmuOrDfADVBvtCMiBEQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Thu, 04 Jul 2019 11:03:48 +0000 (UTC)
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


> >
> > The following changes since commit
> > 7fec76a02267598a4e437ddfdaeaeb6de09b92f3:
> >
> >   Merge remote-tracking branch
> >   'remotes/maxreitz/tags/pull-block-2019-06-24' into staging (2019-07-01
> >   11:28:28 +0100)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> >
> > for you to fetch changes up to a360cd11de5ae59db55e128fd209290c777eb177:
> >
> >   docs: avoid vhost-user-net specifics in multiqueue section (2019-07-01
> >   10:39:35 -0400)
> >
> > ----------------------------------------------------------------
> > virtio, pc, pci: features, fixes, cleanups
> >
> > virtio-pmem support.
> > libvhost user mq support.
> > A bunch of fixes all over the place.
> >
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> >
> 
> This fails to build on all the non-Linux platforms:
> 
> In file included from
> /Users/pm215/src/qemu-for-merges/hw/virtio/virtio-pmem.c:21:
> /Users/pm215/src/qemu-for-merges/include/standard-headers/linux/virtio_pmem.h:13:10:
> fatal error: 'linux/types.h' file not found
> #include <linux/types.h>
>          ^~~~~~~~~~~~~~~

Sorry for this.
Can we please apply below patch on top. I only tested this in linux
but I think this will solve the issue. Let me know if you want to resend
entire series.

Thank you,
Pankaj

===================

From: Pankaj Gupta <pagupta@redhat.com>
Date: Thu, 4 Jul 2019 16:27:08 +0530
Subject: [PATCH] Sync header and fix non linux build issue

Signed-off-by: Pankaj Gupta <pagupta@redhat.com>
---
 include/standard-headers/linux/virtio_pmem.h | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/include/standard-headers/linux/virtio_pmem.h b/include/standard-headers/linux/virtio_pmem.h
index 7a3e2fe524..a60236f63d 100644
--- a/include/standard-headers/linux/virtio_pmem.h
+++ b/include/standard-headers/linux/virtio_pmem.h
@@ -10,14 +10,13 @@
 #ifndef _UAPI_LINUX_VIRTIO_PMEM_H
 #define _UAPI_LINUX_VIRTIO_PMEM_H

-#include <linux/types.h>
-#include <linux/virtio_types.h>
-#include <linux/virtio_ids.h>
-#include <linux/virtio_config.h>
+#include "standard-headers/linux/virtio_types.h"
+#include "standard-headers/linux/virtio_ids.h"
+#include "standard-headers/linux/virtio_config.h"

 struct virtio_pmem_config {
-       __le64 start;
-       __le64 size;
+       uint64_t start;
+       uint64_t size;
 };

 #define VIRTIO_PMEM_REQ_TYPE_FLUSH      0



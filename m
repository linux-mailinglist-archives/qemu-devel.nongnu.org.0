Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F1C636117
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 15:07:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxqNc-0006Mu-9R; Wed, 23 Nov 2022 09:05:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oxqNa-0006Ih-1K
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 09:05:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oxqNW-0001X4-Ja
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 09:05:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669212329;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=a9szNaafjikvb2w9qZOuNXYq3FFkNnbtPNISpE3kYfU=;
 b=QgSbdVFfeo3Cp0V80JUWl3vdp8O+tG7yLhpmLjX/xpEn8l2dNtuVGW5Ci7sq9pGMq0U1Sn
 z7b/uGfv25f6umjRC4TkqkgMWI1+EHow4qQ3g+gfKGS30b467lTeBpTP728BRYisoI10Yo
 vAx2F1ojg87FLtaaRxBPjcqoStH6Ih0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-601-S8b4NBn-N_qNcD_esv_wJA-1; Wed, 23 Nov 2022 09:05:25 -0500
X-MC-Unique: S8b4NBn-N_qNcD_esv_wJA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99D5285A59D;
 Wed, 23 Nov 2022 14:05:24 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 726F84EA4A;
 Wed, 23 Nov 2022 14:05:23 +0000 (UTC)
Date: Wed, 23 Nov 2022 14:05:19 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v2] Drop more useless casts from void * to pointer
Message-ID: <Y34on7NQk44e07cM@redhat.com>
References: <20221123133811.1398562-1-armbru@redhat.com>
 <alpine.LMD.2.03.2211231441480.26886@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.LMD.2.03.2211231441480.26886@eik.bme.hu>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Nov 23, 2022 at 02:51:49PM +0100, BALATON Zoltan wrote:
> On Wed, 23 Nov 2022, Markus Armbruster wrote:
> > Signed-off-by: Markus Armbruster <armbru@redhat.com>
> > Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> > ---
> > v2:
> > * PATCH 1+2 merged as commit 0a553c12c7 and 3f7febc937
> > * PATCH 3 change to util/coroutine-ucontext.c dropped [Laurent]
> > 
> > bsd-user/elfload.c                      | 2 +-
> > contrib/plugins/cache.c                 | 8 ++++----
> > contrib/vhost-user-blk/vhost-user-blk.c | 2 +-
> > hw/core/qdev-clock.c                    | 2 +-
> > hw/hyperv/vmbus.c                       | 2 +-
> > hw/net/cadence_gem.c                    | 2 +-
> > hw/net/virtio-net.c                     | 2 +-
> > hw/nvme/ctrl.c                          | 4 ++--
> > hw/rdma/vmw/pvrdma_cmd.c                | 9 +++------
> > hw/rdma/vmw/pvrdma_qp_ops.c             | 6 +++---
> > hw/virtio/virtio-iommu.c                | 3 +--
> > linux-user/syscall.c                    | 2 +-
> > target/i386/hax/hax-all.c               | 2 +-
> > tests/tcg/aarch64/system/semiheap.c     | 4 ++--
> > util/vfio-helpers.c                     | 2 +-
> > 15 files changed, 24 insertions(+), 28 deletions(-)
> > 
> > diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
> > index f8edb22f2a..fbcdc94b96 100644
> > --- a/bsd-user/elfload.c
> > +++ b/bsd-user/elfload.c
> > @@ -156,7 +156,7 @@ static abi_ulong copy_elf_strings(int argc, char **argv, void **page,
> >             --p; --tmp; --len;
> >             if (--offset < 0) {
> >                 offset = p % TARGET_PAGE_SIZE;
> > -                pag = (char *)page[p / TARGET_PAGE_SIZE];
> > +                pag = page[p / TARGET_PAGE_SIZE];
> 
> I think arithmetic on void pointer was undefined at least in the past so
> some compilers may warn for it but not sure if this is still the case for
> the compilers we care about. Apparently not if this now compiles but that
> explains why this cast was not useless. Found some more info on this here:
> 
> https://stackoverflow.com/questions/3523145/pointer-arithmetic-for-void-pointer-in-c

QEMU explicitly only targets GCC + Clang, so portability to other
compilers is not required.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



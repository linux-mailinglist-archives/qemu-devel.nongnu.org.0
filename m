Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB5929CD79
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Oct 2020 03:03:46 +0100 (CET)
Received: from localhost ([::1]:60670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXaoS-0006Bu-Na
	for lists+qemu-devel@lfdr.de; Tue, 27 Oct 2020 22:03:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kXalT-0003d7-Rk
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 22:00:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kXalP-0008BH-GR
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 22:00:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603850432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pRhEUO5Ihz6qP77sB3vxN1DiM0gFDTeZGt2DR5rUP3U=;
 b=bv8B2Kjaef6AOJDYwCDY+VRMgolpYwUBwybQfrVciNksQ+hbVccVcv2QahdTXSq/fDwtPF
 BeXVp+3hVFXaIRbhpK89mvo6yKijFk3EGQ/sg2b+xN0bHTxBEKEFfD4pTqAya+mGYUdkRH
 o74YQ7aKWtoSlWBCkuZqhrnnvifKoEg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-BgTsJ7CaMEiNhCF7snsE0Q-1; Tue, 27 Oct 2020 22:00:29 -0400
X-MC-Unique: BgTsJ7CaMEiNhCF7snsE0Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F33C761240;
 Wed, 28 Oct 2020 02:00:26 +0000 (UTC)
Received: from x1.home (ovpn-112-213.phx2.redhat.com [10.3.112.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 71A9019C4F;
 Wed, 28 Oct 2020 02:00:22 +0000 (UTC)
Date: Tue, 27 Oct 2020 20:00:21 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/32] VFIO updates 2020-10-26 (for QEMU 5.2 soft-freeze)
Message-ID: <20201027200021.00fac851@x1.home>
In-Reply-To: <CAFEAcA8yBrUH-Bqe7oNhBKqtyeUNw0xVA9aKm8DJFE-WLzLTwQ@mail.gmail.com>
References: <160374054442.22414.10832953989449611268.stgit@gimli.home>
 <CAFEAcA8yBrUH-Bqe7oNhBKqtyeUNw0xVA9aKm8DJFE-WLzLTwQ@mail.gmail.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/27 22:00:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Artem Polyakov <artemp@nvidia.com>, Zhengui li <lizhengui@huawei.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Zhi Wang <zhi.wang.linux@gmail.com>,
 Pierre Morel <pmorel@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Max Reitz <mreitz@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Neo Jia <cjia@nvidia.com>, Amey Narkhede <ameynarkhede03@gmail.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 27 Oct 2020 23:42:57 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Mon, 26 Oct 2020 at 19:39, Alex Williamson
> <alex.williamson@redhat.com> wrote:
> > ----------------------------------------------------------------
> > VFIO update 2020-10-26
> >
> >  * Migration support (Kirti Wankhede)
> >  * s390 DMA limiting (Matthew Rosato)
> >  * zPCI hardware info (Matthew Rosato)
> >  * Lock guard (Amey Narkhede)
> >  * Print fixes (Zhengui li)  
> 
> I get a conflict here in
> include/standard-headers/linux/fuse.h:
> 
> ++<<<<<<< HEAD
>  +#define FUSE_ATTR_FLAGS               (1 << 27)
> ++=======
> + #define FUSE_SUBMOUNTS                (1 << 27)
> ++>>>>>>> remotes/awilliam/tags/vfio-update-20201026.0  
> 
> I assume these should not both be trying to use the same value,
> so something has gone wrong somewhere. The conflicting commit
> now in master is Max's 97d741cc96dd08 ("linux/fuse.h: Pull in from Linux").
> 
> Can you sort out the correct resolution between you, please?
> (My guess is that Max's commit is the erroneous one because
> it doesn't look like it was created via a standard update
> from the kernel headers.)

So as near as I can tell, QEMU commit 97d741cc96dd ("linux/fuse.h: Pull
in from Linux") is fantasy land.  The only thing I can find of this
FUSE_ATTR_FLAGS outside Max's QEMU series is this[1] posting where the
fuse maintainer announces that he's replaced FUSE_ATTR_FLAGS with
FUSE_SUBMOUNTS, but the usage is "slightly different".  Reading that
thread, it seems that virtiofsd probably needed an update but I can't
see that it ever happened.

I'm not comfortable trying to update Max's series to try to determine
if FUSE_SUBMOUNTS can be interchanged with FUSE_ATTR_FLAGS, where the
latter appears to be used to express the new field in struct fuse_attr
exists, but the former appears to be a feature.  My guess would be that
maybe FUSE_KERNEL_MINOR_VERSION needs to be tested instead for this new
field??

Anyway, I hate to pull the big hammer, but I think Max's series is
bogus.  The only thing I can propose is to revert it in its entirety,
after which this series applies cleanly.  I'll post a patch to do that
as I think the code currently in master is on pretty shaky ground with
respect to interpreting flag bits differently from those the kernel
defines.  Thanks,

Alex

[1] https://marc.info/?l=fuse-devel&m=160069539811247



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51ABB36ECEF
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 17:03:13 +0200 (CEST)
Received: from localhost ([::1]:56286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc8C8-0007LS-En
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 11:03:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1lc8AJ-0006Nc-VL
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 11:01:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1lc8AC-0007ha-Fy
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 11:01:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619708463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NeFzO8oi1a/ZP3+HXtZWR4VXqHHXQGuUzUtcIpnS4VY=;
 b=WNLOmGQ3v+mmFmoORlSPOvIvQ2ZfUKoK2ZZmSSuyJvS/fgjOTJbLiHhqdaH16QyYhUPnhc
 aH7D+k2qbUB4h0guK776cJbClP3oZvPP6gmhq/Pqh6JxnanRCj2LaCEOEtfZxjXJH72Zmp
 coK5V5ZeSciLS8d4hTYq8vQttI0rerI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-iz_yuyyqMoWGHTd3tGrryg-1; Thu, 29 Apr 2021 11:00:59 -0400
X-MC-Unique: iz_yuyyqMoWGHTd3tGrryg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CDF76D258;
 Thu, 29 Apr 2021 15:00:58 +0000 (UTC)
Received: from localhost (ovpn-114-114.ams2.redhat.com [10.36.114.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41FB719C45;
 Thu, 29 Apr 2021 15:00:39 +0000 (UTC)
Date: Thu, 29 Apr 2021 16:00:38 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [ANNOUNCE] libblkio v0.1.0 preview release
Message-ID: <20210429150038.GT26415@redhat.com>
References: <YIq9PpAd6nP9XTmz@stefanha-x1.localdomain>
 <20210429142259.GR26415@redhat.com>
 <YIrFmZgh5IAeiLdm@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YIrFmZgh5IAeiLdm@stefanha-x1.localdomain>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, pkrempa@redhat.com,
 Alberto Garcia <berto@igalia.com>, slp@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Klaus Jensen <its@irrelevant.dk>, philmd@redhat.com,
 Markus Armbruster <armbru@redhat.com>, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 29, 2021 at 03:41:29PM +0100, Stefan Hajnoczi wrote:
> On Thu, Apr 29, 2021 at 03:22:59PM +0100, Richard W.M. Jones wrote:
> > On Thu, Apr 29, 2021 at 03:05:50PM +0100, Stefan Hajnoczi wrote:
> > > The purpose of this preview release is to discuss both the API design
> > > and general direction of the project. API documentation is available
> > > here:
> > > 
> > >   https://gitlab.com/libblkio/libblkio/-/blob/v0.1.0/docs/blkio.rst
> > 
> > libvirt originally, and now libnbd, keep a per-thread error message
> > (stored in thread-local storage).  It's a lot nicer than having to
> > pass &errmsg to every function.  You can just write:
> > 
> >  if (nbd_connect_tcp (nbd, "remote", "nbd") == -1) {
> >    fprintf (stderr,
> >             "failed to connect to remote server: %s (errno = %d)\n",
> >             nbd_get_error (), nbd_get_errno ());
> >    exit (EXIT_FAILURE);
> >  }
> > 
> > (https://libguestfs.org/libnbd.3.html#ERROR-HANDLING)
> > 
> > It means you can extend the range of error information available in
> > future.  Also you can return a 'const char *' and the application
> > doesn't have to worry about lifetimes, at least in the common case.
> 
> Thanks for sharing the idea, I think it would work well for libblkio
> too.
> 
> Do you ignore the dlclose(3) memory leak?

I believe this mechanism in libnbd ensures there is no leak in the
ordinary shared library (not dlopen/dlclose) case:

https://gitlab.com/nbdkit/libnbd/-/blob/f9257a9fdc68706a4079deb4ced61e1d468f28d6/lib/errors.c#L35

However I'm not sure what happens in the dlopen case, so I'm going to
test that out now ...

> > > Examples are available here:
> > > 
> > >   https://gitlab.com/libblkio/libblkio/-/tree/v0.1.0/examples
> > > 
> > > The goal is to eventually include the following drivers:
> > > - Linux io_uring
> > > - NVMe (VFIO and vfio-user)
> > > - virtio-blk (VFIO, vfio-user, vhost-user-blk, and vhost-vdpa-blk)
> > >
> > > There are a few reasons why libblkio is needed:
> > > 
> > > 1. QEMU, Ceph, GlusterFS, MariaDB, and other programs have been adding
> > >    more low-level block I/O code, most of it duplicated. Usually only
> > >    one or two of Linux AIO, io_uring, userspace drivers, vhost-user
> > >    drivers, etc are implemented. This makes it difficult to benefit from
> > >    the latest advances in high-performance block I/O.
> > > 
> > > 2. Coding to a standard API makes it possible to introduce new
> > >    optimizations or hardware interfaces without costly changes to the
> > >    software stack.
> > > 
> > > 3. A client library is needed so applications can take advantage of
> > >    qemu-storage-daemon's vhost-user-blk exports.
> > > 
> > > 4. Implementing block I/O as a library allows QEMU to use Rust for new
> > >    code without messy QEMU internal API bindings. Note that libblkio
> > >    currently does not provide a Rust crate, it only offers a C API.
> > 
> > This is where I get confused about what this library actually does.
> > It's not just a nicer wrapper around io_uring, but what is it actually
> > doing?
> 
> It's a library for what QEMU calls protocol drivers (POSIX files,
> userspace NVMe driver, etc). In particular, anything offering
> multi-queue block I/O fits into libblkio.
> 
> It is not intended to replace libnbd or other network storage libraries.
> libblkio's properties API is synchronous to keep things simple for
> applications. Attaching to network storage needs to be asynchronous,
> although the libblkio API could be extended if people want to support
> network storage.

I think what confuses me is why is NVMe any different from io_uring?
ie would this work?

$ blkio-info --output=json io_uring path=/dev/nvme0

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-df lists disk usage of guests without needing to install any
software inside the virtual machine.  Supports Linux and Windows.
http://people.redhat.com/~rjones/virt-df/



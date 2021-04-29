Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9164036EC51
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 16:24:26 +0200 (CEST)
Received: from localhost ([::1]:38044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc7aZ-0003mw-QY
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 10:24:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1lc7ZO-0003LC-Pj
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 10:23:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1lc7ZM-0001bS-RP
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 10:23:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619706186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JYF2PEeO+Hh2dc2x4KvhrhPKU8L2A4ZznzUq0lEX+wA=;
 b=WQMCoEzXcuqXToTEa9SK95vWj56PlpJuaso5vrCa1+RZzMwu5k/lYC+BtJ0/1HcDXy7RcL
 4iaVSStITm1CYbVR1d8aV2D8b6Vp9DUyhR6jex2jlwBKerIp2DiuUOee2N1Uw5sEHF2ZoR
 KS9EVh8zaFI2iWm/5LKxYq7Sg8xloSM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-TeoYZkKwMRunmPpVo9k_LQ-1; Thu, 29 Apr 2021 10:23:02 -0400
X-MC-Unique: TeoYZkKwMRunmPpVo9k_LQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 517EEDF8AE;
 Thu, 29 Apr 2021 14:23:01 +0000 (UTC)
Received: from localhost (ovpn-114-114.ams2.redhat.com [10.36.114.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ACAB31001901;
 Thu, 29 Apr 2021 14:23:00 +0000 (UTC)
Date: Thu, 29 Apr 2021 15:22:59 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [ANNOUNCE] libblkio v0.1.0 preview release
Message-ID: <20210429142259.GR26415@redhat.com>
References: <YIq9PpAd6nP9XTmz@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YIq9PpAd6nP9XTmz@stefanha-x1.localdomain>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, pkrempa@redhat.com,
 Alberto Garcia <berto@igalia.com>, slp@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Klaus Jensen <its@irrelevant.dk>, philmd@redhat.com,
 Markus Armbruster <armbru@redhat.com>, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 29, 2021 at 03:05:50PM +0100, Stefan Hajnoczi wrote:
> The purpose of this preview release is to discuss both the API design
> and general direction of the project. API documentation is available
> here:
> 
>   https://gitlab.com/libblkio/libblkio/-/blob/v0.1.0/docs/blkio.rst

libvirt originally, and now libnbd, keep a per-thread error message
(stored in thread-local storage).  It's a lot nicer than having to
pass &errmsg to every function.  You can just write:

 if (nbd_connect_tcp (nbd, "remote", "nbd") == -1) {
   fprintf (stderr,
            "failed to connect to remote server: %s (errno = %d)\n",
            nbd_get_error (), nbd_get_errno ());
   exit (EXIT_FAILURE);
 }

(https://libguestfs.org/libnbd.3.html#ERROR-HANDLING)

It means you can extend the range of error information available in
future.  Also you can return a 'const char *' and the application
doesn't have to worry about lifetimes, at least in the common case.

> Examples are available here:
> 
>   https://gitlab.com/libblkio/libblkio/-/tree/v0.1.0/examples
> 
> The goal is to eventually include the following drivers:
> - Linux io_uring
> - NVMe (VFIO and vfio-user)
> - virtio-blk (VFIO, vfio-user, vhost-user-blk, and vhost-vdpa-blk)
>
> There are a few reasons why libblkio is needed:
> 
> 1. QEMU, Ceph, GlusterFS, MariaDB, and other programs have been adding
>    more low-level block I/O code, most of it duplicated. Usually only
>    one or two of Linux AIO, io_uring, userspace drivers, vhost-user
>    drivers, etc are implemented. This makes it difficult to benefit from
>    the latest advances in high-performance block I/O.
> 
> 2. Coding to a standard API makes it possible to introduce new
>    optimizations or hardware interfaces without costly changes to the
>    software stack.
> 
> 3. A client library is needed so applications can take advantage of
>    qemu-storage-daemon's vhost-user-blk exports.
> 
> 4. Implementing block I/O as a library allows QEMU to use Rust for new
>    code without messy QEMU internal API bindings. Note that libblkio
>    currently does not provide a Rust crate, it only offers a C API.

This is where I get confused about what this library actually does.
It's not just a nicer wrapper around io_uring, but what is it actually
doing?

Rich.

> For QEMU integration the next step is a libblkio BlockDriver. This new
> BlockDriver will provide libblkio functionality to QEMU. Eventually
> libblkio will provide block/file-posix.c, block/nvme.c, and the upcoming
> vhost-vdpa-blk functionality and the QEMU code can be simplified or
> removed.
> 
> libblkio does not contain an event loop implementation or disk image
> format drivers and that functionality will not be part of libblkio.
> 
> How to participate:
> 1. Share your thoughts on the direction and your requirements.
> 2. Review the API docs and give feedback.
> 3. Write a libblkio driver for NVMe VFIO/vfio-user, virtio-blk
>    VFIO/vfio-user, vhost-user-blk. Or just a null driver for
>    benchmarking/testing :).
> 4. Integrate libblkio into Ceph, GlusterFS, MariaDB, etc.
> 
> I am now beginning QEMU and fio integration. Stefano Garzarella is
> looking at adding a vhost-vdpa-blk driver to libblkio.
> 
> Stefan



-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-builder quickly builds VMs from scratch
http://libguestfs.org/virt-builder.1.html



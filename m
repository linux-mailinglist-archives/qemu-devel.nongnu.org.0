Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C150836EC0D
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 16:07:34 +0200 (CEST)
Received: from localhost ([::1]:37676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc7KH-00005v-SS
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 10:07:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lc7Iz-0007SA-Ou
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 10:06:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lc7Iw-0008HT-E7
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 10:06:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619705169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=vxZ3nYBiuffmPvJD1gRu5bXFyyw7D4HwoPrTSYOaONk=;
 b=Yhm3e5mgwW1qC/p7/voiksaWoWtUyKz66oXoWmsDkiKl6BGuhOTpakJ0G34COYydZH9jJB
 7IF5HDjLi23vSp0me3s7zxS9UGGJ8eR11YXKjKySCRlX0oBXuOQUoJYmt8Ta2tZ+PP2g3t
 24rU+qMvgOghobkk5gDYrHCLDNb1szU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-8A1RmUHdPrWsFIkpBNzxKQ-1; Thu, 29 Apr 2021 10:06:05 -0400
X-MC-Unique: 8A1RmUHdPrWsFIkpBNzxKQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8ABE107ACF2;
 Thu, 29 Apr 2021 14:06:03 +0000 (UTC)
Received: from localhost (ovpn-115-28.ams2.redhat.com [10.36.115.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B3B617058F;
 Thu, 29 Apr 2021 14:05:51 +0000 (UTC)
Date: Thu, 29 Apr 2021 15:05:50 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [ANNOUNCE] libblkio v0.1.0 preview release
Message-ID: <YIq9PpAd6nP9XTmz@stefanha-x1.localdomain>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LQ4M5sH9wMzA8tyB"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
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
 rjones@redhat.com, mreitz@redhat.com,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Klaus Jensen <its@irrelevant.dk>, philmd@redhat.com,
 Markus Armbruster <armbru@redhat.com>, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--LQ4M5sH9wMzA8tyB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,
A preview release of libblkio, a library for high-performance block I/O,
is now available:

  https://gitlab.com/libblkio/libblkio/-/tree/v0.1.0

Applications are increasingly integrating high-performance I/O
interfaces such as Linux io_uring, userspace device drivers, and
vhost-user device support. The effort required to add each of these
low-level interfaces into an application is relatively high. libblkio
provides a single API for efficiently accessing block devices and
eliminates the need to write custom code for each one.

The library is not yet ready to use and currently lacks many features.
In fact, I hope this news doesn't spread too far yet because libblkio is
at a very early stage, but feedback from the QEMU community is necessary
at this time.

The purpose of this preview release is to discuss both the API design
and general direction of the project. API documentation is available
here:

  https://gitlab.com/libblkio/libblkio/-/blob/v0.1.0/docs/blkio.rst

Examples are available here:

  https://gitlab.com/libblkio/libblkio/-/tree/v0.1.0/examples

The goal is to eventually include the following drivers:
- Linux io_uring
- NVMe (VFIO and vfio-user)
- virtio-blk (VFIO, vfio-user, vhost-user-blk, and vhost-vdpa-blk)

There are a few reasons why libblkio is needed:

1. QEMU, Ceph, GlusterFS, MariaDB, and other programs have been adding
   more low-level block I/O code, most of it duplicated. Usually only
   one or two of Linux AIO, io_uring, userspace drivers, vhost-user
   drivers, etc are implemented. This makes it difficult to benefit from
   the latest advances in high-performance block I/O.

2. Coding to a standard API makes it possible to introduce new
   optimizations or hardware interfaces without costly changes to the
   software stack.

3. A client library is needed so applications can take advantage of
   qemu-storage-daemon's vhost-user-blk exports.

4. Implementing block I/O as a library allows QEMU to use Rust for new
   code without messy QEMU internal API bindings. Note that libblkio
   currently does not provide a Rust crate, it only offers a C API.

For QEMU integration the next step is a libblkio BlockDriver. This new
BlockDriver will provide libblkio functionality to QEMU. Eventually
libblkio will provide block/file-posix.c, block/nvme.c, and the upcoming
vhost-vdpa-blk functionality and the QEMU code can be simplified or
removed.

libblkio does not contain an event loop implementation or disk image
format drivers and that functionality will not be part of libblkio.

How to participate:
1. Share your thoughts on the direction and your requirements.
2. Review the API docs and give feedback.
3. Write a libblkio driver for NVMe VFIO/vfio-user, virtio-blk
   VFIO/vfio-user, vhost-user-blk. Or just a null driver for
   benchmarking/testing :).
4. Integrate libblkio into Ceph, GlusterFS, MariaDB, etc.

I am now beginning QEMU and fio integration. Stefano Garzarella is
looking at adding a vhost-vdpa-blk driver to libblkio.

Stefan

--LQ4M5sH9wMzA8tyB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCKvT4ACgkQnKSrs4Gr
c8gRvAgAwINL8XvLg4hrn1k5B1oJDqtVjZQUA3hBr6qZDRO+H4QgxmERX1uE/KkJ
bNrhqOzvWmPp0cylWu6akNBmr+4NpCDZvYpBLwbHkxz44l76A4xP0muib9NlKpS4
RNbuHK0XOqNsGqDGUYTEi8df1OsOPAp/pnZ4F/4hOUTd2ZlTA3lrc70+wWTwpWFz
oYvB2c9Qi6bkoqm7RDO3p2TROy+Y+O71Wp2MAAREMwDksUo6EPtXEklUCJU6QnJD
t0TnM04CTN0SwheaDl4WkbEElpDqB3AbNTjbqpvNR+/hwiLtMaLx50HOcF/kIlsP
1WbWst4xwoFRm31tBSD7yUquTDkfKA==
=yFCu
-----END PGP SIGNATURE-----

--LQ4M5sH9wMzA8tyB--



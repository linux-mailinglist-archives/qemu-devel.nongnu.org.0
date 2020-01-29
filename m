Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8BE14CDBB
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jan 2020 16:43:55 +0100 (CET)
Received: from localhost ([::1]:48128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwpVS-00018o-4t
	for lists+qemu-devel@lfdr.de; Wed, 29 Jan 2020 10:43:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51234)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@gmail.com>) id 1iwpUf-0000bt-Jr
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 10:43:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@gmail.com>) id 1iwpUe-0003hC-Ek
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 10:43:05 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:50489)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <stefanha@gmail.com>) id 1iwpUe-0003g8-8G
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 10:43:04 -0500
Received: by mail-wm1-x342.google.com with SMTP id a5so224366wmb.0
 for <qemu-devel@nongnu.org>; Wed, 29 Jan 2020 07:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=w6c+b3KnbrB9ETGvaY1ER6PyV3J739YLIqv9wDVe62Y=;
 b=LztJdMJ/k17BwH4a3Qb5N89hbzO3KAclNwPV25bX9Vp4azLKZdfOnsbvAaT1OmuqgG
 0WV95eivRk4/CZsJIv5zJqQbJTZxDYq0paM4Pn4nzUXT64TMbtwFQL2xCAzCp7roAZrS
 r/cIhsIqXtDW6XeAdt6Z2lJZ/+Utpz9Qq0ftkKa6J6DtRjXSQsLEUG8a1rAJZqrcZmOe
 gmtsZPvyUCfTVLSE1lUz+GdHfKRxKjE7NxmYlJnssjo8phTxUPd2DTp7qN95MZlqFUW3
 WHtdVWtaC1fF5jG9HCpllf+DdYDXqXJUQeIBp6TBDCEEhYWFGTxuNfRDsLXWHC/IOLdO
 bWOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=w6c+b3KnbrB9ETGvaY1ER6PyV3J739YLIqv9wDVe62Y=;
 b=ubvoclHiIQO3epO9HPPh/OdNEY4qX6Cj8tDnhCU/IXaEM18qwpLYDAa1pcIWpL6Pzy
 YusljliutgizUFzESpwOi6xYNkgf7KKhCtX/JbsEI+t/jIN5fF0+4YXCU63nH+s0Jzv3
 zlB3mwHj9Hk93Z3mAlVFr43JmlbaVRoASdfjylrEI3aUkRLdudT15XOhvHVw57emMGiG
 Bhf50it9GE3iTPix6nLgcLyIMJnKDBBRHgm4wwQzTh/Qzitpn297CKqSpbgpt+Z5VBBV
 Q6CmSffK7m2WnVXD69Tf/lnQspMDU7Z98CqL7mJ9vuL+R5yhFgiBemeAG4dF5Zpooylz
 ALxA==
X-Gm-Message-State: APjAAAU6NZfec8OCaZ53s2Qg/3yUWVXZyaFNMWYcr8zL3lgLB69gEDV1
 TVotx1wr7pP+AhMOsf+YQdjdLzz6/FRFHw==
X-Google-Smtp-Source: APXvYqxe5ntRTLymPTWZgAkps7cdgRXitrgeNZjJlGWa7qRljUT9BWmkxdjJk0oM1uhKSMImDmzhHQ==
X-Received: by 2002:a7b:c0da:: with SMTP id s26mr12017184wmh.52.1580312582921; 
 Wed, 29 Jan 2020 07:43:02 -0800 (PST)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id a16sm3138099wrt.37.2020.01.29.07.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2020 07:43:01 -0800 (PST)
Date: Wed, 29 Jan 2020 15:43:00 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [RFC 0/2] virtio-rng: add a control queue
Message-ID: <20200129154300.GB157595@stefanha-x1.localdomain>
References: <20200123151700.1367857-1-lvivier@redhat.com>
 <20200124110240.GH736986@stefanha-x1.localdomain>
 <e4b0d666-c2a8-6d95-28f4-b51fe80ef73a@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tsOsTdHNUZQcU9Ye"
Content-Disposition: inline
In-Reply-To: <e4b0d666-c2a8-6d95-28f4-b51fe80ef73a@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Amit Shah <amit@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--tsOsTdHNUZQcU9Ye
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 24, 2020 at 03:05:18PM +0100, Laurent Vivier wrote:
> On 24/01/2020 12:02, Stefan Hajnoczi wrote:
> > On Thu, Jan 23, 2020 at 04:16:58PM +0100, Laurent Vivier wrote:
> >> The kernel needs sometime to be able to cancel an ongoing command.
> >>
> >> For instance, if the virtio-rng device uses the egd backend
> >> and this backend doesn't provide data, the buffer provided by the
> >> kernel is kept as long as it is needed.
> >>
> >> On the kernel side, a read blocks until the buffer returns from QEMU.
> >>
> >> As the read is done with a mutex held, all the hw_random interface
> >> hangs and we cannot switch to another hw_random backend.
> >>
> >> So this series adds a control queue to the virtio-rng device to allow
> >> to flush the virtio-rng input queue to release the kernel mutex and
> >> to allow to switch to another device.
> >>
> >> The kernel side series can be found at:
> >>
> >> https://github.com/vivier/linux/commits/virtio-rng-ctrl
> >>
> >> Laurent Vivier (2):
> >>   virtio-rng: prepare the introduction of a control queue
> >>   virtio-rng: add a control queue
> >>
> >>  hw/core/machine.c                           |  1 +
> >>  hw/virtio/trace-events                      |  6 ++
> >>  hw/virtio/virtio-rng.c                      | 99 ++++++++++++++++++---
> >>  include/hw/virtio/virtio-rng.h              |  5 +-
> >>  include/standard-headers/linux/virtio_rng.h | 14 +++
> >>  5 files changed, 111 insertions(+), 14 deletions(-)
> >=20
> > Where can I find the VIRTIO specification for this new virtqueue?
>=20
> I didn't update the specs.
>=20
> Is https://github.com/oasis-tcs/virtio-spec.git the document to update?

Yes, please.

Stefan

--tsOsTdHNUZQcU9Ye
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl4xqAQACgkQnKSrs4Gr
c8jPtQf+IRAagBkYf3xureXk5YJRPUhl+H9pjxvORIEX32MtI7v+WVXNnaXp6UVM
tvi1/6DSnLDnPluQ2uZdj6HdzsMTCpcDD8BlpOX2hbGYr0m0hOOsHPVf6a/yVb6S
UoGc4QcZmSUu3T56n2tZJqGcjljaRby6BU9CGjwmz5hCYUs54opa+wuOAvs7mzsG
gqORE+Y+IxQYxtB/zeEgqvbZGLO7jFnwpjiM64Cc+347EhQs/zb1ArjFvtowEszT
0JYWqns3h1qnn00RRzM1qDClyR9RX/prXs2j4Ku9pgnATMvzq0GbfzL9aiHkURZ6
ZcZOluJ5bzmPpyntjN6NcjQeLvKqaA==
=kw0I
-----END PGP SIGNATURE-----

--tsOsTdHNUZQcU9Ye--


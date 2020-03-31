Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84856199A07
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Mar 2020 17:43:06 +0200 (CEST)
Received: from localhost ([::1]:40548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJJ2f-000446-Gg
	for lists+qemu-devel@lfdr.de; Tue, 31 Mar 2020 11:43:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36324)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qemu_oss@crudebyte.com>) id 1jJJ0w-00034T-HM
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 11:41:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <qemu_oss@crudebyte.com>) id 1jJJ0u-0002NI-Jc
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 11:41:18 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:52899)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <qemu_oss@crudebyte.com>)
 id 1jJJ0s-0002I6-Es
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 11:41:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=KtUCCM8wzIJ4cxLULs36wuWo9aGGlSzvfMT69V1eK1Y=; b=cndjTVIA9oGss+GtOH0X6eDW77
 qRfxf3kc5OkgzKAxgYm/4PhOzpEkkiIt1wrjIUk2Cc0sANA7vzxBC6sR243hMZ1hILILuzWem87gY
 7XQcb8vr13YPbfm9IB8Ulg8+bGxctNET/lNTtCTxWCKVv4OuVhZykdyu12akwXPY2PQieTCAckIFD
 kAdnVOI6NiKfA6lcanBx7zfNuB6BQQuXy5z6WRkq0zr0JGM7LtxRfVbcUe7RVd7d4D2ncB2JavQ3H
 UkMufzPzThh4ZXh2gwNHBoN8cXGF3PJ8V/by9rrjOISgeIP+mtLt8uwYDYec0UglmBkJErnfUOvfh
 ZWEvjnops4w9Var0kBAg06XvbjJwkCW3kHxaSk/joESuXmHrHHskm1UolheWO3iImTsgpnc1nIv1i
 AjQy+1hBdYvRFIth2T/zQLHrRgsj6D+jJpD+bVd+/+wy5M2nF1tm2zxqRf/Tp7oZa4gNTzZ8UdZ8u
 pjIxr5RnfZdlb9VNjkGGl/lqsDv/5C03z4SKxQ77+bH4UZ3VYNvWHmDZkbWslP/9hAkX20IBg8pXZ
 Ak2MPDKdCIg9DB8pUqDKDu9M5DjiDTqInbeXojTKcczF7N8QiF8ZVbfYhmLL2ECMzDExeYub8ksfv
 2Ps0AxdErjbhZqmsWRqUEw6//mfJZ2KlVV1rDhK00=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] qemu-options.hx: 9p: clarify -virtfs vs. -fsdev
Date: Tue, 31 Mar 2020 17:41:08 +0200
Message-ID: <6318846.9qTBnWfJNl@silver>
In-Reply-To: <20200331172727.6e844deb.cohuck@redhat.com>
References: <208f1fceffce2feaf7c900b29e326b967dce7762.1585661532.git.qemu_oss@crudebyte.com>
 <20200331172727.6e844deb.cohuck@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.189.157.229
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Dienstag, 31. M=E4rz 2020 17:27:27 CEST Cornelia Huck wrote:
> > diff --git a/qemu-options.hx b/qemu-options.hx
> > index 962a5ebaa6..fd3830c6cd 100644
> > --- a/qemu-options.hx
> > +++ b/qemu-options.hx
> > @@ -1542,9 +1542,17 @@ SRST
> >=20
> >  ``-virtfs proxy,sock_fd=3Dsock_fd,mount_tag=3Dmount_tag
> >  [,writeout=3Dwriteout][,readonly]``> =20
> >    \
> > =20
> >  ``-virtfs synth,mount_tag=3Dmount_tag``
> >=20
> > -    Define a new filesystem device and expose it to the guest using a
> > -    virtio-9p-device. The general form of a Virtual File system
> > -    pass-through options are:
> > +    Define a new virtual filesystem device and expose it to the guest
> > using +    a virtio-9p-device (a.k.a. 9pfs), which essentially means th=
at
> > a certain +    directory on host is made directly accessible by guest as
> > a pass-through +    file system by using the 9P network protocol for
> > communication between +    host and guests, if desired even accessible,
> > shared by several guests +    simultaniously.
> > +
> > +    Note that ``-virtfs`` is actually just a convenience shortcut for =
its
> > +    generalized form ``-fsdev -device virtio-9p-pci``.
>=20
> Huh. This prompted me to try this on s390, and it actually creates a
> virtio-9p-pci device there as well, not a virtio-9p-ccw device. A bit
> surprising; but I don't see 9p used much (if at all) on s390 anyway.

Yeah, "virtio-9p-pci" is currently hard coded in softmmu/vl.c [line 3352]:
https://github.com/qemu/qemu/blob/17083d6d1e0635371418c26b613a6fa68d392f49/=
softmmu/vl.c#L3352

> > +
> >=20
> > +    The general form of pass-through file system options are:
> >      ``local``
> >     =20
> >          Accesses to the filesystem are done by QEMU.
>=20
> Good to see this spelled out:
>=20
> Acked-by: Cornelia Huck <cohuck@redhat.com>

Best regards,
Christian Schoenebeck




Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA91305E0A
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 15:18:18 +0100 (CET)
Received: from localhost ([::1]:52920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4leD-0003Nv-Jx
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 09:18:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l4laq-0002FO-UB
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 09:14:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l4lan-0002Ur-Nb
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 09:14:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611756883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K6r1Rg+1wirX3dR7iYgBo1dhkPClBdKULMY9dYKd7Uo=;
 b=hPWQrQ9aKGrDWGFAwytQnLkpXKHG+y4+wE+BiuyLvXpHIbhBNl4NjWc9Xq1zTSP7SBzD0B
 HMyd63lkgxzFC/ENiSNwpF5GKLnxBgUfmZMQ62bd3BT9s/NO8vsP+L70y+TtUjfBKfoNUw
 xNAcZFxExLejf9GTz2ewmm+Ex57ZyzM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-FFVDNX2NPeCkjKHMcwv4Cg-1; Wed, 27 Jan 2021 09:14:39 -0500
X-MC-Unique: FFVDNX2NPeCkjKHMcwv4Cg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2D2A8030A0;
 Wed, 27 Jan 2021 14:14:37 +0000 (UTC)
Received: from localhost (ovpn-115-15.ams2.redhat.com [10.36.115.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 18F945B4A8;
 Wed, 27 Jan 2021 14:14:30 +0000 (UTC)
Date: Wed, 27 Jan 2021 14:14:30 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Subject: Re: [PATCH v3] virtiofsd: prevent opening of special files
 (CVE-2020-35517)
Message-ID: <20210127141430.GA310142@stefanha-x1.localdomain>
References: <20210127112131.308451-1-stefanha@redhat.com>
 <CAOssrKfY7zDOH3NNbtyARHMCdJJN1tKQJri8ec=igjBf=K6Dog@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOssrKfY7zDOH3NNbtyARHMCdJJN1tKQJri8ec=igjBf=K6Dog@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="k1lZvvs/B4yU6o8G"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
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
Cc: Daniel Berrange <berrange@redhat.com>,
 Sergio Lopez Pascual <slp@redhat.com>, Greg Kurz <groug@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>, virtio-fs-list <virtio-fs@redhat.com>,
 Alex Xu <alex@alxu.ca>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 P J P <ppandit@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 27, 2021 at 02:01:54PM +0100, Miklos Szeredi wrote:
> On Wed, Jan 27, 2021 at 12:21 PM Stefan Hajnoczi <stefanha@redhat.com> wr=
ote:
>               }
> > @@ -1654,9 +1677,11 @@ static void update_open_flags(int writeback, int=
 allow_direct_io,
> >  static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *n=
ame,
> >                        mode_t mode, struct fuse_file_info *fi)
> >  {
> > +    int open_flags =3D (fi->flags | O_CREAT) & ~O_NOFOLLOW;
> >      int fd;
> >      struct lo_data *lo =3D lo_data(req);
> >      struct lo_inode *parent_inode;
> > +    struct lo_inode *existing_inode =3D NULL;
> >      struct fuse_entry_param e;
> >      int err;
> >      struct lo_cred old =3D {};
> > @@ -1682,11 +1707,23 @@ static void lo_create(fuse_req_t req, fuse_ino_=
t parent, const char *name,
> >
> >      update_open_flags(lo->writeback, lo->allow_direct_io, fi);
> >
> > -    fd =3D openat(parent_inode->fd, name, (fi->flags | O_CREAT) & ~O_N=
OFOLLOW,
> > -                mode);
> > +    /* First, try to create a new file but don't open existing files *=
/
> > +    fd =3D openat(parent_inode->fd, name, open_flags | O_EXCL, mode);
> >      err =3D fd =3D=3D -1 ? errno : 0;
> > +
> >      lo_restore_cred(&old);
> >
> > +    /* Second, open existing files if O_EXCL was not specified */
> > +    if (err =3D=3D EEXIST && !(fi->flags & O_EXCL)) {
> > +        existing_inode =3D lookup_name(req, parent, name);
> > +        if (existing_inode) {
> > +            fd =3D lo_inode_open(lo, existing_inode, open_flags);
> > +            if (fd < 0) {
> > +                err =3D -fd;
> > +            }
> > +        }
> > +    }
> > +
> >      if (!err) {
> >          ssize_t fh;
>=20
> It's more of a mess than I thought.
>=20
> The problem here is there can also be a race between the open and the
> subsequent lo_do_lookup().
>=20
> At this point it's probably enough to verify that fuse_entry_param
> refers to the same object as the fh (using fstat and comparing st_dev
> and st_ino).

Can you describe the race in detail? FUSE_CREATE vs FUSE_OPEN?
FUSE_CREATE vs FUSE_CREATE?

> Also O_CREAT open is not supposed to return ENOENT, so failure to open
> without O_CREAT (race between O_CREAT open and plain open) should at
> least translate error to ESTALE or EIO.

Thanks, will fix.

Sstefan

--k1lZvvs/B4yU6o8G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmARdUUACgkQnKSrs4Gr
c8jciAf9FyW8VXDVqTl3unEErorqJH0YcYolxd4/L14XaZqJUqLKSEHm8DmVFfEM
T3O91pjNUrlqVvkE/UdRkOEufO8KqjKumQjcL+n2iX9GJ5+XgNpkzJc3Nh6obP61
lLU5pt6iYvPXqDJhRwRlVHV+Ib8dmA5/ZbD1aFcUa0s97ylouU4LTZV9ygS3mq36
2PqcxVo6yaw6qYyyJL0KDvPmdvQEEBGI8bFaAVxkYRyc5D2PR3lUmuYTVOno3tk+
FWZM82M6dohhHsXqu7x24ZvUqFEa82hh1+nxJ/Ff3AsmXSxzm4RgVGKlnTBJiT+T
8xdiVadSa/Xb7lnK7VGwf+NiuUuOSA==
=xq0v
-----END PGP SIGNATURE-----

--k1lZvvs/B4yU6o8G--



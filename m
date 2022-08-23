Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1816559E3F8
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 14:54:24 +0200 (CEST)
Received: from localhost ([::1]:35726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQTQE-00082I-99
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 08:54:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oQTD2-00040u-8s
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 08:40:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oQTCo-0005wf-IL
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 08:40:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661258428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/zo0FZf9LVOgAJsr3AP/yoHOfTkOoUfSXpMwkL/ktCA=;
 b=IQwdbOD56ROQa8dO0GDf6UcP4Nj4EIOlLTVuI8YRkZ385liN6AGSPVDsNfst8RZ9n6ef6Z
 xtXQLzVV5f1oK2FvnNj4mXOJ1XHzcVjejc0ovIvduys3X6KeB1zHy3jzHoFn1gLwL2IH9E
 R0pKkHXVKboG++5V/dWrM+PUsz/PsV4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-547-rUbsdeTgM2aeLZL7AKu-Lw-1; Tue, 23 Aug 2022 08:40:25 -0400
X-MC-Unique: rUbsdeTgM2aeLZL7AKu-Lw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74B6D38149B1;
 Tue, 23 Aug 2022 12:40:24 +0000 (UTC)
Received: from localhost (unknown [10.39.194.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 01C3F2166B26;
 Tue, 23 Aug 2022 12:40:23 +0000 (UTC)
Date: Tue, 23 Aug 2022 08:40:22 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Hannes Reinecke <hare@suse.de>,
 Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 qemu block <qemu-block@nongnu.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>
Subject: Re: [PATCH v7 4/8] block: add block layer APIs resembling Linux
 ZonedBlockDevice ioctls
Message-ID: <YwTKtrBdda6xEX2z@fedora>
References: <20220816062522.85714-1-faithilikerun@gmail.com>
 <20220816062522.85714-5-faithilikerun@gmail.com>
 <YwQkAs3+aUAvarMA@fedora>
 <CAAAx-8Jk1d4wO5bfNPOLb_XStOC8Bz07kxVbBC3f9-+u3ZxXqA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QeVhoU+bvnlaT/xe"
Content-Disposition: inline
In-Reply-To: <CAAAx-8Jk1d4wO5bfNPOLb_XStOC8Bz07kxVbBC3f9-+u3ZxXqA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--QeVhoU+bvnlaT/xe
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 23, 2022 at 12:12:44PM +0800, Sam Li wrote:
> Stefan Hajnoczi <stefanha@redhat.com> =E4=BA=8E2022=E5=B9=B48=E6=9C=8823=
=E6=97=A5=E5=91=A8=E4=BA=8C 08:49=E5=86=99=E9=81=93=EF=BC=9A
> > On Tue, Aug 16, 2022 at 02:25:18PM +0800, Sam Li wrote:
> > > +static int handle_aiocb_zone_report(void *opaque) {
> > > +#if defined(CONFIG_BLKZONED)
> > > +    RawPosixAIOData *aiocb =3D opaque;
> > > +    int fd =3D aiocb->aio_fildes;
> > > +    unsigned int *nr_zones =3D aiocb->zone_report.nr_zones;
> > > +    BlockZoneDescriptor *zones =3D aiocb->zone_report.zones;
> > > +    int64_t sector =3D aiocb->aio_offset;
> > > +
> > > +    struct blk_zone *blkz;
> > > +    int64_t rep_size;
> > > +    unsigned int nrz;
> > > +    int ret, n =3D 0, i =3D 0;
> > > +
> > > +    nrz =3D *nr_zones;
> > > +    rep_size =3D sizeof(struct blk_zone_report) + nrz * sizeof(struc=
t blk_zone);
> > > +    g_autofree struct blk_zone_report *rep =3D NULL;
> > > +    rep =3D g_malloc(rep_size);
> > > +
> > > +    blkz =3D (struct blk_zone *)(rep + 1);
> > > +    while (n < nrz) {
> > > +        memset(rep, 0, rep_size);
> > > +        rep->sector =3D sector;
> > > +        rep->nr_zones =3D nrz - n;
> > > +
> > > +        ret =3D ioctl(fd, BLKREPORTZONE, rep);
> >
> > Does this ioctl() need "do { ... } while (ret =3D=3D -1 && errno =3D=3D=
 EINTR)"?
>=20
> No? We discussed this before. I guess even EINTR should be propagated
> back to the guest. Maybe Damien can talk more about why.

No, EINTR is an internal error that must be handled by QEMU. It means
the QEMU process' syscall was interrupted by a signal and the syscall
must be retried. The guest shouldn't see EINTR (and there is no
virtio-blk error code defined for it).

--QeVhoU+bvnlaT/xe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMEyrYACgkQnKSrs4Gr
c8iMAwgAwP8AsJnctWc16QkWxlMoo0f2kmpfFExWl4ScWp76rWlGzSXsiGyGkjQN
LwG7izRCstqaxaBXto9X3rkhADwmGa5btey0bUnqFKiUXnehRsRGbtrT8l6L6IbG
Vb2dNTLR0Yd5kyGsu85sVEXTMxdfCYW96Q9hdZtYE1cj1q9zrMSJSD/gXM3TLO+D
FaC+dlDyJDywgKBnxRYttn/TMwDODpNvy9bSzIwYfpdB2+gUN72RljZBUXw3s1Fo
/hMbKZr0zgSO0BkSD8BeT0r6PBQtJd+QEnyEivNpNQT507yWOSHFz76NOWLac1tG
4SZaLvvJqQytVXmhON+rYlWubJWeRw==
=0f9V
-----END PGP SIGNATURE-----

--QeVhoU+bvnlaT/xe--



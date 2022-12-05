Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F46642CA7
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 17:17:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2E8B-0008Ue-GQ; Mon, 05 Dec 2022 11:15:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1p2E88-0008Si-Qa
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 11:15:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1p2E87-00021X-24
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 11:15:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670256941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f4IfzkD4dte78BJ2XG9Ujbr36yvtqp16cgw5jz1j9mg=;
 b=GsEnWQzKxkNHes6ZEM6tfrKUSwRyApEmnQqlO9WXKVWZ7r7Ay9PRvgmJz9vi3ntDdZY2e/
 G1jYADVNV1GwZ6vfKjskyBNeS55BX7Nd5tXYFls2Kg2boTs2s+OOrcFSn9drMDx9uyiD/J
 yy8lXW2SxDR7Bl2sPBm2O5cuBFEpIys=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-458-nZptNihPPtGv5nSRcs0Ehg-1; Mon, 05 Dec 2022 11:15:37 -0500
X-MC-Unique: nZptNihPPtGv5nSRcs0Ehg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B4D03C0F42F;
 Mon,  5 Dec 2022 16:15:37 +0000 (UTC)
Received: from localhost (unknown [10.39.195.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7BCEDC15BA8;
 Mon,  5 Dec 2022 16:15:36 +0000 (UTC)
Date: Mon, 5 Dec 2022 11:15:32 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org,
 Fam Zheng <fam@euphon.net>, Hanna Reitz <hreitz@redhat.com>,
 damien.lemoal@opensource.wdc.com, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, hare@suse.de,
 Kevin Wolf <kwolf@redhat.com>, dmitry.fomichev@wdc.com,
 Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v13 3/8] block: add block layer APIs resembling Linux
 ZonedBlockDevice ioctls
Message-ID: <Y44ZJI4L7BkjbYUt@fedora>
References: <20221027154504.20684-1-faithilikerun@gmail.com>
 <20221027154504.20684-4-faithilikerun@gmail.com>
 <CAJSP0QUSQ8MjkGn5SWRPbN+G+xoQH-Htm3BGCMOX_LV9Of=7Og@mail.gmail.com>
 <CAAAx-8LVtGtkReDz4xD37EEJ9Jf7Sk=u+Urse-g=zkAwXt14=A@mail.gmail.com>
 <Y43hobutvJ0vXWNB@fedora>
 <CAAAx-8J6AMfPjuoPYb6LBSY8fiKRMCet+CdK1o_UcwFQ1sq1NA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fsAVpx5MDIFjmWVE"
Content-Disposition: inline
In-Reply-To: <CAAAx-8J6AMfPjuoPYb6LBSY8fiKRMCet+CdK1o_UcwFQ1sq1NA@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--fsAVpx5MDIFjmWVE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 05, 2022 at 09:24:28PM +0800, Sam Li wrote:
> Stefan Hajnoczi <stefanha@redhat.com> =E4=BA=8E2022=E5=B9=B412=E6=9C=885=
=E6=97=A5=E5=91=A8=E4=B8=80 20:20=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Wed, Nov 30, 2022 at 10:24:10AM +0800, Sam Li wrote:
> > > Stefan Hajnoczi <stefanha@gmail.com> =E4=BA=8E2022=E5=B9=B411=E6=9C=
=8830=E6=97=A5=E5=91=A8=E4=B8=89 10:01=E5=86=99=E9=81=93=EF=BC=9A
> > > > On Thu, 27 Oct 2022 at 11:46, Sam Li <faithilikerun@gmail.com> wrot=
e:
> > > > > @@ -1374,9 +1428,11 @@ static int hdev_probe_blocksizes(BlockDriv=
erState *bs, BlockSizes *bsz)
> > > > >      int ret;
> > > > >
> > > > >      /* If DASD, get blocksizes */
> > > > > +#ifndef CONFIG_BLKZONED
> > > > >      if (check_for_dasd(s->fd) < 0) {
> > > > >          return -ENOTSUP;
> > > > >      }
> > > > > +#endif
> > > >
> > > > What is the purpose of this #ifndef? .bdrv_probe_blocksizes() should
> > > > only return block sizes for s390 DASD devices. I don't think zoned
> > > > storage needs block size probing here.
> > >
> > > Zoned storage needs to be virtualized with the correct physical block
> > > size and logical block size. And the probing here can guarantee that.
> > > Or virtio-blk may send wrong block size to the guest. If manually set
> > > block size in the command line as before, it is somewhat inaccurate.
> >
> > I see. I/O won't work if the guest block size differs from the physical
> > zoned device's block size.
> >
> > However, we must not do this for regular host_device BlockDriverStates.
> > The block size is manually controlled from those devices and defaults to
> > 512B. That way the blocksize doesn't change across live migration and
> > break the guest.
> >
> > Please use a run-time check instead of an #ifdef. Only probe blocksizes
> > for dasd and zoned devices.
>=20
> I see. Like this?
>=20
> #ifndef CONFIG_BLKZONED
> static int hdev_probe_zbd_blocksizes(BlockDriverState *bs, BlockSizes *bs=
z){
>     int ret;
>     /* check zbd */
>     ...
>     /* probe zbd */
>     ....    }
> +#endif

Yes, I think that's the cleanest option.

You don't need to check if it's a ZBD. Only the zoned_host_device driver
will use this .bdrv_probe_blocksizes() callback. The regular host_device
driver will use hdev_probe_blocksizes().

Stefan

--fsAVpx5MDIFjmWVE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmOOGSQACgkQnKSrs4Gr
c8g6MAf+Nkd3KT3UJZvZGi5lRLDR3ZJT2P7frWEVbqBC0wOO3ZtDyH/esyFeHoxS
Sgdp0yrhQ8w5B0h43guLduBeKyAXP4gsckI7eCsCt7RXzarJdjmGXWXItMf5hdGT
TdjVcgaJjVPcKz5tjfSeu6KQ0Xqz6QO/vwJA3LXa8u2/fGnfLLNL0jnEoMoRhNOc
W6IfOT5MCfdwsIPZxqNxdpjVXoztEksMX0qo5y7DjlF3Nrep1ZQsDpHlldIqDIoD
DGY+JHdu7fIwjz0gK0nLbeNVV+ZGUFcC2MnrU/k6mGTiUmxLmlIUGfh1JaH1eAXA
Gd7CD8Q0iqBcWbLZBjI4CAtX2qIv8g==
=FN7Z
-----END PGP SIGNATURE-----

--fsAVpx5MDIFjmWVE--



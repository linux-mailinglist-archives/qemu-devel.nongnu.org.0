Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B47B34FDEA
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 12:19:55 +0200 (CEST)
Received: from localhost ([::1]:59966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRXx4-0000vR-ER
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 06:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lRXs6-0004AL-QD
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 06:14:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lRXs3-0006O0-8Z
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 06:14:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617185682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e8IS9axXMEn0mAg/yMC8yB6hygKq3YTW8GCcN191T8Y=;
 b=Bh177AH4XWYuNQ+Y7MrNps+a+rdQ6yy8LW1qmkMa6lg1YOIFaAfr/3kci9cl7T9o+5QZXt
 rAMTw/9YYOzyc6IC7Xgf0NzW6p8BqR0N+M5eGxI2zCAV3PxD+xqkiHC0nBoDM7AgsNopvW
 BUlk4PtryK+ZVUibOD1bd3rR2Jxhpmg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-cS03O07aMl2Zl8O0OC2iCA-1; Wed, 31 Mar 2021 06:14:40 -0400
X-MC-Unique: cS03O07aMl2Zl8O0OC2iCA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 270C5801814
 for <qemu-devel@nongnu.org>; Wed, 31 Mar 2021 10:14:39 +0000 (UTC)
Received: from localhost (ovpn-115-85.ams2.redhat.com [10.36.115.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EDBB560861;
 Wed, 31 Mar 2021 10:14:28 +0000 (UTC)
Date: Wed, 31 Mar 2021 11:14:27 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 18/24] DAX/unmap virtiofsd: Parse unmappable elements
Message-ID: <YGRLgzlo1DgA5uQv@stefanha-x1.localdomain>
References: <20210209190224.62827-1-dgilbert@redhat.com>
 <20210209190224.62827-19-dgilbert@redhat.com>
 <20210211142948.GS247031@stefanha-x1.localdomain>
 <YDd5swx5HA+WinFF@work-vm>
MIME-Version: 1.0
In-Reply-To: <YDd5swx5HA+WinFF@work-vm>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4AZoSTMUp9LDSKPC"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: virtio-fs@redhat.com, marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 vgoyal@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--4AZoSTMUp9LDSKPC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 25, 2021 at 10:19:31AM +0000, Dr. David Alan Gilbert wrote:
> * Stefan Hajnoczi (stefanha@redhat.com) wrote:
> > On Tue, Feb 09, 2021 at 07:02:18PM +0000, Dr. David Alan Gilbert (git) =
wrote:
> > > diff --git a/tools/virtiofsd/fuse_common.h b/tools/virtiofsd/fuse_com=
mon.h
> > > index a090040bb2..ed9280de91 100644
> > > --- a/tools/virtiofsd/fuse_common.h
> > > +++ b/tools/virtiofsd/fuse_common.h
> > > @@ -611,6 +611,13 @@ enum fuse_buf_flags {
> > >       * detected.
> > >       */
> > >      FUSE_BUF_FD_RETRY =3D (1 << 3),
> > > +
> > > +    /**
> > > +     * The addresses in the iovec represent guest physical addresses
> > > +     * that can't be mapped by the daemon process.
> > > +     * IO must be bounced back to the VMM to do it.
> > > +     */
> > > +    FUSE_BUF_PHYS_ADDR =3D (1 << 4),
> >=20
> > With a vIOMMU it's an IOVA. Without a vIOMMU it's a GPA. This constant
> > may need to be renamed in the future, but it is okay for now.
>=20
> Do we have any naming for something that's either a GPA or a IOVA?

I don't remember but I think the naming is confusing in core vhost code
too :). I just don't remember if it's called a "physical address" there.

Stefan

--4AZoSTMUp9LDSKPC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBkS4MACgkQnKSrs4Gr
c8iepggAibhDpVfW5Ttxe6osMKNmSL2sZSo+pWdQH1at8h1Nbfh+fzFta+FSJCvf
X84KkOnP+i7q1ObryGsy4WWDiyeL5Z2HE9lUhwuySKylK+x4/KdHykgioPKJ2+sL
N5926Qb59qNo/icI/XdQ7ghvAE3Rm7gKYz9DaaCVTxVq+V4tawFdjEoE7XevQ0LH
ft93Muo8ya9lCN/EPBZ3UYWxC7Gtj4Hst9dDA2ZMhTHDlxdElLbv1VaeJxAc2kt9
T5FDFLmbVwMyWwlfXE7GpjvbsIpZ1waJ0Zm0hV/SPGlGuMq8EMR2MAPc/yVx2tfp
ngiq+I/40avjVfrz0M3UjugPj6sDVA==
=J+P8
-----END PGP SIGNATURE-----

--4AZoSTMUp9LDSKPC--



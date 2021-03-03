Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE15532B963
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 18:11:03 +0100 (CET)
Received: from localhost ([::1]:36804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHV1a-0002jF-Rj
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 12:11:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lHV0R-0001ts-08
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 12:09:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lHV0L-0001nv-OJ
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 12:09:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614791382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=02sIltQ7ZSDRvqE7Le+iq9JbxBBWQYk716wPoncrfro=;
 b=XSYk4yb1eLmW9Ou29S7v5gZnMRLnIq/ntgv/MIuw8e3n+9SBBeKHZWz9drc0/26EQY0X0Z
 6apLzFcmmN6E94OJ9gto7V68aXDgphrqZJhRkoqc5OKw4+43jLKHfELR+mrBGBrFrDMntu
 2K6lpA+3h++xpp7nxa2d8jp6LQQXqBU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-lTKS-MjKPYSFMy8V13XMRA-1; Wed, 03 Mar 2021 12:09:39 -0500
X-MC-Unique: lTKS-MjKPYSFMy8V13XMRA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B624107ACC7
 for <qemu-devel@nongnu.org>; Wed,  3 Mar 2021 17:09:38 +0000 (UTC)
Received: from localhost (ovpn-114-24.ams2.redhat.com [10.36.114.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C58425D9C6;
 Wed,  3 Mar 2021 17:09:34 +0000 (UTC)
Date: Wed, 3 Mar 2021 17:09:33 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: Inconsistent virtio-net-pci MSI vector count
Message-ID: <YD/CzbQj6vDmcafO@stefanha-x1.localdomain>
References: <YD9qmto5pHys+jEm@stefanha-x1.localdomain>
 <e8c8874f-6b1a-ac0e-5ab6-826611cd3ef3@redhat.com>
 <20210303111216-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210303111216-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WIokzSLGX9qtclEE"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--WIokzSLGX9qtclEE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 03, 2021 at 11:12:51AM -0500, Michael S. Tsirkin wrote:
> On Wed, Mar 03, 2021 at 09:08:27PM +0800, Jason Wang wrote:
> >=20
> > On 2021/3/3 6:53 =E4=B8=8B=E5=8D=88, Stefan Hajnoczi wrote:
> > > Hi Jason,
> > > I stumbled across something strange with virtio-net multi-queue today=
.
> > > It doesn't seem to be a bug in practice, just an inconsistency. Here =
are
> > > the details in case you think something needs to be changed:
> > >=20
> > > libvirt uses the vectors =3D 2 * N + 2 formula from
> > > https://www.linux-kvm.org/page/Multiqueue to calculate the number of =
PCI
> > > MSI vectors, where N is the number of rx/tx queue pairs.
> > >=20
> > > QEMU's virtio-net-pci device has 3 MSI vectors by default. This is
> > > inconsistent with the formula that libvirt uses (should be 4 instead =
of
> > > 3).
> >=20
> >=20
> > Yes.
> >=20
> >=20
> > >=20
> > > Luckily, the Linux virtio_net.ko driver does not configure a callback
> > > function for the control virtqueue. Therefore it can still use MSI wi=
th
> > > only 3 vectors (config, rx, tx) instead of 4 (config, rx, tx, ctrl).
> > >=20
> > > But other driver implementations might need the ctrl vq vector and wo=
uld
> > > not have enough MSI vectors.
> > >=20
> > > Perhaps new QEMU machine types should set vectors to 4 by default?
> >=20
> >=20
> > Or it's time to accept this:
> >=20
> > https://lists.gnu.org/archive/html/qemu-devel/2014-03/msg01330.html
> >=20
> > Thanks
>=20
> okay, please repost. If possible please add code comments
> explaining the math.

Nice!

Stefan

--WIokzSLGX9qtclEE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmA/ws0ACgkQnKSrs4Gr
c8hSZAgAuWPHT39YlrEWdn96EQpJ1lueF7b1GrP87hgDS0oR67xW7LRJm9y/NoDN
HXg7E82O2z0n0hx4LfMJrzMF7//NqOt30/WJZgnVwTE1xjIbMIZT75PeA/4pPnlb
CjoEur9k1DZPoFQikspevRCX8X6H0o+wyZhHleSFDg43qLDeCzT+sKCO2qiKZXFa
vaXZ2FSA2b1tTQCPeLzNR8lLwSexJGtg4qQBqav0j22npyNyhjkqAiPcvCBh22T+
abnOXREmyvXTMq04raCCKe5qWp0fDa+6S5lGC6PNptPEzC2JulmD8EBpz6dL/XaE
1Tbp4q9IUdmVrYi5R/gf1yYdAZmAbA==
=BbzI
-----END PGP SIGNATURE-----

--WIokzSLGX9qtclEE--



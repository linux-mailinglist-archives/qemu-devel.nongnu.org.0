Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F93447E50
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 11:54:52 +0100 (CET)
Received: from localhost ([::1]:35618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk2Id-0002A7-O3
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 05:54:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mk2HB-0000lk-L0
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 05:53:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mk2H3-0007PX-8a
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 05:53:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636368790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d5EvebM+VszCNatMFlIYAdj0Wkef/BIrymF4oQFq1uU=;
 b=UKTiWcIOIDbcaq+nAGB0shfV9ExqZCEbul1ztCEuScOY3UH3bMTpDgrUO3rbZC4SN53gxB
 fpJEkBu7XagAfbvPQouJrA1Dkrf2BKP6ZaJmbDRNJnEZnZWHbVGx0kM0aCAZnOd7WynGPg
 5PbpVrMiKe91k2p+bYd1w6yFVLX5Qoo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-R5SdpW_EOuuG4Mp-bRI2mg-1; Mon, 08 Nov 2021 05:53:07 -0500
X-MC-Unique: R5SdpW_EOuuG4Mp-bRI2mg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87C7B87D541;
 Mon,  8 Nov 2021 10:53:06 +0000 (UTC)
Received: from localhost (unknown [10.39.195.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 152C660CC4;
 Mon,  8 Nov 2021 10:53:05 +0000 (UTC)
Date: Mon, 8 Nov 2021 10:53:04 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Cindy Lu <lulu@redhat.com>
Subject: Re: [PATCH v10 00/10]vhost-vdpa: add support for configure interrupt
Message-ID: <YYkBkGdlpeer18e9@stefanha-x1.localdomain>
References: <20211104164827.21911-1-lulu@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211104164827.21911-1-lulu@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="sWeMhoX13eD21EvZ"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: mst@redhat.com, jasowang@redhat.com, dgilbert@redhat.com,
 qemu-devel@nongnu.org, arei.gonglei@huawei.com, kraxel@redhat.com,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--sWeMhoX13eD21EvZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 05, 2021 at 12:48:17AM +0800, Cindy Lu wrote:
> these patches add the support for configure interrupt
>=20
> These codes are all tested in vp-vdpa (support configure interrupt)
> vdpa_sim (not support configure interrupt), virtio tap device
>=20
> test in virtio-pci bus and virtio-mmio bus

Hi,
vhost-user has a configuration space change notification but it uses a
slave channel message (VHOST_USER_SLAVE_CONFIG_CHANGE_MSG) instead of an
eventfd. Ideally the vhost kernel ioctl and vhost-user interfaces would
follow the same design.

I'm concerned "common" vhost code is going to end up with lots of
callbacks that are not available uniformly across vhost kernel, vdpa,
and vhost-user. That makes it hard to understand and debug vhost, plus
differences make it harder to to correctly extend these interfaces in
the future.

Is the decision to a new eventfd-based interface instead of
vhost_chr_read/write() deliberate?

If yes, do you think VHOST_USER_SLAVE_CONFIG_CHANGE_MSG was a design
mistake in vhost-user that needs to be fixed?

Stefan

--sWeMhoX13eD21EvZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmGJAY4ACgkQnKSrs4Gr
c8j/CgfzBWT70N2l6RH8L2MlgWvyylEPpvfBCX0vXwiQQfarCxxnWXta0nXZ4nsT
l57qb/v/DHDeX5xdERuF6iDg5DU55yK3dokWKUEzk3+tzn7OAEpQeIc9g3LTBXky
KwQIkx2toHGh6Puun0wxYYt/5VC5qkk2ESdIOSjH1SiotgpXmlTxvm9U5xJmyh6i
Gfc4tt06oRUzpHr86woeCxFLNobnY4LvnTxyhN8FJCKL+OmBtj4eLotahTo/YRkZ
3Vg22CLDx+qLGBKpuJVGhGtvvZWV1MuwEGpeaIp4l1BqB1CtuXLWic5m4CKnkJ1L
bjDfHvvwpHOW1ndOM4ar4Bnafyh9
=KDYj
-----END PGP SIGNATURE-----

--sWeMhoX13eD21EvZ--



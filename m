Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFB93A14EA
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 14:51:12 +0200 (CEST)
Received: from localhost ([::1]:53636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqxfr-0000tJ-8w
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 08:51:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lqxe0-0007Hr-D2
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 08:49:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lqxdz-0004HX-1x
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 08:49:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623242954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EGkUuFQ7CGLSVnBnUDCXzR0G9zwZJK+JhDjKfCKXzqc=;
 b=MsQXpN0H5gsNH76/GJ4NSQOi1GWoBXCDsZ+CF61lblbSn+rZEgzsAEUYZ6QJMGt+eB8wyx
 4HquHi6ClsYmT3kByHuLJVY6G/gAUM5oqNeKeFPlP38gB0Bsg+9m7bYjH0aQri2I1orQd4
 9qH3reVVXhQX+Dx8OwLFqw40gFwS8IM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-7PLnEJqbNFSZbI5rJQXlLA-1; Wed, 09 Jun 2021 08:49:12 -0400
X-MC-Unique: 7PLnEJqbNFSZbI5rJQXlLA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43C25801B12
 for <qemu-devel@nongnu.org>; Wed,  9 Jun 2021 12:49:11 +0000 (UTC)
Received: from localhost (ovpn-115-220.ams2.redhat.com [10.36.115.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD52910023B5;
 Wed,  9 Jun 2021 12:49:02 +0000 (UTC)
Date: Wed, 9 Jun 2021 13:49:02 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v4 11/13] virtio-gpu: split trace points
Message-ID: <YMC4vgjSqsQPWGjH@stefanha-x1.localdomain>
References: <20210601132414.432430-1-kraxel@redhat.com>
 <20210601132414.432430-12-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210601132414.432430-12-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vd0c5GWDe2xFjX1b"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Markus Armbruster <armbru@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--vd0c5GWDe2xFjX1b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 01, 2021 at 03:24:12PM +0200, Gerd Hoffmann wrote:
> Create separate trace points for the simple and virgl
> variants of the virtio-gpu device.
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/display/virtio-gpu-virgl.c | 48 +++++++++++++++++------------------
>  hw/display/trace-events       | 30 ++++++++++++++--------
>  2 files changed, 43 insertions(+), 35 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--vd0c5GWDe2xFjX1b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDAuL4ACgkQnKSrs4Gr
c8hSywf+ODN1IEKXbeWb8hL0cv/DyqzBbiFiYbbX3zeRvgsHfHt3FcMhX+KZL0QK
PrpnYhh/6vg5WE/gjdCP4Kr5tW40PYX/KxoM2Il0xJnniHnC9+Vj8Ua8jMgJCcSM
H0uffH76IPI48PQCQh7VhsFJg5Cxj63vZM51azkp21R1Ut9i6mIGsCt8Odn9E7O0
ODyA60HOBVMVdRbEcYXvASbVWD4FIJOZ9kD8++/BDPVEmCONXjS3i4EYJ/I4+opK
TVsivg+U5a0IdWSY1mpWPPFT8u4jAll4IAPlRU/hxj6Bcdx2Aj1nP+piv93DRK72
O41+fMvpsiYv0UX4cHsdGydwyolWHA==
=r9FP
-----END PGP SIGNATURE-----

--vd0c5GWDe2xFjX1b--



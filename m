Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7316F135F23
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jan 2020 18:19:42 +0100 (CET)
Received: from localhost ([::1]:35616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipbTB-0001FB-Hw
	for lists+qemu-devel@lfdr.de; Thu, 09 Jan 2020 12:19:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53069)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1ipbSF-0000n4-3O
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 12:18:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1ipbSD-0006BO-AJ
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 12:18:42 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:42882
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1ipbSD-00065v-44
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 12:18:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578590320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iJ0XcTfrivrESPMC/3ecE/uJHAgQQfg92nXKMYK0Hq4=;
 b=Fp9zbatXPynXBvm8hzhYf6y/KOIVB5Xe9c0N+Adu4C0X/Qeb5ctoheRh3fhiVIkEPrs+06
 erTrbfQQ94l/BSo4P1y2Lo2nZFsKYWzPq9Zii7L82N+kqODIJkKX2g5lNuMfMCONjaPOKw
 T/9PUDCVRLyz0jd9H1ViRUzc63Blw2A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-SjBz5gLvOTGtYm_R81GLug-1; Thu, 09 Jan 2020 12:18:38 -0500
X-MC-Unique: SjBz5gLvOTGtYm_R81GLug-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4A22801E67;
 Thu,  9 Jan 2020 17:18:36 +0000 (UTC)
Received: from localhost (unknown [10.36.118.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 329DC10013A7;
 Thu,  9 Jan 2020 17:18:35 +0000 (UTC)
Date: Thu, 9 Jan 2020 17:18:34 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Wangyong <wang.yongD@h3c.com>
Subject: Re: [PATCH] linux-aio: increasing MAX_EVENTS to a larger hardcoded
 value
Message-ID: <20200109171834.GA566396@stefanha-x1.localdomain>
References: <faa5781afd354a96a0be152b288f636f@h3c.com>
MIME-Version: 1.0
In-Reply-To: <faa5781afd354a96a0be152b288f636f@h3c.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="J/dobhs11T7y2rNN"
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>,
 Changlimin <changlimin@h3c.com>, "hch@lst.de" <hch@lst.de>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 07, 2020 at 06:01:01AM +0000, Wangyong wrote:
> Since commit 6040aedddb5f474a9c2304b6a432a652d82b3d3c "virtio-blk:
> make queue size configurable",if the user set the queue size to
> more than 128 ,it will not take effect. That's because linux aio's
> maximum outstanding requests at a time is always less than or equal
> to 128.
>=20
> This patch simply increase MAX_EVENTS to a larger hardcoded value of
> 1024 as a shortterm fix.
>=20
> Signed-off-by: wangyong <wang.yongD@h3c.com>
> ---
>  block/linux-aio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

We discussed that long-terms solutions would take into account the queue
size of the emulated storage controllers associated with this
AioContext, but this is a first step that will improve performance.

Thanks, applied to my block tree:
https://github.com/stefanha/qemu/commits/block

Stefan

--J/dobhs11T7y2rNN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl4XYGoACgkQnKSrs4Gr
c8jegwf/e+QNezXD56wl1hOoFMOyMA8zc6Mu0HzwNQlXgTyGT7kZGplMuQSh1aMV
BWkvFgS23TgWXpxH1m9CXKcXYxbmh8iveCw7e8UEAmMgQdg+gRbJcPb1rCB97Ts3
dA0ecGzh1DVi6LZbkmyFMYdoEq6pnGTXScO7Q11RmNY2oz5xIPa9G9AuiQzAdMYf
V0oc91DWtlgT9XTFGLzvBPC7ehdGc0l3YlJFYa1GkWtAsAYoVTlJfvAdZUaO8YD9
8pgnEfJCBciaDaq3BICXPYW3D6FJgghqsOiHG2L6dl+98WH5xYp0e+rTmoqpH9/C
w6tBcdxIztSqDIz4lAqRN3C4XH2o4w==
=Ccsg
-----END PGP SIGNATURE-----

--J/dobhs11T7y2rNN--



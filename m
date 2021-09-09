Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8414A404649
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 09:36:00 +0200 (CEST)
Received: from localhost ([::1]:41240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOEbJ-0002we-DL
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 03:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mOEVO-00071x-Pp
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 03:29:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mOEV8-0007xK-0a
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 03:29:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631172576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Tdst716VyPJCdE2QCvxTV9ujbkBD84olipipZD/dQ00=;
 b=QA0E6ChH8nwJk6i3mayzMWLC3W+rNlUHlO+6uKNBZGNHKfUuoW1tL1J/7URL0SMUekyqHn
 rSiZRzhyhI1VitBvMY+p3CRo0oqzKkfjR0h8/jYRr9xH6yL8Oq/5Y9GLS+//7bnlfU043K
 eO190iqWTF3xTq3/qT+6ALU0jzqbNDY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-u-3_SN7mMXyulEtO0sbPEw-1; Thu, 09 Sep 2021 03:29:35 -0400
X-MC-Unique: u-3_SN7mMXyulEtO0sbPEw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B2C519057A1;
 Thu,  9 Sep 2021 07:29:34 +0000 (UTC)
Received: from localhost (unknown [10.39.192.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CBA161346F;
 Thu,  9 Sep 2021 07:29:30 +0000 (UTC)
Date: Thu, 9 Sep 2021 08:29:29 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH RFC server v2 07/11] vfio-user: handle DMA mappings
Message-ID: <YTm32dLTFn48M2Xj@stefanha-x1.localdomain>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <cover.1630084211.git.jag.raman@oracle.com>
 <9fe8660c83c290e8985add3bd7e6a1e57631891f.1630084211.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <9fe8660c83c290e8985add3bd7e6a1e57631891f.1630084211.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cUm9We+jwzcbOAW7"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, philmd@redhat.com,
 qemu-devel@nongnu.org, alex.williamson@redhat.com, marcandre.lureau@gmail.com,
 thanos.makatos@nutanix.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--cUm9We+jwzcbOAW7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 27, 2021 at 01:53:26PM -0400, Jagannathan Raman wrote:
> Define and register callbacks to manage the RAM regions used for
> device DMA
>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  hw/remote/vfio-user-obj.c | 50 +++++++++++++++++++++++++++++++++++++++++=
++++++
>  hw/remote/trace-events    |  2 ++
>  2 files changed, 52 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--cUm9We+jwzcbOAW7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmE5t9kACgkQnKSrs4Gr
c8jI7Af/a9+YnXY+Oah2144qZH47Naxlq4MDyEwmXwfQ8L734xoh8PBGM8Kl3MCH
O48rPpA87ZwelVurwdB+tp2XidDQ2I8BAeNNK8rmFFJe70XV379ZA6GiamR1Jbii
hOZskVkf00RsNxlFMKghwUywkmwDs418Bev5djo58xvHWCxvDM7Zi1wa+WhLI7g5
wHYD0AQm/sUt7rr6x9QNBlKjlDJiyrU1x59XtGYHYUmXyxkRif8jmWSdI8d+WEKY
BwDkJMAdbw+7dCmcNYfzDhF2Tzn6jHN5w3KvJ62hYaYyAY5AILoWT3VZgvhWQdgR
XxTVpjaaP2d+/gHV+Qe0uyH3yrKVAQ==
=iqJs
-----END PGP SIGNATURE-----

--cUm9We+jwzcbOAW7--



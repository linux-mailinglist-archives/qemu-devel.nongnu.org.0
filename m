Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 329F92E08B5
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 11:24:43 +0100 (CET)
Received: from localhost ([::1]:34056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kreqQ-0004zj-2J
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 05:24:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1krep5-0004XS-5Z
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 05:23:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1krep2-0007h4-2y
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 05:23:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608632594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LXgeRxhHPBE7BBqAmpWm87/ettWk8J/4eDN4nRTenn0=;
 b=NsbRTMvE5UXS5Q8gBEksszE3TTUkv3zmx/jS6rDN30ZMbI4/1VDdIRr8zWj0nvtFd30/EE
 MuBXH0Rqc+sPU/N7DiseXKTVEBpYAfHNIBvPcAEX9D6TOhJZSigJw6qyN4Tbqre1A+vqwL
 PzwZ7tBWjHm8eNwfENzss+dOyRKF8iY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-QmqqfT0rNJyqG3lqC_XjoA-1; Tue, 22 Dec 2020 05:23:10 -0500
X-MC-Unique: QmqqfT0rNJyqG3lqC_XjoA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4327801AA5;
 Tue, 22 Dec 2020 10:23:08 +0000 (UTC)
Received: from localhost (ovpn-112-56.ams2.redhat.com [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B0CA6E703;
 Tue, 22 Dec 2020 10:22:58 +0000 (UTC)
Date: Tue, 22 Dec 2020 10:22:57 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: elena.ufimtseva@oracle.com
Subject: Re: [PATCH v14 RESEND 05/21] multi-process: Add config option for
 multi-process QEMU
Message-ID: <20201222102257.GA105660@stefanha-x1.localdomain>
References: <cover.1608263017.git.elena.ufimtseva@oracle.com>
 <2d3d49762902c17d62d27f0c65cc3eb60611e3c8.1608263018.git.elena.ufimtseva@oracle.com>
MIME-Version: 1.0
In-Reply-To: <2d3d49762902c17d62d27f0c65cc3eb60611e3c8.1608263018.git.elena.ufimtseva@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: fam@euphon.net, john.g.johnson@oracle.com, swapnil.ingle@nutanix.com,
 mst@redhat.com, qemu-devel@nongnu.org, kraxel@redhat.com, jag.raman@oracle.com,
 quintela@redhat.com, armbru@redhat.com, kanth.ghatraju@oracle.com,
 felipe@nutanix.com, thuth@redhat.com, ehabkost@redhat.com,
 konrad.wilk@oracle.com, dgilbert@redhat.com, alex.williamson@redhat.com,
 pbonzini@redhat.com, kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com,
 thanos.makatos@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 17, 2020 at 09:40:35PM -0800, elena.ufimtseva@oracle.com wrote:
> From: Jagannathan Raman <jag.raman@oracle.com>
>=20
> Add configuration options to enable or disable multiprocess QEMU code
>=20
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> ---
>  configure         | 10 ++++++++++
>  meson.build       |  2 ++
>  Kconfig.host      |  4 ++++
>  hw/Kconfig        |  1 +
>  hw/remote/Kconfig |  3 +++
>  5 files changed, 20 insertions(+)
>  create mode 100644 hw/remote/Kconfig

I checked that this works as expected with ./configure
--target-list=3Davr-softmmu. CONFIG_MULTIPROCESS is not set when building
for a target that lacks PCI.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/hyQEACgkQnKSrs4Gr
c8jYBQgArkyRQZA/GfJ5Z29nmZlqWNbhAE71MMmb8quNt25BRtN/2HJQ62j2Hlsw
zXjgxE8WQk3vh0Hc2fexvJwN0Vh7fzW0ktkOVZP6n0CdDxZIGfAyV7sg679CApTI
0tau1bRb35KvHGJ2eDD70PacIt4oOy5W/ReLEgclW+3aYGcOOtMl6n+3v8oI/NzU
hPWf+bpbvkzkeyLEy0rY3V0fpCVmTpTTtTVVxm7/6LmetQm0aZcjNHw8JdNHl9Yh
G3U2laXARFA5KUDu93MPuBISm1zYbubFj+neifUz4PQ0GgX4fHdG9LCKuKU2zs1p
JHD5ZKwvn37zRCrEgp5eGrpD9W6lnw==
=At3P
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--



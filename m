Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 593AB30DD1A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 15:43:13 +0100 (CET)
Received: from localhost ([::1]:38836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7JNA-0000mx-DO
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 09:43:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7JLb-0007uy-W1
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:41:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7JLX-00084C-5u
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:41:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612363289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ceoPkDRVVz/VUmDgeUFTd/vjyTzt3jDcQ3JnN9/5NIk=;
 b=fhe15ND8bg4vYIXV+fcCEAjt594wE+DQoOXBD43Lz1PNbgvmGgr4rN8uaUSG4u1SreHo9g
 3YtW4vMfdXhflnk9XEbNTuwhPLLdheQweW+/iiV7wJuuzyhSu03aqnsYSbA01sQSsGRoUN
 ieA+I/5f9hcAOt/gBqPuBqmfXHcxCjk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-wsbZ6UuDOr2NSZpeZsL0IA-1; Wed, 03 Feb 2021 09:41:26 -0500
X-MC-Unique: wsbZ6UuDOr2NSZpeZsL0IA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1276487A820;
 Wed,  3 Feb 2021 14:41:25 +0000 (UTC)
Received: from localhost (ovpn-115-141.ams2.redhat.com [10.36.115.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A7DB81001E73;
 Wed,  3 Feb 2021 14:41:21 +0000 (UTC)
Date: Wed, 3 Feb 2021 14:41:20 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH 1/1] virtiofsd: Allow to build it without the tools
Message-ID: <20210203144120.GD74271@stefanha-x1.localdomain>
References: <20210201211456.1133364-1-wainersm@redhat.com>
 <20210201211456.1133364-2-wainersm@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210201211456.1133364-2-wainersm@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9UV9rz0O2dU/yYYn"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pbonzini@redhat.com, misono.tomohiro@jp.fujitsu.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--9UV9rz0O2dU/yYYn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 01, 2021 at 06:14:56PM -0300, Wainer dos Santos Moschetta wrote=
:
> This changed the Meson build script to allow virtiofsd be built even
> though the tools build is disabled, thus honoring the --enable-virtiofsd
> option.
>=20
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
>  tools/meson.build | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--9UV9rz0O2dU/yYYn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAathAACgkQnKSrs4Gr
c8juQQf9EKhVHsj14kGk2lUj015iA8zdl19LMo9TPvVdA4PAFKnMshF32ModM4c1
Q7CNQV+7YOGBErAtR9jMH/RlVO5OAD9FBBjOJ7TbHXrkF66PICCy8RMoWZsA4gvr
DUjhyghlzJpqGoQih9mQWUpN1kk9IWrWoMqB7S0x2aOyl7vNj+FJSPoblJSCGdcZ
xo13W170KUG57Qi6gigcgpKdLW3ZB/psLPyVAaj9/f/dIZSO90GirDO2S2ctGiT5
kB63zZE/WLzAYWW7ato5ZOgNNvlVJ+DeXgFQCJM/G2/JYy3L+C6td84Swu0H5WRn
5gavkAMDi5xG86tZZM+Cz+XrjNpKqQ==
=FFmI
-----END PGP SIGNATURE-----

--9UV9rz0O2dU/yYYn--



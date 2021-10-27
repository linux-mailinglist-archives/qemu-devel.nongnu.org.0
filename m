Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0993443D191
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 21:21:27 +0200 (CEST)
Received: from localhost ([::1]:42176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfoUH-0002NU-Vk
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 15:21:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mfnjs-0006J7-5f
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:33:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mfnjq-00079I-4F
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:33:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635359605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/4CIqLvDSrnYSZ5eZAbRNqZh6TBEwu1KEi6y9F5NTR0=;
 b=atHqXgDBfcO5QyqscRGMFG3+VMrZVHo+45kTti+WTSHl88RwzhimN/K/Coy+p6xYRuz9Yw
 HzZzH/13iPYKBUf9lMe2/Rc04oh7gyhKq26QeAh97wv3UUjncpiKrxqjRMK/wnmXs5/Dm6
 kYX2VvvS6E+iwHHJeRiar416NHVzdDw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-21OCis5CNji2s3vXipvhgQ-1; Wed, 27 Oct 2021 14:33:20 -0400
X-MC-Unique: 21OCis5CNji2s3vXipvhgQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9E91362FB;
 Wed, 27 Oct 2021 18:33:18 +0000 (UTC)
Received: from localhost (unknown [10.39.195.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F5C25C1C5;
 Wed, 27 Oct 2021 18:33:18 +0000 (UTC)
Date: Wed, 27 Oct 2021 19:33:17 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v3 00/12] vfio-user server in QEMU
Message-ID: <YXmbbR0yRoDAJ6Q+@stefanha-x1.localdomain>
References: <cover.1633929457.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <cover.1633929457.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="alAcY/5oFkCu31sF"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, philmd@redhat.com,
 qemu-devel@nongnu.org, alex.williamson@redhat.com, marcandre.lureau@gmail.com,
 thanos.makatos@nutanix.com, pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--alAcY/5oFkCu31sF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 11, 2021 at 01:31:05AM -0400, Jagannathan Raman wrote:
> We have addressed most of comments from v2.
>=20
> We are working on MSI-x support (used by PCIe devices such as =E2=80=9Cnv=
me=E2=80=9D)
> and a couple of comments in the migration patches. We hope these two
> items will be in the next revision of the patches.

Please add an object-add vfio-user-server and object-del
vfio-user-server test case. The code is currently written in a way that
is incompatible with hotplug. Even if you don't need hotplug right away
it's worth implementing it immediately to avoid baking in assumptions
that will be hard to fix later.

Please try running the tests on a big-endian host, if possible. That may
help shake out remaining endianness issues.

Stefan

--alAcY/5oFkCu31sF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmF5m20ACgkQnKSrs4Gr
c8gVzwf7B0TPK5myMe/suvRSA3FO7ceuhsCA5+lMVESFMDpaQ+uKdI46jd+fI5RJ
9o2bhtpVOQuRNIvXipdCqnvzN9eyJN41hS0hcb8KNpsVJzQw9hUUVeahrvbEsZEw
ZRPr4iEAURv1wKn375+ByopWt+liGaxyzQpw8P8XL4GAL4WcoICRQ9iGzADbrAm/
c6UTz4+ohpgy/eJ2ll3yyP/MttAhHpHhFLzEcWXcEKM9vPfnjwBjiPsOz9N0GAWH
PKUeneYR2Yb83mCCZ8OmPjAnwPa3Jw1XhK+1ErQY11YdG8/wXrICv9mmW3f4UwcQ
o36Q8I/OINoGFofpFTe6qMX2BsbZpA==
=5R40
-----END PGP SIGNATURE-----

--alAcY/5oFkCu31sF--



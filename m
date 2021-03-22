Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AB134401E
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 12:48:00 +0100 (CET)
Received: from localhost ([::1]:50396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOJ2N-0005kR-Av
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 07:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lOJ0j-00055M-HU
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 07:46:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lOJ0h-0000J6-VJ
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 07:46:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616413575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RchyZ+z85qIFRPDWklF4q2suP1WsI1ttMpwCaXA2TJQ=;
 b=WQkwJwWRz7GzDR1POjK+y4N4xCc+/syZlOBLlxTPX9IPNWXIHnspNCz5P78mEga+XRPEKv
 3O3siZhxVspT5yoC8KmAaKCMyPiDpO1+S2CHbaCnD0c9vjtaznPVsq9RPElga72pLNwe7f
 O4pQClm6AzUWCezs9nYQSndFxgxZF4E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46--Rvbul47PZy5KHg-YzZt7Q-1; Mon, 22 Mar 2021 07:46:12 -0400
X-MC-Unique: -Rvbul47PZy5KHg-YzZt7Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7290C107ACCD;
 Mon, 22 Mar 2021 11:46:11 +0000 (UTC)
Received: from localhost (ovpn-114-89.ams2.redhat.com [10.36.114.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 02CCC5D9CD;
 Mon, 22 Mar 2021 11:46:10 +0000 (UTC)
Date: Mon, 22 Mar 2021 11:46:09 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v1 04/14] tools/virtiofsd: include --socket-group in help
Message-ID: <YFiDgdEM/Dmik2Kg@stefanha-x1.localdomain>
References: <20210320133706.21475-1-alex.bennee@linaro.org>
 <20210320133706.21475-5-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210320133706.21475-5-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MNFVknRZBb8QnQCc"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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
Cc: Connor Kuehl <ckuehl@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--MNFVknRZBb8QnQCc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 20, 2021 at 01:36:56PM +0000, Alex Benn=E9e wrote:
> I confused myself wandering if this had been merged by looking at the
> help output. It seems fuse_opt doesn't automagically add to help
> output so lets do it now.
>=20
> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
> Updates: f6698f2b03 ("tools/virtiofsd: add support for --socket-group")
> Message-Id: <20210318100911.16261-1-alex.bennee@linaro.org>
> ---
>  tools/virtiofsd/fuse_lowlevel.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--MNFVknRZBb8QnQCc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBYg4EACgkQnKSrs4Gr
c8gpDwgAvrrt74MkMoAXcoT8HV+k2czJO+1d01Ha5+42sPwyWkYPfEbBa/KNU2pE
phN0RhvchbwgO+LH8XgQk3KjUpsHtlrvZhzDSk1S7L/5o+8veNhMnKJU/6O5v95e
L1ueY4A0YDIwdYJhqhxLxxkfeB3c0ymTNeQaX8WduRu7MhXRbjSoFgpbzAmSL9UN
mXMWJgGTJeM5/GGOgXiJxPAteVWk3qY7QNCF3hv1HXyXiwukIhITt+r5zuV2TBIP
fa48sijU4bdJxHyWetUVZ9RToVn7gRjMqhwBCPktP7zhGRVfisVlN/4UlAD6Ypjl
Bu7Kapk9IqgoUt5eLgWMLxLwHP75Jw==
=2G4b
-----END PGP SIGNATURE-----

--MNFVknRZBb8QnQCc--



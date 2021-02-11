Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F519318FDC
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 17:26:24 +0100 (CET)
Received: from localhost ([::1]:49448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAEnO-0003w4-Vq
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 11:26:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lAEkF-0002Zw-Cp
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 11:23:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lAEkB-0005vu-LY
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 11:23:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613060582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jfOOaONr9mmrNgcFB61RRWDBE5OfeWdHwo6dHs1X1g4=;
 b=iY3G2zrc7za83DYKpkf0LOiJhjfbkH8sDoFP6h2bFH/1Kdx32/w82YnC4cDZeXjWEcBUks
 gTcYvuAfiPde7Jf8UHKBf4ln/EwYqiveD3crWIDmWRiYj4kWVPHGVlfCn98eyYkY44ut5D
 5Rcsb5xzXCUpYzhD+m7YFCK4Ii8X4iA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-S4g8vjSvN-eNfvG5IiT2pg-1; Thu, 11 Feb 2021 11:22:59 -0500
X-MC-Unique: S4g8vjSvN-eNfvG5IiT2pg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99A52835E2A;
 Thu, 11 Feb 2021 16:22:58 +0000 (UTC)
Received: from localhost (ovpn-115-9.ams2.redhat.com [10.36.115.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC31818A50;
 Thu, 11 Feb 2021 16:22:51 +0000 (UTC)
Date: Thu, 11 Feb 2021 16:22:50 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 2/2] block/null: Enable 'read-zeroes' mode by default
Message-ID: <20210211162250.GA259794@stefanha-x1.localdomain>
References: <20210211142656.3818078-1-philmd@redhat.com>
 <20210211142656.3818078-3-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210211142656.3818078-3-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xHFwDpU9dbj6ez1V"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 11, 2021 at 03:26:56PM +0100, Philippe Mathieu-Daud=E9 wrote:
> The null-co driver is meant for (performance) testing.
> By default, read operation does nothing, the provided buffer
> is not filled with zero values and its content is unchanged.
>=20
> This performance 'feature' becomes an issue from a security
> perspective.  For example, using the default null-co driver,
> buf[] is uninitialized, the blk_pread() call succeeds and we
> then access uninitialized memory:
>=20
>   static int guess_disk_lchs(BlockBackend *blk,
>                              int *pcylinders, int *pheads,
>                              int *psectors)
>   {
>       uint8_t buf[BDRV_SECTOR_SIZE];
>       ...
>=20
>       if (blk_pread(blk, 0, buf, BDRV_SECTOR_SIZE) < 0) {
>           return -1;
>       }
>       /* test msdos magic */
>       if (buf[510] !=3D 0x55 || buf[511] !=3D 0xaa) {
>           return -1;
>       }
>=20
> We could audit all the uninitialized buffers and the
> bdrv_co_preadv() handlers, but it is simpler to change the
> default of this testing driver. Performance tests will have
> to adapt and use 'null-co,read-zeroes=3Doff'.
>=20
> Suggested-by: Max Reitz <mreitz@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  block/null.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--xHFwDpU9dbj6ez1V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAlWdoACgkQnKSrs4Gr
c8gnwwgAraJaotA4QcljjOJWaFJxnSxKPGD3NT7wJu8B5f7Qr0PN5cpOVIwWp9nz
3IB4JY1Kv/XRiyj+LFXoYS5DQ0uzTSMaCbibOUNPg/i3YmC2zxly09bcdLT+sfA4
nuPHdFRkPY/3h+rRA9MqBgnnkoI5M3/Nr0ygYyHYZwgADicgJKk0X733gjlVC8iF
WDe0vrrhfuuAOQMtJpVMmZHQbqhkqpQHV8sugV2CCnX3SdpItZpMgEK/xyuE1HsM
Xn6l3bQq5XCw/hrReNu5JH5AdfykFthNf5eNnQMvpzfTJ47bO0eTHBc/vXsBWgYC
93agR5cljIR8J9UxwNrwV0KSUnoI5Q==
=YYDv
-----END PGP SIGNATURE-----

--xHFwDpU9dbj6ez1V--



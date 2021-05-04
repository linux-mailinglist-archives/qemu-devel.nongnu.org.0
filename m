Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6658372C93
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 16:55:35 +0200 (CEST)
Received: from localhost ([::1]:44074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldwSU-0000Ya-IO
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 10:55:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ldwRE-00006B-Fs
 for qemu-devel@nongnu.org; Tue, 04 May 2021 10:54:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ldwRC-0008GD-D6
 for qemu-devel@nongnu.org; Tue, 04 May 2021 10:54:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620140053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HhzWtbwcpxIjkWkqOs5lQYajSeUlmGqqHLVhwznR2a0=;
 b=a5euIxThFjYTc8xJm9Ta+exegdxXOsEmLo5tCMLrVj9mTWkMgCfkA9R5yuAVJj64pzvz6T
 k41lIYdEsCn7HJLEaQ+cVlJbUJYuCqXzObdDWPTF1LM71TOAANszetbhckBKOP1TApOwx+
 Q+NiKvZnOUXvhdNfChLUQYFGTPYCxo0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-Kvpn9LJPNhifOKYIK6gPJQ-1; Tue, 04 May 2021 10:54:10 -0400
X-MC-Unique: Kvpn9LJPNhifOKYIK6gPJQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42DBD1813145;
 Tue,  4 May 2021 14:54:09 +0000 (UTC)
Received: from localhost (ovpn-115-110.ams2.redhat.com [10.36.115.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 674A160C16;
 Tue,  4 May 2021 14:54:05 +0000 (UTC)
Date: Tue, 4 May 2021 15:54:04 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH v3 01/26] virtiofs: Fixup printf args
Message-ID: <YJFgDGYi93A27ZFa@stefanha-x1.localdomain>
References: <20210428110100.27757-1-dgilbert@redhat.com>
 <20210428110100.27757-2-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210428110100.27757-2-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4m2MJm0AwSkuqQK6"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org, vgoyal@redhat.com,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--4m2MJm0AwSkuqQK6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 28, 2021 at 12:00:35PM +0100, Dr. David Alan Gilbert (git) wrot=
e:
> @@ -3097,9 +3097,10 @@ static void lo_copy_file_range(fuse_req_t req, fus=
e_ino_t ino_in, off_t off_in,
> =20
>      fuse_log(FUSE_LOG_DEBUG,
>               "lo_copy_file_range(ino=3D%" PRIu64 "/fd=3D%d, "
> -             "off=3D%lu, ino=3D%" PRIu64 "/fd=3D%d, "
> -             "off=3D%lu, size=3D%zd, flags=3D0x%x)\n",
> -             ino_in, in_fd, off_in, ino_out, out_fd, off_out, len, flags=
);
> +             "off=3D%ju, ino=3D%" PRIu64 "/fd=3D%d, "
> +             "off=3D%ju, size=3D%zd, flags=3D0x%x)\n",
> +             ino_in, in_fd, (intmax_t)off_in,
> +             ino_out, out_fd, (intmax_t)off_out, len, flags);

The rest of the patch used uint64_t. Why intmax_t here?

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--4m2MJm0AwSkuqQK6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCRYAwACgkQnKSrs4Gr
c8jNoAgAjuZja+sEpmXicpAP4B9/6+799vxYU2fb0N9OAXC8T0P4ZIsHLnEqFiwz
GUnjXeSa546UGaG8RGOeqBnvmTfE2sPVOOVLckFyvsCAPxR/DVP+F649u7xSwZeY
mbmuHAxX0cGViOjTwsICFizW0/Ter8NwuUZQbQF6dgqmhdGwDFlBmAng36jM83Zb
YpcDVVIJLWxS5I6ms44xquyDwnKG3WM+Ktc/c/YguVp7qrGkJ9xxFVDBukIt0XO5
qoqytqKr1aklj3OiL+5vMU7N6XKON6Ea/9JpdbwF6nyINKaHSbimTeeLOtXA3KFO
AC+TRheE6Z9L25hpvp2mT61CxlSUrg==
=9pnz
-----END PGP SIGNATURE-----

--4m2MJm0AwSkuqQK6--



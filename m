Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 596862B0AF3
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 18:08:23 +0100 (CET)
Received: from localhost ([::1]:53250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdG58-0001df-EQ
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 12:08:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kdG3S-0000Iy-U1
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 12:06:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kdG3P-0007Fd-1I
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 12:06:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605200794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IKZtCr8BnVuW0PpUcFxLu7blBUFqdrDoJTyxlixuuUs=;
 b=Ce1Jjmi36qkL8icCyW/rAMpQqIqQI/im/OuUMtw+9Fii7Ody+0Dd2GmkjLd3aYYf3Zw3QV
 S+Uwom7lygBU+2ieR2BabZsr+/wIP+/eTAw4kgsbus0+QXnY1i6ghAbNTUzrEednnz0W25
 N4hiSZ+umYFIOM/PCP4joz90VKZmdFg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-EijcsEYAPsOfKEVKy7a5Ow-1; Thu, 12 Nov 2020 12:06:29 -0500
X-MC-Unique: EijcsEYAPsOfKEVKy7a5Ow-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3CF8280B733;
 Thu, 12 Nov 2020 17:06:28 +0000 (UTC)
Received: from localhost (ovpn-115-122.ams2.redhat.com [10.36.115.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB6B919C59;
 Thu, 12 Nov 2020 17:06:24 +0000 (UTC)
Date: Thu, 12 Nov 2020 17:06:23 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-5.2? v5 0/2] ci: Move trace backend tests across to
 gitlab
Message-ID: <20201112170623.GD1555653@stefanha-x1.localdomain>
References: <20201111121234.3246812-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201111121234.3246812-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="J5MfuwkIyy7RmF4Q"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 00:52:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--J5MfuwkIyy7RmF4Q
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2020 at 01:12:32PM +0100, Philippe Mathieu-Daud=E9 wrote:
> Extracted from "ci: Move various jobs from Travis to GitLab CI":
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg758314.html
>=20
> v5:
> - addressed Wainer's review comment
>=20
> Philippe Mathieu-Daud=E9 (2):
>   tests/docker: Install liblttng-ust-dev package in Ubuntu 20.04 image
>   gitlab-ci: Move trace backend tests across to gitlab
>=20
>  .gitlab-ci.yml                             | 18 ++++++++++++++++++
>  .travis.yml                                | 19 -------------------
>  tests/docker/dockerfiles/ubuntu2004.docker |  1 +
>  3 files changed, 19 insertions(+), 19 deletions(-)
>=20
> --=20
> 2.26.2
>=20
>=20

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--J5MfuwkIyy7RmF4Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+ta48ACgkQnKSrs4Gr
c8j75AgAmdbK5GcynBRq5F4tXiaItN4usDg+ySA+7f2q7qhwdSquxWYspMZcDfVw
xeqiTmUEi9U2K9OqI4sPxbnDC486a+NzPcmB4iRaEX1cwBo4mzK5BDANMOgGzFZk
u7Q6RoYrfpNKav0+c6jdd5SXTP6C7BzILyD8PZNVjpAHDoV/etZYuXEaWkXS37nf
yxA+LhbcS/C5bvqtfm+EbbEnNHipTDXxEylRe5YMFDRT8fppYsv8Y7qMBTS+a1gm
PpVPB5TeHCJMX8+CJMuFPVEMZY8BcGZuuvwFhf8gGKZaRrPqgLN0bjpsXVjSmQcs
Yp8nd4Szl3v4G6sH0vOqDmxdwaY5pg==
=49H9
-----END PGP SIGNATURE-----

--J5MfuwkIyy7RmF4Q--



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C60BE368066
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 14:28:00 +0200 (CEST)
Received: from localhost ([::1]:46940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZYR5-00076x-Ue
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 08:27:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lZYLc-0003Tc-Rr
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 08:22:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lZYLZ-00008w-S9
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 08:22:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619094137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Add4HK3K8hQQmTFmfx6fSzYYqfO+C1dCEAU2CC/5ryY=;
 b=dmmUBtPdm2428tlcYuAN6cg0ZObw8PWnlRkEWhOurLHy38Ow4dBqAF2SUaoVnClg7LjnS2
 jRE47xuu7yEGPRYVlYUJjFR96gJO6LOwyNE5rrhEzfSAhE53RvmZT2ArTv/Ik5c0eVf+gb
 nZ6rrR70541ToyWAx0QXkC4jLTiuB2w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-MvcHKOVXMpm4EYoDrug24A-1; Thu, 22 Apr 2021 08:22:15 -0400
X-MC-Unique: MvcHKOVXMpm4EYoDrug24A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 048F110C40CA;
 Thu, 22 Apr 2021 12:22:14 +0000 (UTC)
Received: from localhost (ovpn-112-237.rdu2.redhat.com [10.10.112.237])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C70886091B;
 Thu, 22 Apr 2021 12:22:10 +0000 (UTC)
Date: Thu, 22 Apr 2021 08:12:42 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v2 4/7] tests/acceptance: Tagging tests with "cpu:VALUE"
Message-ID: <20210422121242.GE2153290@amachine.somewhere>
References: <20210408195237.3489296-1-wainersm@redhat.com>
 <20210408195237.3489296-5-wainersm@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210408195237.3489296-5-wainersm@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hwvH6HDNit2nSK4j"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
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
Cc: wrampazz@redhat.com, alex.bennee@linaro.org, qemu-devel@nongnu.org,
 pavel.dovgaluk@ispras.ru, pbonzini@redhat.com, philmd@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--hwvH6HDNit2nSK4j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 08, 2021 at 04:52:34PM -0300, Wainer dos Santos Moschetta wrote=
:
> The existing tests which are passing "-cpu VALUE" argument to the vm obje=
ct
> are now properly "cpu:VALUE" tagged, so letting the avocado_qemu framewor=
k to
> handle that automatically.
>=20
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
>  tests/acceptance/boot_linux_console.py   | 16 +++++++++-------
>  tests/acceptance/pc_cpu_hotplug_props.py |  2 +-
>  tests/acceptance/replay_kernel.py        |  9 ++++++---
>  tests/acceptance/virtio-gpu.py           |  4 ++--
>  4 files changed, 18 insertions(+), 13 deletions(-)
>

Reviewed-by: Cleber Rosa <crosa@redhat.com>

--hwvH6HDNit2nSK4j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmCBaDoACgkQZX6NM6Xy
CfN9gxAA0Lq/UCrlXWjAGKx5bTAdxJ2iDtBrQuVi2ev+Z/FGy/HQHY5D9evixz24
ng3DcDoc/9nIuADQ6mhrmwTErltS6W4Ytrgcgjy2ljH+yxK26i94hGlzKpoNjRhe
5NhWUm+39Ydyy8RglRNt0zxVwQwuC2DyINl2YWAEoSkHnQHhqFN4mFNd09AXRvOP
+dVtH20sSsVd8Lq/pwHBSvqPP/TK3UYsn8ddd5tty2uNBGgHTJjdZFgDLkHIRPxd
LC0h4o/p9t69m2PEBwXCzOp54n8zW2pVedRMgYPvUcjjcFoTkSqygiknR8ystVHB
5KS7QDxIB9UvuDnnXywEQMI5kYhYBohinY0WhcCZTU8iZ1Eyu+VCKFq6Opm2d4xd
JxZUs2jrtzHSCvoKzqwyaCn0rIwIzRIoUU00aL9xKPG3e6xHw4H8hWgcun15ATv0
TzlxrUUiSyW6H6pUH0I8xJzL6gpzOTWk0rc/S9joqqNq1kKr2mOiPX8KMeKqamlf
dBJBDiLcTSzA3CisX4dLfWMwqUvHIU/7ktlrDzf5NStzq8a3iCDjEGBowexpIurO
sPdk6VrDxcFIV8LRp4LE8wBq0X6i4TfTXv0BRK+6CePLu4mKp7b428RNVWcHMhnS
Xq3BohZm6JwXVZ2t/TzYSgssyv0qKNRtP4pc43u8/gj5l5D+buk=
=osRw
-----END PGP SIGNATURE-----

--hwvH6HDNit2nSK4j--



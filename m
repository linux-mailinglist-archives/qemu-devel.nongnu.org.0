Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D9531C5BF
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 04:13:46 +0100 (CET)
Received: from localhost ([::1]:54286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBqo5-0002tG-FI
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 22:13:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lBqnL-0002TB-Nw
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 22:12:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lBqnI-0001oY-Qd
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 22:12:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613445174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e/oAnZQLzATntkEYl/XB/SL3TaW4fQ8PVB+3k/bfzP4=;
 b=K6J2r0/Ix1eW3dd7rRa3YPC8U9Pm6Jg/yS09tC28oaom/k6pftQrUYlU+MJnePwG+porjI
 gM/nP1s/G8FXgeQti9p5ourj+l/n3JM85GWXKNxxvk5zKo/UujbBPtDnXfDm7DNH9z80Bw
 YxOWHeM5spc1ch3vQnk5xp48zWKD0gs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-fDgHyLxEO9aiCKLaea-cTA-1; Mon, 15 Feb 2021 22:12:52 -0500
X-MC-Unique: fDgHyLxEO9aiCKLaea-cTA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 537ED107ACE6
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 03:12:51 +0000 (UTC)
Received: from localhost.localdomain (ovpn-2-24.rdu2.redhat.com [10.22.2.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A87F0614ED;
 Tue, 16 Feb 2021 03:12:50 +0000 (UTC)
Date: Mon, 15 Feb 2021 22:12:48 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH] maint: Tell git that *.py files should use python diff
 hunks
Message-ID: <YCs4MOgAhMUHeM0Y@localhost.localdomain>
References: <20210215222524.1820223-1-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210215222524.1820223-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5ZfK+26Zutxl77up"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=crosa@redhat.com;
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--5ZfK+26Zutxl77up
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 15, 2021 at 04:25:24PM -0600, Eric Blake wrote:
> Git's default hunk pattern recognizer favors the C language, but it
> also includes several built-in diff styles that give saner results in
> other languages.  In particular, telling git to treat all .py files as
> python changes the beginning of diff hunks as follows:
>=20
> |  --- a/python/qemu/machine.py
> |  +++ b/python/qemu/machine.py
> | -@@ -337,12 +337,12 @@ class QEMUMachine:
> | +@@ -337,12 +337,12 @@ def _post_shutdown(self) -> None:
> |               self._qmp.close()
>=20
> which makes it much easier to tell what function a patch is touching,
> rather than a non-descript listing of what class contains the changes.
>=20
> Sadly, our python files that don't use .py suffix (such as numerous
> iotests) do not benefit from this glob.
>=20
> Reported-by: John Snow <jsnow@redhat.com>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  .gitattributes | 1 +
>  1 file changed, 1 insertion(+)
>

Cool stuff!  I'm queueing this, if you don't mind.

Reviewed-by: Cleber Rosa <crosa@redhat.com>

--5ZfK+26Zutxl77up
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmArODAACgkQZX6NM6Xy
CfMM1A/+MyFdNnYbjL0v1Wb+eDYE5E+qrQrintAJwAe4KXRA5AaQN3CjgZE+VUR6
JUcfsO2l/GpwOHvuXhIXz3Lm+L00xlROyPeZJHzpBX3Ingp4gcUssPTP5LHLBZQy
b0jepT+NHm1ZvaqdsjjMXvsxVoyYeDEAjKYMCpQJvUWFUdqUOhmNLd8MZ+dy7EBp
1SufKiU+jW+U85mhr7PrbigHbZxC6KBbm1IzK2vjGDE2iAg2BHWhpjLhg/YFPwVA
XFoHuV0yYT5bXf05DYxD3+qmcVPZ8VWatISJ2rh6oN5kbq2HBM+2t6QKfsjAg350
L/smJSoypVn+qq1I4AUaxkbN6pT27P5FesD88cT5ATeViOJ3dz9WSvDzoHqE/Hw+
lxHimGnQAP+ii/205CatcUKImIG/tCxR2HQ5y6bx094GHA6bTa20C0hBW2zMN2ci
glumjHiSkfhMjRhOM/BUEBSFXOtLdG74QSsZY54Jl/Tc4Ncqsxgri9xA6v55lGVQ
m42/TT2/1YEvDNLzMg+cswWXeGzVZEdqGpglfL3/Pv65qp1e/6oONZXTC1+tkPss
vhgPjJ7hI8baOr0Gh3GwTPmelQenJc7GgIJtiwvvbuDhlag/iP7EFzVU8nfBm9oQ
d20ouVc3TYzazknJOOtrTaaslFzg2vKR/8G7GrjaI9uy5UaS+FY=
=b4Nl
-----END PGP SIGNATURE-----

--5ZfK+26Zutxl77up--



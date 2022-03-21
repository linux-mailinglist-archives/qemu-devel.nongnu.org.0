Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE304E27F8
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 14:43:24 +0100 (CET)
Received: from localhost ([::1]:58878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWIJf-0003SJ-Un
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 09:43:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nWIHm-00024p-44
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 09:41:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nWIHg-0003mI-WE
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 09:41:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647870079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vqhTQNtZ+zE39aMYGSpINd+7X/eDhGZdDVSIlvJgeYg=;
 b=M7tHmZKATELLqbPYo2IbhoSeZsOr3gs1sh1rpFb1ssS1uzsAE8TBzJhJw1LFxQiyyF7zRo
 kU3co0EA+WsR+hi+WV3qW2+QRNN1h7bG9FziRZGfoeh0uo0k177umi0kQJ9z4eikWAfLaR
 fX4WIy0oyeckhKEUpRPIJo41GEsmqAk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-580-ioVAhfIMNP2NYpsKgFh98w-1; Mon, 21 Mar 2022 09:41:17 -0400
X-MC-Unique: ioVAhfIMNP2NYpsKgFh98w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 250AA3803910;
 Mon, 21 Mar 2022 13:41:17 +0000 (UTC)
Received: from localhost (unknown [10.39.193.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9567C40C1241;
 Mon, 21 Mar 2022 13:41:15 +0000 (UTC)
Date: Mon, 21 Mar 2022 13:41:14 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PULL for-7.0 1/2] aio-posix: fix build failure io_uring 2.2
Message-ID: <YjiAekZ6ZgHBG0Cy@stefanha-x1.localdomain>
References: <20220317165743.238662-1-stefanha@redhat.com>
 <20220317165743.238662-2-stefanha@redhat.com>
 <YjNsbJcTkoxdPE4P@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fsj42Iil16BFwtU7"
Content-Disposition: inline
In-Reply-To: <YjNsbJcTkoxdPE4P@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Haiyue Wang <haiyue.wang@intel.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--fsj42Iil16BFwtU7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 17, 2022 at 05:14:20PM +0000, Daniel P. Berrang=E9 wrote:
> On Thu, Mar 17, 2022 at 04:57:42PM +0000, Stefan Hajnoczi wrote:
> > From: Haiyue Wang <haiyue.wang@intel.com>
> >=20
> > The io_uring fixed "Don't truncate addr fields to 32-bit on 32-bit":
> > https://git.kernel.dk/cgit/liburing/commit/?id=3Dd84c29b19ed0b130000619=
cff40141bb1fc3615b
>=20
> Ewww, that changes the public ABI of the library on 32-bit
> platforms, but failed to bump the soname version, except....
>=20
> ...investigating this I noticed a further change that happend
> a few weeks earlier in liburing that actually dropped the
> version from the soname entirely making it an unversioned
> library.
>=20
> This is the current shipping 2.1 version:
>=20
> $ eu-readelf -a liburing.so.2.0.0  | grep SONAME
>   SONAME            Library soname: [liburing.so.2]
>=20
> and in git master:
>=20
> $ eu-readelf -a src/liburing.so.2.2 | grep SONA
>   SONAME            Library soname: [liburing.so]
>=20
> Surely that's a mistake.
>=20
> After the ABI incompatibility above, I would have expected
> it to bump to liburing.so.3=20

Thanks, I have sent a liburing patch to fix the soname.

Stefan

--fsj42Iil16BFwtU7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmI4gHoACgkQnKSrs4Gr
c8h3ewf+KdkMrJgfgfC0ojYArUYNy6FjGdxA1v9r6axMq9ZhcsJUtG2052r98Jdh
q1Bfdh3gnryEiwh3KK2ZaVQgE2wJBDzcaQVkSARsSxUx5mLhrBblpGg0y94ZNVbI
xW9UtlP3SeAm+QDI3OvOBqD3UBABg/I4EnuaKk+T3pmIbO/nLWSWTTAcMnQ5D3aB
yynIDataUlIgXR75vsH4JCuNOX5rlMK1akztx2+UUem2veolDLo/iSeRBT5rWvHV
5vom+yVXAY/syUvpOWIMCbZxzS0G1wHaHz7ZFbrRhFJt2KkDxr4hLvRVyZzd1HXi
qfD+OBiWJMd0/FFvAxEkkoq0f6nyVg==
=V6uu
-----END PGP SIGNATURE-----

--fsj42Iil16BFwtU7--



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7FF31EB66
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 16:18:09 +0100 (CET)
Received: from localhost ([::1]:46598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCl4C-0007DF-Vg
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 10:18:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lCl1u-0005fl-OX
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 10:15:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lCl1s-0007YF-Cf
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 10:15:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613661343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hdBF8OBirgPbspYnaG5GA5tWKPIadlNyyNrXBvpWLb0=;
 b=BNazmg4lVNt6elsnrZYnXYM6arRuV3aMT7LkxbkZZjCOzR4UQ76Ogc2tLbg6cDG3RkjLwr
 JWmjEqNLfL6RSg+uMKHCemHl7GOCqpRUp/Z9kJ0ZIFdf0nZcAM60vucmRVd1M2fRCTca72
 QYjVMGP5W64to/IQq0CDJ7eK/qGcmfk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-m8pRphbRNZyoQTqxE2nwVg-1; Thu, 18 Feb 2021 10:15:39 -0500
X-MC-Unique: m8pRphbRNZyoQTqxE2nwVg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44F53192D7BA;
 Thu, 18 Feb 2021 15:15:36 +0000 (UTC)
Received: from localhost.localdomain (ovpn-114-28.rdu2.redhat.com
 [10.10.114.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 18FC067CC2;
 Thu, 18 Feb 2021 15:15:30 +0000 (UTC)
Date: Thu, 18 Feb 2021 10:15:28 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH  v2 7/7] tests/avocado: add boot_xen tests
Message-ID: <20210218151528.GA433029@localhost.localdomain>
References: <20210211171945.18313-1-alex.bennee@linaro.org>
 <20210211171945.18313-8-alex.bennee@linaro.org>
 <20210217204654.GA353754@localhost.localdomain>
 <87sg5us58c.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87sg5us58c.fsf@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
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
Cc: julien@xen.org, andre.przywara@arm.com, stefano.stabellini@linaro.org,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 xen-devel@lists.xenproject.org, stefano.stabellini@xilinx.com,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 17, 2021 at 10:22:50PM +0000, Alex Benn=E9e wrote:
>=20
> I think the solution is to use archive links here. There is a snapshot
> archive of sid (we've used it in the past) but I suspect there isn't an
> archive of old stable packages for a reason.
>

If the packages you need are available on archives (which I wasn't
aware of), then without a doubt it is the best solution.

I assume you're going to look into that (I'll keep an eye on the list
about it).

Regards,
- Cleber.

--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmAuhI0ACgkQZX6NM6Xy
CfP2Aw//cvewBBcbcAWjx/pOHRnaVZW8kOlzWmOLN3LYxwQWqbyN+s2735/dCRHb
VD2uZYIawq4T0bWTf/cOC77oT8YG3rRqwFWVM4lFayUqhJcBDyi+7RM+SLmQZbdg
M/4EiHzQc3ocPyUt9ZNVcvU0GHQbEefOobG8aK4s6+y3BPjdsoCPLWT6vqtctcyH
eGi2URX1WLWkCqCrYtgrWdm51jcFU59vtbrIqdR5KOaB0G676LdbCR94g6NWPeN9
9c7g3h10/C4z6KvSFUYRXWXuKYQjSLpYyDn1xMDWMJ+M/3oOf8Zmmd7U7lP9iOxA
p38MRhY+rdqPWmphvHcvwuWkIeq3gZlKc3RkVIw05Q7g92XNMZCjb03GJ3DxX+Ka
Mn9F+zTduy2/v7PhahbC+4xCzm2JBg9VAdvvAgXPddSCV5KsaqQbQ4BoZH/ik7EP
hy7055UxhwQI3giXbSu9drgJZ4NDKM12GRpcB83+SYp13ctu0o81Nei/XL7lEcC3
4/nBh8yEw4t5GlroU4L3Y0Agodmf6qvg7ejaS7EeJZ6kDnqn5Z3whz+l5UTzu/vr
81ekZ6kVaMjW9eFF6vyo4MgfPxTAh/LSYz5crvN/Ocu1zg8dGCGBDvDsQimHU24M
0gG3uhrdAxH7U3KYGy7wYYZJebQpQre8idUNBq6xZJSnipYswiI=
=oUm8
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98808392E0B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 14:33:53 +0200 (CEST)
Received: from localhost ([::1]:49462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmFCs-0002Jk-P7
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 08:33:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lmE5i-000732-32
 for qemu-devel@nongnu.org; Thu, 27 May 2021 07:22:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lmE5P-0002rS-VA
 for qemu-devel@nongnu.org; Thu, 27 May 2021 07:22:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622114505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AOQT7u6VGgMkUYTpedeZftNIORgZv1owjZwEVMCPBbI=;
 b=PqVjtuph6PVORZPeiQyH7M/MgdW1oQGE3iXb6IKsvY852emZ0a6xsmcqIq4hATE7k352RK
 u7kYzeuL2y0+2+v1yhpKuSiu/x95IDe61E/DdN/TyMnTkaNlciGw7E6/Kw4sB1k72PHWvT
 9kyHPMflCF640Capj4jZ3Zu8ZgPyYsw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-9wFGisghPuOz23k9i7SGmg-1; Thu, 27 May 2021 07:21:41 -0400
X-MC-Unique: 9wFGisghPuOz23k9i7SGmg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFBAB8CC2E0;
 Thu, 27 May 2021 11:21:39 +0000 (UTC)
Received: from localhost (unknown [10.33.36.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76D1E1754A;
 Thu, 27 May 2021 11:21:36 +0000 (UTC)
Date: Thu, 27 May 2021 13:21:35 +0200
From: Sergio Lopez <slp@redhat.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v8 18/19] arm: Enable Windows 10 trusted SMCCC boot call
Message-ID: <20210527112135.ukbzkesv2v3ir2yn@mhamilton>
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-19-agraf@csgraf.de>
MIME-Version: 1.0
In-Reply-To: <20210519202253.76782-19-agraf@csgraf.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zb77akzoqqnvmvu5"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--zb77akzoqqnvmvu5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 19, 2021 at 10:22:52PM +0200, Alexander Graf wrote:
> Windows 10 calls an SMCCC call via SMC unconditionally on boot. It lives
> in the trusted application call number space, but its purpose is unknown.
>=20
> In our current SMC implementation, we inject a UDEF for unknown SMC calls=
,
> including this one. However, Windows breaks on boot when we do this. Inst=
ead,
> let's return an error code.
>=20
> With this and -M virt,virtualization=3Don I can successfully boot the cur=
rent
> Windows 10 Insider Preview in TCG.
>=20
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> ---
>  target/arm/kvm-consts.h | 2 ++
>  target/arm/psci.c       | 2 ++
>  2 files changed, 4 insertions(+)

Reviewed-by: Sergio Lopez <slp@redhat.com>

--zb77akzoqqnvmvu5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAmCvgL4ACgkQ9GknjS8M
AjUxvRAAtzgzfE/2uFnZeMNjFvVU00l8EssqQmOSR5x4sj2rA75PxseFzdeswbct
zyVkLQ5w4Xti67TdtLOlr26b32NPlhmyxmTMHKDsB72WCTc6ftgOhgHDvo+v2TBR
Y/oRA6VNNHiVDOAtcpV+pKz7fqCbOP4UURjLYSwpUEZXWcB2MizDtKj5u2E7nopL
LZmzVulTVs/ORf1Q9h9BkoLdk2Xc04CJsIKC1r9hIpIKad5QMWYwDRLn/ywxjXCM
kBvylTbjlruS06uZKu4bhwBFI4jCYmcdZiexqokIlh3goUA1209HJ+ns8sT2PdB/
PGVjJuzm1HDpPsrlCbxjGpR/HF+U3CDyf0gWFq6O1Y3qa7geEzT0eLHpRai3jj2M
QRkMKhzxUC1ILTQmuxpCaQGTqVCFjMbPsEHemr8Fu7bGv5jz6QuXdLRjtXYjTlZ9
Ef3i08PYXE4L1RKBOta02AEUxMUcX7Cbo2yVMahbmee0tP2egYM7clLSsALn1wqH
kdXMO6lcNDvOpa+sYKyLiaCVYjdHj4FvVkx8DXfFGIDhAL9Fa99AXRXP9m+k2mEH
OJ3Rls3Q7+3l8JcLjmpfQZ/FAmnlEqbua+mwrAsX1Kqp3H5B6P0q+ZSY8Y9xA6sW
5dta1oQJkhvvJkYfHP9gWp0+ZIuTzSWBhTAOjWlvgz2En3QcnGQ=
=IXoh
-----END PGP SIGNATURE-----

--zb77akzoqqnvmvu5--



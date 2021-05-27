Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9DD392BC7
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 12:27:04 +0200 (CEST)
Received: from localhost ([::1]:52044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmDEF-0007JZ-3Y
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 06:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lmD4H-00037C-0f
 for qemu-devel@nongnu.org; Thu, 27 May 2021 06:16:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lmD4B-0000Sw-71
 for qemu-devel@nongnu.org; Thu, 27 May 2021 06:16:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622110598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=29B2evyaT2G1C30QpgbVusvEWHprTYqUWegnz1baNFA=;
 b=SYQeZcNqMrRHa2kT8UAacosqy3mvbIbbDuG4gK/u2FFnvfIbK+1Phq+EGCON6bbA6fJW1J
 Y2F/JGZtKuq6gxZU9z0u/KYXIgR+W4CTq3HUVv66/6Kd7QMWVsDjVIOTV28cCbg+/p8BkX
 uqjcyiH3eqyji5pv5Ln4NFoGhL1zUf4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342--rid3iLqNRCrKTX_ekXGIg-1; Thu, 27 May 2021 06:16:34 -0400
X-MC-Unique: -rid3iLqNRCrKTX_ekXGIg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 184AB180FD66;
 Thu, 27 May 2021 10:16:33 +0000 (UTC)
Received: from localhost (unknown [10.33.36.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A7D122E175;
 Thu, 27 May 2021 10:16:32 +0000 (UTC)
Date: Thu, 27 May 2021 12:16:31 +0200
From: Sergio Lopez <slp@redhat.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v8 10/19] hvf: Remove hvf-accel-ops.h
Message-ID: <20210527101631.qz6h7vhcetof2az7@mhamilton>
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-11-agraf@csgraf.de>
MIME-Version: 1.0
In-Reply-To: <20210519202253.76782-11-agraf@csgraf.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6ffluegipbrstcsw"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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

--6ffluegipbrstcsw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 19, 2021 at 10:22:44PM +0200, Alexander Graf wrote:
> We can move the definition of hvf_vcpu_exec() into our internal
> hvf header, obsoleting the need for hvf-accel-ops.h.
>=20
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> ---
>  accel/hvf/hvf-accel-ops.c |  2 --
>  accel/hvf/hvf-accel-ops.h | 17 -----------------
>  include/sysemu/hvf_int.h  |  1 +
>  target/i386/hvf/hvf.c     |  2 --
>  4 files changed, 1 insertion(+), 21 deletions(-)
>  delete mode 100644 accel/hvf/hvf-accel-ops.h

Reviewed-by: Sergio Lopez <slp@redhat.com>

--6ffluegipbrstcsw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAmCvcX4ACgkQ9GknjS8M
AjXiEg//Yz7sOVMRMvvjyumvGCCtojCzr/s2oodfiRAFK3vtgWjpZq4poedweixi
dVj6DbcYlgQtjpdlK8B4WqwJu+FovoadhS4uwdnE8Si/g/OacxDRF1Uw1SXqfocu
PFnJ30yuLCFAH0EiyUviuvsLJLHflcOdLiQnZ+PsSciq7xIb4qJdo7ljJ+0XM2ra
Cuc8NVap3I/P25zyNjRa2419c7rCAZwEuNiVioRQ2iRW9zO8V0x9+Kt/RT6iqagq
SZOlPlITc6bLBJ2OkF0fzrF3nYLL+C731tTBbl+9XFUkyLmSOu4Rt8kiOG2DoYbT
yYFSbPi/q6Q0wihOkH22c5iksHXR51hdpZ/3EcI6K/jjDHTRWXsDb5iMUVe5snUA
LjqQbfMuO3cn58S+8spTTFccSJ/C0U307pFwqGZYdIlFX++ysGip4bnQmIKqtTAF
ahjRheim8q7WzCs96uG7A8a1DOQ4H/+c6qUeYq3Dsf3XT3hYpnkQEKeG2r9iX1gy
M4bHpQslStE5ihss71oVxe8TYyDsUQUEcfwQVfvOeGQSL+8D+ibC448LUyey1mfr
HA2cxqS7utc3Em7bTFDcQ+ufbjX+5/SonC5mIG8qEm92Xo1RAieqrtYX8pNkamsK
zf1he9EMMgIWa17lntKfgrsA8QfH4EnxLn4kyCjXE9d1XigeCCQ=
=OWBF
-----END PGP SIGNATURE-----

--6ffluegipbrstcsw--



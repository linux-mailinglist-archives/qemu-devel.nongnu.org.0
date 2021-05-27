Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 814B6392BFD
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 12:39:32 +0200 (CEST)
Received: from localhost ([::1]:37048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmDQJ-00007x-6o
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 06:39:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lmD2u-0002Vq-FV
 for qemu-devel@nongnu.org; Thu, 27 May 2021 06:15:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lmD2i-00088K-5C
 for qemu-devel@nongnu.org; Thu, 27 May 2021 06:15:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622110507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KjwB92f2CMT8BZES5oGOzNTRPaGE4H/yaBX699nCcJo=;
 b=gaxgHD5fs0RLe9kQlwYbLdQDhsKp94wkIpQ4PwGezpvjhehvayIXzAfpJgVmZ2BjqsfkGM
 Plztx+cVzyuwY+ojamA9Ll1UUsNhSKjU9ETvOdXnPr0Ijqk0b5wwYK8mVH9Dz4hCV2C4xn
 g7kSPfG+06orXFyE58vw/bLgI4A+fyM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-sTlFy-m1PNavsurmYufgPw-1; Thu, 27 May 2021 06:15:03 -0400
X-MC-Unique: sTlFy-m1PNavsurmYufgPw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE6761007477;
 Thu, 27 May 2021 10:15:01 +0000 (UTC)
Received: from localhost (unknown [10.33.36.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 60FFD69FB5;
 Thu, 27 May 2021 10:15:01 +0000 (UTC)
Date: Thu, 27 May 2021 12:15:00 +0200
From: Sergio Lopez <slp@redhat.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v8 08/19] hvf: Use cpu_synchronize_state()
Message-ID: <20210527101500.l4nhdpysi25coxqi@mhamilton>
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-9-agraf@csgraf.de>
MIME-Version: 1.0
In-Reply-To: <20210519202253.76782-9-agraf@csgraf.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tmhoscrdbp4qigij"
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

--tmhoscrdbp4qigij
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 19, 2021 at 10:22:42PM +0200, Alexander Graf wrote:
> There is no reason to call the hvf specific hvf_cpu_synchronize_state()
> when we can just use the generic cpu_synchronize_state() instead. This
> allows us to have less dependency on internal function definitions and
> allows us to make hvf_cpu_synchronize_state() static.
>=20
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> ---
>  accel/hvf/hvf-accel-ops.c | 2 +-
>  accel/hvf/hvf-accel-ops.h | 1 -
>  target/i386/hvf/x86hvf.c  | 9 ++++-----
>  3 files changed, 5 insertions(+), 7 deletions(-)

Reviewed-by: Sergio Lopez <slp@redhat.com>

--tmhoscrdbp4qigij
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAmCvcSMACgkQ9GknjS8M
AjXAOA/8D5VjT2dHpL3EHeHPTifUpcVaO4UaAMRI92wMAXdez5hZ8EL5Qvy1jvc8
Kf38tqQKcoFE80UKBoBIBRLH7LnU+6yJ3SoyD6irsZo7/zjQZFfY5Riiv44kNx0k
0UekwrpM8ZyBY6WRErL+N6JOq43PxOC7qrWRJHIA/HuSlkt67bwjcdUy0O9F1LWf
F+TCPmpfUEJTWsPOLGf1QkhmajFSehv7b+PZyRn9EO1Q4MxHAW/Agi4gAJK3CuZU
AbMcIhFvA19LveWJDrBs2ADvCVefPa79ccs+DvgW3td0rbNTnDrdNXKNIJe22Ydk
FW2541PdOnX9+IBpOWK9a1Kk05GQRHcBAqSY8qanR8zMw0Dd4X3Rp19E/Or/nd2E
uk9vIszKeJSaaCqOs6aQtMvE2z9mJYUcHtjVZje+qjJod2v0EPacRdJfoYyOHWOF
53S7261XC0DjXeI1iOFkb9ThGjc2avnA9Ily4v32UEYqubp1ddWSSU/8y2BCKpkX
ipg2nVWjU1ngKfur9F+uTVfLb6g0C+QvXniWDgGlaGXOGnpkw9hXP1FXQrl3MiyD
qFy3YZtQMsmX9dFPSMzAPP/TfiSIKRzhfGVyaCbHwJyDMHyUEzxOOSNfD3lG6Naf
XwhLEZxXqvJs2LHkKkcChMTS9gIcS3FFEJrRPO6ng7LMXdJb2qY=
=mfm7
-----END PGP SIGNATURE-----

--tmhoscrdbp4qigij--



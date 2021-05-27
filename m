Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9651392BF1
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 12:36:26 +0200 (CEST)
Received: from localhost ([::1]:60694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmDNJ-0005GX-Au
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 06:36:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lmD6a-0004TZ-Ts
 for qemu-devel@nongnu.org; Thu, 27 May 2021 06:19:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lmD6X-0001iX-SQ
 for qemu-devel@nongnu.org; Thu, 27 May 2021 06:19:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622110744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0KT12i/Kxfgs5CSiVHh1x7qw/XzpWD70m3h1QsjLRqo=;
 b=WqEaZJ+iP8UGy1ZUNgg8+cZk0BEbdjVyHpn7BjHdnmSxw7H8ipVPasvV9i8FCtS8e27GCP
 ARo8CcxNFtnqctPdB2gao1g9H6s1BMoPx8L1hEyPMri4I0emPXhnd2rT04Szy3WnWuxnMJ
 k3s+diHabRTvsfpuDe0mwoXZvtnWd9g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-6ejCAaGrMC2HdRzFm5e15g-1; Thu, 27 May 2021 06:19:02 -0400
X-MC-Unique: 6ejCAaGrMC2HdRzFm5e15g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66EA6800D55;
 Thu, 27 May 2021 10:19:00 +0000 (UTC)
Received: from localhost (unknown [10.33.36.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F1A265D6D3;
 Thu, 27 May 2021 10:18:59 +0000 (UTC)
Date: Thu, 27 May 2021 12:18:59 +0200
From: Sergio Lopez <slp@redhat.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v8 11/19] hvf: Introduce hvf vcpu struct
Message-ID: <20210527101859.qbzygjnu7lw65s45@mhamilton>
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-12-agraf@csgraf.de>
MIME-Version: 1.0
In-Reply-To: <20210519202253.76782-12-agraf@csgraf.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="joreco4mdd7ktila"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=slp@redhat.com;
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
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--joreco4mdd7ktila
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 19, 2021 at 10:22:45PM +0200, Alexander Graf wrote:
> We will need more than a single field for hvf going forward. To keep
> the global vcpu struct uncluttered, let's allocate a special hvf vcpu
> struct, similar to how hax does it.
>=20
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
> Tested-by: Roman Bolshakov <r.bolshakov@yadro.com>
> Reviewed-by: Alex Benn=E9e <alex.bennee@linaro.org>
>=20
> ---
>=20
> v4 -> v5:
>=20
>   - Use g_free() on destroy
> ---
>  accel/hvf/hvf-accel-ops.c   |   8 +-
>  include/hw/core/cpu.h       |   3 +-
>  include/sysemu/hvf_int.h    |   4 +
>  target/i386/hvf/hvf.c       | 104 +++++++++---------
>  target/i386/hvf/vmx.h       |  24 +++--
>  target/i386/hvf/x86.c       |  28 ++---
>  target/i386/hvf/x86_descr.c |  26 ++---
>  target/i386/hvf/x86_emu.c   |  62 +++++------
>  target/i386/hvf/x86_mmu.c   |   4 +-
>  target/i386/hvf/x86_task.c  |  12 +--
>  target/i386/hvf/x86hvf.c    | 210 ++++++++++++++++++------------------
>  11 files changed, 248 insertions(+), 237 deletions(-)

Reviewed-by: Sergio Lopez <slp@redhat.com>

--joreco4mdd7ktila
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAmCvchIACgkQ9GknjS8M
AjXWxA//ZIjjeH3sojG83rQdUqubQLoml+GCB2XyZTyeYEABaiqZV3sCYHS/Qtsy
K4fwbxKvIiND06YZui1MG0pBZzsNw6gdNX/baoF0ELdaUlSjDfGj2Z3qWmm/DuPO
fqLz+iSue0ZZqisecsQF48VI+EvBvRlqH4ePp7HedLY65w3v9leCBCr1CbBnAUrM
jkiLhH8cCWGgObeZnGJWSCpReACmNjM2hDUkIAraO7SRIU/eunOVUbtnNFR0LD8+
OrcKmRPt6fE/TcJjH6KDkVTPDprietK/fub5KeaS1LibcQyggsbsMrsEcybddCVX
p8NCfIoZG0l1sNU87/mwPzs/YhBfWJtPVxfKz8LZqh+UFgGqiCD26pjXtY5mMOjy
iD1dOwmzt+7x/JhF5vCT8c7gLroKMSkBfDNWJGM7plgoEjLZvZE5j/0yPdcE6VCb
qMptA+OASerpIcHpUkojxfhsEVWvj6b0TGs4a4hHOlXMgv+axUubQ9F7jKRKRK9a
rMnU9T4tNQ83ryQ0UOPQdrmutOX2OBzo5gPOlX1AXFqLN4P4cH3hoZFQJZ8HkuH7
Tg6KdPQkY9ksCqC3QjnfKjB7pukQMIdDTlUg0bP4ltmvgucJIbeHlCdJw7gdrgbR
Nz/ltZde1dsAjeGzokWJ1kQ4DAorQTB63RCWSEiXALEs+TrgWBk=
=rXQS
-----END PGP SIGNATURE-----

--joreco4mdd7ktila--



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B927392D35
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 13:53:04 +0200 (CEST)
Received: from localhost ([::1]:51494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmEZT-0007IA-Gv
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 07:53:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lmE4e-0006VB-HR
 for qemu-devel@nongnu.org; Thu, 27 May 2021 07:21:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lmE4Z-0002Rb-7Z
 for qemu-devel@nongnu.org; Thu, 27 May 2021 07:21:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622114462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eQl7SdgQPE1e6OtdD40szvHIDUBuDbka4mZUpfLluf4=;
 b=HbTj0IjZJqBKcjtBEaHbqzxw/QKTuf/bdnsQofokvy5yNfLLg2Aen4NFa62f3vg7PL+R6a
 bEUaM/hyv3jZCdf7K4sA6YE9b4rt+cJ9YgSGvKTLKD6P3hH0ASXQNzSIbCbWCMN6TWFJ9F
 7chBioBnDXEOcHdeU8WKs10xuGXmlx0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-NaZefpYJNh2IK50HcJVUOg-1; Thu, 27 May 2021 07:20:58 -0400
X-MC-Unique: NaZefpYJNh2IK50HcJVUOg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FFBF501E3;
 Thu, 27 May 2021 11:20:57 +0000 (UTC)
Received: from localhost (unknown [10.33.36.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 411551349A;
 Thu, 27 May 2021 11:20:57 +0000 (UTC)
Date: Thu, 27 May 2021 13:20:56 +0200
From: Sergio Lopez <slp@redhat.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v8 17/19] arm: Add Hypervisor.framework build target
Message-ID: <20210527112056.aa67wn2e5nclzdyt@mhamilton>
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-18-agraf@csgraf.de>
MIME-Version: 1.0
In-Reply-To: <20210519202253.76782-18-agraf@csgraf.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="p77kyj5io4mhodgn"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--p77kyj5io4mhodgn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 19, 2021 at 10:22:51PM +0200, Alexander Graf wrote:
> Now that we have all logic in place that we need to handle Hypervisor.fra=
mework
> on Apple Silicon systems, let's add CONFIG_HVF for aarch64 as well so tha=
t we
> can build it.
>=20
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
> Tested-by: Roman Bolshakov <r.bolshakov@yadro.com> (x86 only)
>=20
> ---
>=20
> v1 -> v2:
>=20
>   - Fix build on 32bit arm
>=20
> v3 -> v4:
>=20
>   - Remove i386-softmmu target
>=20
> v6 -> v7:
>=20
>   - Simplify HVF matching logic in meson build file
> ---
>  meson.build                | 7 +++++++
>  target/arm/hvf/meson.build | 3 +++
>  target/arm/meson.build     | 2 ++
>  3 files changed, 12 insertions(+)
>  create mode 100644 target/arm/hvf/meson.build

Reviewed-by: Sergio Lopez <slp@redhat.com>

--p77kyj5io4mhodgn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAmCvgJcACgkQ9GknjS8M
AjXxIA//Xznb8k3xQCoTar7wYSDZLXyd4OfGx/OGswaYkrLmQspuYITw6D/9H5ya
1Cfghx/CfYFiFC5g1/eEN1jnd1a36PSbnARBgKhaOiHGSE1hcdypSIoZtVMsPiqO
rtVTZcuQxrBXqAA3LlR/6UZf4/pPk3ekSXuOeHej+EPgWUPowyw9+jl32sLkKMH/
0tLgIgG4Zc4Nl7hwdWsZ/vezhrjpuT82NxvFEfiZYnHZ3gW30EuwEuWpQlddoEr+
UHN/c5ZodA/m9foVgoWvkPyYDJZNfL8+TS4FtanqbQBO53NfZuHXIBrWO8FGaDLX
GAaw0NOrj69HH/UHX1cynC3lw5kMQdRZG5sTfg4dZ0Kqc/pmxb0vSF7ROz6kdPBm
6fG43P9VERg9JpHhnYFf2eXw9dtrdauJRbUw6OGvDqKwyBUQgI5JTHmwEuaPDA0z
/cMIUPU7Xpp11xMlcHkWRnyF5J4+s3jYQFS+e2vHGHbftyYhAahqJOnLX7XOzQH/
MRfrZ5rnGzzRv28rd8Wa5HxIBoeIdSCNroMfopMy4UGfPdG/azadDRqu+NOEulx2
9a5Lr/VRbm7iXnC14G4CkBvK38NtYKHh0APLsx+7GlsyQKFmacHWB51opcXrNx8G
nSNZ71PmJT93DtGsDoCjhoasgd4g294F4Y5r7MEd2Sr6FhLNSTs=
=6Zar
-----END PGP SIGNATURE-----

--p77kyj5io4mhodgn--



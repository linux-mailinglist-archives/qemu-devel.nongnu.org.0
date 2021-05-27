Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B37F7392C43
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 13:02:14 +0200 (CEST)
Received: from localhost ([::1]:54208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmDmG-0004M7-To
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 07:02:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lmDfu-0001lk-PI
 for qemu-devel@nongnu.org; Thu, 27 May 2021 06:55:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lmDfg-0005Hr-Ef
 for qemu-devel@nongnu.org; Thu, 27 May 2021 06:55:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622112922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MdUBzFc6n1Or590lZuh2+NwCH9Ax+PXt0a7SrMiaxLU=;
 b=Sl/vuyTDBByNuohNKF3aXHUJ0iW11BMUd+O8kDiyts6KES1w2eh5/CiWWHthGUod+WX7i9
 pIDirF4CbIc5TOhdDSaAz3yBVwgKqxVrLuZp7zsl59e7ywY2oNAj0jLeMh69kWnEdlfMFc
 zJbIPGmXS3rPz4rlIBPMcnhwvhQKIC8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-zJ_Is4FUMX-xuaElyR2UWg-1; Thu, 27 May 2021 06:55:20 -0400
X-MC-Unique: zJ_Is4FUMX-xuaElyR2UWg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74267192377F;
 Thu, 27 May 2021 10:55:18 +0000 (UTC)
Received: from localhost (unknown [10.33.36.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D5E71F0D9;
 Thu, 27 May 2021 10:55:17 +0000 (UTC)
Date: Thu, 27 May 2021 12:55:17 +0200
From: Sergio Lopez <slp@redhat.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v8 13/19] hvf: Add Apple Silicon support
Message-ID: <20210527105517.hedpkkf7ld4ltb6c@mhamilton>
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-14-agraf@csgraf.de>
MIME-Version: 1.0
In-Reply-To: <20210519202253.76782-14-agraf@csgraf.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="q6cbdpq5eqz436pm"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=slp@redhat.com;
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

--q6cbdpq5eqz436pm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 19, 2021 at 10:22:47PM +0200, Alexander Graf wrote:
> With Apple Silicon available to the masses, it's a good time to add suppo=
rt
> for driving its virtualization extensions from QEMU.
>=20
> This patch adds all necessary architecture specific code to get basic VMs
> working. It's still pretty raw, but definitely functional.
>=20
> Known limitations:
>=20
>   - Vtimer acknowledgement is hacky
>   - Should implement more sysregs and fault on invalid ones then
>   - WFI handling is missing, need to marry it with vtimer
>=20
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
>=20
> ---
>=20
> v1 -> v2:
>=20
>   - Merge vcpu kick function patch
>   - Implement WFI handling (allows vCPUs to sleep)
>   - Synchronize system registers (fixes OVMF crashes and reboot)
>   - Don't always call cpu_synchronize_state()
>   - Use more fine grained iothread locking
>   - Populate aa64mmfr0 from hardware
>=20
> v2 -> v3:
>=20
>   - Advance PC on SMC
>   - Use cp list interface for sysreg syncs
>   - Do not set current_cpu
>   - Fix sysreg isread mask
>   - Move sysreg handling to functions
>   - Remove WFI logic again
>   - Revert to global iothread locking
>   - Use Hypervisor.h on arm, hv.h does not contain aarch64 definitions
>=20
> v3 -> v4:
>=20
>   - No longer include Hypervisor.h
>=20
> v5 -> v6:
>=20
>   - Swap sysreg definition order. This way we're in line with asm outputs=
.
>=20
> v6 -> v7:
>=20
>   - Remove osdep.h include from hvf_int.h
>   - Synchronize SIMD registers as well
>   - Prepend 0x for hex values
>   - Convert DPRINTF to trace points
>   - Use main event loop (fixes gdbstub issues)
>   - Remove PSCI support, inject UDEF on HVC/SMC
>   - Change vtimer logic to look at ctl.istatus for vtimer mask sync
>   - Add kick callback again (fixes remote CPU notification)
>=20
> v7 -> v8:
>=20
>   - Fix checkpatch errors
> ---
>  MAINTAINERS                 |   5 +
>  accel/hvf/hvf-accel-ops.c   |  14 +
>  include/sysemu/hvf_int.h    |   9 +-
>  meson.build                 |   1 +
>  target/arm/hvf/hvf.c        | 703 ++++++++++++++++++++++++++++++++++++
>  target/arm/hvf/trace-events |  10 +
>  6 files changed, 741 insertions(+), 1 deletion(-)
>  create mode 100644 target/arm/hvf/hvf.c
>  create mode 100644 target/arm/hvf/trace-events

Reviewed-by: Sergio Lopez <slp@redhat.com>
Tested-by: Sergio Lopez <slp@redhat.com>

--q6cbdpq5eqz436pm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAmCvepQACgkQ9GknjS8M
AjWAwxAAtB4MyqEkmtyZ27XBDiLuuDPLedDdtXMCn0ahKJakuGhIiTgTCxoz7W6g
V5IEOpTlEYvAwkJTAiSy2TwXFDvvHBxIEhrbENxXzmro81usuqwjSr6O2m6sio4n
mGwKBSRB0sN8IA0e9ki6QSzJp6hfMThBwLbmZFRE0Xk96CZ0ip9n6pZP+1/o+eUj
oluBpT8AftkpjUPUBZ64p9aJlsJHUtpYbQ9dXIPVzUCcssU93KRoqKGzvM6h8U2g
/H0KKW1YVdSbjJ3JMFyj9zhUxIB/ewUOrOoDTxl2sIM5p0UeF/msSCsrXPIk/L0E
BnQwuodfl74Ac1LQw1fhBjOwZxgxvjvNeb9RKihtWdhVtnM/gIho9Moqo4GmeaMh
jQECvOijLqY0ZrhWwioJTruwjQ8MkjBQDHYOuL0aQkyyWl2MN5lPVHHwpS/bAZKK
rEmI6XRwti7xiKCRebme/EfHkB7xcxkmX+M07ZaK1XPY7AizoZuSKoYK4xOJDlh4
Uy+RjmnnqlWXSThhTgUuhug9WP4kRv9N6Fost98jd6UdYgmgGrRlQxoGqFLEzjBX
+OI8hYUETdStjfOJhKA5FzqGUhALI/QwrbA+JUcODozuzLGajj5nn9+tFmZ3S/gp
ft2stLTRRO5Eh3ISiGNYyGhNynqj1G+aptCxL+T73jplFsxilbg=
=Y9CK
-----END PGP SIGNATURE-----

--q6cbdpq5eqz436pm--



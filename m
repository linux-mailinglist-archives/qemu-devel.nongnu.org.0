Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B3C392CB4
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 13:29:50 +0200 (CEST)
Received: from localhost ([::1]:43216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmECz-0000Zu-Qf
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 07:29:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lmE2j-0005n9-4E
 for qemu-devel@nongnu.org; Thu, 27 May 2021 07:19:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lmE2Z-0001X5-Kh
 for qemu-devel@nongnu.org; Thu, 27 May 2021 07:19:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622114338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Aq3izwLoKG1KxXtKb/Q9i2QmWFPxDqBIw1ROvhHj/Nk=;
 b=V0mQw8n/BUvQFgXuDppr5r7wIqOuLSuOua666a57EOSOPVIm5JJbP3L9ORsD+ub715kslN
 b6RZ75RT60UfJARGn5z6ZP0QGQtMDj4iji2Qffp7AIBw5zMfxDVW4aHfWdVcDT+K38QCeO
 566RGIvMTsabRn84RAVfTK6IfHgOHQI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-osAcLv-0PqSDLxeBG7uQMA-1; Thu, 27 May 2021 07:18:57 -0400
X-MC-Unique: osAcLv-0PqSDLxeBG7uQMA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29FEE800D55;
 Thu, 27 May 2021 11:18:55 +0000 (UTC)
Received: from localhost (unknown [10.33.36.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8AAC1503E5;
 Thu, 27 May 2021 11:18:54 +0000 (UTC)
Date: Thu, 27 May 2021 13:18:53 +0200
From: Sergio Lopez <slp@redhat.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v8 15/19] hvf: arm: Implement -cpu host
Message-ID: <20210527111853.3zuudgp5xjwydelj@mhamilton>
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-16-agraf@csgraf.de>
MIME-Version: 1.0
In-Reply-To: <20210519202253.76782-16-agraf@csgraf.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ve5zr4shbjyq33wl"
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

--ve5zr4shbjyq33wl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 19, 2021 at 10:22:49PM +0200, Alexander Graf wrote:
> Now that we have working system register sync, we push more target CPU
> properties into the virtual machine. That might be useful in some
> situations, but is not the typical case that users want.
>=20
> So let's add a -cpu host option that allows them to explicitly pass all
> CPU capabilities of their host CPU into the guest.
>=20
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Acked-by: Roman Bolshakov <r.bolshakov@yadro.com>
>=20
> ---
>=20
> v6 -> v7:
>=20
>   - Move function define to own header
>   - Do not propagate SVE features for HVF
>   - Remove stray whitespace change
>   - Verify that EL0 and EL1 do not allow AArch32 mode
>   - Only probe host CPU features once
> ---
>  target/arm/cpu.c     |  9 ++++--
>  target/arm/cpu.h     |  2 ++
>  target/arm/hvf/hvf.c | 72 ++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/hvf_arm.h | 19 ++++++++++++
>  target/arm/kvm_arm.h |  2 --
>  5 files changed, 100 insertions(+), 4 deletions(-)
>  create mode 100644 target/arm/hvf_arm.h

Reviewed-by: Sergio Lopez <slp@redhat.com>
Tested-by: Sergio Lopez <slp@redhat.com>

--ve5zr4shbjyq33wl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAmCvgBwACgkQ9GknjS8M
AjVYRQ/+Lvv/4vrR0TUadO6MtkXDkYsuDcqHv8Ij0TnQ5mbskHPMyYHJHmzeA+ak
0Bp65ZkidXEMJ1bS+yRUsyCPm2y7G7D9nevU38+E3Wk9tbdLq64fQmI75ZZBO2uH
0nBqopc3DyicBe4GsVd5RX3LavuRbUSx3cgjFwc1PknrWyo5smfBrs5E6/6ltRlC
4NqdiHdNVHOlG3giUxLrXgifVSzVCMxgVPqIHaTK06zP2bs/XxwKW1XlCobU7w37
9QWPH+1uOsf0UfKpEkf+nNltBYLcU1KF28N2WfDleaVEUJdlI44Ek838w1T2ZWbi
jz1CwxZr90HI7TN+TuGRRsGGSzTVbjBlE040mUu+yzKqkxBjSUpYAC9kDPM3U3Ty
kPnl1yPiw+tnAErXeHAeHgO1RGdazWY8ByMV2oRdD+TbPUtfh/wruYNE9V9Li9sp
W4rodMdLZZFQ25C4i/kjDNjR00gyocCbLdQIspWdZDTe4S9RPZVIWWpMCiYnvUGF
d9V6XTZYsqZn/NWkaNZvFVHxcmEGiszq5S4MZ7H84ONDEpQM6ajEw1sXIHXX7Jyi
18ah8SJcKVKBiAnmMChUOYi+cR3xGKYDY1tjoJ5nMFfFdSUuPng5oWuKDuCkiSnh
wqv53RiD92jZhFJ2ErTHzK6NvAobdHTv9dJU40t805hjOpc3SfA=
=pNh+
-----END PGP SIGNATURE-----

--ve5zr4shbjyq33wl--



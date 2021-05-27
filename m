Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D70392B6F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 12:07:15 +0200 (CEST)
Received: from localhost ([::1]:37184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmCv3-0004sI-Vp
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 06:07:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lmCp4-0003Op-6v
 for qemu-devel@nongnu.org; Thu, 27 May 2021 06:01:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lmCoq-0000Sv-8g
 for qemu-devel@nongnu.org; Thu, 27 May 2021 06:00:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622109642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mcDgi9hTG8Vv1O6v/vf5EtYlsjhgWZxHD/rxGKh6A1U=;
 b=a20wKY3X7yWKrNMjscOhRyaWn3q6U/dQk/r0OqgyhPdl/7w3U6MnJ5K8tT/X1MUdRVjmUZ
 FLpsDJTBikfORdbDWudxTvrt4/R3LfW0FglAGOHenLVILDSLCF9I/kFuR0v3ueWKiaK8BT
 rPOWJ/hK8mNoC9pOIgBLKXqQxOkPpeY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-yc-U1BrsMuSlalx4emj1xQ-1; Thu, 27 May 2021 06:00:40 -0400
X-MC-Unique: yc-U1BrsMuSlalx4emj1xQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7F1080ED91;
 Thu, 27 May 2021 10:00:38 +0000 (UTC)
Received: from localhost (unknown [10.33.36.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5DB4067CC4;
 Thu, 27 May 2021 10:00:33 +0000 (UTC)
Date: Thu, 27 May 2021 12:00:32 +0200
From: Sergio Lopez <slp@redhat.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v8 01/19] hvf: Move assert_hvf_ok() into common directory
Message-ID: <20210527100032.xkq57c37jepff6bz@mhamilton>
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-2-agraf@csgraf.de>
MIME-Version: 1.0
In-Reply-To: <20210519202253.76782-2-agraf@csgraf.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bta7ssz4bo6dj32q"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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

--bta7ssz4bo6dj32q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 19, 2021 at 10:22:35PM +0200, Alexander Graf wrote:
> Until now, Hypervisor.framework has only been available on x86_64 systems=
.
> With Apple Silicon shipping now, it extends its reach to aarch64. To
> prepare for support for multiple architectures, let's start moving common
> code out into its own accel directory.
>=20
> This patch moves assert_hvf_ok() and introduces generic build infrastruct=
ure.
>=20
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> ---
>  MAINTAINERS              |  8 +++++++
>  accel/hvf/hvf-all.c      | 47 ++++++++++++++++++++++++++++++++++++++++
>  accel/hvf/meson.build    |  6 +++++
>  accel/meson.build        |  1 +
>  include/sysemu/hvf_int.h | 18 +++++++++++++++
>  target/i386/hvf/hvf.c    | 33 +---------------------------
>  6 files changed, 81 insertions(+), 32 deletions(-)
>  create mode 100644 accel/hvf/hvf-all.c
>  create mode 100644 accel/hvf/meson.build
>  create mode 100644 include/sysemu/hvf_int.h

Reviewed-by: Sergio Lopez <slp@redhat.com>

--bta7ssz4bo6dj32q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAmCvbbUACgkQ9GknjS8M
AjUumA/+KqbqRxsOi2T6wJWg99+A4vcAEhWTQvAIJcKE825TvEVW81RprG6pgAj3
doFflIeyDjDnOomazk978SelG+dJCPDYvAv6YCOJM5BFLUCWDm5S4/9VMf1FSTAo
WeCJ1UTTdXyinQVBvoyqkEdVE9q5XPaN2Nz9eDVED03mzaFZIDoEgW47C0jlw3Gv
5PFpfrFKnSsN+zFg5KFNUTU/mI/Ipxo7wSNFMKJgc9y4994Cyors4o043v3A9fF/
NDrSSivxnltDUADxBeQhADo7U+SDfR9qPjmCKNWyxz1jkVQPZ6StfuDatOjADFf0
l0zbO45zxAIasGN+9em+oGBkYVnbAdUt8M8IBUCgVRbDjbCoCz3B1lfyKg1RgLZ0
79mff4PZ+t27T3R3yeM2gmuz56MingE9SNXXrIjO/j1vDFk9s01g0v+herVbs0zW
80R+VNMudU3e5H9LTqWlv1Bu9CAu96NofyZ2zsVE2n8IM3DiEMWO18XjMuS7Qmma
WuILczRTJ9qHR4be44I4IOIFDbRRurOJNelow9rD0z8V5cUVU25WrwuKpCCRk+p+
MtFYwN6IUxTTdmNoh8W56b980miSKTd4hIaADR8dXyEFNbWae7LtOtw1g0fr93M9
0Dxm2vxp+bWv1pzIImZMEbZ4dBXx40xvJmHKp/S9WMq3i/2oE3g=
=dzlR
-----END PGP SIGNATURE-----

--bta7ssz4bo6dj32q--



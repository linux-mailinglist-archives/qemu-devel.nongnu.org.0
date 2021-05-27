Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F957392B95
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 12:17:30 +0200 (CEST)
Received: from localhost ([::1]:43436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmD4z-00010r-3X
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 06:17:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lmCuu-00065A-Ox
 for qemu-devel@nongnu.org; Thu, 27 May 2021 06:07:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lmCub-0003Qs-5Q
 for qemu-devel@nongnu.org; Thu, 27 May 2021 06:06:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622110000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yYzWm8GNN5JNUKRX0uVpapyoWpifwU3clv/duckVG+M=;
 b=W0/p4GDwypcEWsBn7ETCTaYZ0IuPzgVAwaNvajDPgGR0LMEjsiZWxfYomAUwGBBOSeKQjn
 lmnY9ta6pVBqD//i7P9lPmtPiBhGkwdLXOISNNRmK6iBEEP4zP9hu4M2Gtfna15ugDIxZC
 PwyGCtogwhIC6LqUR6UmjTjJsZc098g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-P16pNmJlPi2_c4BOPgSZWA-1; Thu, 27 May 2021 06:06:36 -0400
X-MC-Unique: P16pNmJlPi2_c4BOPgSZWA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C48E800D55;
 Thu, 27 May 2021 10:06:34 +0000 (UTC)
Received: from localhost (unknown [10.33.36.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2D965D9C6;
 Thu, 27 May 2021 10:06:33 +0000 (UTC)
Date: Thu, 27 May 2021 12:06:32 +0200
From: Sergio Lopez <slp@redhat.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v8 05/19] hvf: Make hvf_set_phys_mem() static
Message-ID: <20210527100632.acrkqlwgfrvt22dl@mhamilton>
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-6-agraf@csgraf.de>
MIME-Version: 1.0
In-Reply-To: <20210519202253.76782-6-agraf@csgraf.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4sm6uqwzhrs7a35w"
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
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--4sm6uqwzhrs7a35w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 19, 2021 at 10:22:39PM +0200, Alexander Graf wrote:
> The hvf_set_phys_mem() function is only called within the same file.
> Make it static.
>=20
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> ---
>  accel/hvf/hvf-accel-ops.c | 2 +-
>  include/sysemu/hvf_int.h  | 1 -
>  2 files changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Sergio Lopez <slp@redhat.com>

--4sm6uqwzhrs7a35w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAmCvbygACgkQ9GknjS8M
AjWnmg//aPaIwLrX0MxghDgkDCgqHj+Sg+qH7sVdT0lY4iZbgk/O0JVczDehGeFo
LIYDaAyr+/aykNWd67bYmORyFUZHdQ28EJuuGSWqqaJhJlFAipdElabHw9QSZyXP
JIdfGgVRCjxOv1pxr8oWTZXAVR7UZo1+f8j6AThcgzEMiO6fEawBOXZ4/rnXfasV
MqZCtV6nENY+bq3KLH4mUuK2pLZSX4eAsQ9cn2XrlEW+r0HE0Ql4WwVBockOnSKR
+rtAi2OL7gOhneCIxxXw2yzLtO+ldXJAJv6Vw9ST3mV3mrRo6+FxnjfTFj8tz1OD
Nv6IKRkVT07a+VTo+0q+44vIQpo9kfa70+vewLJhsxQU0NQixRnRxCXQ+m+DN+iO
u2KjNpgmsNVt7OG89W7IBNEw1khN+laugUrL0L2pjT39jaUkYpmXX7sysIE1K40g
WT6KUkNXFepG3+ik5GAuFSXU4ktIRY/bqgw2aR0WROFMdvqpnnxJH9ov1lSK9bQb
YbTmiCYG7cha7vQliB4Qj5JHi+rwZYPKjvD9lxU5OGDabQ0kmVgeXx6EsW36qvYS
sm1EQdCWepIEykD8eWmhuGhO1mkirGarvPcl125vmL7fj7L9lzoOJHUlglgVxRp0
xB2Nrllghw4fH2coTXBJJIMpFWRV7y/rSpc38Qi/8iawD4GjBqM=
=moWR
-----END PGP SIGNATURE-----

--4sm6uqwzhrs7a35w--



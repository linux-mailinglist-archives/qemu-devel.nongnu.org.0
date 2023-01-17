Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5796C66E343
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 17:18:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHoeL-0003DA-UK; Tue, 17 Jan 2023 11:17:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pHoeH-0003B6-He
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:17:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pHoeF-0004Vm-Ev
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:17:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673972234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dS//4CC9MWKZdhc6dDGuWag5X3V5/eWtf6zZq+T21N0=;
 b=ZfCkiguT9KioDePhfgHlbhsZUfJptD9TDESSMtMQbqYWIVERpP/nfFm/npRx+uW9/gW1nB
 ySuaH4l48cID88GXldnGPshXtwYDk/XYtaf+mHvK0EduAZHk2tl4X15E6X2SXVMV8eEQ4c
 SLgFCuO6WyZG6yBdv4/Atct6cqiqJSk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-14-hNhV7_I3Ma2ZgfCj843hIQ-1; Tue, 17 Jan 2023 11:17:02 -0500
X-MC-Unique: hNhV7_I3Ma2ZgfCj843hIQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C0143815F94;
 Tue, 17 Jan 2023 16:15:03 +0000 (UTC)
Received: from localhost (unknown [10.39.194.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B11962026D76;
 Tue, 17 Jan 2023 16:15:02 +0000 (UTC)
Date: Tue, 17 Jan 2023 11:15:00 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-trivial@nongnu.org, Alistair Francis <alistair@alistair23.me>
Subject: Re: [PATCH 0/4] hw: QOM housekeeping around IOTHREAD / IRQ types
Message-ID: <Y8bJhDWrIhP2Uq7C@fedora>
References: <20230113200138.52869-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kASuhU4CZ/BEMZkj"
Content-Disposition: inline
In-Reply-To: <20230113200138.52869-1-philmd@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--kASuhU4CZ/BEMZkj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 13, 2023 at 09:01:34PM +0100, Philippe Mathieu-Daud=E9 wrote:
> - remove unused code
> - use recent QOM macros
> - use CamelCase typedef
>=20
> Philippe Mathieu-Daud=E9 (4):
>   iothread: Remove unused IOThreadClass / IOTHREAD_CLASS
>   hw/irq: Declare QOM macros using OBJECT_DECLARE_SIMPLE_TYPE()
>   hw/or-irq: Declare QOM macros using OBJECT_DECLARE_SIMPLE_TYPE()
>   hw: Replace qemu_or_irq typedef by OrIRQState
>=20
>  hw/arm/exynos4210.c                  |  4 ++--
>  hw/arm/mps2-tz.c                     |  2 +-
>  hw/core/irq.c                        |  9 ++++-----
>  hw/core/or-irq.c                     | 18 +++++++++---------
>  hw/pci-host/raven.c                  |  2 +-
>  include/hw/arm/armsse.h              |  6 +++---
>  include/hw/arm/bcm2835_peripherals.h |  2 +-
>  include/hw/arm/exynos4210.h          |  4 ++--
>  include/hw/arm/stm32f205_soc.h       |  2 +-
>  include/hw/arm/stm32f405_soc.h       |  2 +-
>  include/hw/arm/xlnx-versal.h         |  6 +++---
>  include/hw/arm/xlnx-zynqmp.h         |  2 +-
>  include/hw/or-irq.h                  |  5 +----
>  iothread.c                           |  4 ----
>  14 files changed, 30 insertions(+), 38 deletions(-)
>=20
> --=20
> 2.38.1
>=20

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--kASuhU4CZ/BEMZkj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmPGyYQACgkQnKSrs4Gr
c8jskAgAr2qJn9PIVLPHgAOTV9G77je0Td+PM0xLKU8TeWqolhsn/ree/BmAu2+G
trFb150VcsfhMWy4Fp59wJSE7xOQynwVEoAPLl77THlWtkrID7Ig9DW4mnlemDKe
hvEM7t+fiddEcdXEVgReKi7QOZyrLGXtmGXgkJgRkJ47IXODrnhAQ3hN2Azo9RbR
ucvCqPVjw3ng1ZuI9NG01Y0hfEXM7SlHG/p097AWOUPlp8D078E82RNLndnFkYXG
5b3TL5sCbrbdM2a348P/jx4vMjxcGfORfh9kwzreisAL/0g23EUBQzESZsDMXr20
mEcN3SisKSgWRkTUC1WeO74//yrYYg==
=wQRH
-----END PGP SIGNATURE-----

--kASuhU4CZ/BEMZkj--



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 638E34D4497
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 11:29:28 +0100 (CET)
Received: from localhost ([::1]:48060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSG2x-0008Vh-G4
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 05:29:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nSG0x-00074y-B6
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 05:27:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nSG0u-0006Lv-On
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 05:27:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646908040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hypAjk50qtCU3S1ZolLJWmPpEQ7Vl73DO3ept1VDZCc=;
 b=KeLUz+n4laIRuAFweakfbhYNNbVr8PRLSO+qP8X3EkZTz9zU9I9kCXgi/3iA2/pEVLZk8k
 HG4nPmk/rbvii0GtybirQG5NFoAyZ7Aswn668LRknOormjB0KLQyRynhfSs1VYCmRD3eHN
 UfPh10fRCsxjpoKR2xjjZolRCFBhr+A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-385-UYl8e4uvPrGGci4GD-YOEA-1; Thu, 10 Mar 2022 05:27:17 -0500
X-MC-Unique: UYl8e4uvPrGGci4GD-YOEA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B571D1006AA6;
 Thu, 10 Mar 2022 10:27:15 +0000 (UTC)
Received: from localhost (unknown [10.39.195.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 35CB267E7F;
 Thu, 10 Mar 2022 10:27:07 +0000 (UTC)
Date: Thu, 10 Mar 2022 10:27:06 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Nicolas Saenz Julienne <nsaenzju@redhat.com>
Subject: Re: [PATCH v2 3/4] util/main-loop: Introduce the main loop into QOM
Message-ID: <YinSemh7dAelx0lL@stefanha-x1.localdomain>
References: <20220303145822.518887-1-nsaenzju@redhat.com>
 <20220303145822.518887-4-nsaenzju@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="f/ztTJdqmkvbhSBi"
Content-Disposition: inline
In-Reply-To: <20220303145822.518887-4-nsaenzju@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, fam@euphon.net, berrange@redhat.com,
 qemu-block@nongnu.org, michael.roth@amd.com, mtosatti@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, eduardo@habkost.net,
 hreitz@redhat.com, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--f/ztTJdqmkvbhSBi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 03, 2022 at 03:58:21PM +0100, Nicolas Saenz Julienne wrote:
> 'event-loop-base' provides basic property handling for all 'AioContext'
> based event loops. So let's define a new 'MainLoopClass' that inherits
> from it. This will permit tweaking the main loop's properties through
> qapi as well as through the command line using the '-object' keyword[1].
> Only one instance of 'MainLoopClass' might be created at any time.
>=20
> 'EventLoopBaseClass' learns a new callback, 'can_be_deleted()' so as to
> mark 'MainLoop' as non-deletable.
>=20
> Signed-off-by: Nicolas Saenz Julienne <nsaenzju@redhat.com>
>=20
> [1] For example:
>       -object main-loop,id=3Dmain-loop,aio-max-batch=3D<value>
> ---
>=20
> Changes since v1:
>  - Fix json files to differentiate between iothread and main-loop
>  - Use OBJECT_DECLARE_TYPE()
>  - Fix build dependencies
>=20
>  event-loop-base.c                | 13 ++++++++
>  include/qemu/main-loop.h         | 10 ++++++
>  include/sysemu/event-loop-base.h |  1 +
>  meson.build                      |  3 +-
>  qapi/qom.json                    | 16 +++++++++
>  util/main-loop.c                 | 56 ++++++++++++++++++++++++++++++++
>  6 files changed, 98 insertions(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--f/ztTJdqmkvbhSBi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIp0noACgkQnKSrs4Gr
c8ip7AgAurAR4Oz/Wd3v3Derfs0hlE8tAc+G7mxSL6lH+/nuuzM7OmU16CWAzSiw
wS+rijGDC+SqKgB3KAZMxLE7VTiBJi4eunB5965ZJn1T/vmL98sOGDAgmfvpmgeK
zYWJ98tnoXDdsYCSGu/1xIybARr3Z5bExxv/iAlHpuL/3fmvQzqvwQZurJF5oFwP
dHTm67c4XXnMHvg7ZPUPnfPzECCkpl0fTtG1n8nDkcpqGYq2HVfJuVezeEBMZMpN
RC0pRdYgfvxug46j2HkmRF2taCWC0OHUGQYaxT/7uBfggmyOsxu9fPtOJQGxRp+m
i6qbzY+rPAR5QMo9VXcymdADfXaj+A==
=fFJB
-----END PGP SIGNATURE-----

--f/ztTJdqmkvbhSBi--



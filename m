Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33ECF489D98
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 17:31:10 +0100 (CET)
Received: from localhost ([::1]:51204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6xZd-0004FR-6f
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 11:31:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n6xWE-0002fY-Kr
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 11:27:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n6xWD-0000ZM-4U
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 11:27:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641832056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tCu7kHFGRYhzLwP8v8av5IP/cF1cqFLjen0LLHK4lnQ=;
 b=RXDl9r0vgRcXafZxVNz61ycAbbhZdHIcdD6IeS/cVxBpIE9hkFQZ/XpsvkK3XsARWQOWDE
 dVMuLrkvWL8rz0fsuuUYroa4V4I63IMuS12Hfo/S/tMNkkZSafKH38gN5JrGmPEnp2wX/h
 M7DrPEd8kQ5bd20ibhLIOzrKicH0m2A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-cgmHL9m_N62JAty8a_yiVQ-1; Mon, 10 Jan 2022 11:27:31 -0500
X-MC-Unique: cgmHL9m_N62JAty8a_yiVQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 850DB81EE73;
 Mon, 10 Jan 2022 16:27:30 +0000 (UTC)
Received: from localhost (unknown [10.39.194.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 75D447F808;
 Mon, 10 Jan 2022 16:27:08 +0000 (UTC)
Date: Mon, 10 Jan 2022 16:27:07 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 4/4] meson: generate trace points for qmp commands
Message-ID: <YdxeWwMGUJZLrf/s@stefanha-x1.localdomain>
References: <20211223110756.699148-1-vsementsov@virtuozzo.com>
 <20211223110756.699148-5-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20211223110756.699148-5-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VLXoKyLJ5giymcCl"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, michael.roth@amd.com,
 philmd@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 pbonzini@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--VLXoKyLJ5giymcCl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 23, 2021 at 12:07:56PM +0100, Vladimir Sementsov-Ogievskiy wrot=
e:
> 1. Use --add-trace-points when generate qmp commands
> 2. Add corresponding .trace-events files as outputs in qapi_files
>    custom target
> 3. Define global qapi_trace_events list of .trace-events file targets,
>    to fill in trace/qapi.build and to use in trace/meson.build
> 4. In trace/meson.build use the new array as an additional source of
>    .trace_events files to be processed
>=20
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  meson.build       |  1 +
>  qapi/meson.build  |  9 ++++++++-
>  trace/meson.build | 11 ++++++++---
>  3 files changed, 17 insertions(+), 4 deletions(-)

This patch has a meson subdir ordering dependency: qapi/ must be
processed before trace/. Please document this in meson.build so anyone
editing subdirs knows to preserve this order.

--VLXoKyLJ5giymcCl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHcXlsACgkQnKSrs4Gr
c8jKSwf/UYbJdiD7GLiLXIFR2hzJUIxQOYR5Hl6rBWHzE6ocD8nu/ok716HXDBJJ
YIAzP063tkXWJEruRR9RRCPNtQS6Pq+8HH8Um4W1u+UmR9Ymlrx3OdJixcUMxRdr
gdHCxpyA4UPAygZg1i0Ppchm1IBr8UDsco1TsTO6wmgRDl7tG/IQdm2gqjWAtvK/
oTm2L+hhPxHavAgN2FdFm6VchBlkgrMD/m0Sn+ZEi7VQ7hQpFwPPHJgBXuodrbRW
e+WrDpQ5Kp71824L9580YXGi/WsaROkOzDgS3Gx99RWkXbweiHZsQUOqMnSqa3w7
3PFBFIiPaBkH2z8atR2Uyp4nl7ZSpQ==
=j43V
-----END PGP SIGNATURE-----

--VLXoKyLJ5giymcCl--



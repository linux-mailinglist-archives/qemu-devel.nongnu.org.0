Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B429533FE2
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 17:06:04 +0200 (CEST)
Received: from localhost ([::1]:42952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntsaJ-0001yg-BP
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 11:06:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ntsQ8-0005ee-UT
 for qemu-devel@nongnu.org; Wed, 25 May 2022 10:55:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ntsQ4-0000p8-9r
 for qemu-devel@nongnu.org; Wed, 25 May 2022 10:55:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653490527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sbK1oqFOGnhe4ZS+0aUC1LMoCpfv3THt42C0nDOgdBA=;
 b=GaVLiBCHoKxT17osFlTI7q9+p3fSCFQXFgcro/MxMTVggvMG/4AURog3e4TJnY0ZZK2KKT
 O4QpAIJtKkvSRnSXXz+AaZBaVlibm17xYHj6+3i1LJXDmBJIu/Z+TaqDMNnW95PbGcQG5U
 8RiZpbHUC7JilQ/Z2A2kN5YnnWA4OW4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-373-VAv6CPznMVKkwJ7lLcEFjw-1; Wed, 25 May 2022 10:55:23 -0400
X-MC-Unique: VAv6CPznMVKkwJ7lLcEFjw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74F831C0012D;
 Wed, 25 May 2022 14:55:22 +0000 (UTC)
Received: from localhost (unknown [10.39.195.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0845D2026D64;
 Wed, 25 May 2022 14:55:21 +0000 (UTC)
Date: Wed, 25 May 2022 15:55:20 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, f4bug@amsat.org,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, thuth@redhat.com,
 bleal@redhat.com, berrange@redhat.com, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, quintela@redhat.com, dgilbert@redhat.com,
 imammedo@redhat.com, peterx@redhat.com, john.levon@nutanix.com,
 thanos.makatos@nutanix.com, elena.ufimtseva@oracle.com,
 john.g.johnson@oracle.com, kanth.ghatraju@oracle.com
Subject: Re: [PATCH v10 00/14] vfio-user server in QEMU
Message-ID: <Yo5DWCYy2eUXh090@stefanha-x1.localdomain>
References: <cover.1653404595.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JcLO27JGqG4c/1bQ"
Content-Disposition: inline
In-Reply-To: <cover.1653404595.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--JcLO27JGqG4c/1bQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 24, 2022 at 11:30:19AM -0400, Jagannathan Raman wrote:
> Hi,
>=20
> This is v10 of the server side changes to enable vfio-user in QEMU.
>=20
> Thank you for reviewing and sharing your feedback for the previous
> revision. We have addressed your comments in this revision.
>=20
> We have dropped the following patches in this series:
>   - tests/avocado: Specify target VM argument to helper routines
>   - configure: require cmake 3.19 or newer
>   - vfio-user: avocado tests for vfio-user
>=20
> We have also made the following changes:
>   [PATCH v10 1/14] qdev: unplug blocker for devices
>     - updated functions comments for unplug blockers in hw/qdev-core.h
>=20
>   [PATCH v10 4/14] vfio-user: build library
>     - uses meson build system to build libvfio-user library
>     - dropped ubuntu CI build
>=20
>   [PATCH v10 5/14] vfio-user: define vfio-user-server object
>     - updated comments for VfioUserServerProperties in qapi/qom.json
>=20
>   [PATCH v10 6/14] vfio-user: instantiate vfio-user context
>     - added comments to vfu_object_init_ctx() explaining function contract
>=20
>   [PATCH v10 8/14] vfio-user: run vfio-user context
>     - vfu_object_ctx_run() asserts that VfuObject->device is not NULL
>     - added a comment to vfu_object_ctx_run() explaining why
>       VfuObject->device wouldn't be NULL
>=20
> Thank you very much!

I'm happy with this series. I've asked Michael Tsirkin and Alex
Williamson to review the interrupt patch. Aside from that I think it's
time to merge and further work can be done in qemu.git.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--JcLO27JGqG4c/1bQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKOQ1gACgkQnKSrs4Gr
c8jJEwf/RFeb0DsFJMPhXKryLurjnBay7kqGdVI0jR1iJ0g8kYjhlkXhyAz7j8DX
5xyddUNjt4qINnTDVmmKrTq5mijFJJSx7Cnyyv71m+Oq+Y8twXno8gBzsTDSeiZo
mTvBU2R9bkrhvoQs1SLLJ9M2+0iTtLpFwVlPRJKV2Gq6SbBPucxz5sD9Oge8WJ6/
/3V9AKbXGSd5Hlg8NEoTmQx64EwqPYHDpMvVXcNLEzqbuiSEUXlIu0Mrhy/TkU5y
jyY4t+Xk9V15yBPpkJ+NDOmLG+HALdmV8ZfiLqTZRVkQehYaou0jEQUKAWXpnbYd
l+2GmnWNEr6FE5uqAfj2UnfSM0Jjng==
=FNaR
-----END PGP SIGNATURE-----

--JcLO27JGqG4c/1bQ--



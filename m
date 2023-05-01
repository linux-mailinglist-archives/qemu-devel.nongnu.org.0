Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F25076F32D2
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 17:25:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptVP5-0005hT-9d; Mon, 01 May 2023 11:25:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptVP0-0005gn-Sv
 for qemu-devel@nongnu.org; Mon, 01 May 2023 11:25:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptVOz-0004VX-Hb
 for qemu-devel@nongnu.org; Mon, 01 May 2023 11:25:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682954720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BRYdnFgIFg1RGvJgVZ1zgVtc/NVFqOdKFAIO6Vp3pWw=;
 b=Si3ek3yfYbrBZbdh9k604Z7vToPhCUEPuBQxDgcZzYarXBr8/Ic4ffAexZCWfMgT2cuwZR
 GioyFu1KcAoJNeOnZS60Odt+a9i8epnHFV3z5mS8bMB+zGAYHyyJv0n/MKMgvkPN9RKkIZ
 A2+TsmpVBSbMRdGIxeZjvDJvt3bauHw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-rLaFnH-wP16RwCd25EGU2Q-1; Mon, 01 May 2023 11:25:01 -0400
X-MC-Unique: rLaFnH-wP16RwCd25EGU2Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B8FF88B7AD;
 Mon,  1 May 2023 15:24:36 +0000 (UTC)
Received: from localhost (unknown [10.39.192.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E3D46492C13;
 Mon,  1 May 2023 15:24:35 +0000 (UTC)
Date: Mon, 1 May 2023 11:24:34 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, pbonzini@redhat.com, eesposit@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 04/20] block: Don't call no_coroutine_fns in
 qmp_block_resize()
Message-ID: <20230501152434.GF14869@fedora>
References: <20230425173158.574203-1-kwolf@redhat.com>
 <20230425173158.574203-5-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ezqveAnvnk+YBxww"
Content-Disposition: inline
In-Reply-To: <20230425173158.574203-5-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


--ezqveAnvnk+YBxww
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 25, 2023 at 07:31:42PM +0200, Kevin Wolf wrote:
> This QMP handler runs in a coroutine, so it must use the corresponding
> no_co_wrappers instead.
>=20
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  blockdev.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--ezqveAnvnk+YBxww
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRP2bIACgkQnKSrs4Gr
c8iVBwgAx73kDmD2OKZr8TP9CGHcfITqJLrzXYzieMseMMdjmBa1S+lNK3V7J7CY
uEMl0MxUTYjncDSc9F0nUqMSL45ibIS1dclhzj4ALgjTLBnSqRS/0OZUl7fKtiDd
WoEkBfyminBBq2zPw3JN9RY1eFVH6KHQSf9uotm8mKNgOap/GVlwxLMTZdtZeiYh
2XNsf0iTRZCq5+TuXehiGgLgwScB1Wy4ymoVbMFjPQCVIkpEt8B6AqIvnYxjE5ng
ZvjBfWzxAV60RUdejMY0kKhtY5EdnZVbKZ596xtHAEaa6mWcBi5qJgdnM6FYVJK3
4VKJot4gQ2mweTMrPAGJ0j6UCOSikA==
=QRQW
-----END PGP SIGNATURE-----

--ezqveAnvnk+YBxww--



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D9256717A
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 16:49:37 +0200 (CEST)
Received: from localhost ([::1]:46136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8jrs-0004WE-LP
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 10:49:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o8jr1-0003fO-5J
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 10:48:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o8jqz-0007C3-Jv
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 10:48:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657032521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IWxnHl/QYBKR0h4wlX5eijMe1xGRvnIXA3t/eHg/viY=;
 b=TtG/DZica85rF2+qzhtkZ1IygxWIm+dHQloh1Pu4/vhwD+w8eCvhc13c7lYKr7Tp5qret+
 DwBuDG4DAECAX9miEUt6unQw02SoUW6eCAx1VAGmdmFyC3avEHgt268r+Fo6VcnhUfvTQ2
 y5boExOrAja86OG7R31ZWc7Bsoi6aQ0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-1JBb07NkO7G0--5Uc1BS5g-1; Tue, 05 Jul 2022 10:48:32 -0400
X-MC-Unique: 1JBb07NkO7G0--5Uc1BS5g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8CD080CC5C;
 Tue,  5 Jul 2022 14:48:31 +0000 (UTC)
Received: from localhost (unknown [10.39.194.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 68C7E2166B29;
 Tue,  5 Jul 2022 14:48:31 +0000 (UTC)
Date: Tue, 5 Jul 2022 15:48:30 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 8/8] virtio-blk: remove unnecessary AioContext lock from
 function already safe
Message-ID: <YsRPPodoA32eEBeU@stefanha-x1.localdomain>
References: <20220609143727.1151816-1-eesposit@redhat.com>
 <20220609143727.1151816-9-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ipZoRY39Z86Go/We"
Content-Disposition: inline
In-Reply-To: <20220609143727.1151816-9-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


--ipZoRY39Z86Go/We
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 09, 2022 at 10:37:27AM -0400, Emanuele Giuseppe Esposito wrote:
> AioContext lock was introduced in b9e413dd375 and in this instance
> it is used to protect these 3 functions:
> - virtio_blk_handle_rw_error
> - virtio_blk_req_complete
> - block_acct_done
>=20
> Now that all three of the above functions are protected with
> their own locks, we can get rid of the AioContext lock.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  hw/block/virtio-blk.c | 18 ++----------------
>  1 file changed, 2 insertions(+), 16 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--ipZoRY39Z86Go/We
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLETz4ACgkQnKSrs4Gr
c8hlEwf+KvuIHAUT2JxYYJrzKw5wHF7wpaf537ZQ1vH47Rpa1SK3GKyg3m4XYatk
HdmrX5Tc4ZasXKUV4D2WRlYIjHeIiycPM2DwdPfpHjJFlI1skr4Yi0GEEP1Ylsps
aEOWe/U5u8pCxnU19vvXz2Yz5ygOZV8RFle1YuWyZ+nl3Ewc2ZUonRWQn+vxABKd
U44a8i7SmyXPX88vDtg6szvAaCJSv32GlS/d73m2sUCrEz2lGoKFtXxUY6IIBTfF
qnZnfGgV+18oys3wtEEJ0mXXovaZPBdRB7b669yrODpSyPfkZS2ySweQFm2stdl1
MHLUhnzu5CgxZBJwSsA+gv71a2Kfeg==
=irDF
-----END PGP SIGNATURE-----

--ipZoRY39Z86Go/We--



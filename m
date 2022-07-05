Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5468567109
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 16:28:56 +0200 (CEST)
Received: from localhost ([::1]:55966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8jXs-0007b2-2Q
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 10:28:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o8jWf-0006mY-4F
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 10:27:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o8jWd-0003w0-B3
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 10:27:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657031258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GdriCI4EorgwvXnls+WwfyjqVl4gsc/O1FBoJGcEfcU=;
 b=N3LhSfBhMvKjARZpmmRmGEnTjaH4id6c14VhcUoB2/yHxavHbE35A3kAqf7cCxIywnMg/e
 EO2FF9ObgViNLEwIw/nKhY3mb1IyZLUlEg6dT7zdZk0qE8K03yEF1lhOYdFz8Bu0gRw4QQ
 vd+FIx571cMn57k15M/Z6PJTSphQJsE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-34-xiK-nVE-NNW_Jn0y3gV5xA-1; Tue, 05 Jul 2022 10:27:28 -0400
X-MC-Unique: xiK-nVE-NNW_Jn0y3gV5xA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4996F88565B;
 Tue,  5 Jul 2022 14:27:10 +0000 (UTC)
Received: from localhost (unknown [10.39.194.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E0967C08087;
 Tue,  5 Jul 2022 14:27:09 +0000 (UTC)
Date: Tue, 5 Jul 2022 15:27:08 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 5/8] virtio-blk: mark GLOBAL_STATE_CODE functions
Message-ID: <YsRKPGXDvPrZFmgP@stefanha-x1.localdomain>
References: <20220609143727.1151816-1-eesposit@redhat.com>
 <20220609143727.1151816-6-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AwnK2/3io16Ba090"
Content-Disposition: inline
In-Reply-To: <20220609143727.1151816-6-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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


--AwnK2/3io16Ba090
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 09, 2022 at 10:37:24AM -0400, Emanuele Giuseppe Esposito wrote:
> Just as done in the block API, mark functions in virtio-blk
> that are always called in the main loop with BQL held.
>=20
> We know such functions are GS because they all are callbacks
> from virtio.c API that has already classified them as GS.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  hw/block/dataplane/virtio-blk.c |  4 ++++
>  hw/block/virtio-blk.c           | 29 +++++++++++++++++++++++++++++
>  2 files changed, 33 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--AwnK2/3io16Ba090
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLESjwACgkQnKSrs4Gr
c8h6GQf+Nt1SoU8gk2+dJBCG/IbVeOfKta0F40kF8xG3BTzhTuaH0SBK4wGnFeJ0
VREym7K3cncAH631tvpEleAC75y0Qb+Lc9825MwDs1xjWXYgOkOtNTgzAosvkQJf
M6sE3boZR5MNf5aQmPoXhtaZBGLWwwTzt+XgbTv+kl0VHuwTELeQFKBjtlpjO3PM
TqJh/pmmS0BPqaHc8zf8I5KCAj/0NdOCFdfw4DFCwh4l9iy+95A9VA1TgUFpJEtj
+SYmPbMG5dfuFcWSMSMcgctpKtzWns2PF9apdCvHVGDH0fBJErFFTChGhcIsUGnF
kyFoRSDiH94xFTbmKbwpxDK9ThTHOw==
=zPbG
-----END PGP SIGNATURE-----

--AwnK2/3io16Ba090--



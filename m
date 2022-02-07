Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B624AC7D1
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 18:44:47 +0100 (CET)
Received: from localhost ([::1]:51098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH84E-0000ED-9S
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 12:44:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nH7hT-000119-S0
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 12:21:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nH7hL-0005Tz-Ij
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 12:21:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644254463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xYaG55S49LlKuwsp1iNdvBnIC6HLelbtGsgeH3acFWM=;
 b=G6xjZ/nfx/6nL5TbWeIpu0Lbu3+9+x8cM8n+5lIIj79itlQurFk0Dnus9hkncuh3GjOUBO
 tEJFeej3LJZZnj97RMj5cffLaRlpAd406poH0zSPyTU+nwVp42cqe1IC9BKbhDBa5usrbe
 Xjrl4/i5HPPqFHBkPedGdqkf5PTVWKo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-tIU739SKOSev0pAdO2JUHQ-1; Mon, 07 Feb 2022 12:20:59 -0500
X-MC-Unique: tIU739SKOSev0pAdO2JUHQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03FC71006AA0;
 Mon,  7 Feb 2022 17:20:58 +0000 (UTC)
Received: from localhost (unknown [10.39.192.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B6D71053B39;
 Mon,  7 Feb 2022 17:20:56 +0000 (UTC)
Date: Mon, 7 Feb 2022 17:20:56 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Hiroki Narukawa <hnarukaw@yahoo-corp.jp>
Subject: Re: [PATCH v3 1/1] util: adjust coroutine pool size to virtio block
 queue
Message-ID: <YgFU+P01Vl6BGTsJ@stefanha-x1.localdomain>
References: <20220128083616.6083-1-hnarukaw@yahoo-corp.jp>
 <20220128083616.6083-2-hnarukaw@yahoo-corp.jp>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Blr2spt+a8HD0wPE"
Content-Disposition: inline
In-Reply-To: <20220128083616.6083-2-hnarukaw@yahoo-corp.jp>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, mst@redhat.com, f4bug@amsat.org,
 qemu-devel@nongnu.org, hreitz@redhat.com, aoiwa@yahoo-corp.jp
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Blr2spt+a8HD0wPE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 28, 2022 at 05:36:16PM +0900, Hiroki Narukawa wrote:
> Coroutine pool size was 64 from long ago, and the basis was organized in =
the commit message in c740ad92.
>=20
> At that time, virtio-blk queue-size and num-queue were not configuable, a=
nd equivalent values were 128 and 1.
>=20
> Coroutine pool size 64 was fine then.
>=20
> Later queue-size and num-queue got configuable, and default values were i=
ncreased.
>=20
> Coroutine pool with size 64 exhausts frequently with random disk IO in ne=
w size, and slows down.
>=20
> This commit adjusts coroutine pool size adaptively with new values.
>=20
> This commit adds 64 by default, but now coroutine is not only for block d=
evices,
>=20
> and is not too much burdon comparing with new default.
>=20
> pool size of 128 * vCPUs.
>=20
> Signed-off-by: Hiroki Narukawa <hnarukaw@yahoo-corp.jp>
> ---
>  hw/block/virtio-blk.c    |  5 +++++
>  include/qemu/coroutine.h | 10 ++++++++++
>  util/qemu-coroutine.c    | 20 ++++++++++++++++----
>  3 files changed, 31 insertions(+), 4 deletions(-)

Thanks, applied to my block tree:
https://gitlab.com/stefanha/qemu/commits/block

Stefan

--Blr2spt+a8HD0wPE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIBVPcACgkQnKSrs4Gr
c8jtaAf/cNd/pAJCtLfmx/odxaZPhiRGWpMTbfkNv9iq5CcHJk4urRmQ4ltGAmEg
Uf5S5l1FTfaOGTWA8V/bJHSLFm9Q25lxJTHlqua6l7Nl24LlPKzHoAUIJyKuY7zW
kdWMGgl0HS1CSslsXmMWA3sAH0NYWyDqF9TGSVvcnjVqujpxRze7KSEumYldOQ9i
CoMyjDDtnKsccAfBv7HrZ+QtMfV3qnKp9iiYTSiG6my8XFN1Vel5Kjx6IwL7v8Ag
DubLalzh2cLJHMLTj0fFkcnYeyMlCg4qxOZBFLgrVnn1bqANPS+fojtLgRGoKk98
gqfNXV3D82ShlNvN+awpyC0kjQDGxg==
=IKTX
-----END PGP SIGNATURE-----

--Blr2spt+a8HD0wPE--



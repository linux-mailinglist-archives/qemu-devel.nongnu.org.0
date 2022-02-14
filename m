Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A89884B5868
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 18:24:32 +0100 (CET)
Received: from localhost ([::1]:55976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJf5T-00053E-6Y
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 12:24:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nJf3Y-0003sH-R2
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 12:22:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nJf3V-0008Hb-5J
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 12:22:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644859347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V97XmlyOikE981G8cFeYrvpV/2kCT+q7ObDOQBhQbX0=;
 b=PW6K79pn3QMQiYGzPy5AyJNPLtQMhyBsLTMuxz0Ff3hIKmfjJx/lH21YdngGulx09EheYK
 KROlSi5L+Yj0zoGzL2vYmdeWAIW0XlevT5uhBqtOigjIpPqFruOzXeVSmuAkmlBWV9tq+U
 YpBmwgqnUuytEYhHDageHNn212Q8gWE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-CamxjKuvOnua8_1rXjwbIA-1; Mon, 14 Feb 2022 12:22:26 -0500
X-MC-Unique: CamxjKuvOnua8_1rXjwbIA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D1FE835B8C;
 Mon, 14 Feb 2022 17:22:25 +0000 (UTC)
Received: from localhost (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A60BE7E230;
 Mon, 14 Feb 2022 17:22:04 +0000 (UTC)
Date: Mon, 14 Feb 2022 17:11:46 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Hiroki Narukawa <hnarukaw@yahoo-corp.jp>
Subject: Re: [PATCH v4 0/1] Patch to adjust coroutine pool size adaptively
Message-ID: <YgqNUnrULegkUtk6@stefanha-x1.localdomain>
References: <20220214115302.13294-1-hnarukaw@yahoo-corp.jp>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="o7rctKGfnBsczmDM"
Content-Disposition: inline
In-Reply-To: <20220214115302.13294-1-hnarukaw@yahoo-corp.jp>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, mst@redhat.com, f4bug@amsat.org,
 qemu-devel@nongnu.org, hreitz@redhat.com, aoiwa@yahoo-corp.jp
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--o7rctKGfnBsczmDM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 14, 2022 at 08:53:01PM +0900, Hiroki Narukawa wrote:
> Resending with correct commit message
>=20
> Resending patch with decreasing coroutine pool size on device remove
>=20
> We encountered random disk IO performance drop since qemu-5.0.0, and this=
 patch fixes it.
>=20
> Commit message in 4d68e86b implied to adjust coroutine pool size adaptive=
ly, so I tried to implement this.
>=20
> Changes from v3:
> No code changed. Changed commit message so that first line indicates to
> correct commit ID.
>=20
> Changes from v2:
> Decrease coroutine pool size on device remove
>=20
> Changes from v1:
> Use qatomic_read properly
>=20
> Hiroki Narukawa (1):
>   util: adjust coroutine pool size to virtio block queue
>=20
>  hw/block/virtio-blk.c    |  5 +++++
>  include/qemu/coroutine.h | 10 ++++++++++
>  util/qemu-coroutine.c    | 20 ++++++++++++++++----
>  3 files changed, 31 insertions(+), 4 deletions(-)
>=20
> --=20
> 2.17.1
>=20

Thanks, applied to my block tree:
https://gitlab.com/stefanha/qemu/commits/block

Stefan

--o7rctKGfnBsczmDM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIKjVIACgkQnKSrs4Gr
c8gv9ggAk68cJKwO+9pAMh/SKvrVN2vmXbMB8oqKFWSVGPKPtls8FrJBlPl725ao
gDVJE5jsiQBbodf6YlhyDuhli5/YGIWJbJS7A5TtzaRZL9eqvsGvsJrr36uOzsHU
oqMGFEQY9mjm6xcgEc+Mz8e/KvO86FagyNlwfa7TYMZ83xJqIH+JoxjMBBaQKau9
7wioljHVHqjUVBcjrM3PROqemg+1+VWA56IOTMSUbCsTuPleFPvBo10QydDDMko3
scdOL8gmkWweji03wL5udgpwEtDliiqi0hFQQjAHI5raSpo0tvI4lpn4S5hDfKr7
2RMckFwFhmC9IC8gvQapY/3VVo6o+w==
=cvCy
-----END PGP SIGNATURE-----

--o7rctKGfnBsczmDM--



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3432D567158
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 16:41:16 +0200 (CEST)
Received: from localhost ([::1]:35740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8jjn-0005Ea-AK
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 10:41:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o8jht-0004JS-6P
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 10:39:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o8jhp-0005ed-Ms
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 10:39:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657031953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TMMSgBT8Vwg/7w81pe09+ohTvJbH40a4VBSiJJsYKnw=;
 b=X5MzTkQOUIUVC0QTLJ9A9cla7UuVfrLA3wOH0H2ppiDQcFDybIE22O0LGsjoSfQlYZcaKN
 dNyTc7W4Z56pIpRUwD9ZSIACxymT9jFd0ZInf7R5tKuQGb/H5iC4sk6S1A6SLxJDseoVhW
 vYheX3oZLulQR68UIDE4wg4bEIvV5gE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-8Ow_kNCuMbO-bPRHcCzrCg-1; Tue, 05 Jul 2022 10:39:09 -0400
X-MC-Unique: 8Ow_kNCuMbO-bPRHcCzrCg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59C0018A6503;
 Tue,  5 Jul 2022 14:39:09 +0000 (UTC)
Received: from localhost (unknown [10.39.194.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B356041047E1;
 Tue,  5 Jul 2022 14:39:08 +0000 (UTC)
Date: Tue, 5 Jul 2022 15:39:07 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 6/8] virtio-blk: mark IO_CODE functions
Message-ID: <YsRNC0tj6YP2pgMi@stefanha-x1.localdomain>
References: <20220609143727.1151816-1-eesposit@redhat.com>
 <20220609143727.1151816-7-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YQkXKnWvsYrb8Mwn"
Content-Disposition: inline
In-Reply-To: <20220609143727.1151816-7-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--YQkXKnWvsYrb8Mwn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 09, 2022 at 10:37:25AM -0400, Emanuele Giuseppe Esposito wrote:
> Just as done in the block API, mark functions in virtio-blk
> that are called also from iothread(s).
>=20
> We know such functions are IO because many are blk_* callbacks,
> running always in the device iothread, and remaining are propagated
> from the leaf IO functions (if a function calls a IO_CODE function,
> itself is categorized as IO_CODE too).
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  hw/block/dataplane/virtio-blk.c |  4 ++++
>  hw/block/virtio-blk.c           | 35 +++++++++++++++++++++++++++++++++
>  2 files changed, 39 insertions(+)

The definition of IO_CODE() is:

  I/O API functions. These functions are thread-safe, and therefore
  can run in any thread as long as the thread has called
  aio_context_acquire/release().

I'm not sure it matches with the exact semantics you have in mind. Are
they really allowed to be called from any thread and even from multiple
threads? Or maybe just from the BlockBackend's AioContext thread?

We need to be very careful to define these terms precisely and avoid
applying them in cases that are similar but different as that will cause
problems in the future.

Otherwise:
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--YQkXKnWvsYrb8Mwn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLETQsACgkQnKSrs4Gr
c8gtgQf/UlzhYfcTcr4ozNg3pOHnMlz7SXxlwlny8LHFnrRVXLEro27AYA8qTh7F
xffWuoHecnOGdI38mk73Xlo2HeNiR7bAEwrMrKibK/TunPQx8vVAUZKxn71+ZY9b
mYBIE3GNMeNrXgQCR/Fg+oAh19P2mIbMRwQIYLsrlUGmqJV792jvrusgDVOEd1t+
hKJ+X7JohFqVusykvpqG2ApCr6yPq6B09OF/EtEXNFloYHrx7QKHAb0bkiXzpFq5
Yq6CdvkfGadtXZRBTStYPyaVhn1mRRYCvx9rqdCOXZ/9hNf/Ja7CI++TRC3DgAfc
f7gcbo41WmCKcfr1h6Pz9C3VDjDHZg==
=TqWN
-----END PGP SIGNATURE-----

--YQkXKnWvsYrb8Mwn--



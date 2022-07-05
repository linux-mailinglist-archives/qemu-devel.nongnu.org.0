Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEF85670F9
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 16:26:00 +0200 (CEST)
Received: from localhost ([::1]:49610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8jV0-0003Ck-T8
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 10:25:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o8jT8-00021c-PC
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 10:24:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o8jT5-0003KN-6n
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 10:24:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657031038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7J/IpdopbZrkh08aGkobgbx8h4cL9MaKuNGYS2J48cY=;
 b=UjcT/m6oZGDamtN+e2Jd3einSNbfrB8PFCFAQfWosWN+zZSoJyMyi6sF1ebAIWXETYW2WC
 2w7x+7nBdJwIIETZ8cgJ39c/ILqubUO2QAd3v67pNGlTUEnj1NqN/RsHB2QlvzyDsxp6Us
 5tBoynknijS+aBNBlaKRRe67qywrck0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-Oy-CFPQIMri52aFT45XwDQ-1; Tue, 05 Jul 2022 10:23:55 -0400
X-MC-Unique: Oy-CFPQIMri52aFT45XwDQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE524800C5B;
 Tue,  5 Jul 2022 14:23:54 +0000 (UTC)
Received: from localhost (unknown [10.39.194.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 49E70C15D58;
 Tue,  5 Jul 2022 14:23:54 +0000 (UTC)
Date: Tue, 5 Jul 2022 15:23:53 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 3/8] virtio_blk_process_queued_requests: always run in a bh
Message-ID: <YsRJeay6omYXu3Cd@stefanha-x1.localdomain>
References: <20220609143727.1151816-1-eesposit@redhat.com>
 <20220609143727.1151816-4-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZVmqHgt0ZQhozkXu"
Content-Disposition: inline
In-Reply-To: <20220609143727.1151816-4-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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


--ZVmqHgt0ZQhozkXu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 09, 2022 at 10:37:22AM -0400, Emanuele Giuseppe Esposito wrote:
> diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-=
blk.c
> index f9224f23d2..03e10a36a4 100644
> --- a/hw/block/dataplane/virtio-blk.c
> +++ b/hw/block/dataplane/virtio-blk.c
> @@ -234,8 +234,16 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
>          goto fail_aio_context;
>      }
> =20
> +    blk_inc_in_flight(s->conf->conf.blk);

Missing comment explaining why the in-flight counter is incremented and
where the matching decrement operation is located.

I think you can get away without a comment if blk_inc_in_flight() is
right next to aio_bh_new(), but in this case there are a few lines of
code in between and it becomes unclear if there is a connection.

> +    /*
> +     * vblk->bh is only set in virtio_blk_dma_restart_cb, which
> +     * is called only on vcpu start or stop.
> +     * Therefore it must be null.
> +     */
> +    assert(vblk->bh =3D=3D NULL);
>      /* Process queued requests before the ones in vring */

This comment makes an assumption about the order of file descriptor
handlers vs BHs in the event loop. I suggest removing the comment. There
is no reason for processing queued requests first anyway since
virtio-blk devices can complete requests in any order.

--ZVmqHgt0ZQhozkXu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLESXkACgkQnKSrs4Gr
c8jqswf+JaIGlkBoeonpdBOJl6T5wH9L8pgbGAw9VcSuFptN+n88qz6sAF1S3D/C
6U3GHXLzxA0kjavBwfWk4AT1ryeL/r4v9geBYI8akJ4Dd0SHt7IUMET2PGDvMt6D
TtiQ5dRhUbN7eaCYF425tGCWI+YJeCuS6DMC7zmPPMNNYFq2k9Ax7Gk8u/E7DrpB
hVVBXq2x1jxmkINpHL0odaJJbQXGNNms8zHhOt9CXplyer9YHWhOfVzkCfVsqYdo
6GPURSQEI2BjI/X3Dfc7ePipbMNbqPFoMnFizHtuGZ4xGPSqTYQozWFG2Eil5El0
O52rlwe0wsueWwPlk/OI3YcmUzrxcw==
=7B34
-----END PGP SIGNATURE-----

--ZVmqHgt0ZQhozkXu--



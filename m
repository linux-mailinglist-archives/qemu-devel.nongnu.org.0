Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2AD5670AE
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 16:13:55 +0200 (CEST)
Received: from localhost ([::1]:35034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8jJK-0001Zr-4J
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 10:13:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o8jHS-0008ON-A5
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 10:11:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o8jHN-0001d3-Ng
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 10:11:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657030313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BwJSoPbzbkUJ7TYsfMUhC4ZQs6tW4Pc3qU20nzBl+r0=;
 b=RMUvZoObPd2Wnpvi4Yw+XR7HF5zM32pCnO1aHOyPFTv99DmW6syDmeCnowLVD5CtiCTVCg
 8y7h9awY2eAddPtmj30yFTO3aPgfHR3RJcbUllJDypfJNdW2eT4f11m7qheOfaWz9r4HnK
 H4p8fKyMn4dm9GIgvB8UhtIC9TVVZAA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-pFVhEVLtORWhW2N_m2oneA-1; Tue, 05 Jul 2022 10:11:51 -0400
X-MC-Unique: pFVhEVLtORWhW2N_m2oneA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 168AE1C00136;
 Tue,  5 Jul 2022 14:11:51 +0000 (UTC)
Received: from localhost (unknown [10.39.194.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B153A417E5B;
 Tue,  5 Jul 2022 14:11:50 +0000 (UTC)
Date: Tue, 5 Jul 2022 15:11:49 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 1/8] virtio_queue_aio_attach_host_notifier: remove
 AioContext lock
Message-ID: <YsRGpb02psGIffrw@stefanha-x1.localdomain>
References: <20220609143727.1151816-1-eesposit@redhat.com>
 <20220609143727.1151816-2-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="k3l4a2J2+5PKl6kT"
Content-Disposition: inline
In-Reply-To: <20220609143727.1151816-2-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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


--k3l4a2J2+5PKl6kT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 09, 2022 at 10:37:20AM -0400, Emanuele Giuseppe Esposito wrote:
> @@ -146,7 +147,6 @@ int virtio_scsi_dataplane_start(VirtIODevice *vdev)
> =20
>      s->dataplane_starting =3D false;
>      s->dataplane_started =3D true;
> -    aio_context_release(s->ctx);
>      return 0;

This looks risky because s->dataplane_started is accessed by IO code and
there is a race condition here. Maybe you can refactor the code along
the lines of virtio-blk to avoid the race.

--k3l4a2J2+5PKl6kT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLERqUACgkQnKSrs4Gr
c8ghQAf/Wyp+kZlPx7hL2cbjY/H6RC+Sj/tBIR6mIgvYOIxOP2zjaiLwQeBJkPUx
Huzql4t2hxA1J3ZaPE0QM21SnlwHWJ9UpyNqRYBsEpBF6lTucqcdQ2h1T6M38TwN
y4YbBiE4z/idqVmnpEhBIK9P47/v2lJRjALLMPrGHItQ9vSi/8IUrZ+YwzMRO0Mv
IroO98VO8uQWMF7bHopoqGefqHkW7YjWgDU8URdOGBph6yH/c2yQ+otTVnoLx5ky
qXj05pSUpfrN/OnsgWhJIzygUBwuMoDv86mjG4Qp+t8dLEXkTyGf9DDdSClGlIkG
s6OtnnDykqSpAAYvmfv+rDFfASO7Xg==
=TIpc
-----END PGP SIGNATURE-----

--k3l4a2J2+5PKl6kT--



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2055670FC
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 16:27:04 +0200 (CEST)
Received: from localhost ([::1]:53608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8jW3-0005yd-Ug
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 10:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o8jV2-0004IP-0V
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 10:26:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o8jUz-0003dP-Mn
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 10:25:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657031157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=INuIZmbZNi1OauvtIrttEJ0Qx5DRBHuqof5p0klwRR0=;
 b=NPmxerhLmqK+CwL6WH0dmK848eDSKKBYnpoRPYLEwLxHGUa6T1FDZNkK07DCGVh6J1c8ou
 336u046DaeX00xOkUYIfPvAEbZUrHOlOLt9zU3SKRfCEJetsh1pC+50qDpXDXZh6d0sdU9
 kpN+kWlpDUd0n9BELShDvwMdxslWa1Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-310-TYoKou4MMlSwQvB-5fEWMQ-1; Tue, 05 Jul 2022 10:25:49 -0400
X-MC-Unique: TYoKou4MMlSwQvB-5fEWMQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9436885A580;
 Tue,  5 Jul 2022 14:25:49 +0000 (UTC)
Received: from localhost (unknown [10.39.194.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2FED92166B26;
 Tue,  5 Jul 2022 14:25:48 +0000 (UTC)
Date: Tue, 5 Jul 2022 15:25:47 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 4/8] virtio: categorize callbacks in GS
Message-ID: <YsRJ65VKz759Me3y@stefanha-x1.localdomain>
References: <20220609143727.1151816-1-eesposit@redhat.com>
 <20220609143727.1151816-5-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bTE8Hafg08r0+4iB"
Content-Disposition: inline
In-Reply-To: <20220609143727.1151816-5-eesposit@redhat.com>
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


--bTE8Hafg08r0+4iB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 09, 2022 at 10:37:23AM -0400, Emanuele Giuseppe Esposito wrote:
> All the callbacks below are always running in the main loop.
>=20
> The callbacks are the following:
> - start/stop_ioeventfd: these are the callbacks where
>   blk_set_aio_context(iothread) is done, so they are called in the main
>   loop.
>=20
> - save and load: called during migration, when VM is stopped from the
>   main loop.
>=20
> - reset: before calling this callback, stop_ioeventfd is invoked, so
>   it can only run in the main loop.
>=20
> - set_status: going through all the callers we can see it is called
>   from a MemoryRegionOps callback, which always run in the main loop.
>=20
> - realize: iothread is not even created yet.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  hw/block/virtio-blk.c  | 2 ++
>  hw/virtio/virtio-bus.c | 5 +++++
>  hw/virtio/virtio-pci.c | 2 ++
>  hw/virtio/virtio.c     | 8 ++++++++
>  4 files changed, 17 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--bTE8Hafg08r0+4iB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLESesACgkQnKSrs4Gr
c8i3gQgArNNbGs5sl3atTq6i2Y2Ldb+7254u/8Myd02pWzhsK6PO9ag1z7tOcO+B
o7q5ATwIEdXuAKuieFLbQhK/73wGoTTNCj89Pj41dC7YrM289+CyQHBl54EQVZ5Z
XMRSIVw2RhCLAiqo0fB57A8WHusbCEBgCopfqR4IyopxTb6G0/tohMAFz0EwG80y
fkGY7Fsoa//82B2uWX6m2scDlxQsZLywuUM3jyScIe8EDAiSAONZ3ybnF1c91TpT
fhqqthvV9CKIIRIOdRAUoQ9RwUsVj6pdtOO2eWoyb9D65BdabfHfGrDZH2sMO7rx
4a7htjw+1Tz6pUzp2BCS3S/xb4aQNg==
=N8of
-----END PGP SIGNATURE-----

--bTE8Hafg08r0+4iB--



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7CD4C8816
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 10:35:52 +0100 (CET)
Received: from localhost ([::1]:52252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOyv9-0004qx-5Z
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 04:35:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nOyqI-00020K-OL
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:30:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nOyqG-0003eN-7A
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:30:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646127046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MUlA5cEZy33Hp751GsLnVpi1duk2Nxo8Qsz6TMo+E/k=;
 b=iX1VH63qbdfv5QXc7quxs6u72vAtZ2hEnZy7avUn6wjWChye6kVzLjibKv7RSL5JEqbfz2
 Ry4G8nrDvjeKLbs6Dv+9kSI2yqWsTSdISj8cO9qP/TPniwmd86URza23KrzOQzEV8d2uMX
 FV/zW3evB9n9sXY/wDQwKROMXd5YoSE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-gkJ91UndOjyQO4rV-3SNOQ-1; Tue, 01 Mar 2022 04:30:44 -0500
X-MC-Unique: gkJ91UndOjyQO4rV-3SNOQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D74FF1854E26;
 Tue,  1 Mar 2022 09:30:43 +0000 (UTC)
Received: from localhost (unknown [10.39.194.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 54D687B6D1;
 Tue,  1 Mar 2022 09:30:43 +0000 (UTC)
Date: Tue, 1 Mar 2022 09:30:42 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH] vhost-vsock: detach the virqueue element in case of error
Message-ID: <Yh3nwkYUFGdqBiPR@stefanha-x1.localdomain>
References: <20220228095058.27899-1-sgarzare@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="a0UT08yI+zhKAH+A"
Content-Disposition: inline
In-Reply-To: <20220228095058.27899-1-sgarzare@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: VictorV <vv474172261@gmail.com>, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--a0UT08yI+zhKAH+A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 28, 2022 at 10:50:58AM +0100, Stefano Garzarella wrote:
> In vhost_vsock_common_send_transport_reset(), if an element popped from
> the virtqueue is invalid, we should call virtqueue_detach_element() to
> detach it from the virtqueue before freeing its memory.
>=20
> Fixes: fc0b9b0e1c ("vhost-vsock: add virtio sockets device")
> Cc: qemu-stable@nongnu.org
> Reported-by: VictorV <vv474172261@gmail.com>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  hw/virtio/vhost-vsock-common.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--a0UT08yI+zhKAH+A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmId58IACgkQnKSrs4Gr
c8h9Nwf/Y37G+/3uJayv8CweajGHfiXcSaDSeZGRhL8COw/b4UHXqiIrvGzjWioO
KwFVaRBgRFepzjiuoE04Vj8EQvp4v5n4HeM8ejdE6n3EORlqn3okevEnIfa3khFO
gXsLLkP6vI0G8KALwnX+L7AVfiUCPO4dqkjFcOGjYty8+WURnfe+4GYkNB2c726Q
E4L1GASu+nRDuJWptkNdQIjpTmr3gCOQ7odW3nwW3/JvZLw5vDSNHjfKLyrDRXZQ
M79HDHn40OwwNhziIzXvfpXwaycwdDw7Mk0ZciVi2myqoI521RIr91nvLvm86bVV
pCFCDlmqmAoaiBGQaEFE0xnOpuw7aA==
=ZhvD
-----END PGP SIGNATURE-----

--a0UT08yI+zhKAH+A--



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6142F3FEDC1
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 14:27:37 +0200 (CEST)
Received: from localhost ([::1]:38076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLloe-0003ef-Ee
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 08:27:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mLlVl-0006Vj-6T
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:08:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mLlVj-0000kh-SL
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:08:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630584483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3crM7PkvPy0GyRkrcCWTSJUGkHrmh5rfybrtvTcmQHo=;
 b=LnFjo/8q3tENUW5I9JzhUEVMHTif7QN25sZpyzkTk+tSB9Ht/ArRi/bwkk8G9uZJI2LB/q
 iPKM/H6ZoJXirZjLLBVygz4pZtWxgbtRrppRq7GmewFTp9lG0LiNFx6BaEIIf4rLO8Gi9C
 zQzlgwA8Z6AI6JblRUK1iaJ/JLzpQzI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-I0cLt08BOwqzk-ombaQlMw-1; Thu, 02 Sep 2021 08:07:59 -0400
X-MC-Unique: I0cLt08BOwqzk-ombaQlMw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82FFC188E3C9
 for <qemu-devel@nongnu.org>; Thu,  2 Sep 2021 12:07:58 +0000 (UTC)
Received: from localhost (unknown [10.39.194.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F022179B3;
 Thu,  2 Sep 2021 12:07:55 +0000 (UTC)
Date: Thu, 2 Sep 2021 13:07:54 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 1/3] hw/virtio: Document virtio_queue_packed_empty_rcu is
 called within RCU
Message-ID: <YTC+mmeJO9Pp2Pun@stefanha-x1.localdomain>
References: <20210826172658.2116840-1-philmd@redhat.com>
 <20210826172658.2116840-2-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210826172658.2116840-2-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FCP4T42gYgpJ4u/X"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--FCP4T42gYgpJ4u/X
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 26, 2021 at 07:26:56PM +0200, Philippe Mathieu-Daud=E9 wrote:
> While virtio_queue_packed_empty_rcu() uses the '_rcu' suffix,
> it is not obvious it is called within rcu_read_lock(). All other
> functions from this file called with the RCU locked have a comment
> describing it. Document this one similarly for consistency.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  hw/virtio/virtio.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--FCP4T42gYgpJ4u/X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEwvpoACgkQnKSrs4Gr
c8gWJQf8DJVVvfzRwQO6wEvXzvGxYtvlw31tAkcOLj+lhMR0okJWcMT9aeh8/GaT
WCSbGE0l5jA/Rk6uSUhSFFdy6+x1FnLvlL98EzGv8Cb9cjVQz/Kty6OZQWwR2Iha
RakwdQx+e8UFtMLoWi8qK1MJj0mMqvz0UR86NVFTuM/WaqKr/lIt8C6TmRlSt7fk
WXOpLX8nQqxoIm/HAdZG0xMP7823xWdttTQqSkGWLnvehO8dC9OzQSW0wt+3hX/m
umaLth6rw9NcIHWwHxMgpbHTORteETNJzhdr7pKrjmfkemkRx3ltey38j+oQvqRQ
VYHTv1CSBn13EnL7BLD9tGahhULRoQ==
=TkCh
-----END PGP SIGNATURE-----

--FCP4T42gYgpJ4u/X--



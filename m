Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 701FA3C5DA9
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 15:48:35 +0200 (CEST)
Received: from localhost ([::1]:53838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2wIU-0005fm-ET
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 09:48:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m2w99-0008Lg-I1
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 09:38:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m2w95-0008NQ-LB
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 09:38:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626097130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OlTInXMq4xSzpbYmhQCnYljBDxoCTSlj6lF0PwkeQD8=;
 b=K3znLD9tdehsK8tu7azFhgGsddUUgnHbHMhaevf6ykSZT7gF6x4INmJHGSIR3q1lLde5PW
 mlJOIo8WywfML+0VsVEibLJuXOlPsNvUq6i4/AIkkGJ4ytErc13gdLRk69VvgL1zaFMJM9
 bzn3Ky2UrgF5IWZejDie6gIz0B1l5Ow=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-mIp1HL9hP4yeL9eebkibog-1; Mon, 12 Jul 2021 09:38:46 -0400
X-MC-Unique: mIp1HL9hP4yeL9eebkibog-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 193081084F4B;
 Mon, 12 Jul 2021 13:38:45 +0000 (UTC)
Received: from localhost (ovpn-112-230.ams2.redhat.com [10.36.112.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B60135D9DC;
 Mon, 12 Jul 2021 13:38:44 +0000 (UTC)
Date: Mon, 12 Jul 2021 14:38:41 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] io_uring: move LuringState typedef to block/aio.h
Message-ID: <YOxF4TYmEKDrA//d@stefanha-x1.localdomain>
References: <20210712131030.465621-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210712131030.465621-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KKDuFAQ8SkugqBuV"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--KKDuFAQ8SkugqBuV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 12, 2021 at 03:10:30PM +0200, Paolo Bonzini wrote:
> The LuringState typedef is defined twice, in include/block/raw-aio.h and
> block/io_uring.c.  Move it in include/block/aio.h, which is included
> everywhere the typedef is needed, since include/block/aio.h already has
> to define the forward reference to the struct.
>=20
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/io_uring.c        | 4 ++--
>  include/block/aio.h     | 8 ++++----
>  include/block/raw-aio.h | 1 -
>  3 files changed, 6 insertions(+), 7 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--KKDuFAQ8SkugqBuV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDsReEACgkQnKSrs4Gr
c8hz7wgAqNBROfrCm2lQSbC4DJhl1Dn3vZ6Ad0BV1qvDKq+OhRMbXm5XvPIA+jvC
hQvdqZFLMXt0JTylbTsribnSEU3G3mnOJB40ddHeC1KAwjfSYnReD8t5fXZ+ahX4
dwqtWjMSbkl0pqlNRd8fp3wvVQ/RIyU1Hzh6HITX8NEQ0xSKydVXCiPEqg369OdK
RUZrlZEff7JvKmWurIc67HSmcSsvOyEFoGjxIiseh7MJnzS3rlKfkq/uIfiALZom
PRSTkCCAXt3bw3k66BJpCKpb9JsZGmjtujiDj56moTQbVXvD5rmLKG895fOQ8czt
2bRA4hAa1HroDBNwn47AdTbJ7HEiVw==
=1C7p
-----END PGP SIGNATURE-----

--KKDuFAQ8SkugqBuV--



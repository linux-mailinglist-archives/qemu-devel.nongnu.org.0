Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1638566F54
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 15:36:54 +0200 (CEST)
Received: from localhost ([::1]:44728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8ijV-0001e2-Ia
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 09:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o8ih7-0000B9-3u
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 09:34:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o8ih4-0003nN-GP
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 09:34:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657028061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YsXaBiteu6FQYn7eto3vCV2rMXyJyOmG9SdXapRWOxE=;
 b=dLX061W/os/pz4hDTPfmJClTZNgvSKuHnaNzGFKb3NBeRh139LjKXvDpOAhMMyvxc8sNJX
 jVJSUoj1J/B1SYj02wt8s/CmqmehtnRX1yLo1UbEpzRnj/XFxFthQDPNwxYC0IeciQfGTS
 UuaOdaGEvqFQamI2sybsjGOhkzlQFGo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-219-5YQTuR5SPAyjIAhbS86MYQ-1; Tue, 05 Jul 2022 09:34:18 -0400
X-MC-Unique: 5YQTuR5SPAyjIAhbS86MYQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B3BE83804509;
 Tue,  5 Jul 2022 13:34:17 +0000 (UTC)
Received: from localhost (unknown [10.39.194.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C27C40336E;
 Tue,  5 Jul 2022 13:34:17 +0000 (UTC)
Date: Tue, 5 Jul 2022 14:34:15 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Dominique Martinet <dominique.martinet@atmark-techno.com>
Cc: Aarushi Mehta <mehta.aaru20@gmail.com>, Julia Suvorova <jusual@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Filipe Manana <fdmanana@kernel.org>
Subject: Re: [PATCH v2] io_uring: fix short read slow path
Message-ID: <YsQ918wdl4P0IvjD@stefanha-x1.localdomain>
References: <20220629044957.1998430-1-dominique.martinet@atmark-techno.com>
 <20220630010137.2518851-1-dominique.martinet@atmark-techno.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NdZhwq7f2BNYG9Vy"
Content-Disposition: inline
In-Reply-To: <20220630010137.2518851-1-dominique.martinet@atmark-techno.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--NdZhwq7f2BNYG9Vy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 30, 2022 at 10:01:37AM +0900, Dominique Martinet wrote:
> sqeq.off here is the offset to read within the disk image, so obviously
> not 'nread' (the amount we just read), but as the author meant to write
> its current value incremented by the amount we just read.
>=20
> Normally recent versions of linux will not issue short reads,
> but it can happen so we should fix this.
>=20
> This lead to weird image corruptions when short read happened
>=20
> Fixes: 6663a0a33764 ("block/io_uring: implements interfaces for io_uring")
> Link: https://lkml.kernel.org/r/YrrFGO4A1jS0GI0G@atmark-techno.com
> Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
> ---
> v1 -> v2: also updated total_read to use +=3D as suggested by Kevin,
> thank you!
>=20
> I've tested this quickly by making short reads "recursives", e.g. added
> the following to luring_resubmit_short_read() after setting 'remaining':
>     if (remaining > 4096) remaining -=3D 4096;
>=20
> so when we ask for more we issue an extra short reads, making sure we go
> through the two short reads path.
> (Unfortunately I wasn't quite sure what to fiddle with to issue short
> reads in the first place, I tried cutting one of the iovs short in
> luring_do_submit() but I must not have been doing it properly as I ended
> up with 0 return values which are handled by filling in with 0 (reads
> after eof) and that didn't work well)
>=20
> Anyway, this looks OK to me now.
>=20
> Thanks,
> Dominique
>=20
>  block/io_uring.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Thanks, applied to my block tree:
https://gitlab.com/stefanha/qemu/commits/block

Stefan

--NdZhwq7f2BNYG9Vy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLEPdcACgkQnKSrs4Gr
c8gEcQgAt4qiS4B4vELWIfJh021iCGijrk9gRXF3uCxQl2sCVCccUdu/msT3r875
HC5a+nLRh+54Xl+rdcR+uEPYqesFQUk4PibyJQXixDO9Mj277q4WaHWvPkvT66xS
Agfobb032SHCOvZyj4x4wP9rs9ILLz0cigvhE4QPEUjI2kye4WKOTjDqs6OIN3Pe
XLGUbFDOOFxupqwWpdc+NdHfukypVYhgaYpRIr4hQzjnjuXJMTAyRrzN9ISR74aX
0gqMcrGsaqnqPWrTpVL16UqUXhEtiJowVuIsLA8BYwtznFovJQb7KWr8joyvVq39
GWWs8E9jZEQO5m56dIy4XDEGtDYsGg==
=LgFI
-----END PGP SIGNATURE-----

--NdZhwq7f2BNYG9Vy--



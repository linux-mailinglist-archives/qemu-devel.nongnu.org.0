Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E58086F4B07
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 22:11:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptwKh-0007QU-DN; Tue, 02 May 2023 16:10:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptwKe-0007Ps-OE
 for qemu-devel@nongnu.org; Tue, 02 May 2023 16:10:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptwKc-0001nj-9b
 for qemu-devel@nongnu.org; Tue, 02 May 2023 16:10:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683058237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G3M6X6Cb/uW8g9mA7FuVSmxMkf0IsGJPoGtjU0Aq7ck=;
 b=RZxDJe5lu4RnGcmN+KYDTrqtX7hrzuZzbT2Beipg3nNRdhCAPthdixq8qoRBt3l59wscW8
 qcsgj0Zt4h1IxBUffsPO2o3AT1V9brxXxYH/02H2VCMtD8+VoZMDrUTwarfpMVchnSUVAo
 6U8cRZm+2CHan+r0/c7LeYkJciKsnZA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-bZJNyyK4N4GaEmywDujudQ-1; Tue, 02 May 2023 16:10:34 -0400
X-MC-Unique: bZJNyyK4N4GaEmywDujudQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 04349381D4CF;
 Tue,  2 May 2023 20:10:33 +0000 (UTC)
Received: from localhost (unknown [10.39.192.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A3BA2026D16;
 Tue,  2 May 2023 20:10:32 +0000 (UTC)
Date: Tue, 2 May 2023 16:10:29 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Julia Suvorova <jusual@redhat.com>, xen-devel@lists.xenproject.org,
 eesposit@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Lieven <pl@kamp.de>, Paul Durrant <paul@xen.org>,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-block@nongnu.org,
 Stefano Garzarella <sgarzare@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Stefan Weil <sw@weilnetz.de>, Xie Yongji <xieyongji@bytedance.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Hanna Reitz <hreitz@redhat.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>
Subject: Re: [PATCH v4 10/20] block: drain from main loop thread in
 bdrv_co_yield_to_drain()
Message-ID: <20230502201029.GF535070@fedora>
References: <20230425172716.1033562-1-stefanha@redhat.com>
 <20230425172716.1033562-11-stefanha@redhat.com>
 <ZFE4gFFXnu+FSk35@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="brpBxr+X1vKHT7XM"
Content-Disposition: inline
In-Reply-To: <ZFE4gFFXnu+FSk35@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--brpBxr+X1vKHT7XM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 02, 2023 at 06:21:20PM +0200, Kevin Wolf wrote:
> Am 25.04.2023 um 19:27 hat Stefan Hajnoczi geschrieben:
> > For simplicity, always run BlockDevOps .drained_begin/end/poll()
> > callbacks in the main loop thread. This makes it easier to implement the
> > callbacks and avoids extra locks.
> >=20
> > Move the function pointer declarations from the I/O Code section to the
> > Global State section in block-backend-common.h.
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>=20
> If we're updating function pointers, we should probably update them in
> BdrvChildClass and BlockDriver, too.

I'll do that in the next revision.

> This means that a non-coroutine caller can't run in an iothread, not
> even the home iothread of the BlockDriverState. (I'm not sure if it was
> allowed previously. I don't think we're actually doing this, but in
> theory it could have worked.) Maybe put a GLOBAL_STATE_CODE() after
> handling the bdrv_co_yield_to_drain() case? Or would that look too odd?
>=20
>     IO_OR_GS_CODE();
>=20
>     if (qemu_in_coroutine()) {
>         bdrv_co_yield_to_drain(bs, true, parent, poll);
>         return;
>     }
>=20
>     GLOBAL_STATE_CODE();

That looks good to me, it makes explicit that IO_OR_GS_CODE() only
applies until the end of the if statement.

Stefan

--brpBxr+X1vKHT7XM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRRbjUACgkQnKSrs4Gr
c8gcCwf/T65LBfJJcwJAyvlXRfg2oJ/yZvsfJ3BZCAaupLZjx+EeDLlXwOdhSb2S
GKjZnCRY+804xb2asfcWI/aD6+FfB/OtlSQmoNpLQ0rRSl0ySEwoAolto1Z9ekGZ
L+Jfc76d+YxOe+NNrrZ9OzISmnofdrQVvqoJotHO/4bB0pUPvWzJG4f+ji/jy3u/
A+7u0pbN8C5zVOa6Cd3OXliYePtIv3nGH9xL8HmL/6YQD5rcPgFj2HlylhSMjRqy
dY54mvDssnwZL5sI2RfogH00TesZlaXrVwMD5Mr+HJ/T5H3myPLw1Y3RCgiPVLCM
WUaRx6PORhkBp198DzErfTVGl1grqQ==
=G1hQ
-----END PGP SIGNATURE-----

--brpBxr+X1vKHT7XM--



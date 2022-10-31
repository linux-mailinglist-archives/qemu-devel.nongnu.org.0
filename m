Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F54613DCC
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 19:53:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opZtp-0000pS-Ly; Mon, 31 Oct 2022 14:52:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opZtj-0000fU-AW
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 14:52:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opZth-0003Vm-Hf
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 14:52:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667242352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MkRq7WawUAANKjrMp1XQ+4Y8CgUonvAPVtyStLJ2vNw=;
 b=NDWKjquugmPOaheIlZixC05Hbh+W6xvah1jztlE5AxKOgi46giP+/is0lhL0mRlQmwheJG
 i5ojgOISDACpyDYxcvid/xzL7cB72eDQZVcTl6TYiliyILniQRBbV7MnvZ66O+CX0+eH9F
 k/tNwTUG/XJQzlMW9SnyT7wyhrdA8kc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-466-CaTPqp1nP_OAUjXU75GT3Q-1; Mon, 31 Oct 2022 14:52:30 -0400
X-MC-Unique: CaTPqp1nP_OAUjXU75GT3Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C63E1884343;
 Mon, 31 Oct 2022 18:52:29 +0000 (UTC)
Received: from localhost (unknown [10.39.192.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 457B840C2066;
 Mon, 31 Oct 2022 18:52:28 +0000 (UTC)
Date: Mon, 31 Oct 2022 14:23:32 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alberto Faria <afaria@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH] block/blkio: Make driver nvme-io_uring take a "path"
 instead of a "filename"
Message-ID: <Y2ASpHfLteNp45Hm@fedora>
References: <20221028233854.839933-1-afaria@redhat.com>
 <87fsf7f9lo.fsf@pond.sub.org>
 <CAELaAXxo=UznziCZSAUE2rrUcKUoa9J=geornEAuD2Buq1YKUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SqeU2mJ2zaznOYad"
Content-Disposition: inline
In-Reply-To: <CAELaAXxo=UznziCZSAUE2rrUcKUoa9J=geornEAuD2Buq1YKUA@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org


--SqeU2mJ2zaznOYad
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 29, 2022 at 10:50:40AM +0100, Alberto Faria wrote:
> On Sat, Oct 29, 2022 at 7:05 AM Markus Armbruster <armbru@redhat.com> wro=
te:
> > Alberto Faria <afaria@redhat.com> writes:
> >
> > > The nvme-io_uring driver expects a character special file such as
> > > /dev/ng0n1. Follow the convention of having a "filename" option when a
> > > regular file is expected, and a "path" option otherwise.
> >
> > I suspect this is by accident, not by design.  Is it desirable?
>=20
> I'm not sure. Naturally I'd be happier if either "filename" or "path"
> was used everywhere. Maybe we should settle on a single one for all
> the libblkio drivers? Or maybe we should just leave things as is?

It wasn't an accident but maybe it was still a bad idea on my part.

My thinking was that io_uring takes regular files and therefore the
"filename" option name is appropriate. UNIX domain sockets and special
devices usually have the "path" option name (e.g. --chardev socket,path=3D
for AF_UNIX).

I agree with changing the option to "path" for nvme-io_uring.

The overall naming strategy is debatable. I think we can keep it, but if
the majority wants everything to be "filename" or "path" I'd be okay
with that.

Stefan

--SqeU2mJ2zaznOYad
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNgEqMACgkQnKSrs4Gr
c8jlDggAxr3RUm5Vvff6Jti+uJHO0DjxfPI21CidjAXNUXI/4gP6pwFYPgcP2E9g
/+NjlMMDE76ck1xzItAWkZqSXpTmk7gq3CwqSwWR/z3SJ2CirKvSBCQupjEV5FTI
AdlrlmsOpf6A8tGvr2d3EF3ryruCyXRNRat//FWHD64zmR/DTbBI35L08/ZIQSqF
kPAs4Vv7PLpL9snm+bbYoMGeLNNPwOHrAMgfjZsbVOAevumLihWICUAj5VuPGTn3
Ye6uNgbfZIkCb2D/aLyGsql0UNcMDczOWX/4vh5k62casjCPBX1lXzvSxbFm20Hh
2iPTLwGQe3ljxsUjYiP97Ff6nharhA==
=Nkrw
-----END PGP SIGNATURE-----

--SqeU2mJ2zaznOYad--



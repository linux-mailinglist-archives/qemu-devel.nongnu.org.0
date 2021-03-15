Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B34533BFC8
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 16:33:55 +0100 (CET)
Received: from localhost ([::1]:45250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLpEA-0000sn-56
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 11:33:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lLpCM-0008Qu-PI
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 11:32:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lLpCJ-0003hk-L5
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 11:32:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615822318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1VjiOqNXrA8e/PMM2F7QNOB8FooDSueAvAM2m6qoLxY=;
 b=StJSLBwfvvz5bn+r1jkF/AVvWT0DgQFEBQ/0jftivSK03zy+DUvibHh3KWRqDg5rId8I2k
 pDhWMr1WD7wnjKaY/C1Dv26v8bVIq15fvDAr8VLpAjWeJ3Q/0xnE/6K8NiRxSA/HBl9Gi8
 9VZwRum2c+JeVJ3hxX0BWT0z5PnH9wI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-4lojJsk7OCyn4FibHQ9DyA-1; Mon, 15 Mar 2021 11:31:55 -0400
X-MC-Unique: 4lojJsk7OCyn4FibHQ9DyA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64EC21932482;
 Mon, 15 Mar 2021 15:31:54 +0000 (UTC)
Received: from localhost (ovpn-115-125.ams2.redhat.com [10.36.115.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B87B97A8CA;
 Mon, 15 Mar 2021 15:31:53 +0000 (UTC)
Date: Mon, 15 Mar 2021 15:31:52 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Connor Kuehl <ckuehl@redhat.com>
Subject: Re: [PATCH] Document qemu-img options data_file and data_file_raw
Message-ID: <YE996DHSGNXSkEtv@stefanha-x1.localdomain>
References: <20210301172837.20146-1-ckuehl@redhat.com>
 <7e18947e-55bd-7f22-a28b-cd226f6bfc3b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <7e18947e-55bd-7f22-a28b-cd226f6bfc3b@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="caS8vtCYjNmIKQxU"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, hhan@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--caS8vtCYjNmIKQxU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 08, 2021 at 10:43:54AM -0600, Connor Kuehl wrote:
> On 3/1/21 11:28 AM, Connor Kuehl wrote:
> > The contents of this patch were initially developed and posted by Han
> > Han[1], however, it appears the original patch was not applied. Since
> > then, the relevant documentation has been moved and adapted to a new
> > format.
> >=20
> > I've taken most of the original wording and tweaked it according to
> > some of the feedback from the original patch submission. I've also
> > adapted it to restructured text, which is the format the documentation
> > currently uses.
> >=20
> > [1] https://lists.nongnu.org/archive/html/qemu-block/2019-10/msg01253.h=
tml
> >=20
> > Reported-by: Han Han <hhan@redhat.com>
> > Co-developed-by: Han Han <hhan@redhat.com>
> > Fixes: https://bugzilla.redhat.com/1763105
> > Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
>=20
> I am not sure whose tree this is best suited for;
> ./scripts/get_maintainers.pl only showed other contributors to this file =
and
> not an explicit maintainer, per se.

It can go through Kevin Wolf or Max Reitz's trees. They maintain
qemu-img.

Stefan

--caS8vtCYjNmIKQxU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBPfegACgkQnKSrs4Gr
c8hruggAoS1IlfOP/dHRtU8hLEnw3ub8w75VJOtJCRdSKlaOJPQP2pm+fYM44NT6
xTbmZNDEcIeBeyiyxlrxkHiUH2SwIDqgWsWSpAGrkV1StbKLJfHxDRiIOcIh8PIO
88nRd5CSh+ECAUiKyGUtstrHz2o/7aaR66Ja+B1GnAkJhCLNNtOW82diS2SFKF1z
1aa7OlVOBnG4iGr4hyKthLnOtarXC9a0UkR/IrJVPfG1XZj8sKSyvt3AwzcbJjYk
fn1hu02G4a0ycVMP5FOCMTQTyY5YGln9pH5STr+sYI24UePn0oFLhmLZmInFxk4V
O5w4ieFCLekJKaHFHs/r1JChLgUxUw==
=FtS9
-----END PGP SIGNATURE-----

--caS8vtCYjNmIKQxU--



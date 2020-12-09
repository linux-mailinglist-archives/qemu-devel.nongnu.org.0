Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 603262D3FCC
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 11:24:21 +0100 (CET)
Received: from localhost ([::1]:59744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmwdw-0006oC-Cw
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 05:24:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kmwbq-0005sL-1H
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 05:22:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kmwbi-0001W1-Sh
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 05:22:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607509320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P6PvPSbJD+3QsoG38d30J3DN5cl03pBFi9ucCmhdypc=;
 b=GXB+fJgQAOsAHiQX2f3BH7tIZCr9DcuufOkSGpBPgC68g72rqrJH91EKx0o4HG/Sa/wwVZ
 MmHA72DdOFpaXgCzhMIN0b0EbngN9uu5iMBg7cxyM8oZyfN4syfwSx1ByiGsC8FVihkMWN
 mSr0K1G1arhMrhEBaV56+90YsAJrNRk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-m-k17iygPEm5c5bw6znNeA-1; Wed, 09 Dec 2020 05:21:58 -0500
X-MC-Unique: m-k17iygPEm5c5bw6znNeA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30B01107ACE8;
 Wed,  9 Dec 2020 10:21:57 +0000 (UTC)
Received: from localhost (ovpn-115-48.ams2.redhat.com [10.36.115.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C2C5F1001901;
 Wed,  9 Dec 2020 10:21:56 +0000 (UTC)
Date: Wed, 9 Dec 2020 10:21:55 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 1/3] docs: generate qemu-storage-daemon-qmp-ref(7) man
 page
Message-ID: <20201209102155.GA304374@stefanha-x1.localdomain>
References: <20200910144400.69615-1-stefanha@redhat.com>
 <20200910144400.69615-2-stefanha@redhat.com>
 <20201006102255.GC4202@linux.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20201006102255.GC4202@linux.fritz.box>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Kashyap Chamarthy <kchamart@redhat.com>,
 afrosi@redhat.com, Laszlo Ersek <lersek@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 06, 2020 at 12:22:55PM +0200, Kevin Wolf wrote:
> Am 10.09.2020 um 16:43 hat Stefan Hajnoczi geschrieben:
> > Although qemu-storage-daemon QMP commands are identical to QEMU QMP
> > commands they are a subset. Generate a manual page of just the commands
> > supported by qemu-storage-daemon so that users know exactly what is
> > available in qemu-storage-daemon.
> >=20
> > Add an h1 heading in storage-daemon/qapi/qapi-schema.json so that
> > block-core.json is at the h2 heading level.
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>=20
> As the series doesn't apply any more, I can't actually try it out
> easily, but is the order of includes in the schema right now?
>=20
> I seem to remember that in v1 we discussed that nested includes result
> in an unexpected section structure in the documentation in some cases
> (such as generic jobs being documented in a subsection of block
> devices), and that we need to reorder includes in qapi-schema.json to
> fix this because a more clever doc generator wasn't considered worth the
> effort.

v2 onwards takes a different approach and leaves the header where it is.

Stefan

--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/QpUMACgkQnKSrs4Gr
c8gv5ggAxMHi1l3TvCWyhsXme+ROmBZi6Olg0wBsAhLnNS7vjqg0yID/46Sqoxei
dqhTPtltmqAMhhcNDUvCj2rwjFlB1RP35PwrL8CRXGVufQVD4pe6aYO8eucQPNSo
V8op7TPgZIaL/y6cQ4UDRpRdf3w9Uhy1GnoWY5KTgrHYdnw9XuqG7SMr4H00+2sZ
cM78yMB+lszF7J0Hff5Ww2r+uDWvHKwKSxgUvAG7luP/J/kWz679m6YP/WvO1iPK
Ie6Xs4037L7aPxdw4CbcytrCy/PtSmwr27neUg8/MW65Wadgs7EAiyh47ie6wSDJ
8HLrIrSY5772DQABJC2EcRooHHilIg==
=pxIl
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--



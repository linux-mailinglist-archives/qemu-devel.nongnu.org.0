Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA6237A2AC
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 10:54:06 +0200 (CEST)
Received: from localhost ([::1]:39470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgO9V-0003WF-IK
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 04:54:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lgNgH-0005O0-6S
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:23:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lgNgB-0006Rx-SG
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:23:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620721427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FXKU8cBeeGCJwmkSXs6r0J/Gb0gJHNwCZvdXGPOZmIU=;
 b=R6K5MGQzjhj86plMFjzXrRNb2BJFWjZCivZRLPFUX+51jrvhpY9CTOwrh1lJbtB+jJ/2yX
 M6h9pJ3FkWAAVGy7IAMXUXN+utmE2Ypg4YASZWQ0WYxzFIEI1mG0OIZqxZJBp+EQrtu3zl
 nSv7xhA/6GuefTRGBRHAeSRRtJ1hclI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-RrezICLGM5CKe3MNCwF9MQ-1; Tue, 11 May 2021 04:23:43 -0400
X-MC-Unique: RrezICLGM5CKe3MNCwF9MQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61BCA107ACCA;
 Tue, 11 May 2021 08:23:42 +0000 (UTC)
Received: from localhost (ovpn-112-6.ams2.redhat.com [10.36.112.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0DF186E6F7;
 Tue, 11 May 2021 08:23:41 +0000 (UTC)
Date: Tue, 11 May 2021 09:23:41 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/3] vhost-user-blk-test: add tests for the
 vhost-user-blk server
Message-ID: <YJo/Db3oifY5e6os@stefanha-x1.localdomain>
References: <20210322092327.150720-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210322092327.150720-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+VPXs7KPZnZTtpOJ"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Coiby Xu <Coiby.Xu@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--+VPXs7KPZnZTtpOJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 22, 2021 at 09:23:24AM +0000, Stefan Hajnoczi wrote:
> These patches add a qtest for the vhost-user-blk server. CI found several
> issues that caused these patches to be dropped from Michael Tsirkin and K=
evin
> Wolf's pull requests in the past. Hopefully they will go in smoothly this=
 time!
>=20
> Coiby Xu (1):
>   test: new qTest case to test the vhost-user-blk-server
>=20
> Stefan Hajnoczi (2):
>   tests/qtest: add multi-queue test case to vhost-user-blk-test
>   vhost-user-blk-test: test discard/write zeroes invalid inputs
>=20
>  MAINTAINERS                         |   2 +
>  tests/qtest/libqos/vhost-user-blk.h |  48 ++
>  tests/qtest/libqos/vhost-user-blk.c | 130 ++++
>  tests/qtest/vhost-user-blk-test.c   | 989 ++++++++++++++++++++++++++++
>  tests/qtest/libqos/meson.build      |   1 +
>  tests/qtest/meson.build             |   4 +
>  6 files changed, 1174 insertions(+)
>  create mode 100644 tests/qtest/libqos/vhost-user-blk.h
>  create mode 100644 tests/qtest/libqos/vhost-user-blk.c
>  create mode 100644 tests/qtest/vhost-user-blk-test.c

Ping for QEMU 6.1

Stefan

--+VPXs7KPZnZTtpOJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCaPwwACgkQnKSrs4Gr
c8h0gggAhTESXTBmC6XTTVJgELUCKELr8oum/zvHyDLPpppeB8BdcLHw8Nm6J+Nz
csd9VnIoRdJ1U5j41t+xuEtiD0DrG1EnU53tqY2ai90ZP1zv2b4PNb7KpTlfrG6/
XKy6jsz2Nh4zBtZ3Mgx8lgi6FsJWv7Ga8Yre0Wfq/IOgTPGlACVuAWE7nIqE1q2M
IO1L3yyIygix0I5bhr4pWcjmFdYUkvZTzJtAdglxY/zETLHwveMORQmbQz2oEJNk
Dg0IfQJnUZhyTv8X31xYXwEPmfjh+hSHDFBqJnZtn5DpI7dlEASGmK5N9dUeKbj7
9wNmzeiW4LERM2A5HsJNKmUEaizA8A==
=VrjY
-----END PGP SIGNATURE-----

--+VPXs7KPZnZTtpOJ--



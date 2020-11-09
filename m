Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 470042AB4B3
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Nov 2020 11:21:53 +0100 (CET)
Received: from localhost ([::1]:47732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kc4J6-0005P2-CZ
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 05:21:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kc4Hk-0004VB-Ci
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 05:20:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kc4Hi-0006ls-Td
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 05:20:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604917226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VpRHQnExDFrdqSBF2PbsFn3iv9DZRA2qGY+87YBeSzs=;
 b=hpOoF4MORCVqgyiSdmh+FcsiQfEhCChb9ljaUDk5wrTJDbOlabQPKCSLqJPTTkgbt2loc2
 56YBI5xIsdQK6OMncPGhgmRtw3IXDPlITEJ7SgD+KdqrCiBJquzL66cB40mA1gTrrO7CFh
 qlTa2Ta50TLnHxPuz4fTayOTh2eLiJ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-zak5aPXWOo26YbKKdS4jug-1; Mon, 09 Nov 2020 05:20:23 -0500
X-MC-Unique: zak5aPXWOo26YbKKdS4jug-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9162805F12
 for <qemu-devel@nongnu.org>; Mon,  9 Nov 2020 10:20:22 +0000 (UTC)
Received: from localhost (ovpn-114-110.ams2.redhat.com [10.36.114.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5962F5C22B;
 Mon,  9 Nov 2020 10:20:19 +0000 (UTC)
Date: Mon, 9 Nov 2020 10:20:18 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-5.2] configure: Check vhost-user is available to
 build vhost-user-blk-server
Message-ID: <20201109102018.GE783516@stefanha-x1.localdomain>
References: <20201106190409.10571-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201106190409.10571-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4Epv4kl9IRBfg3rk"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 00:04:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--4Epv4kl9IRBfg3rk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2020 at 08:04:09PM +0100, Philippe Mathieu-Daud=E9 wrote:
> Check vhost-user is available to build vhost-user-blk-server to fix:

I sent a different patch to address this. The vhost-user-blk server does
not depend on CONFIG_VHOST_USER, just CONFIG_LINUX.

Stefan

--4Epv4kl9IRBfg3rk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+pF+IACgkQnKSrs4Gr
c8gIOAf+J8cfrjKwlIDWKkXMDZt/lyLSOoQKQVssUGZgl8v8XxNPEkY9AZnPyy+n
KF5rEwNm72reVwAZtSuR8vulRsMDHWGbaV7vTlTb/pY2RmlV9PBTcBrHpu7UnroV
GDxvHEKBB65G1GIwlfTvlf/UZm1gXiS0mLYgTjEd/pUzcN46A9/JBnuHK0S8YXJt
U8/7bV1SlrLD8RuEt1553nBoDGjyWnZYxE3iz4NyCbMauBppF1eRsXPPaG4p5j4Q
x6J/S2iQD3BZhUOc6qkeqA2bCuk5bpByjnG8GZefFtbJi7mJOMuXNJyg7r/C0zKm
qBmmuoC6WVfGCclNfJpJtWycsvRkCA==
=eh+F
-----END PGP SIGNATURE-----

--4Epv4kl9IRBfg3rk--



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 739261FED99
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jun 2020 10:29:11 +0200 (CEST)
Received: from localhost ([::1]:58240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlpv4-0003Gq-IQ
	for lists+qemu-devel@lfdr.de; Thu, 18 Jun 2020 04:29:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jlptz-0002pU-4N
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 04:28:03 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:46705
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jlptx-0000bR-C3
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 04:28:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592468880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AE4L6vJ+yjT5h6B/5o4XDFRNJd9TMqKDPbL+4lEn00k=;
 b=Ss3x78hFQk6UsqL+fgyPNuP/UJHaozMyianQ5RD2w/FG+buDwarqCjJAukNLCAXH5TdbbQ
 A7cGByN2zAK2e8qryUZkR6yh1Ikxm7MeNovZaJy91RBT+/ykYysfaR4MPwUq5pZG8rBV5S
 8PlhlBbSDi12I1OLu5AM/20+iDD38w8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-KLi5xyyKOyep4IV79mV9Aw-1; Thu, 18 Jun 2020 04:27:54 -0400
X-MC-Unique: KLi5xyyKOyep4IV79mV9Aw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 917C3835B46;
 Thu, 18 Jun 2020 08:27:53 +0000 (UTC)
Received: from localhost (ovpn-113-212.ams2.redhat.com [10.36.113.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 97D667931F;
 Thu, 18 Jun 2020 08:27:49 +0000 (UTC)
Date: Thu, 18 Jun 2020 09:27:48 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Coiby Xu <coiby.xu@gmail.com>
Subject: Re: [PATCH v9 0/5] vhost-user block device backend implementation
Message-ID: <20200618082748.GB1956319@stefanha-x1.localdomain>
References: <20200614183907.514282-1-coiby.xu@gmail.com>
 <159216218770.30485.1172665077342708998@45ef0f9c86ae>
 <20200616065216.wpf2rxgwxvtqgxlk@r>
MIME-Version: 1.0
In-Reply-To: <20200616065216.wpf2rxgwxvtqgxlk@r>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DKU6Jbt7q3WqK7+M"
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=stefanha@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/18 01:32:18
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: kwolf@redhat.com, bharatlkmlkvm@gmail.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--DKU6Jbt7q3WqK7+M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2020 at 02:52:16PM +0800, Coiby Xu wrote:
> On Sun, Jun 14, 2020 at 12:16:28PM -0700, no-reply@patchew.org wrote:
> > Patchew URL: https://patchew.org/QEMU/20200614183907.514282-1-coiby.xu@=
gmail.com/
> >=20
> >=20
> >=20
> > Hi,
> >=20
> > This series failed the asan build test. Please find the testing command=
s and
> > their output below. If you have Docker installed, you can probably repr=
oduce it
> > locally.
> >=20
> > =3D=3D=3D TEST SCRIPT BEGIN =3D=3D=3D
> > #!/bin/bash
> > export ARCH=3Dx86_64
> > make docker-image-fedora V=3D1 NETWORK=3D1
> > time make docker-test-debug@fedora TARGET_LIST=3Dx86_64-softmmu J=3D14 =
NETWORK=3D1
> > =3D=3D=3D TEST SCRIPT END =3D=3D=3D
> >=20
> >  CC      stubs/vm-stop.o
> >  CC      ui/input-keymap.o
> >  CC      qemu-keymap.o
> > /tmp/qemu-test/src/util/vhost-user-server.c:142:30: error: use of undec=
lared identifier 'VHOST_MEMORY_MAX_NREGIONS'
> >                             VHOST_MEMORY_MAX_NREGIONS, nfds + nfds_t);
> >                             ^
> >=20
> > The full log is available at
> > http://patchew.org/logs/20200614183907.514282-1-coiby.xu@gmail.com/test=
ing.asan/?type=3Dmessage.
>=20
> I couldn't re-produce this error locally for both docker-test-quick@cento=
s7
> and this docker test. And I can't see any reason for this error to occur =
since
> VHOST_MEMORY_MAX_NREGIONS is defined in contrib/libvhost-user/libvhost-us=
er.h
> which has been included by util/vhost-user-server.h.

Please see the recent change in commit
b650d5f4b1cd3f9f8c4fdb319838c5c1e0695e41 ("Lift max ram slots limit in
libvhost-user").

The error can be solved by replacing VHOST_MEMORY_MAX_NREGIONS with
VHOST_MEMORY_BASELINE_NREGIONS in util/vhost-user-server.c.

Stefan

--DKU6Jbt7q3WqK7+M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl7rJYQACgkQnKSrs4Gr
c8gCQggAiRa/DaNneu9EFQZO48KQa6Yx9ExZJPv64GSleqXgf9Lk4+kc5ygJYmLo
UxEEWpP8j4Rv5qvFOUQ2xkc3preTkxT9OF8ylwBSqzd+xRPIaMOXyRYCYLZv3qRF
dWaKusJehHv2HbAVsDXZ1kfFz0aqokvr3S8tOY6omItzilOciMfKGqmUD3GAhz5e
C/Wn31KqR96rM/FLKmIBBse1buW4y+0CinXztFmAKxuMbauHv5dB5J+6O0WLCKbs
VkRxCPraE86pCbudPseSey/aw/gO63N/ZwAw1QrLiirJ0IWMoSvx9X+xy5BCxSoS
HYWxHaoB4hgbC7e6hUVUCb1wu3n1UA==
=obA4
-----END PGP SIGNATURE-----

--DKU6Jbt7q3WqK7+M--



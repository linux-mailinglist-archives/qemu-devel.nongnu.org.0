Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E3843B733
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 18:29:48 +0200 (CEST)
Received: from localhost ([::1]:48810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfPKd-0007R8-DU
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 12:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mfPHC-0001mc-El
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:26:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mfPH9-0003QR-Ee
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:26:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635265570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DKN6bHZEUqMJNhDlUI4LFRs17Ui5Q3fOLC0Ii1MHSJ8=;
 b=ZW42iPuABnUCIY6UsV5jvELBzHhB5Ytt4Vp5yibMK/EqOWJsgsKE62kYyOHKgRfGq0co/1
 e73yBQY62iV13JmIRo7zJR2bwhNHZNMGaM5jH3qKilS8gHHZRYqZtzIxojXRwn+9oyb24q
 hypDPSB9YS93i5khQ/XXRv/zJBbnKG4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-3rPOTzsAPpaZUA5-BZK1HA-1; Tue, 26 Oct 2021 12:26:09 -0400
X-MC-Unique: 3rPOTzsAPpaZUA5-BZK1HA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A466362F9;
 Tue, 26 Oct 2021 16:26:08 +0000 (UTC)
Received: from localhost (unknown [10.39.195.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C33CC5F4E0;
 Tue, 26 Oct 2021 16:26:07 +0000 (UTC)
Date: Tue, 26 Oct 2021 17:26:06 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [RFC 1/2] tls: add macros for coroutine-safe TLS variables
Message-ID: <YXgsHghh2BCrb1S0@stefanha-x1.localdomain>
References: <20211025140716.166971-1-stefanha@redhat.com>
 <20211025140716.166971-2-stefanha@redhat.com>
 <YXa7zMZG2saNHInI@redhat.com>
 <YXgFg0aHtvXNorUS@stefanha-x1.localdomain>
 <YXgMSFJhfE6mdVIq@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YXgMSFJhfE6mdVIq@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fiAn+geC4ab5qwdC"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: fweimer@redhat.com, Fam Zheng <fam@euphon.net>, thuth@redhat.com,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--fiAn+geC4ab5qwdC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 26, 2021 at 04:10:16PM +0200, Kevin Wolf wrote:
> Am 26.10.2021 um 15:41 hat Stefan Hajnoczi geschrieben:
> > Actually, nevermind what I said about the callback scenario. I don't
> > think that is a problem because the compiler cannot assume the __thread
> > variable remains unchanged across the callback. Therefore it cannot
> > safely cache the value.
>=20
> And additionally, I think callbacks are never coroutine_fn (especially
> not if they come from an external library), so they must not yield
> anyway.

There's a tiny chance that the third-party library was called from
coroutine context and the callback invokes a non-coroutine_fn that uses
qemu_in_coroutine() to dynamically decide it's possible to yield. But it
seems very unlikely.

> > So I think only the header file scenario is a problem.
>=20
> The mere existence of a __thread variable in the header file isn't a
> problem either, but if QEMU accesses it, we would have to implement
> wrappers similar to what you're proposing for QEMU's thread local
> variables.

There could be static inline functions that access it in the header
file. If QEMU calls those functions then the compiler can optimize that.

Stefan

--fiAn+geC4ab5qwdC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmF4LB4ACgkQnKSrs4Gr
c8hGJgf/VZRchYhKgsLb606DYxEcRrfG9Lkoy+zB//Jw93GbTUS2iuDOTqQF9OMj
yBa+AacOC51jtBeb4gqbjwc0OmMrQ4rO1AnKXPk02ptxkqvmhsxO1dcDAs40VIQl
7BrO4c2DehDuIMxFYpvSg3VD90ZQnWIEjVicRhYh442Ihwol2M8uh+WEoKR3zLBc
DQaaJGbpU7ED8Rn9aqvB1PmrE5X2dTZ8xqq231RHfhwV1JLzIxih61wmbAW0H6P/
rEX14goYVPyVLgAe/e6WRJ7MRVpdSYzKdNr9QccJdJ+BU5OCBo/4LhuRql0qTVVD
5pv5oxdMbLnB5AX3ZE7HKJb6HNvB6A==
=RlKW
-----END PGP SIGNATURE-----

--fiAn+geC4ab5qwdC--



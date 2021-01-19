Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 855732FBA9A
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 16:00:11 +0100 (CET)
Received: from localhost ([::1]:33946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1sUM-0000ea-FS
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 10:00:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l1sQy-00065S-OK
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:56:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l1sQw-0007HO-4t
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:56:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611068196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AcBFDDK6+A+ZEcdOkOFw1muolZQCv0QF+a4gBOJmFEk=;
 b=fU6CDQllDv97oLqSnwetu7YaDWgz/HiQr5G2aoE7Kzk/1R0GCZJ4y12tXZPd50e8QCEyX2
 4umo/f6I19XM5CJJaGC+ZtVgS6bfKu1NQZqINtMRm4RfGii4FfLCsQJxETWfXLKnfE1Mzh
 cSDaEba6EMvGATMbMmSz3fnOvGa61a0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-VUZcwoc1MJSGLTGILHPKGg-1; Tue, 19 Jan 2021 09:56:24 -0500
X-MC-Unique: VUZcwoc1MJSGLTGILHPKGg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BFA589CC17;
 Tue, 19 Jan 2021 14:56:23 +0000 (UTC)
Received: from localhost (ovpn-115-72.ams2.redhat.com [10.36.115.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6466D60C9C;
 Tue, 19 Jan 2021 14:56:23 +0000 (UTC)
Date: Tue, 19 Jan 2021 14:56:22 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] deploy docs to qemu-project.org from GitLab CI
Message-ID: <20210119145622.GC288294@stefanha-x1.localdomain>
References: <20210119132619.302207-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210119132619.302207-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QRj9sO5tAVLaXnSD"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
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

--QRj9sO5tAVLaXnSD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 19, 2021 at 02:26:19PM +0100, Paolo Bonzini wrote:
> Currently, the website is rebuilt on qemu-project.org using
> a separate container (https://github.com/stefanha/qemu-docs/)
> cron job hook.  We can instead reuse the GitLab's CI artifacts.
>=20
> To do so, we use the same mechanism that is already in place for
> qemu-web.git.
>=20
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  .gitlab-ci.yml                             | 23 ++++++++++++++++++++++
>  tests/docker/dockerfiles/ubuntu2004.docker |  2 ++
>  2 files changed, 25 insertions(+)

Hmm...the UNIX account on qemu.org is locked down to some extent but I
don't feel comfortable with a GitLab CI job sshing into qemu.org.

ssh access aside, we are publishing HTML from a shared CI runner to
qemu.org. Effectively we are allowing an untrusted machine to publish
HTML/JS/CSS on qemu.org. It could steal HTTP Cookies or do other
malicious things. That is less of a problem when there is a dedicated
subdomain so that the Same Origin policy can provide isolation. Maybe
there are more recent web security mechanisms that allow us to define a
policy so browsers do not treat qemu.org/docs/* the same as other
qemu.org pages?

(This wasn't a problem before since the container was running on a
dedicated instance under our control.)

Stefan

--QRj9sO5tAVLaXnSD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAG8xYACgkQnKSrs4Gr
c8hErQgApjpznRmWKoVP/HmiszYasfH1KtFgQd7ZMs92PC5ljbUaufkhvoblXu+9
h3ZqeiV2QRpoIDQ+MKJYGGgOJxXD/D7rl0e6nnlAIZtQRoJ2A3q+ErcvEfGfOhbm
FFoMi2Hab/zK5OUz76lkxSqSPbeK8vq3nhoh+kEdqip42pJEW5OSOld3cDt7Z99B
cu618koEBn3gaHtb9Ss/0x9HwHHi07d1/i/h0HEP545WItS0rT32soZwdXjv6s53
1Ij4sHMc89grnY1GlQyn3JwxxQOAyHgiOOILANin3yioQ3LlXJ+lgZ5Rkh4mWT9H
TsbUig0oVSuHMPA+1dKKnvKXfpV5LQ==
=Xx02
-----END PGP SIGNATURE-----

--QRj9sO5tAVLaXnSD--



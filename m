Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEF0433362
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 12:19:18 +0200 (CEST)
Received: from localhost ([::1]:58788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcmDF-0002Ak-6E
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 06:19:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mcmA8-0006gi-Ae
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 06:16:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mcmA6-00013b-9K
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 06:16:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634638561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jRkXrjMVNpvQyAqoNkhR4bpQh8KpptrPXV7JcFJhA4w=;
 b=c8SNX5wrG37wW/0U8Ib+tL98KL6iEyHaIdZ+6zC0N1knUoYN6KP5tuMMxidxAWd8yEaV76
 kB1pnUMwhG2hO6krg8C4bubm5mUdAnYJrZpSUJ31mFtlvi2m4w1v4eyqJLt7pVim2DnowP
 dfixc+kgcfvoM6JWcSsBEfeDVIAmAkI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-Q58R22ZnPXeIDU0Mo8FKEw-1; Tue, 19 Oct 2021 06:16:00 -0400
X-MC-Unique: Q58R22ZnPXeIDU0Mo8FKEw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 248E7804B9E;
 Tue, 19 Oct 2021 10:15:59 +0000 (UTC)
Received: from localhost (unknown [10.39.195.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE04C607A4;
 Tue, 19 Oct 2021 10:15:25 +0000 (UTC)
Date: Tue, 19 Oct 2021 11:15:24 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Subject: Re: [PATCH v5] Prevent vhost-user-blk-test hang
Message-ID: <YW6avFdFDBnxjp9l@stefanha-x1.localdomain>
References: <20210927171651.1433-1-raphael.norwitz@nutanix.com>
MIME-Version: 1.0
In-Reply-To: <20210927171651.1433-1-raphael.norwitz@nutanix.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="P+ennTgziamRRv+v"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mreitz@redhat.com" <mreitz@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "sgarzare@redhat.com" <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--P+ennTgziamRRv+v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 27, 2021 at 05:17:01PM +0000, Raphael Norwitz wrote:
> In the vhost-user-blk-test, as of now there is nothing stoping
> vhost-user-blk in QEMU writing to the socket right after forking off the
> storage daemon before it has a chance to come up properly, leaving the
> test hanging forever. This intermittently hanging test has caused QEMU
> automation failures reported multiple times on the mailing list [1].
>=20
> This change makes the storage-daemon notify the vhost-user-blk-test
> that it is fully initialized and ready to handle client connections by
> creating a pidfile on initialiation. This ensures that the storage-daemon
> backend won't miss vhost-user messages and thereby resolves the hang.
>=20
> [1] https://lore.kernel.org/qemu-devel/CAFEAcA8kYpz9LiPNxnWJAPSjc=3Dnv532=
bEdyfynaBeMeohqBp3A@mail.gmail.com/

The following hack triggers the hang. The stack traces match what Peter
posted in the thread linked above. I'll take a closer look.

---

diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-sto=
rage-daemon.c
index 10a1a33761..50c9caa1b2 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -316,6 +316,8 @@ int main(int argc, char *argv[])
     signal(SIGPIPE, SIG_IGN);
 #endif

+    sleep(5);
+
     error_init(argv[0]);
     qemu_init_exec_dir(argv[0]);
     os_setup_signal_handling();

--P+ennTgziamRRv+v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFumrwACgkQnKSrs4Gr
c8jKAwf/aLsZiNXghDdr1zC+3FzJ/U6NNeIjOAEZ+ZdQzYSQX4EFGDvKBmr2rMtU
Jf/c1ukhbbldof2z1NaqNiVWk4ChamQY667fG0gNSCOPkjfGzGZSdjRva8bwqZnq
vBuElFxRF3AsFEcSEnCvbjppWH/rsSm3Q/qo7a5/yGIZkgsNYtqKdkazth32r+jx
9pjKAZbFdfT0zFUN9ava7SmMJZTbDd5R3NDKCy3lnzeYb3wMAq2PtVUHMbktoN4J
GyxqAHpBkVUiXnjNq62Lje6Sj2EN2ZBvCK8C5J1H8DgPcrwxDJcw0rXj7f3icacR
D7X+Jt6fqJNBZ6lUyNTSwHgJ6TGs+g==
=nFmE
-----END PGP SIGNATURE-----

--P+ennTgziamRRv+v--



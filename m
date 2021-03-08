Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B861D331501
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 18:40:03 +0100 (CET)
Received: from localhost ([::1]:60244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJJrO-0005tN-MB
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 12:40:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lJJPD-0003XW-M0
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:10:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lJJP8-0005X2-Nu
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:10:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615223448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WKx6WOU790J46N5tEBYa1mAFgo6Jst3KxQOKTNNQB6A=;
 b=f5sZfpOQUxve+hFlUcqdKKKlIDUeO2bh5RjUDi++KOH0251ir2GGtChyAlIWfk/TgKMHU3
 +9G6uOTZYPVQV+/ajYzt/v0tohup/FScTneCkpxcvBI+sAondGHp3G2Pjf+ukiFi+4tHuq
 fOexXUUA2hMffYfT3TtQ/kNl0uELVkE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-Glu5BBPOOnKuOYMSJqG_fg-1; Mon, 08 Mar 2021 12:10:44 -0500
X-MC-Unique: Glu5BBPOOnKuOYMSJqG_fg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 575B8801814;
 Mon,  8 Mar 2021 17:10:43 +0000 (UTC)
Received: from localhost (ovpn-114-104.ams2.redhat.com [10.36.114.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 00D6F189A5;
 Mon,  8 Mar 2021 17:10:42 +0000 (UTC)
Date: Mon, 8 Mar 2021 17:10:40 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PULL 00/31] Block layer patches
Message-ID: <YEZakB61uVQ/7jPX@stefanha-x1.localdomain>
References: <20210305165454.356840-1-kwolf@redhat.com>
 <CAFEAcA8=jkCWw=NAJy5Zd5Rx4=QJPHX_cppHwz3b2TLgPUgWqw@mail.gmail.com>
 <20210308110829.GB7021@merkur.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20210308110829.GB7021@merkur.fritz.box>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GZDQzM304hsBNnRv"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--GZDQzM304hsBNnRv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 08, 2021 at 12:08:29PM +0100, Kevin Wolf wrote:
> Am 06.03.2021 um 12:22 hat Peter Maydell geschrieben:
> > On Fri, 5 Mar 2021 at 16:55, Kevin Wolf <kwolf@redhat.com> wrote:
> > >
> > > The following changes since commit 9a7beaad3dbba982f7a461d676b55a5c38=
51d312:
> > >
> > >   Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-a=
pply-20210304' into staging (2021-03-05 10:47:46 +0000)
> > >
> > > are available in the Git repository at:
> > >
> > >   git://repo.or.cz/qemu/kevin.git tags/for-upstream
> > >
> > > for you to fetch changes up to 67bedc3aed5c455b629c2cb5f523b536c46adf=
f9:
> > >
> > >   docs: qsd: Explain --export nbd,name=3D... default (2021-03-05 17:0=
9:46 +0100)
> > >
> > > ----------------------------------------------------------------
> > > Block layer patches:
> > >
> > > - qemu-storage-daemon: add --pidfile option
> > > - qemu-storage-daemon: CLI error messages include the option name now
> > > - vhost-user-blk export: Misc fixes, added test cases
> > > - docs: Improvements for qemu-storage-daemon documentation
> > > - parallels: load bitmap extension
> > > - backup-top: Don't crash on post-finalize accesses
> > > - iotests improvements
> >=20
> > This failed some of the gitlab CI jobs, like this:
> >=20
> > https://gitlab.com/qemu-project/qemu/-/jobs/1077335781
> >=20
> > Running test qtest-x86_64/test-hmp
> > Running test qtest-x86_64/qos-test
> > qemu-storage-daemon: vu_panic: Not implemented: memfd support is missin=
g
> > qemu-storage-daemon: vu_panic: Failed to alloc vhost inflight area
> > qemu-system-x86_64: Failed to write msg. Wrote -1 instead of 20.
> > qemu-system-x86_64: vhost_set_features failed: Invalid argument (22)
> > qemu-system-x86_64: Error starting vhost: 22
> > qemu-system-x86_64: vhost-user-blk: vhost start failed: Invalid argumen=
t
> > **
> > ERROR:../tests/qtest/libqos/virtio.c:228:qvirtio_wait_used_elem:
> > assertion failed: (g_get_monotonic_time() - start_time <=3D timeout_us)
> > ERROR qtest-x86_64/qos-test - Bail out!
> > ERROR:../tests/qtest/libqos/virtio.c:228:qvirtio_wait_used_elem:
> > assertion failed: (g_get_monotonic_time() - start_time <=3D timeout_us)
> > make: *** [run-test-159] Error 1
> >=20
> > I guess some test or other is assuming the presence of
> > a host feature that isn't guaranteed to be there ?
>=20
> Stefan, can you have a look? This is from the new vhost-user-blk test
> cases from your series.
>=20
> If the fix isn't trivial, I'll resubmit v2 today with just the test case
> dropped and then we can add it later.

I'm testing the following commit:
https://gitlab.com/stefanha/qemu/-/pipelines/267172954

I'll look into it more tomorrow.

Stefan

--GZDQzM304hsBNnRv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBGWpAACgkQnKSrs4Gr
c8ijgwgAjTARLTelUnk0mE2MSAz1ugnb0f3tfaGvOkAoRIjE1/uPaKE2pSZ8vIQl
DJ6lMh3orlANVupCRribssp/iZZl0t41gHDRzQ/a6/t536YaO0JaTMx8mjjCeC0A
V+MWB2Vb0sG7jMJQJcmCZko60Zm+asraA8uZIO5a6x3RnFEMEtNpDIONtIsrK+QW
cO2Bv9SMG1Q/DqNJV0OCV+b4nlIQ7mLZ/g/SmQZhXR51N5/QJ9pRDkGBDftz0SNG
yIDzvaOsj3p2t+pXiAgumLiBtTfMcHqUtVrsYkKB1U9Rmbgw3LC0sAKUSgJmkYlG
fjLwH7Z/51A27NFB5d6qwxPOhoJYSw==
=OPvs
-----END PGP SIGNATURE-----

--GZDQzM304hsBNnRv--



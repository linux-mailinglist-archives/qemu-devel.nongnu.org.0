Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F405FDE03
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 18:11:18 +0200 (CEST)
Received: from localhost ([::1]:38644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj0nl-0006vE-3K
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 12:11:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oj0eF-00063D-5g
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 12:01:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oj0eB-0000sD-6f
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 12:01:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665676882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8zDpItjAu5ov3bsFW3VuwHkUUIWynjpwr1yozwTgapc=;
 b=aIMtsnDCAKrngufJ8rzZVT85wPAelqk2MOYADbP6PQt2Rw9o0Orr7dFJmdSFY9UprvfR8L
 /vHnKMLAOAAX6UCjU+gv9aQbC0dPHl12kJuju/or3xc072BGKq1yHLnc1HsgVaVp25SRNi
 BBylecEh7akvghQog5LEJ7SjO84g1+8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-d12DpK2UMWyMz9fvft9LNA-1; Thu, 13 Oct 2022 12:01:14 -0400
X-MC-Unique: d12DpK2UMWyMz9fvft9LNA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BFF16811E7A;
 Thu, 13 Oct 2022 16:01:13 +0000 (UTC)
Received: from localhost (unknown [10.39.194.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A3D1840398B1;
 Thu, 13 Oct 2022 16:01:12 +0000 (UTC)
Date: Thu, 13 Oct 2022 12:01:10 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Ming Lei <tom.leiming@gmail.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, io-uring@vger.kernel.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kirill Tkhai <kirill.tkhai@openvz.org>,
 Manuel Bentele <development@manuel-bentele.de>,
 qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Xie Yongji <xieyongji@bytedance.com>, "Denis V. Lunev" <den@openvz.org>,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: ublk-qcow2: ublk-qcow2 is available
Message-ID: <Y0g2Rg9nAU5grjCV@fedora>
References: <Yza1u1KfKa7ycQm0@T590> <Yzs9xQlVuW41TuNC@fedora>
 <YzwARuAZdaoGTUfP@T590>
 <CAJSP0QXVK=wUy_JgJ9NmNMtKTRoRX0MwOZUuFWU-1mVWWKij8A@mail.gmail.com>
 <20221006101400.GC7636@redhat.com>
 <CAJSP0QXbnhkVgfgMfC=MAyvF63Oof_ZGDvNFhniDCvVY-f6Hmw@mail.gmail.com>
 <Y0du/9K3II70tZTD@T590>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Dz5/1ZuMbMXxUtqp"
Content-Disposition: inline
In-Reply-To: <Y0du/9K3II70tZTD@T590>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Dz5/1ZuMbMXxUtqp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 13, 2022 at 09:50:55AM +0800, Ming Lei wrote:
> On Wed, Oct 12, 2022 at 10:15:28AM -0400, Stefan Hajnoczi wrote:
> > On Thu, 6 Oct 2022 at 06:14, Richard W.M. Jones <rjones@redhat.com> wro=
te:
> > >
> > > On Tue, Oct 04, 2022 at 09:53:32AM -0400, Stefan Hajnoczi wrote:
> > > > qemu-nbd doesn't use io_uring to handle the backend IO,
> > >
> > > Would this be fixed by your (not yet upstream) libblkio driver for
> > > qemu?
> >=20
> > I was wrong, qemu-nbd has syntax to use io_uring:
> >=20
> >   $ qemu-nbd ... --image-opts driver=3Dfile,filename=3Dtest.img,aio=3Di=
o_uring
>=20
> Yeah, I saw the option, previously when I tried io_uring via:
>=20
> qemu-nbd -c /dev/nbd11 -n --aio=3Dio_uring $my_file
>=20
> It complains that 'qemu-nbd: Invalid aio mode 'io_uring'' even though
> that 'qemu-nbd --help' does say that io_uring is supported.
>=20
> Today just tried it on Fedora 37, looks it starts working with
> --aio=3Dio_uring, but the IOPS is basically same with --aio=3Dnative, and
> IO trace shows that io_uring is used by qemu-nbd.

Okay, similar performance to Linux AIO is expected. That's what we've
seen with io_uring in QEMU. QEMU doesn't use io_uring in polling mode,
so it's similar to what we get with Linux AIO.

Stefan

--Dz5/1ZuMbMXxUtqp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNINkYACgkQnKSrs4Gr
c8ib3Qf/Tgw+o0jMenLQv3Ye1i9s4Mg9WNyB6eTM6ksmacLnBLbt225EDtkqMEqS
wRPgsH9kB6d7yKcgAg3HR4/NoZHS+LCkLH4KCw0SyJxzQdecuDazPPQUOMN2U1D3
wBj7ZZDv1In33uW587li1IMtzAajS9BVGwbXSCRK7ZqtaDF0WR85RIDFPbjOMrYK
q9fmplUuSVqxYfAQ0deUiO3pM04CoVWdMpdJorpiUDRD6fJdCZBvNNXAxYov8O+8
4Hh7Eyt7MpCwhQUR3cKc/TguVTbbza/uVc8k5o5vBrK0eftv9cT7lUr3+35AnPE4
y+FLbhkaGFOFn4Q0jZDOjcjMRJkdNg==
=QYko
-----END PGP SIGNATURE-----

--Dz5/1ZuMbMXxUtqp--



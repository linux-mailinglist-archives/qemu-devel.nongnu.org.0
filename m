Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE46346178
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 15:29:41 +0100 (CET)
Received: from localhost ([::1]:43204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOi2O-0001e0-Sv
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 10:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lOhyh-0005Mz-47
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:25:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lOhyb-0006Wi-0z
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:25:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616509544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r7lc53hAEXRVXL/fAIx3ft8igRg5NeXxXmunuw9zXhA=;
 b=VI3vwxhtUzPI7y7lw5aRiR1DrUaGtPq6U0UPX8WS/vVsyD/sBTffHktgjvqemDwrr822Z1
 rB6TbCxM5ZhST6ui9IBS3gNb7orJ07PmgibJrL8faxmW03JVohTpfzG5e8z9rccAexnjw+
 8vHFeXwHOPFR9JyalGGz32LEIAzBnZ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-HonlGOppP5-x43V_qjXgKw-1; Tue, 23 Mar 2021 10:25:42 -0400
X-MC-Unique: HonlGOppP5-x43V_qjXgKw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E002F83DD20;
 Tue, 23 Mar 2021 14:25:40 +0000 (UTC)
Received: from localhost (ovpn-114-89.ams2.redhat.com [10.36.114.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E2F4C10016FD;
 Tue, 23 Mar 2021 14:25:30 +0000 (UTC)
Date: Tue, 23 Mar 2021 14:25:29 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [External] Re: [RFC PATCH 0/9] Support for Virtio-fs daemon
 crash reconnection
Message-ID: <YFn6WX/S1VRzkmel@stefanha-x1.localdomain>
References: <20201215162119.27360-1-zhangjiachen.jaycee@bytedance.com>
 <1711593.yAA9ihpmTb@silver>
 <YFh3gIMbEEEYDdS/@stefanha-x1.localdomain>
 <2732080.qQGZu95Wvu@silver>
MIME-Version: 1.0
In-Reply-To: <2732080.qQGZu95Wvu@silver>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="32voxJ6tmJj5Rjdk"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>, slp@redhat.com,
 "Michael S . Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 virtio-fs@redhat.com, Xie Yongji <xieyongji@bytedance.com>,
 Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--32voxJ6tmJj5Rjdk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 23, 2021 at 01:54:46PM +0100, Christian Schoenebeck wrote:
> On Montag, 22. M=E4rz 2021 11:54:56 CET Stefan Hajnoczi wrote:
> > > > Thanks, Christian. I am still trying to figure out the details of t=
he
> > > > ROP
> > > > attacks.
> > > >=20
> > > > However, QEMU's vhost-user reconnection is based on chardev socket
> > > > reconnection. The socket reconnection can be enabled by the "--char=
dev
> > > > socket,...,reconnect=3DN" in QEMU command options, in which N means=
 QEMU
> > > > will
> > > > try to connect the disconnected socket every N seconds. We can incr=
ease
> > > > N
> > > > to increase the reconnect delay. If we want to change the reconnect
> > > > delay
> > > > dynamically, I think we should change the chardev socket reconnecti=
on
> > > > code.
> > > > It is a more generic mechanism than vhost-user-fs and vhost-user
> > > > backend.
> > > >=20
> > > > By the way, I also considered the socket reconnection delay time in=
 the
> > > > performance aspect. As the reconnection delay increase, if an
> > > > application
> > > > in the guest is doing I/Os, it will suffer larger tail latency. And=
 for
> > > > now, the smallest delay is 1 second, which is rather large for
> > > > high-performance virtual I/O devices today. I think maybe a more
> > > > performant
> > > > and safer reconnect delay adjustment mechanism should be considered=
 in
> > > > the
> > > > future. What are your thoughts?
> > >=20
> > > So with N=3D1 an attacker could e.g. bypass a 16-bit PAC by brute-for=
ce in
> > > ~18 hours (e.g. on Arm if PAC + MTE was enabled). With 24-bit PAC (no
> > > MTE) it would be ~194 days. Independent of what architecture and defe=
nd
> > > mechanism is used, there is always the possibility though that some k=
ind
> > > of side channel attack exists that might require a much lower amount =
of
> > > attempts. So in an untrusted environment I would personally limit the
> > > amount of automatic reconnects and rather accept a down time for furt=
her
> > > investigation if a suspicious high amount of crashes happened.
> > >=20
> > > And yes, if a dynamic delay scheme was deployed in future then starti=
ng
> > > with a value smaller than 1 second would make sense.
> >=20
> > If we're talking about repeatedly crashing the process to find out its
> > memory map, shouldn't each process have a different randomized memory
> > layout?
> >=20
> > Stefan
>=20
> Yes, ASLR is enabled on Linux and other OSes by default for more than 10=
=20
> years. But ASLR does not prevent ROP attacks which are commonly using rel=
ative=20
> offsets, tweaking the stack, indirect jumps, as well as heap spraying. Pl=
us=20
> side channels exist to gain access to direct addresses.
>=20
> The situation might improve significantly when shadow stacks (e.g. Intel =
CET)=20
> become widely used in future. But in the meantime I would be cautious if=
=20
> something is crashing too often in a certain time frame.

It's a good point for performance as well. A broken service should not
hog CPU by constantly restarting itself. If it's broken badly it may
never come back up and should be throttled.

Stefan

--32voxJ6tmJj5Rjdk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBZ+lkACgkQnKSrs4Gr
c8j4+wf/Z3D1NpNwfPwBAmvVIgM2UCcpv04AAVbQwAK2uLVWvesoQ8rDnLizkeWw
TOJ8NbwQAlKFfMhLBMSYKlzFmUNJnbn7pofPpccywhQFeu8jTkNBYDpikICi0Qug
sD5Ovk0TUCqzwb+K2uxdnaDB+ZMiZLYDGwQ4T14pAinO1RndTjtTNp1OYT56hQGk
KsiNZF9fEvkNGZ4zWCo4YDK4gNUE0fjdPNvukhtPJF2dF5Jh0NVGpZPtNAz+8QPT
d2StGsqyF71gYZpCCVFNEpjiRApwnDxSqVfZSPkRBk+O9Whk0VIGQxztQ+Rl4n25
aJgFSdUW8UdkFsL5z1HtviV81lbKoQ==
=YMcq
-----END PGP SIGNATURE-----

--32voxJ6tmJj5Rjdk--



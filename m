Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9714F11FB
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 11:28:20 +0200 (CEST)
Received: from localhost ([::1]:57042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbJ0V-0002G5-3d
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 05:28:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nbIxX-0000et-Of
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 05:25:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nbIxV-0007Xp-GL
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 05:25:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649064312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lhcyrcS/ZK8feadiYOZbazIvXN8LNfKF1ZOaPdmVsrg=;
 b=iACE9C0juP63h44d1oZR1VUkVVWeUknRWse4IxeerUUsT7+i0LJtlhFAwbVrO4RWTEgZyV
 M37olVWLCCk+riK4e8hmU8zE0/jwl9DgGbfPdiRCeuXV4m8Qf0RkopIz8uwHnSJFA1fo+K
 eo2kF1OAoAQhyrc5Znf6xaeXAooqZm0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-C8gmut9WPrmJU3MP8MmG9w-1; Mon, 04 Apr 2022 05:25:09 -0400
X-MC-Unique: C8gmut9WPrmJU3MP8MmG9w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0760180B710;
 Mon,  4 Apr 2022 09:25:08 +0000 (UTC)
Received: from localhost (unknown [10.39.194.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5187A200D8E8;
 Mon,  4 Apr 2022 09:25:06 +0000 (UTC)
Date: Mon, 4 Apr 2022 10:25:05 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH 0/5] Removal of AioContext lock, bs->parents and
 ->children: proof of concept
Message-ID: <Ykq5cZPiC9uw9T1a@stefanha-x1.localdomain>
References: <Yh89L8gT46MbSJCQ@stefanha-x1.localdomain>
 <af53599c-c7de-d2b8-00fa-0e7d28121251@redhat.com>
 <e9eeec7b-d03e-5e8e-cc42-568c670726ca@redhat.com>
 <c8d45cd9-e7de-9acd-3fd6-13de58f5ce48@redhat.com>
 <c6a12090-b6c3-31d8-fb90-a76c9dd2e949@redhat.com>
 <88f2798b-9327-e54f-5792-e37404b94ef7@redhat.com>
 <8ae70388-ff46-6ec1-7f84-14d41ca9a6dd@redhat.com>
 <311c2e0a-fb2c-241c-cbd1-1162f7e74e18@redhat.com>
 <9d3c36f0-0834-ec9c-8473-d052d64a61dd@redhat.com>
 <69b2ce82-4826-71ed-9c32-d323df69b7c4@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="f/TUByiNmVissVkh"
Content-Disposition: inline
In-Reply-To: <69b2ce82-4826-71ed-9c32-d323df69b7c4@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--f/TUByiNmVissVkh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 01, 2022 at 01:01:53PM +0200, Paolo Bonzini wrote:
> On 4/1/22 10:05, Emanuele Giuseppe Esposito wrote:
> > > The list itself would be used internally to implement the write-side
> > > lock and unlock primitives, but it would not be protected by the above
> > > functions.=A0 So there would be a couple additional functions:
> > >=20
> > >  =A0 bdrv_graph_list_lock <-> cpu_list_lock
> > >  =A0 bdrv_graph_list_unlock <-> cpu_list_unlock
> >=20
> > The list would be graph_bdrv_states, why do we need to protect it with a
> > lock? Currently it is protected by BQL, and theoretically only
> > bdrv_graph_wrlock iterates on it. And as we defined in the assertion
> > below, wrlock is always in the main loop too.
>=20
> You're right, CPU_FOREACH only appears in start_exclusive; so likewise you
> only need to walk the list in bdrv_graph_wrlock, i.e. only under BQL.
>=20
> My thought was that, within the implementation, you'll need a mutex to
> protect has_waiter, and protecting the list with the same mutex made sense
> to me.  But indeed it's not necessary.

What is the relationship between this new API and aio_set_fd_handler()'s
is_external?

A few thoughts:

- The new API doesn't stop more I/O requests from being submitted, it
  just blocks the current coroutine so request processing is deferred.

- In other words, is_external is a flow control API whereas the new API
  queues up request coroutines without notifying the caller.

- The new API still needs to be combined with bdrv_drained_begin/end()
  to ensure in-flight requests are done.

- It's not obvious to me whether the new API obsoletes is_external. I
  think it probably doesn't.

Stefan

--f/TUByiNmVissVkh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJKuXEACgkQnKSrs4Gr
c8jsLgf+OB5R6mo6qtzfIt70FSUSOG3coe+uZ2Sbs7JqKCwN+dBr+eu8zSI+aw7E
Gy55aRkwJRPlBcfIHcjIFWazUx+JVBR0mKi8fFX5GwSOv1NQQ3hkJxfyPglsxegy
KRZ3JUr0z7eO4SzDri5bVdacgp4sMyG7LdDnXNT/UKh3iftp5cLHF3cUVtKEgNOH
yNX6ROnT87NKU0htHhHvrRwv1Yp8mSplArkI3MtI9KQkCgzr0jEihJidkUBySzIb
PX61FbmR6SzJyUkfLkqyaOu+PVJgSQiMWA8ieYd146uK8i3MqNTWAZG9gO6jbjXK
epYvgISBNUocB3JAQxN/g7DDJuPlbQ==
=gdL8
-----END PGP SIGNATURE-----

--f/TUByiNmVissVkh--



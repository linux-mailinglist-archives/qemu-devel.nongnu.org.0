Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8860360B850
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 21:44:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on2WX-0003DU-CY; Mon, 24 Oct 2022 14:50:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1on2WV-0003DN-G6
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 14:50:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1on2WT-0003MZ-S9
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 14:50:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666637405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SH+X6fPQ63UVEtvhO3Y5FEj/UQcIkIEOajKafqYJrPw=;
 b=Xa2ABC/8r62TnsNVmyncfA1YgYNqNRiplRg4GgYhOJhFxhG8I4TgX58xpnSSgD6PkpfNce
 lJde0Vim6Z+AS1YagvxTL4UpGujmqn3XsmL5j+PSdumzRfEQfYIRr7QbaPM0RQaksFIf17
 +VgoIyCG4rmwyin0ZKXW+LcXs8dDpbQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-acbCVkeWNie5Pb1ci4IUWw-1; Mon, 24 Oct 2022 14:49:59 -0400
X-MC-Unique: acbCVkeWNie5Pb1ci4IUWw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A24C418E5312;
 Mon, 24 Oct 2022 18:49:58 +0000 (UTC)
Received: from localhost (unknown [10.39.194.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 53451C15BB2;
 Mon, 24 Oct 2022 18:49:48 +0000 (UTC)
Date: Mon, 24 Oct 2022 14:49:47 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, quintela@redhat.com
Subject: Re: [PATCH 2/2] thread-pool: use ThreadPool from the running thread
Message-ID: <Y1beS+QAuNx/Zdck@fedora>
References: <20220609134452.1146309-1-eesposit@redhat.com>
 <20220609134452.1146309-3-eesposit@redhat.com>
 <YzW6FkfT9LT7aE7d@redhat.com>
 <29c33add-81ca-5a16-a02a-d2a0c5bfaf88@redhat.com>
 <YzcPBFcf3idA4MLH@redhat.com>
 <dc4bf265-4cd9-ef29-2e3f-d15e779bd8db@redhat.com>
 <Y1Frq6R4DFOPWyIY@fedora> <Y1F1uU5bAQw80mG0@work-vm>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="luZd3gwvZjT1irOH"
Content-Disposition: inline
In-Reply-To: <Y1F1uU5bAQw80mG0@work-vm>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--luZd3gwvZjT1irOH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2022 at 05:22:17PM +0100, Dr. David Alan Gilbert wrote:
> * Stefan Hajnoczi (stefanha@redhat.com) wrote:
> > On Mon, Oct 03, 2022 at 10:52:33AM +0200, Emanuele Giuseppe Esposito wr=
ote:
> > >=20
> > >=20
> > > Am 30/09/2022 um 17:45 schrieb Kevin Wolf:
> > > > Am 30.09.2022 um 14:17 hat Emanuele Giuseppe Esposito geschrieben:
> > > >> Am 29/09/2022 um 17:30 schrieb Kevin Wolf:
> > > >>> Am 09.06.2022 um 15:44 hat Emanuele Giuseppe Esposito geschrieben:
> > > >>>> Remove usage of aio_context_acquire by always submitting work it=
ems
> > > >>>> to the current thread's ThreadPool.
> > > >>>>
> > > >>>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > > >>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> > > >>>
> > > >>> The thread pool is used by things outside of the file-* block dri=
vers,
> > > >>> too. Even outside the block layer. Not all of these seem to submi=
t work
> > > >>> in the same thread.
> > > >>>
> > > >>>
> > > >>> For example:
> > > >>>
> > > >>> postcopy_ram_listen_thread() -> qemu_loadvm_state_main() ->
> > > >>> qemu_loadvm_section_start_full() -> vmstate_load() ->
> > > >>> vmstate_load_state() -> spapr_nvdimm_flush_post_load(), which has:
> > > >>>
> > > >>> ThreadPool *pool =3D aio_get_thread_pool(qemu_get_aio_context());
> >                          ^^^^^^^^^^^^^^^^^^^
> >=20
> > aio_get_thread_pool() isn't thread safe either:
> >=20
> >   ThreadPool *aio_get_thread_pool(AioContext *ctx)
> >   {
> >       if (!ctx->thread_pool) {
> >           ctx->thread_pool =3D thread_pool_new(ctx);
> > 	  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >=20
> > Two threads could race in aio_get_thread_pool().
> >=20
> > I think post-copy is broken here: it's calling code that was only
> > designed to be called from the main loop thread.
> >=20
> > I have CCed Juan and David.
>=20
> In theory the path that you describe there shouldn't happen - although
> there is perhaps not enough protection on the load side to stop it
> happening if presented with a bad stream.
> This is documented in docs/devel/migration.rst under 'Destination
> behaviour'; but to recap, during postcopy load we have a problem that we
> need to be able to load incoming iterative (ie. RAM) pages during the
> loading of normal devices, because the loading of a device may access
> RAM that's not yet been transferred.
>=20
> To do that, the device state of all the non-iterative devices (which I
> think includes your spapr_nvdimm) is serialised into a separate
> migration stream and sent as a 'package'.
>=20
> We read the package off the stream on the main thread, but don't process
> it until we fire off the 'listen' thread - which you spotted the
> creation of above; the listen thread now takes over reading the
> migration stream to process RAM pages, and since it's in the same
> format, it calls qemu_loadvm_state_main() - but it doesn't expect
> any devices in that other than the RAM devices; it's just expecting RAM.
>=20
> In parallel with that, the main thread carries on loading the contents
> of the 'package' - and that contains your spapr_nvdimm device (and any
> other 'normal' devices); but that's OK because that's the main thread.
>=20
> Now if something was very broken and sent a header for the spapr-nvdimm
> down the main thread rather than into the package then, yes, we'd
> trigger your case, but that shouldn't happen.

Thanks for explaining that. A way to restrict the listen thread to only
process RAM pages would be good both as documentation and to prevent
invalid migration streams for causing problems.

For Emanuele and Kevin's original question about this code, it seems the
thread pool won't be called from the listen thread.

Stefan

--luZd3gwvZjT1irOH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNW3ksACgkQnKSrs4Gr
c8hxwwgAwnNxmYknrnHwfrOmxNRYREsDgLvfDJQHVUJpt/6JiQ4erB2CuLRPRayo
W1r55ocLwUs1QJdOxzlAQI6GAep3co4DJRCPjt/C804NChZt//Vbr+FEr+JfpF+Y
NjsQSrLt/YIrGvwhZUtVe2mYbo4rOnzkdLcUK4GP3zE75Az2yF438zSCWvoWzZxS
JgeaPnmNLNkhIqC37ukl+lPfFv5aamSszFoNomcR8DH0uBz/DRrTgjVihLYeYMn6
+EtJdxR0vT7tic5jwvA8x5EiRwGrV06180pDHy53xFtqaZgnoLNZgna5AqLbxIiT
n210lnU6rbDMZVePWXPTHX5BQxU7+w==
=LhaA
-----END PGP SIGNATURE-----

--luZd3gwvZjT1irOH--



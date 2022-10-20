Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E609C60655F
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 18:07:28 +0200 (CEST)
Received: from localhost ([::1]:44352 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olY4t-0001od-FA
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:07:27 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olY1R-0003uw-It
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:03:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1olXdv-0000ho-E0
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 11:39:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1olXdt-0000Rd-2l
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 11:39:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666280372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7RdAvZErY22g9Pcih2lyHgtr6s89Kl5YO7vH3fMDTY8=;
 b=G4fxOmJsC8INIEFkREz9ANisHZ3xUeOxP/vaszf4pHafjQx+B1KuL6IYwoDhqB07A67u+z
 ayTQ2BXaD5DSP2X+Mqe6mqrEdbFE5kCGkyjRpitKooU9AenJUGeuFutMejLqKDz9s21PdH
 Cy60wNpBAdbKUJJ/MABpgC6RynRB3xI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-JppXhKsNPWeInekKOEYziw-1; Thu, 20 Oct 2022 11:39:27 -0400
X-MC-Unique: JppXhKsNPWeInekKOEYziw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0572485A583;
 Thu, 20 Oct 2022 15:39:27 +0000 (UTC)
Received: from localhost (unknown [10.39.194.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1FD3940C6EC2;
 Thu, 20 Oct 2022 15:39:25 +0000 (UTC)
Date: Thu, 20 Oct 2022 11:39:23 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, quintela@redhat.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 2/2] thread-pool: use ThreadPool from the running thread
Message-ID: <Y1Frq6R4DFOPWyIY@fedora>
References: <20220609134452.1146309-1-eesposit@redhat.com>
 <20220609134452.1146309-3-eesposit@redhat.com>
 <YzW6FkfT9LT7aE7d@redhat.com>
 <29c33add-81ca-5a16-a02a-d2a0c5bfaf88@redhat.com>
 <YzcPBFcf3idA4MLH@redhat.com>
 <dc4bf265-4cd9-ef29-2e3f-d15e779bd8db@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OqXPHeyAINiSBkgF"
Content-Disposition: inline
In-Reply-To: <dc4bf265-4cd9-ef29-2e3f-d15e779bd8db@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--OqXPHeyAINiSBkgF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 03, 2022 at 10:52:33AM +0200, Emanuele Giuseppe Esposito wrote:
>=20
>=20
> Am 30/09/2022 um 17:45 schrieb Kevin Wolf:
> > Am 30.09.2022 um 14:17 hat Emanuele Giuseppe Esposito geschrieben:
> >> Am 29/09/2022 um 17:30 schrieb Kevin Wolf:
> >>> Am 09.06.2022 um 15:44 hat Emanuele Giuseppe Esposito geschrieben:
> >>>> Remove usage of aio_context_acquire by always submitting work items
> >>>> to the current thread's ThreadPool.
> >>>>
> >>>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> >>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> >>>
> >>> The thread pool is used by things outside of the file-* block drivers,
> >>> too. Even outside the block layer. Not all of these seem to submit wo=
rk
> >>> in the same thread.
> >>>
> >>>
> >>> For example:
> >>>
> >>> postcopy_ram_listen_thread() -> qemu_loadvm_state_main() ->
> >>> qemu_loadvm_section_start_full() -> vmstate_load() ->
> >>> vmstate_load_state() -> spapr_nvdimm_flush_post_load(), which has:
> >>>
> >>> ThreadPool *pool =3D aio_get_thread_pool(qemu_get_aio_context());
                         ^^^^^^^^^^^^^^^^^^^

aio_get_thread_pool() isn't thread safe either:

  ThreadPool *aio_get_thread_pool(AioContext *ctx)
  {
      if (!ctx->thread_pool) {
          ctx->thread_pool =3D thread_pool_new(ctx);
	  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Two threads could race in aio_get_thread_pool().

I think post-copy is broken here: it's calling code that was only
designed to be called from the main loop thread.

I have CCed Juan and David.

> >>> ...
> >>> thread_pool_submit_aio(pool, flush_worker_cb, state,
> >>>                        spapr_nvdimm_flush_completion_cb, state);
> >>>
> >>> So it seems to me that we may be submitting work for the main thread
> >>> from a postcopy migration thread.
> >>>
> >>> I believe the other direct callers of thread_pool_submit_aio() all
> >>> submit work for the main thread and also run in the main thread.
> >>>
> >>>
> >>> For thread_pool_submit_co(), pr_manager_execute() calls it with the p=
ool
> >>> it gets passed as a parameter. This is still bdrv_get_aio_context(bs)=
 in
> >>> hdev_co_ioctl() and should probably be changed the same way as for the
> >>> AIO call in file-posix, i.e. use qemu_get_current_aio_context().
> >>>
> >>>
> >>> We could consider either asserting in thread_pool_submit_aio() that we
> >>> are really in the expected thread, or like I suggested for LinuxAio d=
rop
> >>> the pool parameter and always get it from the current thread (obvious=
ly
> >>> this is only possible if migration could in fact schedule the work on
> >>> its current thread - if it schedules it on the main thread and then
> >>> exits the migration thread (which destroys the thread pool), that
> >>> wouldn't be good).
> >>
> >> Dumb question: why not extend the already-existing poll->lock to cover
> >> also the necessary fields like pool->head that are accessed by other
> >> threads (only case I could find with thread_pool_submit_aio is the one
> >> you pointed above)?
> >=20
> > Other people are more familiar with this code, but I believe this could
> > have performance implications. I seem to remember that this code is
> > careful to avoid locking to synchronise between worker threads and the
> > main thread.
> >=20
> > But looking at the patch again, I have actually a dumb question, too:
> > The locking you're removing is in thread_pool_completion_bh(). As this
> > is a BH, it's running the the ThreadPool's context either way, no matter
> > which thread called thread_pool_submit_aio().
> >=20
> > I'm not sure what this aio_context_acquire/release pair is actually
> > supposed to protect. Paolo's commit 1919631e6b5 introduced it. Was it
> > just more careful than it needs to be?
> >=20
>=20
> I think the goal is still to protect pool->head, but if so the
> aiocontext lock is put in the wrong place, because as you said the bh is
> always run in the thread pool context. Otherwise it seems to make no sens=
e.
>=20
> On the other side, thread_pool_submit_aio could be called by other
> threads on behalf of the main loop, which means pool->head could be
> modified (iothread calls thread_pool_submit_aio) while being read by the
> main loop (another worker thread schedules thread_pool_completion_bh).
>=20
> What are the performance implications? I mean, if the aiocontext lock in
> the bh is actually useful and the bh really has to wait to take it,
> being taken in much more places throughout the block layer won't be
> better than extending the poll->lock I guess.

thread_pool_submit_aio() is missing documentation on how it is supposed
to be called.

Taking pool->lock is conservative and fine in the short-term.

In the longer term we need to clarify how thread_pool_submit_aio() is
supposed to be used and remove locking to protect pool->head if
possible.

A bunch of the event loop APIs are thread-safe (aio_set_fd_handler(),
qemu_schedule_bh(), etc) so it's somewhat natural to make
thread_pool_submit_aio() thread-safe too. However, it would be nice to
avoid synchronization and existing callers mostly call it from the same
event loop thread that runs the BH and we can avoid locking in that
case.

Stefan

--OqXPHeyAINiSBkgF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNRa6sACgkQnKSrs4Gr
c8h3rgf/QZAm/k0P6iyNgAcS/5xVjsSf7de1nvMQupLQg0OpXNNKcjhpd6mubYxh
lhF8colJsyhZ1F0f8Pt+QXJs4iu7FmINzpo5kBNSxUfbSBVp2qkCUVfYNz85b3mx
XyhZmfYWpenSW7R/rDrO+K9l/Mwm/KAO3HRR1jTsb1aqqoTZp+VGXv5LuOFxU6kt
03RohKjci1lA4P6CsRpg9POCZpR4g+2iMJmCoWadNttLFPZqDRqeC3VmO/vII3Pj
exjzXfTqr+J+RPm0iat7qiZrP2+iVSYEdfvJTyegzu+mZKpufEqghyx1Ip4Rh8tQ
oVtw5BGdeGFYwys6MlFb/diUL2kE2w==
=si4f
-----END PGP SIGNATURE-----

--OqXPHeyAINiSBkgF--



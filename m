Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FCB1EBE7B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jun 2020 16:53:11 +0200 (CEST)
Received: from localhost ([::1]:57004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jg8Hu-0005fb-8w
	for lists+qemu-devel@lfdr.de; Tue, 02 Jun 2020 10:53:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1jg8Gr-00056H-IY
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 10:52:05 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:33539
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1jg8Gp-0008Vn-TO
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 10:52:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591109523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6k2RB/hhu+uq6smUOPlTUAEvls6IiKl70mif+4Daiiw=;
 b=TqDpp4P5OdY7g48MELxC2IZSkUrNvluNNAf69U3zhhDQBZ0ry2nluE5eW3e5nmkO0c60OF
 HQS47GowmqN2nvkhnFHGk2hdFPx9/8h3z3SZG1d6Opva1JQt3JT43P86OpZyUSKexq/cuh
 oq3+c8MbAhhRK36E4uEzeNts1Z7hHso=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-iLiJM2lSNEKZKWPpAIpEqQ-1; Tue, 02 Jun 2020 10:52:00 -0400
X-MC-Unique: iLiJM2lSNEKZKWPpAIpEqQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D12F3464;
 Tue,  2 Jun 2020 14:51:59 +0000 (UTC)
Received: from localhost (ovpn-120-187.rdu2.redhat.com [10.10.120.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0CB21BCBE;
 Tue,  2 Jun 2020 14:51:55 +0000 (UTC)
Date: Tue, 2 Jun 2020 16:51:54 +0200
From: Sergio Lopez <slp@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH] virtio-blk: Disable request queuing while switching
 contexts
Message-ID: <20200602145154.bcvffdrugmivz2gr@dritchie>
References: <20200602081112.32426-1-slp@redhat.com>
 <20200602112314.GF5940@linux.fritz.box>
 <20200602121835.kfld5taju25p6njn@dritchie>
 <20200602130433.GH5940@linux.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20200602130433.GH5940@linux.fritz.box>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="56cph3taxu5a6kxa"
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/02 03:23:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--56cph3taxu5a6kxa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 02, 2020 at 03:04:33PM +0200, Kevin Wolf wrote:
> Am 02.06.2020 um 14:18 hat Sergio Lopez geschrieben:
> > On Tue, Jun 02, 2020 at 01:23:14PM +0200, Kevin Wolf wrote:
> > > Am 02.06.2020 um 10:11 hat Sergio Lopez geschrieben:
> > > > Disable request queuing while switching contexts on
> > > > virtio_blk_data_plane_[start|stop](), preventing requests from gett=
ing
> > > > queued on the wrong context.
> > > >
> > > > Placing requests on the wrong context may lead to them being wrongl=
y
> > > > accessed in parallel from different threads, potentially leading to
> > > > multiple issues.
> > > >
> > > > For example, stopping and resuming a VM multiple times while the gu=
est
> > > > is generating I/O on a virtio_blk device can trigger a crash with a
> > > > stack tracing looking like this one:
> > > >
> > > > <------>
> > > >  Thread 2 (Thread 0x7ff736765700 (LWP 1062503)):
> > > >  #0  0x00005567a13b99d6 in iov_memset
> > > >      (iov=3D0x6563617073206f4e, iov_cnt=3D1717922848, offset=3D5160=
96, fillc=3D0, bytes=3D7018105756081554803)
> > > >      at util/iov.c:69
> > > >  #1  0x00005567a13bab73 in qemu_iovec_memset
> > > >      (qiov=3D0x7ff73ec99748, offset=3D516096, fillc=3D0, bytes=3D70=
18105756081554803) at util/iov.c:530
> > > >  #2  0x00005567a12f411c in qemu_laio_process_completion (laiocb=3D0=
x7ff6512ee6c0) at block/linux-aio.c:86
> > > >  #3  0x00005567a12f42ff in qemu_laio_process_completions (s=3D0x7ff=
7182e8420) at block/linux-aio.c:217
> > > >  #4  0x00005567a12f480d in ioq_submit (s=3D0x7ff7182e8420) at block=
/linux-aio.c:323
> > > >  #5  0x00005567a12f43d9 in qemu_laio_process_completions_and_submit=
 (s=3D0x7ff7182e8420)
> > > >      at block/linux-aio.c:236
> > > >  #6  0x00005567a12f44c2 in qemu_laio_poll_cb (opaque=3D0x7ff7182e84=
30) at block/linux-aio.c:267
> > > >  #7  0x00005567a13aed83 in run_poll_handlers_once (ctx=3D0x5567a2b5=
8c70, timeout=3D0x7ff7367645f8)
> > > >      at util/aio-posix.c:520
> > > >  #8  0x00005567a13aee9f in run_poll_handlers (ctx=3D0x5567a2b58c70,=
 max_ns=3D16000, timeout=3D0x7ff7367645f8)
> > > >      at util/aio-posix.c:562
> > > >  #9  0x00005567a13aefde in try_poll_mode (ctx=3D0x5567a2b58c70, tim=
eout=3D0x7ff7367645f8)
> > > >      at util/aio-posix.c:597
> > > >  #10 0x00005567a13af115 in aio_poll (ctx=3D0x5567a2b58c70, blocking=
=3Dtrue) at util/aio-posix.c:639
> > > >  #11 0x00005567a109acca in iothread_run (opaque=3D0x5567a2b29760) a=
t iothread.c:75
> > > >  #12 0x00005567a13b2790 in qemu_thread_start (args=3D0x5567a2b694c0=
) at util/qemu-thread-posix.c:519
> > > >  #13 0x00007ff73eedf2de in start_thread () at /lib64/libpthread.so.=
0
> > > >  #14 0x00007ff73ec10e83 in clone () at /lib64/libc.so.6
> > > >
> > > >  Thread 1 (Thread 0x7ff743986f00 (LWP 1062500)):
> > > >  #0  0x00005567a13b99d6 in iov_memset
> > > >      (iov=3D0x6563617073206f4e, iov_cnt=3D1717922848, offset=3D5160=
96, fillc=3D0, bytes=3D7018105756081554803)
> > > >      at util/iov.c:69
> > > >  #1  0x00005567a13bab73 in qemu_iovec_memset
> > > >      (qiov=3D0x7ff73ec99748, offset=3D516096, fillc=3D0, bytes=3D70=
18105756081554803) at util/iov.c:530
> > > >  #2  0x00005567a12f411c in qemu_laio_process_completion (laiocb=3D0=
x7ff6512ee6c0) at block/linux-aio.c:86
> > > >  #3  0x00005567a12f42ff in qemu_laio_process_completions (s=3D0x7ff=
7182e8420) at block/linux-aio.c:217
> > > >  #4  0x00005567a12f480d in ioq_submit (s=3D0x7ff7182e8420) at block=
/linux-aio.c:323
> > > >  #5  0x00005567a12f4a2f in laio_do_submit (fd=3D19, laiocb=3D0x7ff5=
f4ff9ae0, offset=3D472363008, type=3D2)
> > > >      at block/linux-aio.c:375
> > > >  #6  0x00005567a12f4af2 in laio_co_submit
> > > >      (bs=3D0x5567a2b8c460, s=3D0x7ff7182e8420, fd=3D19, offset=3D47=
2363008, qiov=3D0x7ff5f4ff9ca0, type=3D2)
> > > >      at block/linux-aio.c:394
> > > >  #7  0x00005567a12f1803 in raw_co_prw
> > > >      (bs=3D0x5567a2b8c460, offset=3D472363008, bytes=3D20480, qiov=
=3D0x7ff5f4ff9ca0, type=3D2)
> > > >      at block/file-posix.c:1892
> > > >  #8  0x00005567a12f1941 in raw_co_pwritev
> > > >      (bs=3D0x5567a2b8c460, offset=3D472363008, bytes=3D20480, qiov=
=3D0x7ff5f4ff9ca0, flags=3D0)
> > > >      at block/file-posix.c:1925
> > > >  #9  0x00005567a12fe3e1 in bdrv_driver_pwritev
> > > >      (bs=3D0x5567a2b8c460, offset=3D472363008, bytes=3D20480, qiov=
=3D0x7ff5f4ff9ca0, qiov_offset=3D0, flags=3D0)
> > > >      at block/io.c:1183
> > > >  #10 0x00005567a1300340 in bdrv_aligned_pwritev
> > > >      (child=3D0x5567a2b5b070, req=3D0x7ff5f4ff9db0, offset=3D472363=
008, bytes=3D20480, align=3D512, qiov=3D0x7ff72c0425b8, qiov_offset=3D0, fl=
ags=3D0) at block/io.c:1980
> > > >  #11 0x00005567a1300b29 in bdrv_co_pwritev_part
> > > >      (child=3D0x5567a2b5b070, offset=3D472363008, bytes=3D20480, qi=
ov=3D0x7ff72c0425b8, qiov_offset=3D0, flags=3D0)
> > > >      at block/io.c:2137
> > > >  #12 0x00005567a12baba1 in qcow2_co_pwritev_task
> > > >      (bs=3D0x5567a2b92740, file_cluster_offset=3D472317952, offset=
=3D487305216, bytes=3D20480, qiov=3D0x7ff72c0425b8, qiov_offset=3D0, l2meta=
=3D0x0) at block/qcow2.c:2444
> > > >  #13 0x00005567a12bacdb in qcow2_co_pwritev_task_entry (task=3D0x55=
67a2b48540) at block/qcow2.c:2475
> > > >  #14 0x00005567a13167d8 in aio_task_co (opaque=3D0x5567a2b48540) at=
 block/aio_task.c:45
> > > >  #15 0x00005567a13cf00c in coroutine_trampoline (i0=3D738245600, i1=
=3D32759) at util/coroutine-ucontext.c:115
> > > >  #16 0x00007ff73eb622e0 in __start_context () at /lib64/libc.so.6
> > > >  #17 0x00007ff6626f1350 in  ()
> > > >  #18 0x0000000000000000 in  ()
> > > > <------>
> > > >
> > > > This is also known to cause crashes with this message (assertion
> > > > failed):
> > > >
> > > >  aio_co_schedule: Co-routine was already scheduled in 'aio_co_sched=
ule'
> > > >
> > > > RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=3D1812765
> > > > Signed-off-by: Sergio Lopez <slp@redhat.com>
> > > > ---
> > > >  hw/block/dataplane/virtio-blk.c | 10 ++++++++++
> > > >  1 file changed, 10 insertions(+)
> > > >
> > > > diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/v=
irtio-blk.c
> > > > index 1b52e8159c..f1c7ba69c0 100644
> > > > --- a/hw/block/dataplane/virtio-blk.c
> > > > +++ b/hw/block/dataplane/virtio-blk.c
> > > > @@ -214,12 +214,17 @@ int virtio_blk_data_plane_start(VirtIODevice =
*vdev)
> > > >      vblk->dataplane_started =3D true;
> > > >      trace_virtio_blk_data_plane_start(s);
> > > >
> > > > +    /* Prevent requests from getting queued on the old context */
> > > > +    blk_set_disable_request_queuing(s->conf->conf.blk, true);
> > > > +
> > > >      r =3D blk_set_aio_context(s->conf->conf.blk, s->ctx, &local_er=
r);
> > > >      if (r < 0) {
> > > >          error_report_err(local_err);
> > > >          goto fail_guest_notifiers;
> > > >      }
> > > >
> > > > +    blk_set_disable_request_queuing(s->conf->conf.blk, false);
> > > > +
> > >
> > > Why are we even getting new requests that could possibly be queued? T=
his
> > > is in virtio_blk_data_plane_start/stop(), so clearly the device shoul=
d
> > > be idle and the virtio queues shouldn't be processed at all at the sa=
me
> > > time?
> >=20
> > Requests are processed and queued by virtio_blk_dma_restart_bh(),
> > which is a BH registered by virtio_blk_dma_restart_cb(), which in turn
> > is a callback for VM state change events registered with
> > qemu_add_vm_change_state_handler(virtio_blk_dma_restart_cb, s).
> >=20
> > This is the back trace of a request being queued this way:
> >=20
> > (gdb) bt
> > #0  0x000055cd35ce7490 in virtio_blk_submit_multireq (blk=3D0x55cd38cd2=
4d0, mrb=3D0x7ffd25b365c0)
> >     at /root/src/qemu/hw/block/virtio-blk.c:448
> > #1  0x000055cd35ce7d5f in virtio_blk_handle_request (req=3D0x7f5a4c022c=
80, mrb=3D0x7ffd25b365c0)
> >     at /root/src/qemu/hw/block/virtio-blk.c:686
> > #2  0x000055cd35ce8602 in virtio_blk_dma_restart_bh (opaque=3D0x55cd38c=
cf4c0)
> >     at /root/src/qemu/hw/block/virtio-blk.c:836
> > #3  0x000055cd360dc4f5 in aio_bh_call (bh=3D0x55cd3880b300) at /root/sr=
c/qemu/util/async.c:164
> > #4  0x000055cd360dc4f5 in aio_bh_poll (ctx=3Dctx@entry=3D0x55cd3780bff0=
) at /root/src/qemu/util/async.c:164
> > #5  0x000055cd360dfd29 in aio_poll (ctx=3Dctx@entry=3D0x55cd3780bff0, b=
locking=3Dblocking@entry=3Dtrue)
> >     at /root/src/qemu/util/aio-posix.c:650
> > #6  0x000055cd3603a645 in bdrv_do_drained_begin
> >     (poll=3Dtrue, ignore_bds_parents=3Dfalse, parent=3D0x0, recursive=
=3Dfalse, bs=3D0x55cd3788d550)
> >     at /root/src/qemu/block/io.c:429
> > #7  0x000055cd3603a645 in bdrv_do_drained_begin
> >     (bs=3D0x55cd3788d550, recursive=3D<optimized out>, parent=3D0x0, ig=
nore_bds_parents=3D<optimized out>, poll=3D<optimized out>) at /root/src/qe=
mu/block/io.c:395
> > #8  0x000055cd35fde969 in bdrv_set_aio_context_ignore
> >     (bs=3Dbs@entry=3D0x55cd3788d550, new_context=3Dnew_context@entry=3D=
0x55cd37810e40, ignore=3Dignore@entry=3D0x7ffd25b36890) at /root/src/qemu/b=
lock.c:6309
> > #9  0x000055cd35fdef33 in bdrv_child_try_set_aio_context
> >     (bs=3Dbs@entry=3D0x55cd3788d550, ctx=3D0x55cd37810e40, ignore_child=
=3D<optimized out>, errp=3D<optimized out>)
> >     at /root/src/qemu/block.c:6431
> > #10 0x000055cd3602919b in blk_do_set_aio_context
> >     (blk=3D0x55cd38cd24d0, new_context=3D0x55cd37810e40, update_root_no=
de=3D<optimized out>, errp=3D<optimized out>) at /root/src/qemu/block/block=
-backend.c:2016
> > #11 0x000055cd35cef54f in virtio_blk_data_plane_start (vdev=3D<optimize=
d out>)
> >     at /root/src/qemu/hw/block/dataplane/virtio-blk.c:220
>=20
> Ugh. Thanks, I see now what's going on.
>=20
> We were relying on blk_set_aio_context() to complete the requests, and
> since BlockBackend queues the requests instead of completing them during
> drained_begin, we end up executing the requests after drained_end in the
> main loop context, but the block nodes have meanwhile moved to the
> iothread context.
>=20
> Of course, this was already a bad hack before, witnessed by the FIXME
> comment in virtio_blk_dma_restart_cb().
>=20
> > I'm not familiar with the code, but I guess we need this BH to ensure
> > we process the virtqueue after resuming.
>=20
> The BH was introduced in commit 213189ab65d. The commit message has a
> very detailed problem description, but to summarise, if I understand
> correctly, the main purpose is that we don't end up stopping the VM due
> to an I/O error while we are only in the middle of sending VM state
> handlers events that the VM is about to be continued.

Thanks for pointers.

> > We could perhaps schedule the BH in a different way, or add a flag to
> > VirtIOBlock so virtio_blk_data_plane_[start|stop] would instruct
> > virtio_blk_dma_restart_bh() to avoid processing the virtqueue,
> > rescheduling itself instead. How does this would look to you?
>=20
> Yes, I think if dataplane is enabled, we should really run the restarted
> requests in the iothread. virtio_blk_dma_restart_cb() is called too
> early, before the dataplane is running, so I guess we need some way to
> tell the dataplane that it should run the request restarting logic of
> virtio_blk_dma_restart_bh() after it has started (no additional BH
> needed there). Your flag sounds like the obvious way to get this.
>=20
> In fact, would it hurt to do this just unconditionally without a flag?
> s->rq should be NULL when there is nothing to restart.
>=20
> And then we can skip the same logic in virtio_blk_dma_restart_cb() if we
> know that a dataplane is going to be started.

OK, I'll prepare a patch implementing this strategy to see how it
would look like.

Thanks,
Sergio.

--56cph3taxu5a6kxa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAl7WZ4cACgkQ9GknjS8M
AjX+ew//exQQbSC97VuDQ6DPXbQ8zaeVXvDeTV8uVDx0WpMDLHlZ5GpGhXXUMkSi
5eNLNhJ8/YDRfEyFors/Hg/e8OgsDBfW+4LOzEhVdqJwN+NaSTomDdi3mpP827nq
uAPp0WzhWF7dkdFWliDHfeYC9OQu688pFZnq+vt5uGE6Vr6AZYyukCvIOP1U4iZ7
k+VH+8g6vsarYnR8HljkghrzJRjZTP4QfVxInvVdEkUK3OcsCfungQkF+HQxOanZ
t/RidaMjcDbGHx59xB7+EDidxJQ6BmCHZIksh6/wU9i4Ge2bVHW4mU7y12pfsMdN
xWdWIfgp7I4GSexqh4gHYQZUDOxLgkkT4ISrUcgrq603RfIpPc0H0Xo9/nCqy08H
2Q8gmTrlRlOaILrlZgS12kuwOw/b0uabLnqYYhqnhVxX+xb4x/5VAa9DQead6fQY
SN+rHUX6Bg3NfwSCZ8BFCL4bFFlMt8nKYJMAt0fl8nqXr2u42OvpHjeSW0butfZB
qNQmEOINvVTa13vLO5k7jtJcvBCGhcS1Q8ZFC4sd7beIVYijiEriuV3HacnbAb4n
P9S6nC7dn7H1TliN641gyT0pbcBuy+cqbIROqXZfGknht01pcyKc6EJF5u+cNmdh
nWZ0RobB/9ouM5DWMg9QdhrIUVnl8QGbBP3wNamS7QN7LpbLUzU=
=S8NF
-----END PGP SIGNATURE-----

--56cph3taxu5a6kxa--



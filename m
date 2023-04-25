Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A96896EE5C4
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 18:31:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prLXz-0004oa-Fe; Tue, 25 Apr 2023 12:29:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1prLXo-0004o0-Qc
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 12:29:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1prLXm-00070a-T2
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 12:29:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682440169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=42lP/ytKQA/eCGkNRdBo0J2DfrHW7Ye9O5dUPefMkOg=;
 b=c31Jhpx9gvr/q1DlUBnsu+1IMvFW7jSNaa8DS4rA5uV9pQGGAvFBf6Kn53hBZPblhqEv4N
 X1JHQLBIl4hI6zu9c8nGIbvCe3VfZ5SkQGqKJ4daMff7qHKzF6wSh/vrwzUi1Y+3rVLBpK
 L+1ja1wHw4wnZ3XX8werieY0arFV+n4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-111-R8bTjhhCPLi9WY5oOQOfhw-1; Tue, 25 Apr 2023 12:29:27 -0400
X-MC-Unique: R8bTjhhCPLi9WY5oOQOfhw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 225DF185A790;
 Tue, 25 Apr 2023 16:29:26 +0000 (UTC)
Received: from localhost (unknown [10.39.193.242])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 562ACC15BA0;
 Tue, 25 Apr 2023 16:29:24 +0000 (UTC)
Date: Tue, 25 Apr 2023 12:29:22 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Lieven <pl@kamp.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Xie Yongji <xieyongji@bytedance.com>,
 Juan Quintela <quintela@redhat.com>, qemu-block@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>, Stefan Weil <sw@weilnetz.de>,
 Fam Zheng <fam@euphon.net>, Julia Suvorova <jusual@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 xen-devel@lists.xenproject.org, Hanna Reitz <hreitz@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, eesposit@redhat.com,
 Kevin Wolf <kwolf@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v3 00/20] block: remove aio_disable_external() API
Message-ID: <20230425162922.GA725672@fedora>
References: <20230420113732.336620-1-stefanha@redhat.com>
 <1e1f3a54-7113-7929-38a1-23d97bfa4d45@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lTQFmEIU0pfkRcw9"
Content-Disposition: inline
In-Reply-To: <1e1f3a54-7113-7929-38a1-23d97bfa4d45@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--lTQFmEIU0pfkRcw9
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 20, 2023 at 03:39:59PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Hi Stefan,
>=20
> On 20/4/23 13:37, Stefan Hajnoczi wrote:
> > v3:
> > - Resend full patch series. v2 was sent in the middle of a git rebase a=
nd was
> >    missing patches. [Eric]
> > - Apply Reviewed-by tags.
>=20
> > Based-on: 087bc644b7634436ca9d52fe58ba9234e2bef026 (kevin/block-next)
>=20
> It seems kevin/block-next got rebased and doesn't contain 087bc644b76.
>=20
> Based on 3d1ba50c4b ("vmdk: make vmdk_is_cid_valid a coroutine_fn")
> I get:
>=20
> Applying: hw/qdev: introduce qdev_is_realized() helper
> Applying: virtio-scsi: avoid race between unplug and transport event
> Applying: virtio-scsi: stop using aio_disable_external() during unplug
> Applying: block/export: only acquire AioContext once for
> vhost_user_server_stop()
> error: patch failed: util/vhost-user-server.c:346
> error: util/vhost-user-server.c: patch does not apply
> Patch failed at 0004 block/export: only acquire AioContext once for
> vhost_user_server_stop()
>=20
> Hmm patch #4 is already merged as commit 2957dc40a2, let's skip it:
>=20
> $ git am --skip
> Applying: util/vhost-user-server: rename refcount to in_flight counter
> Applying: block/export: wait for vhost-user-blk requests when draining
> Applying: block/export: stop using is_external in vhost-user-blk server
> Applying: hw/xen: do not use aio_set_fd_handler(is_external=3Dtrue) in
> xen_xenstore
> Applying: block: add blk_in_drain() API
> Applying: block: drain from main loop thread in bdrv_co_yield_to_drain()
> Applying: xen-block: implement BlockDevOps->drained_begin()
> Applying: hw/xen: do not set is_external=3Dtrue on evtchn fds
> Applying: block/export: rewrite vduse-blk drain code
> Applying: block/export: don't require AioContext lock around
> blk_exp_ref/unref()
> Applying: block/fuse: do not set is_external=3Dtrue on FUSE fd
> Applying: virtio: make it possible to detach host notifier from any thread
> Applying: virtio-blk: implement BlockDevOps->drained_begin()
> Applying: virtio-scsi: implement BlockDevOps->drained_begin()
> Applying: virtio: do not set is_external=3Dtrue on host notifiers
> Applying: aio: remove aio_disable_external() API
> error: patch failed: util/fdmon-epoll.c:131
> error: util/fdmon-epoll.c: patch does not apply
> Patch failed at 0020 aio: remove aio_disable_external() API
>=20
> Now this clashes with commit e62da98527 ("aio-posix: fix race between epo=
ll
> upgrade and aio_set_fd_handler()").
>=20
> Indeed reverting both e62da98527 / 2957dc40a2, I can apply your
> series.

Thanks, I will rebase to origin/master now to make this patch series
easier to merge.

Stefan

--lTQFmEIU0pfkRcw9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRH/+IACgkQnKSrs4Gr
c8iYggf/b4293BgOm1R5DDER4USW/3OSKh2P4LwY7cqAodChEJo2dbRViaYECV2Q
bSxEGgsjB6wPdZYKwNFWfPiBpVQswZHeF0JDoupXILM4ZnsMtOXuhQKCIREPvPcj
nwMdkECDC6G/aIyzybY4xHV4lYoUvv61OlvEzuG5p+6jmyiUIB7WYwftBdG0Vfsy
eo5110kPiYRdcAlMsL7QpgS01WT9DBCSw98NhH0x0dWLBYlgkgGhP7GRnIMfriFc
o+v31v9eCHe7J1wvvqdbniWgas9xqxzQyyLhXcvbVffHlUftAZ2KL/fhYIXyRwtk
vl3prMrg4+6AVRr5K4a+zoJ8eK8ETg==
=cT+E
-----END PGP SIGNATURE-----

--lTQFmEIU0pfkRcw9--



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC4843E57E
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 17:53:36 +0200 (CEST)
Received: from localhost ([::1]:53862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg7ig-0005MG-N0
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 11:53:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mg7fc-0001jK-2E
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:50:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mg7fX-0002wl-FL
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:50:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635436218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=38lWvMwvkmAAhy1Hh6GPsxCADphfLMTkYdfACB4s8fk=;
 b=EDN4I0iFlkKdjWBKQtoO1GyjNhLzs2UZASe73KB6XsakGVHBbNAm9m8pJLx269VSpxvzQj
 Qw8dT27Mo8F8fmnuCf7LFFgNv7xyWPQaDlq9xCDjdv/mQ5hhLaxDxZlXfGCq6h9kGUExOf
 0eLBoU4UQkggNR6Z17JaNXewO/lNHlE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-GX-XOyvFNbmUu57eWyLxZA-1; Thu, 28 Oct 2021 11:50:17 -0400
X-MC-Unique: GX-XOyvFNbmUu57eWyLxZA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 068B45074D;
 Thu, 28 Oct 2021 15:50:16 +0000 (UTC)
Received: from localhost (unknown [10.39.194.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9BFF760C4A;
 Thu, 28 Oct 2021 15:49:56 +0000 (UTC)
Date: Thu, 28 Oct 2021 16:49:55 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v4 00/25] block layer: split block APIs in global state
 and I/O
Message-ID: <YXrGo4OeIR21qhWs@stefanha-x1.localdomain>
References: <20211025101735.2060852-1-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211025101735.2060852-1-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="N1TpBYZk9WVtIFxh"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--N1TpBYZk9WVtIFxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 25, 2021 at 06:17:10AM -0400, Emanuele Giuseppe Esposito wrote:
> Currently, block layer APIs like block-backend.h contain a mix of
> functions that are either running in the main loop and under the
> BQL, or are thread-safe functions and run in iothreads performing I/O.
> The functions running under BQL also take care of modifying the
> block graph, by using drain and/or aio_context_acquire/release.
> This makes it very confusing to understand where each function
> runs, and what assumptions it provided with regards to thread
> safety.
>=20
> We call the functions running under BQL "global state (GS) API", and
> distinguish them from the thread-safe "I/O API".
>=20
> The aim of this series is to split the relevant block headers in
> global state and I/O sub-headers. The division will be done in

Kevin and Hanna,
Does one of you want to review and merge this? It affects the entire
block layer and your input would be valuable.

Thanks,
Stefan

> this way:
> header.h will be split in header-global-state.h, header-io.h and
> header-common.h. The latter will just contain the data structures
> needed by header-global-state and header-io, and common helpers
> that are neither in GS nor in I/O. header.h will remain for
> legacy and to avoid changing all includes in all QEMU c files,
> but will only include the two new headers. No function shall be
> added in header.c .
> Once we split all relevant headers, it will be much easier to see what
> uses the AioContext lock and remove it, which is the overall main
> goal of this and other series that I posted/will post.
>=20
> In addition to splitting the relevant headers shown in this series,
> it is also very helpful splitting the function pointers in some
> block structures, to understand what runs under AioContext lock and
> what doesn't. This is what patches 19-25 do.
>=20
> Each function in the GS API will have an assertion, checking
> that it is always running under BQL.
> I/O functions are instead thread safe (or so should be), meaning
> that they *can* run under BQL, but also in an iothread in another
> AioContext. Therefore they do not provide any assertion, and
> need to be audited manually to verify the correctness.
>=20
> Adding assetions has helped finding 2 bugs already, as shown in
> my series "Migration: fix missing iothread locking".
>=20
> Tested this series by running unit tests, qemu-iotests and qtests
> (x86_64).
> Some functions in the GS API are used everywhere but not
> properly tested. Therefore their assertion is never actually run in
> the tests, so despite my very careful auditing, it is not impossible
> to exclude that some will trigger while actually using QEMU.
>=20
> Patch 1 introduces qemu_in_main_thread(), the function used in
> all assertions. This had to be introduced otherwise all unit tests
> would fail, since they run in the main loop but use the code in
> stubs/iothread.c
> Patches 2-14 and 19-25 (with the exception of patch 9, that is an additio=
nal
> assert) are all structured in the same way: first we split the header
> and in the next (even) patch we add assertions.
> The rest of the patches ontain either both assertions and split,
> or have no assertions.
>=20
> Next steps once this get reviewed:
> 1) audit the GS API and replace the AioContext lock with drains,
> or remove them when not necessary (requires further discussion).
> 2) [optional as it should be already the case] audit the I/O API
> and check that thread safety is guaranteed
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
> v3 -> v4:
> * blockdev.h (patch 14): blockdev_mark_auto_del, blockdev_auto_del
>   and blk_legacy_dinfo as GS API.
> * add copyright header to block.h, block-io.h and block-global-state.h
> * rebase on current master (c5b2f55981)
>=20
> v2 -> v3:
> * rename "graph API" into "global state API"
> * change order of patches, block.h comes before block-backend.h
> * change GS and I/O comment headers to avoid redundancy, all other
>   headers refer to block-global-state.h and block-io.h
> * fix typo on GS and I/O headers
> * use assert instead of g_assert
> * move bdrv_pwrite_sync, bdrv_block_status and bdrv_co_copy_range_{from/t=
o}
>   to the I/O API
> * change assert_bdrv_graph_writable implementation, since we need
>   to introduce additional drains
> * remove transactions API split
> * add preparation patch for blockdev.h (patch 13)
> * backup-top -> copy-on-write
> * change I/O comment in job.h into a better meaningful explanation
> * fix all warnings given by checkpatch, mostly due to /* */ to be
>   split in separate lines
> * rebase on current master (c09124dcb8), and split the following new func=
tions:
> =09blk_replace_bs (I/O)
> =09bdrv_bsc_is_data (I/O)
> =09bdrv_bsc_invalidate_range (I/O)
> =09bdrv_bsc_fill (I/O)
> =09bdrv_new_open_driver_opts (GS)
> =09blk_get_max_hw_iov (I/O)
>   they are all added in patches 4 and 6.
>=20
> v1 -> v2:
> * remove the iothread locking bug fix, and send it as separate patch
> * rename graph API -> global state API
> * better documented patch 1 (qemu_in_main_thread)
> * add and split all other block layer headers
> * fix warnings given by checkpatch on multiline comments
>=20
> Emanuele Giuseppe Esposito (25):
>   main-loop.h: introduce qemu_in_main_thread()
>   include/block/block: split header into I/O and global state API
>   assertions for block global state API
>   include/sysemu/block-backend: split header into I/O and global state
>     (GS) API
>   block/block-backend.c: assertions for block-backend
>   include/block/block_int: split header into I/O and global state API
>   assertions for block_int global state API
>   block: introduce assert_bdrv_graph_writable
>   include/block/blockjob_int.h: split header into I/O and GS API
>   assertions for blockjob_int.h
>   include/block/blockjob.h: global state API
>   assertions for blockob.h global state API
>   include/sysemu/blockdev.h: move drive_add and inline drive_def
>   include/systemu/blockdev.h: global state API
>   assertions for blockdev.h global state API
>   include/block/snapshot: global state API + assertions
>   block/copy-before-write.h: global state API + assertions
>   block/coroutines: I/O API
>   block_int-common.h: split function pointers in BlockDriver
>   block_int-common.h: assertion in the callers of BlockDriver function
>     pointers
>   block_int-common.h: split function pointers in BdrvChildClass
>   block_int-common.h: assertions in the callers of BdrvChildClass
>     function pointers
>   block-backend-common.h: split function pointers in BlockDevOps
>   job.h: split function pointers in JobDriver
>   job.h: assertions in the callers of JobDriver funcion pointers
>=20
>  block.c                                     |  188 ++-
>  block/backup.c                              |    1 +
>  block/block-backend.c                       |  105 +-
>  block/commit.c                              |    4 +
>  block/copy-before-write.c                   |    2 +
>  block/copy-before-write.h                   |    7 +
>  block/coroutines.h                          |    6 +
>  block/dirty-bitmap.c                        |    1 +
>  block/io.c                                  |   37 +
>  block/meson.build                           |    7 +-
>  block/mirror.c                              |    4 +
>  block/monitor/bitmap-qmp-cmds.c             |    6 +
>  block/monitor/block-hmp-cmds.c              |    2 +-
>  block/snapshot.c                            |   28 +
>  block/stream.c                              |    2 +
>  blockdev.c                                  |   55 +-
>  blockjob.c                                  |   14 +
>  include/block/block-common.h                |  389 +++++
>  include/block/block-global-state.h          |  286 ++++
>  include/block/block-io.h                    |  306 ++++
>  include/block/block.h                       |  878 +----------
>  include/block/block_int-common.h            | 1193 +++++++++++++++
>  include/block/block_int-global-state.h      |  327 ++++
>  include/block/block_int-io.h                |  163 ++
>  include/block/block_int.h                   | 1478 +------------------
>  include/block/blockjob.h                    |    9 +
>  include/block/blockjob_int.h                |   28 +
>  include/block/snapshot.h                    |   13 +-
>  include/qemu/job.h                          |   16 +
>  include/qemu/main-loop.h                    |   13 +
>  include/sysemu/block-backend-common.h       |   92 ++
>  include/sysemu/block-backend-global-state.h |  122 ++
>  include/sysemu/block-backend-io.h           |  139 ++
>  include/sysemu/block-backend.h              |  269 +---
>  include/sysemu/blockdev.h                   |   24 +-
>  job.c                                       |    9 +
>  migration/savevm.c                          |    2 +
>  softmmu/cpus.c                              |    5 +
>  softmmu/qdev-monitor.c                      |    2 +
>  softmmu/vl.c                                |   25 +-
>  stubs/iothread-lock.c                       |    5 +
>  41 files changed, 3619 insertions(+), 2643 deletions(-)
>  create mode 100644 include/block/block-common.h
>  create mode 100644 include/block/block-global-state.h
>  create mode 100644 include/block/block-io.h
>  create mode 100644 include/block/block_int-common.h
>  create mode 100644 include/block/block_int-global-state.h
>  create mode 100644 include/block/block_int-io.h
>  create mode 100644 include/sysemu/block-backend-common.h
>  create mode 100644 include/sysemu/block-backend-global-state.h
>  create mode 100644 include/sysemu/block-backend-io.h
>=20
> --=20
> 2.27.0
>=20

--N1TpBYZk9WVtIFxh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmF6xqMACgkQnKSrs4Gr
c8go5wf/UQ5KxVTooTXduD6RFcxkZt8EiDngT7yHtn86V0MpTzs7VBzHRbApvJLE
SCB20FgV6XJ0T54oTnKI9s2b9MRDhQI8bbkjlTYm72TbMHHgfL6FTGaA0c9SVVn1
kB8Z/Kx8TrhAmA3OsH67aGW4QcseB3jQixN3ItlliuHRfezsHSHfYPKq/Bqb0f+Q
AMhmAplRN+RGLhhiJqEhiRspiwvz/JhHTfHeiSWfD/DkbkV1qwU/HMg5l8jK6IBI
dC3MFMfTeMYAwYnFbIYh6Xq9l0k7mC7SvoDEl6k4xr2a6Ovfjz+DdrkEGscvNns8
i1mcdRI0/2uYRxLxFUcKzP0RE0U4sQ==
=xit3
-----END PGP SIGNATURE-----

--N1TpBYZk9WVtIFxh--



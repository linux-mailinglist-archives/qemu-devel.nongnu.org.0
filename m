Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C07392EFF
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 15:04:35 +0200 (CEST)
Received: from localhost ([::1]:47814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmFgf-0005Cp-H3
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 09:04:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lmEoI-0007ke-H4
 for qemu-devel@nongnu.org; Thu, 27 May 2021 08:08:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lmEnz-0003x8-QG
 for qemu-devel@nongnu.org; Thu, 27 May 2021 08:08:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622117280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hy+POg8F1DgCu0D0IwH7pFMkNcDBAG5Vscvdk5Lcpk0=;
 b=IjvqBoM33dVhRqT0HF69CeFmRRkuMLgomRRUH+JzXQXA1/Yc07nchNmJHqh4hUhspwSLkB
 51DhfkbLDuwsnWFjWvmjwEuyej8OBPGkHsU+xhKI7kwEY49D8+unWZp1iajdKUoxOnV8Rw
 wdwHuV217pky+NzFebB932t2o5bsX4A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-xEwjbkptOHeOG2EcG9Se7Q-1; Thu, 27 May 2021 08:07:58 -0400
X-MC-Unique: xEwjbkptOHeOG2EcG9Se7Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A0E5107ACCA;
 Thu, 27 May 2021 12:07:57 +0000 (UTC)
Received: from localhost (ovpn-114-147.ams2.redhat.com [10.36.114.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD34010023AF;
 Thu, 27 May 2021 12:07:56 +0000 (UTC)
Date: Thu, 27 May 2021 11:31:22 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v2 0/7] block-copy: protect block-copy internal structures
Message-ID: <YK90+mIIjmgFJ8So@stefanha-x1.localdomain>
References: <20210518100757.31243-1-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210518100757.31243-1-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Hp3SYIs7bQAbpA2b"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Hp3SYIs7bQAbpA2b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 18, 2021 at 12:07:50PM +0200, Emanuele Giuseppe Esposito wrote:
> This serie of patches aims to reduce the usage of the global
> AioContexlock in block-copy, by introducing smaller granularity
> locks thus on making the block layer thread safe.=20
>=20
> This serie depends on Paolo's coroutine_sleep API and my previous
> serie that brings thread safety to the smaller API used by block-copy,
> like ratelimit, progressmeter abd co-shared-resource.
>=20
> What's missing for block-copy to be fully thread-safe is fixing
> the CoSleep API to allow cross-thread sleep and wakeup.
> Paolo is working on it and will post the patches once his new
> CoSleep API is accepted.
>=20
> Patch 1 introduces the .method field instead of .use_copy_range
> and .copy_size, so that it can be later used as atomic.
> Patch 2-3 provide comments and refactoring in preparation to
> the locks added in patch 4 on BlockCopyTask, patch 5-6 on
> BlockCopyCallState and 7 BlockCopyState.
>=20
> Based-on: <20210517100548.28806-1-pbonzini@redhat.com>
> Based-on: <20210518094058.25952-1-eesposit@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Here is my understanding of thread-safety in your
https://gitlab.com/eesposit/qemu.git dataplane_new branch:

Reading the code was much more satisfying than trying to review the
patches. That's probably because I'm not familiar with the block-copy.c
implementation and needed the context. I noticed you already addressed
some of Vladimir's comments in your git branch, so that may have helped
too.

The backup block job and the backup-top filter driver have a
BlockCopyState. QEMU threads that call bdrv_co_preadv/pwritev() invoke
the block_copy() coroutine function, so BlockCopyState needs to be
protected between threads. Additionally, the backup block job invokes
block_copy_async() to perform a background copy operation.

The relationships are as follows:

BlockCopyState - shared state that any thread can access
BlockCopyCallState - per-block_copy()/block_copy_async() state, not
                     accessed by other coroutines/threads
BlockCopyTask - per-aiotask state, find_conflicting_task_locked()
                accesses this for a given BlockCopyState

What is the purpose of the BlockCopyState->calls list?

Existing issue: the various
block_copy_call_finished/succeeded/failed/cancelled/status() APIs are a
bit extreme. They all end up being called by block/backup.c in
succession when it seems like a single call should be enough to report
the status.

It's not immediately obvious to me that BlockCopyCallState needs to be
thread-safe. So I wondered why finished needs to be atomic. Then I
realized the set_speed/cancel code runs in the monitor, so at least
block_copy_call_cancel() and block_copy_kick() need to be thread-safe. I
guess the BlockCopyCallState status APIs were made thread-safe for
consistency even though it's not needed at the moment?

Please add doc comments to block-copy.h explaining the thread-safety of
the APIs (it might be as simple as "all APIs are thread-safe" at the top
of the file).

Summarizing everything, this series adds BlockCopyState->lock to protect
shared state and makes BlockCopyCallState's status atomic so it can be
queried from threads other than the one performing the copy operation.

Stefan

--Hp3SYIs7bQAbpA2b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCvdPoACgkQnKSrs4Gr
c8gSmQf/RIcuNSXMvRBA6VTfpWrAZjUl2qpl0hcWWPiYzRTY9COJFiieomRiruUT
hKH1uOtq6i+TquBqEsl6PiHH9Ar97SdWdozRkoYu9wBY3oLQ9ufSJH1F8BASAZcu
2Gi28B/kaQCIFiJiIIUF9CuTkCUVNJzTflaKdWteFaytZzeC16HuJZP98ZoIlIVl
D7Ol/9klHLbWaxXclVWZ8GN4Je85I7NLe8wltx0eTojjU2DUHqoanrSN8VcQAGVs
s7BnmiBgM9/rOw417aas4kzRVZvuU33O8SI38eeXAsDMuR41tyQSfPLYvMsrrSqM
n+4yZGmCdPc6pxpSSj9ERl5wdxf+9Q==
=oz8k
-----END PGP SIGNATURE-----

--Hp3SYIs7bQAbpA2b--



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D39DD20B1F1
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 15:01:10 +0200 (CEST)
Received: from localhost ([::1]:37420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jonyf-0006PR-Qn
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 09:01:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jonxH-0005eZ-5D
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 08:59:43 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:30836
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jonxE-0002er-PV
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 08:59:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593176379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/eujCzkKLyh0OkB2WlxP+JFAAQ7Zyclc2suTaKoQmvQ=;
 b=AZoBkaoOqPLBq2d3kaA8UqMTXOX2I2mU+opNGKHCEgoPnPGxUTdjPxTT/Y8Lizf6KP49jP
 xhjaoj+RRWKPU5QmxC2+rxTprwRU6QiPkuzxCwMLc6LKUK5fc+i3TtQ/lvCWY5jHKeWFr6
 PPPl/zFCZve4/ADm1EjJWBCBEaIMDYo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-_6oXG1mIO1O5K5TrynexsQ-1; Fri, 26 Jun 2020 08:59:36 -0400
X-MC-Unique: _6oXG1mIO1O5K5TrynexsQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94046107ACCA;
 Fri, 26 Jun 2020 12:59:35 +0000 (UTC)
Received: from localhost (ovpn-114-181.ams2.redhat.com [10.36.114.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3602171671;
 Fri, 26 Jun 2020 12:59:35 +0000 (UTC)
Date: Fri, 26 Jun 2020 13:59:33 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH 15/17] block/nvme: Use per-queue AIO context
Message-ID: <20200626125933.GY281902@stefanha-x1.localdomain>
References: <20200625184838.28172-1-philmd@redhat.com>
 <20200625184838.28172-16-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200625184838.28172-16-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6Jy4/gb9ZgnsEOX8"
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/26 03:23:21
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--6Jy4/gb9ZgnsEOX8
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2020 at 08:48:36PM +0200, Philippe Mathieu-Daud=E9 wrote:
> To be able to use multiple queues on the same hardware,
> we need to have each queue able to receive IRQ notifications
> in the correct AIO context.
> The context has to be proper to each queue, not to the block
> driver. Move aio_context from BDRVNVMeState to NVMeQueuePair.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
> RFC because I'm not familiar with AIO context

To keep things simple I suggest only doing Step 1 in this patch series.

Step 1:
The existing irq_notifier handler re-enters the request coroutine from a
BH scheduled in the BlockDriverState's AioContext. It doesn't matter
where the irq_notifier is handled, the completions will run in their
respective BlockDriverState AioContexts. This means that two
BlockDriverStates with different AioContexts sharing a single hardware
state will work correctly with just a single hardware queue. Therefore
multiqueue support is not required to support multiple BDSes with
different AioContexts.

Step 2:
Better performance can be achieved by creating multiple hardware
queuepairs, each with its own irq_notifier. During request submission a
int queue_idx_from_aio_context(AioContext *ctx) mapping function selects
a hardware queue. Hopefully that hardware queue's irq_notifier is
handled in the same Aiocontext for best performance, but there might be
cases where there are more BDS AioContexts than nvme hw queues.

Step 3:
When the QEMU block layer has multiqueue support then we'll no longer
map the BlockDriverState AioContext to a queue index but instead use
qemu_get_current_aio_context(). At this point a single BDS can process
I/O in multiple AioContexts and hardware queuepairs.

--6Jy4/gb9ZgnsEOX8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl718TUACgkQnKSrs4Gr
c8hnOwf/T5EUkPjtvjyQBafQVX8OEsP/JXHGXB3CHe2xbfA8eurqYk4dD6bIa2PA
peY1nHO0GI27SmkA7IgtuM5WzkNAlorqzqms+5WKNRvySr8dMKbgxRDoHP9qKVeR
eqkV1Jvm5V7CPiLgpGYJ5SODu5pRtAFoU29IfynUGZTp4nJEnq9ILX63I8LTK5hq
uyuPADgKdqnPZWSF9h4s4fNEGPudgCw3awgi3kmQnoOcxeKd/ye+d/CQvWwB5jQo
mc0ZQ1amBEn4HzeG0tyto4d4ZsELOd7xLOkrvB2LkAuymTNdu+KRCyz3avRHbu8M
zBApSEsFMGMVxEvD4k8W9KJHP9a/+A==
=axOL
-----END PGP SIGNATURE-----

--6Jy4/gb9ZgnsEOX8--



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 486044A82C1
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 11:55:06 +0100 (CET)
Received: from localhost ([::1]:52796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFZlZ-0006EQ-Ci
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 05:55:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nFZju-0004Yf-Rs
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 05:53:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nFZjs-00068b-2q
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 05:53:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643885594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Pz/Sp1Ws2ZmIpn6QZtagJQy+VhyY9b4YGvPuS2A85Pg=;
 b=RJkALMK36RBm8NamurtqMconGj9x5lovWUhwOCuOUSwXla97vgVbgQcKtXtSAOXe1PZDCK
 cfegQK4Z3vp2+G5zQpITd92IDv9djiQqaiYlRVfaROJAprMYi+1bDEDjqD2VA4S+3/npiB
 D7doW1dBLoBSZ4/3IxZgVOfX79waYx8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-373-8kwYYgoBOCKmopumRFFlnw-1; Thu, 03 Feb 2022 05:53:10 -0500
X-MC-Unique: 8kwYYgoBOCKmopumRFFlnw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F7AA8749AF;
 Thu,  3 Feb 2022 10:53:09 +0000 (UTC)
Received: from localhost (unknown [10.39.192.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F189B1F42A;
 Thu,  3 Feb 2022 10:53:08 +0000 (UTC)
Date: Thu, 3 Feb 2022 10:53:07 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Nicolas Saenz Julienne <nsaenzju@redhat.com>
Subject: Re: [RFC] thread-pool: Add option to fix the pool size
Message-ID: <Yfu0E5LwZ/x0EZrl@stefanha-x1.localdomain>
References: <20220202175234.656711-1-nsaenzju@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EC6cepjPXdOFBb1n"
Content-Disposition: inline
In-Reply-To: <20220202175234.656711-1-nsaenzju@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, mtosatti@redhat.com,
 qemu-devel@nongnu.org, hreitz@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--EC6cepjPXdOFBb1n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 02, 2022 at 06:52:34PM +0100, Nicolas Saenz Julienne wrote:
> The thread pool regulates itself: when idle, it kills threads until
> empty, when in demand, it creates new threads until full. This behaviour
> doesn't play well with latency sensitive workloads where the price of
> creating a new thread is too high. For example, when paired with qemu's
> '-mlock', or using safety features like SafeStack, creating a new thread
> has been measured take multiple milliseconds.
>=20
> In order to mitigate this let's introduce a new option to set a fixed
> pool size. The threads will be created during the pool's initialization,
> remain available during its lifetime regardless of demand, and destroyed
> upon freeing it. A properly characterized workload will then be able to
> configure the pool to avoid any latency spike.
>=20
> Signed-off-by: Nicolas Saenz Julienne <nsaenzju@redhat.com>
>=20
> ---
>=20
> The fix I propose here works for my specific use-case, but I'm pretty
> sure it'll need to be a bit more versatile to accommodate other
> use-cases.
>=20
> Some questions:
>=20
> - Is unanimously setting these parameters for any pool instance too
>   limiting? It'd make sense to move the options into the AioContext the
>   pool belongs to. IIUC, for the general block use-case, this would be
>   'qemu_aio_context' as initialized in qemu_init_main_loop().

Yes, qemu_aio_context is the main loop's AioContext. It's used unless
IOThreads are configured.

It's nice to have global settings that affect all AioContexts, so I
think this patch is fine for now.

In the future IOThread-specific parameters could be added if individual
IOThread AioContexts need tuning (similar to how poll-max-ns works
today).

> - Currently I'm setting two pool properties through a single qemu
>   option. The pool's size and dynamic behaviour, or lack thereof. I
>   think it'd be better to split them into separate options. I thought of
>   different ways of expressing this (min/max-size where static happens
>   when min-size=3Dmax-size, size and static/dynamic, etc..), but you might
>   have ideas on what could be useful to other use-cases.

Yes, "min" and "max" is more flexible than fixed-size=3Dn. fixed-size=3Dn is
equivalent to min=3Dn,max=3Dn. The current default policy is min=3D0,max=3D=
64.
If you want more threads you could do min=3D0,max=3D128. If you want to
reserve 1 thread all the time use min=3D1,max=3D64.

I would go with min and max.

>=20
> Some background on my workload: I'm using IDE emulation, the guest is an
> old RTOS that doesn't support virtio, using 'aio=3Dnative' isn't possible
> either (unaligned IO accesses).

I thought QEMU's block layer creates bounce buffers for unaligned
accesses, handling both memory buffer alignment and LBA alignment
necessary for aio=3Dnative,cache=3Dnone?

--EC6cepjPXdOFBb1n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmH7tBMACgkQnKSrs4Gr
c8gGpAf/aSGyMeQ3nHCarEw3IikeaIMwS5Y7EvUCJmvGI2lyJvADD0GjDGWNbToY
V2av8PL0WlwQ0U16qvX05HhNTt83zgzvzLsl9MI3jKfrtVXIn81kEHUg8EUzVb1m
g92haFCdV+juYx5Hq1tVBPA4SX+aqqk7JcdXKrTABK+zsKSD9o99+zlAMi7T1Aq5
fb8+Z0CeOJ4W+d86RpmdLA/1GfYkiz+QzTb+L5HKJobE6Wjb8nOfSwRkNDNudZlz
MXIK5efBSop/n3LDL2XEZk1G69HukTxThIGzyENFwKzm5Ik9aIXxCAKkVqb3BStq
3ob3r3keKPp0iY2VpZs2EPZMAmkBOA==
=lEs6
-----END PGP SIGNATURE-----

--EC6cepjPXdOFBb1n--



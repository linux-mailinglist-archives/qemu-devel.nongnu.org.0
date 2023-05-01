Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7316F391F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 22:27:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pta5e-0007Hh-Cu; Mon, 01 May 2023 16:25:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pta5V-0007Fw-Es
 for qemu-devel@nongnu.org; Mon, 01 May 2023 16:25:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pta5R-0007sB-JG
 for qemu-devel@nongnu.org; Mon, 01 May 2023 16:25:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682972728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s8zlBc/Dk1SCrk5ob8WOiIQxpRGh3UVLDfG8ZTu6uoQ=;
 b=LCzErl/RzGkOfkTeDY3SAD31GeYK06KH+2BPBnfUwpIxxTUnyc3uBA8cxX2WW6e79/HWNc
 8vTvsh/3dTyHXfJzhPszp2dgaQ1XtzCF4ZtjuLjcLUMfKI56D+nxbwllGwCv72TtanNF4K
 lzdL3xMTaWrIG64bpNurN1y+dHYFkOg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-7hWlFEIjPAenBcAGVcXOVA-1; Mon, 01 May 2023 16:25:22 -0400
X-MC-Unique: 7hWlFEIjPAenBcAGVcXOVA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1950E29ABA0E;
 Mon,  1 May 2023 20:25:22 +0000 (UTC)
Received: from localhost (unknown [10.39.192.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 101B2112132E;
 Mon,  1 May 2023 20:25:20 +0000 (UTC)
Date: Mon, 1 May 2023 16:25:19 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>,
 Riku Voipio <riku.voipio@iki.fi>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yanan Wang <wangyanan55@huawei.com>, Greg Kurz <groug@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kyle Evans <kevans@freebsd.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 00/10] tracing: remove dynamic vcpu state
Message-ID: <20230501202519.GA167911@fedora>
References: <20230420150009.1675181-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rY6NiVg3HQNySdbA"
Content-Disposition: inline
In-Reply-To: <20230420150009.1675181-1-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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


--rY6NiVg3HQNySdbA
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 20, 2023 at 03:59:59PM +0100, Alex Benn=E9e wrote:
> The references dynamic vcpu tracing support was removed when the
> original TCG trace points where removed. However there was still a
> legacy of dynamic trace state to track this in cpu.h and extra hash
> variables to track TBs. While the removed vcpu tracepoints are not in
> generated code (or helpers) they still bring in a bunch of machinery
> to manage the state so I've pulled them out. We could just replace
> them with static trace points which dump vcpu->index as one of their
> arguments because they don't happen that often.
>=20
> While most of the changes are excising bits of the tracing code I've
> also cleaned up the xxhash function use and simplified the core
> function to qemu_xxhash6.
>=20
> Please review.
>=20
> Alex Benn=E9e (10):
>   *-user: remove the guest_user_syscall tracepoints
>   trace-events: remove the remaining vcpu trace events
>   trace: remove vcpu_id from the TraceEvent structure
>   scripts/qapi: document the tool that generated the file
>   qapi: make the vcpu parameters deprecated for 8.1
>   trace: remove code that depends on setting vcpu
>   trace: remove control-vcpu.h
>   tcg: remove the final vestiges of dstate
>   hw/9pfs: use qemu_xxhash4
>   xxhash: remove qemu_xxhash7
>=20
>  qapi/trace.json               |  22 +++----
>  accel/tcg/tb-hash.h           |   6 +-
>  include/exec/exec-all.h       |   3 -
>  include/hw/core/cpu.h         |   5 --
>  include/qemu/xxhash.h         |  17 ++----
>  include/user/syscall-trace.h  |   4 --
>  trace/control-internal.h      |  10 ---
>  trace/control-vcpu.h          |  63 -------------------
>  trace/control.h               |  48 ---------------
>  trace/event-internal.h        |   2 -
>  accel/tcg/cpu-exec.c          |   7 +--
>  accel/tcg/tb-maint.c          |   5 +-
>  accel/tcg/translate-all.c     |   6 --
>  bsd-user/freebsd/os-syscall.c |   2 -
>  hw/9pfs/9p.c                  |   4 +-
>  hw/core/cpu-common.c          |   4 --
>  stubs/trace-control.c         |  13 ----
>  trace/control-target.c        | 111 +++-------------------------------
>  trace/control.c               |  28 ---------
>  trace/qmp.c                   |  76 +++--------------------
>  trace/trace-hmp-cmds.c        |  17 +-----
>  scripts/qapi/gen.py           |   4 +-
>  scripts/tracetool/format/c.py |   6 --
>  scripts/tracetool/format/h.py |  16 +----
>  trace-events                  |  50 ---------------
>  25 files changed, 43 insertions(+), 486 deletions(-)
>  delete mode 100644 trace/control-vcpu.h

Nice job! I'm happy to merge it but will wait for discussion to finish.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--rY6NiVg3HQNySdbA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRQIC8ACgkQnKSrs4Gr
c8iEKggAwu05eB7O4LHXJcY+RvoO7JRL+bsbibOHLbHYKarxyx3D7rAc6gSS2I9Y
+V1Bl3Uly84vMC3EgcW67FNfuW1tq9r44Rt7qnRy8j3RpO1jevbqs22zNk3dh7ti
GXcVh9hpMqX5GgCfogVyc9lU3Q21HXABuaEownmJfcDd5uxkFXKQFUzwCV+XeFPS
BAHKkXVr7JJ3fsT6S3Wuvb9XbooNhVHjwrEyMfZqwzN6jYBboVIXkYUUNUhAfvD0
h2a75gykzUmOHtUyKWuxPgM0J12eMuAU3WKBGEokAaEVreF1eEvuToMTytgvlwao
YBHHpwUMdvlMnHiDpqjBgbl7BbBgPw==
=wvuQ
-----END PGP SIGNATURE-----

--rY6NiVg3HQNySdbA--



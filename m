Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA492F90CB
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Nov 2019 14:37:20 +0100 (CET)
Received: from localhost ([::1]:35098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUWMB-000735-Vj
	for lists+qemu-devel@lfdr.de; Tue, 12 Nov 2019 08:37:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50584)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1iUWL3-0006IU-7D
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 08:36:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1iUWL2-0008Ia-5V
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 08:36:09 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:28915
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1iUWL1-0008IC-WD
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 08:36:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573565767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Vtf9We/fDC/g/ZifrZdHexI0aHKXyQLgyJ82SjzwEk=;
 b=N2PWL908l97aVXMbudgjlbMPquRWoNZMm9+3LIKOhf4wXAz3jH53lk7DHM4Ovtmr1m4v9T
 ZJWDVv7k3v2SszlqlNN4Bzr6cquXsloyijh8lLXv/O8K2wZ8njuC/kpxkHSG4cgVt6SrBE
 W9C3AgKI+9V2uaGyH5ej0PGcOUUpq9o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-UXp2t0A1P9OzAnq68CDybw-1; Tue, 12 Nov 2019 08:36:06 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF94A1005502;
 Tue, 12 Nov 2019 13:36:04 +0000 (UTC)
Received: from gondolin (dhcp-192-218.str.redhat.com [10.33.192.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 692F8600C4;
 Tue, 12 Nov 2019 13:35:59 +0000 (UTC)
Date: Tue, 12 Nov 2019 14:35:57 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [RFC v5 051/126] vfio-ccw: introduce ERRP_AUTO_PROPAGATE
Message-ID: <20191112143557.601e20fd.cohuck@redhat.com>
In-Reply-To: <20191011160552.22907-52-vsementsov@virtuozzo.com>
References: <20191011160552.22907-1-vsementsov@virtuozzo.com>
 <20191011160552.22907-52-vsementsov@virtuozzo.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: UXp2t0A1P9OzAnq68CDybw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, armbru@redhat.com,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 11 Oct 2019 19:04:37 +0300
Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:

> If we want to add some info to errp (by error_prepend() or
> error_append_hint()), we must use the ERRP_AUTO_PROPAGATE macro.
> Otherwise, this info will not be added when errp =3D=3D &fatal_err
> (the program will exit prior to the error_append_hint() or
> error_prepend() call).  Fix such cases.
>=20
> If we want to check error after errp-function call, we need to
> introduce local_err and than propagate it to errp. Instead, use
> ERRP_AUTO_PROPAGATE macro, benefits are:
> 1. No need of explicit error_propagate call
> 2. No need of explicit local_err variable: use errp directly
> 3. ERRP_AUTO_PROPAGATE leaves errp as is if it's not NULL or
>    &error_fatel, this means that we don't break error_abort
>    (we'll abort on error_set, not on error_propagate)
>=20
> This commit (together with its neighbors) was generated by
>=20
> for f in $(git grep -l errp \*.[ch]); do \
>     spatch --sp-file scripts/coccinelle/auto-propagated-errp.cocci \
>     --macro-file scripts/cocci-macro-file.h --in-place --no-show-diff $f;=
 \
> done;
>=20
> then fix a bit of compilation problems: coccinelle for some reason
> leaves several
> f() {
>     ...
>     goto out;
>     ...
>     out:
> }
> patterns, with "out:" at function end.
>=20
> then
> ./python/commit-per-subsystem.py MAINTAINERS "$(< auto-msg)"
>=20
> (auto-msg was a file with this commit message)
>=20
> Still, for backporting it may be more comfortable to use only the first
> command and then do one huge commit.
>=20
> Reported-by: Kevin Wolf <kwolf@redhat.com>
> Reported-by: Greg Kurz <groug@kaod.org>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  hw/s390x/s390-ccw.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>



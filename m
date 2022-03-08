Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B81A4D1291
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 09:46:24 +0100 (CET)
Received: from localhost ([::1]:51612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRVU7-0000UM-Ca
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 03:46:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nRVRS-0006mC-P3
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 03:43:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nRVRP-0002Lo-N1
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 03:43:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646729014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9pMEs9bhfOd0hv6hK29dSqTLjMnxYvHSjfJOhP2PNWQ=;
 b=GccaCGzlMQixBfdWJ0oLIxtAzZP82zzzDvLa3jup2XkgCqzYBMXYTMEtZSFcpJah4u4gid
 PmLa+dEyvkfyNUaeEq7CnYP3Z0LOfHsUpaFdf+julsdkMPL8YGH0BvM3u8ICIiDl/TThxk
 Chc/PcI7TP4OCurOneKcC6kZUoRy7zk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-mvtIS3jZNkerj-SwVPiy_w-1; Tue, 08 Mar 2022 03:43:31 -0500
X-MC-Unique: mvtIS3jZNkerj-SwVPiy_w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20913100CAB5;
 Tue,  8 Mar 2022 08:43:30 +0000 (UTC)
Received: from localhost (unknown [10.39.193.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 500DE83179;
 Tue,  8 Mar 2022 08:43:28 +0000 (UTC)
Date: Tue, 8 Mar 2022 08:43:27 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Pedro Alves <pedro@palves.net>
Subject: Re: How to backtrace an separate stack?
Message-ID: <YicXL7hKnDy0SzfU@stefanha-x1.localdomain>
References: <YiCk+NNtAGQPhyK5@stefanha-x1.localdomain>
 <87mti11yy9.fsf@tromey.com>
 <950cc915-d5dd-dbcb-67a2-9186792af8fe@palves.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uTkEYmDFFC4ApIEb"
Content-Disposition: inline
In-Reply-To: <950cc915-d5dd-dbcb-67a2-9186792af8fe@palves.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: gdb@sourceware.org, Tom Tromey <tom@tromey.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--uTkEYmDFFC4ApIEb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 07, 2022 at 05:18:12PM +0000, Pedro Alves wrote:
> On 2022-03-07 16:58, Tom Tromey wrote:
> >>>>>> "Stefan" =3D=3D Stefan Hajnoczi <stefanha@redhat.com> writes:
> >=20
> > Stefan> I hoped that "select-frame address ADDRESS" could be used inste=
ad so
> > Stefan> this would work on coredumps too. Unfortunately "select-frame" =
only
> > Stefan> searches stack frames that GDB is already aware of, so it canno=
t be used
> > Stefan> to backtrace coroutine stacks.
> >=20
> > I wonder if "select-frame view" is closer to what you want.
> >=20
> > I can't attest to how well it works or doesn't work.  I've never tried
> > it.
>=20
> A backtrace after "select-frame view" will still start at the
> current (machine register's) frame.  Maybe it's sufficient to emulate it =
with
> a sequence of "up" + "frame", though.  Keep in mind that you'll lose the =
view
> with "info threads" or any command that flushes the frame cache internall=
y,
> as I mentioned in that ancient discussion.

I tried the following with gdb (11.2-1.fc35):

  select-frame view STACK_ADDR PC
  frame <-- this displays the top coroutine stack frame
  up
  frame <-- this displays the secondmost main stack frame

Unfortunately "up" returns to the main stack instead of unwinding the
coroutine stack.

"i r" and "i lo" still show values from the main stack frame after
"select-frame view". This makes sense since "select-frame view" only
sets the stack and PC addresses, not the register contents.

Alas, "select-frame view" isn't quite enough from what I can tell.

Stefan

--uTkEYmDFFC4ApIEb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmInFy4ACgkQnKSrs4Gr
c8hyxAf9F93RMB1uyXqvrE84in0Tiv6n+5PBbg55/VEg3JLQt2gEzNcAD/3mZIsr
rPr6tz8AH2ufHoDVdC+D2kaTue4XM51Jd8oxUt/8GO6ZIvrIXk6TlH7UgeJmVfXq
TLpV0qvjL5tW3jGrtXh1pmXJlfwxAVUXQTYnvdBtKlf3kxibYM+R0y0dXkFFVXzx
E3elSCADaatju9orpPbwlULmewZ4ixTkqhzICyhgY4w0mFLK2MBMK9JvAXVctPOr
v5ba8nx1FxBsSpv41F+pPwdOT3JKpj/wZBVakk0LGyzLuEGRz744AfZUxt2PUA6b
Sxy8rL8cZ+cMejK3/7VOaplYU/zN2Q==
=SjF7
-----END PGP SIGNATURE-----

--uTkEYmDFFC4ApIEb--



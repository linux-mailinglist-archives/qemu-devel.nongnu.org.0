Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 703314BA4CA
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 16:46:25 +0100 (CET)
Received: from localhost ([::1]:60012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKizA-0001ys-7x
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 10:46:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nKiSL-00066s-8a
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 10:12:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nKiSE-0007N0-EM
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 10:12:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645110740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bNUPJiguL+UpRyz6q+RNlRJSbyXf5Z1+ZaAfvsEGbX8=;
 b=Jx+K/n1Rg4HtmapO6KlZCWGg/GKXYD7MtCapF/QuRC+rzXl5G7c9lodDfyIoS2+AYk8oep
 Z52tZ+S19RBpHxixhFmivQTkY1MUgBkO9bg7qT+PzSpfGpR+qA70/QtQ1kgMLtWPnFJ2wu
 IUOnJHvi8Xl7/39UPDe2nuFhQfi4Dk4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-97wrb-jwNAqCrJBJowt78w-1; Thu, 17 Feb 2022 10:12:17 -0500
X-MC-Unique: 97wrb-jwNAqCrJBJowt78w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A675814243;
 Thu, 17 Feb 2022 15:12:16 +0000 (UTC)
Received: from localhost (unknown [10.39.194.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B447B7DE26;
 Thu, 17 Feb 2022 15:11:59 +0000 (UTC)
Date: Thu, 17 Feb 2022 15:11:59 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Serge Guelton <sguelton@redhat.com>
Subject: Re: Portable inline asm to get address of TLS variable
Message-ID: <Yg5lv/PeUyZx4BPk@stefanha-x1.localdomain>
References: <Yg04Y05ccrbFVmG/@stefanha-x1.localdomain>
 <87leyaznm6.fsf@oldenburg.str.redhat.com>
 <CAJSP0QXmF=AKtaZO7GjxFtd7o5iQ9JC2xYGYDo-zC0Ea1POS5w@mail.gmail.com>
 <877d9uzgsd.fsf@oldenburg.str.redhat.com>
 <Yg4VV+VFe3Bc1BQ6@stefanha-x1.localdomain>
 <1a17e6e5-fd03-a01b-9692-4dd9d7bffcb0@redhat.com>
 <20220217150216.GD11782@sguelton.remote.csb>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+nTVYPxq42Xyvu1m"
Content-Disposition: inline
In-Reply-To: <20220217150216.GD11782@sguelton.remote.csb>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Florian Weimer <fweimer@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--+nTVYPxq42Xyvu1m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 17, 2022 at 04:02:16PM +0100, Serge Guelton wrote:
> On Thu, Feb 17, 2022 at 12:40:40PM +0100, Paolo Bonzini wrote:
> > On 2/17/22 10:28, Stefan Hajnoczi wrote:
> > >>But going against ABI and toolchain in this way is really no long-term
> > >>solution.  You need to switch to stackless co-routines, or we need to
> > >>provide proper ABI-level support for this.  Today it's the thread
> > >>pointer, tomorrow it's the shadow stack pointer, and the day after th=
at,
> > >>it's the SafeStack pointer.  And further down the road, it's some thr=
ead
> > >>state for garbage collection support.  Or something like that.
> > >
> > >Yes, understood :(. This does feel like solving an undefined behavior
> > >problem by adding more undefined behavior on top!
> >=20
> > Yes, this is the kind of thing that I generally despise when I see
> > other programs do it...  it's easy to dig ourselves in the same
> > hole.
> >=20
> > >I took a quick look at C++20 coroutines since they are available in
> > >compilers but the primitives look hard to use even from C++, let alone
> > >from C.
> >=20
> > They're C++ only in GCC, too.  I really think that QEMU should be
> > compilable in C++, but I'm not sure how easy a sell it is.
>=20
> It's perfectly fine to have one compilation unit written in C++ with a few
> symbol in `extern "C"`. No need to touch the other part of the project.
>=20

I don't think that's possible in this case because the coroutine
functions are spread throughout the codebase. All coroutine functions
need to be in C++ source units so the compiler can transform them and
emit code callable as a coroutine.

Stefan

--+nTVYPxq42Xyvu1m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIOZb4ACgkQnKSrs4Gr
c8hiEQgAtgdQzGw7/5Ei+J8KWg7HWjR6huVCfEWyU3VOMY5yD/WnNue3OcxrhAXX
TUI6hNcwnPRV5zScjm7ScC+Jwdx4W0l5AP2RYH2pw4csxm5K0PcbHLOap53QwA0o
la0vy4xD9il8hz6qXclOain0G3ZcfGEzfHz4iPoOPzygJFhngWQV0NX+fD+gWmvi
fNihz519R7ALyIJAGxWDc1rgONS5I8BM5LYf6WgsKtZ1tNGnQR6DvSZyuTeLOh+z
CY7jodCBbbaWqTOTbk6L4Kisn4TEvjcBdZr573hO6OzQcUvAnIA3zHrv/tdmIdF6
SME4Gp6oGkXtlgmy411Q+FANcwl/5A==
=pC/t
-----END PGP SIGNATURE-----

--+nTVYPxq42Xyvu1m--



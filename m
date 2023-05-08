Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BA96FB373
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 17:08:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw2TA-0001A7-4O; Mon, 08 May 2023 11:08:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pw2T2-00018y-Ml
 for qemu-devel@nongnu.org; Mon, 08 May 2023 11:08:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pw2Sz-0007e4-I6
 for qemu-devel@nongnu.org; Mon, 08 May 2023 11:07:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683558475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CJF7XW/Brw1JRbf5bn/sjmHtPoJ7Kk+TXbPTK+fPc7U=;
 b=N7cUkmNgUDYfbL3t2L+Qcojh0AUsHVb9hT9mQioWjmIUgk4KHp3C4ga1wtKkC/tdh0qWaa
 e4FeSrA1N54cmme8/KSZ+zhnwKnvPXrAi0Cve5B+3o21ylr5b8CAwZ2+KRf78UCNscwz4o
 PjXvql478p/NIofNjO90TKTnmBd+uro=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-374-0K2vzMC-NtC3mOsfBSY_Dg-1; Mon, 08 May 2023 11:07:52 -0400
X-MC-Unique: 0K2vzMC-NtC3mOsfBSY_Dg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7FC1100F655;
 Mon,  8 May 2023 15:07:51 +0000 (UTC)
Received: from localhost (unknown [10.39.195.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E32640C2070;
 Mon,  8 May 2023 15:07:42 +0000 (UTC)
Date: Mon, 8 May 2023 11:07:40 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: Mads Ynddal <mads@ynddal.dk>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>, Mads Ynddal <m.ynddal@samsung.com>
Subject: Re: [PATCH v2 00/12] simpletrace: refactor and general improvements
Message-ID: <20230508150740.GC581920@fedora>
References: <20230502092339.27341-1-mads@ynddal.dk>
 <20230504174816.GA581920@fedora>
 <CAFn=p-ZhsUgMrK+w+ibP68q-v093SDEfhqxHsfTtFfS3qxD9ow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EhQJXMjH/AF4eusJ"
Content-Disposition: inline
In-Reply-To: <CAFn=p-ZhsUgMrK+w+ibP68q-v093SDEfhqxHsfTtFfS3qxD9ow@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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


--EhQJXMjH/AF4eusJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 04, 2023 at 01:53:38PM -0400, John Snow wrote:
> On Thu, May 4, 2023, 1:48 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>=20
> > On Tue, May 02, 2023 at 11:23:27AM +0200, Mads Ynddal wrote:
> > > From: Mads Ynddal <m.ynddal@samsung.com>
> > >
> > > I wanted to use simpletrace.py for an internal project, so I tried to
> > update
> > > and polish the code. Some of the commits resolve specific issues, whi=
le
> > some
> > > are more subjective.
> >
> > An internal project based on qemu.git or a completely separate codebase?
> >
> > Sometimes I've wondered whether tracetool should be extracted from
> > qemu.git and moved into its own QEMU-independent place. That way other
> > C/C++ applications and libraries could use it easily.
> >
> > Now that Alex Bennee removed the vcpu trace events that were specific to
> > QEMU, the tracing code is less tightly coupled to QEMU. There are
> > probably still a number of places that need to be cleaned up in order
> > for the tracing code to be independent of QEMU though.
> >
> > If there is interest in doing this, I support the effort, although I'm
> > not sure how much time I have to actually do the work myself.
> >
>=20
> I meant internal, but if there's interest in fully extracting it, I have a
> playbook for that now based on my efforts to do the same for qemu.qmp and=
 I
> can offer good stewardship for that process.

I was curious how Mads is using simpletrace for an internal (to
Samsung?) project.

Maybe only simpletrace.py is needed because Mads' own code emits trace
logs in the simpletrace binary format, but in the general case we could
extract most of QEMU's tracing infrastructure (including tracetool).

Stefan

--EhQJXMjH/AF4eusJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRZEDwACgkQnKSrs4Gr
c8i+Ygf7B9sgOQDI1dnexn6plgndRP1RvxlBDbYwVN3WgEVr0kuEyIdPOVdpPq+j
tmANFVjE0WMQew8o6y1Pd0d0VnF1+TkJ2HbTQTKAv8YtSVv7Uc2+kIRr/FEciTEo
KefLnz4br9lpU8ftQPM0cXc4EMNn8vpaPTefW8m7huv1a3z/wok77VKtKVuW4dnU
2TFlWKcpC7+ec5P9jPT8qdSJTKWZQtNH3uGfx8j7YaZwp4Hxx0KvcEgZyvc/dHqw
Ux6OykUev85Pk8KLtX1WIZhU3y7fpS+PvJ6ncclBwS+E0mQuRJrmkGdBp3pAwy33
hTo/BsfFegSru+oGeWiZhs4fBVFduQ==
=DiSq
-----END PGP SIGNATURE-----

--EhQJXMjH/AF4eusJ--



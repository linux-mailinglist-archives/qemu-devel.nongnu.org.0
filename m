Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B8143B322
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 15:24:38 +0200 (CEST)
Received: from localhost ([::1]:36642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfMRQ-00056P-SJ
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 09:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mfMPv-0004Gl-UG
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 09:23:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mfMPs-0004ke-PK
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 09:23:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635254576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LqJnhxCI0nLhXnzMdktkaPsan3lfV/eGj5V7gvoxlCw=;
 b=iSOCftpPCCXuyHd/gsCMcwT4u5l8WXUq59BnPyw/BcEnFDgp42wp4+73Fpnrl6M8+ryt3K
 TI1of0t6xvY4A44TayZXYFwxDsEFd7Aqa6KKeZQn/u3Gqrygm7UxJVN1TiuabaYKDwsqx3
 VhgkcKaPl7QayZDeLOkf1colq3AHN3g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-_J9hRjRrMfGVLF9KmL0EBg-1; Tue, 26 Oct 2021 09:22:54 -0400
X-MC-Unique: _J9hRjRrMfGVLF9KmL0EBg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7692A100B7A1;
 Tue, 26 Oct 2021 13:22:39 +0000 (UTC)
Received: from localhost (unknown [10.39.195.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8DCF760241;
 Tue, 26 Oct 2021 13:22:11 +0000 (UTC)
Date: Tue, 26 Oct 2021 14:22:10 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Warner Losh <imp@bsdimp.com>
Subject: Re: [RFC 0/2] tls: add macros for coroutine-safe TLS variables
Message-ID: <YXgBArG7wRi+hpMx@stefanha-x1.localdomain>
References: <20211025140716.166971-1-stefanha@redhat.com>
 <2ca9c094-61e6-54b8-89a8-6dad22514c96@linaro.org>
 <CANCZdfr5TAUYeZaRrm0TM-iEaV+BNwWw_JTUHbcr5QwPWhO0iQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANCZdfr5TAUYeZaRrm0TM-iEaV+BNwWw_JTUHbcr5QwPWhO0iQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="eex7utyf1FFv/kMX"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fweimer@redhat.com, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Fam Zheng <fam@euphon.net>,
 sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--eex7utyf1FFv/kMX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 25, 2021 at 05:27:29PM -0600, Warner Losh wrote:
> On Mon, Oct 25, 2021 at 10:18 AM Richard Henderson <
> richard.henderson@linaro.org> wrote:
>=20
> > On 10/25/21 7:07 AM, Stefan Hajnoczi wrote:
> > > This is a preview of how we can solve the coroutines TLS problem.
> > Coroutines
> > > re-entered from another thread sometimes see stale TLS values. This
> > happens
> > > because compilers may cache values across yield points, so a value fr=
om
> > the
> > > previous thread will be used when the coroutine is re-entered in anot=
her
> > > thread.
> >
> > I'm not thrilled by this, but I guess it does work.
> >
> > It could be worthwhile to add some inline asm instead for specific host=
s
> > -- one
> > instruction instead of an out-of-line call.
> >
> >
> > > Serge Guelton developed this technique, see the first patch for detai=
ls.
> > I'm
> > > submitting it for discussion before I go ahead with a full conversion=
 of
> > the
> > > source tree.
> > >
> > > Todo:
> > > - Convert all uses of __thread
> > > - Extend checkpatch.pl to reject code that uses __thread
> >
> > Absolutely not.  *Perhaps* one or two tls variables which are accessibl=
e
> > by coroutines,
> > but there are plenty that have absolutely no relation.  Especially
> > everything related to
> > user-only execution.
> >
>=20
> I had the same worry. I'd also worry that the hoops that are jumped throu=
gh
> for
> coroutines would somehow conflict with the low-level user-only execution
> environment. I mean, it should be fine, but I know I'd be cranky if I tra=
ced
> obscure regressions to being forced to use this construct...

I have the opposite worry:

If "safe" TLS variables are opt-in then we'll likely have obscure bugs
when code changes to access a TLS variable that was previously never
accessed from a coroutine. There is no compiler error and no way to
detect this. When it happens debugging it is painful.

That's why I think all __thread variables should be converted.

Stefan

--eex7utyf1FFv/kMX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmF4AQIACgkQnKSrs4Gr
c8jLYQf/Zwvu1/O5Y9cJg2XZpjd/7i/tIOe7JbLLlFz8crmPEJwFCkfjwDSL8Wbe
f/XjXKdr3beu5urtakB/Vv/94SS145ZkX4s6WD3I/mYJHh6KwAPgvXOIgU8dFjgS
SJsZrZ3qEHVDAPbALXHDFe10hPB3gazUVCcREf/Hd+0oUXguqgpqbnHVgDsTrxQz
WDUpDFZVNQWO9khr19kIjmtHAI+9iw5f/iNvcfaAauFjPfFhQz8a0aMOOS8zNsgp
7f1vJ1PWFM99Gb/NAUNKKG7ZmXHMGEJYOcjqQFfgZPGZGFigDzhDxRaqfDLSwYj2
TGg4D+JXljWjnFuaphnL07GlddXi3g==
=Q1qg
-----END PGP SIGNATURE-----

--eex7utyf1FFv/kMX--



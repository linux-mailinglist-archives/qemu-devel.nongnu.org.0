Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 490C02D5FCD
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 16:34:39 +0100 (CET)
Received: from localhost ([::1]:47904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knNxm-0007Le-9t
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 10:34:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1knNvk-0006T1-HC
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 10:32:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1knNvi-0004SM-7t
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 10:32:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607614348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BFalo29qSLy8DQe8EkVZs6ZGryjzoPVQuyeNw4bDas0=;
 b=WCgPs7R8FkwaZqaltRlyILmAqGdrsQgbPD2gwtqZLdCaOV08WF4mARFL2QtanKI57K5JnD
 q2uzpWZW4ocjwk5pRurRPlxNGzdzbGryQzLpqikyaZhbin/7GJku8ffsw5PdMtaFVlFd2K
 OvhKNE+OsQW9zHHgX1RXxejymmknRQA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-NXjEod8gPB6eVM42wJSBQQ-1; Thu, 10 Dec 2020 10:32:23 -0500
X-MC-Unique: NXjEod8gPB6eVM42wJSBQQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 894919CDC2;
 Thu, 10 Dec 2020 15:32:19 +0000 (UTC)
Received: from localhost (ovpn-113-62.ams2.redhat.com [10.36.113.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 714EB5D6D3;
 Thu, 10 Dec 2020 15:31:40 +0000 (UTC)
Date: Thu, 10 Dec 2020 15:31:39 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v12 00/19] Initial support for multi-process Qemu
Message-ID: <20201210153139.GA490467@stefanha-x1.localdomain>
References: <cover.1606853298.git.jag.raman@oracle.com>
 <20201203091404.GA687169@stefanha-x1.localdomain>
 <CAFEAcA_YTeBy3T5umkRKnUx90yqLD1HRHzcW9FsA1iDJGezcEQ@mail.gmail.com>
 <20201210111355.GD416119@stefanha-x1.localdomain>
 <CAFEAcA8yPV57wzFYFuWFX4hBnsfiBS5hQsoix5=CFvFtsPoQUw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8yPV57wzFYFuWFX4hBnsfiBS5hQsoix5=CFvFtsPoQUw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Fam Zheng <fam@euphon.net>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>, john.g.johnson@oracle.com,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 kanth.ghatraju@oracle.com, Felipe Franciosi <felipe@nutanix.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 konrad.wilk@oracle.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, thanos.makatos@nutanix.com,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 10, 2020 at 11:24:46AM +0000, Peter Maydell wrote:
> On Thu, 10 Dec 2020 at 11:14, Stefan Hajnoczi <stefanha@redhat.com> wrote=
:
> > On Thu, Dec 03, 2020 at 08:40:11PM +0000, Peter Maydell wrote:
> > > I would prefer to see this going through the tree of an
> > > established QEMU developer who's already sending pullrequests,
> > > at least initially.
> >
> > Once the discussion has completed I can send the patches in a pull
> > request.
> >
> > I don't want to be the bottleneck for all multi-process QEMU patches in
> > the future though. That's why I think the authors should be able to sen=
d
> > pull requests on their own after the initial code is merged. Much of
> > this work is isolated an only affects multi-process QEMU and the featur=
e
> > is marked experimental. There is little risk of introducing instability
> > for non-multi-process QEMU users/developers. Hence why this is a new
> > subsystem and has MAINTAINERS files entries.
>=20
> My reasoning is basically that new pull-request senders are more
> work for me, because I have to make sure they have a GPG key set
> up, and then examine pull requests pretty carefully to check they're
> well-formed, all the sign-offs are correct, the changes aren't
> touching areas of the codebase that they shouldn't, and so on.
> That's particularly painful if the first pull request that comes
> through is a massive one rather than "here's a small number of
> patches with some bug fixes".

Thanks for explaining. I will merge this series when review has
finished and send you a pull request.

Stefan

--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/SP1sACgkQnKSrs4Gr
c8hw4gf6AsjUvjEjsUfQZf3VIzSAjXta3hpHyb7xJGsHaO/jYU5pA5MUnSfCTsIa
KxDmQSrKdWQlf9xN6/dtlTVFPyAAECh4pSOGx7yC7nXAwtoGhNmIazrrpaVC8Dmi
XeX9DKlDYMZBbaprvkX0Nku2i1nLdV0DsGMD20B/mZ3u0zVkam52coF6kI8EaZBV
S4Wlf/97YOGgDgZh1Bk1aYsMUvWpuweFcJzM3+PQxHzbq1TeqjcChDlwZaDVhVCK
GTx3PbHFd/94bABsrUZfNm/fzgECJZlf1XttEq/bSxPU4JlEhOb1siUVlylvVrmG
0dNa8jeTTJcA5w334ki0tGjijK/wzA==
=6KF2
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--



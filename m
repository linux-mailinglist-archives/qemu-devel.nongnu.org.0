Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B80E3518FB5
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 23:06:51 +0200 (CEST)
Received: from localhost ([::1]:57350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlzjO-0004W4-O8
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 17:06:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nlyh3-0001wp-8P
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:00:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nlyh0-0007Xd-BP
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:00:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651608017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PVx2aChhcRbL1ccXVFVtXZotm8XXEarmYZBC2OsHl84=;
 b=KOjuDkYlddbcCZddW1muAkD+9JFEF9h6tUd1CEq7S/Zzc5LkNsMM4bRS5k02ns7pPcXpLX
 gEwB0Ikxpd8zkY7g7FtfZXabq14PPfYZ+j5PgIiXxLBADoOzi1TsmGn+2GlkPfIK+Xyf7J
 8wLP5B9FY/zHWW7IqcCrme0P5XA5qpA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-522-BXJXEDEjN4uCBvtqJoW4Nw-1; Tue, 03 May 2022 11:15:30 -0400
X-MC-Unique: BXJXEDEjN4uCBvtqJoW4Nw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 025A83C85DFE;
 Tue,  3 May 2022 12:17:26 +0000 (UTC)
Received: from localhost (unknown [10.39.194.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 823702166B4E;
 Tue,  3 May 2022 12:17:23 +0000 (UTC)
Date: Tue, 3 May 2022 11:50:58 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH v2 3/8] block: introduce a lock to protect graph
 operations
Message-ID: <YnEJEsZO2JXXRENW@stefanha-x1.localdomain>
References: <20220426085114.199647-1-eesposit@redhat.com>
 <20220426085114.199647-4-eesposit@redhat.com>
 <Ymqaa1dDUZau9rdS@stefanha-x1.localdomain>
 <1650055a-6b58-2a1a-c19c-3c663e131602@redhat.com>
 <YmzNxS8A3ETA9duq@stefanha-x1.localdomain>
 <8f317a24-b166-0fc9-5ec7-81c2c3d18509@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5rc4kTsHzDFcp1uA"
Content-Disposition: inline
In-Reply-To: <8f317a24-b166-0fc9-5ec7-81c2c3d18509@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--5rc4kTsHzDFcp1uA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 02, 2022 at 09:54:14AM +0200, Emanuele Giuseppe Esposito wrote:
>=20
>=20
> Am 30/04/2022 um 07:48 schrieb Stefan Hajnoczi:
> > On Fri, Apr 29, 2022 at 10:37:54AM +0200, Emanuele Giuseppe Esposito wr=
ote:
> >> Am 28/04/2022 um 15:45 schrieb Stefan Hajnoczi:
> >>> On Tue, Apr 26, 2022 at 04:51:09AM -0400, Emanuele Giuseppe Esposito =
wrote:
> >>>> +static int has_writer;
> >>>
> >>> bool?
> >>
> >> Yes and no. With the latest findings and current implementation we cou=
ld
> >> have something like:
> >>
> >> wrlock()
> >> 	has_writer =3D 1
> >> 	AIO_WAIT_WHILE(reader_count >=3D1) --> job_exit()
> >> 						wrlock()
> >>
> >> But we are planning to get rid of AIO_WAIT_WHILE and allow wrlock to
> >> only run in coroutines. This requires a lot of changes, and switch a l=
ot
> >> of callbacks in coroutines, but then we would avoid having such proble=
ms
> >> and nested event loops.
> >=20
> > I don't understand how this answer is related to the question about
> > whether the type of has_writer should be bool?
>=20
> Yes sorry I did not conclude the explanation, but taking into account
> the above case we would have an assertion failure `assert(!has_writer)`
> in bdrv_graph_wrlock(), and just removing that would make the lock
> inconsistent because the first unlock() would reset the flag to
> zero/false and forget about the previous wrlock().
> Example:
>=20
> wrlock()
> 	has_writer =3D 1
> 	AIO_WAIT_WHILE(reader_count >=3D1) --> job_exit()
> 						wrlock()
> 							has_writer =3D 1
> 						/* performs a write */
> 						wrunlock()
> 							has_writer =3D 0
> 					<---
> 	/* performs a write but has_writer =3D 0! */

How is this related to the question of whether has_writer should be bool
instead of int?

Are you saying has_writer needs to be a recursive lock and is therefore
a counter? If yes, please revisit the cover letter, which says the lock
must not be recursive. I'm confused.

Stefan

--5rc4kTsHzDFcp1uA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJxCRIACgkQnKSrs4Gr
c8jdYggAxoRcsXHP/QLO+b5sAGk4IxA241ISqf/NsppBXSOFsOM9X3mfwvEUyjnH
2Z6a0dztU2jMxktCcnAOYhpb+KAuhO+fAF5fAjQc3ZVt0bBcHkMCCVozZQMJHN2e
CvpbmPoOJtNvP95EAuntYwDyfbVGQBFHupV3NNUYeISyL8RdZWSAtFAA9lrTQ246
0V4ztYo41tnFxdR4DrIQ4NaNc+UzYZslvE5XgCfYuliJEC+rnfwNYacvK0yEeMvH
oPkutzYR0ZolfFtf1c2mg9tBbCb+fxfQQ7YTFmUdSF9TqY+Fm3BCOR0BPryrVizy
7N7IYue4wU3xNMBqbeJ8PgDVfKuYLw==
=E/aV
-----END PGP SIGNATURE-----

--5rc4kTsHzDFcp1uA--



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E37D4DB64F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 17:38:12 +0100 (CET)
Received: from localhost ([::1]:53708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUWf5-0003BD-FD
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 12:38:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nUWdx-0001qY-Ap
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 12:37:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nUWdu-0004a4-Ti
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 12:37:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647448617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aY/XQEIRLkkCEjZW3d/H24PZ07F+GbBC5gTzu364/EQ=;
 b=TmePjoRbNtvBcSrhb0WBy7OHBp0DOQgF/C6LIDsRXJW8+GmYNI3P3rdkXSznJoK8e3vcPz
 Ssz8J01rQH/ZxuRCuwEyzK4tRlaI/nJVqXSMQQ5ziSgXeee0xt4FL8BwYlQh5EWqcifKgx
 1h1duUR7gd4J/CD/5AFYjRAvdVGg+cE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-N7KUOeFUMKWjUzYVEeV37w-1; Wed, 16 Mar 2022 12:36:56 -0400
X-MC-Unique: N7KUOeFUMKWjUzYVEeV37w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4D411C0D107
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 16:36:55 +0000 (UTC)
Received: from localhost (unknown [10.39.193.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3EF7240885A1;
 Wed, 16 Mar 2022 16:36:55 +0000 (UTC)
Date: Wed, 16 Mar 2022 16:36:54 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH 00/27] Misc fixes and cleanups for 7.0?
Message-ID: <YjISJqpRmLgVdwHA@stefanha-x1.localdomain>
References: <20220316095156.2613419-1-marcandre.lureau@redhat.com>
 <YjHhjqW4a+td5T7y@redhat.com>
 <CAMxuvaxkV1VpGjEEnOaOpgCakrEsKCxWSfJRdY_aQn8vYLUHRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="z0u5hWlAtj3Y4Qww"
Content-Disposition: inline
In-Reply-To: <CAMxuvaxkV1VpGjEEnOaOpgCakrEsKCxWSfJRdY_aQn8vYLUHRA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--z0u5hWlAtj3Y4Qww
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 16, 2022 at 05:13:49PM +0400, Marc-Andr=E9 Lureau wrote:
> Hi
>=20
> On Wed, Mar 16, 2022 at 5:09 PM Daniel P. Berrang=E9 <berrange@redhat.com=
> wrote:
> >
> > On Wed, Mar 16, 2022 at 01:51:56PM +0400, marcandre.lureau@redhat.com w=
rote:
> > > From: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
> > >
> > > Hi,
> > >
> > > Various clean-up and fixes patches that might be worth it for 7.0.
> > > Some of the patches have been posted and reviewed before.
> >
> > FYI, something went wrong with this posting, as it hasn't set mail
> > threading, thus every patch appears as a standalone message.
> >
>=20
> Thanks I didn't notice with gmail. I used git-publish with
> --separate-send, because I wanted cccmd to apply on each patch. I
> thought it would respect the threading though.. Stefan, what do you
> recommend instead?

You can use --in-reply-to to send each email as a reply to the same
parent. Nothing fancier than that is supported by git-publish at the
moment.

Stefan

--z0u5hWlAtj3Y4Qww
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIyEiYACgkQnKSrs4Gr
c8gzLQgAuGk9Zi3Xvidx2TT1UhAebxK65KbkwoUIj4Wt0N5LCENJX3ZG/kVmd4O/
HJ2r5AAFcBtO0mZ56KMCAJrLt0LPiy5wa/ZYrq2srnN5WmzD5cfGS9wqp3kJEk0V
6P7vHj3mXbUXt7aYlW4s3WgKJqRUfyOi+zAhwXaGLNn3kGI0hQGSrba885OT4pbm
reV+215CnmuN7Q1ZrdSEypSZe1QWa8p1438RQ1F1FhgSpBGZYs8xIRNjh8GEFbrR
Jith80Fo45jdQHmkugjDxx5W+g8lXKTpjz09opuQYp9kVqB/jWfSG3N2FikupU8i
On8XFM8F0pPVmPbNJwQHiGGwmOyW3Q==
=r7MV
-----END PGP SIGNATURE-----

--z0u5hWlAtj3Y4Qww--



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91781528A23
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 18:18:34 +0200 (CEST)
Received: from localhost ([::1]:43106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqdQW-0006sU-TX
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 12:18:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nqcfl-0001s5-73
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:30:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nqcfj-0006wE-Bx
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:30:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652715010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5rF9yWBK0Vfln3WaVAiivXda/27+1IyDsRIZakWhXOI=;
 b=CfabHaF02CjditmG775TAV998ZCuao5UOnqgJdZ8e1l5Y/uYPemQesLrmOaM8Gv/ynIh0K
 QPWK5NEsCdDb8hKHef0stmNNwzSLNDFNF53nNPRJfo5QhEq1zUi3HU8pEtD8XxlG8Z5EK/
 oG3PdeYSzKIAqqbMC3cqCWroCWuDvTU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-412--8Zh_XX5OJ6-DuBU_sg5Pw-1; Mon, 16 May 2022 11:30:09 -0400
X-MC-Unique: -8Zh_XX5OJ6-DuBU_sg5Pw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E23DA85A5BE
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 15:30:08 +0000 (UTC)
Received: from localhost (unknown [10.39.192.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 79DBC40C1421;
 Mon, 16 May 2022 15:30:08 +0000 (UTC)
Date: Mon, 16 May 2022 16:30:07 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Leonardo Bras Soares Passos <leobras@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: Re: [PULL 00/16] migration queue
Message-ID: <YoJt/6S0t3xFS6b/@stefanha-x1.localdomain>
References: <20220510083355.92738-1-dgilbert@redhat.com>
 <Yno3RvWhwSDZjI7o@work-vm> <Yno8NV5bQPUlqvcx@redhat.com>
 <YnpB4vg2ozbBzUCg@work-vm>
 <CAJ6HWG5Mgaqt9dOVH-0-Y78x96HO5c-TevYeuN5xMvSQqj7W8Q@mail.gmail.com>
 <YoIQgCndgjW1s58k@stefanha-x1.localdomain>
 <YoIb/+zknFIWLyMK@redhat.com> <YoIi01eSEK38R03/@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gGTsbjLD5uCGZSHc"
Content-Disposition: inline
In-Reply-To: <YoIi01eSEK38R03/@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--gGTsbjLD5uCGZSHc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 16, 2022 at 11:09:23AM +0100, Daniel P. Berrang=E9 wrote:
> On Mon, May 16, 2022 at 10:40:15AM +0100, Daniel P. Berrang=E9 wrote:
> > On Mon, May 16, 2022 at 09:51:12AM +0100, Stefan Hajnoczi wrote:
> > > On Wed, May 11, 2022 at 12:40:07AM -0300, Leonardo Bras Soares Passos=
 wrote:
> > > > From a previous thread:
> > > >=20
> > > > On Thu, Apr 28, 2022 at 1:20 PM Dr. David Alan Gilbert
> > > > <dgilbert@redhat.com> wrote:
> > > > >
> > > > > Leo:
> > > > >   Unfortunately this is failing a couple of CI tests; the MSG_ZER=
OCOPY
> > > > > one I guess is the simpler one; I think Stefanha managed to find =
the
> > > > > liburing fix for the __kernel_timespec case, but that looks like =
a bit
> > > > > more fun!
> > > > >
> > > > > Dave
> > > >=20
> > > > I thought Stefanha had fixed this bug, and we were just waiting for=
 a
> > > > new alpine rootfs/image with that fixed.
> > > > Is that correct?
> > >=20
> > > I didn't fix the liburing __kernel_timespec issue on alpine Linux. It=
's
> > > probably a packaging bug and I gave Dave the email address of the
> > > package maintainer. I'm not sure if the package maintainer has been
> > > contacted or released a fixed liburing package.
> >=20
> > It was prety easy to bisect the problem with liburing so I filed a
> > bug pointing to the fix needed:
> >=20
> >   https://gitlab.alpinelinux.org/alpine/aports/-/issues/13813
>=20
> Alpine win the prize for quickest distro bug fix response. The liburing
> problem is now fixed in all current Alpine release streams, just minutes
> after I filed the above bug.

Awesome, thank you for identifying the issue and filing the issue!

Stefan

--gGTsbjLD5uCGZSHc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKCbf8ACgkQnKSrs4Gr
c8giIQf/RpI2Qz7HAUEcQx0uXwKsbj68ervr2qKSzBuWCGDQv6HrR/pnC5Ei2InJ
SXJjwsiNDhb0ea4npruuyywf1YX16fKLz8eYd68hXt9BLXVCdN4Sm+q2zhU6havn
tG/be3Cc8T0aBdhz3XIpXclXyNaaENF8AaFAZiryHRSZiwhpF6Wd6vsPHX5/umr9
uRTgU1jAWbx6Y6oC5EKftKWbThxU5LWQprt83iMFjRYMLhb8bVD1iAhcS1uzdRQX
SBceLCV32wOoQi3UpP2EM4xDkphh5CUUtMDetQ5VP3Z9s3i9uZSnZWcnbwWLmbmS
UASmzgPPs8E/uO3R7yh+NfwISNlBBQ==
=X8kF
-----END PGP SIGNATURE-----

--gGTsbjLD5uCGZSHc--



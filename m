Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D27A487860
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 14:42:50 +0100 (CET)
Received: from localhost ([::1]:39352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5pW5-0001ya-69
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 08:42:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1n5pSt-0007xI-An
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 08:39:31 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:54720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1n5pSr-0003nn-Ef
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 08:39:30 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-PkbWxOoyO3SF68-DqCQ6Yg-1; Fri, 07 Jan 2022 08:39:15 -0500
X-MC-Unique: PkbWxOoyO3SF68-DqCQ6Yg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 687D9835E22;
 Fri,  7 Jan 2022 13:39:14 +0000 (UTC)
Received: from bahia (unknown [10.39.192.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 680731079F3B;
 Fri,  7 Jan 2022 13:39:12 +0000 (UTC)
Date: Fri, 7 Jan 2022 14:39:10 +0100
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH qemu] spapr: Force 32bit when resetting a core
Message-ID: <20220107143910.4443af02@bahia>
In-Reply-To: <Ydgvt0VwFUP0MD5h@yekko>
References: <20220107072423.2278113-1-aik@ozlabs.ru>
 <20220107125747.7ddfd3a0@bahia> <Ydgvt0VwFUP0MD5h@yekko>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MwlwzU26/whg+dKa7ieas5i";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/MwlwzU26/whg+dKa7ieas5i
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 7 Jan 2022 23:19:03 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Fri, Jan 07, 2022 at 12:57:47PM +0100, Greg Kurz wrote:
> > On Fri, 7 Jan 2022 18:24:23 +1100
> > Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
> >=20
> > > "PowerPC Processor binding to IEEE 1275" says in
> > > "8.2.1. Initial Register Values" that the initial state is defined as
> > > 32bit so do it for both SLOF and VOF.
> > >=20
> > > This should not cause behavioral change as SLOF switches to 64bit very
> > > early anyway.=20
> >=20
> > Only one CPU goes through SLOF. What about the other ones, including
> > hot plugged CPUs ?
>=20
> Those will be started by the start-cpu RTAS call which has its own
> semantics.
>=20

Ah indeed, there's code in linux/arch/powerpc/kernel/head_64.S to switch
secondaries to 64bit... but then, as noted by Cedric, ppc_cpu_reset(),
which is called earlier sets MSR_SF but the changelog of commit 8b9f2118ca40
doesn't provide much details on the motivation. Any idea ?

--Sig_/MwlwzU26/whg+dKa7ieas5i
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAmHYQn4ACgkQcdTV5YIv
c9Y+WA/+O3DoDfvCDvQ/NsvotGsm1GGk0AhJBoke91In3BhlJsNTlO5oqGCk3LGy
WUSFZPXppwWaE1KJi6UtQaWkilnz7XiKzroxaNqNht+zt1QrpIbDs/Gql78YKHNJ
pydPZkA63T5GOF/u/THXx21sPw/gmCgI3L9xwLmGPhjic/8/RhTAbd/WuUyZ3sOQ
ckANgdCsfYDMG3RQCgt7m8bYG2eaz9oxM1S/TU+gOJZXU03sWDCuPO8bZE9WsI1+
/h1Y/CEq3SZIBo/bh8Z5RMEg5CzV1LhchqO/GRCAhSDYttWwAHBRXFpWNmvuy3zW
r+a7EgigRzUrsL8OLuOVUBAQc3lFET3dKuooN+9hfg19ErM040erlM7RCMYQBkgn
Dhp4Go7MIvrdMU0Qkyh6YsQf3XT6DoykSGmQglEuqfjTLsDfXvbqqktv2lUa0yq2
dP9WMvq+ZhMZ4t1b6ow64WNfY3R8IInBMeAVGb8RTz0wy8YxRphJOs8v5xac8RwS
ZfWFzHWwhq3RoDVtJkejBcpAtyt3xPvKpVb1gXIkC61E6aY48JCkY0n1VjHsozbP
+q3DaWUzrWLgHak6fkwIbPU/aVgv8N8zVujy1W0LSrYQWXOtUoQp/O9abWRq70ym
KpqycQM2VEeEJ/P24JqN/quxA2Vt9vC9nMqTcMLBMSGNohge+50=
=1NX9
-----END PGP SIGNATURE-----

--Sig_/MwlwzU26/whg+dKa7ieas5i--



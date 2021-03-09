Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 853C53331D9
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 00:08:14 +0100 (CET)
Received: from localhost ([::1]:45908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJlSX-000113-13
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 18:08:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1lJlR7-0000SC-2J; Tue, 09 Mar 2021 18:06:45 -0500
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:58195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1lJlR5-0005th-1P; Tue, 09 Mar 2021 18:06:44 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.163])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 2BD44950B73C;
 Wed, 10 Mar 2021 00:06:38 +0100 (CET)
Received: from kaod.org (37.59.142.96) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 10 Mar
 2021 00:06:37 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001b9624d3a-6216-41da-9f16-46ca54c5b320,
 E3A1B1521FC7554C2CCDA0AC48C2D83995993578) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Wed, 10 Mar 2021 00:06:36 +0100
From: Greg Kurz <groug@kaod.org>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH] docs/system: Document the removal of "compat" property
 for POWER CPUs
Message-ID: <20210310000636.15f20e52@bahia.lan>
In-Reply-To: <e7281f1f-27b2-a464-d7bf-bbd2fb116168@vivier.eu>
References: <161399328834.51902.14269239378658110394.stgit@bahia.lan>
 <e7281f1f-27b2-a464-d7bf-bbd2fb116168@vivier.eu>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 88978494-6e79-413c-a45b-1d37338d1fc9
X-Ovh-Tracer-Id: 18409870853927508448
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgudeilecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepveelhfdtudffhfeiveehhfelgeellefgteffteekudegheejfffghefhfeeuudffnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=groug@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Mar 2021 21:52:40 +0100
Laurent Vivier <laurent@vivier.eu> wrote:

> Le 22/02/2021 =C3=A0 12:28, Greg Kurz a =C3=A9crit=C2=A0:
> > This is just an oversight.
> >=20
> > Fixes: f518be3aa35b ("target/ppc: Remove "compat" property of server cl=
ass POWER CPUs")
> > Cc: groug@kaod.org
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> >  docs/system/removed-features.rst |    6 ++++++
> >  1 file changed, 6 insertions(+)
> >=20
> > diff --git a/docs/system/removed-features.rst b/docs/system/removed-fea=
tures.rst
> > index c8481cafbd5c..04ffa90d48ca 100644
> > --- a/docs/system/removed-features.rst
> > +++ b/docs/system/removed-features.rst
> > @@ -115,6 +115,12 @@ The RISC-V no MMU cpus have been removed. The two =
CPUs: ``rv32imacu-nommu`` and
> >  ``rv64imacu-nommu`` can no longer be used. Instead the MMU status can =
be specified
> >  via the CPU ``mmu`` option when using the ``rv32`` or ``rv64`` CPUs.
> > =20
> > +``compat`` property of server class POWER CPUs (removed in 6.0)
> > +'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> > +
> > +The ``max-cpu-compat`` property of the ``pseries`` machine type should=
 be used
> > +instead.
> > +
> >  System emulator machines
> >  ------------------------
> > =20
>=20
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
>=20

I was thinking this was simple enough to go through the trivial tree. :)


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E73539FB5
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 10:41:27 +0200 (CEST)
Received: from localhost ([::1]:44906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwJuw-000128-54
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 04:41:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nwJsJ-00080b-Oc
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 04:38:43 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:43998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nwJsH-0007be-SW
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 04:38:43 -0400
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-56-MsBMxAFeOXWAJUfJEC1bNw-1; Wed, 01 Jun 2022 04:38:29 -0400
X-MC-Unique: MsBMxAFeOXWAJUfJEC1bNw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C79721C00AC6;
 Wed,  1 Jun 2022 08:38:28 +0000 (UTC)
Received: from bahia (unknown [10.39.192.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 257C81121314;
 Wed,  1 Jun 2022 08:38:27 +0000 (UTC)
Date: Wed, 1 Jun 2022 10:38:25 +0200
From: Greg Kurz <groug@kaod.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>, mopsfelder@gmail.com, "Daniel P .
 =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>, Fabiano Rosas
 <farosas@linux.ibm.com>
Subject: Re: [PATCH] target/ppc/cpu-models: Update max alias to power10
Message-ID: <20220601103825.498c378f@bahia>
In-Reply-To: <475c2f40-8c58-8d51-4cc5-da5b9db814f2@redhat.com>
References: <20220531172711.94564-1-muriloo@linux.ibm.com>
 <475c2f40-8c58-8d51-4cc5-da5b9db814f2@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Wed, 1 Jun 2022 09:27:31 +0200
Thomas Huth <thuth@redhat.com> wrote:

> On 31/05/2022 19.27, Murilo Opsfelder Araujo wrote:
> > Update max alias to power10 so users can take advantage of a more
> > recent CPU model when '-cpu max' is provided.
> >=20
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1038
> > Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > Cc: Thomas Huth <thuth@redhat.com>
> > Cc: C=C3=A9dric Le Goater <clg@kaod.org>
> > Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
> > Cc: Fabiano Rosas <farosas@linux.ibm.com>
> > Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
> > ---
> >   target/ppc/cpu-models.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/target/ppc/cpu-models.c b/target/ppc/cpu-models.c
> > index 976be5e0d1..c15fcb43a1 100644
> > --- a/target/ppc/cpu-models.c
> > +++ b/target/ppc/cpu-models.c
> > @@ -879,7 +879,6 @@ PowerPCCPUAlias ppc_cpu_aliases[] =3D {
> >       { "755", "755_v2.8" },
> >       { "goldfinger", "755_v2.8" },
> >       { "7400", "7400_v2.9" },
> > -    { "max", "7400_v2.9" },
> >       { "g4",  "7400_v2.9" },
> >       { "7410", "7410_v1.4" },
> >       { "nitro", "7410_v1.4" },
> > @@ -910,6 +909,8 @@ PowerPCCPUAlias ppc_cpu_aliases[] =3D {
> >       { "power8nvl", "power8nvl_v1.0" },
> >       { "power9", "power9_v2.0" },
> >       { "power10", "power10_v2.0" },
> > +    /* Update the 'max' alias to the latest CPU model */
> > +    { "max", "power10_v2.0" },
> >   #endif
>=20
> I'm not sure whether "max" should really be fixed alias in this list here=
?=20
> What if a user runs with KVM on a POWER8 host - then "max" won't work thi=
s=20
> way, will it?
>=20
> And in the long run, it would also be good if this would work with other=
=20
> machines like the "g3beige", too (which don't support the new 64-bit POWE=
R=20
> CPUs), so you should at least mention in the commit description that this=
 is=20
> only a temporary hack for the pseries machine, I think.
>=20

I didn't even know there was a "max" alias :-)

This was introduced by commit:

commit 3fc6c082e3aad85addf25d36740030982963c0c8
Author: Fabrice Bellard <fabrice@bellard.org>
Date:   Sat Jul 2 20:59:34 2005 +0000

    preliminary patch to support more PowerPC CPUs (Jocelyn Mayer)

This was already a 7400 model at the time. Obviously we've never
maintained that and I hardly see how it is useful... As Thomas
noted, "max" has implicit semantics that depend on the host.
This isn't migration friendly and I'm pretty sure libvirt
doesn't use it (Daniel ?)

We already have the concept of default CPU for the spapr
machine types, that is usually popped up to the newer
CPU model that is going to be supported in production.
This goes with a bump of the machine type version as
well for the sake of migration. This seems a lot more
reliable than the "max" thingy IMHO.

Unless there's a very important use case I'm missing,
I'd rather kill the thing instead of trying to resurrect
it.

Cheers,

--
Greg

>   Thomas
>=20



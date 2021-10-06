Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69155423CC3
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 13:25:17 +0200 (CEST)
Received: from localhost ([::1]:48376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY52y-00033H-Fx
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 07:25:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mY4i2-0003GF-9k
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 07:03:39 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:54248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mY4hy-0000jT-RY
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 07:03:38 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-JrOsXZjmPe60Tmo9GgBcCA-1; Wed, 06 Oct 2021 07:03:28 -0400
X-MC-Unique: JrOsXZjmPe60Tmo9GgBcCA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9389684A5E1;
 Wed,  6 Oct 2021 11:03:26 +0000 (UTC)
Received: from bahia.huguette (unknown [10.39.192.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE1CD10016FF;
 Wed,  6 Oct 2021 11:03:14 +0000 (UTC)
Date: Wed, 6 Oct 2021 13:03:13 +0200
From: Greg Kurz <groug@kaod.org>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH v3 0/7] Reduce load on ppc target maintainers
Message-ID: <20211006125006.7d78ecc4@bahia.huguette>
In-Reply-To: <20dda3d9-7830-a67a-3a9f-caa69634dea4@ozlabs.ru>
References: <20210927044808.73391-1-david@gibson.dropbear.id.au>
 <YVUPrnvWT80f7IxR@yekko>
 <20dda3d9-7830-a67a-3a9f-caa69634dea4@ozlabs.ru>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>, dbarboza@redhat.com,
 peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org,
 wainersm@redhat.com, hpoussin@reactos.org, clg@kaod.org, crosa@redhat.com,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, philmd@redhat.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 6 Oct 2021 20:52:00 +1100
Alexey Kardashevskiy <aik@ozlabs.ru> wrote:

>=20
>=20
> On 30/09/2021 11:15, David Gibson wrote:
> > On Mon, Sep 27, 2021 at 02:48:01PM +1000, David Gibson wrote:
> >> Greg Kurz and myself have been co-maintainers for the ppc and ppc64
> >> targets for some time now.  However, both our day job responsibilities
> >> and interests are leading us towards other areas, so we have less time
> >> to devote to this any more.
> >>
> >> Therefore, here's a bunch of updates to MAINTAINERS, intended to
> >> reduce the load on us.  Mostly this is marking fairly obscure
> >> platforms as orphaned (if someone wants to take over maintainership,
> >> let me know ASAP).  Bigger changes may be coming, but we haven't
> >> decided exactly what that's going to look like yet.
> >=20
> > Thanks for the feedback and acks on this.  I'm now merging v3 into
> > ppc-for-6.2 to go into a pull request shortly.
> >=20
> >>
> >> Changes since v2:
> >>  * Clarified overly broad TCG CPUs entry
> >> Changes since v1:
> >>  * Reworked how OpenPIC is listed
> >>
> >> David Gibson (7):
> >>   qemu: Split machine_ppc.py acceptance tests
> >>   MAINTAINERS: Remove machine specific files from ppc TCG CPUs entry
> >>   MAINTAINERS: Remove David & Greg as reviewers for a number of boards
> >>   MAINTAINERS: Orphan obscure ppc platforms
> >>   MAINTAINERS: Remove David & Greg as reviewers/co-maintainers of
> >>     powernv
> >>   MAINTAINERS: Add information for OpenPIC
> >>   MAINTAINERS: Demote sPAPR from "Supported" to "Maintained"
> >>
> >>  MAINTAINERS                          | 51 ++++++++------------
> >>  tests/acceptance/machine_ppc.py      | 69 ---------------------------=
-
> >>  tests/acceptance/ppc_mpc8544ds.py    | 32 +++++++++++++
> >>  tests/acceptance/ppc_pseries.py      | 35 ++++++++++++++
> >>  tests/acceptance/ppc_virtex_ml507.py | 34 ++++++++++++++
> >>  5 files changed, 121 insertions(+), 100 deletions(-)
> >>  delete mode 100644 tests/acceptance/machine_ppc.py
> >>  create mode 100644 tests/acceptance/ppc_mpc8544ds.py
> >>  create mode 100644 tests/acceptance/ppc_pseries.py
> >>  create mode 100644 tests/acceptance/ppc_virtex_ml507.py
> I have a bunch of small patches for SLOF - what do I do with those now?
> Still send pull requests to you and Greg as usual? Thanks,
>=20

We've downgraded sPAPR from "Supported" to "Maintained", which means
that we're no longer paid to do it (i.e. likely less responsive than
before) but we're still in charge of SLOF in QEMU.

$ ./scripts/get_maintainer.pl -f pc-bios/slof.bin
David Gibson <david@gibson.dropbear.id.au> (maintainer:sPAPR)
Greg Kurz <groug@kaod.org> (maintainer:sPAPR)
qemu-ppc@nongnu.org (open list:sPAPR)
qemu-devel@nongnu.org (open list:All patches CC here)

As usual then :-)

>=20
>=20
>=20



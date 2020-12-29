Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD052E7357
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Dec 2020 21:13:12 +0100 (CET)
Received: from localhost ([::1]:51956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuLMl-00021w-3B
	for lists+qemu-devel@lfdr.de; Tue, 29 Dec 2020 15:13:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kuLLF-0001aX-HV
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 15:11:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kuLL7-0005yL-Ip
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 15:11:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609272687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ncZCk6+fLdaPlckvThIpBmlwUnigar8sg12Y93MdUTQ=;
 b=OQQdtFzU1KfDbCnxObHixObXtTNRwtZyzMQgI4fOKnBi+ibUz9BFT7vSjjFOoX1lpc9CU7
 gTkDp5g1uX4P3jwdojVmMPcoz5T5NSprPONeeEpG5nviDieaL8U9PRA2ipmmyULxoLkiVL
 6gW8UFh1Sf1lqvuNh5cUQbiXfw7bbOA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-SXpM9ineMvGwsXCdnFB7LA-1; Tue, 29 Dec 2020 15:11:25 -0500
X-MC-Unique: SXpM9ineMvGwsXCdnFB7LA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 749F81800D42;
 Tue, 29 Dec 2020 20:11:24 +0000 (UTC)
Received: from localhost (unknown [10.40.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8FB10E155;
 Tue, 29 Dec 2020 20:11:19 +0000 (UTC)
Date: Tue, 29 Dec 2020 21:11:17 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH] Deprecate pmem=on with non-DAX capable backend file
Message-ID: <20201229211117.1e900ec6@redhat.com>
In-Reply-To: <328c04e7-4ddb-82f6-16e4-ce8f692ff753@redhat.com>
References: <20201229172900.571309-1-imammedo@redhat.com>
 <328c04e7-4ddb-82f6-16e4-ce8f692ff753@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: libvir-list@redhat.com, haozhong.zhang@intel.com,
 yi.z.zhang@linux.intel.com, qemu-devel@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 29 Dec 2020 19:04:58 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> On 12/29/20 6:29 PM, Igor Mammedov wrote:
> > It is not safe to pretend that emulated NVDIMM supports
> > persistence while backend actually failed to enable it
> > and used non-persistent mapping as fall back.
> > Instead of falling-back, QEMU should be more strict and
> > error out with clear message that it's not supported.
> > So if user asks for persistence (pmem=3Don), they should
> > store backing file on NVDIMM.
> >=20
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> >  docs/system/deprecated.rst | 14 ++++++++++++++
> >  util/mmap-alloc.c          |  3 +++
> >  2 files changed, 17 insertions(+)
> >=20
> > diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> > index bacd76d7a5..ba4f6ed2fe 100644
> > --- a/docs/system/deprecated.rst
> > +++ b/docs/system/deprecated.rst
> > @@ -327,6 +327,20 @@ The Raspberry Pi machines come in various models (=
A, A+, B, B+). To be able
> >  to distinguish which model QEMU is implementing, the ``raspi2`` and ``=
raspi3``
> >  machines have been renamed ``raspi2b`` and ``raspi3b``.
> > =20
> > +Backend options
> > +---------------
> > +
> > +Using non-persistent backing file with pmem=3Don (since 6.0)
> > +''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> > +
> > +This option is used when ``memory-backend-file`` is consumed by emulat=
ed NVDIMM
> > +device. However enabling ``memory-backend-file.pmem`` option, when bac=
king file
> > +is not DAX capable or not on a filesystem that support direct mapping =
of persistent =20
>=20
> Maybe clearer enumerating? As:
> "is a) not DAX capable or b) not on a filesystem that support direct
> mapping of persistent"

will change it to your variant in v2

>=20
> > +memory, is not safe and may lead to data loss or corruption in case of=
 host crash.
> > +Using pmem=3Don option with such file will return error, instead of a =
warning. =20
>=20
> Not sure the difference between warn/err is important in the doc.
not many care about warnings until QEMU starts fine,
I've mentioned error here so that whomever reading this would know what to =
expect

>=20
> > +Options are to move backing file to NVDIMM storage or modify VM config=
uration
> > +to set ``pmem=3Doff`` to continue using fake NVDIMM without persistenc=
e guaranties. =20
>=20
> Maybe:
>=20
> The possibilities to continue using fake NVDIMM (without persistence
> guaranties) are:
> - move backing file to NVDIMM storage
> - modify VM configuration to set ``pmem=3Doff``

only the later is faking nvdimm, the first is properly emulated one with pe=
rsistence guaranties.
Maybe:
 Options are:
    - modify VM configuration to set ``pmem=3Doff`` to continue using fake =
NVDIMM
      (without persistence guaranties) on with backing file on non DAX stor=
age
    - move backing file to NVDIMM storage and keep ``pmem=3Don``,
      to have NVDIMM with persistence guaranties.

> > +
> >  Device options
> >  --------------
> > =20
> > diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
> > index 27dcccd8ec..d226273a98 100644
> > --- a/util/mmap-alloc.c
> > +++ b/util/mmap-alloc.c
> > @@ -20,6 +20,7 @@
> >  #include "qemu/osdep.h"
> >  #include "qemu/mmap-alloc.h"
> >  #include "qemu/host-utils.h"
> > +#include "qemu/error-report.h"
> > =20
> >  #define HUGETLBFS_MAGIC       0x958458f6
> > =20
> > @@ -166,6 +167,8 @@ void *qemu_ram_mmap(int fd,
> >                      "crash.\n", file_name);
> >              g_free(proc_link);
> >              g_free(file_name);
> > +            warn_report("Deprecated using non DAX backing file with"
> > +                        " pmem=3Don option"); =20
>=20
> Maybe "Using non DAX backing file with 'pmem=3Don' option is deprecated"?
ok

>=20
> Beside the nitpicking comments,
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>=20
> >          }
> >          /*
> >           * if map failed with MAP_SHARED_VALIDATE | MAP_SYNC,
> >  =20
>=20



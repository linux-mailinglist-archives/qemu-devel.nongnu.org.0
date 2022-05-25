Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 749EC534107
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 18:07:13 +0200 (CEST)
Received: from localhost ([::1]:34216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nttXU-0000jz-1t
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 12:07:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nttQl-0005gt-EW
 for qemu-devel@nongnu.org; Wed, 25 May 2022 12:00:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nttQi-0003qg-Lv
 for qemu-devel@nongnu.org; Wed, 25 May 2022 12:00:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653494410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/KPMdtU5Ipxm79aU+n6IOXnpTYpOOJLrvTqjZ/TBce0=;
 b=ESKbqHrj8UGRcRBKM+mB1DIrX7NqDNwKovHO5a/CbCaOVwpH6TKw4MHPCPDCar9eiKkKEU
 0ayxUGAorV00G53tFyrGIzHqP+KAnrtSWv46MJGl/fLCDHVTzi2txrENv8IzCr8Ux5PX1E
 u56dPehDQUlzOHCJjNa74xIsey6f1SI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-124-_GM9r9AePSSVNCfG6Gl63Q-1; Wed, 25 May 2022 12:00:06 -0400
X-MC-Unique: _GM9r9AePSSVNCfG6Gl63Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32E66185A7B2;
 Wed, 25 May 2022 16:00:06 +0000 (UTC)
Received: from localhost (unknown [10.39.195.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C5E1C1121315;
 Wed, 25 May 2022 16:00:05 +0000 (UTC)
Date: Wed, 25 May 2022 17:00:04 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 John Levon <john.levon@nutanix.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 Alexis Lescouet <alexis.lescouet@nutanix.com>,
 Felipe Franciosi <felipe@nutanix.com>, "mst@redhat.com" <mst@redhat.com>
Subject: Re: Accelerating non-standard disk types
Message-ID: <Yo5ShDNRTEPcBz1c@stefanha-x1.localdomain>
References: <20220516173831.GB13284@raphael-debian-dev>
 <fb522282-c750-2652-2e27-87c68819100b@redhat.com>
 <20220519183938.GB13470@raphael-debian-dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ibH49Rlr08EElryt"
Content-Disposition: inline
In-Reply-To: <20220519183938.GB13470@raphael-debian-dev>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


--ibH49Rlr08EElryt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 19, 2022 at 06:39:39PM +0000, Raphael Norwitz wrote:
> On Tue, May 17, 2022 at 03:53:52PM +0200, Paolo Bonzini wrote:
> > On 5/16/22 19:38, Raphael Norwitz wrote:
> > > [1] Keep using the SCSI translation in QEMU but back vDisks with a
> > > vhost-user-scsi or vhost-user-blk backend device.
> > > [2] Implement SATA and IDE emulation with vfio-user (likely with an S=
PDK
> > > client?).
> > > [3] We've also been looking at your libblkio library. From your
> > > description in
> > > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.gnu.org_=
archive_html_qemu-2Ddevel_2021-2D04_msg06146.html&d=3DDwICaQ&c=3Ds883GpUCOC=
hKOHiocYtGcg&r=3DIn4gmR1pGzKB8G5p6LUrWqkSMec2L5EtXZow_FZNJZk&m=3DwBSqcw0cal=
3wPP87YIKgFgmqMHjGCC3apYf4wCn1SIrX6GW_FR-J9wO68v-cyrpn&s=3DCP-6ZY-gqgQ2zLAJ=
dR8WVTrMBoqmFHilGvW_qnf2myU&e=3D   it
> > > sounds like it may definitely play a role here, and possibly provide =
the
> > > nessesary abstractions to back I/O from these emulated disks to any
> > > backends we may want?
> >=20
> > First of all: have you benchmarked it?  How much time is spent on MMIO =
vs.
> > disk I/O?
> >
>=20
> Good point - we haven=E2=80=99t benchmarked the emulation, exit and trans=
lation
> overheads - it is very possible speeding up disk I/O may not have a huge
> impact. We would definitely benchmark this before exploring any of the
> options seriously, but as you rightly note, performance is not the only
> motivation here.
>=20
> > Of the options above, the most interesting to me is to implement a
> > vhost-user-blk/vhost-user-scsi backend in QEMU, similar to the NVMe one,
> > that would translate I/O submissions to virtqueue (including polling an=
d the
> > like) and could be used with SATA.
> >
>=20
> We were certainly eyeing [1] as the most viable in the immediate future.
> That said, since a vhost-user-blk driver has been added to libblkio, [3]
> also sounds like a strong option. Do you see any long term benefit to
> translating SATA/IDE submissions to virtqueues in a world where libblkio
> is to be adopted?
>
> > For IDE specifically, I'm not sure how much it can be sped up since it =
has
> > only 1 in-flight operation.  I think using KVM coalesced I/O could prov=
ide
> > an interesting boost (assuming instant or near-instant reply from the
> > backend).  If all you're interested in however is not really performanc=
e,
> > but rather having a single "connection" to your back end, vhost-user is
> > certainly an option.
> >=20
>=20
> Interesting - I will take a look at KVM coalesced I/O.
>=20
> You=E2=80=99re totally right though, performance is not our main interest=
 for
> these disk types. I should have emphasized offload rather than
> acceleration and performance. We would prefer to QA and support as few
> data paths as possible, and a vhost-user offload mechanism would allow
> us to use the same path for all I/O. I imagine other QEMU users who
> offload to backends like SPDK and use SATA/IDE disk types may feel
> similarly?

It's nice to have a single target (e.g. vhost-user-blk in SPDK) that
handles all disk I/O. On the other hand, QEMU would still have the
IDE/SATA emulation and libblkio vhost-user-blk driver, so in the end it
may not reduce the amount of code that you need to support.

Stefan

--ibH49Rlr08EElryt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKOUoQACgkQnKSrs4Gr
c8iVEwgAsqDYMs0GGHNXtwESeVHfRFPI5J8llu0qLHD39vB1u1/nXQ6H/konQIZ/
7BA7X2texKmlModlf7spzf9f4wEthxTWq7FgzOB5L4nLHgs5F63QNgKfCAiSVeq/
MLtbrtJvgL2yprJtbaFmPCNVMTBqBv87JTeRLODS+aqvZt0XXCvUPO5N0pk/S6lb
4nmI/0N7y3122T4WxyAoY8eNJIso6YI2U/l0z7BoezQcxEji6PIaU3GlccVbSezZ
25ATLObMCFCr4nOapi7JHhZ5ZP25kdOxFRWCMhzxhytUap8njfQXVdu36Esf6pL4
kHUoMjB99P3m2eIHtIMeg4VnfkuzUQ==
=Y4MH
-----END PGP SIGNATURE-----

--ibH49Rlr08EElryt--



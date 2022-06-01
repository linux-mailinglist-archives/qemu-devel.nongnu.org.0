Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6248953A5B2
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 15:14:07 +0200 (CEST)
Received: from localhost ([::1]:60192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwOAo-0008Vb-0t
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 09:14:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nwO4I-0001U3-Qh
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 09:07:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nwO4G-00052R-HI
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 09:07:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654088837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E95rwZryU1gShB68H3svn4DEQ2WC889JCZpEFUGOzO0=;
 b=QhhqoQUJuieICpi8PkEvOq3u6pf0vxIo0zxl173+p2GACC/PZK+SNUH+Z3kGpoBSb473FC
 E6NvZHmkOJOwIYotQr6jBnizAPs+SXHNGsI4gpgBW1m7bKTd/9vH9VMZNW9VffwyruCZWY
 o/5SHBa8XN5tVW1yO8LqNB8jhXzBIOc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-265-EH78i22OMZ6KsHno55y8CQ-1; Wed, 01 Jun 2022 09:07:14 -0400
X-MC-Unique: EH78i22OMZ6KsHno55y8CQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97B7F8C194A;
 Wed,  1 Jun 2022 13:06:49 +0000 (UTC)
Received: from localhost (unknown [10.39.195.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E00F8288A;
 Wed,  1 Jun 2022 13:06:48 +0000 (UTC)
Date: Wed, 1 Jun 2022 14:06:47 +0100
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
Message-ID: <YpdkZ/cCCrym/rZf@stefanha-x1.localdomain>
References: <20220516173831.GB13284@raphael-debian-dev>
 <fb522282-c750-2652-2e27-87c68819100b@redhat.com>
 <20220519183938.GB13470@raphael-debian-dev>
 <Yo5ShDNRTEPcBz1c@stefanha-x1.localdomain>
 <20220530173722.GA8262@raphael-debian-dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YWsTFi0DfblktZOO"
Content-Disposition: inline
In-Reply-To: <20220530173722.GA8262@raphael-debian-dev>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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


--YWsTFi0DfblktZOO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 31, 2022 at 03:06:20AM +0000, Raphael Norwitz wrote:
> On Wed, May 25, 2022 at 05:00:04PM +0100, Stefan Hajnoczi wrote:
> > On Thu, May 19, 2022 at 06:39:39PM +0000, Raphael Norwitz wrote:
> > > On Tue, May 17, 2022 at 03:53:52PM +0200, Paolo Bonzini wrote:
> > > > On 5/16/22 19:38, Raphael Norwitz wrote:
> > > > > [1] Keep using the SCSI translation in QEMU but back vDisks with a
> > > > > vhost-user-scsi or vhost-user-blk backend device.
> > > > > [2] Implement SATA and IDE emulation with vfio-user (likely with =
an SPDK
> > > > > client?).
> > > > > [3] We've also been looking at your libblkio library. From your
> > > > > description in
> > > > > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.gnu.=
org_archive_html_qemu-2Ddevel_2021-2D04_msg06146.html&d=3DDwICaQ&c=3Ds883Gp=
UCOChKOHiocYtGcg&r=3DIn4gmR1pGzKB8G5p6LUrWqkSMec2L5EtXZow_FZNJZk&m=3DwBSqcw=
0cal3wPP87YIKgFgmqMHjGCC3apYf4wCn1SIrX6GW_FR-J9wO68v-cyrpn&s=3DCP-6ZY-gqgQ2=
zLAJdR8WVTrMBoqmFHilGvW_qnf2myU&e=3D   it
> > > > > sounds like it may definitely play a role here, and possibly prov=
ide the
> > > > > nessesary abstractions to back I/O from these emulated disks to a=
ny
> > > > > backends we may want?
> > > >=20
> > > > First of all: have you benchmarked it?  How much time is spent on M=
MIO vs.
> > > > disk I/O?
> > > >
> > >=20
> > > Good point - we haven=E2=80=99t benchmarked the emulation, exit and t=
ranslation
> > > overheads - it is very possible speeding up disk I/O may not have a h=
uge
> > > impact. We would definitely benchmark this before exploring any of the
> > > options seriously, but as you rightly note, performance is not the on=
ly
> > > motivation here.
> > >=20
> > > > Of the options above, the most interesting to me is to implement a
> > > > vhost-user-blk/vhost-user-scsi backend in QEMU, similar to the NVMe=
 one,
> > > > that would translate I/O submissions to virtqueue (including pollin=
g and the
> > > > like) and could be used with SATA.
> > > >
> > >=20
> > > We were certainly eyeing [1] as the most viable in the immediate futu=
re.
> > > That said, since a vhost-user-blk driver has been added to libblkio, =
[3]
> > > also sounds like a strong option. Do you see any long term benefit to
> > > translating SATA/IDE submissions to virtqueues in a world where libbl=
kio
> > > is to be adopted?
> > >
> > > > For IDE specifically, I'm not sure how much it can be sped up since=
 it has
> > > > only 1 in-flight operation.  I think using KVM coalesced I/O could =
provide
> > > > an interesting boost (assuming instant or near-instant reply from t=
he
> > > > backend).  If all you're interested in however is not really perfor=
mance,
> > > > but rather having a single "connection" to your back end, vhost-use=
r is
> > > > certainly an option.
> > > >=20
> > >=20
> > > Interesting - I will take a look at KVM coalesced I/O.
> > >=20
> > > You=E2=80=99re totally right though, performance is not our main inte=
rest for
> > > these disk types. I should have emphasized offload rather than
> > > acceleration and performance. We would prefer to QA and support as few
> > > data paths as possible, and a vhost-user offload mechanism would allow
> > > us to use the same path for all I/O. I imagine other QEMU users who
> > > offload to backends like SPDK and use SATA/IDE disk types may feel
> > > similarly?
> >=20
> > It's nice to have a single target (e.g. vhost-user-blk in SPDK) that
> > handles all disk I/O. On the other hand, QEMU would still have the
> > IDE/SATA emulation and libblkio vhost-user-blk driver, so in the end it
> > may not reduce the amount of code that you need to support.
> >=20
>=20
> Apologies for the late reply - I was on PTO.
>=20
> For us it=E2=80=99s not so much about the overall LOC we support. We have=
 our
> own iSCSI client implementation with embedded business logic which we
> use for SCSI disks. Continuing to support SATA and IDE disks without our
> implementation has been really troublesome so, even if it means more
> LOC, we would really like to unify our data path at least at the iSCSI
> layer.
>=20
> While the overall code may not be reduced so much for many others today,
> it may make a significant difference in the future. I can imagine some
> QEMU users may want to deprecate (or not implement) iSCSI target support
> in favor of NVMe over fabrics and still support these disk types. Being
> able to offload the transport layer via vhost-user-blk (either with some
> added logic on top of the existing SCSI translation layer or with
> libblkio) would make this easy.
>=20
> Does that sound reasonable?

Yes.

Stefan

--YWsTFi0DfblktZOO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKXZGcACgkQnKSrs4Gr
c8iM2gf/ZmVdexT2qKb+uFz0OQSXp//HVOuNBlLaZYpmXEH9Phrp9NKyUV5aGSQ0
6mXwBdz1gwZdwy8eDSkC1EFfPTCPk+SOQn8L8TLzh8/CENwmyRLNNSun8v3NEfAp
ePYoc7ItzDoKE2JuktZ32SBVPQBMjq1MZ6CwiW2EIIe4tu/TUqnS4gJS3bCpuYWt
+Ohbi3xiJa6Yu9ziKA2ZVDqDxk6/KMHvY0Yg+HyXcma4samsOMZMRH2WuQMA5YjR
lqCtqBhkqkybmXo3T1xVFhjD67GnDz3MvGf+6X6w2O85W7i2NU1uWStAqkjXXgUA
0xhcRF6Pp5AfrsMHDTAn2CCP7GQkoQ==
=tNb8
-----END PGP SIGNATURE-----

--YWsTFi0DfblktZOO--



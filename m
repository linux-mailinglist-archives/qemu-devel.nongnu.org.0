Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA093313B4E
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 18:46:04 +0100 (CET)
Received: from localhost ([::1]:55088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Abr-0000z1-RE
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 12:46:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1l94E4-00020V-NL
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 05:57:06 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1l94Du-0001Ei-2y
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 05:57:01 -0500
Received: from fraeml734-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4DZ2rz6gNRz67lTf;
 Mon,  8 Feb 2021 18:51:47 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml734-chm.china.huawei.com (10.206.15.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 8 Feb 2021 11:56:38 +0100
Received: from localhost (10.47.30.32) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 8 Feb 2021
 10:56:37 +0000
Date: Mon, 8 Feb 2021 10:55:51 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Chris Browy <cbrowy@avery-design.com>, <david@redhat.com>
Subject: Re: [RFC PATCH v1 01/01] PCIe DOE for PCIe and CXL 2.0
Message-ID: <20210208105551.00005c12@Huawei.com>
In-Reply-To: <593ADBD3-9A16-4875-AF5B-57E346A3460A@avery-design.com>
References: <4F370DAB-1EFE-490B-B93F-312AC5081057@avery-design.com>
 <20210205160954.00006728@Huawei.com>
 <20210205171936.nx62hs4z4vr5g2er@intel.com>
 <20210205184942.00002233@Huawei.com>
 <593ADBD3-9A16-4875-AF5B-57E346A3460A@avery-design.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.47.30.32]
X-ClientProxiedBy: lhreml719-chm.china.huawei.com (10.201.108.70) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Ben Widawsky <ben.widawsky@intel.com>, mst@redhat.com,
 qemu-devel@nongnu.org, vishal.l.verma@intel.com, jgroves@micron.com,
 armbru@redhat.com, linux-cxl@vger.kernel.org, f4bug@amsat.org,
 imammedo@redhat.com, dan.j.williams@intel.com, ira.weiny@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

...

>=20
> >  =20
> >>  =20
> >>>>=20
> >>>> Just like you we feel what's most important is to have DOE supported=
 so that
> >>>> UEFI and Linux kernel and drivers can progress.  We're also contribu=
ting to
> >>>> writing compliance tests for the CXL Compliance Software Development=
 WG.   =20
> >>>=20
> >>> Great.   =20
> >>=20
> >> Is anyone doing the kernel enabling for it? =20
> >=20
> > Planning to look at this but plenty of other things on my todo list if =
someone
> > else gets to it first.
> >=20
> > Generic DOE support should be straight forward (the infrastructure).
> > Parsing CDAT also straight forward.
> > Doing something with the results is hard unless we just provide an inte=
rface for
> > userspace to query them for a given device - or dump the table
> > (I think we do want to be able to that).=20
> >=20
> > What I'm really not sure on is how to handle NUMA domains that are crea=
ted late
> > in the kernel boot sequence.  The  ACPI flow is set up with the assumpt=
ion
> > that we can get them from SRAT very early in boot. Need to figure out h=
ow to
> > work around that. (e.g. preallocate a bunch of spare nodes for example =
though that's
> > ugly).  Note IIRC the kernel doesn't do runtime update of any of the AC=
PI
> > performance parameters yet (_SLI, _HMA) so there probably isn't any inf=
rastructure
> > that we can reuse.
> >=20
> > There is also the firmware based enumeration and description option (OS=
 not necessarily
> > aware of CXL) in which this is all up to EDK2 and the kernel gets it al=
l presented
> > as standard tables. =20
>=20
> Do we know who=E2=80=99s on this as part of the EDK2 development?  It wou=
ld be great if they could
> address the SRAT/HMAT generation from reading CDAT.  EDK2 does address CX=
L 1.1 now.

No idea who, if anyone, is looking at this currently.  Perhaps ask on the E=
DK2 list?

Jonathan

>=20
> >=20
> > As you can perhaps tell from my half done reviews, this week disappeare=
d in
> > other things so bit of catch up for me to do next week.
> >=20
> > Thanks,
> >=20
> > Joanthan
> >=20
...


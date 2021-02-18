Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A5031EF68
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 20:15:45 +0100 (CET)
Received: from localhost ([::1]:45622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCom8-00053M-Ay
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 14:15:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1lCojW-00044B-Vc
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 14:13:03 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1lCojR-000523-Ag
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 14:13:02 -0500
Received: from fraeml739-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4DhPNR00G3z67nfQ;
 Fri, 19 Feb 2021 03:07:34 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml739-chm.china.huawei.com (10.206.15.220) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 18 Feb 2021 20:12:48 +0100
Received: from localhost (10.47.67.19) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 18 Feb
 2021 19:12:47 +0000
Date: Thu, 18 Feb 2021 19:11:43 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Chris Browy <cbrowy@avery-design.com>
Subject: Re: [RFC PATCH v2 1/2] Basic PCIe DOE support
Message-ID: <20210218191143.00000cdf@Huawei.com>
In-Reply-To: <8A5C244A-DF9A-4EB5-8C24-568A606E75B0@avery-design.com>
References: <1612900760-7361-1-git-send-email-cbrowy@avery-design.com>
 <1612902949-9992-1-git-send-email-cbrowy@avery-design.com>
 <20210212162442.00007c1d@Huawei.com>
 <8A5C244A-DF9A-4EB5-8C24-568A606E75B0@avery-design.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.47.67.19]
X-ClientProxiedBy: lhreml732-chm.china.huawei.com (10.201.108.83) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Ben Widawsky <ben.widawsky@intel.com>, david@redhat.com,
 qemu-devel@nongnu.org, vishal.l.verma@intel.com, jgroves@micron.com,
 armbru@redhat.com, linux-cxl@vger.kernel.org, f4bug@amsat.org,
 "20210212162442.00007c1d@huawei.com" <20210212162442.00007c1d@Huawei.com>,
 mst@redhat.com, imammedo@redhat.com, dan.j.williams@intel.com,
 ira.weiny@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 12 Feb 2021 16:58:21 -0500
Chris Browy <cbrowy@avery-design.com> wrote:

> > On Feb 12, 2021, at 11:24 AM, Jonathan Cameron <Jonathan.Cameron@Huawei=
.com> wrote:
> >=20
> > On Tue, 9 Feb 2021 15:35:49 -0500
> > Chris Browy <cbrowy@avery-design.com> wrote:
> >=20
> > Run ./scripts/checkpatch.pl over the patches and fix all the warnings b=
efore
> > posting.  It will save time by clearing out most of the minor formattin=
g issues
> > and similar that inevitably sneak in during development.
> >  =20
> Excellent suggestion.  We=E2=80=99re still newbies!
>=20
> > The biggest issue I'm seeing in here is that the abstraction of
> > multiple DOE capabiltiies accessing same protocols doesn't make sense.
> >=20
> > Each DOE ecap region and hence mailbox can have it's own set of
> > (possibly  overlapping) protocols.
> >=20
> > From the ECN:
> > "It is permitted for a protocol using data object exchanges to require
> > that a Function implement a unique instance of DOE for that specific
> > protocol, and/or to allow sharing of a DOE instance to only a specific
> > set of protocols using data object exchange, and/or to allow a Function
> > to implement multiple instances of DOE supporting the specific protocol=
."
> >=20
> > Tightly couple the ECAP and DOE.  If we are in the multiple instances
> > of DOE supporting a specific protocol case, then register it separately
> > for each one.  The individual device emulation then needs to deal with
> > any possible clashes etc. =20
>=20
> Not sure how configurable we want to make the device.  It is a simple typ=
e 3
> device after all.=20

Agreed, but what I (or someone else) really doesn't want to have to do
in the future is reimplement DOE because we made design decisions that make
this version hard to reuse.  Unless it is particularly nasty to do we should
try to design something that is generally useful rather than targeted to
closely at the specific case we are dealing with.

I'd argue the ECAP and the DOE mailbox are always tightly coupled 1-to-1.
Whether the device wants to implement multiple protocols on each DOE mailbox
or indeed run individual protocols on multiple DOE mailboxes is a design
decision, but the actual mechanics of DOE match up with the config
space structures anything else is impdef on the device.

>=20
> The DOE spec does leave it pretty arbitrary regarding N DOE instances (DO=
E=20
> Extended Cap entry points) for M protocols, including where N>1 and M=3D1=
. =20
> Currently we implement N=3D2 DOE caps (instances), one for CDAT, one for=
=20
> Compliance Mode.[
>=20
> Maybe a more complex MLD device might have one or more DOE instances=20
> for the CDAT protocol alone to define each HDM but currently we only have=
=20
> one pmem (SLD) so we can=E2=80=99t really do much more than what=E2=80=99=
s supported.
>=20
> Open to further suggestion though.  Based on answer to above we=E2=80=99l=
l follow=20
> the suggestion lower in the code review regarding=20
>=20
...



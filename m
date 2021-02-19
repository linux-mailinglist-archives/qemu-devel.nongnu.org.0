Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD0431F367
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 01:51:28 +0100 (CET)
Received: from localhost ([::1]:46960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCu11-00010o-FR
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 19:51:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cbrowy@avery-design.com>)
 id 1lCtzs-0000VS-T7
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 19:50:16 -0500
Received: from server.avery-design.com ([198.57.169.184]:53486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cbrowy@avery-design.com>)
 id 1lCtzp-0007Ky-Ry
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 19:50:15 -0500
Received: from ool-944ab965.dyn.optonline.net ([148.74.185.101]:55696
 helo=[192.168.1.180])
 by server.avery-design.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <cbrowy@avery-design.com>)
 id 1lCtpB-00011R-WB; Fri, 19 Feb 2021 00:39:14 +0000
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [RFC PATCH v2 1/2] Basic PCIe DOE support
From: Chris Browy <cbrowy@avery-design.com>
In-Reply-To: <20210218191143.00000cdf@Huawei.com>
Date: Thu, 18 Feb 2021 19:46:54 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <DDBDE314-FA91-4E43-9484-F83E446B6EE4@avery-design.com>
References: <1612900760-7361-1-git-send-email-cbrowy@avery-design.com>
 <1612902949-9992-1-git-send-email-cbrowy@avery-design.com>
 <20210212162442.00007c1d@Huawei.com>
 <8A5C244A-DF9A-4EB5-8C24-568A606E75B0@avery-design.com>
 <20210218191143.00000cdf@Huawei.com>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.avery-design.com
X-AntiAbuse: Original Domain - nongnu.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - avery-design.com
X-Get-Message-Sender-Via: server.avery-design.com: authenticated_id:
 cbrowy@avery-design.com
X-Authenticated-Sender: server.avery-design.com: cbrowy@avery-design.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Received-SPF: pass client-ip=198.57.169.184;
 envelope-from=cbrowy@avery-design.com; helo=server.avery-design.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Reply-To: "20210218191143.00000cdf@huawei.com"
 <20210218191143.00000cdf@Huawei.com>
Cc: Ben Widawsky <ben.widawsky@intel.com>, david@redhat.com,
 qemu-devel@nongnu.org, vishal.l.verma@intel.com, jgroves@micron.com,
 armbru@redhat.com, linux-cxl@vger.kernel.org, f4bug@amsat.org,
 "20210212162442.00007c1d@huawei.com" <20210212162442.00007c1d@Huawei.com>,
 mst@redhat.com, imammedo@redhat.com, dan.j.williams@intel.com,
 ira.weiny@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Feb 18, 2021, at 2:11 PM, Jonathan Cameron =
<jonathan.cameron@huawei.com> wrote:
>=20
> On Fri, 12 Feb 2021 16:58:21 -0500
> Chris Browy <cbrowy@avery-design.com> wrote:
>=20
>>> On Feb 12, 2021, at 11:24 AM, Jonathan Cameron =
<Jonathan.Cameron@Huawei.com> wrote:
>>>=20
>>> On Tue, 9 Feb 2021 15:35:49 -0500
>>> Chris Browy <cbrowy@avery-design.com> wrote:
>>>=20
>>> Run ./scripts/checkpatch.pl over the patches and fix all the =
warnings before
>>> posting.  It will save time by clearing out most of the minor =
formatting issues
>>> and similar that inevitably sneak in during development.
>>>=20
>> Excellent suggestion.  We=E2=80=99re still newbies!
>>=20
>>> The biggest issue I'm seeing in here is that the abstraction of
>>> multiple DOE capabiltiies accessing same protocols doesn't make =
sense.
>>>=20
>>> Each DOE ecap region and hence mailbox can have it's own set of
>>> (possibly  overlapping) protocols.
>>>=20
>>> =46rom the ECN:
>>> "It is permitted for a protocol using data object exchanges to =
require
>>> that a Function implement a unique instance of DOE for that specific
>>> protocol, and/or to allow sharing of a DOE instance to only a =
specific
>>> set of protocols using data object exchange, and/or to allow a =
Function
>>> to implement multiple instances of DOE supporting the specific =
protocol."
>>>=20
>>> Tightly couple the ECAP and DOE.  If we are in the multiple =
instances
>>> of DOE supporting a specific protocol case, then register it =
separately
>>> for each one.  The individual device emulation then needs to deal =
with
>>> any possible clashes etc. =20
>>=20
>> Not sure how configurable we want to make the device.  It is a simple =
type 3
>> device after all.=20
>=20
> Agreed, but what I (or someone else) really doesn't want to have to do
> in the future is reimplement DOE because we made design decisions that =
make
> this version hard to reuse.  Unless it is particularly nasty to do we =
should
> try to design something that is generally useful rather than targeted =
to
> closely at the specific case we are dealing with.
>=20
> I'd argue the ECAP and the DOE mailbox are always tightly coupled =
1-to-1.
> Whether the device wants to implement multiple protocols on each DOE =
mailbox
> or indeed run individual protocols on multiple DOE mailboxes is a =
design
> decision, but the actual mechanics of DOE match up with the config
> space structures anything else is impdef on the device.

Yes I agree that there is 1-to-1 between DOE extended cap (ECAP) and DOE
Mailbox.  If we want to provide complete flexibility we should let the =
user pass=20
device property arrays to QEMU command for how many DOE ECAP=E2=80=99s =
to build=20
out and how to assign protocol(s) to each of them.  Array index is the =
DOE=20
instance #.

Also we can provide a property for cdat binary (blob) filename to =
initialize=20
the CDAT structure[entries].  This just reads in whatever mix of CDAT =
structure
types are in the blob.

-device cxl-type3,bus=3Drp0,memdev=3Dcxl-mem1,id=3Dcxl-pmem0,size=3D256M =
\
    doe-ecap-instances=3D2 \
    doe-ecap[0]=3D5 // bitwise OR for protocols shared
    doe-ecap[1]=3D2 //bitwise OR for protocols shared
    doe-ecap-cdat[1]=3Dmycdat.bin

where let=E2=80=99s say protocols bitvector
bit [0]=3DCMA
bit [1]=3DCDAT
bit [2}=3DCompliance

Let me know if you some better alternatives and we=E2=80=99ll implement =
it.


>=20
>>=20
>> The DOE spec does leave it pretty arbitrary regarding N DOE instances =
(DOE=20
>> Extended Cap entry points) for M protocols, including where N>1 and =
M=3D1. =20
>> Currently we implement N=3D2 DOE caps (instances), one for CDAT, one =
for=20
>> Compliance Mode.[
>>=20
>> Maybe a more complex MLD device might have one or more DOE instances=20=

>> for the CDAT protocol alone to define each HDM but currently we only =
have=20
>> one pmem (SLD) so we can=E2=80=99t really do much more than what=E2=80=99=
s supported.
>>=20
>> Open to further suggestion though.  Based on answer to above we=E2=80=99=
ll follow=20
>> the suggestion lower in the code review regarding=20
>>=20
> ...
>=20



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F87F433D0
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 09:42:55 +0200 (CEST)
Received: from localhost ([::1]:37506 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbKNq-0007Ue-PC
	for lists+qemu-devel@lfdr.de; Thu, 13 Jun 2019 03:42:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53761)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <shmuel.eiderman@oracle.com>) id 1hbKMS-0006zy-LN
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 03:41:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shmuel.eiderman@oracle.com>) id 1hbKMQ-00086f-LH
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 03:41:28 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:38656)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shmuel.eiderman@oracle.com>)
 id 1hbKML-0007zx-9h; Thu, 13 Jun 2019 03:41:21 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5D7cvfD067813;
 Thu, 13 Jun 2019 07:41:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : message-id :
 content-type : mime-version : subject : date : in-reply-to : cc : to :
 references; s=corp-2018-07-02;
 bh=iPx7xX1gQSZlF5J9cfw0bmEf+Clj0vZdEcJeur8+bsE=;
 b=tefBhE35D2loXYJgdpviT3+2NlxX8ng9WL4fuputfEbFmJllLdl3PZQAiCUuTT6/hmuV
 /Xblp6nTHMTouit1B+3XLRzc9CP4BHI3/HuwmlBb/3X6f7hALU1GI8iUGcoXsJ/zbSxX
 XWJGrET3yuQ6xeppaOORQpBAIcjegBj+GRpfExbiaWOA8ZKIRzV+VAF1HIEeKjggzfSL
 rYVtW2X1HXXjOxM7dlkzNRqsICmtdCVOcuA9eEYvB9T21Z5edqs3IGjQ9S/ovN2Ttl9P
 NweAlOKSab/xmFdtQHrPZB3IGmhBcpYAPX+0+jFHpImxXGcXu1JQfmOsxsxrmo5pYBXm zA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 2t02heyyxs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Jun 2019 07:41:18 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5D7eDAr104798;
 Thu, 13 Jun 2019 07:41:17 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 2t0p9s8tya-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Jun 2019 07:41:17 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5D7fGBp020183;
 Thu, 13 Jun 2019 07:41:16 GMT
Received: from [10.0.5.157] (/213.57.127.10)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 13 Jun 2019 00:41:16 -0700
From: Sam Eiderman <shmuel.eiderman@oracle.com>
Message-Id: <02844D7D-ED79-4744-A203-8E713DE7A717@oracle.com>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Date: Thu, 13 Jun 2019 10:41:10 +0300
In-Reply-To: <20190612191817.5bilt2abif2xvcbv@sirius.home.kraxel.org>
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20190612115939.23825-1-shmuel.eiderman@oracle.com>
 <20190612130650.xftda65kgnsefyvs@sirius.home.kraxel.org>
 <A3F8BD49-3C35-4A07-8DE2-85F7CC293DC9@oracle.com>
 <20190612191817.5bilt2abif2xvcbv@sirius.home.kraxel.org>
X-Mailer: Apple Mail (2.3445.104.11)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9286
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906130061
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9286
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906130061
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 141.146.126.79
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] [QEMU] [PATCH v2 0/8] Add Qemu to SeaBIOS LCHS
 interface
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, arbel.moshe@oracle.com,
 seabios@seabios.org, QEMU <qemu-devel@nongnu.org>, mreitz@redhat.com,
 kevin@koconnor.net, liran.alon@oracle.com, karl.heubaum@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On 12 Jun 2019, at 22:18, Gerd Hoffmann <kraxel@redhat.com> wrote:
>=20
> On Wed, Jun 12, 2019 at 04:30:03PM +0300, Sam Eiderman wrote:
>>=20
>>=20
>>> On 12 Jun 2019, at 16:06, Gerd Hoffmann <kraxel@redhat.com> wrote:
>>>=20
>>> On Wed, Jun 12, 2019 at 02:59:31PM +0300, Sam Eiderman wrote:
>>>> v1:
>>>>=20
>>>> Non-standard logical geometries break under QEMU.
>>>>=20
>>>> A virtual disk which contains an operating system which depends on
>>>> logical geometries (consistent values being reported from BIOS =
INT13
>>>> AH=3D08) will most likely break under QEMU/SeaBIOS if it has =
non-standard
>>>> logical geometries - for example 56 SPT (sectors per track).
>>>> No matter what QEMU will guess - SeaBIOS, for large enough disks - =
will
>>>> use LBA translation, which will report 63 SPT instead.
>>>=20
>>> --verbose please.
>>>=20
>>> As far I know seabios switches to LBA mode when the disk is simply =
too
>>> big for LCHS addressing.  So I fail to see which problem is solved =
by
>>> this.  If your guest needs LCHS, why do you assign a disk which =
can't
>>> be fully accessed using LCHS addressing?
>>=20
>> The scenario is as follows:
>>=20
>> A user has a disk with 56 spts.
>> This disk has been already created under a bios that reported 56 =
spts.
>> When migrating this disk to QEMU/SeaBIOS, SeaBIOS will report 63 spts
>> (under LBA translation) - this will break the boot for this guest.
>=20
> You sayed so already.  I was looking for a real world example.  Guests
> which can't deal with LBA should be pretty rare these days.  What kind
> of guest?  What other bios?  Or is this a purely theoretical issue?

Yes they are pretty rare.
Windows 2000 and Windows XP guests migrated from VMware to Qemu/KVM
would not boot due to incorrect disk geometries (some had 32/56 spt =
instead of
56. Also number of heads was not entirely correct)

>=20
>>>> In addition we can not enforce SeaBIOS to rely on phyiscal =
geometries at
>>>> all. A virtio-blk-pci virtual disk with 255 phyiscal heads can not
>>>> report more than 16 physical heads when moved to an IDE controller, =
the
>>>> ATA spec allows a maximum of 16 heads - this is an artifact of
>>>> virtualization.
>>>=20
>>> Well, not really.  Moving disks from one controller to another when =
the
>>> OS depends on LHCS addressing never is a good idea.  That already =
caused
>>> problems in the 90-ies, when moving scsi disks from one scsi host
>>> adapter to another type, *way* before virtualization became a thing.
>>=20
>> I agree, but this is easily solvable in virtualized environments =
where the
>> hypervisor can guess the correct LCHS values by inspecting the MBR,
>=20
> Yes.  This is exactly what the more clever scsi host adapter int13 rom
> implementations ended up doing too.  Look at MBR to figure which LCHS
> they should use.
>=20
>> or letting the user set these values manually.
>=20
> Why?  Asking the user to deal with the mess is pretty lame if there =
are
> better options.  And IMO doing this fully automatic in seabios is
> better.

I=E2=80=99m not against an automatic approach, however I do think that =
doing this
in SeaBIOS might break compatibility for already existing guests that =
will
suddenly see different LCHS values. (Explanation below)

Notice that already today it is possible to pass =E2=80=9Ccyls", =
=E2=80=9Cheads", =E2=80=9Csectors=E2=80=9D and
even =E2=80=9Cchs-trans=E2=80=9D (IDE only) for devices in QEMU, but =
these are only the
physical geometries of the disks which later on SeaBIOS might use to
determine the logical geometries.
"chs-trans" is an already existing PV interface between QEMU and
SeaBIOS for that matter (although it only supports 4 IDE disks).

I believe that the steps to bring this issue to a more stable state are:
Create a PV interface between QEMU and SeaBIOS to pass LCHS (Implemented =
here)
Allow users to manually set values for LCHS values in QEMU (Implemented =
here)
(Up until here, we do not break any existing functionality)
Implement a better LCHS guessing algorithm in QEMU - the existing ones =
contains some issues
On new machine versions - pass guessed LCHS directly to SeaBIOS
At the moment QEMU does not propagate its MBR guessed LCHS values, but =
only uses them to set PCHS values for disks - so SeaBIOS has to guess =
again
(Also here we will not break compatibility for older machine versions)

In addition, QEMU allows the use of VMDKs, some VMDK descriptors contain =
the following values:
    ddb.geometry.biosHeads =3D =E2=80=9C16=E2=80=9D
    ddb.geometry.biosHeads =3D =E2=80=9C83257=E2=80=9D
Which override the guessing algorithm in VMware and request the =
following values to be set.

Providing such PV interface will allow to support these VMDKs too.

>=20
>>> BTW:  One possible way to figure which LCHS layout a disk uses is to
>>> check the MBR partition table.  With that we (a) don't need a new
>>> interface between qemu and seabios and (b) it is not needed to =
manually
>>> specify the geometry.
>>=20
>> In my opinion SeaBIOS is not the correct place for this change since
>> =E2=80=9Cenhancing=E2=80=9D the detection of LCHS values in SeaBIOS =
may cause it to
>> suddenly report different values for already existing guests which =
rely on
>> LCHS - thus, breaking compatibility.
>=20
> I can't see how this can break guests.  It should either have no =
effect
> (guests using LBA) or unbreak guests due to LCHS changing from "wrong"
> to "correct=E2=80=9D.

I=E2=80=99m not sure what do you mean by "unbreak guests=E2=80=9D if you =
change an existing
guest that uses LCHS from 56 spt to LBA (63 spt) it will stop booting.
Your guessing algorithm will have to guess 56, if it will fail guessing =
56 correctly,
the user can not perform any action beside downgrading SeaBIOS in order =
to run
the guest.

Sam

>=20
> cheers,
>  Gerd


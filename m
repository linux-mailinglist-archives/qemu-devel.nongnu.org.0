Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A38E14CB52
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jan 2020 14:17:08 +0100 (CET)
Received: from localhost ([::1]:46512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwnDP-0000hc-28
	for lists+qemu-devel@lfdr.de; Wed, 29 Jan 2020 08:17:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51656)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iwnCF-0008Ho-Up
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 08:15:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iwnCD-0005Xj-PR
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 08:15:55 -0500
Received: from 9.mo6.mail-out.ovh.net ([87.98.171.146]:45750)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iwnCD-0005OC-K4
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 08:15:53 -0500
Received: from player734.ha.ovh.net (unknown [10.108.35.215])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 76CED1FBB8B
 for <qemu-devel@nongnu.org>; Wed, 29 Jan 2020 14:15:42 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player734.ha.ovh.net (Postfix) with ESMTPSA id 44685EA24FD2;
 Wed, 29 Jan 2020 13:15:37 +0000 (UTC)
Subject: Re: [PATCH 0/2] ppc/pnv: Add models for PHB4 and PHB3 PCIe Host
 bridges
To: David Gibson <david@gibson.dropbear.id.au>
References: <20200127144506.11132-1-clg@kaod.org>
 <20200129063103.GB42099@umbus.fritz.box>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <ad66cad0-98ff-7ab1-9be9-8bc234279ff6@kaod.org>
Date: Wed, 29 Jan 2020 14:15:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200129063103.GB42099@umbus.fritz.box>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
X-Ovh-Tracer-Id: 9619125855068064576
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrfeeigdeglecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeehnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeefgedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 87.98.171.146
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
Cc: qemu-ppc@nongnu.org, Oliver O'Halloran <oohall@gmail.com>,
 qemu-devel@nongnu.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/29/20 7:31 AM, David Gibson wrote:
> On Mon, Jan 27, 2020 at 03:45:04PM +0100, C=E9dric Le Goater wrote:
>> Hello,
>>
>> These are models for the PCIe Host Bridges, PHB3 and PHB4, as found on
>> POWER8 and POWER9 processors. It includes the PowerBus logic interface
>> (PBCQ), IOMMU support, a single PCIe Gen.3/4 Root Complex, and support
>> for MSI and LSI interrupt sources as found on each system depending on
>> the interrupt controller: XICS or XIVE.
>>
>> No default device layout is provided and PCI devices can be added on
>> any of the available PCIe Root Port (pcie.0 .. 2) with address 0x0 as
>> the firwware (skiboot) only accepts a single device per root port. To
>> run a simple system with a network and a storage adapters, use a
>> command line options such as :
>>
>>   -device e1000e,netdev=3Dnet0,mac=3DC0:FF:EE:00:00:02,bus=3Dpcie.0,ad=
dr=3D0x0
>>   -netdev bridge,id=3Dnet0,helper=3D/usr/libexec/qemu-bridge-helper,br=
=3Dvirbr0,id=3Dhostnet0
>>
>>   -device megasas,id=3Dscsi0,bus=3Dpcie.1,addr=3D0x0
>>   -drive file=3D$disk,if=3Dnone,id=3Ddrive-scsi0-0-0-0,format=3Dqcow2,=
cache=3Dnone
>>   -device scsi-hd,bus=3Dscsi0.0,channel=3D0,scsi-id=3D0,lun=3D0,drive=3D=
drive-scsi0-0-0-0,id=3Dscsi0-0-0-0,bootindex=3D2
>>
>> If more are needed, include a bridge.
>>
>> Multi chip is supported, each chip adding its set of PHB controllers
>> and its PCI busses. The model doesn't emulate the EEH error handling
>> and cold plugging PHB devices still needs some work.
>>
>> XICS requires some adjustment to support the PHB3 MSI. The changes are
>> provided in the PHB3 model but they could be decoupled in prereq
>> patches.
>=20
> Applied to ppc-for-5.0, thanks.

Should we add a default set of devices on PHB1 like found on OpenPOWER=20
system ? On a P8 we have  :

 +-[0001:00]---00.0-[01-07]----00.0-[02-07]--+-01.0-[03-04]----00.0-[04]-=
---00.0  ASPEED Technology, Inc. ASPEED Graphics Family
 |                                           +-02.0-[05]----00.0  Texas I=
nstruments TUSB73x0 SuperSpeed USB 3.0 xHCI Host Controller
 |                                           +-03.0-[06]--+-00.0  Broadco=
m Inc. and subsidiaries NetXtreme BCM5718 Gigabit Ethernet PCIe
 |                                           |            \-00.1  Broadco=
m Inc. and subsidiaries NetXtreme BCM5718 Gigabit Ethernet PCIe
 |                                           \-04.0-[07]----00.0  Marvell=
 Technology Group Ltd. 88SE9235 PCIe 2.0 x2 4-port SATA 6 Gb/s Controller


C.


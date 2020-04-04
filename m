Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 959AE19E641
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Apr 2020 17:48:44 +0200 (CEST)
Received: from localhost ([::1]:39782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jKl2J-0002L8-74
	for lists+qemu-devel@lfdr.de; Sat, 04 Apr 2020 11:48:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48153)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1jKl0r-00014p-Fb
 for qemu-devel@nongnu.org; Sat, 04 Apr 2020 11:47:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1jKl0q-0001cP-Ae
 for qemu-devel@nongnu.org; Sat, 04 Apr 2020 11:47:13 -0400
Received: from 3.mo5.mail-out.ovh.net ([46.105.40.108]:38140)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1jKl0q-0001bQ-4G
 for qemu-devel@nongnu.org; Sat, 04 Apr 2020 11:47:12 -0400
Received: from player771.ha.ovh.net (unknown [10.108.57.44])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id A841D273C46
 for <qemu-devel@nongnu.org>; Sat,  4 Apr 2020 17:47:09 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player771.ha.ovh.net (Postfix) with ESMTPSA id 407DF1131833A;
 Sat,  4 Apr 2020 15:47:02 +0000 (UTC)
Subject: Re: [PATCH v2] ppc/pnv: Create BMC devices at machine init
To: Nathan Chancellor <natechancellor@gmail.com>
References: <20191121162340.11049-1-clg@kaod.org>
 <20200404071707.GA24708@ubuntu-m2-xlarge-x86>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <41e3a864-b8a7-8fbd-2701-42fe5d9fa8d1@kaod.org>
Date: Sat, 4 Apr 2020 17:46:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200404071707.GA24708@ubuntu-m2-xlarge-x86>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 12393061751210609472
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrtdekgdelfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeejuddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.40.108
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
Cc: Corey Minyard <cminyard@mvista.com>, Oliver O'Halloran <oohall@gmail.com>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Nathan,=20

Some comments on the command line.

> $ timeout 3m unbuffer qemu-system-ppc64 -device ipmi-bmc-sim,id=3Dbmc0 =
\
>                                         -device isa-ipmi-bt,bmc=3Dbmc0,=
irq=3D10 \
>                                         -L images/ppc64le/ \
>                                         -bios skiboot.lid \
>                                         -machine powernv \

powernv8 or powernv9 specifies the POWER chip.

>                                         -display none \

I use -nograp=C4=A5ics.

>                                         -initrd images/ppc64le/rootfs.c=
pio \
>                                         -kernel zImage.epapr \
>                                         -m 2G \
you can add adapters now on QEMU-5.0:

  -device ich9-ahci,id=3Dsata0,bus=3Dpcie.1,addr=3D0x0 \
  -drive file=3D./ubuntu-ppc64le-powernv.qcow2,if=3Dnone,id=3Ddrive0,form=
at=3Dqcow2,cache=3Dnone \
  -device ide-hd,bus=3Dsata0.0,unit=3D0,drive=3Ddrive0,id=3Dide,bootindex=
=3D1 \
  -device e1000e,netdev=3Dnet0,mac=3DC0:FF:EE:00:01:03,bus=3Dpcie.2,addr=3D=
0x0 \
  -netdev bridge,helper=3D/usr/libexec/qemu-bridge-helper,br=3Dvirbr0,id=3D=
net0

you can also add :

	-drive file=3D./witherspoon.pnor,format=3Draw,if=3Dmtd

to map a PNOR on the LPC address space.


I have sent a patch fixing the issue you reported but you will need to
add -nodefaults now. I think this is the good direction. It would be
interesting for me if you could test it.

Thanks,

C.


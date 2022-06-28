Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E578955E556
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 16:30:47 +0200 (CEST)
Received: from localhost ([::1]:49216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6CEp-0001E3-19
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 10:30:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Brice.Goglin@inria.fr>)
 id 1o6CCP-0000HD-FN
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 10:28:17 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:57256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Brice.Goglin@inria.fr>)
 id 1o6CCN-0005Tb-6K
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 10:28:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to;
 bh=iI05mqB0QtRSt7eTv37NWQUALCUMrRyffjUNTrvqvQQ=;
 b=bDqXgmTZPOx5ofwA/B2omCN7a2J6wmUdVt5AAYhlqsfs07iKbr2RbEqd
 nF1lHp2rberOdclc5/m6mYs8jGKiigrkXRN5HsPRR1KN+8rB2iGm+UG00
 d33AKQK5ZyUx2WBxprNPpAX8rFxX0ijdr1i56qdwCPTiBei657pCxmMya g=;
Authentication-Results: mail2-relais-roc.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Brice.Goglin@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.92,229,1650924000"; d="scan'208";a="43258328"
Received: from 91-160-5-165.subs.proxad.net (HELO [192.168.44.23])
 ([91.160.5.165]) by mail2-relais-roc.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2022 16:28:10 +0200
Subject: Re: [PATCH 1/4] hmat acpi: Don't require initiator value in -numa
To: Igor Mammedov <imammedo@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Liu Jingqi
 <jingqi.liu@intel.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>
References: <d7e41f9c-745d-3ef2-31c3-c5e5921fc025@inria.fr>
 <7d0c6957-a781-58dc-552b-41afeb8b9c7e@inria.fr>
 <20220628161923.5804ec2a@redhat.com>
From: Brice Goglin <Brice.Goglin@inria.fr>
Message-ID: <033d20e7-7aec-76f7-67a0-dc161ca658f5@inria.fr>
Date: Tue, 28 Jun 2022 16:28:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220628161923.5804ec2a@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="eAVkFwhcjrLikElGaLgNTEUnwrE5qZrV6"
Received-SPF: pass client-ip=192.134.164.83;
 envelope-from=Brice.Goglin@inria.fr; helo=mail2-relais-roc.national.inria.fr
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--eAVkFwhcjrLikElGaLgNTEUnwrE5qZrV6
Content-Type: multipart/mixed; boundary="bB4GIoeFjIsGaHCxZJcMbRgu7J4YPdYw7";
 protected-headers="v1"
From: Brice Goglin <Brice.Goglin@inria.fr>
To: Igor Mammedov <imammedo@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Liu Jingqi
 <jingqi.liu@intel.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>
Message-ID: <033d20e7-7aec-76f7-67a0-dc161ca658f5@inria.fr>
Subject: Re: [PATCH 1/4] hmat acpi: Don't require initiator value in -numa
References: <d7e41f9c-745d-3ef2-31c3-c5e5921fc025@inria.fr>
 <7d0c6957-a781-58dc-552b-41afeb8b9c7e@inria.fr>
 <20220628161923.5804ec2a@redhat.com>
In-Reply-To: <20220628161923.5804ec2a@redhat.com>

--bB4GIoeFjIsGaHCxZJcMbRgu7J4YPdYw7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Le 28/06/2022 =C3=A0 16:19, Igor Mammedov a =C3=A9crit=C2=A0:
> On Thu, 23 Jun 2022 16:58:28 +0200
> Brice Goglin <Brice.Goglin@inria.fr> wrote:
>
>> The "Memory Proximity Domain Attributes" structure of the ACPI HMAT
>> has a "Processor Proximity Domain Valid" flag that is currently
>> always set because Qemu -numa requires an initiator=3DX value
>> when hmat=3Don. Unsetting this flag allows to create more complex
>> memory topologies by having multiple best initiators for a single
>> memory target.
>>
>> This patch allows -numa without initiator=3DX when hmat=3Don by keepin=
g
>> the default value MAX_NODES in numa_state->nodes[i].initiator.
>> All places reading numa_state->nodes[i].initiator already check
>> whether it's different from MAX_NODES before using it.
>>
>> Tested with
>> qemu-system-x86_64 -accel kvm \
>>    -machine pc,hmat=3Don \
>>    -drive if=3Dpflash,format=3Draw,file=3D./OVMF.fd \
>>    -drive media=3Ddisk,format=3Dqcow2,file=3Defi.qcow2 \
>>    -smp 4 \
>>    -m 3G \
>>    -object memory-backend-ram,size=3D1G,id=3Dram0 \
>>    -object memory-backend-ram,size=3D1G,id=3Dram1 \
>>    -object memory-backend-ram,size=3D1G,id=3Dram2 \
>>    -numa node,nodeid=3D0,memdev=3Dram0,cpus=3D0-1 \
>>    -numa node,nodeid=3D1,memdev=3Dram1,cpus=3D2-3 \
>>    -numa node,nodeid=3D2,memdev=3Dram2 \
>>    -numa hmat-lb,initiator=3D0,target=3D0,hierarchy=3Dmemory,data-type=
=3Daccess-latency,latency=3D10 \
>>    -numa hmat-lb,initiator=3D0,target=3D0,hierarchy=3Dmemory,data-type=
=3Daccess-bandwidth,bandwidth=3D10485760 \
>>    -numa hmat-lb,initiator=3D0,target=3D1,hierarchy=3Dmemory,data-type=
=3Daccess-latency,latency=3D20 \
>>    -numa hmat-lb,initiator=3D0,target=3D1,hierarchy=3Dmemory,data-type=
=3Daccess-bandwidth,bandwidth=3D5242880 \
>>    -numa hmat-lb,initiator=3D0,target=3D2,hierarchy=3Dmemory,data-type=
=3Daccess-latency,latency=3D30 \
>>    -numa hmat-lb,initiator=3D0,target=3D2,hierarchy=3Dmemory,data-type=
=3Daccess-bandwidth,bandwidth=3D1048576 \
>>    -numa hmat-lb,initiator=3D1,target=3D0,hierarchy=3Dmemory,data-type=
=3Daccess-latency,latency=3D20 \
>>    -numa hmat-lb,initiator=3D1,target=3D0,hierarchy=3Dmemory,data-type=
=3Daccess-bandwidth,bandwidth=3D5242880 \
>>    -numa hmat-lb,initiator=3D1,target=3D1,hierarchy=3Dmemory,data-type=
=3Daccess-latency,latency=3D10 \
>>    -numa hmat-lb,initiator=3D1,target=3D1,hierarchy=3Dmemory,data-type=
=3Daccess-bandwidth,bandwidth=3D10485760 \
>>    -numa hmat-lb,initiator=3D1,target=3D2,hierarchy=3Dmemory,data-type=
=3Daccess-latency,latency=3D30 \
>>    -numa hmat-lb,initiator=3D1,target=3D2,hierarchy=3Dmemory,data-type=
=3Daccess-bandwidth,bandwidth=3D1048576
>> which reports NUMA node2 at same distance from both node0 and node1 as=
 seen in lstopo:
>> Machine (2966MB total) + Package P#0
>>     NUMANode P#2 (979MB)
>>     Group0
>>       NUMANode P#0 (980MB)
>>       Core P#0 + PU P#0
>>       Core P#1 + PU P#1
>>     Group0
>>       NUMANode P#1 (1007MB)
>>       Core P#2 + PU P#2
>>       Core P#3 + PU P#3
>>
>> Before this patch, we had to add ",initiator=3DX" to "-numa node,nodei=
d=3D2,memdev=3Dram2".
>> The lstopo output difference between initiator=3D1 and no initiator is=
:
>> @@ -1,10 +1,10 @@
>>    Machine (2966MB total) + Package P#0
>> +  NUMANode P#2 (979MB)
>>      Group0
>>        NUMANode P#0 (980MB)
>>        Core P#0 + PU P#0
>>        Core P#1 + PU P#1
>>      Group0
>>        NUMANode P#1 (1007MB)
>> -    NUMANode P#2 (979MB)
>>        Core P#2 + PU P#2
>>        Core P#3 + PU P#3
>>
>> Corresponding changes in the HMAT MPDA structure:
>> @@ -49,10 +49,10 @@
>>    [078h 0120   2]               Structure Type : 0000 [Memory Proximi=
ty Domain Attributes]
>>    [07Ah 0122   2]                     Reserved : 0000
>>    [07Ch 0124   4]                       Length : 00000028
>> -[080h 0128   2]        Flags (decoded below) : 0001
>> -            Processor Proximity Domain Valid : 1
>> +[080h 0128   2]        Flags (decoded below) : 0000
>> +            Processor Proximity Domain Valid : 0
>>    [082h 0130   2]                    Reserved1 : 0000
>> -[084h 0132   4] Attached Initiator Proximity Domain : 00000001
>> +[084h 0132   4] Attached Initiator Proximity Domain : 00000080
>                                                           ^^^^^^^^
> where does this value come from?


This is #define MAX_NODES 128, the default value for initiator field in=20
Qemu. But it's meaningless here because "Processor Proximity Domain=20
Valid" flag above is 0.

Brice




--bB4GIoeFjIsGaHCxZJcMbRgu7J4YPdYw7--

--eAVkFwhcjrLikElGaLgNTEUnwrE5qZrV6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEelpOgOQAl7r26tY4RJGQ8yNavTsFAmK7D/kFAwAAAAAACgkQRJGQ8yNavTsx
LhAAsY5ki3pw0NvbEuQxdI0xbPXPaf4TZSrGsJd0ieQK/xY364CBJ2TdE4VK7A780OJ4fd1j49J6
Wfd6q8s3OoinS3yHwdu1RAH7P9Db8vIbXAsqiWUJoCQ0rIj5uhawo56dzd0kgaTDk5q9xzGDjlAP
fGpYw2aVnJlvBU8O+yfKUbzADnw2cUyGqPCQnyBuQAcavG1hAfHnPd16EgAqo56fKaoQ3///9UXn
e7YmoKRfJ2IBfTKgduwcQj4gd5q2oTJ/58b+SnlYV8V21QdwjSuUO7y57gB5xo2Cetx2WOCBEC3B
2TX95ZfeT1aGLaHEqwlGRWu3aFs2UA6NnuZjnDn3HZfnsIErcCH8aUQdn+xmvyBbjYzCDMlxV5V4
TV92ES2UHF1EOHPd8bb3olEOy1yuwYD+UVJ57ETg7xrGEWP4iXaYanhDpnpPQTq1BN4HQYpHqvCV
WlcGQheqeoDHh1/t/qYGyE8BKh4Io8LXH3fXnK4EpGKQ41S3Hwxn8CH7ZB1xS/fa1pGBYeJ3wh+c
62XaB/Pya48kq0vFlmq3N5yuHyO/uY6YCukXp05S66i75SykSeL4vjl1EbUSl1od4fInUaHliE/X
LLdgtym7i9sBTZ06/STKrT0lpZUB9DlWxM6Si++3FEeXfSGlNT17GTR6cfXxjOihOB9F3mb3Um5A
Um8=
=E+My
-----END PGP SIGNATURE-----

--eAVkFwhcjrLikElGaLgNTEUnwrE5qZrV6--


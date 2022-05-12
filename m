Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E951524D8C
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 14:52:19 +0200 (CEST)
Received: from localhost ([::1]:45656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np8Ik-0007kw-38
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 08:52:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1np8CP-00022K-Dx
 for qemu-devel@nongnu.org; Thu, 12 May 2022 08:45:45 -0400
Received: from 9.mo552.mail-out.ovh.net ([87.98.180.222]:47507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1np8CJ-0007Ve-IF
 for qemu-devel@nongnu.org; Thu, 12 May 2022 08:45:42 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.164])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 276F324B86;
 Thu, 12 May 2022 12:45:29 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Thu, 12 May
 2022 14:45:28 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0013799bba9-4a5e-4050-8036-47330a99f136,
 72056902518AC1F5BD4797AAAB6E76FEAFBFF81B) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <96779f6d-c30b-4431-8a8c-91431a154c78@kaod.org>
Date: Thu, 12 May 2022 14:45:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH qemu] spapr/docs: Add a few words about x-vof
Content-Language: en-US
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Daniel Henrique Barboza
 <danielhb413@gmail.com>, <qemu-ppc@nongnu.org>
CC: <qemu-devel@nongnu.org>, Joel Stanley <joel@jms.id.au>
References: <20220506055124.3822112-1-aik@ozlabs.ru>
 <7008431e-6813-a763-f6fe-30088f1b519b@gmail.com>
 <980eb62c-55e1-d6fc-78da-c4e4e517f30a@ozlabs.ru>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <980eb62c-55e1-d6fc-78da-c4e4e517f30a@ozlabs.ru>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: c91d00c6-8fb1-4bfd-8b15-f03bbf19bff5
X-Ovh-Tracer-Id: 101330992072526755
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrgeejgdehgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepuedtudetkedvhfegvdekheejheduleffgeeguddtteejudegudetjeefveevvdeinecuffhomhgrihhnpehgihhthhhusgdrtghomhdpihgvvggvrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruh
Received-SPF: pass client-ip=87.98.180.222; envelope-from=clg@kaod.org;
 helo=9.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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

On 5/12/22 05:10, Alexey Kardashevskiy wrote:
> 
> 
> On 5/12/22 06:42, Daniel Henrique Barboza wrote:
>>
>>
>> On 5/6/22 02:51, Alexey Kardashevskiy wrote:
>>> The alternative small firmware needs a few words of what it can and
>>> absolutely cannot do; this adds those words.
>>>
>>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>>> ---
>>>   docs/system/ppc/pseries.rst | 28 ++++++++++++++++++++++++++++
>>>   1 file changed, 28 insertions(+)
>>>
>>> diff --git a/docs/system/ppc/pseries.rst b/docs/system/ppc/pseries.rst
>>> index d9b65ad4e850..4c98a94f9add 100644
>>> --- a/docs/system/ppc/pseries.rst
>>> +++ b/docs/system/ppc/pseries.rst
>>> @@ -32,14 +32,42 @@ Missing devices
>>>   Firmware
>>>   ========
>>> +The pSeries platform in QEMU comes with 2 firmwares:
>>> +
>>>   `SLOF <https://github.com/aik/SLOF>`_ (Slimline Open Firmware) is an
>>>   implementation of the `IEEE 1275-1994, Standard for Boot (Initialization
>>>   Configuration) Firmware: Core Requirements and Practices
>>>   <https://standards.ieee.org/standard/1275-1994.html>`_.
>>> +SLOF performs bus scanning, PCI resource allocation, provides the client
>>> +interface to boot from block devices and network.
>>> +
>>>   QEMU includes a prebuilt image of SLOF which is updated when a more recent
>>>   version is required.
>>> +VOF (Virtual Open Firmware) is a minimalistic firmware to work with
>>> +``-machine pseries,x-vof=on``. When enabled, the firmware acts as a slim
>>> +shim and QEMU implements parts of the IEEE 1275 Open Firmware interface.
>>> +
>>> +VOF does not have device drivers, does not do PCI resource allocation and
>>> +relies on ``-kernel`` used with Linux kernels recent enough (v5.4+)
>>> +to PCI resource assignment. It is ideal to use with petitboot.
>>> +
>>> +Booting via ``-kernel`` supports the following:
>>> ++-------------------+-------------------+------------------+
>>> +| kernel            | pseries,x-vof=off | pseries,x-vof=on |
>>> ++===================+===================+==================+
>>> +| vmlinux BE        |     ✓             |     ✓            |
>>> ++-------------------+-------------------+------------------+
>>> +| vmlinux LE        |     ✓             |     ✓            |
>>> ++-------------------+-------------------+------------------+
>>> +| zImage.pseries BE |     x             |     ✓¹           |
>>> ++-------------------+-------------------+------------------+
>>> +| zImage.pseries LE |     ✓             |     ✓            |
>>> ++-------------------+-------------------+------------------+
>>
>> You need an empty line at the start and at the end of the table. Otherwise it'll
>> be rendered as regular text.
> 
> How do you build htmls from these btw?


Install python3-sphinx python3-sphinx-rtd-theme
run configure with --enable-docs
check the result in build/docs/manual/system/arm/

C.


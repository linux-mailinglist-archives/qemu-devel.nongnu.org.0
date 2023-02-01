Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 535B26860FB
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 08:52:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN7uV-0005FF-LX; Wed, 01 Feb 2023 02:52:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pN7uT-0005EH-EE; Wed, 01 Feb 2023 02:52:01 -0500
Received: from 5.mo552.mail-out.ovh.net ([188.165.45.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pN7uR-0000jX-IH; Wed, 01 Feb 2023 02:52:01 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.141])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id C80972A935;
 Wed,  1 Feb 2023 07:51:51 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Wed, 1 Feb
 2023 08:51:51 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001b17f2c5b-8324-4705-844f-e33712a118cc,
 F0C8195E27B16437EDCB3A2BE992E155E5E23C80) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <9ee4d21c-f3a6-9b66-1e3e-32924a036e77@kaod.org>
Date: Wed, 1 Feb 2023 08:51:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 04/25] avocado/boot_linux_console.py: Update ast2600 test
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>
References: <20230119123449.531826-1-clg@kaod.org>
 <20230119123449.531826-5-clg@kaod.org>
 <CACPK8XccDp8gJW93rVqKOkutBqqBkd+km0ZGGBtsnuUWMVEC_A@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CACPK8XccDp8gJW93rVqKOkutBqqBkd+km0ZGGBtsnuUWMVEC_A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: d8beb8f7-45d6-4c7b-8500-5d672e5edb7d
X-Ovh-Tracer-Id: 1879971371163290531
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudefhedgudduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepudfgueevteevgfevjeevgeefieevgedvtefhlefhgfelheegteefueffledvieejnecuffhomhgrihhnpeguvggsihgrnhdrohhrghenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruhdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdhphhhilhhmugeslhhinhgrrhhordhorhhgpdfovfetjfhoshhtpehmohehhedvpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=188.165.45.220; envelope-from=clg@kaod.org;
 helo=5.mo552.mail-out.ovh.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/1/23 06:46, Joel Stanley wrote:
> On Thu, 19 Jan 2023 at 12:35, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> From: Joel Stanley <joel@jms.id.au>
>>
>> Update the test_arm_ast2600_debian test to
>>
>>   - the latest Debian kernel
> 
> Would you like a newer version of this patch that uses the latest kernel?

Sure. We can not test all kernels. Using the latest is the best approach I think.

Thanks,

C.


> 
>>   - use the Rainier machine instead of Tacoma
>>
>> Both of which contains support for more hardware and thus exercises more
>> of the hardware Qemu models.
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> Reviewed-by: Cédric Le Goater <clg@kaod.org>
>> Message-Id: <20220607011938.1676459-1-joel@jms.id.au>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   tests/avocado/boot_linux_console.py | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
>> index 8c1d981586..f3a1d00be9 100644
>> --- a/tests/avocado/boot_linux_console.py
>> +++ b/tests/avocado/boot_linux_console.py
>> @@ -1098,18 +1098,18 @@ def test_arm_vexpressa9(self):
>>       def test_arm_ast2600_debian(self):
>>           """
>>           :avocado: tags=arch:arm
>> -        :avocado: tags=machine:tacoma-bmc
>> +        :avocado: tags=machine:rainier-bmc
>>           """
>>           deb_url = ('http://snapshot.debian.org/archive/debian/'
>> -                   '20210302T203551Z/'
>> +                   '20220606T211338Z/'
>>                      'pool/main/l/linux/'
>> -                   'linux-image-5.10.0-3-armmp_5.10.13-1_armhf.deb')
>> -        deb_hash = 'db40d32fe39255d05482bea48d72467b67d6225bb2a2a4d6f618cb8976f1e09e'
>> +                   'linux-image-5.17.0-2-armmp_5.17.6-1%2Bb1_armhf.deb')
>> +        deb_hash = '8acb2b4439faedc2f3ed4bdb2847ad4f6e0491f73debaeb7f660c8abe4dcdc0e'
>>           deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash,
>>                                       algorithm='sha256')
>> -        kernel_path = self.extract_from_deb(deb_path, '/boot/vmlinuz-5.10.0-3-armmp')
>> +        kernel_path = self.extract_from_deb(deb_path, '/boot/vmlinuz-5.17.0-2-armmp')
>>           dtb_path = self.extract_from_deb(deb_path,
>> -                '/usr/lib/linux-image-5.10.0-3-armmp/aspeed-bmc-opp-tacoma.dtb')
>> +                '/usr/lib/linux-image-5.17.0-2-armmp/aspeed-bmc-ibm-rainier.dtb')
>>
>>           self.vm.set_console()
>>           self.vm.add_args('-kernel', kernel_path,
>> --
>> 2.39.0
>>



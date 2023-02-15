Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA40B697839
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 09:33:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSDDZ-0001Dg-H7; Wed, 15 Feb 2023 03:32:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pSDDW-00019L-PL; Wed, 15 Feb 2023 03:32:42 -0500
Received: from 4.mo552.mail-out.ovh.net ([178.33.43.201])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pSDDU-0001cM-SY; Wed, 15 Feb 2023 03:32:42 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.149])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id DA79E2B2F1;
 Wed, 15 Feb 2023 08:32:33 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Wed, 15 Feb
 2023 09:32:32 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004a3be8d77-d206-4c11-b508-2f9c0e1fed71,
 38A6E00C82B2D95FDD0C44CB66D888AEA19A4E6B) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <9dacf24f-3797-591b-b2af-ae08a0c01259@kaod.org>
Date: Wed, 15 Feb 2023 09:32:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 0/8] aspeed: I2C fixes, -drive removal (first step)
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <qemu-block@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Peter
 Maydell <peter.maydell@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>
References: <20230214171830.681594-1-clg@kaod.org>
 <87fsb7e8m3.fsf@pond.sub.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <87fsb7e8m3.fsf@pond.sub.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: d5627bf4-d0e5-4dda-aa8e-20caec2860a2
X-Ovh-Tracer-Id: 10998071768709630828
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudeigedguddulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegrrhhmsghruhesrhgvughhrghtrdgtohhmpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhqvghmuhdqsghlohgtkhesnhhonhhgnhhurdhorhhgpdhjohgvlhesjhhmshdrihgurdgruhdprghnughrvgifsegrjhdrihgurdgruhdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdhphhhilhhmugeslhhinhgrrhhordhorhhgpdfovfetjfhoshhtpehmohehhedvpdhmohguvgepshhmthhpoh
 huth
Received-SPF: pass client-ip=178.33.43.201; envelope-from=clg@kaod.org;
 helo=4.mo552.mail-out.ovh.net
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.35,
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

On 2/15/23 07:38, Markus Armbruster wrote:
> Cédric Le Goater <clg@kaod.org> writes:
> 
>> Hello,
>>
>> This series starts with a first set of patches fixing I2C slave mode
>> in the Aspeed I2C controller, a test device and its associated test in
>> avocado.
>>
>> Follow some cleanups which allow the use of block devices instead of
>> drives. So that, instead of specifying :
>>
>>    -drive file=./flash-ast2600-evb,format=raw,if=mtd
>>    -drive file=./ast2600-evb.pnor,format=raw,if=mtd
>>    ...
>>
>> and guessing from the order which bus the device is attached to, we
>> can use :
>>
>>    -blockdev node-name=fmc0,driver=file,filename=./bmc.img
>>    -device mx66u51235f,bus=ssi.0,drive=fmc0
>>    -blockdev node-name=fmc1,driver=file,filename=./bmc-alt.img
>>    -device mx66u51235f,bus=ssi.0,drive=fmc1
>>    -blockdev node-name=pnor,driver=file,filename=./pnor
>>    -device mx66l1g45g,bus=ssi.1,drive=pnor
>>    ...
>>
>> It is not perfect, the CS index still depends on the order, but it is
>> now possible to run a machine without -drive ...,if=mtd.
> 
> Lovely!
> 
> Does this cover all uses of IF_MTD, or only some?

All use for default devices in the aspeed machines. I think most
machines use IF_MTD in a similar way.

Yet, one extra use of IF_MTD is to fill a ROM region with the first
drive contents. It avoids fetching instructions from the SPI flash
mapping and speeds up boot quite significantly.

Once the default flash devices are created and attached to their
drive, it is possible to query the block backend without the
drive_get() API. I have a couple of patches for it and it shouldn't
be a problem.
  
>> This lacks the final patch enabling the '-nodefaults' option by not
>> creating the default devices if specified on the command line. It
>> needs some more evaluation of the possible undesired effects.
> 
> Are you thinking of something similar to the default CD-ROM, i.e. use
> default_list to have -device suppress a certain kind of default devices,
> and also have -nodefaults suppress them all?

I would have -nodefaults suppress all flash devices. There are also
I2C devices but they are less problematic for the machine definition.
(Well, eeprom contents can be complex to handle)

The next step would be to get rid of the drive_get(IF_MTD) internal
API, which means finding a way to attach block backend devices from
the command line to the default flash devices. This should be done
at machine init time and the blockdev should have some 'bus@addr'
identifier. I lack the knowledge on how this could be done.

Thanks,

C.

  



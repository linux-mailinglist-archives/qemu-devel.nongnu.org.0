Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F93562AFE
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 07:45:36 +0200 (CEST)
Received: from localhost ([::1]:52158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o79TC-0002aF-Vb
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 01:45:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o79NS-0008I3-EE
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 01:39:45 -0400
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:42621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o79N1-0006Xl-KY
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 01:39:36 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.128])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id D58301133030B;
 Fri,  1 Jul 2022 07:39:02 +0200 (CEST)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 1 Jul 2022
 07:39:02 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0014d15a621-ed1b-4246-81e6-bfa7fd7e8250,
 D594F7ECFE8920C5FAE37748FDFD57525B476B5E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <dbb1f6f2-6e20-576f-3fb2-12c6596c404c@kaod.org>
Date: Fri, 1 Jul 2022 07:39:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 14/14] hw/arm/aspeed: Add oby35-cl machine
Content-Language: en-US
To: Peter Delevoryas <me@pjd.dev>
CC: <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joel@jms.id.au>,
 <cminyard@mvista.com>, <titusr@google.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, <zhdaniel@fb.com>
References: <20220630045133.32251-1-me@pjd.dev>
 <20220630045133.32251-15-me@pjd.dev>
 <24f848a7-3b3e-9125-bedd-dedc1460a8f0@kaod.org>
 <Yr3I8euDuh4PI7O8@pdel-mbp.dhcp.thefacebook.com>
 <a11a443d-a97c-3e62-008d-8faa37b55875@kaod.org>
 <Yr4sj17nYgG4WwI/@pdel-mbp.dhcp.thefacebook.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <Yr4sj17nYgG4WwI/@pdel-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: e94948bb-2b5d-4ca5-bc7c-79c2702604a2
X-Ovh-Tracer-Id: 9833046839299640111
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 17
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudehvddguddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecufghrlhcuvffnffculddujedmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejgefggffgheejgfdufeeiueffveehteejgfelueekgfegtefgffejhedtgfejgfenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopeiihhgurghnihgvlhesfhgsrdgtohhmpdfovfetjfhoshhtpehmohehvdel
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 7/1/22 01:06, Peter Delevoryas wrote:
> On Thu, Jun 30, 2022 at 06:42:52PM +0200, Cédric Le Goater wrote:
>> On 6/30/22 18:15, Peter Delevoryas wrote:
>>> On Thu, Jun 30, 2022 at 01:02:54PM +0200, Cédric Le Goater wrote:
>>>> On 6/30/22 06:51, Peter Delevoryas wrote:
>>>>> From: Peter Delevoryas <pdel@fb.com>
>>>>>
>>>>> The fby35 machine includes 4 server boards, each of which has a "bridge
>>>>> interconnect" (BIC). This chip abstracts the pinout for the server board
>>>>> into a single endpoint that the baseboard management controller (BMC)
>>>>> can talk to using IPMB.
>>>>>
>>>>> This commit adds a machine for testing the BIC on the server board. It
>>>>> runs OpenBIC (https://github.com/facebook/openbic) and the server board
>>>>> is called CraterLake, so the code name is oby35-cl. There's also a
>>>>> variant of the baseboard that replaces the BMC with a BIC, but that
>>>>> machine is not included here.
>>>>>
>>>>> A test image can be built from https://github.com/facebook/openbic using
>>>>> the instructions in the README.md to build the meta-facebook/yv35-cl
>>>>> recipe, or retrieved from my Github:
>>>>>
>>>>>        wget https://github.com/peterdelevoryas/OpenBIC/releases/download/oby35-cl-2022.17.01/Y35BCL.elf
>>>>>
>>>>> And you can run this machine with the following command:
>>>>>
>>>>>        qemu-system-arm -machine oby35-cl -nographic -kernel Y35BCL.elf
>>>>>
>>>>> It should produce output like the following:
>>>>>
>>>>>        [00:00:00.005,000] <inf> usb_dc_aspeed: select ep[0x81] as IN endpoint
>>>>>        [00:00:00.006,000] <inf> usb_dc_aspeed: select ep[0x82] as IN endpoint
>>>>>        [00:00:00.006,000] <wrn> usb_dc_aspeed: pre-selected ep[0x1] as IN endpoint
>>>>>        [00:00:00.006,000] <wrn> usb_dc_aspeed: pre-selected ep[0x2] as IN endpoint
>>>>>        [00:00:00.006,000] <inf> usb_dc_aspeed: select ep[0x3] as OUT endpoint
>>>>>        *** Booting Zephyr OS build v00.01.05  ***
>>>>>        Hello, welcome to yv35 craterlake 2022.25.1
>>>>>        BIC class type(class-1), 1ou present status(0), 2ou present status(0), board revision(0x1)
>>>>>        check_vr_type: i2c4 0x62 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
>>>>>        check_vr_type: i2c4 0x76 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
>>>>>        check_vr_type: i2c4 0x76 page 1 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
>>>>>        check_vr_type: i2c4 0x60 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
>>>>>        check_vr_type: i2c4 0x60 page 1 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
>>>>>        check_vr_type: i2c4 0x62 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
>>>>>        check_vr_type: i2c4 0x76 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
>>>>>        check_vr_type: i2c4 0x76 page 1 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
>>>>>        check_vr_type: i2c4 0x60 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
>>>>>        check_vr_type: i2c4 0x60 page 1 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
>>>>>        check_vr_type: i2c4 0x62 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
>>>>>        check_vr_type: i2c4 0x76 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
>>>>>        check_vr_type: i2c4 0x76 page 1 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
>>>>>        check_vr_type: i2c4 0x60 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
>>>>>        check_vr_type: i2c4 0x60 page 1 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
>>>>>        check_vr_type: i2c4 0x62 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
>>>>>        check_vr_type: i2c4 0x76 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
>>>>>        check_vr_type: i2c4 0x76 page 1 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
>>>>>        check_vr_type: i2c4 0x60 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
>>>>>        check_vr_type: i2c4 0x60 page 1 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
>>>>>        [init_drive_type] sensor 0x14 post sensor read failed!
>>>>>
>>>>>        [init_drive_type] sensor 0x30 post sensor read failed!
>>>>>        [init_drive_type] sensor 0x39 post sensor read failed!
>>>>>        ipmi_init
>>>>>        [set_DC_status] gpio number(15) status(0)
>>>>>        [set_post_status] gpio number(1) status(1)
>>>>>        uart:~$ [00:00:01.010,000] <inf> kcs_aspeed: KCS3: addr=0xca2, idr=0x2c, odr=0x38, str=0x44
>>>>>
>>>>>        [00:00:01.016,000] <err> spi_nor_multi_dev: [1216][spi1_cs0]SFDP magic 00000000 invalid
>>>>>        [00:00:01.016,000] <err> spi_nor_multi_dev: [1456]SFDP read failed: -22
>>>>>        [00:00:01.010,000] <inf> kcs_aspeed: KCS3: addr=0xca2, idr=0x2c, odr=0x38, str=0x44
>>>>>
>>>>>        [00:00:01.016,000] <err> spi_nor_multi_dev: [1216][spi1_cs0]SFDP magic 00000000 invalid
>>>>>        [00:00:01.016,000] <err> spi_nor_multi_dev: [1456]SFDP read failed: -22
>>>>>        uart:~$ BIC Ready
>>>>>
>>>>> Signed-off-by: Peter Delevoryas <pdel@fb.com>
>>>>
>>>> LGTM.
>>>>
>>>> That said I would prefer to introduce the machine first and then
>>>> populate with devices.
>>>
>>> Ohh ok, I'll submit the machine definition separately all by itself and then
>>> submit any extra devices like the CPLD or ME afterwards.
>>
>> I have kept the "full system" in my tree for now :
>>
>>    cb4481ae1812 aspeed: Add AST2600 (BMC) to fby35  (full system)
>>    c155bf27d3e7 aspeed: Make aspeed_board_init_flashes public (trivial)
>>    3f5485fa88b9 aspeed: Add fby35 skeleton  (trivial)
>>
>> because the ROM vs. execute-in-place is being analyzed. Let's see if
>> we can make progress and simplify the initial machine.
>>
>> I have also kept the latest *fby35* emulating the BIC only :
>>
>>    5cfc4b68fdb8 hw/arm/aspeed: Add oby35-cl machine
>>    06f21e024ee7 hw/misc/aspeed: Add intel-me
>>    e96a23571599 hw/misc/aspeed: Add fby35-sb-cpld
>>
>> to discuss a bit more on the names, files, IPMI, etc. Until now, we had
>> Aspeed machines modeling EVBs or BMCs. BICs and multi SoC system are new.
> 
> Oh shoot, I just remembered, the oby35-cl machine won't work without the VR
> patches.

They look ready for upstream now.

C.


> 
> I know the pull request you just made didn't include it, just a reminder. I was
> worried that maybe it had been submitted somewhere.
> 
>>
>> Having a review on the common models in 8-10 would be nice.
>>
>>    2a9be57901a3 hw/sensor: Add Renesas ISL69259 device model
>>    85f8352e213a hw/sensor: Add IC_DEVICE_ID to ISL voltage regulators
>>    aea568d56db5 hw/i2c/pmbus: Add idle state to return 0xff's
>>
>> They should not be too problematic to merge. As soon as Titus has time
>> to take a look we will know, and I did a comment. So this can be addressed
>> in parallel with the fby35 machines.
>>
>> Thanks,
>>
>> C.
>>
>>
>>
>>>
>>>>
>>>> May be it is time to introduce a new machine file. This one seems
>>>> like it could go in a f35.c file, also because a larger f35-* is
>>>> in plan. aspeed.c could contain the basic definitions and helpers.
>>>
>>> Yes, patrick@stwcx.xyz was thinking the same thing. An f35.c (well,
>>> maybe yv35.c or fby35.c would be more appropriate) would be a good
>>> idea. I'll submit another patch up front to move fby35 stuff to
>>> a separate file.
>>>
>>>>
>>>>> ---
>>>>>     hw/arm/aspeed.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
>>>>>     1 file changed, 48 insertions(+)
>>>>>
>>>>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>>>>> index a06f7c1b62..75971ef2ca 100644
>>>>> --- a/hw/arm/aspeed.c
>>>>> +++ b/hw/arm/aspeed.c
>>>>> @@ -1429,6 +1429,50 @@ static void aspeed_minibmc_machine_ast1030_evb_class_init(ObjectClass *oc,
>>>>>         amc->macs_mask = 0;
>>>>>     }
>>>>> +static void oby35_cl_i2c_init(AspeedMachineState *bmc)
>>>>> +{
>>>>> +    AspeedSoCState *soc = &bmc->soc;
>>>>> +    I2CBus *i2c[14];
>>>>> +    I2CBus *ssd[8];
>>>>> +    int i;
>>>>> +
>>>>> +    for (i = 0; i < 14; i++) {
>>>>> +        i2c[i] = aspeed_i2c_get_bus(&soc->i2c, i);
>>>>> +    }
>>>>> +    get_pca9548_channels(i2c[1], 0x71, ssd);
>>>>
>>>> We should rename to aspeed_get_pca9548_channels
>>>
>>> +1
>>>
>>>>
>>>>> +
>>>>> +    i2c_slave_create_simple(i2c[0], "fby35-sb-cpld", 0x21);
>>>>> +    i2c_slave_create_simple(i2c[1], "tmp105", 0x48);
>>>>> +    i2c_slave_create_simple(i2c[1], "tmp105", 0x49);
>>>>> +    i2c_slave_create_simple(i2c[1], "tmp105", 0x4a);
>>>>> +    i2c_slave_create_simple(i2c[1], "adm1272", 0x40);
>>>>> +    i2c_slave_create_simple(i2c[1], "tmp421", 0x4c);
>>>>> +    i2c_slave_create_simple(i2c[2], "intel-me", 0x16);
>>>>> +    i2c_slave_create_simple(i2c[4], "isl69259", 0x76);
>>>>> +    i2c_slave_create_simple(i2c[4], "isl69259", 0x62);
>>>>> +    i2c_slave_create_simple(i2c[4], "isl69259", 0x60);
>>>>> +
>>>>> +    for (int i = 0; i < 8; i++) {
>>>>> +        i2c_slave_create_simple(ssd[i], "tmp105", 0x6a);
>>>>> +    }
>>>>> +
>>>>> +    /*
>>>>> +     * FIXME: This should actually be the BMC, but both the ME and the BMC
>>>>
>>>> QEMU has an embedded IPMI BMC simulator.
>>>
>>>
>>> !!! Didn't realize this, definitely going to try using it.
>>>
>>>>
>>>>> +     * are IPMB endpoints, and the current ME implementation is generic
>>>>> +     * enough to respond normally to some things.
>>>>> +     */
>>>>> +    i2c_slave_create_simple(i2c[6], "intel-me", 0x10);
>>>>> +}
>>>>> +
>>>>> +static void aspeed_machine_oby35_cl_class_init(ObjectClass *oc, void *data)
>>>>> +{
>>>>> +    MachineClass *mc = MACHINE_CLASS(oc);
>>>>> +    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
>>>>> +
>>>>> +    mc->desc = "Meta Platforms fby35 CraterLake BIC (Cortex-M4)";
>>>>> +    amc->i2c_init = oby35_cl_i2c_init;
>>>>> +}
>>>>> +
>>>>>     static const TypeInfo aspeed_machine_types[] = {
>>>>>         {
>>>>>             .name          = MACHINE_TYPE_NAME("palmetto-bmc"),
>>>>> @@ -1494,6 +1538,10 @@ static const TypeInfo aspeed_machine_types[] = {
>>>>>             .name           = MACHINE_TYPE_NAME("ast1030-evb"),
>>>>>             .parent         = TYPE_ASPEED_MACHINE,
>>>>>             .class_init     = aspeed_minibmc_machine_ast1030_evb_class_init,
>>>>> +    }, {
>>>>> +        .name          = MACHINE_TYPE_NAME("oby35-cl"),
>>>>> +        .parent        = MACHINE_TYPE_NAME("ast1030-evb"),
>>>>
>>>> hmm, so we are inheriting from the evb ?
>>>
>>> Yeah, I remember this was controversial with fby35-bmc too, maybe I'll
>>> change this in the follow-up. I just like inheriting from the EVB's because
>>> people use the EVB's a lot for testing, most of the time I'm just trying to
>>> add some extra i2c devices/etc, so I override the i2c init. But, maybe it's
>>> good to decouple them.
>>>
>>>>
>>>> C.
>>>>
>>>>
>>>>> +        .class_init    = aspeed_machine_oby35_cl_class_init,
>>>>>         }, {
>>>>>             .name          = TYPE_ASPEED_MACHINE,
>>>>>             .parent        = TYPE_MACHINE,
>>>>
>>
>>



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5D754060E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 19:34:26 +0200 (CEST)
Received: from localhost ([::1]:48804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyd60-0007KN-M6
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 13:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nyd4B-0006Pp-3M; Tue, 07 Jun 2022 13:32:31 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:57263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nyd48-0001wJ-4T; Tue, 07 Jun 2022 13:32:30 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.109])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id C16F110883CE0;
 Tue,  7 Jun 2022 19:32:15 +0200 (CEST)
Received: from kaod.org (37.59.142.107) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 7 Jun 2022
 19:32:13 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S0013f56a9fe-e4e8-4b64-b0cb-32386039e059,
 B3A9F5ABA359FFEAA5F192A1B4EC97B2EEB111D0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <567f9a16-9ebc-0140-5137-378f6923968d@kaod.org>
Date: Tue, 7 Jun 2022 19:32:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 02/21] aspeed: i2c: Add ctrl_global_rsvd property
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
CC: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Joe Komlodi <komlodi@google.com>,
 Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>, Klaus Jensen <k.jensen@samsung.com>,
 Peter Delevoryas <pdel@fb.com>, Corey Minyard <cminyard@mvista.com>, Jonathan
 Cameron <Jonathan.Cameron@huawei.com>, Damien Hedde
 <damien.hedde@greensocs.com>, Andrew Jeffery <andrew@aj.id.au>, Cleber Rosa
 <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>, Beraldo
 Leal <bleal@redhat.com>
References: <20220606150732.2282041-1-clg@kaod.org>
 <20220606150732.2282041-3-clg@kaod.org>
 <CACPK8Xe_9octsmpZwbGQFpYijgVWyED_n1UjXxjUj-fDRHdp1Q@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CACPK8Xe_9octsmpZwbGQFpYijgVWyED_n1UjXxjUj-fDRHdp1Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 7df6c07e-7525-4083-9ece-e8599fda4a62
X-Ovh-Tracer-Id: 10060760093656386506
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedruddthedguddugecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghlvggrlhesrhgvughhrghtrdgtohhmpdfovfetjfhoshhtpehmohehvdel
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
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

Hello Joe,

On 6/7/22 02:05, Joel Stanley wrote:
> On Mon, 6 Jun 2022 at 15:08, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> From: Joe Komlodi <komlodi@google.com>
>>
>> The Aspeed I2C controller is used across other SKUs that have different
>> reserved bits for the ctrl_global_rsvd register.
> 
> I think rsvd stands for reserved? Lets spell out the full name in the
> variable to keep it clear.
> 
> You could also call global_control_mask (or ctrl_global_mask if you
> prefer), as it's a mask of valid bits.
> 
>>
>> Signed-off-by: Joe Komlodi <komlodi@google.com>
>> Change-Id: I606c5933c527274a9d2b0afe559b2e895767636c
>> Message-Id: <20220331043248.2237838-3-komlodi@google.com>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   include/hw/i2c/aspeed_i2c.h | 2 ++
>>   hw/arm/aspeed_ast2600.c     | 2 ++
>>   hw/i2c/aspeed_i2c.c         | 4 ++++
>>   3 files changed, 8 insertions(+)
>>
>> diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
>> index 4b9be09274c7..3912fcc3ff53 100644
>> --- a/include/hw/i2c/aspeed_i2c.h
>> +++ b/include/hw/i2c/aspeed_i2c.h
>> @@ -71,6 +71,8 @@ struct AspeedI2CState {
>>       MemoryRegion pool_iomem;
>>       uint8_t pool[ASPEED_I2C_MAX_POOL_SIZE];
>>
>> +    uint32_t ctrl_global_rsvd;
>> +
>>       AspeedI2CBus busses[ASPEED_I2C_NR_BUSSES];
>>       MemoryRegion *dram_mr;
>>       AddressSpace dram_as;
>> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
>> index b0a4199b6960..cc57c8b437d8 100644
>> --- a/hw/arm/aspeed_ast2600.c
>> +++ b/hw/arm/aspeed_ast2600.c
>> @@ -375,6 +375,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>>       aspeed_soc_uart_init(s);
>>
>>       /* I2C */
>> +    object_property_set_int(OBJECT(&s->i2c), "ctrl-global-rsvd", 0xfffc3e00,
>> +                            &error_abort);
>>       object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr),
>>                                &error_abort);
>>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->i2c), errp)) {
>> diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
>> index 03a4f5a91010..97eb9d57929c 100644
>> --- a/hw/i2c/aspeed_i2c.c
>> +++ b/hw/i2c/aspeed_i2c.c
>> @@ -648,6 +648,7 @@ static void aspeed_i2c_ctrl_write(void *opaque, hwaddr offset,
>>
>>       switch (offset) {
>>       case I2C_CTRL_GLOBAL:
>> +        value &= ~s->ctrl_global_rsvd;
> 
> Is there value in printing a guest error when the reserved bits are set?
> 
> If not, is it worth having this property at all? It doesn't affect the
> ability to model it.


Could you tell us more about the 0xfffc3e00 value. It doesn't match
any documents I have access to. If it is for a specific board, then
it should be added to QEMU. We can keep the property to begin with,
if that helps

Thanks,

C.


> 
>>           s->ctrl_global = value;
>>           break;
>>       case I2C_CTRL_STATUS:
>> @@ -730,6 +731,7 @@ static const VMStateDescription aspeed_i2c_vmstate = {
>>       .minimum_version_id = 2,
>>       .fields = (VMStateField[]) {
>>           VMSTATE_UINT32(intr_status, AspeedI2CState),
>> +        VMSTATE_UINT32(ctrl_global_rsvd, AspeedI2CState),
>>           VMSTATE_STRUCT_ARRAY(busses, AspeedI2CState,
>>                                ASPEED_I2C_NR_BUSSES, 1, aspeed_i2c_bus_vmstate,
>>                                AspeedI2CBus),
>> @@ -828,6 +830,8 @@ static void aspeed_i2c_realize(DeviceState *dev, Error **errp)
>>   static Property aspeed_i2c_properties[] = {
>>       DEFINE_PROP_LINK("dram", AspeedI2CState, dram_mr,
>>                        TYPE_MEMORY_REGION, MemoryRegion *),
>> +    DEFINE_PROP_UINT32("ctrl-global-rsvd", AspeedI2CState, ctrl_global_rsvd,
>> +                       0xfffffffe),
>>       DEFINE_PROP_END_OF_LIST(),
>>   };
>>
>> --
>> 2.35.3
>>



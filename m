Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F1A671680
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 09:49:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI47k-0007Wn-Fg; Wed, 18 Jan 2023 03:48:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pI47Z-0007V3-Py; Wed, 18 Jan 2023 03:48:40 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pI47W-0003Pu-AL; Wed, 18 Jan 2023 03:48:36 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.129])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 2C91815578915;
 Wed, 18 Jan 2023 09:48:27 +0100 (CET)
Received: from kaod.org (37.59.142.99) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Wed, 18 Jan
 2023 09:48:26 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003035bdb01-f3b8-4bec-94e4-e4a29f055b29,
 B02C0E203F6A6AD140F658F33EDEBE178EEACDD3) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <2b704c4b-e09f-222d-463f-b20768ea1aba@kaod.org>
Date: Wed, 18 Jan 2023 09:48:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 02/11] hw/watchdog/wdt_aspeed: Extend MMIO range to
 cover more registers
Content-Language: en-US
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
To: "Dong, Eddie" <eddie.dong@intel.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Joel Stanley <joel@jms.id.au>, Troy Lee <troy_lee@aspeedtech.com>, Beraldo
 Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos
 Santos Moschetta <wainersm@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, Peter Delevoryas
 <peter@pjd.dev>, Steven Lee <steven_lee@aspeedtech.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Peter Delevoryas <pdel@fb.com>, Peter Delevoryas
 <pdel@meta.com>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Cleber Rosa
 <crosa@redhat.com>
References: <20221230113504.37032-1-philmd@linaro.org>
 <20221230113504.37032-3-philmd@linaro.org>
 <BL0PR11MB30427F00C5A2058197E9B6488AF19@BL0PR11MB3042.namprd11.prod.outlook.com>
 <19cb9a03-c98e-cdff-1474-2db0c55ae971@kaod.org>
In-Reply-To: <19cb9a03-c98e-cdff-1474-2db0c55ae971@kaod.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 15d38386-7b26-421d-ac9e-cc1a929fb0c8
X-Ovh-Tracer-Id: 12851865963407444807
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedruddtjedguddvjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuhffvvehfjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeeuheekffefvefgueeiuddugeevfeefjedvjeevfedtjeeltdevfefhtdefuedtnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegvugguihgvrdguohhnghesihhnthgvlhdrtghomhdpphguvghlsehmvghtrgdrtghomhdpphguvghlsehfsgdrtghomhdpjhgrmhhinhgplhhinhesrghsphgvvgguthgvtghhrdgtohhmpdhsthgvvhgvnhgplhgvvgesrghsphgvvgguthgvtghhrdgtohhmpdhpvghtvghrsehpjhgurdguvghvpdgthhhinhdqthhinhhgpghkuhhosegrshhpvggvughtvggthhdrtghomhdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdprg
 hnughrvgifsegrjhdrihgurdgruhdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdgslhgvrghlsehrvgguhhgrthdrtghomhdpthhrohihpghlvggvsegrshhpvggvughtvggthhdrtghomhdpjhhovghlsehjmhhsrdhiugdrrghupdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhphhhilhhmugeslhhinhgrrhhordhorhhgpdifrghinhgvrhhsmhesrhgvughhrghtrdgtohhmpdgtrhhoshgrsehrvgguhhgrthdrtghomhdpoffvtefjohhsthepmhhohedvledpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.097,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Philippe,

On 1/2/23 14:31, Cédric Le Goater wrote:
> On 12/31/22 23:52, Dong, Eddie wrote:
>>> When booting the Zephyr demo in [1] we get:
>>>
>>>    aspeed.io: unimplemented device write (size 4, offset 0x185128, value
>>> 0x030f1ff1) <--
>>>    aspeed.io: unimplemented device write (size 4, offset 0x18512c, value
>>> 0x03fffff1)
>>>
>>> This corresponds to this Zephyr code [2]:
>>>
>>>    static int aspeed_wdt_init(const struct device *dev)
>>>    {
>>>      const struct aspeed_wdt_config *config = dev->config;
>>>      struct aspeed_wdt_data *const data = dev->data;
>>>      uint32_t reg_val;
>>>
>>>      /* disable WDT by default */
>>>      reg_val = sys_read32(config->ctrl_base + WDT_CTRL_REG);
>>>      reg_val &= ~WDT_CTRL_ENABLE;
>>>      sys_write32(reg_val, config->ctrl_base + WDT_CTRL_REG);
>>>
>>>      sys_write32(data->rst_mask1,
>>>                  config->ctrl_base + WDT_SW_RESET_MASK1_REG);   <------
>>>      sys_write32(data->rst_mask2,
>>>                  config->ctrl_base + WDT_SW_RESET_MASK2_REG);
>>>
>>>      return 0;
>>>    }
>>>
>>> The register definitions are [3]:
>>>
>>>    #define WDT_RELOAD_VAL_REG          0x0004
>>>    #define WDT_RESTART_REG             0x0008
>>>    #define WDT_CTRL_REG                0x000C
>>>    #define WDT_TIMEOUT_STATUS_REG      0x0010
>>>    #define WDT_TIMEOUT_STATUS_CLR_REG  0x0014
>>>    #define WDT_RESET_MASK1_REG         0x001C
>>>    #define WDT_RESET_MASK2_REG         0x0020
>>>    #define WDT_SW_RESET_MASK1_REG      0x0028   <------
>>>    #define WDT_SW_RESET_MASK2_REG      0x002C
>>>    #define WDT_SW_RESET_CTRL_REG       0x0024
>>>
>>> Currently QEMU only cover a MMIO region of size 0x20:
>>>
>>>    #define ASPEED_WDT_REGS_MAX        (0x20 / 4)
>>>
>>> Change to map the whole 'iosize' which might be bigger, covering the other
>>
>> The root cause is that ASPEED_WDT_REGS_MAX is too small, right?
>> Probably the Qemu is emulating an old version of the hardware.
>>
>> Given the meaning of ASPEED_WDT_REGS_MAX, it should be larger than iosize, not?
>> Probably ASPEED_WDT_REGS_MAX should be per device type (aspeed_2400/2500),
> 
> yes. We would need a new class attribute for it. Please use these values, they
> should be correct.
> 
>             #regs    iosize
> 
> AST2400   0x18/4      0x20
> AST2500   0x20/4      0x20
> AST2600   0x30/4      0x40
> AST1030   0x4C/4      0x80
> 

That might be a big change for the next respin. If you don't have time, we can
make adjustments later. May be add a TODO with the above values ?

Thanks,

C.

  


> AFAICT, the WDT logic was changed in a compatible way with the previous generation.
> 
> Thanks
> 
> C.
> 
>> while iosize is for all devices, and its initial value comes from the per device type REGS_MAX.
>>
>>> registers. The MemoryRegionOps read/write handlers will report the accesses
>>> as out-of-bounds guest-errors, but the next commit will report them as
>>> unimplemented.
>>>
>>> [1] https://github.com/AspeedTech-BMC/zephyr/releases/tag/v00.01.07
>>> [2] https://github.com/AspeedTech-BMC/zephyr/commit/2e99f10ac27b
>>> [3] https://github.com/AspeedTech-
>>> BMC/zephyr/blob/v00.01.08/drivers/watchdog/wdt_aspeed.c#L31
>>>
>>> Reviewed-by: Peter Delevoryas <peter@pjd.dev>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>   hw/watchdog/wdt_aspeed.c | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c index
>>> 958725a1b5..eefca31ae4 100644
>>> --- a/hw/watchdog/wdt_aspeed.c
>>> +++ b/hw/watchdog/wdt_aspeed.c
>>> @@ -260,6 +260,7 @@ static void aspeed_wdt_realize(DeviceState *dev,
>>> Error **errp)  {
>>>       SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>>>       AspeedWDTState *s = ASPEED_WDT(dev);
>>> +    AspeedWDTClass *awc = ASPEED_WDT_GET_CLASS(dev);
>>>
>>>       assert(s->scu);
>>>
>>> @@ -271,7 +272,7 @@ static void aspeed_wdt_realize(DeviceState *dev,
>>> Error **errp)
>>>       s->pclk_freq = PCLK_HZ;
>>>
>>>       memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_wdt_ops, s,
>>> -                          TYPE_ASPEED_WDT, ASPEED_WDT_REGS_MAX * 4);
>>> +                          TYPE_ASPEED_WDT, awc->iosize);
>>>       sysbus_init_mmio(sbd, &s->iomem);
>>>   }
>>>
>>> -- 
>>> 2.38.1
>>>
>>
> 



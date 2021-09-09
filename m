Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA5E40503D
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 14:36:24 +0200 (CEST)
Received: from localhost ([::1]:57704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOJHz-00066j-Am
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 08:36:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mOJEq-0003tm-Hn; Thu, 09 Sep 2021 08:33:08 -0400
Received: from smtpout1.mo3005.mail-out.ovh.net ([79.137.123.220]:35849
 helo=smtpout1.3005.mail-out.ovh.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mOJEo-0007LQ-52; Thu, 09 Sep 2021 08:33:08 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.11])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id 121C913EFD1;
 Thu,  9 Sep 2021 12:33:01 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 9 Sep
 2021 14:33:01 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G00616caeb49-d78e-428f-8d88-7c3b0d3e2a4b,
 71690547EA7DDBCF94B8ED6B48C1704BA445499A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH 01/10] aspeed/smc: Add watchdog Control/Status Registers
To: Peter Delevoryas <pdel@fb.com>
References: <20210907065822.1152443-1-clg@kaod.org>
 <20210907065822.1152443-2-clg@kaod.org>
 <632B8EA3-1A9E-46A9-A930-7ADD2C25F154@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <b51993b2-ad15-b3ee-4c0a-e704a0710c07@kaod.org>
Date: Thu, 9 Sep 2021 14:33:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <632B8EA3-1A9E-46A9-A930-7ADD2C25F154@fb.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: f48a847a-8fba-464f-ab6a-513c7b87d563
X-Ovh-Tracer-Id: 18373842057316830057
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudefledgheegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehpuggvlhesfhgsrdgtohhm
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.3005.mail-out.ovh.net
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.975,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 Cameron Esfahani via <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/8/21 8:46 PM, Peter Delevoryas wrote:
> 
> 
>> On Sep 6, 2021, at 11:58 PM, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> The Aspeed SoCs have a dual boot function for firmware fail-over
>> recovery. The system auto-reboots from the second flash if the main
>> flash does not boot sucessfully within a certain amount of time. This
>> function is called alternate boot (ABR) in the FMC controllers.
>>
>> On AST2400/AST2500, ABR is enabled by hardware strapping in SCU70 to
>> enable the 2nd watchdog timer, on AST2600, through register SCU510.
>> If the boot on the the main flash succeeds, the firmware should
>> disable the 2nd watchdog timer. If not, the BMC is reset and the CE0
>> and CE1 mappings are swapped to restart the BMC from the 2nd flash.
>>
>> On the AST2600, the registers controlling the 2nd watchdog timer were
>> moved from the watchdog register to the FMC controller. Add simple
>> read/write handlers for these to let the FW disable the 2nd watchdog
>> without error.
>>
>> Reported-by: Peter Delevoryas <pdel@fb.com>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>> hw/ssi/aspeed_smc.c | 16 ++++++++++++++++
>> 1 file changed, 16 insertions(+)
>>
>> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
>> index 331a2c544635..c9990f069ea4 100644
>> --- a/hw/ssi/aspeed_smc.c
>> +++ b/hw/ssi/aspeed_smc.c
>> @@ -124,6 +124,13 @@
>> /* SPI dummy cycle data */
>> #define R_DUMMY_DATA      (0x54 / 4)
>>
>> +/* FMC_WDT2 Control/Status Register for Alternate Boot (AST2600) */
>> +#define R_FMC_WDT2_CTRL   (0x64 / 4)
>> +#define   FMC_WDT2_CTRL_ALT_BOOT_MODE    BIT(6) /* O: 2 chips 1: 1 chip */
>> +#define   FMC_WDT2_CTRL_SINGLE_BOOT_MODE BIT(5)
>> +#define   FMC_WDT2_CTRL_BOOT_SOURCE      BIT(4) /* O: primary 1: alternate */
>> +#define   FMC_WDT2_CTRL_EN               BIT(0)
>> +
>> /* DMA Control/Status Register */
>> #define R_DMA_CTRL        (0x80 / 4)
>> #define   DMA_CTRL_REQUEST      (1 << 31)
>> @@ -263,12 +270,18 @@ static void aspeed_2600_smc_dma_ctrl(AspeedSMCState *s, uint32_t value);
>>
>> #define ASPEED_SMC_FEATURE_DMA       0x1
>> #define ASPEED_SMC_FEATURE_DMA_GRANT 0x2
>> +#define ASPEED_SMC_FEATURE_WDT_CONTROL 0x4
>>
>> static inline bool aspeed_smc_has_dma(const AspeedSMCState *s)
>> {
>>     return !!(s->ctrl->features & ASPEED_SMC_FEATURE_DMA);
>> }
>>
>> +static inline bool aspeed_smc_has_wdt_control(const AspeedSMCState *s)
>> +{
>> +    return !!(s->ctrl->features & ASPEED_SMC_FEATURE_WDT_CONTROL);
>> +}
>> +
>> static const AspeedSMCController controllers[] = {
>>     {
>>         .name              = "aspeed.smc-ast2400",
>> @@ -1019,6 +1032,7 @@ static uint64_t aspeed_smc_read(void *opaque, hwaddr addr, unsigned int size)
>>         addr == R_CE_CMD_CTRL ||
>>         addr == R_INTR_CTRL ||
>>         addr == R_DUMMY_DATA ||
>> +        (aspeed_smc_has_wdt_control(s) && addr == R_FMC_WDT2_CTRL) ||
>>         (aspeed_smc_has_dma(s) && addr == R_DMA_CTRL) ||
>>         (aspeed_smc_has_dma(s) && addr == R_DMA_FLASH_ADDR) ||
>>         (aspeed_smc_has_dma(s) && addr == R_DMA_DRAM_ADDR) ||
>> @@ -1350,6 +1364,8 @@ static void aspeed_smc_write(void *opaque, hwaddr addr, uint64_t data,
>>         s->regs[addr] = value & 0xff;
>>     } else if (addr == R_DUMMY_DATA) {
>>         s->regs[addr] = value & 0xff;
>> +    } else if (aspeed_smc_has_wdt_control(s) && addr == R_FMC_WDT2_CTRL) {
>> +        s->regs[addr] = value & 0xb;
>>     } else if (addr == R_INTR_CTRL) {
>>         s->regs[addr] = value;
>>     } else if (aspeed_smc_has_dma(s) && addr == R_DMA_CTRL) {
>> -- 
>> 2.31.1
>>
> 
> Looks good to me!
> 
> Reviewed-by: Peter Delevoryas <pdel@fb.com>
> 
> One thing: should we enable this feature (ASPEED_SMC_FEATURE_WDT_CONTROL)
> on any of the SMC controller models? I wanted to test this with the
> Fuji image and machine type I added, and I needed the following diff
> to enable this:

Ah yes. It fell through the cracks with PATCH 04 "aspeed/smc: Drop 
AspeedSMCController structure" which moves a lot of code around. I will
add it back in the next spin.

> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index 331a2c5446..b5d835d488 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -388,7 +388,7 @@ static const AspeedSMCController controllers[] = {
>          .segments          = aspeed_segments_ast2600_fmc,
>          .flash_window_base = ASPEED26_SOC_FMC_FLASH_BASE,
>          .flash_window_size = 0x10000000,
> -        .features          = ASPEED_SMC_FEATURE_DMA,
> +        .features          = ASPEED_SMC_FEATURE_DMA | ASPEED_SMC_FEATURE_WDT_CONTROL,
>          .dma_flash_mask    = 0x0FFFFFFC,
>          .dma_dram_mask     = 0x3FFFFFFC,
>          .nregs             = ASPEED_SMC_R_MAX,
> 
> Without this, Fuji would try to clear BIT(0) of R_FMC_WDT2_CTRL,
> but then the default aspeed_smc_read() value would return 0xFFFFFFF.
> 
> Error: unable to disable the 2nd watchdog: FMC_WDT2=0xFFFFFFFF
> 
> And then with these changes added, the writes and reads work
> so that BIT(0) appears to have been cleared:
> 
> Disabled the 2nd watchdog (FMC_WDT2) successfully.
> 
> root@bmc-oob:~# devmem 0x1e620064
> 0x00000000
> root@bmc-oob:~# devmem 0x1e620064 32 0xffffffff
> root@bmc-oob:~# devmem 0x1e620064
> 0x0000000B
> 
> I don’t totally understand why the mask for the register is 0xb though?

It is bogus. I changed it to : 

  s->regs[addr] = value & FMC_WDT2_CTRL_EN;

since we only care about the watchdog enablement status bit. So now : 

  root@bmc-oob:~# devmem 0x1e620064
  0x00000000
  root@bmc-oob:~# devmem 0x1e620064 32 0xffffffff
  root@bmc-oob:~# devmem 0x1e620064
  0x00000001


It would be interesting also to implement the WDT2 reset. We can link 
the WDT2 register memory region in the AST2600 FMC model to have the 
controls. We need to boot much faster else WDT2 will fire.

When merged, we can ask Peter for some help on understanding why it 
is so slow compared to the other AST2600 machines.  

The others FMC_WDT2 bits will need more work.

Thanks for the review and tests,

C.


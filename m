Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 376094F5A5F
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 11:59:44 +0200 (CEST)
Received: from localhost ([::1]:38552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc2Rz-0006dv-AJ
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 05:59:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nc2Q1-0005el-DB
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 05:57:42 -0400
Received: from 6.mo548.mail-out.ovh.net ([188.165.58.48]:38605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nc2Pz-000347-BJ
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 05:57:40 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.171])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 2D7DA21237;
 Wed,  6 Apr 2022 09:57:36 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 6 Apr
 2022 11:57:35 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002fa282546-d722-4839-842b-80131e22101d,
 0E2A66C590FA5C0A512BFD2BB471688DAC8686BD) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <68c152fe-8bc6-7c18-3e72-9d52738d5847@kaod.org>
Date: Wed, 6 Apr 2022 11:57:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH 2/7] aspeed: i2c: Add ctrl_global_rsvd property
Content-Language: en-US
To: Joe Komlodi <komlodi@google.com>, <qemu-devel@nongnu.org>
References: <20220331043248.2237838-1-komlodi@google.com>
 <20220331043248.2237838-3-komlodi@google.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220331043248.2237838-3-komlodi@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: dbaa3a03-616c-47e3-95bc-2c947521b93b
X-Ovh-Tracer-Id: 7210263004828175142
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudejiedgvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehvvghnthhurhgvsehgohhoghhlvgdrtghomh
Received-SPF: pass client-ip=188.165.58.48; envelope-from=clg@kaod.org;
 helo=6.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: andrew@aj.id.au, peter.maydell@linaro.org, joel@jms.id.au,
 venture@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Joe,

On 3/31/22 06:32, Joe Komlodi wrote:
> The Aspeed I2C controller is used across other SKUs that have different
> reserved bits for the ctrl_global_rsvd register.

So some AST2600 SoCs can not set the new/old modes and the clock divider ?
  

> Signed-off-by: Joe Komlodi <komlodi@google.com>
> Change-Id: I606c5933c527274a9d2b0afe559b2e895767636c
> ---
>   hw/arm/aspeed_ast2600.c     | 2 ++
>   hw/i2c/aspeed_i2c.c         | 4 ++++
>   include/hw/i2c/aspeed_i2c.h | 2 ++
>   3 files changed, 8 insertions(+)
> 
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index 43f8223139..9f14a35a75 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -344,6 +344,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>                      serial_hd(0), DEVICE_LITTLE_ENDIAN);
>   
>       /* I2C */
> +    object_property_set_int(OBJECT(&s->i2c), "ctrl-global-rsvd", 0xfffc3e00,
> +                            &error_abort);

Ideally, this should be set from a specific machine and not from the SoC
as it impacts all machines. One way to do this is to use an alias. See the
hw-strap1/2 properties.

Thanks,

C.

>       object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr),
>                                &error_abort);
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->i2c), errp)) {
> diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
> index 03a4f5a910..97eb9d5792 100644
> --- a/hw/i2c/aspeed_i2c.c
> +++ b/hw/i2c/aspeed_i2c.c
> @@ -648,6 +648,7 @@ static void aspeed_i2c_ctrl_write(void *opaque, hwaddr offset,
>   
>       switch (offset) {
>       case I2C_CTRL_GLOBAL:
> +        value &= ~s->ctrl_global_rsvd;
>           s->ctrl_global = value;
>           break;
>       case I2C_CTRL_STATUS:
> @@ -730,6 +731,7 @@ static const VMStateDescription aspeed_i2c_vmstate = {
>       .minimum_version_id = 2,
>       .fields = (VMStateField[]) {
>           VMSTATE_UINT32(intr_status, AspeedI2CState),
> +        VMSTATE_UINT32(ctrl_global_rsvd, AspeedI2CState),
>           VMSTATE_STRUCT_ARRAY(busses, AspeedI2CState,
>                                ASPEED_I2C_NR_BUSSES, 1, aspeed_i2c_bus_vmstate,
>                                AspeedI2CBus),
> @@ -828,6 +830,8 @@ static void aspeed_i2c_realize(DeviceState *dev, Error **errp)
>   static Property aspeed_i2c_properties[] = {
>       DEFINE_PROP_LINK("dram", AspeedI2CState, dram_mr,
>                        TYPE_MEMORY_REGION, MemoryRegion *),
> +    DEFINE_PROP_UINT32("ctrl-global-rsvd", AspeedI2CState, ctrl_global_rsvd,
> +                       0xfffffffe),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   
> diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
> index 4b9be09274..3912fcc3ff 100644
> --- a/include/hw/i2c/aspeed_i2c.h
> +++ b/include/hw/i2c/aspeed_i2c.h
> @@ -71,6 +71,8 @@ struct AspeedI2CState {
>       MemoryRegion pool_iomem;
>       uint8_t pool[ASPEED_I2C_MAX_POOL_SIZE];
>   
> +    uint32_t ctrl_global_rsvd;



> +
>       AspeedI2CBus busses[ASPEED_I2C_NR_BUSSES];
>       MemoryRegion *dram_mr;
>       AddressSpace dram_as;



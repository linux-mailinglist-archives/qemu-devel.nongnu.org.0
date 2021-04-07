Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB6A3574E6
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 21:24:10 +0200 (CEST)
Received: from localhost ([::1]:33978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUDmb-0007VG-6z
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 15:24:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <klaus@linux.vnet.ibm.com>)
 id 1lUDlB-0006YC-UG; Wed, 07 Apr 2021 15:22:41 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:4302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <klaus@linux.vnet.ibm.com>)
 id 1lUDl9-0001UF-Ko; Wed, 07 Apr 2021 15:22:41 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 137J3nvi092780; Wed, 7 Apr 2021 15:22:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=xuMKxekLP2HfZee202lrBxLdP9quDbPymDl8AVGhBsY=;
 b=GGs6JDhKnVZe0a0sEmQ8mWt0emSOviWq8I/AZFx6zectbJedyCvWu8vCGors8Tsy6avh
 x0lD8RhQthjcuuO85iwl3327akwK1HVp74Y5INHRyVMHnykhREremd+w9oSe3uLtYrJv
 8yGvTUEkEjEfc1tmQ1jW7vIb4rUYdUMMjcSbieKzL7ms09dqFA/1dBN+zvpaL6qYj8xB
 ytBKkGzO9AuwGmVlahjxmSm5LgQ/Qls84jis62RPHfX2QTufCg/Ee7434RpAif0MGcJX
 iAf7NA01qmCdhEoKFempe1PvABX9H1BRCRpwSjIUFgWvHrguXFhmlHuxfdPGj0Dj8UXt Og== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37rvpgkbb0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 15:22:30 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 137JHlmp005788;
 Wed, 7 Apr 2021 19:22:29 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04dal.us.ibm.com with ESMTP id 37rvc41p1y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 19:22:29 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 137JMSd316974084
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Apr 2021 19:22:28 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 427CA7805E;
 Wed,  7 Apr 2021 19:22:28 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 85BD078060;
 Wed,  7 Apr 2021 19:22:26 +0000 (GMT)
Received: from [9.80.221.20] (unknown [9.80.221.20])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  7 Apr 2021 19:22:26 +0000 (GMT)
Subject: Re: [PATCH 07/24] aspeed: Integrate HACE
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210407171637.777743-1-clg@kaod.org>
 <20210407171637.777743-8-clg@kaod.org>
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Message-ID: <e4375f12-e736-b381-1a89-0d30ebecd434@linux.vnet.ibm.com>
Date: Wed, 7 Apr 2021 16:22:25 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210407171637.777743-8-clg@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: lJiIPERbJQAIyKf6nLICMi-kkeMWkUwB
X-Proofpoint-GUID: lJiIPERbJQAIyKf6nLICMi-kkeMWkUwB
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-07_10:2021-04-07,
 2021-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1011 malwarescore=0
 suspectscore=0 bulkscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104070130
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=klaus@linux.vnet.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/7/2021 2:16 PM, Cédric Le Goater wrote:
> From: Joel Stanley <joel@jms.id.au>
> 
> Add the hash and crypto engine model to the Aspeed socs.
> 
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Message-Id: <20210324070955.125941-3-joel@jms.id.au>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Reviewed-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>

> ---
>   docs/system/arm/aspeed.rst  |  2 +-
>   include/hw/arm/aspeed_soc.h |  3 +++
>   hw/arm/aspeed_ast2600.c     | 15 +++++++++++++++
>   hw/arm/aspeed_soc.c         | 16 ++++++++++++++++
>   4 files changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
> index d1fb8f25b39c..f9466e6d8245 100644
> --- a/docs/system/arm/aspeed.rst
> +++ b/docs/system/arm/aspeed.rst
> @@ -49,6 +49,7 @@ Supported devices
>    * Ethernet controllers
>    * Front LEDs (PCA9552 on I2C bus)
>    * LPC Peripheral Controller (a subset of subdevices are supported)
> + * Hash/Crypto Engine (HACE) - Hash support only, no scatter-gather
>   
>   
>   Missing devices
> @@ -59,7 +60,6 @@ Missing devices
>    * PWM and Fan Controller
>    * Slave GPIO Controller
>    * Super I/O Controller
> - * Hash/Crypto Engine
>    * PCI-Express 1 Controller
>    * Graphic Display Controller
>    * PECI Controller
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index 9359d6da336d..d9161d26d645 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -21,6 +21,7 @@
>   #include "hw/rtc/aspeed_rtc.h"
>   #include "hw/i2c/aspeed_i2c.h"
>   #include "hw/ssi/aspeed_smc.h"
> +#include "hw/misc/aspeed_hace.h"
>   #include "hw/watchdog/wdt_aspeed.h"
>   #include "hw/net/ftgmac100.h"
>   #include "target/arm/cpu.h"
> @@ -50,6 +51,7 @@ struct AspeedSoCState {
>       AspeedTimerCtrlState timerctrl;
>       AspeedI2CState i2c;
>       AspeedSCUState scu;
> +    AspeedHACEState hace;
>       AspeedXDMAState xdma;
>       AspeedSMCState fmc;
>       AspeedSMCState spi[ASPEED_SPIS_NUM];
> @@ -133,6 +135,7 @@ enum {
>       ASPEED_DEV_XDMA,
>       ASPEED_DEV_EMMC,
>       ASPEED_DEV_KCS,
> +    ASPEED_DEV_HACE,
>   };
>   
>   #endif /* ASPEED_SOC_H */
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index 2a1255b6a042..e0fbb020c770 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -42,6 +42,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] = {
>       [ASPEED_DEV_ETH2]      = 0x1E680000,
>       [ASPEED_DEV_ETH4]      = 0x1E690000,
>       [ASPEED_DEV_VIC]       = 0x1E6C0000,
> +    [ASPEED_DEV_HACE]      = 0x1E6D0000,
>       [ASPEED_DEV_SDMC]      = 0x1E6E0000,
>       [ASPEED_DEV_SCU]       = 0x1E6E2000,
>       [ASPEED_DEV_XDMA]      = 0x1E6E7000,
> @@ -102,6 +103,7 @@ static const int aspeed_soc_ast2600_irqmap[] = {
>       [ASPEED_DEV_I2C]       = 110,   /* 110 -> 125 */
>       [ASPEED_DEV_ETH1]      = 2,
>       [ASPEED_DEV_ETH2]      = 3,
> +    [ASPEED_DEV_HACE]      = 4,
>       [ASPEED_DEV_ETH3]      = 32,
>       [ASPEED_DEV_ETH4]      = 33,
>       [ASPEED_DEV_KCS]       = 138,   /* 138 -> 142 */
> @@ -213,6 +215,9 @@ static void aspeed_soc_ast2600_init(Object *obj)
>                               TYPE_SYSBUS_SDHCI);
>   
>       object_initialize_child(obj, "lpc", &s->lpc, TYPE_ASPEED_LPC);
> +
> +    snprintf(typename, sizeof(typename), "aspeed.hace-%s", socname);
> +    object_initialize_child(obj, "hace", &s->hace, typename);
>   }
>   
>   /*
> @@ -494,6 +499,16 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_4,
>                          qdev_get_gpio_in(DEVICE(&s->a7mpcore),
>                                   sc->irqmap[ASPEED_DEV_KCS] + aspeed_lpc_kcs_4));
> +
> +    /* HACE */
> +    object_property_set_link(OBJECT(&s->hace), "dram", OBJECT(s->dram_mr),
> +                             &error_abort);
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->hace), errp)) {
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->hace), 0, sc->memmap[ASPEED_DEV_HACE]);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->hace), 0,
> +                       aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
>   }
>   
>   static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 817f3ba63dfd..8ed29113f79f 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -34,6 +34,7 @@ static const hwaddr aspeed_soc_ast2400_memmap[] = {
>       [ASPEED_DEV_VIC]    = 0x1E6C0000,
>       [ASPEED_DEV_SDMC]   = 0x1E6E0000,
>       [ASPEED_DEV_SCU]    = 0x1E6E2000,
> +    [ASPEED_DEV_HACE]   = 0x1E6E3000,
>       [ASPEED_DEV_XDMA]   = 0x1E6E7000,
>       [ASPEED_DEV_VIDEO]  = 0x1E700000,
>       [ASPEED_DEV_ADC]    = 0x1E6E9000,
> @@ -65,6 +66,7 @@ static const hwaddr aspeed_soc_ast2500_memmap[] = {
>       [ASPEED_DEV_VIC]    = 0x1E6C0000,
>       [ASPEED_DEV_SDMC]   = 0x1E6E0000,
>       [ASPEED_DEV_SCU]    = 0x1E6E2000,
> +    [ASPEED_DEV_HACE]   = 0x1E6E3000,
>       [ASPEED_DEV_XDMA]   = 0x1E6E7000,
>       [ASPEED_DEV_ADC]    = 0x1E6E9000,
>       [ASPEED_DEV_VIDEO]  = 0x1E700000,
> @@ -117,6 +119,7 @@ static const int aspeed_soc_ast2400_irqmap[] = {
>       [ASPEED_DEV_ETH2]   = 3,
>       [ASPEED_DEV_XDMA]   = 6,
>       [ASPEED_DEV_SDHCI]  = 26,
> +    [ASPEED_DEV_HACE]   = 4,
>   };
>   
>   #define aspeed_soc_ast2500_irqmap aspeed_soc_ast2400_irqmap
> @@ -212,6 +215,9 @@ static void aspeed_soc_init(Object *obj)
>       }
>   
>       object_initialize_child(obj, "lpc", &s->lpc, TYPE_ASPEED_LPC);
> +
> +    snprintf(typename, sizeof(typename), "aspeed.hace-%s", socname);
> +    object_initialize_child(obj, "hace", &s->hace, typename);
>   }
>   
>   static void aspeed_soc_realize(DeviceState *dev, Error **errp)
> @@ -421,6 +427,16 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>   
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_4,
>                          qdev_get_gpio_in(DEVICE(&s->lpc), aspeed_lpc_kcs_4));
> +
> +    /* HACE */
> +    object_property_set_link(OBJECT(&s->hace), "dram", OBJECT(s->dram_mr),
> +                             &error_abort);
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->hace), errp)) {
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->hace), 0, sc->memmap[ASPEED_DEV_HACE]);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->hace), 0,
> +                       aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
>   }
>   static Property aspeed_soc_properties[] = {
>       DEFINE_PROP_LINK("dram", AspeedSoCState, dram_mr, TYPE_MEMORY_REGION,
> 

-- 
Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>


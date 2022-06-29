Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D517955FAE0
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 10:44:38 +0200 (CEST)
Received: from localhost ([::1]:33052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6TJN-00074f-Vp
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 04:44:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o6TFp-00041p-Nl
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 04:40:57 -0400
Received: from 4.mo552.mail-out.ovh.net ([178.33.43.201]:58893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o6TFm-0008FE-Dd
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 04:40:56 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.51])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 2ED1E27239;
 Wed, 29 Jun 2022 08:40:52 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 29 Jun
 2022 10:40:51 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004651db29f-ad64-40a5-b95d-5bdee338c6c6,
 74A1F81DE4F8936248B5873BB0AED4007818FEC6) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <c4c261e9-8f17-578c-8e45-e64ced8e0685@kaod.org>
Date: Wed, 29 Jun 2022 10:40:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 09/13] hw/i2c/pmbus: Add read-only IC_DEVICE_ID support
Content-Language: en-US
To: Peter Delevoryas <peterdelevoryas@gmail.com>
CC: <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joel@jms.id.au>,
 <cminyard@mvista.com>, <titusr@google.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, <zhdaniel@fb.com>, <pdel@fb.com>
References: <20220629033634.3850922-1-pdel@fb.com>
 <20220629033634.3850922-10-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220629033634.3850922-10-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: bdb0f9f5-4332-423a-93ec-353848d3dd51
X-Ovh-Tracer-Id: 1158551006875782066
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgtdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelleeiiefgkeefiedtvdeigeetueetkeffkeelheeugfetteegvdekgfehgffgkeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehpuggvlhesfhgsrdgtohhmpdfovfetjfhoshhtpehmohehhedv
Received-SPF: pass client-ip=178.33.43.201; envelope-from=clg@kaod.org;
 helo=4.mo552.mail-out.ovh.net
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

On 6/29/22 05:36, Peter Delevoryas wrote:
> Signed-off-by: Peter Delevoryas <pdel@fb.com>

This is also adding a "Renesas ISL69259 Digital Multiphase Voltage
Regulator" device. There should be 2 patches.

Thanks,

C.



> ---
>   hw/i2c/pmbus_device.c            |  5 +++++
>   hw/sensor/isl_pmbus_vr.c         | 31 +++++++++++++++++++++++++++++++
>   include/hw/i2c/pmbus_device.h    |  1 +
>   include/hw/sensor/isl_pmbus_vr.h |  1 +
>   4 files changed, 38 insertions(+)
> 
> diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
> index efddc36fd9..82131fff85 100644
> --- a/hw/i2c/pmbus_device.c
> +++ b/hw/i2c/pmbus_device.c
> @@ -984,6 +984,11 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
>           }
>           break;
>   
> +    case PMBUS_IC_DEVICE_ID:
> +        pmbus_send(pmdev, pmdev->pages[index].ic_device_id,
> +                   sizeof(pmdev->pages[index].ic_device_id));
> +        break;
> +
>       case PMBUS_CLEAR_FAULTS:              /* Send Byte */
>       case PMBUS_PAGE_PLUS_WRITE:           /* Block Write-only */
>       case PMBUS_STORE_DEFAULT_ALL:         /* Send Byte */
> diff --git a/hw/sensor/isl_pmbus_vr.c b/hw/sensor/isl_pmbus_vr.c
> index e11e028884..b12c46ab6d 100644
> --- a/hw/sensor/isl_pmbus_vr.c
> +++ b/hw/sensor/isl_pmbus_vr.c
> @@ -218,6 +218,28 @@ static void isl_pmbus_vr_class_init(ObjectClass *klass, void *data,
>       k->device_num_pages = pages;
>   }
>   
> +static void isl69259_init(Object *obj)
> +{
> +    static const uint8_t ic_device_id[] = {0x04, 0x00, 0x81, 0xD2, 0x49};
> +    PMBusDevice *pmdev = PMBUS_DEVICE(obj);
> +    int i;
> +
> +    raa22xx_init(obj);
> +    for (i = 0; i < pmdev->num_pages; i++) {
> +        memcpy(pmdev->pages[i].ic_device_id, ic_device_id,
> +               sizeof(ic_device_id));
> +    }
> +}
> +
> +static void isl69259_class_init(ObjectClass *klass, void *data)
> +{
> +    ResettableClass *rc = RESETTABLE_CLASS(klass);
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    dc->desc = "Renesas ISL69259 Digital Multiphase Voltage Regulator";
> +    rc->phases.exit = isl_pmbus_vr_exit_reset;
> +    isl_pmbus_vr_class_init(klass, data, 2);
> +}
> +
>   static void isl69260_class_init(ObjectClass *klass, void *data)
>   {
>       ResettableClass *rc = RESETTABLE_CLASS(klass);
> @@ -245,6 +267,14 @@ static void raa229004_class_init(ObjectClass *klass, void *data)
>       isl_pmbus_vr_class_init(klass, data, 2);
>   }
>   
> +static const TypeInfo isl69259_info = {
> +    .name = TYPE_ISL69259,
> +    .parent = TYPE_PMBUS_DEVICE,
> +    .instance_size = sizeof(ISLState),
> +    .instance_init = isl69259_init,
> +    .class_init = isl69259_class_init,
> +};
> +
>   static const TypeInfo isl69260_info = {
>       .name = TYPE_ISL69260,
>       .parent = TYPE_PMBUS_DEVICE,
> @@ -271,6 +301,7 @@ static const TypeInfo raa228000_info = {
>   
>   static void isl_pmbus_vr_register_types(void)
>   {
> +    type_register_static(&isl69259_info);
>       type_register_static(&isl69260_info);
>       type_register_static(&raa228000_info);
>       type_register_static(&raa229004_info);
> diff --git a/include/hw/i2c/pmbus_device.h b/include/hw/i2c/pmbus_device.h
> index 0f4d6b3fad..aed7809841 100644
> --- a/include/hw/i2c/pmbus_device.h
> +++ b/include/hw/i2c/pmbus_device.h
> @@ -407,6 +407,7 @@ typedef struct PMBusPage {
>       uint16_t mfr_max_temp_1;           /* R/W word */
>       uint16_t mfr_max_temp_2;           /* R/W word */
>       uint16_t mfr_max_temp_3;           /* R/W word */
> +    uint8_t ic_device_id[16];          /* Read-Only block-read */
>   } PMBusPage;
>   
>   /* State */
> diff --git a/include/hw/sensor/isl_pmbus_vr.h b/include/hw/sensor/isl_pmbus_vr.h
> index 3e47ff7e48..d501b3bc82 100644
> --- a/include/hw/sensor/isl_pmbus_vr.h
> +++ b/include/hw/sensor/isl_pmbus_vr.h
> @@ -12,6 +12,7 @@
>   #include "hw/i2c/pmbus_device.h"
>   #include "qom/object.h"
>   
> +#define TYPE_ISL69259   "isl69259"
>   #define TYPE_ISL69260   "isl69260"
>   #define TYPE_RAA228000  "raa228000"
>   #define TYPE_RAA229004  "raa229004"



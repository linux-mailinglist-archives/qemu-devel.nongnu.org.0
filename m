Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5A8419210
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 12:15:01 +0200 (CEST)
Received: from localhost ([::1]:35822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUnf2-0006tz-4M
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 06:15:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mUnTm-0001SG-JD
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 06:03:22 -0400
Received: from 8.mo548.mail-out.ovh.net ([46.105.45.231]:60245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mUnTk-000405-60
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 06:03:22 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.33])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id E32E120CE7;
 Mon, 27 Sep 2021 10:03:07 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 27 Sep
 2021 12:03:06 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0014caccf49-6597-4aa1-a040-fa40e8469cd9,
 7A1C2730502A6E1581EB46D208322E62E5328AE4) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <b16f6405-72cf-144b-975e-98cda77604ab@kaod.org>
Date: Mon, 27 Sep 2021 12:03:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] hw: Add a 'Sensor devices' qdev category
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 <qemu-devel@nongnu.org>
References: <20210926221518.1726267-1-f4bug@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20210926221518.1726267-1-f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 271c2659-ff00-4ab7-a1ae-b2e826a0886a
X-Ovh-Tracer-Id: 10870282126463110075
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudejkedgvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepleejtddvueelgfekleefheehvdevuefgkeeggffftdejueduhfekieekieffffevnecuffhomhgrihhnpegsvggrlhgvtghorhhnvghrrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepphgsohhniihinhhisehrvgguhhgrthdrtghomh
Received-SPF: pass client-ip=46.105.45.231; envelope-from=clg@kaod.org;
 helo=8.mo548.mail-out.ovh.net
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.478,
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
Cc: Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Titus Rwantare <titusr@google.com>,
 Hao Wu <wuhaotsh@google.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, John Wang <wangzhiqiang.bj@bytedance.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/27/21 00:15, Philippe Mathieu-Daudé wrote:
> Sensors models are listed in the 'Misc devices' category.
> Move them to their own category.
> 
> For the devices in the hw/sensor/ directory, the category
> is obvious.
> 
> hw/arm/z2.c models the AER915 model which is described
> on [*] as:
> 
>    The 14-pin chip marked AER915 just below the expansion
>    port is a 80C51-type microcontroller, similar to Philips
>    P89LPC915. It has an 8-bit A/D which is used to determine
>    which of six buttons are pressed on the resistor-network
>    wired remote.  It communicates with the main cpu via I2C.
> 
> It was introduced in commit 3bf11207c06 ("Add support for
> Zipit Z2 machine") with this comment:
> 
>    248 static uint8_t aer915_recv(I2CSlave *slave)
>    249 {
>    ...
>    253     switch (s->buf[0]) {
>    254     /* Return hardcoded battery voltage,
>    255      * 0xf0 means ~4.1V
>    256      */
>    257     case 0x02:
>    258         retval = 0xf0;
>    259         break;
> 
> For QEMU the AER915 is a very simple sensor model.
> 
> [*] https://www.bealecorner.org/best/measure/z2/index.html
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Cédric Le Goater <clg@kaod.org>


> ---
>   include/hw/qdev-core.h | 1 +
>   hw/arm/z2.c            | 1 +
>   hw/sensor/adm1272.c    | 1 +
>   hw/sensor/dps310.c     | 1 +
>   hw/sensor/emc141x.c    | 1 +
>   hw/sensor/max34451.c   | 2 ++
>   hw/sensor/tmp105.c     | 1 +
>   hw/sensor/tmp421.c     | 1 +
>   softmmu/qdev-monitor.c | 1 +
>   9 files changed, 10 insertions(+)
> 
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index 34c8a7506a1..f6241212247 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -26,6 +26,7 @@ typedef enum DeviceCategory {
>       DEVICE_CATEGORY_SOUND,
>       DEVICE_CATEGORY_MISC,
>       DEVICE_CATEGORY_CPU,
> +    DEVICE_CATEGORY_SENSOR,
>       DEVICE_CATEGORY_MAX
>   } DeviceCategory;
>   
> diff --git a/hw/arm/z2.c b/hw/arm/z2.c
> index 9c1e876207b..62db9741106 100644
> --- a/hw/arm/z2.c
> +++ b/hw/arm/z2.c
> @@ -288,6 +288,7 @@ static void aer915_class_init(ObjectClass *klass, void *data)
>       k->recv = aer915_recv;
>       k->send = aer915_send;
>       dc->vmsd = &vmstate_aer915_state;
> +    set_bit(DEVICE_CATEGORY_SENSOR, dc->categories);
>   }
>   
>   static const TypeInfo aer915_info = {
> diff --git a/hw/sensor/adm1272.c b/hw/sensor/adm1272.c
> index 7310c769be2..2942ac75f90 100644
> --- a/hw/sensor/adm1272.c
> +++ b/hw/sensor/adm1272.c
> @@ -518,6 +518,7 @@ static void adm1272_class_init(ObjectClass *klass, void *data)
>       DeviceClass *dc = DEVICE_CLASS(klass);
>       PMBusDeviceClass *k = PMBUS_DEVICE_CLASS(klass);
>   
> +    set_bit(DEVICE_CATEGORY_SENSOR, dc->categories);
>       dc->desc = "Analog Devices ADM1272 Hot Swap controller";
>       dc->vmsd = &vmstate_adm1272;
>       k->write_data = adm1272_write_data;
> diff --git a/hw/sensor/dps310.c b/hw/sensor/dps310.c
> index d60a18ac41b..1e24a499b38 100644
> --- a/hw/sensor/dps310.c
> +++ b/hw/sensor/dps310.c
> @@ -208,6 +208,7 @@ static void dps310_class_init(ObjectClass *klass, void *data)
>       k->send = dps310_tx;
>       dc->reset = dps310_reset;
>       dc->vmsd = &vmstate_dps310;
> +    set_bit(DEVICE_CATEGORY_SENSOR, dc->categories);
>   }
>   
>   static const TypeInfo dps310_info = {
> diff --git a/hw/sensor/emc141x.c b/hw/sensor/emc141x.c
> index 7ce8f4e9794..4202d8f185a 100644
> --- a/hw/sensor/emc141x.c
> +++ b/hw/sensor/emc141x.c
> @@ -270,6 +270,7 @@ static void emc141x_class_init(ObjectClass *klass, void *data)
>       DeviceClass *dc = DEVICE_CLASS(klass);
>       I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
>   
> +    set_bit(DEVICE_CATEGORY_SENSOR, dc->categories);
>       dc->reset = emc141x_reset;
>       k->event = emc141x_event;
>       k->recv = emc141x_rx;
> diff --git a/hw/sensor/max34451.c b/hw/sensor/max34451.c
> index a91d8bd487c..8300bf4ff43 100644
> --- a/hw/sensor/max34451.c
> +++ b/hw/sensor/max34451.c
> @@ -751,6 +751,8 @@ static void max34451_class_init(ObjectClass *klass, void *data)
>       ResettableClass *rc = RESETTABLE_CLASS(klass);
>       DeviceClass *dc = DEVICE_CLASS(klass);
>       PMBusDeviceClass *k = PMBUS_DEVICE_CLASS(klass);
> +
> +    set_bit(DEVICE_CATEGORY_SENSOR, dc->categories);
>       dc->desc = "Maxim MAX34451 16-Channel V/I monitor";
>       dc->vmsd = &vmstate_max34451;
>       k->write_data = max34451_write_data;
> diff --git a/hw/sensor/tmp105.c b/hw/sensor/tmp105.c
> index 20564494899..43d79b9eeec 100644
> --- a/hw/sensor/tmp105.c
> +++ b/hw/sensor/tmp105.c
> @@ -305,6 +305,7 @@ static void tmp105_class_init(ObjectClass *klass, void *data)
>       DeviceClass *dc = DEVICE_CLASS(klass);
>       I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
>   
> +    set_bit(DEVICE_CATEGORY_SENSOR, dc->categories);
>       dc->realize = tmp105_realize;
>       k->event = tmp105_event;
>       k->recv = tmp105_rx;
> diff --git a/hw/sensor/tmp421.c b/hw/sensor/tmp421.c
> index a3db57dcb5a..c328978af9c 100644
> --- a/hw/sensor/tmp421.c
> +++ b/hw/sensor/tmp421.c
> @@ -343,6 +343,7 @@ static void tmp421_class_init(ObjectClass *klass, void *data)
>       I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
>       TMP421Class *sc = TMP421_CLASS(klass);
>   
> +    set_bit(DEVICE_CATEGORY_SENSOR, dc->categories);
>       dc->realize = tmp421_realize;
>       k->event = tmp421_event;
>       k->recv = tmp421_rx;
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 0705f008466..db56f328228 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -162,6 +162,7 @@ static void qdev_print_devinfos(bool show_no_user)
>           [DEVICE_CATEGORY_SOUND]   = "Sound",
>           [DEVICE_CATEGORY_MISC]    = "Misc",
>           [DEVICE_CATEGORY_CPU]     = "CPU",
> +        [DEVICE_CATEGORY_SENSOR]  = "Sensor",
>           [DEVICE_CATEGORY_MAX]     = "Uncategorized",
>       };
>       GSList *list, *elt;
> 



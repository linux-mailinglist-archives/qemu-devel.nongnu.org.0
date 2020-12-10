Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8831E2D589B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 11:52:20 +0100 (CET)
Received: from localhost ([::1]:45074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knJYZ-0004cT-2W
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 05:52:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1knJXB-0003nJ-MT; Thu, 10 Dec 2020 05:50:53 -0500
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:39207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1knJX9-00049H-UH; Thu, 10 Dec 2020 05:50:53 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.171])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id C00F8795D422;
 Thu, 10 Dec 2020 11:50:47 +0100 (CET)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 10 Dec
 2020 11:50:46 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G0068a724068-dc88-4184-bd71-7a8e057968c6,
 35DF0118C1BD2D4E469FA4C27706E890450E7B32) smtp.auth=clg@kaod.org
Subject: Re: [PATCH aspeed-5.2] aspeed: g220a-bmc: Add an FRU
To: John Wang <wangzhiqiang.bj@bytedance.com>, <xuxiaohan@bytedance.com>,
 <yulei.sh@bytedance.com>
References: <20201210103607.556-1-wangzhiqiang.bj@bytedance.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <a45faa74-2c4a-9f87-cbf2-d40ac7c49aa8@kaod.org>
Date: Thu, 10 Dec 2020 11:50:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201210103607.556-1-wangzhiqiang.bj@bytedance.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: aefdf6e4-623b-4528-83a2-17c07c5ff9a8
X-Ovh-Tracer-Id: 18268570414678182764
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudektddgvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopeifrghnghiihhhiqhhirghnghdrsghjsegshihtvggurghntggvrdgtohhm
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/20 11:36 AM, John Wang wrote:
> Add an eeprom device and fill it with fru
> information
> 
> $ ipmitool fru print 0
> Product Manufacturer  : Bytedance
> Product Name          : G220A
> 
> Signed-off-by: John Wang <wangzhiqiang.bj@bytedance.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C. 

> ---
>  hw/arm/aspeed.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 04c8ad2bcd..fc80d45513 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -595,6 +595,18 @@ static void g220a_bmc_i2c_init(AspeedMachineState *bmc)
>      object_property_set_int(OBJECT(dev), "temperature0", 31000, &error_abort);
>      object_property_set_int(OBJECT(dev), "temperature1", 28000, &error_abort);
>      object_property_set_int(OBJECT(dev), "temperature2", 20000, &error_abort);
> +
> +    static uint8_t eeprom_buf[2 * 1024] = {
> +            0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0xfe,
> +            0x01, 0x06, 0x00, 0xc9, 0x42, 0x79, 0x74, 0x65,
> +            0x64, 0x61, 0x6e, 0x63, 0x65, 0xc5, 0x47, 0x32,
> +            0x32, 0x30, 0x41, 0xc4, 0x41, 0x41, 0x42, 0x42,
> +            0xc4, 0x43, 0x43, 0x44, 0x44, 0xc4, 0x45, 0x45,
> +            0x46, 0x46, 0xc4, 0x48, 0x48, 0x47, 0x47, 0xc1,
> +            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xa7,
> +    };
> +    smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 4), 0x57,
> +                          eeprom_buf);
>  }
>  
>  static bool aspeed_get_mmio_exec(Object *obj, Error **errp)
> 



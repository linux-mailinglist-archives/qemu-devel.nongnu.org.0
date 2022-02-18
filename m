Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DC84BBEE9
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 19:03:07 +0100 (CET)
Received: from localhost ([::1]:54176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL7az-0000Ec-Qd
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 13:03:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nL7ZD-0007Py-1Y
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 13:01:15 -0500
Received: from 3.mo548.mail-out.ovh.net ([188.165.32.156]:44863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nL7ZB-0001jJ-0P
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 13:01:14 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.173])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 9CA2321101;
 Fri, 18 Feb 2022 18:01:05 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 18 Feb
 2022 19:01:04 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002ea735268-e1dc-41e9-83ba-ecf6fd7c75a2,
 2ADC5E975130A5AC73D526B447F5AC0F6E2F692A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <0c846bc5-8fab-4227-df0a-26587a7a6c3d@kaod.org>
Date: Fri, 18 Feb 2022 19:00:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 7/7] aspeed/sdmc: Add trace events
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20220218081815.641169-1-clg@kaod.org>
 <20220218081815.641169-8-clg@kaod.org>
 <194ed308-000a-2198-958c-27bea13b64ee@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <194ed308-000a-2198-958c-27bea13b64ee@amsat.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 8a4f7747-b878-47da-8740-af0f9bd4156d
X-Ovh-Tracer-Id: 16060117747390319398
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrkedtgddutdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruh
Received-SPF: pass client-ip=188.165.32.156; envelope-from=clg@kaod.org;
 helo=3.mo548.mail-out.ovh.net
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/18/22 18:56, Philippe Mathieu-Daudé wrote:
> On 18/2/22 09:18, Cédric Le Goater wrote:
>> This is useful to analyze changes in the U-Boot RAM driver when SDRAM
>> training is performed.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   hw/misc/aspeed_sdmc.c | 2 ++
>>   hw/misc/trace-events  | 4 ++++
>>   2 files changed, 6 insertions(+)
>>
>> diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
>> index 08f856cbda7e..d2a3931033b3 100644
>> --- a/hw/misc/aspeed_sdmc.c
>> +++ b/hw/misc/aspeed_sdmc.c
>> @@ -130,6 +130,7 @@ static uint64_t aspeed_sdmc_read(void *opaque, hwaddr addr, unsigned size)
>>           return 0;
>>       }
> 
>> +# aspeed_sdmc.c
>> +aspeed_sdmc_write(uint32_t reg, uint32_t data) "reg @0x%" PRIx32 " data: 0x%" PRIx32
>> +aspeed_sdmc_read(uint32_t reg, uint32_t data) "reg @0x%" PRIx32 " data: 0x%" PRIx32
> 
> I'm surprised by the uint32_t conversion, but why not.
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Indeed. I might change that.

Thanks !

C.


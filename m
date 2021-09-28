Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B222C41A8AB
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 08:08:35 +0200 (CEST)
Received: from localhost ([::1]:40588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mV6I5-0003Zc-TS
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 02:08:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mV6Gg-0002dd-Bs
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 02:07:06 -0400
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:48379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mV6Ge-0000K4-2P
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 02:07:06 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.206])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id D9516C0AEE6A;
 Tue, 28 Sep 2021 08:06:59 +0200 (CEST)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 28 Sep
 2021 08:06:59 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G0030eba1f4c-429d-4c09-acf9-5118a7b7d125,
 8E8CB80F4898FD5B70E1FE60FE919FF623030768) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <1e384ea8-5cb9-4c43-2435-d5194515b48a@kaod.org>
Date: Tue, 28 Sep 2021 08:06:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: Need to merge - QEMU patch for booting eMMC image for AST2600
 machine
Content-Language: en-US
To: Shitalkumar Gandhi <shitalkumar.gandhi@seagate.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, qemu-arm
 <qemu-arm@nongnu.org>
References: <SJ0PR20MB3643750F8FF71E838A750F9B9DA59@SJ0PR20MB3643.namprd20.prod.outlook.com>
 <38e08d56-00b2-8759-a729-4bb6a26e6cdd@amsat.org>
 <4b2c7f4f-f2b5-7990-bcdc-5f9fb19418b4@kaod.org>
 <SJ0PR20MB36433AFB78BA0BAF6DC537649DA79@SJ0PR20MB3643.namprd20.prod.outlook.com>
 <SJ0PR20MB3643126F9786CFBEA81D5D349DA79@SJ0PR20MB3643.namprd20.prod.outlook.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <SJ0PR20MB3643126F9786CFBEA81D5D349DA79@SJ0PR20MB3643.namprd20.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 70eff25b-704e-4441-8bf9-6b056547940d
X-Ovh-Tracer-Id: 12755038571340598124
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudejledguddttdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeetudfftdehvdduiefhudekudejgfegjedukeehudetieffvdefudfgleevhffftdenucffohhmrghinheptghishgtohdrtghomhdpghhithhhuhgsrdgtohhmpdhqvghmuhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.001,
 NICE_REPLY_A=-3.136, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Hao Wu <wuhaotsh@google.com>, Patrick Venture <venture@google.com>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Shitalkumar

On 9/27/21 20:55, Shitalkumar Gandhi wrote:
> Hi All,
> 
> Please let me know how to get this merged?

Have you read what is at end of this email ?

Thanks

C.

  
> Thanks,
> Shitalkumar
> ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
> *From:* Shitalkumar Gandhi <shitalkumar.gandhi@seagate.com>
> *Sent:* Monday, September 27, 2021 7:45 AM
> *To:* Cédric Le Goater <clg@kaod.org>; Philippe Mathieu-Daudé <f4bug@amsat.org>; qemu-devel@nongnu.org <qemu-devel@nongnu.org>; qemu-arm <qemu-arm@nongnu.org>
> *Cc:* Hao Wu <wuhaotsh@google.com>; Patrick Venture <venture@google.com>; Andrew Jeffery <andrew@aj.id.au>; Joel Stanley <joel@jms.id.au>
> *Subject:* Re: Need to merge - QEMU patch for booting eMMC image for AST2600 machine
> Yes, I have raised this.
> 
> https://secure-web.cisco.com/13Y5NFuOyUgdDUpPwn5OgA8NY1sIBiajir-UA3dTP1yJGRWy2THA4rAtsVnZgvUls637SkO3gba7qmnDzMaxpGKwioLHRH2wf1xefPAKWL8QzKFY4phI7X7oyU8rhzQaj5dwIgY_y_WgmTI8SDnnzBRgQ8R742s0fb89kXTBSexyXTLqSOW11D3kpi0OSLjADEWJ5u87lD25OUNSiSQIFBC6LGiiYQbD2oxDTFeForuIGaT5fpAiI6SYEfc2lBf2j8mjnP-w8K-t2if_hfV0tPeFcYebcRDXoovS10ww85LEADDvpRReejBwftxZK6b5_AgH2U6beeWJ4r-VOi9-2ZxMC6iHuIZ1RBM0gzCMZpRFxgJb2E44ETONZneg1HJheeiEqDqyoLVGqgQbCu8pOW2e9njyXPvG94ZC8uh4ZodtuPdFanbmvOb6cgic0tZ4Q/https%3A%2F%2Fgithub.com%2Fopenbmc%2Fopenbmc%2Fissues%2F3818 
> <https://secure-web.cisco.com/13Y5NFuOyUgdDUpPwn5OgA8NY1sIBiajir-UA3dTP1yJGRWy2THA4rAtsVnZgvUls637SkO3gba7qmnDzMaxpGKwioLHRH2wf1xefPAKWL8QzKFY4phI7X7oyU8rhzQaj5dwIgY_y_WgmTI8SDnnzBRgQ8R742s0fb89kXTBSexyXTLqSOW11D3kpi0OSLjADEWJ5u87lD25OUNSiSQIFBC6LGiiYQbD2oxDTFeForuIGaT5fpAiI6SYEfc2lBf2j8mjnP-w8K-t2if_hfV0tPeFcYebcRDXoovS10ww85LEADDvpRReejBwftxZK6b5_AgH2U6beeWJ4r-VOi9-2ZxMC6iHuIZ1RBM0gzCMZpRFxgJb2E44ETONZneg1HJheeiEqDqyoLVGqgQbCu8pOW2e9njyXPvG94ZC8uh4ZodtuPdFanbmvOb6cgic0tZ4Q/https%3A%2F%2Fgithub.com%2Fopenbmc%2Fopenbmc%2Fissues%2F3818>
> 
> BR,
> Shitalkumar
> ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
> *From:* Cédric Le Goater <clg@kaod.org>
> *Sent:* Monday, September 27, 2021 7:15 AM
> *To:* Philippe Mathieu-Daudé <f4bug@amsat.org>; Shitalkumar Gandhi <shitalkumar.gandhi@seagate.com>; qemu-devel@nongnu.org <qemu-devel@nongnu.org>; qemu-arm <qemu-arm@nongnu.org>
> *Cc:* Hao Wu <wuhaotsh@google.com>; Patrick Venture <venture@google.com>; Andrew Jeffery <andrew@aj.id.au>; Joel Stanley <joel@jms.id.au>
> *Subject:* Re: Need to merge - QEMU patch for booting eMMC image for AST2600 machine
> 
> This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
> 
> 
> Hello,
> 
> On 9/26/21 09:59, Philippe Mathieu-Daudé wrote:
>> Hi,
>>
>> On 9/25/21 19:07, Shitalkumar Gandhi via wrote:
>>> Hi,
>>>
>>> I am attaching a patch that will fix eMMC image booting on QEMU for
>>> AST2600 machine, without this patch it will be stuck after SPL saying,
>>> "booting from RAM".
>>>
>>> Please review and merge, thanks.
>>>
>>> Let me know in case of any concern.
>>
>> Thanks for your patch.
>>
>> Please look at how to submit patches here:
>> https://secure-web.cisco.com/1oJkyJ6o1FSjeLofNCk-SJBvHe8F5z4Gz5K8rDouTJuL6pWtzenJ1yE0imiWoNBJUx5BooSaYSkvQfHj1aTBxq2d7eD-xZyztLaT2DS20DjjENjFLA8jfhIXRN_hJPLa8vikrdvz9p60Jy7kojB3AJRD9ZzEL6NwZS2AZfc2ElH7-meAzFGLq-3qKResEOEwqEkMU5ocivYTBkJpgcJLPiR34MZr3ZUdMsFnYCLYImWZ9TxlbUyo742xmCDQdg-CM-GFhJm3h6Vu6t1b8LHALySrJqK4dUdKPfzYgkDmhH11RMEXwPNMW19QNF62MbxEDFcekCoClvnOYuRsoEjgnwJH-rJn9B-D54vVPbAhqsCkjjd8wBCwBCjbWuq2kovWRZC9hl7URdTe2-F3JVb2EItEsQBr52Wxc5D1D_tnuboaCIzn1osTeVB2_nJbwIIKc/https%3A%2F%2Fwiki.qemu.org%2FContribute%2FSubmitAPatch%23Submitting_your_Patches 
> <https://secure-web.cisco.com/1oJkyJ6o1FSjeLofNCk-SJBvHe8F5z4Gz5K8rDouTJuL6pWtzenJ1yE0imiWoNBJUx5BooSaYSkvQfHj1aTBxq2d7eD-xZyztLaT2DS20DjjENjFLA8jfhIXRN_hJPLa8vikrdvz9p60Jy7kojB3AJRD9ZzEL6NwZS2AZfc2ElH7-meAzFGLq-3qKResEOEwqEkMU5ocivYTBkJpgcJLPiR34MZr3ZUdMsFnYCLYImWZ9TxlbUyo742xmCDQdg-CM-GFhJm3h6Vu6t1b8LHALySrJqK4dUdKPfzYgkDmhH11RMEXwPNMW19QNF62MbxEDFcekCoClvnOYuRsoEjgnwJH-rJn9B-D54vVPbAhqsCkjjd8wBCwBCjbWuq2kovWRZC9hl7URdTe2-F3JVb2EItEsQBr52Wxc5D1D_tnuboaCIzn1osTeVB2_nJbwIIKc/https%3A%2F%2Fwiki.qemu.org%2FContribute%2FSubmitAPatch%23Submitting_your_Patches>
>>
>>> This patch has been added to boot eMMC image for AST2600 machine on
>>> QEMU.
>>>
>>> Run quemu as follows:
>>>
>>> ./qemu-system-arm -m 1G -M ast2600-evb -nographic -drive
>>> file=mmc-evb-ast2600.img,format=raw,if=sd,index=2
>>
>> What is index=2?
>>
>> Is this mmc-evb-ast2600.img image publicly available?
>>
>>> Tested: Booted AST2600 eMMC image on QEMU.
>>> Suggested-by:  <venture@google.com>
>>> Reviewed-by: Hao Wu <wuhaotsh@google.com>
>>> Reviewed-by: Cédric Le Goater <clg@kaod.org>
>>> Message-Id: <20210416162426.3217033-1-venture@google.com>
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> 
> I don't remember having reviewed or signed this patch.
> 
>>> ---
>>>   hw/arm/aspeed.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>>> index ba5f1dc5af..6a890adb83 100644
>>> --- a/hw/arm/aspeed.c
>>> +++ b/hw/arm/aspeed.c
>>> @@ -148,7 +148,7 @@ struct AspeedMachineState {
>>>           SCU_AST2400_HW_STRAP_BOOT_MODE(AST2400_SPI_BOOT))
>>>
>>>   /* AST2600 evb hardware value */
>>> -#define AST2600_EVB_HW_STRAP1 0x000000C0
>>> +#define AST2600_EVB_HW_STRAP1 (0x000000C0 |
>> AST26500_HW_STRAP_BOOT_SRC_EMMC)
>>
>> IIUC you are not implementing any eMMC code, simply faking the
>> controller can support eMMC, but the card is used in SD mode?
> 
> I think this is related to this issue :
> 
> https://secure-web.cisco.com/13Y5NFuOyUgdDUpPwn5OgA8NY1sIBiajir-UA3dTP1yJGRWy2THA4rAtsVnZgvUls637SkO3gba7qmnDzMaxpGKwioLHRH2wf1xefPAKWL8QzKFY4phI7X7oyU8rhzQaj5dwIgY_y_WgmTI8SDnnzBRgQ8R742s0fb89kXTBSexyXTLqSOW11D3kpi0OSLjADEWJ5u87lD25OUNSiSQIFBC6LGiiYQbD2oxDTFeForuIGaT5fpAiI6SYEfc2lBf2j8mjnP-w8K-t2if_hfV0tPeFcYebcRDXoovS10ww85LEADDvpRReejBwftxZK6b5_AgH2U6beeWJ4r-VOi9-2ZxMC6iHuIZ1RBM0gzCMZpRFxgJb2E44ETONZneg1HJheeiEqDqyoLVGqgQbCu8pOW2e9njyXPvG94ZC8uh4ZodtuPdFanbmvOb6cgic0tZ4Q/https%3A%2F%2Fgithub.com%2Fopenbmc%2Fopenbmc%2Fissues%2F3818 
> <https://secure-web.cisco.com/13Y5NFuOyUgdDUpPwn5OgA8NY1sIBiajir-UA3dTP1yJGRWy2THA4rAtsVnZgvUls637SkO3gba7qmnDzMaxpGKwioLHRH2wf1xefPAKWL8QzKFY4phI7X7oyU8rhzQaj5dwIgY_y_WgmTI8SDnnzBRgQ8R742s0fb89kXTBSexyXTLqSOW11D3kpi0OSLjADEWJ5u87lD25OUNSiSQIFBC6LGiiYQbD2oxDTFeForuIGaT5fpAiI6SYEfc2lBf2j8mjnP-w8K-t2if_hfV0tPeFcYebcRDXoovS10ww85LEADDvpRReejBwftxZK6b5_AgH2U6beeWJ4r-VOi9-2ZxMC6iHuIZ1RBM0gzCMZpRFxgJb2E44ETONZneg1HJheeiEqDqyoLVGqgQbCu8pOW2e9njyXPvG94ZC8uh4ZodtuPdFanbmvOb6cgic0tZ4Q/https%3A%2F%2Fgithub.com%2Fopenbmc%2Fopenbmc%2Fissues%2F3818>
> 
>> I'm surprised your guest is happy and boot that. If so, then
>> what is the point of announcing eMMC is supported if not used?
> It should work on the aspeed branches I maintain which include the
> emmc support but this is not for upstream.
> 
> 
> Some comments,
> 
> I don't think the AST2600 evb boots by default on emmc. I agree
> it's nice to have for tests and there are other ways to modify
> slightly the default behavior.
> 
> We could add a machine property to define the 'hw-strap1' register
> but it's a bit difficult to remember the value.
> 
> A custom '-boot' value setting the 'hw-strap1' for the AST2600
> machine seems a better alternative. We could merge such a change
> even if emmc is not ready.
> 
> Thanks,
> 
> C.
> 
> 
> 
> 
> 
> Seagate Internal
> 



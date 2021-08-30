Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 422483FB1AD
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 09:12:03 +0200 (CEST)
Received: from localhost ([::1]:37422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKbSc-0001jV-AX
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 03:12:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mKbRP-0008RA-9B
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 03:10:47 -0400
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229]:46897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mKbRN-0002HA-95
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 03:10:46 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.149])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 26728206AA;
 Mon, 30 Aug 2021 07:10:41 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 30 Aug
 2021 09:10:41 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004548c74c7-bed9-4080-9b73-ae44efe510d4,
 A410DCCBFF6448DFF799E1C977766415213BDB3F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Subject: Re: [PATCH 01/26] ppc: Add a POWER10 DD2 CPU
To: Greg Kurz <groug@kaod.org>
References: <20210809134547.689560-1-clg@kaod.org>
 <20210809134547.689560-2-clg@kaod.org> <20210820154026.614dd703@bahia.lan>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <44e00518-1bd6-35be-e246-89872379dcc0@kaod.org>
Date: Mon, 30 Aug 2021 09:10:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210820154026.614dd703@bahia.lan>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 523401de-4f03-4968-a2e4-1a240341c174
X-Ovh-Tracer-Id: 9543409085478374368
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddukedguddujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo548.mail-out.ovh.net
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.58,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/20/21 3:40 PM, Greg Kurz wrote:
> On Mon, 9 Aug 2021 15:45:22 +0200
> Cédric Le Goater <clg@kaod.org> wrote:
> 
>> The POWER10 DD2 CPU adds an extra LPCR[HAIL] bit. DD1 doesn't have
>> HAIL but since it does not break the modeling and that we don't plan
>> to support DD1, modify the LPCR mask of all the POWER10 family.
>>
> 
> Maybe consider dropping DD1 at some point then ?

Sure. I will send a little series addressing all your comments since
the initial patches have been merged.

Thanks,

C. 


> 
> Anyway,
> 
> Reviewed-by: Greg Kurz <groug@kaod.org>
> 
>> Setting the HAIL bit is a requirement to support the scv instruction
>> on PowerNV POWER10 platforms since glibc-2.33.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  target/ppc/cpu-models.h | 1 +
>>  target/ppc/cpu-models.c | 4 +++-
>>  target/ppc/cpu_init.c   | 3 +++
>>  3 files changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/ppc/cpu-models.h b/target/ppc/cpu-models.h
>> index fc5e21728d7e..095259275941 100644
>> --- a/target/ppc/cpu-models.h
>> +++ b/target/ppc/cpu-models.h
>> @@ -375,6 +375,7 @@ enum {
>>      CPU_POWERPC_POWER9_DD20        = 0x004E1200,
>>      CPU_POWERPC_POWER10_BASE       = 0x00800000,
>>      CPU_POWERPC_POWER10_DD1        = 0x00800100,
>> +    CPU_POWERPC_POWER10_DD20       = 0x00800200,
>>      CPU_POWERPC_970_v22            = 0x00390202,
>>      CPU_POWERPC_970FX_v10          = 0x00391100,
>>      CPU_POWERPC_970FX_v20          = 0x003C0200,
>> diff --git a/target/ppc/cpu-models.c b/target/ppc/cpu-models.c
>> index 87e4228614b0..4baa111713b0 100644
>> --- a/target/ppc/cpu-models.c
>> +++ b/target/ppc/cpu-models.c
>> @@ -776,6 +776,8 @@
>>                  "POWER9 v2.0")
>>      POWERPC_DEF("power10_v1.0",  CPU_POWERPC_POWER10_DD1,            POWER10,
>>                  "POWER10 v1.0")
>> +    POWERPC_DEF("power10_v2.0",  CPU_POWERPC_POWER10_DD20,           POWER10,
>> +                "POWER10 v2.0")
>>  #endif /* defined (TARGET_PPC64) */
>>  
>>  /***************************************************************************/
>> @@ -952,7 +954,7 @@ PowerPCCPUAlias ppc_cpu_aliases[] = {
>>      { "power8", "power8_v2.0" },
>>      { "power8nvl", "power8nvl_v1.0" },
>>      { "power9", "power9_v2.0" },
>> -    { "power10", "power10_v1.0" },
>> +    { "power10", "power10_v2.0" },
>>  #endif
>>  
>>      /* Generic PowerPCs */
>> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
>> index 505a0ed6ac09..66deb18a6b65 100644
>> --- a/target/ppc/cpu_init.c
>> +++ b/target/ppc/cpu_init.c
>> @@ -8270,6 +8270,9 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
>>                               LPCR_DEE | LPCR_OEE))
>>          | LPCR_MER | LPCR_GTSE | LPCR_TC |
>>          LPCR_HEIC | LPCR_LPES0 | LPCR_HVICE | LPCR_HDICE;
>> +    /* DD2 adds an extra HAIL bit */
>> +    pcc->lpcr_mask |= LPCR_HAIL;
>> +
>>      pcc->lpcr_pm = LPCR_PDEE | LPCR_HDEE | LPCR_EEE | LPCR_DEE | LPCR_OEE;
>>      pcc->mmu_model = POWERPC_MMU_3_00;
>>  #if defined(CONFIG_SOFTMMU)
> 



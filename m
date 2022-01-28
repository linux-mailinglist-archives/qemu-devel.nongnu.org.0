Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3370D4A0294
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 22:16:38 +0100 (CET)
Received: from localhost ([::1]:41530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDYbk-0000Lp-Po
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 16:16:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nDYDL-0005ci-Uq
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 15:51:23 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:37939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nDYDJ-0004ck-AL
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 15:51:22 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.147])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 456D3DAC0FE7;
 Fri, 28 Jan 2022 21:51:18 +0100 (CET)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 28 Jan
 2022 21:51:17 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004c1408c6b-a9f1-4d65-9490-05c23fe38492,
 25116B600FA9B488C253496EC78095CF85B5B260) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.155.142
Message-ID: <3940fbe4-d268-6664-c031-193a56455460@kaod.org>
Date: Fri, 28 Jan 2022 21:51:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] target/ppc: Remove support for the PowerPC 602 CPU
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, <qemu-ppc@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20220128131227.199226-1-clg@kaod.org>
 <874k5odjby.fsf@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <874k5odjby.fsf@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 9fe05e8c-7190-43ce-9f43-3082eee25c74
X-Ovh-Tracer-Id: 6288713933353880358
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrfeehgddugedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: 10
X-Spam_score: 1.0
X-Spam_bar: +
X-Spam_report: (1.0 / 5.0 requ) NICE_REPLY_A=-0.001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, TVD_SUBJ_WIPE_DEBT=1.004,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
>> index 66e13075c3df..b9119479958c 100644
>> --- a/target/ppc/cpu.h
>> +++ b/target/ppc/cpu.h
> 
> In cpu.h you could probably remove the MSR_AP and MSR_SA bit definitions
> as well. And the code in ppc_cpu_reset that sets them.

done !

> 
>> @@ -2142,8 +2142,6 @@ enum {
>>       PPC_MFTB           = 0x0000000000000200ULL,
>>   
>>       /* Fixed-point unit extensions                                           */
>> -    /*   PowerPC 602 specific                                                */
>> -    PPC_602_SPEC       = 0x0000000000000400ULL,
>>       /*   isel instruction                                                    */
>>       PPC_ISEL           = 0x0000000000000800ULL,
>>       /*   popcntb instruction                                                 */
> 
> ...
> 
>> diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
>> index 9bc327bcba5a..d7765fd3e3d8 100644
>> --- a/target/ppc/int_helper.c
>> +++ b/target/ppc/int_helper.c
>> @@ -488,27 +488,6 @@ target_ulong helper_divso(CPUPPCState *env, target_ulong arg1,
>>       }
>>   }
>>   
>> -/*****************************************************************************/
>> -/* 602 specific instructions */
>> -/* mfrom is the most crazy instruction ever seen, imho ! */
> 
> How do you have the heart to remove the "most crazy instruction ever
> seen"?

It is indeed crazy and QEMU is the perfect playground to implement
instructions even more crazier but I am without heart for this one :)

Cheers,

C.

